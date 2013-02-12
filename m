Received: from mail-vc0-f173.google.com ([209.85.220.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5NI7-000457-Qa
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 22:21:33 +0100
Received: by mail-vc0-f173.google.com with SMTP id fy7so338422vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 13:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=PW1IIxNwnB8da3YRMffP1ceI70yDtnufISizxFWu7MM=;
	b=EGTZH3yvX54p3U47B0fRrOXZnudKxGnQ3EzvOHG/6tCbKQoQkPqPWyiwKPmWI9ygk3
	XLUC+k+OM5p8duWhIDrG1Ozpebx2wU5PXZB+WdZyTU85Fhmea4HnVCblvX3Og3xP2tr7
	Yf0yRljPeAWDnbWzvCp0anW/95YYsn1iI08EgGyl0lOf60IDPKjFRTQgaGramNUrtixm
	u0of5Xl3wY0U1jTcf4N4qux3bCaD5nDXNNmmRO7wtz4IVSBZ4DgdFNcyF0pYdkjO92CB
	ei/vIY6VoCmb2ysw4PhbaITY+2Z0XggR9MOV3kvGNLVFR/wlBxfMHVKjJMJ6TRK/dBRR
	E0xg==
X-Received: by 10.52.24.98 with SMTP id t2mr22330648vdf.69.1360703127575; Tue,
	12 Feb 2013 13:05:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Tue, 12 Feb 2013 13:05:07 -0800 (PST)
In-Reply-To: <1360690970-9432-1-git-send-email-raj.khem@gmail.com>
References: <1360690970-9432-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Feb 2013 21:05:07 +0000
Message-ID: <CAJTo0LazzKagV0eg0WBDk8TG4mHudqNY1YJSjjXKuYxXyOFyAg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQnHsqAb1aA6IYJv+Yky/XfnTNqWLNujsIe/NEV8mdPjFk++lmOcGNAZbbJndwMQv25Crfm1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd.bbclass: Introduce do_install_append and use systemd unitdir
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
X-List-Received-Date: Tue, 12 Feb 2013 21:21:37 -0000
Content-Type: text/plain; charset=UTF-8

On 12 February 2013 17:42, Khem Raj <raj.khem@gmail.com> wrote:
> systemd always uses /lib and /usr/lib to store unit files
> so using libdir and base_libdir is incorrect. It will work
> where libdir is usr/lib and base_libdir is /lib but wont work
> when say its /lib64

That's interesting, wasn't aware of that.  Why doesn't systemd respect
the configure options?

> Additionally introduce the install append from meta-oe
> lot of recipe appends in meta-systemd depend on that

This was removed on purpose because it should never be used.  It was
used in meta-systemd because the service files in SRC_URI had
hard-coded /usr/bin, /usr/sbin, etc.  Hard-coding these paths is
wrong, you'll need e.g. run a service.in through a
s/@sbindir@/${sbindir} and if you're doing this you can just do that
in do_install_append() and drop it directly into ${D}.

Radu's work at merging the rest of the changes in meta-systemd to
oe-core does this, for example:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rmoisan/systemd-ross&id=08d9095b31955eca862d6702dddeaf155ac8c987

Ross


