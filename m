Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E03CC5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 15:15:19 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18996.1787584517968139898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 08:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=PS63z1WE;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.84.68, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgO7HuAJVV+y5c20vJ4l8LeMh9fxYLl1Jt+QbjF7Sfyrtg/AmS44kziG3YqvNups1uxnbZApO2Cb6SWJLKK1B4dHo8vH4N9i1jg41Sm8tAHL2n/K3TlZFTxh/lOnhPjTuPXWcrIkKb3hEV1j8IGRP1Be0E4DbQUoWscVDITSG7ZSKgqa8tTEYhXTkx7vWkexwm16EQQUzOv/J3GnuK18jrhbnDexJhQjRxidW0Qec/CNtkyIbC8JlwGo6T0P/L32sce96sOxahS9m4hgPU1HmlJ13dcT+l2NUKtnc5lnnzdrAYjzuHK5nMtaSFj8qqzovskGmYmxpIIzuuZmgL8Rbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9drUwvdeVUlUZzpoPzD0w6RFgtgvE8mubnf4Ycuxavk=;
 b=IL4AQ0+QV20QIjRb4Pd0MUU2n4bGn3bB8n78xzvuqGRPX+uXirrStcVrnPAkidCDcwRt3AD62K714t8gIIuaoYZKG+Zq4usLWxuEbSLGeowtjhlFS88//eWX0V2FcMS1/tTm1c2Iyh9N57M3yB9s9jKbS4DTIEOXYxMGri6QafNlJRoP0ZUISyZ0c02oAZWhG/sHE2WX5hYAO+/jSNAPFjO84neI8C1IuRILwjeHdPZX4ApJrtUlt78fCw26X1ilQ0DZZkN11jEcGkxV+ZoCYpRRZuc4R2h111TSJS+h/zhfDD75uVM3wv5/rY40LknoDVfGthGL4XPa9Ek7TjhASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9drUwvdeVUlUZzpoPzD0w6RFgtgvE8mubnf4Ycuxavk=;
 b=PS63z1WETE2Y0gNTmz+O0YndctR92ShLUDlMFT0L367tYgI15zzC5/zXa4n68udGZdDPRocBq7Zl1WsXtjLVR91WB4j+UxyiGD8YCZyB+DSQ7Rm9CB670gzO5CDY9xX3yBJyBJCv6t+QKGKi05hpxFSdAglqAAWGRLzOXNZoD8o+TYfIdtkd16KTCyp9sO1Qi6U9DKgv7RjmxJx0khTSdQs4lgtY0l83h3MgD1ynOSavOYdZ4D+boEhObcHzr+jUPHNEt3Z0gf8eaFg4j+Q+0Yieie7JagC0xaKd62Y+rwG1IonvNRjMku/x9dVVttuezu5RCJUoyIMlqdUyfcU7qg==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by AMBPR07MB11278.eurprd07.prod.outlook.com
 (2603:10a6:20b:6f1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Mon, 24 Aug
 2026 15:15:14 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.005; Mon, 24 Aug 2026
 15:15:14 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [PATCH 3/3] expat: fix CVE-2026-56412
Thread-Topic: [PATCH 3/3] expat: fix CVE-2026-56412
Thread-Index: AQHdM9td2SlFAbxjPE+yfstCRD4T+g==
Date: Mon, 24 Aug 2026 15:15:14 +0000
Message-ID: <20260824151448.19118-3-jakub.szczudlo@nokia.com>
References: <20260824151448.19118-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20260824151448.19118-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|AMBPR07MB11278:EE_
x-ms-office365-filtering-correlation-id: 6e5fd75b-afb3-400e-4c1f-08df01f27f9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|10067099003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 va+JP/WSkrePJzrOWzUeHN35hm9HH+G+iQbP0dKSqvRoqgF7BKUF6SDv/0UxcQS3gvOo74DZo61PXzNzNSJbgOEtDsiS5ZS857sgDiI7ak6M2ygMUg4odXc0O+zHgsiEZtePOMaaGzSS3wYduySNdquTYxDbkRtPCOFn/6dPHPxKBbQAXdi2Fu/wrmcuH2v8caeru2g6vYLe3jRYREJiWxKBogxfETG/nMjZzJW4S9adenRMZsO2OQ7SjvJHSWvKWUQ0dbtZt04EIYoVHtcQDQI2xUn4SrU69GAFit2JxWgmS1oddMcGVJPWHU2nUtwJNiVhacBYHc/MkuXIw3yIlw91bwIWhhQPvmxivnwOi3I6v5ciBpo24uo8VBk0Tp+C6WV/DcBs3+skGkl3nxX4tH3DK8w0z/k2vYfzxykmauEQEuRmJ04AP5UR9gUoMVYFLIBAXgRERqy38syMnRqAv52lDYxuBU4m8IFUe5RyC0ugIKfWnt9uVneDLJUjSjiovI4liv8g20yQHukl+KGYWQEmFtbeBXp/JxwB2Eqa6HAd20VXhRzLYqRcerLLvJgPEzhEGD4VwVuBxCDy0YqIEGCA5+4ii/vJPQc+sDosRJAl1lp0F+VaGgK+42VVPBsn2Jg/YRR4rJochp5eDpAbTw5mWBLtREfT/WqEvRkXndk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?RlbzqNAMlfflTi6LaeO/p2p5bqHd4ofKl0F1cp2FXUkNwwnRYHK62UhZyp?=
 =?iso-8859-1?Q?lPUjCRybd1jmA9VDE0iglEHiyp444gjY1rhwNNPK9aOISGqH26j+4ogixD?=
 =?iso-8859-1?Q?Lm+nqwmn4RRQlqWvRUX4m6gtoyPF3LgZxSqiyOJ1srbxzK4qa24PAQIcCB?=
 =?iso-8859-1?Q?rAJCuiY+0L8Lg85kpB7bo6GxWB65k7XHX9s3l1JGu5AZAio2xNQqbsT3SF?=
 =?iso-8859-1?Q?172tw5+b2o0bLoO0FqBAJPyJlcHwp/MWXiNYR/bH8EVFuisYMPGLsH0g2K?=
 =?iso-8859-1?Q?9uOVVc+uijxYgUTsycmSD+TMxtLLe6Y8QqFfvgFu7wcoKhdPYir2j6Hkoa?=
 =?iso-8859-1?Q?ZMP7mqSs0/qBg+c6WIaB9uoRrykEr9RiL9iKfhQYth3vKg0ZPD64uxjI5e?=
 =?iso-8859-1?Q?fCq/fLBPHVHh9eii3Gri0qkwALrudqWEt+D+VFwuYGDATF6TTZ8HWf0U3i?=
 =?iso-8859-1?Q?WYElqSjV++tsyohrtNXBamNRK9ajr922SdGQC48sm/G40CWJUyyAbHd9mX?=
 =?iso-8859-1?Q?GzGXdLw9ohO5/VQ2yX71e3/lvTW4eDR6vyHII1d9IgE064H4YbXnWU0y4w?=
 =?iso-8859-1?Q?jchbD2CFCdrbpj/uU7EwmbrvBYW9OYmYmnIeadhSZ7mEINmAzUfqlhNUrx?=
 =?iso-8859-1?Q?Hv6s1DzAeZtb/G7FUpbOqJ5xMkkFyEldpUcCqdqIeeRcZq00l3btlDzBpz?=
 =?iso-8859-1?Q?q1LfrQ5dpSw/5kPA8g5UhTrV/x4Y3vlXLl5NzLjvLpSQhEkG/iShsOf5JK?=
 =?iso-8859-1?Q?7YDDGs/gdGhu0GWVV03LoFAeB9NoXgi54JmvDuCvmb1aoU3EzDjKSPzvfc?=
 =?iso-8859-1?Q?SN7UoeSVOaoKV0twwCxSrKrSWagQXnarL/DSlDFM64bBRnvgIy837H7/40?=
 =?iso-8859-1?Q?u71Ux0aTiA5f+bDVN+/p32M9JHp9aOMAtPnMdoJMTUvpDnurzdCQTQRmHF?=
 =?iso-8859-1?Q?xYl3TlcqHWJ4m9TFA1GgcU/kEW2oLbx1kXcEEJF/YuzS+HOCu5RAjTsO9T?=
 =?iso-8859-1?Q?PwfI2X0fiZ/luE/vHELRSkPF12l6+jQjyIjiKJCCoM6YHdlk0al+iqLPXu?=
 =?iso-8859-1?Q?Uco3s41GLBp9NFUf0byfizK8koCkjSsAikctr92LkYWTKFLiKo0O7CGEIL?=
 =?iso-8859-1?Q?L59VR7S7VNYFUUl7+CUtbcXVzZIYKBPLu/7yIecDPGj54J5VguJ5wMigUu?=
 =?iso-8859-1?Q?YE40jQSyMRMPeNxSmha/gBZXlRIlAGJvBQyQ9w4E/ee1RGDXPUZJ6zfQ55?=
 =?iso-8859-1?Q?eMdFeEkUUrGfFRLRuSP6rfJJoV+wEUq+alR3K4kQzzfOeUhxG6jelaowYu?=
 =?iso-8859-1?Q?1r2xtCIIi1/SIiyP8SuFbexPGnmr5hT6uU+VVE6Ijq82bSdW/ssHEwi0fX?=
 =?iso-8859-1?Q?jERi3F1qfCjhD/LfgN8dW4K16oi3IZerF3kJmTshU8bBBbXgsLr6dJFr4Y?=
 =?iso-8859-1?Q?h7c7zO31p/bl5BG1buvQwDqINPw8V+uDjlLX/dP3XZjPFMsfmvbKSM1dSR?=
 =?iso-8859-1?Q?5yYoVEKko83NPGGc1MhZAA5zzNujoydT/vSfTJxRrIGdOEi5i+/g+nbNus?=
 =?iso-8859-1?Q?9f4YfAOO6T8DBezwqIpfcRxt/CKIwzfsmOsLy+eNYwWq9gAbaS0+IxB0Dh?=
 =?iso-8859-1?Q?5y7qFsOGQ9JoFttd7O5cH3XGxvb9UrFbWxfCV9vQADTaYklrB811Jz8glK?=
 =?iso-8859-1?Q?a4e2WoXzUPc34powr4s7nqDYU3EkgvvkMJJF5ttAYzF/we68DcEa6bHs8I?=
 =?iso-8859-1?Q?CnIgkMd1TfCSGrLu4/onATMZZNEwBTTmWKXCvlCx5fB6hzA/jXeesHBgFV?=
 =?iso-8859-1?Q?zJF9NgBl1w=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5fd75b-afb3-400e-4c1f-08df01f27f9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 15:15:14.4126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AtWh6ftGCc45oXiYv8COLBh7KilxuSHftKY2VJWR8tDG8Op3RCRi/H/GkZfTsFmfDFbh3gUT1ixHA3ONdQg5zoQyqykgwhdl223ENjiUh5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR07MB11278
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 15:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244129

Backport patch to fix CVE-2026-56412.=0A=
=0A=
References:=0A=
  https://nvd.nist.gov/vuln/detail/CVE-2026-56412=0A=
=0A=
Upstream fix:=0A=
  https://github.com/libexpat/libexpat/commit/d19e834794060d18c061d94452c35=
d725393ea58=0A=
=0A=
Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
---=0A=
 .../expat/expat/CVE-2026-56412.patch          | 45 +++++++++++++++++++=0A=
 meta/recipes-core/expat/expat_2.7.5.bb        |  1 +=0A=
 2 files changed, 46 insertions(+)=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56412.patch=0A=
=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56412.patch b/meta/reci=
pes-core/expat/expat/CVE-2026-56412.patch=0A=
new file mode 100644=0A=
index 0000000000..8959bdec5c=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-56412.patch=0A=
@@ -0,0 +1,45 @@=0A=
+From b94cd5b9a6dc7f938a50db2417e4ff60ed35c4a1 Mon Sep 17 00:00:00 2001=0A=
+From: hextheshadow <hextheshadow0x@gmail.com>=0A=
+Date: Sat, 20 Jun 2026 21:07:29 +0500=0A=
+Subject: [PATCH] lib: guard XML_TOK_DATA_CHARS handler calls in=0A=
+ doCdataSection()=0A=
+=0A=
+(cherry picked from commit d19e834794060d18c061d94452c35d725393ea58)=0A=
+=0A=
+CVE: CVE-2026-56412=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1278/=
commits/d19e834794060d18c061d94452c35d725393ea58]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 7 ++++++-=0A=
+ 1 file changed, 6 insertions(+), 1 deletion(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index a5fa256..1476c7e 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -4812,16 +4812,21 @@ doCdataSection(XML_Parser parser, const ENCODING *=
enc, const char **startPtr,=0A=
+             const enum XML_Convert_Result convert_res =3D XmlConvert(=0A=
+                 enc, &s, next, &dataPtr, (ICHAR *)parser->m_dataBufEnd);=
=0A=
+             *eventEndPP =3D next;=0A=
++            beforeHandler(parser);=0A=
+             charDataHandler(parser->m_handlerArg, parser->m_dataBuf,=0A=
+                             (int)(dataPtr - (ICHAR *)parser->m_dataBuf));=
=0A=
++            afterHandler(parser);=0A=
+             if ((convert_res =3D=3D XML_CONVERT_COMPLETED)=0A=
+                 || (convert_res =3D=3D XML_CONVERT_INPUT_INCOMPLETE))=0A=
+               break;=0A=
+             *eventPP =3D s;=0A=
+           }=0A=
+-        } else=0A=
++        } else {=0A=
++          beforeHandler(parser);=0A=
+           charDataHandler(parser->m_handlerArg, (const XML_Char *)s,=0A=
+                           (int)((const XML_Char *)next - (const XML_Char =
*)s));=0A=
++          afterHandler(parser);=0A=
++        }=0A=
+       } else if (parser->m_defaultHandler)=0A=
+         reportDefault(parser, enc, s, next);=0A=
+     } break;=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/exp=
at/expat_2.7.5.bb=0A=
index 78e35243c5..6fdae2458f 100644=0A=
--- a/meta/recipes-core/expat/expat_2.7.5.bb=0A=
+++ b/meta/recipes-core/expat/expat_2.7.5.bb=0A=
@@ -69,6 +69,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}=
/expat-${PV}.tar.bz2  \=0A=
            file://CVE-2026-50219-31.patch \=0A=
            file://CVE-2026-50219-32.patch \=0A=
            file://CVE-2026-56131.patch \=0A=
+           file://CVE-2026-56412.patch \=0A=
            "=0A=
 =0A=
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"=0A=
-- =0A=
2.34.1=0A=
=0A=

