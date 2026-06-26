Return-Path: <wei.deng@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E57CDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 06:42:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30045.1782456167441930026
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 23:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=J724Xu1+;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=DnKFoDAD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: wei.deng@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VM0S1680034
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xo8b0tHGtR7s5bu8EuZlOyqo2wL71YT82d6KLcXWS8g=; b=J724Xu1+KE0ED4nn
	aw8FHQn61nqhtUy7HCI6G1mlzSZgDLcc0o8tpPnzXAgBM9tHSI1KN7fJoegz/2wA
	CX/Mn4SivsqMvuEnlhaoJbS116YKwaaf0ybZY5K5dwZlZfNrFaYwarQ3wVGsGM8C
	pcqPCOql5bID24X2uLZo9jiTu1JtAisuKrqUDLf7QkoCFK183GV66U9/V7ETvfOX
	vjr/Ns7j8eH2r+VrUoaF884ApeZpyqRcuPKaiU3YCOnV+1tjOBPTSmJZnQnU2NCL
	fVkPVHfWAccf9fzxCefsmZCUZ77KlWgMLILC4Ig5r8a3ZGgZr5+yVX/AvIu6qzHU
	xwFu/g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgc15ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c58d35c0aso166566eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 23:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782456166; x=1783060966; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xo8b0tHGtR7s5bu8EuZlOyqo2wL71YT82d6KLcXWS8g=;
        b=DnKFoDAD2qXp82FgZPxoPBJoswtEOafADqbHNhA77H7OYACE30f9cTjNIWwJb/5tLb
         UpfOaMgAgIcTVLATc7p4bxzOgTf+kQI1QG8g0FEfdGU6tL74/whniukbIy3muJdkdlWm
         vClJpxA/W7VR95vOh4FLUp4bZrtxpuMTMXIprXyN0B4ImLYOhD4kfj0X/rQzz1FSZvHX
         sPhIgKYvp+f+FttwITG1b/tOG+8kFcAWxOtH4YdGEcT+A/rDZUUFtmXD8JeQbM2r8Zia
         NW/gP5O3L9Ee/nar0E+UncUl6xhUqEzz3nBWEEjzZbuz84ClQnUSkJ+OQSxpySLG7DuJ
         qtkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782456166; x=1783060966;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xo8b0tHGtR7s5bu8EuZlOyqo2wL71YT82d6KLcXWS8g=;
        b=NcKXnHI/yM1BUgwug9lkgEpgwTtJ5upI2DGXiyQ/cQYPkkgHYE1yn20xNyXmEzdf/z
         eUCtXR2gTIuqF/O/vFvm+4op8xwncGzik428y3l6TE4KuZ6x3W05Yu/Kkk74xzSuvH5b
         QlnUYUKeYvhLj3t3KSZy3h2DJJ7rJ7msuQL2nb61U3oaadpyzMXUs0LqPRxpRMB/ASb5
         o90txCMyVr6dC9ZjzL9rnJ+ePITpaRiPzWjqKx1MiEouw16+d4qxowzkve0hxM74XHwT
         oTMgvMIAmYQuj+oktExJgm4X3hvjYNCjM3C0Lrrv3M558B4KAhCgX1Kg7aFH6I3ajX6H
         drrw==
X-Gm-Message-State: AOJu0YzxeHQ9aVoxEMyMYjiggxzp6kCY54YZB9DPZ1SrqC28dgHTB7V2
	ojDJ/vYt6vVhChJSDsea7rmNmXz8O3Q8dxh/WE3BH4nfJ98HXi4VZ+9OHr9wMlT5dsLeRBx+E36
	tKkyUaMHmoI7HA9ikwjDB7zZKfHF/HOCjqC0NceDC9l+ZpRoclWzohEa7Gi0adetkW26cTN9gin
	Q8avujr2aLTNv0VLnRHQ==
X-Gm-Gg: AfdE7cmcFnZbz6T7Va+r+CqBgg4PC8X0atdYwpoSNiIOqZbwY56X5cN373D9RqEBmKG
	xF0I31Wsu/rQlVsZ9LLXhDdLdjq57NYpwSPyvski2v6t/vDj/t5sVKX3B5gHhBWBW39fkcGaVgs
	X0tKP/qLILNq7tQLsKchjMk8ws0FP0BtiTWb1/iHSHFgNtW16Zg9Eh7TwWRv7/4LrCS95obgaqY
	Hz28k3Q0vgJHfQFvrNCcoaGQpP2pjvIQ1+3n7LcR9SI6Qf2Lw33gkP0prZcXiDQEXPrxJi4/hNM
	IzyI70XqmJ8FNW7ZW0bRaJyCJLJbfv70y2IkD1BumqrLQdqmSF8nWdkiPHuh3PCOfPzGbdHRl07
	xSjXVwN311EDc+j8icQgTa7FgSKGM6QPvY3PPWYO36mN1A68OY2gA/Ih+eglMMw==
X-Received: by 2002:a05:7301:2c8a:b0:30c:496e:982e with SMTP id 5a478bee46e88-30c84dfca51mr2478518eec.6.1782456166212;
        Thu, 25 Jun 2026 23:42:46 -0700 (PDT)
X-Received: by 2002:a05:7301:2c8a:b0:30c:496e:982e with SMTP id 5a478bee46e88-30c84dfca51mr2478502eec.6.1782456165582;
        Thu, 25 Jun 2026 23:42:45 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7cac87dcsm16628270eec.31.2026.06.25.23.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:42:45 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
Subject: [PATCH 3/4] bluez5: fix gatt cache sync issue
Date: Fri, 26 Jun 2026 12:12:32 +0530
Message-Id: <20260626064233.704350-4-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626064233.704350-1-wei.deng@oss.qualcomm.com>
References: <20260626064233.704350-1-wei.deng@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA1MCBTYWx0ZWRfX88Di+wpSjQYw
 UXPu/6Ahez6vkdLjxAgAEufQWJHv9EjlUeptPUy3GgS7Ictd9Z2wBnwAuss61IpHwcyyyIVRlsV
 bdeeinWFE54iUh0KO8Oyyi/rZ0+MRy8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA1MCBTYWx0ZWRfX8XxhfSDGyMR8
 eDS7LPf1fV6UkxIFwzUfGRS2oAaga1HFdG41IeIF7tBGOhLTXBHVLm/8SoEO8dcn0pUfOtkElGo
 YGVk+0Vyd2bCaTuROoHT/59Uc0BLsiL5x2GBsboHzjOXt8XU1b05a+aLjLL81tGXbOPt0GAQsus
 qe5cSDufdJbLjfJP9MGJfQvv7/TQoKa8+hSmXJ1wDRkJQT0A6J1gCd0Ej6YlFfItr2LTzhihgGJ
 ptsg9YrhHl/3LkliwkJDH7H4EQpep/idm1IfIGaGHObWllsBLuI3IJX4Vw2RibTUZdV1oc8Iw4b
 AYtI0sLONsyDLTsgRZJDCy53EpCE51ANlR7YvCPD6YQEiazcLG14Lw5O7SGNi3LvxntlvZwYuUa
 IaOmS+YwKlRkPuvmrIlT9q4CGjRoTOYqbCEnagcupd0AEBPYoIuwQlHEXEQDvY2gCLhMJsgkxO1
 e6jc1P/5+f58JoP1VMQ==
X-Authority-Analysis: v=2.4 cv=O4oJeh9W c=1 sm=1 tr=0 ts=6a3e1f66 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8
 a=k5HSx0GOXTMWBjfvI6MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: K2nda3ImfB_81DZZTKEqRUII1-RgWWm-
X-Proofpoint-GUID: K2nda3ImfB_81DZZTKEqRUII1-RgWWm-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260050
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 65Q6VM0S1680034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239606

From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>

There is a timing issue to update DB Hash value.

The gatt_client_service_changed() callback in src/device.c
is called from service_changed_complete() in gatt-client.c,
which is invoked after db_hash_read_cb() has already updated
the hash. Adding store_gatt_db(device) here guarantees the
db is persisted with the correct, up-to-date hash for both
the addition and removal cases.

Upstream-Status: Backport [bluez/bluez@0fd01e9]
Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...x-stored-gatt-cache-DB-Hash-value-no.patch | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-src-devi=
ce-Fix-stored-gatt-cache-DB-Hash-value-no.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
index 1600107b878..4e51cc9a213 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -73,6 +73,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
            file://0001-gatt-client-Fix-use-after-free-caused-by-reentran=
t-c.patch \
            file://0001-transport-Fix-set-volume-failure-with-invalid-dev=
ice.patch \
            file://0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_=
ADD.patch \
+           file://0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no=
.patch    \
            "
 S =3D "${UNPACKDIR}/bluez-${PV}"
=20
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-src-device-Fix-=
stored-gatt-cache-DB-Hash-value-no.patch b/meta/recipes-connectivity/blue=
z5/bluez5/0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch
new file mode 100644
index 00000000000..69323bdc5ee
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
2.34.1


