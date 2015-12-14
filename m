Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 3AFAE6FEFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 10:25:10 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 14 Dec 2015 11:22:29 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Dec 2015 11:25:07 +0100
Message-ID: <1450088707-64294-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH][dizzy] openssl: CVE-2015-3194, CVE-2015-3195
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
X-List-Received-Date: Mon, 14 Dec 2015 10:25:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixes following vulnerabilities:
Certificate verify crash with missing PSS parameter (CVE-2015-3194)
X509_ATTRIBUTE memory leak (CVE-2015-3195)

References:
https://openssl.org/news/secadv/20151203.txt
http://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2015-3194
http://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2015-3195

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../CVE-2015-3194-Add-PSS-parameter-check.patch    | 35 +++++++++++++
 ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch | 59 ++++++++++++++++++=
++++
 .../recipes-connectivity/openssl/openssl_1.0.1p.bb |  2 +
 3 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3194=
-Add-PSS-parameter-check.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3195=
-Fix-leak-with-ASN.1-combine.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PS=
S-parameter-check.patch b/meta/recipes-connectivity/openssl/openssl/CVE-201=
5-3194-Add-PSS-parameter-check.patch
new file mode 100644
index 0000000..3c00bc1
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PSS-param=
eter-check.patch
@@ -0,0 +1,35 @@
+Date: Fri, 2 Oct 2015 13:10:29 +0100
+Subject: [PATCH] Add PSS parameter check.
+
+Avoid seg fault by checking mgf1 parameter is not NULL. This can be
+triggered during certificate verification so could be a DoS attack
+against a client or a server enabling client authentication.
+
+Thanks to Lo=C3=AFc Jonas Etienne (Qnective AG) for discovering this bug.
+
+CVE-2015-3194
+
+Upstream-Status: Backport
+
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ crypto/rsa/rsa_ameth.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/crypto/rsa/rsa_ameth.c b/crypto/rsa/rsa_ameth.c
+index 93e071d..c7f1148 100644
+--- a/crypto/rsa/rsa_ameth.c
++++ b/crypto/rsa/rsa_ameth.c
+@@ -279,7 +279,7 @@ static RSA_PSS_PARAMS *rsa_pss_decode(const X509_ALGOR=
 *alg,
+     if (pss->maskGenAlgorithm) {
+         ASN1_TYPE *param =3D pss->maskGenAlgorithm->parameter;
+         if (OBJ_obj2nid(pss->maskGenAlgorithm->algorithm) =3D=3D NID_mgf1
+-            && param->type =3D=3D V_ASN1_SEQUENCE) {
++            && param && param->type =3D=3D V_ASN1_SEQUENCE) {
+             p =3D param->value.sequence->data;
+             plen =3D param->value.sequence->length;
+             *pmaskHash =3D d2i_X509_ALGOR(NULL, &p, plen);
+--=20
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-le=
ak-with-ASN.1-combine.patch b/meta/recipes-connectivity/openssl/openssl/CVE=
-2015-3195-Fix-leak-with-ASN.1-combine.patch
new file mode 100644
index 0000000..87c4c6c
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with=
-ASN.1-combine.patch
@@ -0,0 +1,59 @@
+Date: Tue, 10 Nov 2015 19:03:07 +0000
+Subject: [PATCH] Fix leak with ASN.1 combine.
+
+When parsing a combined structure pass a flag to the decode routine
+so on error a pointer to the parent structure is not zeroed as
+this will leak any additional components in the parent.
+
+This can leak memory in any application parsing PKCS#7 or CMS structures.
+
+CVE-2015-3195.
+
+Upstream-Status: Backport
+
+Thanks to Adam Langley (Google/BoringSSL) for discovering this bug using
+libFuzzer.
+
+PR#4131
+
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ crypto/asn1/tasn_dec.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/crypto/asn1/tasn_dec.c b/crypto/asn1/tasn_dec.c
+index febf605..9256049 100644
+--- a/crypto/asn1/tasn_dec.c
++++ b/crypto/asn1/tasn_dec.c
+@@ -180,6 +180,8 @@ int ASN1_item_ex_d2i(ASN1_VALUE **pval, const unsigned=
 char **in, long len,
+     int otag;
+     int ret =3D 0;
+     ASN1_VALUE **pchptr, *ptmpval;
++    int combine =3D aclass & ASN1_TFLG_COMBINE;
++    aclass &=3D ~ASN1_TFLG_COMBINE;
+     if (!pval)
+         return 0;
+     if (aux && aux->asn1_cb)
+@@ -500,7 +502,8 @@ int ASN1_item_ex_d2i(ASN1_VALUE **pval, const unsigned=
 char **in, long len,
+  auxerr:
+     ASN1err(ASN1_F_ASN1_ITEM_EX_D2I, ASN1_R_AUX_ERROR);
+  err:
+-    ASN1_item_ex_free(pval, it);
++    if (combine =3D=3D 0)
++        ASN1_item_ex_free(pval, it);
+     if (errtt)
+         ERR_add_error_data(4, "Field=3D", errtt->field_name,
+                            ", Type=3D", it->sname);
+@@ -689,7 +692,7 @@ static int asn1_template_noexp_d2i(ASN1_VALUE **val,
+     } else {
+         /* Nothing special */
+         ret =3D ASN1_item_ex_d2i(val, &p, len, ASN1_ITEM_ptr(tt->item),
+-                               -1, 0, opt, ctx);
++                               -1, tt->flags & ASN1_TFLG_COMBINE, opt, ct=
x);
+         if (!ret) {
+             ASN1err(ASN1_F_ASN1_TEMPLATE_NOEXP_D2I, ERR_R_NESTED_ASN1_ERR=
OR);
+             goto err;
+--=20
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb b/meta/rec=
ipes-connectivity/openssl/openssl_1.0.1p.bb
index 3f61790..1d0242f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb
@@ -34,6 +34,8 @@ SRC_URI +=3D "file://configure-targets.patch \
             file://Makefiles-ptest.patch \
             file://ptest-deps.patch \
             file://run-ptest \
+            file://CVE-2015-3194-Add-PSS-parameter-check.patch \
+            file://CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch \
            "
=20
 SRC_URI[md5sum] =3D "7563e92327199e0067ccd0f79f436976"
--=20
1.9.1


