Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C79C4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 10:29:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.71916.1669976982485732711
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 02:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fLHrbwOq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93355dc333=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B2ATfwY026862;
	Fri, 2 Dec 2022 10:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=aOEKhKC6uHzWEAcdxCO64IPSrMqn91h6O0MGrsJf6UE=;
 b=fLHrbwOqq46KVpY9SUKo2erj0v364GkfWlADX8sHYoltwUh3xJO9BU8PG7Kky6A3Lq+2
 uBnUyBKrFozEXtE6Vek1PO7aGXLYmxWnQQXipk95dbCsBz4vVhMXZh2HrYQsKkl891S5
 NOZrvtaYAR+FY+mGHW0bepgQQXItmZfVqmNRKfGcMUlJBbbLtVKKtkzPEwL5V18qI4WC
 eUkKezZ6RjRujNw8geu7FWVhXrSqhNfViGtEZIN+07JuTddRhwc0Tc99VlnwBLJyKUR+
 KMh0WSwNIXfm21TRnwT824RJJWD1jYkRZt92QHqYYs2scNbzmocpQ30yZlbyVyJicjip YA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m381357mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 02 Dec 2022 10:29:41 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 2 Dec 2022 02:29:40 -0800
Received: from pek-hostel-deb01.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 2 Dec 2022 02:29:38 -0800
From: Soumya <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>, <Hari.GPillai@windriver.com>,
        Soumya
	<soumya.sambu@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] xserver-xorg: fix CVE-2022-3550, CVE-2022-3551
Date: Fri, 2 Dec 2022 18:29:28 +0800
Message-ID: <20221202102928.2288362-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kp6oO-DKdeJJ2f_BDn3b8mmxb4B3rAta
X-Proofpoint-ORIG-GUID: kp6oO-DKdeJJ2f_BDn3b8mmxb4B3rAta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-02_04,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=855 impostorscore=0 adultscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212020081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 10:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174235

A vulnerability classified as critical was found in X.org Server. Affected
by this vulnerability is the function _GetCountedString of the file
xkb/xkb.c. The manipulation leads to buffer overflow. It is recommended to
apply a patch to fix this issue. The associated identifier of this
vulnerability is VDB-211051.

A vulnerability, which was classified as problematic, has been found in
X.org Server. Affected by this issue is the function ProcXkbGetKbdByName
of the file xkb/xkb.c. The manipulation leads to memory leak. It is
recommended to apply a patch to fix this issue. The identifier of this
vulnerability is VDB-211052.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-3550
https://nvd.nist.gov/vuln/detail/CVE-2022-3551

Upstream patches:
https://gitlab.freedesktop.org/xorg/xserver/commit/11beef0b7f1ed290348e45618e5fa0d2bffcb72e
https://gitlab.freedesktop.org/xorg/xserver/commit/18f91b950e22c2a342a4fbc55e9ddf7534a707d2

Signed-off-by: Soumya <soumya.sambu@windriver.com>
---
 ...possible-memleaks-in-XkbGetKbdByName.patch | 63 +++++++++++++++++++
 ...ntedString-against-request-length-at.patch | 38 +++++++++++
 .../xorg-xserver/xserver-xorg_21.1.4.bb       |  2 +
 3 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
new file mode 100644
index 0000000000..0e61ec5953
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
@@ -0,0 +1,63 @@
+CVE: CVE-2022-3551
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 18f91b950e22c2a342a4fbc55e9ddf7534a707d2 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Wed, 13 Jul 2022 11:23:09 +1000
+Subject: [PATCH] xkb: fix some possible memleaks in XkbGetKbdByName
+
+GetComponentByName returns an allocated string, so let's free that if we
+fail somewhere.
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+---
+ xkb/xkb.c | 26 ++++++++++++++++++++------
+ 1 file changed, 20 insertions(+), 6 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 4692895db..b79a269e3 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -5935,18 +5935,32 @@ ProcXkbGetKbdByName(ClientPtr client)
+     xkb = dev->key->xkbInfo->desc;
+     status = Success;
+     str = (unsigned char *) &stuff[1];
+-    if (GetComponentSpec(&str, TRUE, &status))  /* keymap, unsupported */
+-        return BadMatch;
++    {
++        char *keymap = GetComponentSpec(&str, TRUE, &status);  /* keymap, unsupported */
++        if (keymap) {
++            free(keymap);
++            return BadMatch;
++        }
++    }
+     names.keycodes = GetComponentSpec(&str, TRUE, &status);
+     names.types = GetComponentSpec(&str, TRUE, &status);
+     names.compat = GetComponentSpec(&str, TRUE, &status);
+     names.symbols = GetComponentSpec(&str, TRUE, &status);
+     names.geometry = GetComponentSpec(&str, TRUE, &status);
+-    if (status != Success)
++    if (status == Success) {
++        len = str - ((unsigned char *) stuff);
++        if ((XkbPaddedSize(len) / 4) != stuff->length)
++            status = BadLength;
++    }
++
++    if (status != Success) {
++        free(names.keycodes);
++        free(names.types);
++        free(names.compat);
++        free(names.symbols);
++        free(names.geometry);
+         return status;
+-    len = str - ((unsigned char *) stuff);
+-    if ((XkbPaddedSize(len) / 4) != stuff->length)
+-        return BadLength;
++    }
+ 
+     CHK_MASK_LEGAL(0x01, stuff->want, XkbGBN_AllComponentsMask);
+     CHK_MASK_LEGAL(0x02, stuff->need, XkbGBN_AllComponentsMask);
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch
new file mode 100644
index 0000000000..6f862e82f9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch
@@ -0,0 +1,38 @@
+CVE: CVE-2022-3550
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 11beef0b7f1ed290348e45618e5fa0d2bffcb72e Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 5 Jul 2022 12:06:20 +1000
+Subject: [PATCH] xkb: proof GetCountedString against request length attacks
+
+GetCountedString did a check for the whole string to be within the
+request buffer but not for the initial 2 bytes that contain the length
+field. A swapped client could send a malformed request to trigger a
+swaps() on those bytes, writing into random memory.
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+---
+ xkb/xkb.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index f42f59ef3..1841cff26 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -5137,6 +5137,11 @@ _GetCountedString(char **wire_inout, ClientPtr client, char **str)
+     CARD16 len;
+ 
+     wire = *wire_inout;
++
++    if (client->req_len <
++        bytes_to_int32(wire + 2 - (char *) client->requestBuffer))
++        return BadValue;
++
+     len = *(CARD16 *) wire;
+     if (client->swapped) {
+         swaps(&len);
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
index b9cbc9989e..7ed2096560 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
@@ -2,6 +2,8 @@ require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
+           file://0001-xkb-proof-GetCountedString-against-request-length-at.patch \
+           file://0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch \
            "
 SRC_URI[sha256sum] = "5cc4be8ee47edb58d4a90e603a59d56b40291ad38371b0bd2471fc3cbee1c587"
 
-- 
2.25.1


