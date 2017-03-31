Return-Path: <matt@madison.systems>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4E1D777E2E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 19:42:22 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id j90so49092732lfk.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 12:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=26ejxFy/k2JC2g23+w1Jsxotn0miYoh4LMATRqjDOtQ=;
	b=gMl1nNXsG53JzrAkjHKKVZJ/k6DrZqvzojk6lMiBFSyYQBj0MXkxKl5LaUPOzh5zpG
	vMxSkqWBoHtm2w2kR6ra0YC/Ceb5FXUEbIuP4HTaoGkWwAGwSK4eDd+06r7eDaWSVwlI
	dZmfmq6NHSLCUbsFSR0p3ffk6gWwOnb5EmzwspQW1kNxYVWIM5nMG5sFaE4uREEHYZSV
	5QIXMwwcGRyMqYacXhum4gRpzOKpxpGzmivLmzsACaUHf67uzb8elE5/wawfCPAkumPt
	jqx4gLgYYFhxuVQnN1tkchxBeLr2BrbfDRWdELMctI+sSlZlRFt78Y7Yn0KZWJmgMXw3
	zF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=26ejxFy/k2JC2g23+w1Jsxotn0miYoh4LMATRqjDOtQ=;
	b=T6gfp9f4g9iBg+LOY5Prlj+CEAY0iHPQE6McLAKeNY+WW1csNkV43Ak+hhN4za1A/A
	aopZ5Ca+bqA7pkpGO6EKE38k/XYQwYlNzH7npuo3pAH8zp25Xo+bgZs3dpMbmalyI/GU
	ODoNfGxUrQ1SCv4Q8mRc5OvlPAy+hwPmilk4WfU6iiPbto4rxaFaLyRG+v9pq5CWD4DV
	KXvfZPO3alDGxm5FLCgcNAUJCB2spka9evIoVlVw6FVIYEOjRJHe4/gfs+bSJ+JgCttA
	F008FkbGgbyQHkbhzUg8HIQyVIp4dfFvLlbswCVMd43lLIEE1r8KvhAF0/nG+Nq0i09D
	X1Aw==
X-Gm-Message-State: AFeK/H0a/3osvc8dooxZ2Iv9uRkVmRnZiugaE2UWjQPg0uAoEuNWNHbTGpQh2PV3Dp8s42DkmsBj8e0tB/biJg==
X-Received: by 10.46.84.7 with SMTP id i7mr1671224ljb.74.1490989343711; Fri,
	31 Mar 2017 12:42:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.18.36 with HTTP; Fri, 31 Mar 2017 12:42:23 -0700 (PDT)
In-Reply-To: <1490969358-21290-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1490969358-21290-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Matt Madison <matt@madison.systems>
Date: Fri, 31 Mar 2017 12:42:23 -0700
Message-ID: <CAGgRHJo73NB3hXQMYJnuEGX9G9ptWF4APeqWPbNyjCBzFkF8ag@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dpkg: Add PACKAGECONFIG for liblzma and enable it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Mar 2017 19:42:24 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 31, 2017 at 7:09 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> liblzma is part of xz and we already build it but configure it out. This makes
> no sense. Enabling it means we gain multithreaded compression and it speeds
> dpkg-deb up massively. It also removes the fork overhead of separate xz processes.
>
> Turning the existing config into a PACKAGECONFIG and turning it on by default
> therefore makes best use of what we have available.
>
> The manual RDEPENDS are no longer needed since it uses liblzma which is picked
> up by the shlibs code magically.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Yes, please.  I've been using dpkg configured this way for a month or
so on my deb-based distro, and was going to submit a patch for this
myself.  The performance improvement during packaging is significant,
and I haven't seen any downsides.

Thanks,
-Matt

> ---
>  meta/recipes-devtools/dpkg/dpkg.inc | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
> index 6abe3ae..870117a 100644
> --- a/meta/recipes-devtools/dpkg/dpkg.inc
> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> @@ -4,8 +4,8 @@ SECTION = "base"
>
>  DEPENDS = "zlib bzip2 perl ncurses"
>  DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
> -RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz perl"
> -RDEPENDS_${PN}_class-native = "xz-native"
> +RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} perl"
> +RDEPENDS_${PN}_class-native = ""
>
>  UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/dpkg/"
>
> @@ -28,10 +28,12 @@ EXTRA_OECONF = "\
>                 --enable-start-stop-daemon \
>                 --with-libz \
>                 --with-libbz2 \
> -               --without-liblzma \
>                 --without-libselinux \
>                 "
>
> +PACKAGECONFIG = "liblzma"
> +PACKAGECONFIG[liblzma] = "--with-liblzma,--without-liblzma, xz"
> +
>  EXTRA_OECONF += "TAR=tar"
>  EXTRA_OECONF_append_class-target = " DEB_HOST_ARCH=${DPKG_ARCH}"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

