Return-Path: <mengshi.wu@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6FDCD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 05:56:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47560.1780898175186863733
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jun 2026 22:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=L66XKO7B;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: mengshiw@qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580F1091470709
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Jun 2026 05:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hq4rs8Z7PQV2TySRs2J1Yn
	TTLFYRWaZpDGaKMukkRyM=; b=L66XKO7B48paiKatYMuldU/ImAcaxXqWK38/9y
	LzSwyyXF59/7ytSUV30e4y1j12aouplfl2LilsxYKFluCQGdR9Tj6Vzv1HnY02hu
	Yx+0Ff0ZozUle/4kDyxpJtyJuFYAIlnORodd4Kl3YEEez06Pdw9tBdoubbUUNgX5
	r+xxGOBiAVPWBD+1S2RnaCihx4kFXA+Dwa4BRlo3RgTfpZM22fUu4PI81pQGF1aq
	T3VscMjX0qCnU+KZLocAsNEM/XSoWZ6U12yl1QHPhfWiYooFj6m57mykEdmrjHNb
	whF8q44NAcdEIrsv8Ghy/Cr62Vu5WA/zCaiGQR1eyYIIIMWQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgwv5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 05:56:14 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6585uBD3000398;
	Mon, 8 Jun 2026 05:56:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4emcmj30hv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 05:56:11 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6585uBWv000389
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Jun 2026 05:56:11 GMT
Received: from bt-iot-sh03-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 6585uBau032725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 05:56:11 +0000 (GMT)
Received: by bt-iot-sh03-lnx.qualcomm.com (Postfix, from userid 4766378)
	id 62C9A434D2; Mon,  8 Jun 2026 13:56:10 +0800 (CST)
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: shuai.zhang@oss.qualcomm.com, cheng.jiang@oss.qualcomm.com,
        chezhou@qti.qualcomm.com, wei.deng@oss.qualcomm.com,
        yiboz@qti.qualcomm.com, jinwang.li@oss.qualcomm.com,
        Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Subject: [PATCH] bluez5: fix gatt cache sync issue
Date: Mon,  8 Jun 2026 13:56:06 +0800
Message-ID: <20260608055607.1069933-1-mengshi.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a26597e cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=k5HSx0GOXTMWBjfvI6MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dvcVgnBL9gh37TjKgW40CdQxvSrrOCng
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1MSBTYWx0ZWRfX4A/nEzCvI1CN
 PMZvWc1DnPJ1/zSCh61TlwYv7E+oYjv8UnmGOu6pb8j83p5f1vDX6fV1+xPZuMPbrhEeJI1WE8B
 5/nl4Ij6ERhIGivmlYtK0ibm9NZSYTymLvX0ytDfJQ532bsA/5lllpTa+VtF/mrfbvB6shKFYH7
 b5+EG3mcZh5CFN3iw1R8LDDLGPRAP+p3LndlY9W73AuEEsiBSlqMbCqwWqHd/Sub1zJil0uBzp0
 V9H1iYF6QEgtcvtU3aj3Axeu68fzqkQ2N55y5ldoobmVSfa++dd45njqATEsW3usNRw5GSOVssl
 oBNaBWTNqIcquBP+KlBkm6/1pTiRCjd2E2tyTqFF7WANApvLSyy6Vd0gaA4OzNrhCRSJaBnxz3X
 D0AanV3RHoKLABKH1fC10ZtPd35dBies/QARlyi+BP3MluqvnXFiZvf1fGuiZKRwySWxEM4HTB/
 bmJQ32mtMwGrHPzMMXw==
X-Proofpoint-ORIG-GUID: dvcVgnBL9gh37TjKgW40CdQxvSrrOCng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080051
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 6580F1091470709
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 05:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238225

There is a timing issue to update DB Hash value.

The gatt_client_service_changed() callback in src/device.c
is called from service_changed_complete() in gatt-client.c,
which is invoked after db_hash_read_cb() has already updated
the hash. Adding store_gatt_db(device) here guarantees the
db is persisted with the correct, up-to-date hash for both
the addition and removal cases.

Upstream-Status: Backport [bluez/bluez@0fd01e9]
Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...x-stored-gatt-cache-DB-Hash-value-no.patch | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-src-devi=
ce-Fix-stored-gatt-cache-DB-Hash-value-no.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
index e827d0a..5c55afc 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -72,6 +72,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
            file://0001-tools-Work-around-broken-stdin-handling-in-home-m=
ade.patch \
            file://0001-gatt-client-Fix-use-after-free-caused-by-reentran=
t-c.patch \
            file://0001-transport-Fix-set-volume-failure-with-invalid-dev=
ice.patch \
+           file://0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no=
.patch    \
            "
 S =3D "${UNPACKDIR}/bluez-${PV}"
=20
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-src-device-Fix-=
stored-gatt-cache-DB-Hash-value-no.patch b/meta/recipes-connectivity/blue=
z5/bluez5/0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch
new file mode 100644
index 0000000..69323bd
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-src-device-Fix-stored-=
gatt-cache-DB-Hash-value-no.patch
@@ -0,0 +1,84 @@
+From 9ec8cad56e47c0555a056e928e6568d543b3ae0c Mon Sep 17 00:00:00 2001
+From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
+Date: Wed, 1 Apr 2026 19:30:04 +0800
+Subject: [PATCH v1] src/device: Fix stored gatt cache DB Hash value not =
update
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+There is an asymmetry in behavior: when services are added during
+the same connection (via Service Changed indication), the persistent
+storage (disk) is not updated with the new DB hash, but when services
+are removed, it is updated.
+
+During the same connection, We check DB hash value stored at
+/var/lib/bluetooth/<adaptor addr>/cache/<remote addr>.
+When established connection, the stored DB Hash value is A.Then we
+add new services, the stored DB Hash value is still A which should
+change to B. However, if we remove the existing services, the stored
+DB Hash value changed to C.
+
+When performing addition, it goes like this:
+
+discover_primary_cb()
+  =E2=94=94=E2=94=80> gatt_db_insert_service()      =E2=86=90 NEW servic=
e inserted into db
+        =E2=94=94=E2=94=80> gatt_service_added()    =E2=86=90 callback f=
ires immediately
+              =E2=94=94=E2=94=80> store_gatt_db()   =E2=86=90 SAVED TO D=
ISK (hash still OLD)
+  ...
+  =E2=94=94=E2=94=80> discovery_op_complete(success=3Dtrue)
+        =E2=94=94=E2=94=80> read_db_hash(op)             =E2=86=90 sends=
 ATT Read By Type
+              =E2=94=94=E2=94=80> [ATT response arrives]
+                    =E2=94=94=E2=94=80> db_hash_read_cb()
+                          =E2=94=9C=E2=94=80> gatt_db_attribute_write(op=
->hash, ...)
+                          =E2=94=82     =E2=94=94=E2=94=80> hash UPDATED=
 IN MEMORY
+                          =E2=94=94=E2=94=80> discovery_op_complete(true=
, 0)
+                                =E2=94=9C=E2=94=80> [no services to remo=
ve, no
+                                =E2=94=82    store_gatt_db called]
+                                =E2=94=94=E2=94=80> service_changed_comp=
lete()
+
+Whereas removal perform like this:
+discovery_op_complete(success=3Dtrue)  [1st call]
+  =E2=94=94=E2=94=80> read_db_hash(op)
+      =E2=94=94=E2=94=80> op->hash is NULL =E2=86=92 sends ATT request =E2=
=86=92 early return
+...
+[ATT response arrives]
+db_hash_read_cb()
+  =E2=94=94=E2=94=80> gatt_db_attribute_write(op->hash, ) =E2=86=90 hash=
 UPDATED IN MEMORY
+  =E2=94=94=E2=94=80> discovery_op_complete(true, 0)          [2nd call]
+      =E2=94=94=E2=94=80> read_db_hash(op)  =E2=86=92 op->hash already s=
et =E2=86=92 returns false
+      =E2=94=94=E2=94=80> gatt_db_remove_service()
+          =E2=94=94=E2=94=80> gatt_service_removed()
+              =E2=94=94=E2=94=80> store_gatt_db() =E2=86=90 SAVED TO DIS=
K (hash is NEW)
+
+There is a timing issue to update DB Hash value.
+
+The gatt_client_service_changed() callback in src/device.c is called
+from service_changed_complete() in gatt-client.c, which is invoked
+after db_hash_read_cb() has already updated the hash. Adding
+store_gatt_db(device) here guarantees the db is persisted with the
+correct, up-to-date hash for both the addition and removal cases.
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/0fd01e9=
8cf94616a5c1c39749314cdd4a1654687]
+Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
+---
+ src/device.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/device.c b/src/device.c
+index 3ea683667..cfbde307b 100644
+--- a/src/device.c
++++ b/src/device.c
+@@ -6267,7 +6267,11 @@ static void gatt_client_service_changed(uint16_t =
start_handle,
+ 							uint16_t end_handle,
+ 							void *user_data)
+ {
++	struct btd_device *device =3D user_data;
++
+ 	DBG("start 0x%04x, end: 0x%04x", start_handle, end_handle);
++
++	store_gatt_db(device);
+ }
+
+ static void gatt_debug(const char *str, void *user_data)
+--
+2.34.1
--=20
2.43.0


