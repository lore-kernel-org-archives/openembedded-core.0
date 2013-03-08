Received: from mail-ve0-f173.google.com ([209.85.128.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UDtTP-00074w-NI
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 10:20:20 +0100
Received: by mail-ve0-f173.google.com with SMTP id oz10so1092798veb.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2013 01:03:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=QKC/eAS/rjeL8MpH2SHhXiFit4gjCpdJGiCTswFxbac=;
	b=FDEKg8vflaWDvCOT4i3fztMl/4uVTqX96mFKDMpRGgO+ctnBw/xvoPsDYEjtz6xEYP
	3SxQeclFKBc9NMXAMa2dcekHuFFS7Dii/71a1zm9Zum0EzOjwRWTNjTb1Emk6AZKV4WM
	dKcPmRa4DwoH26mZITaz32g5klFjET+Fm130Tk5I+IMwrZS5hvIP/hDkcmkCclZ3JEND
	W8KJSQaDF30sxEf9w0ehBrJM56mB1hfMNc/S9Kv5/5wpDPzv1ubrY4ZvKMRFNc3gcU3q
	xPmpGl0bUsGkMvtZRVeM+VBMaOUcBfrK4W8wr9Fza0Ms6bi+9OTuHmhhhD7FsnuJFbNw
	c8zA==
X-Received: by 10.52.69.74 with SMTP id c10mr569956vdu.3.1362733426082; Fri,
	08 Mar 2013 01:03:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Fri, 8 Mar 2013 01:03:26 -0800 (PST)
In-Reply-To: <CALbNGRSbYeb1J=9_w9Y2vFfj6S8D457VOiGrYUNjdTAyFEHpwg@mail.gmail.com>
References: <CALbNGRSbYeb1J=9_w9Y2vFfj6S8D457VOiGrYUNjdTAyFEHpwg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Mar 2013 09:03:26 +0000
Message-ID: <CAJTo0LY3iKCEZeM_n7qhpFFkCjMdsoNqKyBkpSPzqxb1JYBmyA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQlnzWYamTI4GYzXVsW5Dwq7KjdNWiLvrRnFb9nLFKzWl3nzJ/As1j/WstUkNsleeB1x8lCE
Cc: openembedded-core@lists.openembedded.org
Subject: Re: multiple providers for gtk-icon-cache
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
X-List-Received-Date: Fri, 08 Mar 2013 09:20:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7 March 2013 23:10, Andreas M=C3=BCller <schnitzeltony@googlemail.com> w=
rote:
> ERROR: Multiple .bb files are due to be built which each provide
> virtual/gtk-update-icon-cache-native
> (/home/Superandy/data/oe-core/sources/openembedded-core/meta/recipes-gnom=
e/gtk+/gtk-update-icon-cache-native_3.4.4.bb
> virtual:native:/home/Superandy/data/oe-core/sources/openembedded-core/met=
a/recipes-gnome/gtk+/gtk+_2.24.15.bb).
>  This usually means one provides something the other doesn't and should.
>
> Do both versions create same output?
>
> If yes: why not remove from gtk+?
> If no: ??

I wasn't expecting this to happen so quickly.

As can be seen from the recipes, gtk+-native is the full GTK+
platform, and gtk-update-icon-cache is just that single binary.  For
the purposes of generating a rootfs with a pre-populated icon cache,
gtk-update-icon-cache is all that is required.

So, why are you building gtk+-native?  It's probably one of:

1) you're building native applications that use GTK+.  In this case,
use PREFERRED_PROVIDER_virtual/gtk-update-icon-cache-native ?=3D
"gtk+-native".

2) you've recipes that use gtk-update-icon-cache on the host and so
depend on gtk+-native.  Change these to use the gtk-icon-cache class
instead.

Ross


