Return-Path: <spopovyc@cisco.com>
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
	by mail.openembedded.org (Postfix) with ESMTP id 39A8F77CCA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4197; q=dns/txt; s=iport;
	t=1491485661; x=1492695261;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=upMBGb49ZPMivZ6yVnot47vUDCudbfY6gOoX9YhEUd4=;
	b=k3RyStKAttyS5RsXdq+CAKvlhswbadfExumuOS71kt0axJ9PMiWmCBKG
	EPJV24EjPcAHovm3D900xBBddIHSakxWT5NH0pZLHbZQd5KistdRMMJ49
	Ml0K+bZoJYhwaeJp1iCgWZ9z4IT6nNjmrV4SHXZkFjADlijwvtpOT8hF0 Y=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BXAwDlQuZY/xbLJq1PDBkBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYQ1gQuIKoVLc5BKhicGjyiCDyaFfAKEBBgBAgEBAQEBAQFrKIU?=
	=?us-ascii?q?VAQEBAQIBBBkDBBECPQUFCwsRAwECBCgDKhMSCBMEAgIBAYl9BQgOqQgMgiWKa?=
	=?us-ascii?q?AEBAQEBAQEBAQEBAQEBASMTeYVCggWBQYEqhCMBAoM3gl4FkGWFOIZWhn6LVYF?=
	=?us-ascii?q?+VY5qiF6LGh84gQU7IBWFUoFNPQMyhyIoghUBAQE?=
X-IronPort-AV: E=Sophos;i="5.37,159,1488844800"; d="scan'208";a="653794466"
Received: from aer-iport-nat.cisco.com (HELO aer-core-3.cisco.com)
	([173.38.203.22])
	by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 13:34:19 +0000
Received: from tuxracer.local (dhcp-10-61-103-7.cisco.com [10.61.103.7])
	(authenticated bits=0)
	by aer-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id v36DYIq4014700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 6 Apr 2017 13:34:19 GMT
To: openembedded-core@lists.openembedded.org
References: <e1eee1aa56e1dc59a55a9cac25a00a1ea2f9375e.1490727568.git.spopovyc@cisco.com>
From: Serhii Popovych <spopovyc@cisco.com>
Message-ID: <a21a63b8-e901-c2ad-e866-ed6ab3c123c8@cisco.com>
Date: Thu, 6 Apr 2017 16:34:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <e1eee1aa56e1dc59a55a9cac25a00a1ea2f9375e.1490727568.git.spopovyc@cisco.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: spopovyc
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: Re: [PATCH] ca-certificates: Fix symlinks to the certificates in nativesdk
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
X-List-Received-Date: Thu, 06 Apr 2017 13:34:20 -0000
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit


Ping.

Any further comments on this change?

I covered at least one additional use case not covered by
generic symlink-relative.py call at post stage:

It is buildtools-tarball, where may add ca-certificates to use with
curl.

Change is simple: we create relative symlinks in update-ca-certificates
to ensure we always point to right data in SDK/buildtools-tarball.

Thanks,
Serhii

> Symlinks to certificates in buildtools-tarball at /etc/ssl/certs
> installed with absolute pathes making these sumlinks pointing
> outside of toolchain to the host system locations.
> 
> These locations may not contain some certificates (thus link to
> the certificate in toolchain is broken) or host system
> certificate may be revoked by CRL or outdated.
> 
> Since this change seems non intrusive for target package apply
> patch for all builds.
> 
> Cc: XE-Linux <xe-linux-external@cisco.com>
> Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
> ---
>  ...ertificates-Use-relative-paths-when-linki.patch | 38 ++++++++++++++++++++++
>  .../ca-certificates/ca-certificates_20161130.bb    |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-Use-relative-paths-when-linki.patch
> 
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-Use-relative-paths-when-linki.patch b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-Use-relative-paths-when-linki.patch
> new file mode 100644
> index 0000000..8666e30
> --- /dev/null
> +++ b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-Use-relative-paths-when-linki.patch
> @@ -0,0 +1,38 @@
> +From 912e7be8e7151bd4a2feed6d34f927d42b12bb7e Mon Sep 17 00:00:00 2001
> +From: Serhii Popovych <spopovyc@cisco.com>
> +Date: Wed, 16 Dec 2015 16:48:03 +0200
> +Subject: [PATCH] update-ca-certificates: Use relative paths when linking certs
> +
> +Creating links in $ETCCERTSDIR (/etc/ssl/certs) with absolute
> +path could broke paths to the certificates in toolchains by
> +pointing to the outside of toolchain root directory. These
> +absolute paths may not exist in the host system or contain
> +certificates older than provided within toolchain.
> +
> +Use absolute pathes when creating symbolic links to the
> +certificates to ensure we always pointing to the toolchain
> +provied certificates.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
> +---
> + sbin/update-ca-certificates | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
> +index 3a5ffd3..cb3c1f1 100755
> +--- a/sbin/update-ca-certificates
> ++++ b/sbin/update-ca-certificates
> +@@ -94,7 +94,7 @@ add() {
> +                                                   -e 's/,/_/g').pem"
> +   if ! test -e "$PEM" || [ "$(readlink "$PEM")" != "${CERT##$SYSROOT}" ]
> +   then
> +-    ln -sf "${CERT##$SYSROOT}" "$PEM"
> ++    ln -sf "$(echo "${ETCCERTSDIR##$SYSROOT}" | sed -e 's/\/[^/]\+/..\//g')${CERT##$SYSROOT/}" "$PEM"
> +     echo "+$PEM" >> "$ADDED"
> +   fi
> +   # Add trailing newline to certificate, if it is missing (#635570)
> +-- 
> +2.3.0
> +
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
> index 42088b9..e6e17de 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
> @@ -17,6 +17,7 @@ SRCREV = "61b70a1007dc269d56881a0d480fc841daacc77c"
>  
>  SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
>             file://0002-update-ca-certificates-use-SYSROOT.patch \
> +           file://0003-update-ca-certificates-Use-relative-paths-when-linki.patch \
>             file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
>             file://update-ca-certificates-support-Toybox.patch \
>             file://default-sysroot.patch \
> 

