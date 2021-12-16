Return-Path: <randy.li@synaptics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B239C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 10:39:12 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.78])
 by mx.groups.io with SMTP id smtpd.web10.9129.1639651151879420406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 02:39:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@synaptics.onmicrosoft.com
 header.s=selector2-synaptics-onmicrosoft-com header.b=P9YqIey4;
 spf=pass (domain: synaptics.com, ip: 40.107.96.78,
 mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMrRiiFp3a6LAmNXbVl7pMamuNrg06zaN8GXGTVrNLCj8827UmvuxwjycApOeTpBII1VxehCCND/KrzaEylC4Ep9Yn8GMZR8sPCSGzo3EsFpYY6mC7+l7cSdopfwE3Ue/ddjqhTgKs5R2TkkNkpOfz8N4w4tOLhFVA1o8/LL5tp2viMZL/RKQMTPy++xzeILNbbW7PgnQwRRHkXcit25rQBOcCQu+bVAz6h4GFQF/nefSs0y0XWI+rjdSafnBTl6Nww09txsXaFgOkWnPgQSJoviQ29Y0pUBSswGzQ7bedWOdBz+QxG2IQbd6RTXEJK5/6EfFHCFGHhDXxymRVy+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDGXOvtivnR5v0LZxxNNP6gwL1SwLNK7fIuI+qz88bc=;
 b=kBSCq2ymUszjQNIzQx0izU7QDscOD8h2yrUvboP7lRmnmX2HXZ4+Be/2JvCYtWkKDG4dIgXzCDBR/gNCvZiz2LBl5k8s2aKWeood61wn1Nj31BjYhROBXbk/TYf0J+I0b8brpMUd7+w0IZ7wE3yJET9ydslkzkY84FLYfqeNNyBEefQlBtk/FoXxTRVp27MI1MLbm8Ps9ZDZo4pHTjlKQPFj6GX5iRLmCKR+DkUQWfvJYktCa6it5AKKawKynrv53HfH3Hy5/6B0j3Gs8mtw1dnt5XwXpsktSRGenNoRTG4ZNte3Ss2ThIMoZO6DmUALJd7Ff1IeVD5VoPckUwM1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDGXOvtivnR5v0LZxxNNP6gwL1SwLNK7fIuI+qz88bc=;
 b=P9YqIey4iiLxpKck2+4fXyzB70s0771uw68crlXdC96jGyuVTEC2K52D6KQoYjId2GeUXr64Tjc2i5ewZhlkEfdHxiU6kIelkgTzH0uUSAeOr+2gZveU0Hj22LTO7uWFmkQp2SXp30rDRR2qq+WhiAhZ529dR8YrqHjut8frzg0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4745.namprd03.prod.outlook.com (2603:10b6:5:182::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 10:39:10 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::6cc3:f8bc:aff3:f665]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::6cc3:f8bc:aff3:f665%3]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 10:39:11 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: openembedded-core@lists.openembedded.org
CC: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>,
	Randy Li <ayaka@soulik.info>
Subject: [PATCH 1/3] cmake.bbclass: support android os
Date: Thu, 16 Dec 2021 18:38:44 +0800
Message-ID: <20211216103846.718910-2-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216103846.718910-1-randy.li@synaptics.com>
References: <20211216103846.718910-1-randy.li@synaptics.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0042.prod.exchangelabs.com (2603:10b6:a03:94::19)
 To DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d8e0c94-2a7f-41bf-8f87-08d9c0804baa
X-MS-TrafficTypeDiagnostic: DM6PR03MB4745:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB47457EBEF233A971BF35D90986779@DM6PR03MB4745.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MWJorEPhhm2VZlOuCR1ieSeMBuG1+7lURoQEBuP1jqgWxxiOmWoOP8HZ+kpXeFVG5wW2i+BiqjwjjuLXbzkYvgqSYdxn/WocGwFOMl16F4gsXInAzNXr4r6mHr0QIQp/5lwtq5QxTQsr99ZIoeuaA8s8PZ9P2RNohz24hMXC3wmxkIeIdbiymaGWy0EtOXeJzynfJEjXWvjjtBOlJG0uXoAl0OIHBfM0INSLZUlEm4NeQe1EYv4lFOfx5OXVw0qhUK4kLvV5r7QZUHh5h6ycqxdz9q7vF1ewDlNU5TePlQMqww9qY+ldVbGGhJW2fT6skrGbsjr1p5I2PounC0DzmAm5Tk4mIDTIqnP6oQ0ece55oKSWIQFu1cNaEwH6AobljhukVNxCu+zNLyadugr0NJkGJlMfy/QkglQX6NierUNsB+wL7o2/SRcYK+hS5glRFqznlkEUx7k77ukcw9jqYvi9uToLsT5wJEHxyPS+f4xLCuFLajr00MWMeJjlhiUMweItNGxrUlUBjjXriDp9Qu9AZQ4cUfH4FyaKk5uNgElMM0MM22Pdz8L9K4lF4k/oUxBgaB3D+eGcal2UsQezsVowBk76sFhdkoewGj+VJTDTTS3uPNb5KgTc3kbTlsoA8KyFxpAzC3pLzLW0L7jESpEA5y8eBJOKf6YyMWj2UnsIayiUJ6vkn8DBWS8vPijC5jKNeHAyO+I1X3+vfXpjWQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(52116002)(186003)(2616005)(6916009)(36756003)(6512007)(8676002)(2906002)(66556008)(5660300002)(4744005)(66946007)(508600001)(6666004)(8936002)(38100700002)(4326008)(54906003)(26005)(6486002)(66476007)(38350700002)(86362001)(316002)(6506007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QvUiPXFhqGJC3Dk3hktvvbmnA6u8A+5z+3/tEmTg2JgH61jBTER0SKmmrpax?=
 =?us-ascii?Q?hx8QqRjdc+207P/LzFTNb99ClXf3VKGHw50AP6e8FqHkrfm9wHx7wcinmMdP?=
 =?us-ascii?Q?4TWxBFiDG4azIMC+e7P7uBN5vvwIrDf5508ZDjEWiBc47HC7DYjIQvVnpJgK?=
 =?us-ascii?Q?UdRT/pgtB/MppMAHlUhQ6u+WaK3pmV0R9XwYX6CWXB9dizccKkhUNDT7LWdn?=
 =?us-ascii?Q?PpPiHwN51mlpxnuc2ar8t2pMOJ/0xeoHdru/DgVr54R7PoUj7UoRf89ei/uJ?=
 =?us-ascii?Q?tZ5x4JTCcIpJrXuZjOdsrHN7HKmpM17sxFYhjJNFy0doJQ7JQMMZrBbzxHbC?=
 =?us-ascii?Q?Y2oau8eXhC4+dgNOhX8DYYzDjnTKJ1MO5f02Le5xz4gwh7e+DtUPiEqdXym0?=
 =?us-ascii?Q?qasgTP2Q4VD37CsokvvJNBxCoYbs2BAF40y20piNjdNTjVbyYHlkuHc7kwJD?=
 =?us-ascii?Q?VUrNpUgb1dHH5CkGCvfXul81fHWwu56wZ+slRig3xhq8NZTUAE3TGcuIu9Pn?=
 =?us-ascii?Q?bhORU0LHzbkLHaaB5K9eFO9WtPFZbal5TqYy2pBwZeCh/3bg3yYFEZChMzIC?=
 =?us-ascii?Q?il61kgnUkzzhHt9tsZaPjBYtbjzHAwz9jFNp13qqMbqMxBgPPePZabiaCJnZ?=
 =?us-ascii?Q?deudL6Vp6B96W/N4pwH+fhIqdL1x7mVQJVFd+zI0g8D1Lj+hTIdziDz3RyKc?=
 =?us-ascii?Q?GA6ZgBNz4eRVYBm2jYY1ZHtgS2aReSeoZKGQclNGfDJR1R2knWDPeEpuf0L9?=
 =?us-ascii?Q?XVIOYxKu/i3MepzD7QR2HylWWbzAWqHlKiBgTWsGRa+RXAFXZfWog5TRFQsD?=
 =?us-ascii?Q?BnH0HSnlYf3qOSaZW0W4cZ33fMPeQFY56hP0PwJ3xV4vzCSqcBJwySRnMlTA?=
 =?us-ascii?Q?sss8HLCoFkoaoS1jXauJ2jP8nBFQVGw+KwObBfUbd4WEK3nKHE5OQjG5/sR/?=
 =?us-ascii?Q?Uy7xyGQMdpNoqBqPuA24ONzSRW33ywTdpp7BUCcOn4daEddWtHFG30o4VYlW?=
 =?us-ascii?Q?D5T2QRsFt1FID2sV4sLKynRHgJcBRz4/88QorW3mf9R5JZbFTnZtJCzoqSBs?=
 =?us-ascii?Q?9xh5OBuzOH9RVITMyT1hc4sCJR2kfrOwEZ9UJCrfPiG4qACaiTnVOrZl3G5e?=
 =?us-ascii?Q?Yh8Bk5BawhMDL04tDdeD8BUrTdKfuIx3WlG+sjGjqHeHwuv0/GvL9q3Q6isM?=
 =?us-ascii?Q?bF3FAeAONfpmrP9rH1ooxPzN5YHnW4IiTzXy2TutBQAODHaTFvTQKY1Mj4nY?=
 =?us-ascii?Q?Ua/PQdZTu4FXpbLE7cxj0D2C4V5XjqQl1smN5M17OX2qEOVE5dfqCivI/RVR?=
 =?us-ascii?Q?/O6cDVJ745EdpohyLRLLzcHFdqAkNoiFaYa6A7GnqvtLq4Cdo9m3cF1vlU5i?=
 =?us-ascii?Q?7Wl85Bu0cirEOwiDskA/We6JIx1tocfJP+JiVzRb6pQjo6p2UqvA6joMqgi+?=
 =?us-ascii?Q?LBoqqNqAtca7ujJNEdmhWHZ+7FASlhCjNm3LsH2pHhsFHehiH8dyaY2kxrYT?=
 =?us-ascii?Q?W8InGsx4cPqpHhzLlMvR50tJp824hMzJJTI1yuOKPSbzGtc5pyYc6Un2remX?=
 =?us-ascii?Q?NX7YtPCICywL73qwCXBSj4Dos7Yb6/YdYR8bVJo403lR6/8Wgb1XOxVtIO/o?=
 =?us-ascii?Q?aZoYdGcr8PJD287Fr9Re0uA=3D?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8d8e0c94-2a7f-41bf-8f87-08d9c0804baa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:39:11.0263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ig3S2A87zbqqI60+hOPnRbvkGUmMVBV1JaZVjOUWXymFykD1blfplgnHnRR/BU9LeCO+BT4e64/y+ksu4QLFJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4745
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 10:39:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159777

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

Signed-off-by: Randy Li <ayaka@soulik.info>
Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 meta/classes/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 92b9197c48..40ae4fba08 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -69,6 +69,8 @@ OECMAKE_TARGET_COMPILE ?=3D "all"
 OECMAKE_TARGET_INSTALL ?=3D "install"
=20
 def map_host_os_to_system_name(host_os):
+    if host_os.startswith('android'):
+        return 'Android'
     if host_os.startswith('mingw'):
         return 'Windows'
     if host_os.startswith('linux'):
--=20
2.17.1


