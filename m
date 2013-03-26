Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKRSG-0002AK-AV
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 11:50:28 +0100
Received: by mail-vb0-f47.google.com with SMTP id e21so4343943vbm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 03:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=XYSTvbfYLYnbf/0s8Y7ZBkZflS5kAe0nyVcOI4LET3c=;
	b=Ut0Qu2jwismnRJHZiNb6IGhnagu7v52TCLmwxLCLcQLFZSSC1QCNwBlOLal729GDj7
	VN4DLQq8CLV65cLZPoShc3+Ls6/YOMW4z9GEzDtjTOmCxChh19vUtXktU9crHLIznO2G
	3TmyZaI6WmhPLxZaMtanuDnBwQIChrmq12IleGLnMm2rUMpoyUdVCjb/2FzDtvypsSJl
	fVgthNnBFvB07x1dknQm5DyM05NR2LA4I3vVWS4o96wHuy4qBHFSTMQ8fm9s6ForXINl
	rezIxJM7tDzl1/+5nBMQTJPVmeZGUd3zFPicTSSEY7njw3oIooGFv3kGXDym0pFXqnVZ
	5Xxw==
X-Received: by 10.52.230.197 with SMTP id ta5mr16149258vdc.103.1364293992471; 
	Tue, 26 Mar 2013 03:33:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Tue, 26 Mar 2013 03:32:52 -0700 (PDT)
In-Reply-To: <1364255259-2920-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364255259-2920-1-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Mar 2013 10:32:52 +0000
Message-ID: <CAJTo0Lb8-CbnMtcxgximM7W_2YxbexGB49VLM+HbEqQrWHGpYg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQl6PWfVxz2/6TPSaAXR13phwFJ+1Zo599qxRrOYARu7VaChp1UC6nYvzDJxBJxXV0Yx7/Qn
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gtk+: don't provide gtk-update-icon-cache-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 10:50:43 -0000
X-List-Received-Date: Tue, 26 Mar 2013 10:50:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 25 March 2013 23:47, Andreas M=C3=BCller <schnitzeltony@googlemail.com> =
wrote:
> fixes:
> | ERROR: Multiple .bb files are due to be built which each provide virtua=
l/gtk-update-icon-cache-native
> | (/home/Superandy/data/oe-core/sources/openembedded-core/meta/recipes-gn=
ome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
> | virtual:native:/home/Superandy/data/oe-core/sources/openembedded-core/m=
eta/recipes-gnome/gtk+/gtk+_2.24.15.bb).
> | This usually means one provides something the other doesn't and should.

NACK.

The only way this can happen is if something is depending on
gtk+-native, as everything in oe-core (should) depends on
virtual/gtk-update-icon-cache:

commit f07515096ea39e267cd3ebeea08cffbba1af07e0
Author: Ross Burton <ross.burton@intel.com>
Date:   Mon Mar 4 12:52:45 2013 +0000

    default-providers: add default virtual provider for gtk-update-icon-cac=
he

    Use a virtual provider instead of a hard dependency so that if
gtk+-native is
    required in some configuration, this provider can be changed and then
    gtk+-native and gtk-update-icon-cache-native won't be both built
and conflict in
    the sysroot.

Presumably some application you've got is explicitly depending on
gtk+-native, probably for the icon cache handling.  It should drop
that build dependency and use the class instead.

Your fix "works" but will cause file overwrite warnings in sysroot
when you actually do want a gtk+-native, for example if you do want to
build a native gtk+ application or some reason.

Ross


