Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39E5CD6E49
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 04:44:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3563.1780029181453692557
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 21:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=Xlps3fiu;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=JgcQJvA4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: mengshi.wu@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKkb3t1540495
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 04:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hsQ9jPgjzhi4vUb8nV0MSKu+Z2TKNQHKgYzK6nR+MsM=; b=Xlps3fiucgVX3W/k
	ICBbGelwcGyKziUEa46b1FH9ovH0SHghTPMaeNur78FseedxH9b7q2NZ6TpXu3MJ
	Qf+8z82P6O7n9Ss29lv7AcUWjxKBHEARZt2FmMbaZh/ozYob3BqI8PI22JmnnbKN
	fKfG8HLf3aQUAYAL+ivWftYH4HCylAzSGpl8Q4eJYgBb/snMFRCWcy8EljobwHpi
	MviNScL/7MbXRDJikeLTHrej//yZraI5l0zV7Z9j6rNEny57r4ZEYoS1mME4Nf35
	4zYtfm1Hgq3S5qZpGplVsJ+2emVX+KmcCSs2nnGy+YcumiAVeJdOeqkOyCEBMB1E
	9ZX0eA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety4t4qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 04:06:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304ed777a96so119114eec.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 21:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780027572; x=1780632372; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hsQ9jPgjzhi4vUb8nV0MSKu+Z2TKNQHKgYzK6nR+MsM=;
        b=JgcQJvA44e9NHmqE6wu2js8JE1qNDXs4Ph5/ScRPV70zg/tjrN4fVHJykhLPIDY05O
         ntOzZgGddBMTlMrXPAya/CXTOsEK5vbKCuS4WSsds+wegT/ffnR0pT/JCGXxnTpdIern
         yRW97Z18+BvM5Z+LbyK9fyn4YJdYpbdnR3RgZEOFOaKiOdb4EWWmQszH/d1N3f0ax4Ml
         ljY/XH7F6t9GHwHQlFE57WSWJon2yov7vImHxlY8zhZ9e8MQ/rgNr44gs8/e0WucTKpV
         /EQ9G6IRTyZFaKQ78QomHBF7XY6R8vPNl/drh94j2NRG/OxSg4l6Op0B10F2LNJJHT+e
         rWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780027572; x=1780632372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsQ9jPgjzhi4vUb8nV0MSKu+Z2TKNQHKgYzK6nR+MsM=;
        b=sWSXyJSPJDmFAfnh1AH9hoWnllxhmeXYmR3N3AUbxIdMg5uisdLBhNHPW/cxos+JQt
         toVARRpNET77GnaanJq7vCn/nRzMSqT4opKBYp8Lm4H6EXHXqagzruVS6hkxsyk11tuY
         zwj+1r7aINUms+4j+J76+T9tADEe8/1HpYF+YeY0tmtDxYo1cCdJbyehIZv3o1BGKoLf
         gbjsIxqRt2aBtWohxtY8yDk1ACXBuV//w7lZze3xB4VVfz47ygD+KpE1pc/xnZ0D9FGA
         84gbUVGTKPXqdq7ajYgwUOuTHD30kFRoC/htLHf2ox97uxCFCPb2IlwK0mMn2t5jYWos
         mhNQ==
X-Gm-Message-State: AOJu0YyZ6kTMDPo55vKaCX04pUe5tJ5l2y2nRRAbRJu8RFjFHr2XaTj3
	jGltGMIRpNpRYgF0F1pP2UepSCSigxNpFtxbwt9MVgUlmu4Mv25FgEP+OJ0uxf9AzFKZ7g25wPU
	yPZLRl2/fGkcqHTYVhPPtLj9BvNXtMFtsqUMRmxSHcWL0uLTWuvjysgs2wO+OJR4Nrjf3/sskf1
	Q2B7L3WwxcvJ9xCGt/RA==
X-Gm-Gg: Acq92OFpANx6hEvY3FrJ7bRDdtv6Z47XI3oBQlZLceWt883sooje2mbk6kdpKAVC2DL
	bd0zEqOJuLR5JM4UPAmFXYuTuRH9DGd9gkgD8gdDOpXkXLLWNVR9PLmRMSEUhnTzbjcuxg66fLQ
	0nMmryhLgTkVp2giRBvpdo50sEC3T1kSz4KTYiQBwPjfo4r/IRKpFw138P67UiqJ+z4J0/I50v3
	j5W0jvyl8VANHeqXJnLOkzZzdL3Lum2PHfVc34Cjh5n0GUnD7ixwurZ5X86Z/Ta1qtUCmwDdHSm
	ONpmhzl7nmI4RbmHxjoIYzoJA90+G7UC6/gb28Q/k1zZ1ZXXu4K+fPMvGYRDiRxk9YtxEEkC08+
	pa+br4La1xQVWI0Jh57B4yOPNPtnPbADB5GgSGh1ux15lgbkVMmvjpQIXXgmTnLNgAZimgDwbom
	YO0zkoZ+67QVs=
X-Received: by 2002:a05:7300:5b89:b0:2ed:a58c:942 with SMTP id 5a478bee46e88-304eb4db8c4mr436015eec.8.1780027572114;
        Thu, 28 May 2026 21:06:12 -0700 (PDT)
X-Received: by 2002:a05:7300:5b89:b0:2ed:a58c:942 with SMTP id 5a478bee46e88-304eb4db8c4mr436002eec.8.1780027571562;
        Thu, 28 May 2026 21:06:11 -0700 (PDT)
Received: from [10.110.61.114] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53d14fsm464697eec.17.2026.05.28.21.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 21:06:11 -0700 (PDT)
Message-ID: <20f1b74e-69df-4f4e-8adc-bafcae25dfbf@oss.qualcomm.com>
Date: Fri, 29 May 2026 12:06:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bluez5: add patch to fix 8.56 gatt cache issue
To: openembedded-core@lists.openembedded.org
Cc: shuai.zhang@oss.qualcomm.com, cheng.jiang@oss.qualcomm.com,
        chezhou@qti.qualcomm.com, wei.deng@oss.qualcomm.com,
        yiboz@qti.qualcomm.com, jinwang.li@oss.qualcomm.com
References: <20260521062216.3352030-1-mengshi.wu@oss.qualcomm.com>
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
In-Reply-To: <20260521062216.3352030-1-mengshi.wu@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: shFZCOwzr7c77tP65eLnrpF4_cT5e0CZ
X-Proofpoint-GUID: shFZCOwzr7c77tP65eLnrpF4_cT5e0CZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAzNCBTYWx0ZWRfX88SoTQzNLVwq
 qvCzk37YECcFQWWm76iS402VSJpAosU7Amr/iyA3RKSHIoVEbVqCwPX4KzGTqO2u3axILsVSGzO
 qe4DlkP/sCx0KRdGAKMUrdeIfNGNuDcCNhIWgRxBScNefFhgop0l61fiaMIslYT9BaMbLEauO8X
 ylgPaNsC2FMTFLNuEW0Y6CntBp/iLZbeClFwArSjCD7zPBy9Mtzapm2hMToujLF9bFkNm/BRJkr
 HLABvXYa2gksu5L1YO5oBC7zLfp9Jx18ayc19nzkaTOEu1csn3l+bmDodZjiZjALOGxk9LlBvkt
 UpRSB/AnOPFn77DH6zk6Y8E8zl6WSsxyxDzlQv0+gHVYROSEyz7ENg8FC3c4hAB1oxy4GtJ1PZm
 VRf/+tMkVz0Szfhr1gDyPYT4kpwbA+RiwsXHIqY2rKFAS0c3iUGTN/1CDH4JBDdkzdAeHr9V8L4
 1FycyPB7yFgxHsk0c2A==
X-Authority-Analysis: v=2.4 cv=S+TpBosP c=1 sm=1 tr=0 ts=6a1910b5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=aruLBMOdGEAEWHGtiE0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290034
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 64SKkb3t1540495
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 04:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237741

Dear maintainers,

Please help review this patch. Sorry for bothering. Thanks

On 5/21/2026 2:22 PM, Mengshi Wu wrote:
> There is a timing issue to update DB Hash value.
>=20
> The gatt_client_service_changed() callback in src/device.c is called
> from service_changed_complete() in gatt-client.c, which is invoked
> after db_hash_read_cb() has already updated the hash. Adding
> store_gatt_db(device) here guarantees the db is persisted with the
> correct, up-to-date hash for both the addition and removal cases.
>=20
> Upstream-Status: Backport [https://github.com/bluez/bluez/commit/0fd01e=
98cf94616a5c1c39749314cdd4a1654687]
> Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>  ...x-stored-gatt-cache-DB-Hash-value-no.patch | 84 +++++++++++++++++++
>  2 files changed, 85 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-src-de=
vice-Fix-stored-gatt-cache-DB-Hash-value-no.patch
>=20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes=
-connectivity/bluez5/bluez5.inc
> index 87252b9..0ca793a 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -71,6 +71,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/blue=
z-${PV}.tar.xz \
>             file://0001-Revert-shared-shell-Don-t-init-input-for-non-in=
terac.patch \
>             file://0001-tools-Work-around-broken-stdin-handling-in-home=
-made.patch \
>             file://0001-gatt-client-Fix-use-after-free-caused-by-reentr=
ant-c.patch \
> +           file://0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-=
no.patch    \
>             "
>  S =3D "${UNPACKDIR}/bluez-${PV}"
> =20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-src-device-Fi=
x-stored-gatt-cache-DB-Hash-value-no.patch b/meta/recipes-connectivity/bl=
uez5/bluez5/0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch
> new file mode 100644
> index 0000000..dda9ec2
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-src-device-Fix-store=
d-gatt-cache-DB-Hash-value-no.patch
> @@ -0,0 +1,84 @@
> +From 9ec8cad56e47c0555a056e928e6568d543b3ae0c Mon Sep 17 00:00:00 2001
> +From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
> +Date: Wed, 1 Apr 2026 19:30:04 +0800
> +Subject: [PATCH v1] src/device: Fix stored gatt cache DB Hash value no=
t update
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +There is an asymmetry in behavior: when services are added during
> +the same connection (via Service Changed indication), the persistent
> +storage (disk) is not updated with the new DB hash, but when services
> +are removed, it is updated.
> +
> +During the same connection, We check DB hash value stored at
> +/var/lib/bluetooth/<adaptor addr>/cache/<remote addr>.
> +When established connection, the stored DB Hash value is A.Then we
> +add new services, the stored DB Hash value is still A which should
> +change to B. However, if we remove the existing services, the stored
> +DB Hash value changed to C.
> +
> +When performing addition, it goes like this:
> +
> +discover_primary_cb()
> +  =E2=94=94=E2=94=80> gatt_db_insert_service()      =E2=86=90 NEW serv=
ice inserted into db
> +        =E2=94=94=E2=94=80> gatt_service_added()    =E2=86=90 callback=
 fires immediately
> +              =E2=94=94=E2=94=80> store_gatt_db()   =E2=86=90 SAVED TO=
 DISK (hash still OLD)
> +  ...
> +  =E2=94=94=E2=94=80> discovery_op_complete(success=3Dtrue)
> +        =E2=94=94=E2=94=80> read_db_hash(op)             =E2=86=90 sen=
ds ATT Read By Type
> +              =E2=94=94=E2=94=80> [ATT response arrives]
> +                    =E2=94=94=E2=94=80> db_hash_read_cb()
> +                          =E2=94=9C=E2=94=80> gatt_db_attribute_write(=
op->hash, ...)
> +                          =E2=94=82     =E2=94=94=E2=94=80> hash UPDAT=
ED IN MEMORY
> +                          =E2=94=94=E2=94=80> discovery_op_complete(tr=
ue, 0)
> +                                =E2=94=9C=E2=94=80> [no services to re=
move, no
> +                                =E2=94=82    store_gatt_db called]
> +                                =E2=94=94=E2=94=80> service_changed_co=
mplete()
> +
> +Whereas removal perform like this:
> +discovery_op_complete(success=3Dtrue)  [1st call]
> +  =E2=94=94=E2=94=80> read_db_hash(op)
> +      =E2=94=94=E2=94=80> op->hash is NULL =E2=86=92 sends ATT request=
 =E2=86=92 early return
> +...
> +[ATT response arrives]
> +db_hash_read_cb()
> +  =E2=94=94=E2=94=80> gatt_db_attribute_write(op->hash, ) =E2=86=90 ha=
sh UPDATED IN MEMORY
> +  =E2=94=94=E2=94=80> discovery_op_complete(true, 0)          [2nd cal=
l]
> +      =E2=94=94=E2=94=80> read_db_hash(op)  =E2=86=92 op->hash already=
 set =E2=86=92 returns false
> +      =E2=94=94=E2=94=80> gatt_db_remove_service()
> +          =E2=94=94=E2=94=80> gatt_service_removed()
> +              =E2=94=94=E2=94=80> store_gatt_db() =E2=86=90 SAVED TO D=
ISK (hash is NEW)
> +
> +There is a timing issue to update DB Hash value.
> +
> +The gatt_client_service_changed() callback in src/device.c is called
> +from service_changed_complete() in gatt-client.c, which is invoked
> +after db_hash_read_cb() has already updated the hash. Adding
> +store_gatt_db(device) here guarantees the db is persisted with the
> +correct, up-to-date hash for both the addition and removal cases.
> +
> +Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
> +---
> + src/device.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/device.c b/src/device.c
> +index 3ea683667..cfbde307b 100644
> +--- a/src/device.c
> ++++ b/src/device.c
> +@@ -6267,7 +6267,11 @@ static void gatt_client_service_changed(uint16_=
t start_handle,
> + 							uint16_t end_handle,
> + 							void *user_data)
> + {
> ++	struct btd_device *device =3D user_data;
> ++
> + 	DBG("start 0x%04x, end: 0x%04x", start_handle, end_handle);
> ++
> ++	store_gatt_db(device);
> + }
> +=20
> + static void gatt_debug(const char *str, void *user_data)
> +--=20
> +2.34.1
> +


