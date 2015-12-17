Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 21F74731A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 16:34:33 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id 68so33307054pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 08:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=ZYZ61UB012kL9KVgqiA4VxrGVl4iqt6m6nIHUAVZIHo=;
	b=eqiQj36Tm3sDFLGiuH0Vk8pcQIOhppKxJJZVeqzDMzEvRBfev3cIY6hh3I/FPFQTPf
	/7/JGlH38cxXsQqihlzDVUK0efeuTFFRCdnhHECSiTnOMfSKFCZ7uqdEhecZ/wPakx3M
	zsI/0fQzHDJ+vi06YFsXaWHcoGwU2GO+NgDBYh5pD34n2v12HRNQRpnqLLtIaJ9w6Gtm
	VWC4GzMRwTBAGmAS7Pwj6UcVX4yUqqrEoi/dCYmrqwW0eExrzLei0jVBkXLdGW6u19Ru
	Ar3syMJjNYgvMTTYJAA/eEwpYoYioX+U0dNtPJHK3AhL9GxPcPhpUQkHIyDCE1AceJnJ
	Xa6g==
X-Received: by 10.98.32.129 with SMTP id m1mr15709157pfj.59.1450370073667;
	Thu, 17 Dec 2015 08:34:33 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:8467:8a02:be30:5a28?
	([2601:202:4000:1239:8467:8a02:be30:5a28])
	by smtp.googlemail.com with ESMTPSA id
	hw7sm16928377pac.12.2015.12.17.08.34.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Dec 2015 08:34:32 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1450088707-64294-1-git-send-email-sona.sarmadi@enea.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5672E416.3030907@gmail.com>
Date: Thu, 17 Dec 2015 08:34:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1450088707-64294-1-git-send-email-sona.sarmadi@enea.com>
Subject: Re: [PATCH][dizzy] openssl: CVE-2015-3194, CVE-2015-3195
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
X-List-Received-Date: Thu, 17 Dec 2015 16:34:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

merged to staging.
git@git.yoctoproject.org/poky-contrib.git akuster/dizzy-next

thanks,
Armin


On 12/14/2015 02:25 AM, Sona Sarmadi wrote:
> Fixes following vulnerabilities:
> Certificate verify crash with missing PSS parameter (CVE-2015-3194)
> X509_ATTRIBUTE memory leak (CVE-2015-3195)
> 
> References:
> https://openssl.org/news/secadv/20151203.txt
> http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-3194
> http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-3195
> 
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> ---
>  .../CVE-2015-3194-Add-PSS-parameter-check.patch    | 35 +++++++++++++
>  ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch | 59 ++++++++++++++++++++++
>  .../recipes-connectivity/openssl/openssl_1.0.1p.bb |  2 +
>  3 files changed, 96 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PSS-parameter-check.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PSS-parameter-check.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PSS-parameter-check.patch
> new file mode 100644
> index 0000000..3c00bc1
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PSS-parameter-check.patch
> @@ -0,0 +1,35 @@
> +Date: Fri, 2 Oct 2015 13:10:29 +0100
> +Subject: [PATCH] Add PSS parameter check.
> +
> +Avoid seg fault by checking mgf1 parameter is not NULL. This can be
> +triggered during certificate verification so could be a DoS attack
> +against a client or a server enabling client authentication.
> +
> +Thanks to Loïc Jonas Etienne (Qnective AG) for discovering this bug.
> +
> +CVE-2015-3194
> +
> +Upstream-Status: Backport
> +
> +Reviewed-by: Matt Caswell <matt@openssl.org>
> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> +---
> + crypto/rsa/rsa_ameth.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/crypto/rsa/rsa_ameth.c b/crypto/rsa/rsa_ameth.c
> +index 93e071d..c7f1148 100644
> +--- a/crypto/rsa/rsa_ameth.c
> ++++ b/crypto/rsa/rsa_ameth.c
> +@@ -279,7 +279,7 @@ static RSA_PSS_PARAMS *rsa_pss_decode(const X509_ALGOR *alg,
> +     if (pss->maskGenAlgorithm) {
> +         ASN1_TYPE *param = pss->maskGenAlgorithm->parameter;
> +         if (OBJ_obj2nid(pss->maskGenAlgorithm->algorithm) == NID_mgf1
> +-            && param->type == V_ASN1_SEQUENCE) {
> ++            && param && param->type == V_ASN1_SEQUENCE) {
> +             p = param->value.sequence->data;
> +             plen = param->value.sequence->length;
> +             *pmaskHash = d2i_X509_ALGOR(NULL, &p, plen);
> +-- 
> +1.9.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
> new file mode 100644
> index 0000000..87c4c6c
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
> @@ -0,0 +1,59 @@
> +Date: Tue, 10 Nov 2015 19:03:07 +0000
> +Subject: [PATCH] Fix leak with ASN.1 combine.
> +
> +When parsing a combined structure pass a flag to the decode routine
> +so on error a pointer to the parent structure is not zeroed as
> +this will leak any additional components in the parent.
> +
> +This can leak memory in any application parsing PKCS#7 or CMS structures.
> +
> +CVE-2015-3195.
> +
> +Upstream-Status: Backport
> +
> +Thanks to Adam Langley (Google/BoringSSL) for discovering this bug using
> +libFuzzer.
> +
> +PR#4131
> +
> +Reviewed-by: Richard Levitte <levitte@openssl.org>
> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> +---
> + crypto/asn1/tasn_dec.c | 7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/crypto/asn1/tasn_dec.c b/crypto/asn1/tasn_dec.c
> +index febf605..9256049 100644
> +--- a/crypto/asn1/tasn_dec.c
> ++++ b/crypto/asn1/tasn_dec.c
> +@@ -180,6 +180,8 @@ int ASN1_item_ex_d2i(ASN1_VALUE **pval, const unsigned char **in, long len,
> +     int otag;
> +     int ret = 0;
> +     ASN1_VALUE **pchptr, *ptmpval;
> ++    int combine = aclass & ASN1_TFLG_COMBINE;
> ++    aclass &= ~ASN1_TFLG_COMBINE;
> +     if (!pval)
> +         return 0;
> +     if (aux && aux->asn1_cb)
> +@@ -500,7 +502,8 @@ int ASN1_item_ex_d2i(ASN1_VALUE **pval, const unsigned char **in, long len,
> +  auxerr:
> +     ASN1err(ASN1_F_ASN1_ITEM_EX_D2I, ASN1_R_AUX_ERROR);
> +  err:
> +-    ASN1_item_ex_free(pval, it);
> ++    if (combine == 0)
> ++        ASN1_item_ex_free(pval, it);
> +     if (errtt)
> +         ERR_add_error_data(4, "Field=", errtt->field_name,
> +                            ", Type=", it->sname);
> +@@ -689,7 +692,7 @@ static int asn1_template_noexp_d2i(ASN1_VALUE **val,
> +     } else {
> +         /* Nothing special */
> +         ret = ASN1_item_ex_d2i(val, &p, len, ASN1_ITEM_ptr(tt->item),
> +-                               -1, 0, opt, ctx);
> ++                               -1, tt->flags & ASN1_TFLG_COMBINE, opt, ctx);
> +         if (!ret) {
> +             ASN1err(ASN1_F_ASN1_TEMPLATE_NOEXP_D2I, ERR_R_NESTED_ASN1_ERROR);
> +             goto err;
> +-- 
> +1.9.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb
> index 3f61790..1d0242f 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb
> @@ -34,6 +34,8 @@ SRC_URI += "file://configure-targets.patch \
>              file://Makefiles-ptest.patch \
>              file://ptest-deps.patch \
>              file://run-ptest \
> +            file://CVE-2015-3194-Add-PSS-parameter-check.patch \
> +            file://CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch \
>             "
>  
>  SRC_URI[md5sum] = "7563e92327199e0067ccd0f79f436976"
> 

