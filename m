Return-Path: <yclw3d2y@live.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D659FC433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 04:37:46 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (NAM12-DM6-obe.outbound.protection.outlook.com [40.92.22.12])
 by mx.groups.io with SMTP id smtpd.web11.7394.1633581464704108016
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 21:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@live.com
 header.s=selector1 header.b=aPmSU9xv;
 spf=pass (domain: live.com, ip: 40.92.22.12, mailfrom: yclw3d2y@live.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLTAxP7ejlMYFepfrnF/OqFU87RiNcPFbi3yT6NSmP6+oeQcpol3o8EfOpbQGYWYfAuFNsxyr/bV3eNvg3hBj9AVAtzEnIG0gZiOSKrx2l03/DuYUY+cJkm71ZJ6MWuvJf82olqcry93nsup/11hRHYnpJMBm+WyIqEP8qdZ66tGw7XuevPsbAVTjzshF+x3MJ2kqMe94VKTQpFDoPzbzM5M3MnuHiQR+gn1YrfKMxibEpiLOn8uz5b8AqJ9bqY/eF56UDLKgB+RZ1qxMJ9zX/1kXFv3MjG6oYPfsSAI1WZtaKmHKUABG7oERwSASJbOJSXAvJpEGxkrJthRyC7neA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvUzFDF+NwI0ogBYYd4mnMVfKOSXu0jWfe08pKrNCUY=;
 b=G2mwlkcp7kT5a5M678NozdQdPvVR/TuccemvmnBzWWxwQdirOuyx7YQbv/JM3ZiflRjxkMMCqAt2A86veVaDwhycYesvC3XsB/5eSkYEmBU90vUfmnG6OSxCzkaEHFtmRDIcztgZ0kYXEhaYZVZeJAT8NneRjXZ2FNWh06ESCtJsdx8Y4kMwQw+C6K8s7X6uXEsEc5uQ0omnLI30Th8Aa+uhdKAhm4ZeYpLSaP8ezNnbz13hWOAKnObrVyJPwsoCRhUDQxF5P2VOouyaqb0vtZxLcYUGLJzZHVnTrMwFMy0DecmruBRzI1ByfFGnt7kXTM7WrV8KwJ9xWywS4ICTeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvUzFDF+NwI0ogBYYd4mnMVfKOSXu0jWfe08pKrNCUY=;
 b=aPmSU9xv2p+TVHvT+zGlnDm7wf0XVQMcH1PdZHWtpiSht/pzEBPDTw4w4u/5FmgceFR14nN3145LmGHwr5EnxlEHxCgCtHYI6iWiWH1s+afJfzN2Y0nrejko/xck80elS80OnJ4gJVUxkpULKlUS3/zyfjfFUFjgMGE+AYjKo1/3x/YPgGZNLKXatXclRomYEFl3mium7JRdskqAVJQ1Rz463psA3y+VJiStZJPSrPwtOqf/jb2/3rkaVDoz9WsMUZkZ8OMoO6XWhjj4sB4e209wdmiqcgn87g722SRJcYsew9MqACaC6uuBdwAMX4IbYWL1ry7bGkw7+aSPjhZBrg==
Received: from SA0PR05MB7210.namprd05.prod.outlook.com (2603:10b6:806:b4::21)
 by SA0PR05MB7210.namprd05.prod.outlook.com (2603:10b6:806:b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.9; Thu, 7 Oct
 2021 04:37:43 +0000
Received: from SA0PR05MB7210.namprd05.prod.outlook.com
 ([fe80::744d:9d80:192a:12e2]) by SA0PR05MB7210.namprd05.prod.outlook.com
 ([fe80::744d:9d80:192a:12e2%3]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 04:37:43 +0000
From: Fred Liu <yclw3d2y@live.com>
To: openembedded-core@lists.openembedded.org
CC: Fred Liu <yclw3d2y@live.com>
Subject: [PATCH] glibc:drop libcidn package
Date: Thu,  7 Oct 2021 12:37:12 +0800
Message-ID: 
 <SA0PR05MB7210EA2CDE60DB957CFD0F65BEB19@SA0PR05MB7210.namprd05.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [iYoHeKx8nDOCuG8aT3DGysC5Vu80b378]
X-ClientProxiedBy: HK2PR02CA0214.apcprd02.prod.outlook.com
 (2603:1096:201:20::26) To SA0PR05MB7210.namprd05.prod.outlook.com
 (2603:10b6:806:b4::21)
X-Microsoft-Original-Message-ID: <20211007043712.2805-1-yclw3d2y@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-0Q80NBP.localdomain (101.86.18.58) by
 HK2PR02CA0214.apcprd02.prod.outlook.com (2603:1096:201:20::26) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 04:37:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d515044-cda5-451e-37eb-08d9894c33f8
X-MS-Exchange-SLBlob-MailProps: 
	c2lCoQNu4IBlDzLY3bbma5stwMJfIX9zvHqFn3PvUAbr8sZtBmRCWW1Yel6sar2EcGJKPPCdBjzDn0dcItbCtCuk5rqQX6U1ni+9VjDPq0g/IMIa6QTTUiYOoP51epAiq+00Fj2MJFQqufkv/NC749CYh8vbkz2Y7tPC3OJkQ4gkg6anM1t+bgU8xxRuTli5Ot0QrotZFX2cgTSV5YK9xn+WCG6wFUVU6+whUGp9PcB2VROh4v0MHgvvrocnf5U/Fc84CyU4fLAIDnbYoG91vQY3WWN4mF0u3hQRLLK4xzRqH02rd239aWKbrS+FQZMJipyeaGxlcFYoAFUFri9ZbrZweCMWg8EegF6/+4cj5Wvo3HhZIsdYZpOnQKNLYuhoWg1WDc96ncnW5feeE9DV+MAb/o/BqhNaKo0ZPzh0K+PYV8xfZd6cEZQaF3Ab+DV14mtpMhiJPG6nzscyEGlrKT0nhpVXVsMj+x5MYN28JSgWjzebZ+yCVip7VtTijss3z8YdEbeN7NWRpjJNPqsThckJsMb5vsq+F+7KgEmr5VHZS0eA1mUU/8XYpfoXGZKaBgVkOvRUDlCQqf3dNEUURTjR5DcS/rnZh98DqwTvxFRX1CEnGB7F1zDWYHDly0X24dhOR/ISVL17q81HIs8TyTlnhe8nMg4fdFjRx6XFWRDVi4U3AzdBHs/FB1wKgMRvgodWC9cSOE91ijhZ+iN01ern86Ip5xMbs7KiYtnfImg=
X-MS-TrafficTypeDiagnostic: SA0PR05MB7210:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gglCdTuhVVwAVAGv2VOHbpI0+WQ/Xoe/RVrg5yjdVK1w13H5KmIlJksZcf05CkA/w1y+COqKnhaDBQCLj0++Msr+BK04N4oKPa3XGbBXG5YIzD5uOyPLvZLDQrhc6KB9H2NDfN/AaI3QxKbBYPWN1f2xr4QsYP6QCoKvLpy24yJOXX0cXX7/0bWKnHDpli3gxsa/w8KebMvfigNlLNp/SzIJjz/tq84CA0MFWkkEiLDerdXUGHYZA6sBKBETkW/S2vDWpjZyZELlneaq2rzNarg881gPf00nbNueqayw6KR+Hcuhy8ieJCfpf/7DDd2vc+bgnPTnWcIwUB7NrEj2wvQYFrQa8z8h2PhtxnOMTQZ+/Ou/N8g+7kx1CYPIwarOYIsVy439P93R4LVJlgMDmixrqv+azcNz1BY7kzGaRwM26g+BpWr0rMCFARZ40V9t
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nTWzAb9pxgU6Xd7HfUw1bH38YJQ65lWvfPdfgz5KBzQBAKq6YvOKfLLmVJSWssGxLjg0Gub1nsBKnWxWGDclyRfHuDd3wjl0LXKvg6PQgNQXVQyFpTS8xQmzmc2NYvKURVqiFj7TCZ2ezAw7HK9Dtw==
X-OriginatorOrg: sct-15-20-3174-8-msonline-outlook-e6bda.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0d515044-cda5-451e-37eb-08d9894c33f8
X-MS-Exchange-CrossTenant-AuthSource: SA0PR05MB7210.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 04:37:43.3813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR05MB7210
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 04:37:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156705

From: Fred Liu <yclw3d2y@live.com>

libcidn has been dropped since glibc 2.28

Signed-off-by: Fred Liu <yclw3d2y@live.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/=
glibc/glibc-package.inc
index 601dedb9fa..571ae7ae09 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -1,6 +1,6 @@
 INHIBIT_SYSROOT_STRIP =3D "1"
=20
-PACKAGES =3D "${PN}-dbg catchsegv sln nscd ldconfig ldd tzcode glibc-threa=
d-db ${PN}-pic libcidn libmemusage malloc-debug libnss-db libsegfault ${PN}=
-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-sta=
ticdev ${PN}-doc ${PN}-src"
+PACKAGES =3D "${PN}-dbg catchsegv sln nscd ldconfig ldd tzcode glibc-threa=
d-db ${PN}-pic libmemusage malloc-debug libnss-db libsegfault ${PN}-pcprofi=
le libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev $=
{PN}-doc ${PN}-src"
=20
 # The ld.so in this glibc supports the GNU_HASH
 RPROVIDES:${PN} =3D "eglibc rtld(GNU_HASH)"
@@ -29,7 +29,6 @@ RRECOMMENDS:${PN} =3D "${@bb.utils.contains('DISTRO_FEATU=
RES', 'ldconfig', '${MLPR
 FILES:ldconfig =3D "${base_sbindir}/ldconfig"
 FILES:ldd =3D "${bindir}/ldd"
 FILES:libsegfault =3D "${base_libdir}/libSegFault*"
-FILES:libcidn =3D "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*=
"
 FILES:libmemusage =3D "${base_libdir}/libmemusage.so"
 FILES:malloc-debug =3D "${base_libdir}/libc_malloc_debug.so.0"
 FILES:libnss-db =3D "${base_libdir}/libnss_db.so.* ${base_libdir}/libnss_d=
b-*.so ${localstatedir}/db/Makefile ${localstatedir}/db/makedbs.sh"
--=20
2.25.1


