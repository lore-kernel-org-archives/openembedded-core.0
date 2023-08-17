Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1B7C2FC15
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 12:47:09 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.75])
 by mx.groups.io with SMTP id smtpd.web10.186317.1692276423793454116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 05:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=Wpi6Rq27;
 spf=pass (domain: welotec.com, ip: 40.107.241.75, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TY1fpnCb8/s9HGy3IvPNIdX+4lsORz/2tXoIMz/JNpiqKxYt3ZhGGtNqzxPqXA89/GXe1a82NhGppgpgJFwFQ6Dkp26feu7Kh+8UYX2/5Z0FlzYUY+32VJjY+NVSPVKj8jmQA/JYEQd0FbYb9jGcGBZL7FFHuottzRs0ejvLXl+UhA6MIm3BDZf5T0pAvYWPa4nSq9vNjd/Jmy7MgkPltnLVJmqUyaFbEtfN7KU3YAumdA6r75axYaLpy5lZDImWmljzB9uzumxd8n3pTCa6XFnPrarUxnAvgIzakTALf3+45z7TwrRZlbBTXGugzJRSpan4zsWribHsmmBnliBA1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m/0dvvqXg3Wj8yTZTDEa3xc1tO3vwBVgyQA18gnN6k=;
 b=cfs6zqKfQyyPgyc5b/91w+Yt4omt4MD+uiOJikVIWVgLPfdE3qPqZPdMk0A+EapCEyfIONhGkASnLQZEklVBvHy8mcysAvKwb7mc8SWo4y4uJPXXZ/6W5xLtZaMUiJLfM1K2xcE/ZmjxkLjKLXmA51cDkrFodLEELADIqRbhq0QWv2nLvmjfU/+k2zlc1MUGod5NeSzDTAFlYO0sTAHtWHR5KoETPDwhT7B3gVIZPJaZ/1LfQCqt9MZFtYqHcSfLQPrLBq5vG2uX2M8lCMYiO9W+9JSa7XgHG6liJT+DqpwxOy7QAoQ1MRQSqocg3n8BrDx5aJlf3TDNniLF0BiF9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+m/0dvvqXg3Wj8yTZTDEa3xc1tO3vwBVgyQA18gnN6k=;
 b=Wpi6Rq27Z+iCJ17wyrJ2EL5uJW3daLxSp1mhYFOR9VMT7tm46Nw/LkAsZQA1JLwCK4Qt6K/dKsBJZMMrlhmAaJKV9JnJlqklJrMhLYjbVVZ6+6dSrmdDJ1TJjmQQbYleOQJAiM6N9oebF8eJW3RwgH9Boi8r18jy124tYwR+ulySwMt8fqtme40+j3Ymuw6xgV0G5MG7K71xrue8gMa2nMVbzVMCrhqdGa6vrejc47futK66ookGm6h0l6/NjG9yRhF/kEnFvLtNLqCctjVEVwYH4n9ipChaHZXcd9UkNkpX8NPp1yqHxpEIJbT0rbmrJvqPGQ83xbJopNoFJCLMTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 12:47:00 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6678.025; Thu, 17 Aug 2023
 12:47:00 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v13 2/8] package_ipk.bbclass: add support for ACLs and xattr
Date: Thu, 17 Aug 2023 14:46:06 +0200
Message-ID: <20230817124612.1043464-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817124612.1043464-1-p.lobacz@welotec.com>
References: <20230817124612.1043464-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::11) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB9224:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d023d40-a61a-42fe-ba19-08db9f200c4c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7Y3M6l9wV3v5jZkZ4ga+f9stfb8SvAQ37PUjZKYbwFDXqN3jdbHUhDiHV+vqHsT1pZGL/312T/h3I/7VvjGJ5EjeAPL5Hy7gCzHThGSQ4a/acxPr8VdGp8Q8v72SyKzvzHqhI64V1wVtcSnv915RrPjJst6G/YOfPTm4arj8+s6/UrceoMe5jZj1tyEXToqz0YSiWB3GvRfnTYeC7vUeG3Ph1aNaw9ecD07BqaOv5v47sJGIqj4BtZaQ5Sq+iEORTi+xgkYtXFm0e1lDoOP37mkwsfS8Eb1jbtFEjkBofDGG1dnOJpzu5WOtEHCgKx2fooZ9h4Egz2FoxKtsMnYJZf6teF2MtS1X49coUcXRpVGVyqS1lCmIG5BvsZbPkcu5BG6cBoFIueFuW9D8gRYNQNk+vL4uxdDc/UfbX3dqI3h53codhizCHN+/V2QlA7O7mF8KsqGh2z0wLP88lCJcTeGbifXisKQUMM4AbHDRW6Y6MsY7JDNLqeHv8RAMezzrg3WYe8e8K7nVEDnK1QpEAdIUvSl1RPQkwJYPeUPz5bUV7ka1urhmLv747lC8d+HOHeqoS+nBiL2vJoyCZlSiZqfKmc/G3EwhGJaCwFM067w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(39840400004)(376002)(1800799009)(186009)(451199024)(66574015)(83380400001)(2906002)(66946007)(478600001)(66556008)(66476007)(6506007)(6486002)(52116002)(6916009)(316002)(966005)(107886003)(5660300002)(2616005)(26005)(1076003)(6512007)(4326008)(8936002)(8676002)(41300700001)(36756003)(86362001)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TRfCG2aqNgKjmbgzghkd5ODdfoyTYbU57l0J7CTjH4n1s/2Ze+QW5OedvOSW?=
 =?us-ascii?Q?vxuwuEUALXKGTKsPZUY0i86Gch2uvpXmKICip9/LUoFCKKjaDgKm4gLQH75x?=
 =?us-ascii?Q?PqIu981e87DDH8p+5d7AlsoYjpS/k1/nj4UVdYE9msTNnoO6GJH7nlZSduYP?=
 =?us-ascii?Q?oD23fwNiIs5GfIc/E8yG56z19Z2fE+1OGd2L+i0w3LoLMIheSIm9AwjlTijS?=
 =?us-ascii?Q?6l+VZFTodYPZ2GX74+WFwIsuLZrKGegMRvNDwYhCVMmCK/IBiaDAENZRfxRs?=
 =?us-ascii?Q?m5Jk48W+J3eNDS5Ybtbc/h/w31mxjFdKhS56j4TXX+2o4J8TB2xcXakbfmZS?=
 =?us-ascii?Q?zRg42FXirS7ZuSEGcZxdcFiReLSH7mZaH5trrC8d1+SkJi0ArXyrgeb77XT3?=
 =?us-ascii?Q?5dlC56RV9ubA2pv/ikmTf0KsdVttRz23/nm23d2JdokTt3vKoI373tBhWANA?=
 =?us-ascii?Q?0WRAZC14OQnOJ/h900YKD9Mgp0lXAhYkYweQXVG3Spu3Tq4L4Bnh7YE31/U3?=
 =?us-ascii?Q?dH6dZUtU3xv1/m5efaTtIH9QnX2xqBbXtpQwWsgAt+NUCKLVjTzwSVqjjHIA?=
 =?us-ascii?Q?9gHvSUOwRgaQJLGtOF6DJxB12uELcL7STTKatoemOqzI52kPIHUiVCP7GIGk?=
 =?us-ascii?Q?C2gp3WF1IFs6XOYET6rrrptFmXYH0lwFpEKrarO3OTi0A4SM9L03M2P4kqUB?=
 =?us-ascii?Q?VIYXkh0D42GBtb7aMq5pUDe8bYocPTYN9zwMualiRIJMpgyORtYMDhu1P/RX?=
 =?us-ascii?Q?+wYgi0sYeSIrStax26rgybqCgwgzPAEzww8VwGqnfbs8lj0VN+lSeOovYxfY?=
 =?us-ascii?Q?Ab7eXh/EjwyLGgQC+sbMZK2d7b04YzpEPnSjL6LMTzB7YhGEIaOwiE6RQ616?=
 =?us-ascii?Q?RQKVugySUNNJ98EWs2T1l7AWmbcWOFvdGZHLPy9LOsAp3Ow6Rf0hAv/J5aw0?=
 =?us-ascii?Q?moyqFeAPc5BGHMqU0GjO9WTHwUdJuvNsaHG/AR6yf63eXq8epOHtOfg5S8Sl?=
 =?us-ascii?Q?JkqWQ5oxjDGvBUzXNIbWRHXySe0foAruhOSt5S1Nq8A5b717GQKu8o1g5drz?=
 =?us-ascii?Q?N6bOPNa/J1EcBrPUZOtv0tsM/kzGZJGRO/rqp5au/dhFh7KtH4DFuBDFerop?=
 =?us-ascii?Q?L16NcoTeOSjoWzycdiVPIJz6T3cCMKSgIb5nfUzs49p5HtqIuTUFWVdKRPo3?=
 =?us-ascii?Q?gmH+V85qVDKzb0shLBjCKnwijJDoLi8PRILcOu3zpsjb7jowuIIcbstZculM?=
 =?us-ascii?Q?KbDZMidPCSifVK0Wd6gEJYq+9pFfuKiPL0mnoh2RMNEqzUsC6uPKMbz1lXhB?=
 =?us-ascii?Q?ZfgMVD+pWzdkdcxJKhSEtRppWVAXnjxSUeoEjqkedztmmXmh+ls78TPtNJEE?=
 =?us-ascii?Q?9fpSmSExBkSk0erjsa4ArBt/pEb4k+tMrFFCvJS5Vm/uHmC4aazyKuues1FA?=
 =?us-ascii?Q?hgl1cz4gyobR1niWYHQw+9m121j+LI4LiKPDTomJxtfvxq9pxFlm121gmcwP?=
 =?us-ascii?Q?WgroViUr/l+mExCOeuac98eGvxDKik5uT4WsfMB/9Ev+7Gvo49Td6DMH+1Xf?=
 =?us-ascii?Q?QIMyDMP227Uz7YjhDXd3OZyuNZab7JqcnA+kjPYI?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d023d40-a61a-42fe-ba19-08db9f200c4c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 12:47:00.0508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhEA0OdMmznrjMR9BrM5WPuEzp5yNrnOmTJZ6nd04r5OQSRiA4RISD1szKie60uKq+YVQkm1PMcYSeMAzrEu3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9224
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186307

Extend OPKGBUILDCMD variable, with additional parameters, depending
on target distro features, in order to support ACLs and xattr.

With fix pushed to the opkg-devel:
https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
opkg-build is able to create tar archives with ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/=
package_ipk.bbclass
index b4b7bc9ac2..a0f106e4ad 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"
 PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
=20
 # Program to be used to build opkg packages
-OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
+OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.conta=
ins('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_FE=
ATURES', 'xattr', '-X', '', d)}'
=20
 OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDA=
TIONS") =3D=3D "1"]}"
--=20
2.34.1


