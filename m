Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id A06606FF72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 08:00:20 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0224.002; Mon, 14 Dec 2015 09:00:17 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH][dizzy][daisy][dylan] openssl: fix for
	CVE-2015-3195
Thread-Index: AQHRM+vMuljxNO2WVkKzh12Q357n157KHRvA
Date: Mon, 14 Dec 2015 08:00:18 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48ABABB49B@SESTOEX04.enea.se>
References: <1449821610-29533-1-git-send-email-fan.xin@jp.fujitsu.com>
In-Reply-To: <1449821610-29533-1-git-send-email-fan.xin@jp.fujitsu.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
Subject: Re: [PATCH][dizzy][daisy][dylan] openssl: fix for	CVE-2015-3195
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
X-List-Received-Date: Mon, 14 Dec 2015 08:00:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Fan,

dizzy branch has Openssl version 1.0.1p now:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-connectivi=
ty/openssl/openssl_1.0.1p.bb?h=3Ddizzy

How can this patch be applied to dizzy branch?

You have only sent patch for CVE-2015-3195, how about CVE-2015-3194?
CVE-2015-3193 does not seem to affect OpenSSL version 1.0.1 according to Mi=
tre:

http://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2015-3193
CVE-2015-3193 (OpenSSL 1.0.2)
CVE-2015-3194 (OpenSSL 1.0.1 before 1.0.1q and 1.0.2 before 1.0.2e)
CVE-2015-3195 (OpenSSL before before 1.0.0t, 1.0.1 before 1.0.1q, and 1.0.2=
 before 1.0.2e)

Regards
//Sona


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Fan Xin
> Sent: den 11 december 2015 09:14
> To: openembedded-core@lists.openembedded.org
> Cc: Fan Xin <fan.xin@jp.fujitsu.com>
> Subject: [OE-core] [PATCH][dizzy][daisy][dylan] openssl: fix for CVE-2015=
-
> 3195
>=20
> This vulnerability  affects OpenSSL versions 1.0.2 and 1.0.1, 1.0.0 and 0=
.9.8.
> So the patch also should be merged into dizzy, daisy and dylan.
>=20
> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> ---
>  .../0001-Fix-leak-with-ASN.1-combine.patch         | 65
> ++++++++++++++++++++++
>  .../recipes-connectivity/openssl/openssl_1.0.1e.bb |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl-
> 1.0.1e/0001-Fix-leak-with-ASN.1-combine.patch
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-le=
ak-
> with-ASN.1-combine.patch b/meta/recipes-connectivity/openssl/openssl-
> 1.0.1e/0001-Fix-leak-with-ASN.1-combine.patch
> new file mode 100644
> index 0000000..5bda457
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-leak-wit
> +++ h-ASN.1-combine.patch
> @@ -0,0 +1,65 @@
> +Upstream-Status: Backport
> +
> +This patch was imprted from
> +https://git.openssl.org/?p=3Dopenssl.git;a=3Dcommit;h=3Dcc598f321fbac9c0=
4da57
> +66243ed55d55948637d
> +
> +Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> +
> +From cc598f321fbac9c04da5766243ed55d55948637d Mon Sep 17
> 00:00:00 2001
> +From: Dr. Stephen Henson <steve@openssl.org>
> +Date: Tue, 10 Nov 2015 19:03:07 +0000
> +Subject: [PATCH] Fix leak with ASN.1 combine.
> +
> +When parsing a combined structure pass a flag to the decode routine so
> +on error a pointer to the parent structure is not zeroed as this will
> +leak any additional components in the parent.
> +
> +This can leak memory in any application parsing PKCS#7 or CMS structures=
.
> +
> +CVE-2015-3195.
> +
> +Thanks to Adam Langley (Google/BoringSSL) for discovering this bug
> +using libFuzzer.
> +
> +PR#4131
> +
> +Reviewed-by: Richard Levitte <levitte@openssl.org>
> +---
> + crypto/asn1/tasn_dec.c |    7 +++++--
> + 1 files changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/crypto/asn1/tasn_dec.c b/crypto/asn1/tasn_dec.c index
> +febf605..9256049 100644
> +--- a/crypto/asn1/tasn_dec.c
> ++++ b/crypto/asn1/tasn_dec.c
> +@@ -180,6 +180,8 @@ int ASN1_item_ex_d2i(ASN1_VALUE **pval, const
> unsigned char **in, long len,
> +     int otag;
> +     int ret =3D 0;
> +     ASN1_VALUE **pchptr, *ptmpval;
> ++    int combine =3D aclass & ASN1_TFLG_COMBINE;
> ++    aclass &=3D ~ASN1_TFLG_COMBINE;
> +     if (!pval)
> +         return 0;
> +     if (aux && aux->asn1_cb)
> +@@ -500,7 +502,8 @@ int ASN1_item_ex_d2i(ASN1_VALUE **pval, const
> +unsigned char **in, long len,
> +  auxerr:
> +     ASN1err(ASN1_F_ASN1_ITEM_EX_D2I, ASN1_R_AUX_ERROR);
> +  err:
> +-    ASN1_item_ex_free(pval, it);
> ++    if (combine =3D=3D 0)
> ++        ASN1_item_ex_free(pval, it);
> +     if (errtt)
> +         ERR_add_error_data(4, "Field=3D", errtt->field_name,
> +                            ", Type=3D", it->sname); @@ -689,7 +692,7 @@
> +static int asn1_template_noexp_d2i(ASN1_VALUE **val,
> +     } else {
> +         /* Nothing special */
> +         ret =3D ASN1_item_ex_d2i(val, &p, len, ASN1_ITEM_ptr(tt->item),
> +-                               -1, 0, opt, ctx);
> ++                               -1, tt->flags & ASN1_TFLG_COMBINE, opt,
> ++ ctx);
> +         if (!ret) {
> +             ASN1err(ASN1_F_ASN1_TEMPLATE_NOEXP_D2I,
> ERR_R_NESTED_ASN1_ERROR);
> +             goto err;
> +--
> +1.7.0.4
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> index bc1b944..dbc2da2 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> @@ -37,6 +37,7 @@ SRC_URI +=3D "file://configure-targets.patch \
>              file://0001-Use-version-in-SSL_METHOD-not-SSL-structure.patc=
h \
>              file://CVE-2014-0160.patch \
>              file://openssl-CVE-2014-0198-fix.patch \
> +            file://0001-Fix-leak-with-ASN.1-combine.patch \
>             "
>=20
>  SRC_URI[md5sum] =3D "66bf6f10f060d561929de96f9dfe5b8c"
> --
> 1.8.4.2
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

