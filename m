Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1546D7404E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:06:53 +0000 (UTC)
Received: by padhk3 with SMTP id hk3so147688733pad.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Q1QqF/yMKo95vj6/2MRcOBKgzuAdTLkczxjtsHvqs/E=;
	b=BPAkCNubpbsMEeX6fr7qJgAzKZCHCZsto43YhLPpbxJos/LdOq7iSdyMPBz6PH+VnF
	9uRtTcwoK7x2WGGywg16YLIwnlmGpc/Izsbrxfp8Cwy00CPGGSRNcN2bvx3Pq3QjYLrJ
	cVbZu5I563739QcmO5SvqPfKxRk6GLAQKe4RxTg7M+T+BlRHvwRgTh/ChtKfk59pLY79
	eO8r/EGrgZR9uCStqA7caTQiUt+yuQ+6VHg8WuuYb6YLyeufQYmKXLrrLOMo84qta7ZA
	6lhQzlklYxwXk3cPzrVtLfOCk3lb0FAWGDNgE/H3+47WTuiEX1r9UuvvvwD614b24KgU
	Gszw==
X-Received: by 10.68.65.3 with SMTP id t3mr36239914pbs.127.1442246813698;
	Mon, 14 Sep 2015 09:06:53 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:8d6e:46a6:5187:f53c?
	([2601:646:8601:4580:8d6e:46a6:5187:f53c])
	by smtp.gmail.com with ESMTPSA id
	im2sm17027453pbc.34.2015.09.14.09.06.52
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Sep 2015 09:06:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1442246267-35258-1-git-send-email-ross.burton@intel.com>
Date: Mon, 14 Sep 2015 09:06:52 -0700
Message-Id: <FE596366-AE31-43F6-9EF4-B25CFB1B6162@gmail.com>
References: <1442246267-35258-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3094)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glibc: don't require bash for nscd init script
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
X-List-Received-Date: Mon, 14 Sep 2015 16:06:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Sep 14, 2015, at 8:57 AM, Ross Burton <ross.burton@intel.com> =
wrote:
>=20
> The nscd init script uses #! /bin/bash but only really uses one =
bashism
> (translated strings), so remove them and switch the shell to #! =
/bin/sh.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-core/glibc/glibc/nscd-no-bash.patch | 61 =
++++++++++++++++++++++++
> meta/recipes-core/glibc/glibc_2.22.bb            |  1 +
> 2 files changed, 62 insertions(+)
> create mode 100644 meta/recipes-core/glibc/glibc/nscd-no-bash.patch
>=20
> diff --git a/meta/recipes-core/glibc/glibc/nscd-no-bash.patch =
b/meta/recipes-core/glibc/glibc/nscd-no-bash.patch
> new file mode 100644
> index 0000000..c306ce6
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/nscd-no-bash.patch
> @@ -0,0 +1,61 @@
> +Don't use bashisms (except for echo -n, which busybox supports) to =
avoid needing bash to start nscd.
> +

it used to be like that and then changed to use translated strings. Do =
you see any downsides of removing it ?
locales related or otherwise ? if not then it looks ok to me.

> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +diff --git a/nscd/nscd.init b/nscd/nscd.init
> +index a882da7..b02986e 100644
> +--- a/nscd/nscd.init
> ++++ b/nscd/nscd.init
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> + #
> + # nscd:		Starts the Name Switch Cache Daemon
> + #
> +@@ -49,7 +49,7 @@ prog=3Dnscd
> + start () {
> +     [ -d /var/run/nscd ] || mkdir /var/run/nscd
> +     [ -d /var/db/nscd ] || mkdir /var/db/nscd
> +-    echo -n $"Starting $prog: "
> ++    echo -n "Starting $prog: "
> +     daemon /usr/sbin/nscd
> +     RETVAL=3D$?
> +     echo
> +@@ -58,7 +58,7 @@ start () {
> + }
> +=20
> + stop () {
> +-    echo -n $"Stopping $prog: "
> ++    echo -n "Stopping $prog: "
> +     /usr/sbin/nscd -K
> +     RETVAL=3D$?
> +     if [ $RETVAL -eq 0 ]; then
> +@@ -67,9 +67,9 @@ stop () {
> + 	# a non-privileged user
> + 	rm -f /var/run/nscd/nscd.pid
> + 	rm -f /var/run/nscd/socket
> +-       	success $"$prog shutdown"
> ++	success "$prog shutdown"
> +     else
> +-       	failure $"$prog shutdown"
> ++	failure "$prog shutdown"
> +     fi
> +     echo
> +     return $RETVAL
> +@@ -103,13 +103,13 @@ case "$1" in
> + 	RETVAL=3D$?
> + 	;;
> +     force-reload | reload)
> +-    	echo -n $"Reloading $prog: "
> ++	echo -n "Reloading $prog: "
> + 	killproc /usr/sbin/nscd -HUP
> + 	RETVAL=3D$?
> + 	echo
> + 	;;
> +     *)
> +-	echo $"Usage: $0 {start|stop|status|restart|reload|condrestart}"
> ++	echo "Usage: $0 {start|stop|status|restart|reload|condrestart}"
> + 	RETVAL=3D1
> + 	;;
> + esac
> diff --git a/meta/recipes-core/glibc/glibc_2.22.bb =
b/meta/recipes-core/glibc/glibc_2.22.bb
> index f0e1fad..09f0428 100644
> --- a/meta/recipes-core/glibc/glibc_2.22.bb
> +++ b/meta/recipes-core/glibc/glibc_2.22.bb
> @@ -38,6 +38,7 @@ SRC_URI =3D =
"${GLIBC_GIT_URI};branch=3D${BRANCH};name=3Dglibc \
>            file://0025-eglibc-Install-PIC-archives.patch \
>            =
file://0026-eglibc-dl_debug_mask-is-controlled-by-__OPTION_EGLIB.patch \
>            =
file://0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch \
> +           file://nscd-no-bash.patch \
> "
>=20
> SRC_URI +=3D "\
> --=20
> 2.3.2 (Apple Git-55)
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


