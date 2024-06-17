Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C08C2BA1A
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 06:34:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.50586.1718606075382814294
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jun 2024 23:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6898887b7c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H4jKkc029543
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 23:34:35 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys682ha6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 23:34:35 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 16 Jun 2024 23:34:34 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 16 Jun 2024 23:34:33 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 2/8] cracklib: Modify patch to compile with GCC 14
Date: Mon, 17 Jun 2024 14:34:25 +0800
Message-ID: <20240617063431.2221035-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240617063431.2221035-1-changqing.li@windriver.com>
References: <20240617063431.2221035-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: Umd4Jiv1s5lpk5jTTyKmDNQ9CDwT0OnE
X-Proofpoint-GUID: Umd4Jiv1s5lpk5jTTyKmDNQ9CDwT0OnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_05,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=653
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406170049
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45H4jKkc029543
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 06:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200788

From: Zoltan Boszormenyi <zboszor@gmail.com>

GCC 14 implicitly turns a warning into a compiler error:

| ../../git/src/lib/packlib.c: In function =E2=80=98PWClose=E2=80=99:
| ../../git/src/lib/packlib.c:554:40: error: passing argument 1 of =E2=80=
=98HwmsHostToBigEndian=E2=80=99 from incompatible pointer type [-Wincompa=
tible-pointer-types]
|   554 |             HwmsHostToBigEndian(tmp_pwp.hwms, sizeof(tmp_pwp.hw=
ms), en_is32);
|       |                                 ~~~~~~~^~~~~
|       |                                        |
|       |                                        uint32_t * {aka unsigned=
 int *}
| ../../git/src/lib/packlib.c:142:27: note: expected =E2=80=98char *=E2=80=
=99 but argument is of type =E2=80=98uint32_t *=E2=80=99 {aka =E2=80=98un=
signed int *=E2=80=99}
|   142 | HwmsHostToBigEndian(char *pHwms, int nLen,int nBitType)
|       |                     ~~~~~~^~~~~

Add the cast to (char *) to silence it.

(From OE-Core rev: 914128f6bd988cde278e087fb9457a0c70c7e5ec)

Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...0001-packlib.c-support-dictionary-byte-order-dependent.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-suppo=
rt-dictionary-byte-order-dependent.patch b/meta/recipes-extended/cracklib=
/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
index 20572b55c4..35229ae890 100644
--- a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dict=
ionary-byte-order-dependent.patch
+++ b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dict=
ionary-byte-order-dependent.patch
@@ -303,7 +303,7 @@ index 9396e1d..d0bb181 100644
 +	    PWDICT tmp_pwp;
 +
 +	    memcpy(&tmp_pwp, pwp, sizeof(PWDICT));
-+	    HwmsHostToBigEndian(tmp_pwp.hwms, sizeof(tmp_pwp.hwms), en_is32);
++	    HwmsHostToBigEndian((char *)tmp_pwp.hwms, sizeof(tmp_pwp.hwms), en=
_is32);
 +	    fwrite(tmp_pwp.hwms, 1, sizeof(tmp_pwp.hwms), pwp->wfp);
  	}
      }
--=20
2.25.1


