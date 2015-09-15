Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id C0FD375773
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 16:03:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id D2E863C88761
Message-ID: <1442332981.3357.39.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 17:03:01 +0100
In-Reply-To: <1442225072-37487-1-git-send-email-sona.sarmadi@enea.com>
References: <1442225072-37487-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Mime-Version: 1.0
Subject: Re: [PATCH][fido][dizzy] libtasn1: CVE-2015-3622
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
X-List-Received-Date: Tue, 15 Sep 2015 16:03:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2015-09-14 at 12:04 +0200, Sona Sarmadi wrote:
> _asn1_extract_der_octet: prevent past of boundary access
> 
> References:
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-3622
> http://git.savannah.gnu.org/gitweb/?p=libtasn1.git;a=patch;
> h=f979435823a02f842c41d49cd41cc81f25b5d677
> 
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>

Patch queued in my joshuagl/fido-next tree - thanks!

Joshua

http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/
fido-next

> ---
>  .../gnutls/libtasn1/libtasn1-CVE-2015-3622.patch   | 44
> ++++++++++++++++++++++
>  meta/recipes-support/gnutls/libtasn1_4.0.bb        |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1-CVE
> -2015-3622.patch
> 
> diff --git a/meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2015
> -3622.patch b/meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2015
> -3622.patch
> new file mode 100644
> index 0000000..0989ef6
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2015
> -3622.patch
> @@ -0,0 +1,44 @@
> +From f979435823a02f842c41d49cd41cc81f25b5d677 Mon Sep 17 00:00:00
> 2001
> +From: Nikos Mavrogiannopoulos <nmav@redhat.com>
> +Date: Mon, 20 Apr 2015 14:56:27 +0200
> +Subject: [PATCH] _asn1_extract_der_octet: prevent past of boundary
> access
> +
> +Fixes CVE-2015-3622.
> +Upstream-Status: Backport
> +
> +Reported by Hanno Böck.
> +---
> + lib/decoding.c |    3 ++-
> + 1 files changed, 2 insertions(+), 1 deletions(-)
> +
> +diff --git a/lib/decoding.c b/lib/decoding.c
> +index 7fbd931..42ddc6b 100644
> +--- a/lib/decoding.c
> ++++ b/lib/decoding.c
> +@@ -732,6 +732,7 @@ _asn1_extract_der_octet (asn1_node node, const
> unsigned char *der,
> +     return ASN1_DER_ERROR;
> + 
> +   counter = len3 + 1;
> ++  DECR_LEN(der_len, len3);
> + 
> +   if (len2 == -1)
> +     counter_end = der_len - 2;
> +@@ -740,6 +741,7 @@ _asn1_extract_der_octet (asn1_node node, const
> unsigned char *der,
> + 
> +   while (counter < counter_end)
> +     {
> ++      DECR_LEN(der_len, 1);
> +       len2 = asn1_get_length_der (der + counter, der_len, &len3);
> + 
> +       if (IS_ERR(len2, flags))
> +@@ -764,7 +766,6 @@ _asn1_extract_der_octet (asn1_node node, const
> unsigned char *der,
> + 	  len2 = 0;
> + 	}
> + 
> +-      DECR_LEN(der_len, 1);
> +       counter += len2 + len3 + 1;
> +     }
> + 
> +-- 
> +1.7.2.5
> +
> diff --git a/meta/recipes-support/gnutls/libtasn1_4.0.bb
> b/meta/recipes-support/gnutls/libtasn1_4.0.bb
> index 289833ec..16cf4d6 100644
> --- a/meta/recipes-support/gnutls/libtasn1_4.0.bb
> +++ b/meta/recipes-support/gnutls/libtasn1_4.0.bb
> @@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "
> file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>  SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
>             file://libtasn1_fix_for_automake_1.12.patch \
>             file://dont-depend-on-help2man.patch \
> +           file://libtasn1-CVE-2015-3622.patch \
>             "
>  
>  SRC_URI[md5sum] = "d3d2d9bce3b6668b9827a9df52635be1"
> -- 
> 1.9.1
> 

