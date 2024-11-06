Return-Path: <Fabio.Berton@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E52D59F5D
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 18:13:18 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.67])
 by mx.groups.io with SMTP id smtpd.web10.53124.1730916788333388880
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 10:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=cNuYGSKl;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.249.67, mailfrom: fabio.berton@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WeTSyOCWxpA0gcTj2Qp4Y1nSwQLgj7r2/PMQfdwAvXR08HvyVn7CeVv111F1cXNTWCGevnUUxNuYJXL7ZCobJsMEECJy3b2KAwGT0TwZMxOZmNFq7TQH+TPCzjKoUyS8gXr0B1o406YMda+dazz5FBXDVFWlB5O+omDz3XUSXDmlam/i9Mdc/dxh84tJ96IHMvELh1Tew3se/Ei/i4S144yCLxAQ+gZ1Nt2Hr+/6fmG4oz4EZ57BRm2Thigzk/KGDXmnQh71JpN79wqIdnQvCogs3QGbkJ67KvmHRWe8giD5LM0Y9Fo/XM7bilA/JjkG7uS3jDbBObiFcW92OoPgNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvrvoNHndt8Ys6o685RDdbVO9aWNeosMswHFV1/UURs=;
 b=rqPvMuIet5x4L61iDHHdJVam4nGfp6pFYARhT1wlQt/sLYyYkPXJtlLCS0Tx9RAVGJQsTtEXiiI+c4rUk6LoKtI9ZnSjxOKnheltKJQKSHEZ4GA+yp6e1J5ynVmk0iSB/9xm4eYpp2rrQtEtpqQMl2UvLrapmQDVq7G++41O7uqn8F4K5/cbPF2ZWHmPtVe6QhNITh0AGFOvm98HEENEMiKvL8zZH9VRPzjpqFcOHqxDT8EuZT9EPXIVj9hBsK+Iv/OK0fHxq+vw9rPI3HxpSJv4K2/Q/14wOy/diPCqsiwdLeuFbWMj5d+i96ICzwxK9D3lW9AJPJwhDptgZTGU+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvrvoNHndt8Ys6o685RDdbVO9aWNeosMswHFV1/UURs=;
 b=cNuYGSKlc24hdNpdpSUSX/OlFi20P/f6eYdlM8I0mvUMl1vGmRMt3Va1EHmjVvE00a8oVvkFYT+Zfc6XXegE2y6l23qWQ+Fgcsjyi/CKZF7quE0Vbys5/MnxrKogrFTMa5TcUryOnSZG68NoiRiJCjDPG9OZQJseQlYx4QNqFuLFsxs6xXjv8sqRh+pUSl3HIy5VtnyxIdu6hmYDZsjLMxnLkjmuwtjn8TKxSQM8YR+C6UZbEm2Ck5pgIDQ4dVL+cetN636ZV+DMc00mbbxRl7UY7dJrdQSD1XHQW1sGDmOKMFVoWFyQdF6YCD7K5BluScOpQnIj/GTmdNhwZRZ3FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from PAXP193MB1519.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:13b::14)
 by DB9P193MB1257.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:257::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 18:13:04 +0000
Received: from PAXP193MB1519.EURP193.PROD.OUTLOOK.COM
 ([fe80::2afe:37ed:c243:3543]) by PAXP193MB1519.EURP193.PROD.OUTLOOK.COM
 ([fe80::2afe:37ed:c243:3543%3]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 18:13:04 +0000
From: Fabio Berton <fabio.berton@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Subject: [OE-core][kirkstone] pseudo: Update to pull in linux-libc-headers race fix
Date: Wed,  6 Nov 2024 18:12:42 +0000
Message-Id: <20241106181242.1250615-1-fabio.berton@criticaltechworks.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR2P264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::25) To PAXP193MB1519.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:13b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP193MB1519:EE_|DB9P193MB1257:EE_
X-MS-Office365-Filtering-Correlation-Id: a943d962-5e99-4d0b-dd3d-08dcfe8ea861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DftW98NzN3Qnpxw/qQzBnEIob4qZ7CYgWEiQAUMR9ARp0yBmSsvw3cHB6e7B?=
 =?us-ascii?Q?qsOQfOSesYHUx27RSFs7iueE8WGzCIlwatAZHjetb8pqMZ7LOwUvTo+q+vp6?=
 =?us-ascii?Q?/hZJvaqAVzfN/MJ7W20e5nLEEC7wX7/ZAmxvnr7Wvd8ZFnLkYptTzzaV9iiz?=
 =?us-ascii?Q?cuE1UQxiON6mvwtnTa1nc1ZgAIg7esbnXLsTcvSghFZQE6vO6Qm7BsCC4XjN?=
 =?us-ascii?Q?wFk9pPhM3gXTbUevPlzNS+0soY4IPWNRhX5q1gabFMoXDnoy38YCflqD3hi7?=
 =?us-ascii?Q?kTk7Cp9j3azTG5ijrMAIjfMEnYoB5oSJYa4yeEzQEnpWzXYghWnGDyKeYrcb?=
 =?us-ascii?Q?WLMcuIzvUJZ+NsNOXLSVEn5NvFaDMqcvMTNDrXamMLmmGIrv8KY7jbHFt2qu?=
 =?us-ascii?Q?qiJl1k0VXnwj5VN9o+IPnTF9JeeQwyJVFdM3LcPJk1zReqTPzHICmLEZcF6s?=
 =?us-ascii?Q?TUYTW+zmbdGJipnD4Ee4YZiLj5XtEx2vcoVOCoh2WPkseRpTGrYIbDYdVp1d?=
 =?us-ascii?Q?imTspuK20Fz8FpGe1qInTJ9TbFrClpUWv3R5Pz6EADgOWjEM/RnhBe8TugjP?=
 =?us-ascii?Q?h+6r1zYGYIA6avBwxJcXQPiI4U3UG89bGX/9AhsKLPpdSnGmKnBy2ym3ydr+?=
 =?us-ascii?Q?wXSD6sgcRV9PVj5F4K5xB1woxlh430g4uDnIs1zoamDQhiUtfBTjrHq7jdEh?=
 =?us-ascii?Q?cojFopi+2qVZU3K0c5oYINRf+kFXGHJOFRn6JbpFvNUgR+fvjfPxNsW/Q1WF?=
 =?us-ascii?Q?aHgVBjxXcWSQe53o0dinmgqkEaEkP0rWPcH+r+as6dOx0AevoM0A7td8BX3L?=
 =?us-ascii?Q?EaF4a9g0TK7ygM46EsPNXIE2bCIhCEUrwZZXr6kz5W06njcNr93U005M62li?=
 =?us-ascii?Q?gOJz6Zyxm6Vb+Gxx0mgeMxUDMpfM8xH2kjOYCbr6mzrRBmOYaS95NdVo7eIL?=
 =?us-ascii?Q?1SoPQz3ywlDgivHBIfVAs41UxELlduRruFUXVJLibMYokyyLVyQOY6rtwIUV?=
 =?us-ascii?Q?UeY8Mhj6Q2vWYJW6v55LGFlpZPgfk184VpBqNrtIkP5RLCK1+nq1lTslySX4?=
 =?us-ascii?Q?voI0b32hVv8l5qOgWjX7g2pfwqhAt7GiyKIxRM3dQehxQpOpAsyWS4VdJe9E?=
 =?us-ascii?Q?owfwVtNSVrnekFPdxzBtRLxtRYOyx3bfcj8+PQuKRsZQI1CAKEApMVJZ5I8s?=
 =?us-ascii?Q?vXmuc7dtoXMVh20uNkEB9u9lJqmGLCm1GadCIpnrmfcBa/LMtqozr9OWmIaF?=
 =?us-ascii?Q?sJvZDyYa00q/8iIPwd0U+co2wdJm4DDE/whc1hi8cFQuMqGsal5M5ik9rM4M?=
 =?us-ascii?Q?7COWdybL7CgA7k27YvHkNNu7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP193MB1519.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G29OzNdyEXiMroRLctIXntMt1hscr0/4CvcPM8Uhc3B/QWrqbZ3PJo5/Ctop?=
 =?us-ascii?Q?xg3Ljd/qXq4ZN6UaOCD8M/+qHQFLLb3Tfiz7zTNwEkhsF+j1/IKNY6jQ93Uy?=
 =?us-ascii?Q?LjCT9Hi7oWI8XFQnXTVbocNvv8EOVLpmwNwLR7s7EC+8u4VMzexVJD693Xu0?=
 =?us-ascii?Q?4NwCFoKTpBozulBHqh5u6/B3Y2kqpzNrPHacwqh4QIxRbSn0lXGdfqY81qzj?=
 =?us-ascii?Q?6CuuCREMfssQW2liyTG1kHgdueYDmOzQppYkQGtFxfCpr19mVOru47dbq5Yo?=
 =?us-ascii?Q?13+ewQzXwt8aMlFtgTZ5Me4ctdU1huz9tJnIVSXPHNkmrPdQSDsYYQPVNagF?=
 =?us-ascii?Q?Mqn5kphtUsPRnr0XnS6tNzFUFNRbu5AjgHXZygFOGfDo2/2DB6UmvIQCfW0z?=
 =?us-ascii?Q?MLnsRB1Xxjd1cViQjQyq055jBhVSpxpmoKLarEq93lj5wCNguPwk3XcjVu02?=
 =?us-ascii?Q?Fl6vax3nfZFh1+vXUCZjPfYGRrFz+PWUp3qTSMEHc980+LR+oH8vcT1RjkKl?=
 =?us-ascii?Q?e4HJ6U6YqVQyA+PZg0+EYi/dXz25p4cuj2P6gSef5mi+xDroS+LU3hG3E8Sd?=
 =?us-ascii?Q?K61y8M24B0z+518Fko3NB9G9ckExaRVWQ//NXwXWzJvfCSkSXJDN9Wi9lQh7?=
 =?us-ascii?Q?vDniEk7v7k2gZpehPycXv6oWQuE53S3rsOr+okBZkHK4uAwNv5OMMZwzHhZb?=
 =?us-ascii?Q?wntmnCa3TdB70KHVZ1bphhLzIiSLluzm1YmhbFqqntGAXB4uddFSmFDPfOBc?=
 =?us-ascii?Q?qdFfM4NKhmbiunZTSpLXRGShvBDd2upm2BY0BtMCHZ+uMchyaE5HsBK1nUX6?=
 =?us-ascii?Q?Z8iRMEy+BTA5jorqojmhGbN9ZklmEAf3CE9MYfcSCvRCfH4oe1SuK5qtTScH?=
 =?us-ascii?Q?T9MkHAPEAC3JauFJJcV0uWdrSWWD6LGERv0Cdjt88vF0yYQWkgzUUBBFq5x1?=
 =?us-ascii?Q?9ZMxjsjYgDOb8y7v1PLi51K8VK63mE142Wclt7PCkP4MSvnbg0oaaYhjZRzA?=
 =?us-ascii?Q?guUndrunmeO4qkG2Mc/rT4sy3CQB3dyfqkce7jrHmLOI17Y4rx+QVWGC22jV?=
 =?us-ascii?Q?ZRXkExbaMdaxSGVpgDsZBTDm6PjgwY7re2a5qN02F3RiGoY96ixjckUuhs+D?=
 =?us-ascii?Q?d8IIkDcEewiLYmsN3tXk2VYgZOSCvloXle35uk2xAZGK5EgavCGVjGVxlvCh?=
 =?us-ascii?Q?AmcsXEQ0O4co+vWDcROdkl5n6092M7lD47qpqrtRrZ8Altd2Pbxc7lyf5ejC?=
 =?us-ascii?Q?wTZtJYSsXkahtwFIt1lZsn7vrGEVN3bKKxou753V0AWXUqCRqhwTewvtJ439?=
 =?us-ascii?Q?//Rtl+Bn8OP5m3TNaujbOAQw3l7BP9nuRNSR1VqZbMuvqiUjsxsxXg0k3JAt?=
 =?us-ascii?Q?hrilBPeM8XnKJol5kBaUPzg3kHVzTWE2Ke4uadFnu3tfcVW/uvluM2JAsOtn?=
 =?us-ascii?Q?RV/SwbLGkgT0x9NQFDodscACpOQt/q3ey74EtEa9YrN9otMKKpJFocUp3OMl?=
 =?us-ascii?Q?DHf/Yodg44hflP+40MmblkufvBrHgNYB3p3Dn1v4vcTARAxcp5SXrn1OJZ6u?=
 =?us-ascii?Q?J+WcY72S3s/3l3lSEI4BCZ1MBV+3ybMpW4kLYYDZ0xRqKRFATcwtJokXVzoA?=
 =?us-ascii?Q?QSOw850+5lCaGqBkhtc1WOw=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a943d962-5e99-4d0b-dd3d-08dcfe8ea861
X-MS-Exchange-CrossTenant-AuthSource: PAXP193MB1519.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 18:13:04.5133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duXRcswrnMudzk5N/4PVzU0XLO3FvOrqtbekCotttKlQTcdCtnZjvRL4sHFvJxWq5xXAbFTflAw+lFWfAWiv3bCYUwvJLcWcC9gELeCtgGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P193MB1257
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 18:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206796

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to pull in:

    pseudo.c: Avoid patch mismatch errors for NAMELESS file entries

    In rare cases we see failures, often in linux-libc-headers for things l=
ike:

    |   INSTALL /XXX/linux-libc-headers/6.1-r0/image/usr/include
    | abort()ing pseudo client by server request. See https://wiki.yoctopro=
ject.org/wiki/Pseudo_Abort for more details on this.

    Pseudo log:
    path mismatch [2 links]: ino 46662476 db 'NAMELESS FILE' req '/XXX/linu=
x-libc-headers/6.1-r0/image/usr'.
    Setup complete, sending SIGUSR1 to pid 3630890.

    Whilst this doesn't easily reproduce, the issue is that multiple differ=
ent processes are
    likely working on the directory and the creation in pseudo might not ma=
tch accesses
    made by other processes.

    Ultimately, the "NAMELESS FILE" is harmless and pseudo will reconcile t=
hings
    so rather than error out, we should ignore this case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4f30a1a74828e105cbe69677b3fbe5623f371543)
Signed-off-by: Fabio Berton <fabio.berton@criticaltechworks.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devt=
ools/pseudo/pseudo_git.bb
index 4dd9156238..6b0cb598e2 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk =3D " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] =3D "ed9f456856e9d86359f169f46a70ad7be4190d604=
0282b84c8d97b99072485aa"

-SRCREV =3D "c9670c27ff67ab899007ce749254b16091577e55"
+SRCREV =3D "cc1f6167cb5065daba1462056e2dce8ff72aa855"
 S =3D "${WORKDIR}/git"
 PV =3D "1.9.0+git${SRCPV}"

--
2.25.1

The information in this communication may contain confidential or legally p=
rivileged information. It is intended solely for the use of the individual =
or entity it addresses and others authorized to receive it. If you are not =
an intended recipient, you are hereby notified that any disclosure, copying=
, distribution or action in reliance on the contents of this information is=
 strictly prohibited and may be unlawful. If you have received this communi=
cation by error, please notify us immediately by responding to this e-mail =
and then delete it from your system. Critical TechWorks is not liable for t=
he proper and complete transmission of the information in this communicatio=
n nor for any delay in its receipt

This e-mail is environmentally friendly, just like Critical TechWorks, whic=
h lives in a paper-free atmosphere. Therefore, please consider the environm=
ent before printing it!

