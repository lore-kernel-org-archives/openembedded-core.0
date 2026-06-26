Return-Path: <wei.deng@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C212ECDE012
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 09:39:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31857.1782466772705963708
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 02:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=PGubzYpw;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=aJ3CgFU6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: wei.deng@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VM944193025
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 09:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xo8b0tHGtR7s5bu8EuZlOyqo2wL71YT82d6KLcXWS8g=; b=PGubzYpwdnL9/ATX
	PtU9f9QoR9/jHC8wGzBMvNFg40cx6IC6Mz0+fIzK8irBzfrZeOFx010iv5nKG0fk
	ZsLy7TTcm5ZS2NXrDEqB0lrYpM6DykPLxrNEt82DZRfb3YIL1uAMix/V21bpKH1N
	/qUChA13fSsoCCK8GZCckKLn/i5YMSeQbmilLcPCiyBSYgRiG9PxkvkCqGb69IWl
	toPw/YWntpxV8FuRXHLLtI5hL6xCXHQynYPuszvgfCwGmwLtideWSwCHNHDGxXA1
	V5lDCB1QRzsabbqMLSzlCRK0cXxts4jv+yweMnaGbPBWuaot1EDcK08tRi/fxlhu
	OIMcSQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdstw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 09:39:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c01418329so71342eec.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 02:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782466771; x=1783071571; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xo8b0tHGtR7s5bu8EuZlOyqo2wL71YT82d6KLcXWS8g=;
        b=aJ3CgFU6RU7kh9DlZ2k+R+3IfrMISw3hUoSmEqqeeJIofx2QyaHAHlBzHLokebwOBT
         814k+h08ew0IrON4xfZM2noHsaVK/Np4vAFDKPl+lIvSrQcoemnGgiNO5zl9IwGh4/dq
         iEn0Fm+hYpLQdPR/gljQsYb5Hlec4qvqVBctJSdaHH+3ru1aeGHGLA86FR0zVzTE1IQA
         S5eWfrJfN+dsMLZ9tvpiyYse9mOCRg9ZaAJJE2s4M0NA3gzOaTktSp8nnN+HUIX2CLx3
         dgom7eaSdrvx/kg7O+JUR7FN4iE6Q7qazTrg644Djcq8nejOigk+nsPZYEgIIn+ZC6yf
         yOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782466771; x=1783071571;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xo8b0tHGtR7s5bu8EuZlOyqo2wL71YT82d6KLcXWS8g=;
        b=RU2LI1/Q+hmMHqUL0XhjMlk9RAg7/HYKdBfB+OXKvLY3IGyixxQo8HzJWncPJVyRKx
         qf0ruFSDiEQBXHFi1Td/XW8pbn6LlGH8Jb446zjuVd9twoHM6Hs9XQG+HpLMRT2tNwJA
         EY3uJFuxiGbN19kG4fA/1P5LNZQwLFO74aa1SOrZAeJN6HY+NHzRTbhkQHtrowV9Wrbg
         98f06pKmGDBkcrrLMmoiBYPp9Zus9YdhRnCLYH/LubjopA0itYVq8Xv80JRFV0VueNgw
         9zgbt/C2YKNB+Fh+uZEzGxGMvYwvhsn7vwvhT4zYQZ76UyUmH68QJTf/QqyCvOZ2QjDJ
         /DcQ==
X-Gm-Message-State: AOJu0YxDBru7D/tCT8sifk34i0WvR/+LOQpVOzDUUs8qRorrFfkQVbdc
	ugPfD5pif9EI9gxp5WxqMcUejwNyrZH0fsMnAp/Umq6T7MkQoGmleOtafia9zwp+K12MWZQDWyR
	QaCcI0wdM3Gj/VaBXNbRa6WmZspBqG8sgIarLEHXSBuQ9/ahWm6DZhQD0/H3HGmouPSFH1X6e4L
	63t+3ksuY9dc95g3mOzA==
X-Gm-Gg: AfdE7cnmdfo8+k468rrkie4upIw0zXldFZ5HbbzL0BnTJPXDO588PFc6CdJzKgQFAR7
	sSucrG4TeiZ8e8MFYxFwiFf2NTAfP5gX36Qe0Qnt2MkOGcghSqbM7qGgofhbIT8oMbM/Xo1M9oe
	EEBTvHNGISS70K8R4Qy5GX4rzzrucBwHXgl+0H3Ps214j1ChqLSi18VR9gYAuOBFB4y2M1ncbzd
	7v8XrI3ohhxVI3Har+eiCILfZNGOPmTw69Y2ljc4STbyxQrxIx0yrdq/Gz95yO6JuCFm+a8J/Fm
	tUvEJwq7cTElVheMWA0Dl4juI6xqEdslUhQTMJn9Ps9vPwNZOrpbheLwvgLSkIqsVFVPPn+iEUO
	wjaI8HuZZKNOgpdZfQBS/amsyZMK66ruHWIbL80hDVBvXUJRKehlgw4IqTqNMUA==
X-Received: by 2002:a05:7301:1930:b0:2ce:db5e:354b with SMTP id 5a478bee46e88-30c84d00a32mr3099279eec.6.1782466770989;
        Fri, 26 Jun 2026 02:39:30 -0700 (PDT)
X-Received: by 2002:a05:7301:1930:b0:2ce:db5e:354b with SMTP id 5a478bee46e88-30c84d00a32mr3099263eec.6.1782466770332;
        Fri, 26 Jun 2026 02:39:30 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c9e9214sm16908725eec.20.2026.06.26.02.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:39:29 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        shuai.zhang@oss.qualcomm.com
Subject: [wrynose][PATCH 3/4] bluez5: fix gatt cache sync issue
Date: Fri, 26 Jun 2026 15:09:19 +0530
Message-Id: <20260626093920.1079859-3-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626093920.1079859-1-wei.deng@oss.qualcomm.com>
References: <20260626093920.1079859-1-wei.deng@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3e48d3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8
 a=k5HSx0GOXTMWBjfvI6MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3NyBTYWx0ZWRfX78RlyU9FyjT4
 W6sUBh+wMfHKCy7BoobDMFPsw8xLrfwOuQpVFUo/4F1+ljpZ/xEDsg1o20hSOaPkadLQRaVz/5o
 F49xBgfo25O93xqXISOQCe7ts9dc09wyaDH12ORbbJwB8s5k7Okzc5scIQqwD7b8vsH7mPU4r+U
 GZbunGGikq9BtEiPKf9hvHCqNa7jsgr060U4pyijRL2JINZlm1SR8EpAGpYDzVO9gvcices9rWN
 B6Z2eEK3Ktp7ZYLjB10Ej2HAcRyuGhoq/VgYuCLlkA8rx36+o5UbG+fDRkHJM3aQQNYVyyoqVH2
 hRWCogcriNI5omsqXX870GUQJvXJGpchclhNtjDewkuZOmB71MfkYBB6sZ+Cd9oT45NeYRPy1UO
 3gaGfN7s9JFLkWi3chckjtI0jX/X2ZLMzIwoIyQZX9EZ0N0DUBw6x99CdjU7kGjanSiIRytrHN8
 Qwfhxgs8cdhTWW/5OGg==
X-Proofpoint-ORIG-GUID: 5_eb56nUjstw50UcrOvczU1roYtXvbk0
X-Proofpoint-GUID: 5_eb56nUjstw50UcrOvczU1roYtXvbk0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3NyBTYWx0ZWRfX4ecHauDicGAl
 3ZeGM/mJAxSyHraLOAGSjEPVROusJu1Oc42H8HbZBKEzWJtPfmyuoF2GbsSZAhQ8WtLoD4O+ewF
 0k3CichB8WtJhq4i2Dgz03eH/f8m6Iw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260077
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 65Q6VM944193025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 09:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239621

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


