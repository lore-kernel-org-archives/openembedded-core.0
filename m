Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA1EEB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 12:05:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6693.1686917109439377507
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 05:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CvRLZmlA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55315b4ca9=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GARwWC028540
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 05:05:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=t2uT0adypaKNfWQuABWSHU5bbTxoGoxlpEOKmUFy+yc=;
 b=CvRLZmlAtelzbp4Ux1No1vm7whwr3fv9PMlbizw6oSgf5Khblu9ZeNfjRJRvFIhtgXvE
 7dXWNUrbE/v2ZlL/YkoDaKnevjjlwKhBqSnpGKuIA0+/aaV18pttqgXiVjlGKUbx56Dr
 ICedlM3z87d1QRejp/kD7jxtZJsWSLFY3e/8aZ8UBqiqCA3A4P+v1jf9qWu5RhBTfdb5
 i/1YO9YIRhEN7FhZjmQqopo3NLmx5gIw+E/r1TstlPFBGBqdqEPE4ySmExUchCY0zTou
 3sHoXd62b0B+o/tptrHVR62kAxSVUuaKXJMU9zGgDKHBnBkvrr4Q5+FveRAXuDYpCi4E vg== 
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4mf35wvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 05:05:09 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 05:05:07 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [PATCH] samba: fix CVE-2022-45142
Date: Fri, 16 Jun 2023 12:04:54 +0000
Message-ID: <20230616120454.2641802-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: tiaKjo8y1hWFRJIgQvmte2PAi1Hj6STt
X-Proofpoint-GUID: tiaKjo8y1hWFRJIgQvmte2PAi1Hj6STt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 mlxlogscore=931
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 12:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183010

The fix for CVE-2022-3437 included changing memcmp to be constant
time and a workaround for a compiler bug by adding "!= 0"
comparisons to the result of memcmp. When these patches were
backported to the heimdal-7.7.1 and heimdal-7.8.0 branches (and
possibly other branches) a logic inversion sneaked in causing the
validation of message integrity codes in gssapi/arcfour to be inverted.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-45142

Upstream patches:
https://www.openwall.com/lists/oss-security/2023/02/08/1
https://github.com/heimdal/heimdal/commit/5f63215d0d82678233fdfb1c07f4b421f57c528b

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2022-45142.patch          | 51 +++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2022-45142.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-45142.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-45142.patch
new file mode 100644
index 000000000..d6b9826e4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-45142.patch
@@ -0,0 +1,51 @@
+From: Helmut Grohne <helmut@...divi.de>
+Subject: [PATCH v3] CVE-2022-45142: gsskrb5: fix accidental logic inversions
+
+The referenced commit attempted to fix miscompilations with gcc-9 and
+gcc-10 by changing `memcmp(...)` to `memcmp(...) != 0`. Unfortunately,
+it also inverted the result of the comparison in two occasions. This
+inversion happened during backporting the patch to 7.7.1 and 7.8.0.
+
+Fixes: f6edaafcfefd ("gsskrb5: CVE-2022-3437 Use constant-time memcmp()
+ for arcfour unwrap")
+Signed-off-by: Helmut Grohne <helmut@...divi.de>
+
+Upstream-Status: Backport [https://www.openwall.com/lists/oss-security/2023/02/08/1]
+CVE: CVE-2022-45142
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/arcfour.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Changes since v1:
+ * Fix typo in commit message.
+ * Mention 7.8.0 in commit message. Thanks to Jeffrey Altman.
+
+Changes since v2:
+ * Add CVE identifier.
+
+diff --git a/lib/gssapi/krb5/arcfour.c b/lib/gssapi/krb5/arcfour.c
+index e838d007a..eee6ad72f 100644
+--- a/lib/gssapi/krb5/arcfour.c
++++ b/lib/gssapi/krb5/arcfour.c
+@@ -365,7 +365,7 @@ _gssapi_verify_mic_arcfour(OM_uint32 * minor_status,
+	return GSS_S_FAILURE;
+     }
+
+-    cmp = (ct_memcmp(cksum_data, p + 8, 8) == 0);
++    cmp = (ct_memcmp(cksum_data, p + 8, 8) != 0);
+     if (cmp) {
+	*minor_status = 0;
+	return GSS_S_BAD_MIC;
+@@ -730,7 +730,7 @@ OM_uint32 _gssapi_unwrap_arcfour(OM_uint32 *minor_status,
+	return GSS_S_FAILURE;
+     }
+
+-    cmp = (ct_memcmp(cksum_data, p0 + 16, 8) == 0); /* SGN_CKSUM */
++    cmp = (ct_memcmp(cksum_data, p0 + 16, 8) != 0); /* SGN_CKSUM */
+     if (cmp) {
+	_gsskrb5_release_buffer(minor_status, output_message_buffer);
+	*minor_status = 0;
+--
+2.38.1
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index 39ba85194..cc07d51dc 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -30,6 +30,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2022-3437-0006.patch;patchdir=source4/heimdal \
            file://CVE-2022-3437-0007.patch;patchdir=source4/heimdal \
            file://CVE-2022-3437-0008.patch;patchdir=source4/heimdal \
+           file://CVE-2022-45142.patch;patchdir=source4/heimdal \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.40.0


