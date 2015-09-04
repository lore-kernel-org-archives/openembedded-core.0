Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0C6AE77040
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 23:47:03 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so38249412pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 16:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=0YeSYhGxo1Ww9F2WSQF2QynjWO78v+1nXkuRY0yTB4U=;
	b=w/wM46TpM2Df5QrU81XIxNUDKa+3gRI567vc5auM5vBEK+fCCT5dW5PYq0vdZEJ40k
	meoQxu8wgh1Lco5G4WQesz8k0LiksHOjXMFSB2nuVgwoAJktl+Z1Rfm5ql3nxNDdtlKq
	AMtBpybfoVZtMyoq9Nw6Myjl5bH72VMGtlHbWFvc+Z7NMkKuWFS9aVUlL+ydxAx0SJyR
	c9RqAYLkAMo06r7si/aP6EVi/cpt+WXrxcx0QmugHb6Q1jf/QVm0t6vsK1CHxzixsNEo
	J2BXwjfcyZlAJOKEmR1ZPNt6EB4l8Pnd0zI1ejy6SZF59Q3fUyMYvCmaxoqruIb+GOC4
	+p6A==
X-Received: by 10.68.143.70 with SMTP id sc6mr13610958pbb.87.1441410423776;
	Fri, 04 Sep 2015 16:47:03 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:ccfc:abc4:daa5:b1aa?
	([2601:202:4000:1239:ccfc:abc4:daa5:b1aa])
	by smtp.googlemail.com with ESMTPSA id
	fu4sm3761668pbb.59.2015.09.04.16.47.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 16:47:02 -0700 (PDT)
Message-ID: <55EA2D75.90202@gmail.com>
Date: Fri, 04 Sep 2015 16:47:01 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1441281214-31918-1-git-send-email-sona.sarmadi@enea.com>
In-Reply-To: <1441281214-31918-1-git-send-email-sona.sarmadi@enea.com>
Subject: Re: [PATCH][dizzy] gnutls: CVE-2015-3308
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
X-List-Received-Date: Fri, 04 Sep 2015 23:47:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

in my queue.

Thanks,
Armin

On 09/03/2015 04:53 AM, Sona Sarmadi wrote:
> Fixes use-after-free flaw in CRL distribution points parsing
> 
> Reference:
> https://gitlab.com/gnutls/gnutls/commit/d6972be33264ecc49a86cd0958209cd7363af1e9
> https://gitlab.com/gnutls/gnutls/commit/053ae65403216acdb0a4e78b25ad66ee9f444f02
> 
> http://www.openwall.com/lists/oss-security/2015/04/15/6
> 
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> ---
>  .../better-fix-for-double-free-CVE-2015-3308.patch | 65 ++++++++++++++++++++++
>  .../eliminated-double-free-CVE-2015-3308.patch     | 33 +++++++++++
>  meta/recipes-support/gnutls/gnutls_3.3.5.bb        |  2 +
>  3 files changed, 100 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/better-fix-for-double-free-CVE-2015-3308.patch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/eliminated-double-free-CVE-2015-3308.patch
> 
> diff --git a/meta/recipes-support/gnutls/gnutls/better-fix-for-double-free-CVE-2015-3308.patch b/meta/recipes-support/gnutls/gnutls/better-fix-for-double-free-CVE-2015-3308.patch
> new file mode 100644
> index 0000000..8824729
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/better-fix-for-double-free-CVE-2015-3308.patch
> @@ -0,0 +1,65 @@
> +From 053ae65403216acdb0a4e78b25ad66ee9f444f02 Mon Sep 17 00:00:00 2001
> +From: Nikos Mavrogiannopoulos <nmav@gnutls.org>
> +Date: Sat, 28 Mar 2015 22:41:03 +0100
> +Subject: [PATCH] Better fix for the double free in dist point parsing
> +
> +Fixes CVE-2015-3308
> +Upstream-Status: Backport
> +
> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> +---
> + lib/x509/x509_ext.c | 10 ++++++----
> + 1 file changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/x509/x509_ext.c b/lib/x509/x509_ext.c
> +index 2e69ed0..f974b02 100644
> +--- a/lib/x509/x509_ext.c
> ++++ b/lib/x509/x509_ext.c
> +@@ -2287,7 +2287,7 @@ int gnutls_x509_ext_import_crl_dist_points(const gnutls_datum_t * ext,
> + 	int len, ret;
> + 	uint8_t reasons[2];
> + 	unsigned i, type, rflags, j;
> +-	gnutls_datum_t san;
> ++	gnutls_datum_t san = {NULL, 0};
> + 
> + 	result = asn1_create_element
> + 	    (_gnutls_get_pkix(), "PKIX1.CRLDistributionPoints", &c2);
> +@@ -2310,9 +2310,6 @@ int gnutls_x509_ext_import_crl_dist_points(const gnutls_datum_t * ext,
> + 
> + 	i = 0;
> + 	do {
> +-		san.data = NULL;
> +-		san.size = 0;
> +-
> + 		snprintf(name, sizeof(name), "?%u.reasons", (unsigned)i + 1);
> + 
> + 		len = sizeof(reasons);
> +@@ -2337,6 +2334,9 @@ int gnutls_x509_ext_import_crl_dist_points(const gnutls_datum_t * ext,
> + 
> + 		j = 0;
> + 		do {
> ++			san.data = NULL;
> ++			san.size = 0;
> ++
> + 			ret =
> + 			    _gnutls_parse_general_name2(c2, name, j, &san,
> + 							&type, 0);
> +@@ -2351,6 +2351,7 @@ int gnutls_x509_ext_import_crl_dist_points(const gnutls_datum_t * ext,
> + 			ret = crl_dist_points_set(cdp, type, &san, rflags);
> + 			if (ret < 0)
> + 				break;
> ++			san.data = NULL; /* it is now in cdp */
> + 
> + 			j++;
> + 		} while (ret >= 0);
> +@@ -2360,6 +2361,7 @@ int gnutls_x509_ext_import_crl_dist_points(const gnutls_datum_t * ext,
> + 
> + 	if (ret < 0 && ret != GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE) {
> + 		gnutls_assert();
> ++		gnutls_free(san.data);
> + 		goto cleanup;
> + 	}
> + 
> +-- 
> +1.9.1
> +
> diff --git a/meta/recipes-support/gnutls/gnutls/eliminated-double-free-CVE-2015-3308.patch b/meta/recipes-support/gnutls/gnutls/eliminated-double-free-CVE-2015-3308.patch
> new file mode 100644
> index 0000000..628103f
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/eliminated-double-free-CVE-2015-3308.patch
> @@ -0,0 +1,33 @@
> +From d6972be33264ecc49a86cd0958209cd7363af1e9 Mon Sep 17 00:00:00 2001
> +From: Nikos Mavrogiannopoulos <nmav@gnutls.org>
> +Date: Mon, 23 Mar 2015 22:55:29 +0100
> +Subject: [PATCH] eliminated double-free in the parsing of dist points
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Reported by Robert Święcki.
> +
> +Fixes CVE-2015-3308
> +Upstream-Status: Backport
> +
> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> +---
> + lib/x509/x509_ext.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/lib/x509/x509_ext.c b/lib/x509/x509_ext.c
> +index c8d5867..6f09438 100644
> +--- a/lib/x509/x509_ext.c
> ++++ b/lib/x509/x509_ext.c
> +@@ -2360,7 +2360,6 @@ int gnutls_x509_ext_import_crl_dist_points(const gnutls_datum_t * ext,
> + 
> + 	if (ret < 0 && ret != GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE) {
> + 		gnutls_assert();
> +-		gnutls_free(san.data);
> + 		goto cleanup;
> + 	}
> + 
> +-- 
> +1.9.1
> +
> diff --git a/meta/recipes-support/gnutls/gnutls_3.3.5.bb b/meta/recipes-support/gnutls/gnutls_3.3.5.bb
> index b3daa49..9f26470 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.3.5.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.3.5.bb
> @@ -1,6 +1,8 @@
>  require gnutls.inc
>  
>  SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
> +            file://eliminated-double-free-CVE-2015-3308.patch \
> +            file://better-fix-for-double-free-CVE-2015-3308.patch \
>             "
>  
>  SRC_URI[md5sum] = "1f396dcf3c14ea67de7243821006d1a2"
> 
> 
> 

