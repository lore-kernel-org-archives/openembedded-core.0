Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id A41DC6C638
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 11:20:43 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id s22so19646842ioc.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 03:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0zN/zdYiJ202LUHk683wKcaUPcz19isbJqEwRbCA7Ek=;
	b=coc4pZwsS8E5UjOQhnUKXY7CV25KWrgcqFUomt6MC45lWd+SXWPpJqMJj3AhDJ1Rn7
	BejMQLBSSQIAui1KBio1qN9O3ubTaYi7w2Gx+/KiFNdNr7u/DERDC5BnTvF2ukiRIC3U
	85dlr1NCzuRLx4H6mXFZBkp9Qk/DGhQ+ln7t+rqQqWqj+2QpyBXYK5m/XlnZAZG6n63/
	eE4SCxk2J8oHu4TO6T1/cc0tH7p2HGsBkhn8PzieyQlnwCWofkQPNyBF1ZDiMNYMTglD
	EDt8Egq9UV4USQ6v60a5iPCJb9Dsy+5JIWEBQ8JuGCao/qsWeOGC59Ox6l29Th+49fUY
	AP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0zN/zdYiJ202LUHk683wKcaUPcz19isbJqEwRbCA7Ek=;
	b=GFl5ZVrOhA+BqWmfWOSdV/onVRUqamjPhgXW2nvz4ZhSmAty0hRA65Np1IBqYVaxCE
	3ZTuo8y+UCo9CL+Afi+4BPHbDA7F8AIpX1xpQBs6n71u0YANOqKAO8M5y3vn8ihSdLEg
	mBC+QhzcG+oJ7l+Huo4FvfhYDdWsjMyJsZagFWeJqSUcEGfXtqqzs/Kya7Nn0Ju0CtMz
	I4hXrL4HJ8G35A+PBTFMrQqD8rcE+WRdG3wetSRgjOZ6UvfFFsc4CQ48LAHzSEFa+Q+L
	10/u5BRZUVPiGrNsMxEsoVIFqGe/MuUaQxiprDEAKtYVC9JprrvJndnnwiukH3Kqge5T
	StKA==
X-Gm-Message-State: AA+aEWZzXIVz9cicDv0NEAHbGiQn5BYhLJG3fPXKwSEnvNzqrufpMOFo
	FPvJAra3YlKuvS60itQDK3AUn+aQqxtmxxaTy5YyiA==
X-Google-Smtp-Source: AFSGD/XnzVTghru1wtTa1mJxkTee5AL2jGkq+td7Avz6TwI1pzP25lJLdQBKbiV56nsTUlZT77+vUBKKa5iKe12GrRw=
X-Received: by 2002:a5d:948e:: with SMTP id v14mr19162631ioj.201.1543404044566;
	Wed, 28 Nov 2018 03:20:44 -0800 (PST)
MIME-Version: 1.0
References: <20181128081530.31125-1-sno@netbsd.org>
In-Reply-To: <20181128081530.31125-1-sno@netbsd.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Nov 2018 11:20:33 +0000
Message-ID: <CAJTo0LZD=NP_yqmJN0XLy9PikqnxdS2FdpWwpGk46aAcKVUucg@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi: avoid depending on skipped package
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
X-List-Received-Date: Wed, 28 Nov 2018 11:20:43 -0000
Content-Type: text/plain; charset="UTF-8"

Is Avahi actually useful without DBus?

This reminds me that I've been wanting to gut that recipe for a long time now...

Ross
On Wed, 28 Nov 2018 at 08:16, Jens Rehsack <sno@netbsd.org> wrote:
>
> When built without D-Bus, libavahi-client is not build:
>   Building libavahi-client:           no   (You need avahi-daemon and D-Bus!)
> which causes avahi-dev RDEPENDS failing when creating an image
> containing development-tools:
>  *   - nothing provides libavahi-client = 0.7-r0 needed by avahi-dev-0.7-r0.cortexa8hf-neon
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/recipes-connectivity/avahi/avahi_0.7.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.7.bb b/meta/recipes-connectivity/avahi/avahi_0.7.bb
> index 3d5f334a88..2e04d304c7 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.7.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.7.bb
> @@ -38,7 +38,8 @@ FILES_libavahi-glib = "${libdir}/libavahi-glib.so.*"
>  FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*  ${libdir}/girepository-1.0/Avahi*.typelib"
>  FILES_avahi-utils = "${bindir}/avahi-*"
>
> -RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (= ${EXTENDPKGV}) libavahi-client (= ${EXTENDPKGV})"
> +RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (= ${EXTENDPKGV})"
> +RDEPENDS_${PN}-dev += "${@["", " libavahi-client (= ${EXTENDPKGV})"][bb.utils.contains('PACKAGECONFIG', 'dbus', 1, 0, d)]}"
>
>  RRECOMMENDS_avahi-daemon_append_libc-glibc = " libnss-mdns"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

