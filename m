Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB700D19510
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 17:41:48 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26523.1769449305500688526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 09:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=oJHfqnym;
 spf=pass (domain: axis.com, ip: 40.107.162.1, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHo++3rCM8RFCi4ZlkKnVk4YszcCg0Nc606/U9dZ8NY+TFBtul2r2eMUMoJeIpkaqU/AdeTyXsxA9FyA5XaNThw2h7ojR49YwtDSGEjjnDmKwFURfmzOgnzloWHPUOAkhacvwTpz22Qtsns8Z0XFrRUzQNwWkfNPk2NyW4kBjYQMh80OhH9MKBcBmMCola+tfmiLsnH23KwvKwjwbVnRDM2mWvcweTOYfDiV/Z54PqfM4eCXj/6egdY8+zsF5emSGGMIHoR0Y3ItkInX6lLL3UgE5lFsQQN9JmuuPPSFTqcRVwuk82+3OPDIOxui39J8x/v5IEMtfzDjsUGkJVPNqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiApOw+N/vj4I/W/CZ2Tyx5mja6h6qpKlDCbGQGhn3Y=;
 b=Q66jIZoxIB5K6NpMWfuHYoVtCDd/EwFpRgVVqrURoIHOWTN9e5VhOG9HuSVvBDNlV5Bm65c2hhyXNa7oGl3gqpHkkV14Zs2IlQbIqB9G1/AXiNUUbbGh1G7cPd6HQj/6gME+0NKDMEUUr146t2DFd9T+W8oycq8BavmPRM/9Dlayydyaj3UFS9CIj8PDJZnk8JiZ8+sFCV3qF59efpZrhF1H1TejnneaLDN/W4VJy/JRuRhwDnTTMMz4ULzDPyuqCJ4AlBPamJDsvaQ08cY0FERDGXQjdV4ImlvbfTm7+e46KsS1SqcWfwLgN4WJ5T7wkJdq6cenDPvm8NgfyXUkoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiApOw+N/vj4I/W/CZ2Tyx5mja6h6qpKlDCbGQGhn3Y=;
 b=oJHfqnymGOChJ1pXVpLAVHPlGehnLG71AwvNzEn3X2MStt0lp2mfvO0bm5vDtm6EON4WUo7ct28J9UdN7lG3roaqcTfj6kKNuQ6yz6f8m3nr1BnPRvu/J/IZrvNT+gyIdxnHKkOvMVs4kHNvknULV3hWlx8e8yzXG5aedqUm2jM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AMBPR02MB11815.eurprd02.prod.outlook.com (2603:10a6:20b:72b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 17:41:42 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 17:41:42 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "adrian.freihofer@siemens.com" <adrian.freihofer@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v3 01/13] useradd_base.bbclass: do not use awk
Thread-Topic: [OE-core] [PATCH v3 01/13] useradd_base.bbclass: do not use awk
Thread-Index: AQHcjpcILdjiyX9oAEGIBfaPR2GGQLVksUag
Date: Mon, 26 Jan 2026 17:41:42 +0000
Message-ID: 
 <DB5PR02MB102130245609E0C43922FCC69EF93A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260126073809.468495-1-adrian.freihofer@siemens.com>
 <20260126073809.468495-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260126073809.468495-2-adrian.freihofer@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AMBPR02MB11815:EE_
x-ms-office365-filtering-correlation-id: 3276ff99-82c2-46d0-8e87-08de5d022aee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7142099003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?sUYTq70EL5H8ATMrprMBrZ/STUyq01BTLLQ89rs7d4WJmU8icn9RAvlfpN86?=
 =?us-ascii?Q?Ykt311/4RJ4hdB0idNYFdnW4Km5YSluapG+mHQALxWjkzdZ03Ak13HMHxfRd?=
 =?us-ascii?Q?KDRKUmg2mfFCOkzOyvNAmn73YteImnDXhtoTpqOydAchrnACANhzgolSTYfp?=
 =?us-ascii?Q?Xh1dWkHWDFA6R+bKv60d53fFk5BIyZiibCnJdZ6aGyj/J/efrNSR6BbteQ4t?=
 =?us-ascii?Q?uS1d3OaVcCYu8qH8OfJCcba1edurmkQTCR6wo5NGW4lPTPdRMlf/8eAAOLuj?=
 =?us-ascii?Q?qIR3w6CqkOA4fSa9hhlzHg/K0aR+5rUdGPBPdgDF8l8Z/JBH/BkF1ncFm/yw?=
 =?us-ascii?Q?wR6FYWyQ7Is1PgwYYJZv3fP6aiU0oTA1HKJfyeloLSdkCWkmC3qdyUKVz0QM?=
 =?us-ascii?Q?2kKHsiLDghTaLvefpxa+Ah+1hzaAHmc3OTMU5fsqSPAS4UqFaR8LWWZUacxg?=
 =?us-ascii?Q?QwtnrPXurd2TRENoassRr8n7JfaW48qmB/KPeI8y30GpKX953nxiBfVWfib3?=
 =?us-ascii?Q?4jYD6vqiksTkTIg5qw94kTAiEeSrtCbU5e2jpXhl28b8FeXUzph9SEc6Czln?=
 =?us-ascii?Q?p7EkVNxqA7t8DRu6xTmEv5FlSF5C1VXf1fszfybAEm6WvJ07wjRjh8FSRAZd?=
 =?us-ascii?Q?HQCiwPyBU6E+hvi1N4QVPylTUH1GYuDkWijqs3YxXn4Ax5T91/VPVKcxLjK+?=
 =?us-ascii?Q?zIHvfEXmuzBOUiI//8clfBnOd0PPVxG9b660hN9LXVU2G3+YH4DkRrquZLCK?=
 =?us-ascii?Q?zn/83X8bwTzaUPTnyVDD8avB7gskPXTOWfUMet/HeVFWoU99aApiXcPVMOIF?=
 =?us-ascii?Q?gexxFv1QouTW6jVBvk/PHDEnAriBm6Zq5F1e4Qbbi5CC+x6oyUNoFHWNDlLf?=
 =?us-ascii?Q?SniRcidQ+3Np+JXVOZI74HTsdxHRl7utqbzzc0yunq7SOJdo1LaIWLXGdSW4?=
 =?us-ascii?Q?293354mqENM6HAtZJVWZuKItM1Yw1/Hyx2k9ePowO/SP33JtOMdpdQUSQ9lK?=
 =?us-ascii?Q?KKzaMHua/FOzC4d6XQe1PLZ/k9qiTUzIrp5M8srwnoRy/5Jwx+JLFgvXoe8p?=
 =?us-ascii?Q?0CkrlHWqsI+Pi7dOaSWTQ+lbdu2QLxwSI1QGiwrNLiDIvWfaaSF9Xbb39+we?=
 =?us-ascii?Q?nsNCtOy2My7MsCvQjhSo87q9NyWd30uHByW/j/n+dOQYCzXrOSivzLvt/4Tz?=
 =?us-ascii?Q?8LXi+lirAYOWHDbgIAT+o/S7eftxtxsQ/HwLRwA+yj3Zwj8ZYNcPlXdBlePT?=
 =?us-ascii?Q?sgi5c4DxUjRqCr82Q1wZfh7UIbuQy7YIyJmGNdasHrcNSs2lIaUgtzfnk2Oc?=
 =?us-ascii?Q?yitaagl+6/ntmIT8x+pHhz6qI/OY8yf3H2G0yxKJD/q3mnExkAGwNCsk0ROd?=
 =?us-ascii?Q?yvLNNfTtYCVI7DPvVztZMv+cRQfxz1uQwMlEFwa3Z2tWN5voTLVIelcRIAPP?=
 =?us-ascii?Q?zthixET7FIhuZ27Rchwu4n74XiDjtMgGICOvSgcr6dDeqa+3Eyxh/adKWTsA?=
 =?us-ascii?Q?Ui1tLroGoNpRA3qxQdWwqXVzfJsR9uZ4WIVpkMmD9oq9xVM6sKccgA3atHQy?=
 =?us-ascii?Q?LnX0wOp8edWOAQyDnW4KqVV7IQS0N78EOMnyHMeruh6SVIlsFk44Am6qWkJt?=
 =?us-ascii?Q?YtuV9F8OV4HS0rlhVN6FqIE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7142099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XqMiR9ohX7neI6Ub5WHoJAX6e4aAcogmEfbT6ndCykDvbBPjtkCLe1l919AR?=
 =?us-ascii?Q?ZELUtbvK0RLuVyiP+Yj01qq//xkbRcJ+0Cjico+hwS/Z0jvbKA/EepedMIQr?=
 =?us-ascii?Q?MlIaeYS0GAf1kArbJmjwIbplu9UkIMrLE8SNi485Fcf9FTPDYzaNF88LrP3U?=
 =?us-ascii?Q?XVolLZaedrHh1ZvIo/221xSOb0NUspSmn6B9VEEq30H57c0Ww2dV6ayBp0A3?=
 =?us-ascii?Q?hsApVf340vuXY9OVi9z1N5d1RVPbUam16kASlDN1Z7WjAbPNA6S2WpiJLzeY?=
 =?us-ascii?Q?4x06d7/ZO0atxud4FECj1f/AeiR9XrGuaymb4p96pH/NfWZNrPGta0K1p62X?=
 =?us-ascii?Q?TbP0AMP/fOjnbOxmUREvYf2ldNwVRil7cAXTDSzikPr50IP1nk/tDi7aeSot?=
 =?us-ascii?Q?srOfHn6CKO7ecuFeUU8rs0azP8x23hUMLBUUprGuiM1F5NtwIPUwwFzpgjdZ?=
 =?us-ascii?Q?iFOcUGAKABx/+kIGlCPZuux+Nt4WBuUNQYOKq0esI9eTE04yPxAQt4KMtpRi?=
 =?us-ascii?Q?vbk4W8KFhLWrdDcfeXo9nYPw5IMIfRu3c05ydgX/Cu7FoyK+66xuKS1Y6Qqe?=
 =?us-ascii?Q?Qn1XDkQUQt9f0lhMyEau+TcrJcXMVlfRxaMtOSpMiPh7VJLkI1u3XHX4WT+A?=
 =?us-ascii?Q?BPsnqoWt3AMxXRr8p8yTE56AgsAMXF94WlRYeELwqYItofWCkBPv4yWKSvfE?=
 =?us-ascii?Q?PpEGDSl8+Va8sLDdSFGBDN9D0Fs/V7JouJsPPfK3tdKdwyr+HlyBkqCou+Zz?=
 =?us-ascii?Q?gViOLHJXO2JC8vcgrmRg3FQ8YhY9qC36urxhcMFWFJ6mm7/hCkUbfIP0WOO3?=
 =?us-ascii?Q?aNKxvPUdVf+brs8DxYnqhSHLgtAg2An+kDU90pPLlr8cbP1MWjKOUwr0PNF9?=
 =?us-ascii?Q?1zhOMw5ofVYfzsStD8Go4CR8ITv2Akk8OosjrA0Rn9on+ZQ9X8VORhATh9I7?=
 =?us-ascii?Q?gJ6X56gG5lZOVpGddJ7CHUMS4/Vn63jr4GzZDGdD81EvtRRQ4kP2+haVsmMK?=
 =?us-ascii?Q?kWWAI8xTl/gQACde22d8zmqcAaYEsAM49gfi2OL8mdgN7pM1X8A5kZ+pOcjV?=
 =?us-ascii?Q?JOnIdB6OkxoS7oTcEk5vzaxxIJMLMK/WqnoYT2ZutG5l90n3X63hVfIQhZuB?=
 =?us-ascii?Q?Z8NbKjRV9x1jXz6xOVAOd2bs80LkG4hytbUnnpoReLIMiID93USAVV0k2qGx?=
 =?us-ascii?Q?s1cwjo2F1u9ZtT4zJbAGzaLSZ98Y3dbvcMfE90xxYht0pCRgLaJfU8qWaWMx?=
 =?us-ascii?Q?9z+u9HH+Ec7wviI56PZDR02CHyppfUV3898f1LkZfcdch/18xY5cOBc1pj0g?=
 =?us-ascii?Q?faXE6jr3OjVukr/5aEW52DECbQ/53H0k1SMkdETtFm29neAuntgcWZWtLoCD?=
 =?us-ascii?Q?iy6/CpDCy5Z6wmC9MKlzW087Yj/xmv5Ae2/j5Xo0R5tV/DGFcT+dion9k/6k?=
 =?us-ascii?Q?8fhI9BINoJWqrB/vmGChMWQkXa3pSqyj9/kUlIRwcmsSDhWgF+eX59edgsHH?=
 =?us-ascii?Q?gVf5ZSOYEZpBUsWbATZeWcO/GNxsJgHXwMURXIJTOVsrPazB6BGguWGRj0SR?=
 =?us-ascii?Q?/kyE1fStji9juYvlUYK0rP94XX5dHtKZp0O34Hq/VQqIHtIpEuaPqT1mkEWw?=
 =?us-ascii?Q?VoyoMEENJgAKF3YWKQUkWwu5LVTCREkKzIiqQafq5gsYCloUm1gYKTMQ4lpj?=
 =?us-ascii?Q?rwrHsxuXgVJzALAxVV3mnIEGR3A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3276ff99-82c2-46d0-8e87-08de5d022aee
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 17:41:42.4297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4xRyTDVsDRqskCi0X/NmVGOt3Y84e9WY8lsO4MILxWIC9W2xkqXa8yDk75EzHvE5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR02MB11815
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 17:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230023

Barring the result of the discussion on whether this is the right thing
to do or not, below are a couple of fixes in case it is determined that
this is what we want.

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Adrian Freihofer via lists.openembedded.org
> Sent: den 26 januari 2026 08:37
> To: openembedded-core@lists.openembedded.org
> Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
> Subject: [OE-core] [PATCH v3 01/13] useradd_base.bbclass: do not use awk
>=20
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> The exception bellow occurred during

bellow -> below

>   bitbake build-sysroots:do_build_target_sysroot
> Re-trying the same command again can "solve" the problem, which indicates
> that the problem is transient.
> Transient probably means that libncurses.so.5 was not available at the
> time when the useradd command was executed inside the sysroot population.
> However, adding gawk-native to useradd.bbclass
> DEPENDS:append:class-target does not help.
>=20
> As a workaround this avoids using awk in useradd_base.bbclass.
>=20
> ERROR: build-sysroots-1.0-r0 do_build_target_sysroot:
>   Error executing a python function in exec_func_python() autogenerated:
>=20
> The stack trace of python calls that resulted in this exception/failure w=
as:
> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>      0001:
>  *** 0002:do_build_target_sysroot(d)
>      0003:
> File: '...poky-master/layers/openembedded-core/meta/recipes-core/meta/bui=
ld-sysroots.bb',
>       lineno: 46, function: do_build_target_sysroot
>      0042:    targetsysroot =3D d.getVar("STANDALONE_SYSROOT")
>      0043:    nativesysroot =3D d.getVar("STANDALONE_SYSROOT_NATIVE")
>      0044:    import os
>      0045:    os.environ['PATH'] =3D "%s/bin:%s/usr/bin:%s" %
> 	          (nativesysroot, nativesysroot, os.environ['PATH'])
>  *** 0046:    staging_populate_sysroot_dir(targetsysroot, nativesysroot, =
False, d)
>      0047:}
>      0048:do_build_target_sysroot[cleandirs] =3D "${STANDALONE_SYSROOT}"
>      0049:do_build_target_sysroot[nostamp] =3D "1"
>      0050:addtask do_build_target_sysroot
> File: '...poky-master/layers/openembedded-core/meta/classes-global/stagin=
g.bbclass',
>       lineno: 249, function: staging_populate_sysroot_dir
>      0245:                        continue
>      0246:
>      0247:    staging_processfixme(fixme, targetdir, targetsysroot, nativ=
esysroot, d)
>      0248:    for p in sorted(postinsts):
>  *** 0249:        bb.note("Running postinst {}, output:\n{}".format(
>                       p, subprocess.check_output(p, shell=3DTrue,
>                       stderr=3Dsubprocess.STDOUT)))
>      0250:
>      0251:#
>      0252:# Manifests here are complicated. The main sysroot area has the=
 unpacked sstate
>      0253:# which us unrelocated and tracked by the main sstate manifests=
. Each recipe
> File: '/usr/lib64/python3.13/subprocess.py', lineno: 472, function: check=
_output
>      0468:        else:
>      0469:            empty =3D b''
>      0470:        kwargs['input'] =3D empty
>      0471:
>  *** 0472:    return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, ch=
eck=3DTrue,
>      0473:               **kwargs).stdout
>      0474:
>      0475:
>      0476:class CompletedProcess(object):
> File: '/usr/lib64/python3.13/subprocess.py', lineno: 577, function: run
>      0573:            # We don't call process.wait() as .__exit__ does th=
at for us.
>      0574:            raise
>      0575:        retcode =3D process.poll()
>      0576:        if check and retcode:
>  *** 0577:            raise CalledProcessError(retcode, process.args,
>      0578:                                     output=3Dstdout, stderr=3D=
stderr)
>      0579:    return CompletedProcess(process.args, retcode, stdout, stde=
rr)
>      0580:
>      0581:
> Exception: subprocess.CalledProcessError:
>     Command '...poky-master/build/tmp/sysroots/qemux86-64/usr/bin/postins=
t-useradd-01group-cmake-example'
>              returned non-zero exit status 1.
>=20
> Subprocess output:
> ...poky-master/build/tmp/sysroots/x86_64/usr/sbin/useradd
> Running groupadd commands...
> NOTE: cmake-example: Performing groupadd with
>   [--root ...poky-master/build/tmp/sysroots/qemux86-64 --system cmake-exa=
mple]
> awk: error while loading shared libraries: libncurses.so.5:
>      cannot open shared object file: No such file or directory
> groupadd: group 'cmake-example' already exists
> ERROR: cmake-example: groupadd command did not succeed.
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/classes/useradd_base.bbclass | 49 +++++++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 13 deletions(-)
>=20
> diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_bas=
e.bbclass
> index 5e1c699118..2d42864cbd 100644
> --- a/meta/classes/useradd_base.bbclass
> +++ b/meta/classes/useradd_base.bbclass
> @@ -20,7 +20,8 @@ perform_groupadd () {
>  	local rootdir=3D"$1"
>  	local opts=3D"$2"
>  	bbnote "${PN}: Performing groupadd with [$opts]"
> -	local groupname=3D`echo "$opts" | awk '{ print $NF }'`
> +	local groupname=3D
> +	for word in $opts; do groupname=3D$word; done
>  	local group_exists=3D"`grep "^$groupname:" $rootdir/etc/group || true`"
>  	if test "x$group_exists" =3D "x"; then
>  		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupadd \$opts\" || =
true
> @@ -37,7 +38,8 @@ perform_useradd () {
>  	local rootdir=3D"$1"
>  	local opts=3D"$2"
>  	bbnote "${PN}: Performing useradd with [$opts]"
> -	local username=3D`echo "$opts" | awk '{ print $NF }'`
> +	local username=3D
> +	for word in $opts; do username=3D$word; done
>  	local user_exists=3D"`grep "^$username:" $rootdir/etc/passwd || true`"
>  	if test "x$user_exists" =3D "x"; then
>  		eval flock -x $rootdir${sysconfdir} -c  \"$PSEUDO useradd \$opts\" || =
true
> @@ -54,8 +56,26 @@ perform_groupmems () {
>  	local rootdir=3D"$1"
>  	local opts=3D"$2"
>  	bbnote "${PN}: Performing groupmems with [$opts]"
> -	local groupname=3D`echo "$opts" | awk '{ for (i =3D 1; i < NF; i++) if =
($i =3D=3D "-g" || $i =3D=3D "--group") print $(i+1) }'`
> -	local username=3D`echo "$opts" | awk '{ for (i =3D 1; i < NF; i++) if (=
$i =3D=3D "-a" || $i =3D=3D "--add") print $(i+1) }'`
> +	local groupname=3D
> +	found_groupname=3D0
=09
This should be a local variable too:

	local found_groupname=3D0

> +	for opt in $opts; do
> +		if [ "$found_groupname" =3D "1" ]; then
> +			groupname=3D$opt
> +			break
> +		elif [ "$opt" =3D "-g" ] || [ "$opt" =3D "--group" ]; then
> +			found_groupname=3D1
> +		fi
> +	done
> +	local username=3D
> +	found_username=3D0

This should be a local variable too:

	local found_username=3D0

> +	for opt in $opts; do
> +		if [ "$found_username" =3D "1" ]; then
> +			username=3D$opt
> +			break
> +		elif [ "$opt" =3D "-a" ] || [ "$opt" =3D "--add" ]; then
> +			found_username=3D1
> +		fi
> +	done
>  	bbnote "${PN}: Running groupmems command with group $groupname and user=
 $username"
>  	local mem_exists=3D"`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username=
\(,[^,]*\)*$" $rootdir/etc/group || true`"
>  	if test "x$mem_exists" =3D "x"; then
> @@ -73,14 +93,13 @@ perform_groupdel () {
>  	local rootdir=3D"$1"
>  	local opts=3D"$2"
>  	bbnote "${PN}: Performing groupdel with [$opts]"
> -	local groupname=3D`echo "$opts" | awk '{ print $NF }'`
> +	local groupname=3D
> +	for word in $opts; do groupname=3D$word; done
>  	local group_exists=3D"`grep "^$groupname:" $rootdir/etc/group || true`"
>=20
>  	if test "x$group_exists" !=3D "x"; then
> -		local awk_input=3D'BEGIN {FS=3D":"}; $1=3D=3D"'$groupname'" { print $3=
 }'
> -		local groupid=3D`echo "$awk_input" | awk -f- $rootdir/etc/group`
> -		local awk_check_users=3D'BEGIN {FS=3D":"}; $4=3D=3D"'$groupid'" {print=
 $1}'
> -		local other_users=3D`echo "$awk_check_users" | awk -f- $rootdir/etc/pa=
sswd`
> +		local groupid=3D$(grep "^$groupname:" "$rootdir/etc/group" | cut -d: -=
f3)
> +		local other_users=3D$(grep ":$groupid:" "$rootdir/etc/passwd" | cut -d=
: -f1)

That is not correct as it may match UIDs as well. This should work:

		local other_users=3D$(grep -E "^([^:]*:){3}$groupid:" "$rootdir/etc/passw=
d" | cut -d: -f1)

>=20
>  		if test "x$other_users" =3D "x"; then
>  			eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupdel \$opts\" ||=
 true
> @@ -100,7 +119,8 @@ perform_userdel () {
>  	local rootdir=3D"$1"
>  	local opts=3D"$2"
>  	bbnote "${PN}: Performing userdel with [$opts]"
> -	local username=3D`echo "$opts" | awk '{ print $NF }'`
> +	local username=3D
> +	for word in $opts; do username=3D$word; done
>  	local user_exists=3D"`grep "^$username:" $rootdir/etc/passwd || true`"
>  	if test "x$user_exists" !=3D "x"; then
>  		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO userdel \$opts\" || t=
rue
> @@ -120,7 +140,8 @@ perform_groupmod () {
>  	local rootdir=3D"$1"
>  	local opts=3D"$2"
>  	bbnote "${PN}: Performing groupmod with [$opts]"
> -	local groupname=3D`echo "$opts" | awk '{ print $NF }'`
> +	local groupname=3D
> +	for word in $opts; do groupname=3D$word; done
>  	local group_exists=3D"`grep "^$groupname:" $rootdir/etc/group || true`"
>  	if test "x$group_exists" !=3D "x"; then
>  		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupmod \$opts\"
> @@ -139,7 +160,8 @@ perform_usermod () {
>  	local rootdir=3D"$1"
>  	local opts=3D"$2"
>  	bbnote "${PN}: Performing usermod with [$opts]"
> -	local username=3D`echo "$opts" | awk '{ print $NF }'`
> +	local username=3D
> +	for word in $opts; do username=3D$word; done
>  	local user_exists=3D"`grep "^$username:" $rootdir/etc/passwd || true`"
>  	if test "x$user_exists" !=3D "x"; then
>  		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO usermod \$opts\"
> @@ -157,7 +179,8 @@ perform_passwd_expire () {
>  	local opts=3D"$2"
>  	bbnote "${PN}: Performing equivalent of passwd --expire with [$opts]"
>  	# Directly set sp_lstchg to 0 without using the passwd command: Only ro=
ot can do that
> -	local username=3D`echo "$opts" | awk '{ print $NF }'`
> +	local username=3D
> +	for word in $opts; do username=3D$word; done
>  	local user_exists=3D"`grep "^$username:" $rootdir/etc/passwd || true`"
>  	if test "x$user_exists" !=3D "x"; then
>  		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed --follow-symlinks=
 -i \''s/^\('$username':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" || =
true
> --
> 2.52.0

//Peter



