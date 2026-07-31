Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BD0C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 11:59:46 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4843.1785499179701172212
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 04:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=z6CUg+MC;
 spf=pass (domain: est.tech, ip: 52.101.72.61, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtkOThHeyl70bSDHz/hlewAjNDKG0/eOXEDNRYRuAeG00Zta0Cqq4XdUMCxftlUB42I67XMA1i5/cnJWwCNDg3t5dgMoQkpT6sSjq8+i+SBwq1ouUyRPuBG8Oe/gWDuMiaZ0JCt74Uk4uYeV5qk9zexQL+Jv4odliYHHwqYTSWf/jyuwiR5eSI1NfBRs5ED8Ta3sLNvR9eXCZ70mMKoWsvXgV0yLzJegmp2tVGz4GMM/2s+BVqbJFNSpAi2psZRQNKjF5qkI/Ne8sD7D2m2N3xADUgeWVP7HqPdn+MIeQUc+Hg1uxh8OX6DfvwimcPFzrUVlWMx4s1VeY6UCR1fRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBCOZG/ol3mjOzBBmEqmJpVsskXISCbESmknPb8UQs4=;
 b=Z3HBGj213NQrqawiY3dS85jaZ2XyXiVYt8Il8HKuqpG11rhHeCf27RhHR3pNM7t5aF2v5a1zS2jv/cju6W4aQPZ08tzrLP8YodLSxT+h1y3Ini+R513vGvWeKDcC0HWoVh4lS6nrrwr37m6L0+3ohX1rFuEjRSP/JIS5xD4TKKmxYJKzusrvVK+kmjF2F1hehwha0b9TIgNGXkfMnmhSI4hh7dY/zUQogT73o4L2cr2KyizKBHPyC0/fRdrkL+kf/VO2w+OXJzxU9Vgpw0710mWmy1FAtfWhqyW+hJcI45v9bEo1oCod1Crx84vqotnf1BQglDtYgMekm/mg73LbZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBCOZG/ol3mjOzBBmEqmJpVsskXISCbESmknPb8UQs4=;
 b=z6CUg+MCz74Wg2YXDVkL3ENl6ltkKfrEaDyPcQBMhAs9fvF2gY82kgZL88+QnuT09u5ZCCdt7eGNH/nWqjL2KmixQihgWq+rxrxbVTB/PD1WncbEdUG/Od+KuuHEe1+oVC7h2M1oXZdoCTAn84YNV6xhWMlfPYTMKhbd0Xnr1fR5jRS5vD0lKaRQ644q/Ya372I7kHvhf3Vf2Efv1opoYTAUUHrOSOaU2G1r7t3Eqn9qa3wB4TZUuWcHJiLZftrlLIXLPfca3sL07gPtUcANizBgJHoOz8NbOY7FX7UuWGuAqra/nxDhlB5sri7UWCBaWtzmMFNMlo6p811N0k1+DA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by DU4P189MB3374.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.11; Fri, 31 Jul
 2026 11:59:35 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0292.010; Fri, 31 Jul 2026
 11:59:35 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Subject: [OE-core][PATCH 0/2] coreutils: fix multiple CVEs
Date: Fri, 31 Jul 2026 13:56:33 +0200
Message-ID: <20260731115649.1402336-1-leonid.iziumtsev@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0342.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::26) To AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:2ff::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1731:EE_|DU4P189MB3374:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ccc09a5-1a3c-4372-2244-08deeefb3090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|23010399003|1800799024|376014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Gy25nlVSgLyUTmsH3MMfcQVdVU0hmXqvxd5cubL52RNrI1YZuM0MovyQfkAzZFw4rTuNfcnKNudt+dz9NxZsV8kTLIkbTNfKEC8gv9kbZNY2blCKl5Q03jd7x5PfGVkVy5Z+0NnZwN5ipGtOo3pK0v4o/mbQoS6T0Aex2aS9sK87U0Ys6haOstGI3rHLFtCxmcicmwErbEEiIF4LqFDD4DxnfN4qelOrdh7+MRK1NQlt0RSvp9NUsMm878iUV9RnmCskbPVJXypw4cnI3O4lKv++jvQXgQWT57Xfv0hp+pgXvanhK5v+MbLYFWqqdAuDBL9qvIxgBNgn1mEZr7Owdc1y8QUo4CBifThlnqwxwEV4JlgA+Dtt40Ew8l0x8fpEfppo7hS4hodH8bawgcH8K40ePaSRBPO4a683CJRg/EX+btApw6QQ/jEUA65pk6E10ArWSjC7XaUxQ5P0cCDqxXlm9RxpguJ5OvpvGUKqe0ouenMTHZJp6iYIxqNVt/661Qdtz0ubz9INKhdC3s6KpQyUA9sOQ2NnGa0uQgmKLtcczIsvnYl0cu1LEh4UDtParuvAegf3brfPXjbfjTHXgYbrczAZPdCGchECZrz3IY3uqocTI+DV4hEiQMNmEMP1AHTVZEiT55QL6g6YImoNDgx8iMDciDa2zGfDK8Jer3o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c+MZS4d1idHzzcc1yflX8LwVLoogBSofApiChy/j0BJFsHGf0AmycKTblALR?=
 =?us-ascii?Q?U07LbrNp+0pX3/AAg2XsLBZJjYqovozUhXD9GGGyP4ELTUksBElI15nPil8r?=
 =?us-ascii?Q?Pq2usjsE3kl9L03CVx18MvYoyjDYPU6CjcGy2J+h6kPH6Q8IIOHv7sU9uiBW?=
 =?us-ascii?Q?t4wK4o/0lRXpocBdCymkwfLkrfBR96g13wU5GYM0yXtxUlUIGZWkKDKAzK6v?=
 =?us-ascii?Q?kO8mmBUvANCStaJuAWWV8uowZfd2JLdtJPdFyBS8aPdoyMzUqSfTwa4UW+Il?=
 =?us-ascii?Q?EuEmq6YOHAwGtDxq4zgnnm4nDzxrsIarKXPFyeZxSIGLNcpS0YSQV2mC39i8?=
 =?us-ascii?Q?JJfrEdNzxbDIxB5SoFodhBsnH+tYgjv07gooyGKD78BUYztokLiOGHKHVRdo?=
 =?us-ascii?Q?J4n/lV1nS+iLPUdG/8a62GuQiJdbYyi2jixmbztJ2Vc2UHMQRhK+GMcNSQCT?=
 =?us-ascii?Q?r8BIAhCVXOGWKtZhbalCGryFniKKNd6cL8CjzIkSarIK68Aj0p3tEgVDLfIW?=
 =?us-ascii?Q?VK8HRsaQOz4fJCFJuKUL6gaGrlYg5y34/AKY7mVPXMZ39YhD1tYBcGzlRSYZ?=
 =?us-ascii?Q?XcWuvN5tVYFBo3imQXpe2Fr7Zi4m1z4G7kX3fKtkwL8uTYeGLV7oLxj5DAgx?=
 =?us-ascii?Q?udZ4sP6JpEx9VJXuBPs4/wYXnWS8Lqlk0W8WQFQjImjMMXWbU/L2sVU5nRc/?=
 =?us-ascii?Q?yDxSthcTRCY2qQGHxT89TSJZt6AG45kzvumgBjuba3Wnb/iSFmTkwM4oqMm8?=
 =?us-ascii?Q?fG0+L0ctWOHccKx0/RW4hmKOMfAblF4VWseNayzKJyyLCoYJENJEwpBzESD9?=
 =?us-ascii?Q?ydL9ua/1l3DYI/dVXpz/VsYq4XQB/La6wYrwwtBtltdvjq7zMr6Gyx4pIyQ8?=
 =?us-ascii?Q?k8/AR+e7r6AcmSwzdkhiXRiKyzFEoEydZR1fOSN3JiEPkQSwVl+utwuz1HKn?=
 =?us-ascii?Q?gwo0txHdr7crr9IqH6kduFjpZoj1pY7On32SLahBda3r0fzZCfBNTuNo/yFd?=
 =?us-ascii?Q?K56V7UyTxtWxSsRHYq4yBuxM9ECIzooZj4ZwdxhoohihfAnzWU4vTQ2/wheQ?=
 =?us-ascii?Q?32HRHYEZFrdYFoepXG0a+gjOzecolRb8e+jCjniIpXOssSAz9g8a6j3VKtyj?=
 =?us-ascii?Q?KAKcNYrZ/Gpg3SzuyMlex3DLjcjVeHZ33bHethp9BANcQjn6q5qjIFzHjKJX?=
 =?us-ascii?Q?GjbOr0J7hMrK0bT8AeMZclvxhTwmL2tEzpG//zbDx0gVYuwo5T8eYUryB6Vf?=
 =?us-ascii?Q?QaP4nmoUUxPlcjoN928U/lmqunVY6bLjuXSgIvi7s/JJbto/Xx0sMi+mRDsM?=
 =?us-ascii?Q?zg9jJPSfCBw27oLVRXpIHIM3409t8ivSoMBEd756Oo4UiuOL/Ej9Wu0h9zgP?=
 =?us-ascii?Q?lQhYZNp7RArvoXDI9tqIIcHHFV+H6JS7FPEp29+5dmxccXujxoqiLwnELeqL?=
 =?us-ascii?Q?Hgstto7pXD3Y5gUKWq38nKiHmhaRMGA0ixozof7Wx8vgnjGmBnso73WxIqKu?=
 =?us-ascii?Q?EmwColScOwcWycwb59COFYU2ZL+dNHvDR5tdyPvZLxODiUQbRFn2FTNl9ByN?=
 =?us-ascii?Q?OTAmrFp12oGGHFQWDr2HjyUPO5m+a6oRIW0H9vm9JL7VLW9VOQa4UKTuE1+Y?=
 =?us-ascii?Q?hkhsx0zkiEG0//uL4ASFxuxc1oUoKmW2bGIJ9Mrv9fRL9lKMHcJWQX+4goeM?=
 =?us-ascii?Q?Tlp8GHUbkRSIjvYC3OAUG73pX7MsevEtzTNhEztrgpQk6jcv8OubuilCKB4W?=
 =?us-ascii?Q?yZ/hgyIgQTRKr+4ctLLykhAEuTqVD/GPKqMxugthGgR3PJR9Vj1AJSn6Y5Nc?=
X-MS-Exchange-AntiSpam-MessageData-1: Ot6gcqTI4AdEpwjfUSOYwbGNtzjRewIy8rM=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccc09a5-1a3c-4372-2244-08deeefb3090
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 11:59:35.3113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tig2uxsGAkYVWKw5G7eJac9V1geV+J5skfKtqFfDIXrUY4J/BwxC1YygNtpTsXt+no5bA8D+ZyfbQuU3s49BednSExPpo7ShSj5Iss1ZuOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3374
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 11:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242431

This series backports upstream fixes to coreutils 9.11 to address
multiple CVEs.

Leonid Iziumtsev (2):
  coreutils: fix CVE-2026-56391
  coreutils: fix CVE-2026-56392

 .../coreutils/coreutils/CVE-2026-56391.patch  | 66 +++++++++++++++++++
 .../coreutils/coreutils/CVE-2026-56392.patch  | 65 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.11.bb |  2 +
 3 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2026-56391.pa=
tch
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2026-56392.pa=
tch


