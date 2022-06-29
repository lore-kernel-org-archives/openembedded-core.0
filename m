Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D73C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 11:38:13 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.86])
 by mx.groups.io with SMTP id smtpd.web08.10378.1656502684171505357
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 04:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=KJbb52wH;
 spf=pass (domain: kpit.com, ip: 40.107.222.86,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jl2aKd2/kDCOJE0EwUJ1tTx+rKmcFORbijl+h8YH76g+nmi4gIrwbFPwKjQOvFQvrkF8FxoEVLUbBZgrxXH1XItujN2P7a4v0CBbN6hMAu7P5qzQTYSdQMnopKXh2DnfO4B49J05YFj3GehgzuVdUVgPJE5225MG+EERGlIy9j29uMwqzNkZAYcSxOukbn+W2saNj+yuZSy3sbJ0QocbXyXW2EDrupRKX8eytXEMlAex6EL/zkI/ayFc5eKSGdGEnx4R5hzZntUYgKWNJoM6A6pTqD7vO4Q0T8vsf2eW5nk2iy7F6N5dNtMR6lUtBmkj56H28rVpKeOV5s02PFssOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zmQKml0bH6EDLFOb7vhHj2mhQJeXuIrEMynpC0YY2Q=;
 b=fD2FSx4dT2zFrVSvWE+gfk3YmWc2JKBVnegwSec3oh6+AzqghKdKOopwoNNRiHA7VwGH77kJPxwq+PaKWo+HsmjDzSmHolC67qF165Z9I4qCcLHslLL8h5HOf91+W+FmvM2POSvpZQU58dDLVWcZ+5qOca39agEbZcl/WepBJTQGuMHo1bFXTkfA+o/Gm6l+A7ml20dGy6cz4499zR/PeTj82aeIUCPyfYSMqaeoaAuSLyitcrBSB0LbtILAowhWeET+MKtCA7qrP2z6mdDBCvLJSBF2qh4mnCpDf5WAPhibPdEAdyLrFAl+ydGofBI1HVoruflGvu17fwdfc2c3Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zmQKml0bH6EDLFOb7vhHj2mhQJeXuIrEMynpC0YY2Q=;
 b=KJbb52wHxeDYsBJOsQgMGa9MGRk9YctQ8QiduC7sSD9ZiqkoKFBKvBu13XS9x2BvNCqfIf2rQ6FvXWHlVLGYNjBkwCog9GFKIcIQL5n9J5Yb8WFHhYOam99uLkglTdKWJXR6d4AqGE2vur+6HeUdhHVTfLJjleu476LxujHEyVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by PN1PR01MB0814.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 11:37:56 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e%4]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 11:37:55 +0000
From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Subject: [OE-Core][master][kirkstone][PATCH] ruby: Add ruby-native dependency
 for nativesdk class
Date: Wed, 29 Jun 2022 17:04:59 +0530
Message-Id: <20220629113459.8666-1-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::13) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02e2b298-3058-4fe3-d44c-08da59c3cf06
X-MS-TrafficTypeDiagnostic: PN1PR01MB0814:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ODvTA2NEFHpcWU/dZUQ8cvCs1uy9zYwJSchJoszF993HnDFXBBYy7Jzwouwhb8feZwOzzF3dMb+dny0Qa4y/oLogyh8e/FIseH+CHNH7HEnIIJh8YafTRWWReykg/GQYQZGQxQkafa6B3GooZnQ09RZYbIeIZfs8YHVZoPji6h/dcHIPrV9SfZBhTses1mWzNzm2iWMvkLn5dc9eZOVRmRP0y8cyBbGf0H5P/SggkKNOw3TYiLarnTq5czlWQfoUaX11VySOtbj8mesY+pMDGrRAW92aCxt0XODWVXyFfDdQF8h1GceKunW4lOCr3xI1i4c798fTuKaMb4DpfmZjdE4+nJNnu/tf+zBmouWEgsrBB64Js2wMJMG81jvF5CXHskOqVKVWvwL8eIfYsA8twl/PeoS9ZXRLNQ00VIa+91YZJGK38pw2ZI+uYEDqsDkxD1PScF4BXK3nJFo5++qHL9JXBIr0mv+5urFistTK5C5JLwfTMKzTDbv7EEn36Gs9Lo5yiFQbJbjcmaH09FPwH4fWR2RgNg7B+OYWfK9t+Bn85l+bQk5ToBnaEsi6X6JROt9588abH2fl4VrEIsSJaL2F8NjajsHVlITvY6+cRWPFqP0tNbk1lVesa2KwqrHeczNESCCb5MWmnKD661YYYFhpYeAnm2tvZ2x+6g/C0nMHd0rPQuX0b0EsCFTROIMUWcdu7dgdeMD6TUqFd3Z76zjC4aLAr+Wqpyme19Rm4nNnnnYzGJ4zl1EML/7Kd7EoR+SumvQy5I3CLTMbZrUZEIxCPz5Ah67Qp3Qq9W5IPORthkB7SmiI5Y5Z8Se/Rm4kEe+uDMuStUrbBXN8brKT8Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(44832011)(6916009)(38350700002)(1076003)(6486002)(2616005)(38100700002)(186003)(316002)(36756003)(2906002)(966005)(83380400001)(66574015)(4326008)(6506007)(86362001)(5660300002)(52116002)(66476007)(26005)(8676002)(478600001)(41300700001)(6512007)(66946007)(66556008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OnGgokd5BXgyIT8cWnmOlBf6UjgIZJny/F1DowQv0wBixNjBjMeIp4cRTI1r?=
 =?us-ascii?Q?VMbApUY5UmgTK1H1Dxx3nyavIkEITkDllJo/qnZ5boqCLQKGOlQlicp1E05x?=
 =?us-ascii?Q?62L97B6/aBs7i7P5ICLZw/dTpuJUAmtSJRc5kIzMZKv0ffkIynBE3MGD+jrE?=
 =?us-ascii?Q?AjUhf9udaK6UYGzT0vKhCSDCvQeQTtxEIBi/wNOYCDRA7hdMIF+pZqs/nWAD?=
 =?us-ascii?Q?6BAgjHbJ2nyhBnzmIFKxlBfx0TovsysC0BkKudo4v3Nga5JyfNCVyU48T1jA?=
 =?us-ascii?Q?1WViKyQQ3chSiEkdpt1V4xgOZ8nY94va2AcoeUW82g5VvE0sWEbN2L/UxXGI?=
 =?us-ascii?Q?1qo27TOcGDFz3g3kFzg0oLyCIaavc6Nb8m/pmIOtp58a/65nKHxWq956pw5N?=
 =?us-ascii?Q?Q80f3oZ1OiFjLPS+waGMXj9CAlmuxfUs3y+Vg1ez4FxZ9p1gGsFclC70FjvQ?=
 =?us-ascii?Q?ShtmdJwew0YQfl3zlGd0L27yUvSZTf3VTOP6RBLZoavzLSHpmRtfjzIJNYxt?=
 =?us-ascii?Q?0mnBkuZt8IUia1VA7V2b+4zM489g+pw1KK+xzusbDNP3xBDrFjickVtwaWPe?=
 =?us-ascii?Q?cmX29PdCSvmpISG/MWSfjNG9Ai/Ry21KCKasfyNL8GqmG0kugjrPQEvRuLNW?=
 =?us-ascii?Q?H+rLRHfK5sruVURdTrgy8QstvAi4IzclaKO1Rly+47TlCJQ6TctgypBFN73y?=
 =?us-ascii?Q?yCHZce9z2VmjySBBZpGywc0n+Eh8IiQeVcPfXOEylH4DKGra/0kkxPWvnfjG?=
 =?us-ascii?Q?+oM8BlOnm8QK0f8C8y8VjONyqX4U98B8AUCSJuSllfDZe0FQqqw6XK3xHzpQ?=
 =?us-ascii?Q?wzhYhEB1FExQ2ymiN6JhKrXGoZrMdCsM2KtUGucmPC1i/lRZioCfK8IUMoCl?=
 =?us-ascii?Q?i32o2IuaU5tI4yEiLnIf5g62saWuEJNqUT4uX+7ygchDn9P6JtjdMKmCdf+q?=
 =?us-ascii?Q?jWwxYJenBiP3dXoVjAD+d2Vfz4q91lLAKHjQ1mACghGKa/mrp+9US3TCPHGv?=
 =?us-ascii?Q?IBHv7kYncyPN/wYDY4yhPg2YJo/0/nmf4wop0nIeAed5i/9NgmsFmaM5Qi4O?=
 =?us-ascii?Q?Qd6uO89IzJOUCYB0om0cDHJGZBQAb5KHXuI0xv1F0yFMpE7B2Ib4tIVKc4V/?=
 =?us-ascii?Q?hbC9m/ekm0fuYPz0Ps10VanKGvWzOuzcoYJ6thR7eNlbo6ZGPlu6nyPgKSdi?=
 =?us-ascii?Q?4lQbYCCnvuwfWl+MBExMtuWtvpv5oiG0iFdiTEXRKTY9OdKwH225ISh0CSrc?=
 =?us-ascii?Q?kMvbc5w5CtIknMzIwkt8ILn+njC4YDdoGSQAB7JXiMQMEiGrBgnBHNSIK0QW?=
 =?us-ascii?Q?R+aTwpuFowhvI2uqMZ4uBGt9FofWLhzClizaBZizsusVWkiTXQspPt9ZyG9X?=
 =?us-ascii?Q?mg2OwcXFeI6l7+00kH17PRy4SLu4gIm3nvUTVkRXotjiqTkZQwu+dkHB/bM5?=
 =?us-ascii?Q?30YcSTfIVCiV9DYL7v4iyktLr1ZqqpjDhq4l80B8c231noiRXrdIhDg/cDgl?=
 =?us-ascii?Q?klOVlD9wgMNXFIpp12H7XHipyMsglPhpYqv9thhhIoKVq0PsPgrzZ00Ezjho?=
 =?us-ascii?Q?YK5R/moK1nE893tqiVZrJBQqJ2hnfc5yv40+m2bc?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 02e2b298-3058-4fe3-d44c-08da59c3cf06
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 11:37:55.7247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xtA5gNIIsteDCWBWeymka80hl1vDobi624k9dQTZ/xCR77PTVLQ3WY+ksP6VqVH5dpJ2DEj8DMbcp7djEpSB3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR01MB0814
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 11:38:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167373

We need to add ruby-native dependency for nativesdk class too
to fix the compilation issue
Earlier this dependency is part of DEPENDS variable but the below
commit removes it from DEPENDS and add only for
DEPENDS_append_class-target which triggers the failure in
nativesdk-ruby:do_compile task
Link: https://git.yoctoproject.org/poky/commit/?h=3Ddunfell&id=3D6060b500b9=
52754c595fdf5de5de35c886e0e1d5

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/recipes-devtools/ruby/ruby.inc      | 1 +
 meta/recipes-devtools/ruby/ruby_3.1.2.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ru=
by/ruby.inc
index ebff5efd1f..efa40331e0 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5b8c8755986879=
6979806100db3f3805 \

 DEPENDS =3D "zlib openssl libyaml gdbm readline libffi"
 DEPENDS:append:class-target =3D " ruby-native"
+DEPENDS:append:class-nativesdk =3D " ruby-native"

 SHRT_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI =3D "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.ta=
r.gz \
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.2.bb b/meta/recipes-devtoo=
ls/ruby/ruby_3.1.2.bb
index 38ba46731b..a9e6765939 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
@@ -104,4 +104,4 @@ FILES:${PN}-ptest:append:class-target =3D "\
     ${libdir}/ruby/${SHRT_VER}.0/*/-test- \
 "

-BBCLASSEXTEND =3D "native"
+BBCLASSEXTEND =3D "native nativesdk"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

