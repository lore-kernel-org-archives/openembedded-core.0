Return-Path: <benjamin.bouvier@ekinops.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0381EB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 07:21:48 +0000 (UTC)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (FRA01-MR2-obe.outbound.protection.outlook.com [40.107.9.110])
 by mx.groups.io with SMTP id smtpd.web10.16181.1688628106667478254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 00:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ekinops.com header.s=selector2 header.b=ojwJAb95;
 spf=pass (domain: ekinops.com, ip: 40.107.9.110, mailfrom: benjamin.bouvier@ekinops.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0Jq85x3/UcK4PhtgK+tEhlX3sikGKXlC1o4f/mZZkrz5W6O13idrf0otO1nGuVwiD41Ddg+FYtZ5PAzj5gcRlyq5OBviQuu6p0sVSfobRAMbqTo+GZ9NcUZvH5+lBRz5/UEHcJsCdnBqi559eO1qGIEUXCskTsno1IKtT0vUTfnslKt3qhQEU4Ys43STb6IddIQQyCg99rpzvG7WvJF5KSW6VsL/AWinkQli6Z0w/12RLyjpwlQKRc73d6O30LN0A4tcRQxepl0i0lrl//wFvxd3lk2tK8rkQWPb9VO3+JeY1jgyCfSVVkWlCQvlk/JVApf5ge4x/uejlr0DW6Nfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iH+qjCWb8J6pvht+DvXfBt02873TmJN4rkqICHE7r8=;
 b=NAxu+MvlpqrL4LnL1YYmmBrgocZQf6DMNN+BBSbrav5T7jd1WUcQ92u5Wz56XuZoaQ2sleFkNjm60IpL6pA2FUbWiw3Nw2lYSk0j7mL9JwNcDtFyDz/F/9SCXcA4CQWcVSmlScvpIm4Tc8ArPfz4iHKdJQp5k9Y+EucQa3NGZhF8GXnEo7M8+STtbSH84vVNfn5nbWaYQ3kps5kOzl5VY5twmhC4biqpOX+hPFjDiuy3R+oaQDortsCaVEsymmTzrhGZtRTIP/tcyT/t2HSwJVZzSkLm0gSi1DuG48bI7XavE6SUfeAUX/a8BOOMKKtoXv138dmJg+EaI5Zs0fOHNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ekinops.com; dmarc=pass action=none header.from=ekinops.com;
 dkim=pass header.d=ekinops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ekinops.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iH+qjCWb8J6pvht+DvXfBt02873TmJN4rkqICHE7r8=;
 b=ojwJAb95xvCXKSG3nKQf2f/n/wUUcV9EBLgdATWxSOAZd/3MfmrSCzVQDb2xbfrhpH95SYnlmEBbwkR++0tA1Jgbd1FCdUffqAzNMbkPfUaZmrEwdqjIR2GIIn77uF2evAQN7hpyf+gfggjmae7tKUpE3lYA+uHhu8++yC0nx1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ekinops.com;
Received: from MR1P264MB2945.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3a::11)
 by PR0P264MB3292.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:144::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 07:21:42 +0000
Received: from MR1P264MB2945.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cf4:a271:8570:890b]) by MR1P264MB2945.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cf4:a271:8570:890b%4]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 07:21:42 +0000
From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
To: openembedded-core@lists.openembedded.org
CC: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Subject: [PATCH] util-linux: add alternative links for ipcs,ipcrm
Date: Tue,  4 Jul 2023 15:18:44 +0200
Message-ID: <20230704131844.176876-1-benjamin.bouvier@ekinops.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0161.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:347::18) To MR1P264MB2945.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB2945:EE_|PR0P264MB3292:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e9b9840-f25a-4b9e-079f-08db7df1a5f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pKfMfTpZgP66nSe+NQNgoNy6G00Mz6J9BqGgiMYMuwOE+QT/8MtwaLaiAO/uqfz59QPPEdfH8qJ6JRfhxYjGo0J19Jx2pbFwR/Qh9GaOANtBa5jj5IMkwG7XKoS0O9XgofZ/0yn2yEfdu764VjY1lAufXVJ9C8Y2qKd5HU7/a95V+JVMVkKgTDAdnXkWswDd1NLVPPlcd4GMfZylfoA7swWOgT/HBYcpcZKnxJsM7393r02K5TcxxKBHKIzGzdWFBTb8nU2mkvFH1nkRoeaeSfJpHTrudJwTizikzsPrtEWGXGWankdPpOcc5yy7c3AxjTvT4q7oX6RDmQf7HZ63iyYbNM45wWjqreiE2C3QOqTnUSfKcUjEh49Fq7vq36cJmFV9tj+CCrHLOravmVxmVmf5NAJjY3sIYhmIj6/Kz5IdV+lTQc0HhRo6gTjlFF9cYD/Q2EwL/eN0C1uPcKHGAkeKtdcIU0oOsNX4IaumkN//szvVOEXgTUHc4TmXZm21Q2tdM0KrjYm018ERLIhNHRMAODfybGls9ByG6lsK7guyXEJSvlicMCsQwTIN/8/n98NXVv/rEuAD+e8gONehs+Ufm09N5zhlo9mww8c4DIR3/j3tMf8xx9/6/wqhc1mT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2945.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(396003)(366004)(376002)(346002)(136003)(451199021)(6916009)(1076003)(38100700002)(38350700002)(66556008)(66476007)(4326008)(66946007)(2616005)(186003)(86362001)(52116002)(6486002)(6512007)(36756003)(6506007)(26005)(478600001)(107886003)(8936002)(8676002)(44832011)(5660300002)(41300700001)(2906002)(316002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8Qk3b0RwijBMrQr3Y5B8vssAROzVxibsfm8B3Mq9fj77cGzB+WMGJKXqYzd+?=
 =?us-ascii?Q?3r6pcabQQ1zSk28+MTyEK22WFMB3AHSIrS6Vd+FHEtgBAUgckZSnO3sTJVsj?=
 =?us-ascii?Q?+gGsdybKWQHdvJKaxNkVyE90BFJOBuYBuLqwkPI3ULcimxs6WG8pGZX/3AY0?=
 =?us-ascii?Q?cm261QDXgd09ePENWjD9kMGa0peR3FtI382RyCh0gBysiAi8wFou9lKMj2Yt?=
 =?us-ascii?Q?1hF8v4/4yreVPm2fQYBE/uD9KZaK16LQuC5wNTgh09xNUYweingKDq62p97Q?=
 =?us-ascii?Q?0r7onldsh7urDCKC81tYSWaQ2uABc+z+RQuavlgxUnNuWASfbwrNc/SE9gB5?=
 =?us-ascii?Q?EA7jdexOmLiwC7ICO6S1NQzv8dTVIsk1vSK/3xVwmLYk2KJp/XjDqzNvJfco?=
 =?us-ascii?Q?hGAmL7Wc9CrB70WLUzMFeOdaXZujSuqDbAnsxrSTMH+d6xwIVlZi5y+NYXrd?=
 =?us-ascii?Q?CAhtUeipns/TWhD5GvoRIikTO/8WT+SilFD9NKix8PH+zf1ZPpYKeuu4/LdW?=
 =?us-ascii?Q?4MsZQoOiAJ+amclkwvkkIWA3aLV1LNseHG5MJR9ww/ItgYuSHftLhCRUDNZx?=
 =?us-ascii?Q?JTQ3wtnENALkKwakkfmhS2CyllBVCwiT1UjaTlrs5apxgKE5i/r+N6DAtamw?=
 =?us-ascii?Q?VIg0lUU3XPRwq+bzjZX3wVlFekMWzS2ObWV94nllXRST8Ra4hEw9sdNDwlY7?=
 =?us-ascii?Q?eYZZKU6ly+Ek2lOx2Erlfwdz6zKqZWX0iV+z+OGMQdumfWEYT8wHA9HFI0IZ?=
 =?us-ascii?Q?fz1URlaqw8sNl0VVgI//M06Rr4Kg+X1RCZNbZ/OH8+m7CaDVmqFD+t8gBcNG?=
 =?us-ascii?Q?2eXmrQQs91poS3iTQb80uWcgyvj0pUTFmBsecR2zl/16RUi01LWOk5L7ZJ4E?=
 =?us-ascii?Q?yhHhGtOfBXvEFawAu3QFCX+HcVV4pZmxvKEToj0aXD4p5oKNtHmKWVT/X3qo?=
 =?us-ascii?Q?2lN/fv20hxqjTDy5+TuYvQNqmkygtGZfKd3M77PxM40SfVBmB+HVr3LOXVAr?=
 =?us-ascii?Q?7lA76vpu9dTWlHR+nSbFZ6ttcovRfDB64PNcksLVhHqdtWaPEwdOkkYe5+eG?=
 =?us-ascii?Q?rr+f7/gH9N6VgIXvuJk354B6X/SOu1xvc8I4oIciwF1xfiSHp4Yxeoi3hAbD?=
 =?us-ascii?Q?I3d65Q2+Zg7P2C2t+ctVzorRX1r0IjrZeOJ/GIF1xlx29jDGaeAlNGeHh2rI?=
 =?us-ascii?Q?qRphu+lNm8Kx2yz6KAr3t9Ru5arEuBLAD7bX73HWuyYPdzExpqsuGDaQ5Odo?=
 =?us-ascii?Q?VNn/MUO2sPV7eAa5k0Q4Rl+vVc8vRTqLFHi6CsG+B8H26dekvfLvsbrnrLB4?=
 =?us-ascii?Q?VPOWqiRQa6RcMqb0teTKRfLwvW51TwqLGCouLRU3J/cTQ/j2pVAeUDkC4/ca?=
 =?us-ascii?Q?wLp6h/mGffdPLZ0jSuv2yzq/rt4doquNNM6gkkt6aFlaGov+9YnSqYvvziJ9?=
 =?us-ascii?Q?JUZ8nYLvwcMrIdpDnLf6gyVFE4KPudtDsrCieGsLN9IMptp9/1hBIJ9J8BIa?=
 =?us-ascii?Q?vRiHAOLSZx+rDdp4gMYNvcKERdML+48Ms0DGL6sTjiXeBuzhmUmJ6XD4mihK?=
 =?us-ascii?Q?B6Zws3jBxbVzTHmqmbAnOi92RH7DRjePmFspKn+iul8JWDFT53CHgwMdFBEA?=
 =?us-ascii?Q?+A=3D=3D?=
X-OriginatorOrg: ekinops.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9b9840-f25a-4b9e-079f-08db7df1a5f0
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2945.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 07:21:42.8858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f57b78a6-c654-4771-a72f-837275f46179
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0CDr/yGLGsNkV5WxWot5btO9vGy/cEHxnyrhsL4Y3dh9HeKW4r+0njUHksDRckRnU8ZM0cC3b3gDGxMRPlVi10tAaifSw/bADkiAT85y8vk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3292
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 07:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183915

When enabling ipcs and ipcrm configuration into busybox, both tools are
built and then deployed during do_rootfs. These operation lead to below
issue (similar behavior happens for ipcs):

do_rootfs: Postinstall scriptlets of ['busybox'] have failed. If the intent=
ion is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().

update-alternatives: Error: not linking .../build/tmp/work/board-poky-linux=
/board-image/1.0-r0/rootfs/usr/bin/ipcrm
to /bin/busybox since .../build/tmp/work/board-poky-linux/board-image/1.0-r=
0/rootfs/usr/bin/ipcrm exists and is not a link

Binaries enter in conflict with same named util-linux utilities during
do_rootfs step.
Adding ALTERNATIVE_LINK_NAME for both tools fix the issue.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
---
 meta/recipes-core/util-linux/util-linux_2.38.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta/recip=
es-core/util-linux/util-linux_2.38.1.bb
index 9ea7a04e8a..c81405533c 100644
--- a/meta/recipes-core/util-linux/util-linux_2.38.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
@@ -234,6 +234,8 @@ ALTERNATIVE_TARGET[getty] =3D "${base_sbindir}/agetty"
 ALTERNATIVE_LINK_NAME[hexdump] =3D "${bindir}/hexdump"
 ALTERNATIVE_LINK_NAME[hwclock] =3D "${base_sbindir}/hwclock"
 ALTERNATIVE_LINK_NAME[ionice] =3D "${bindir}/ionice"
+ALTERNATIVE_LINK_NAME[ipcrm] =3D "${bindir}/ipcrm"
+ALTERNATIVE_LINK_NAME[ipcs] =3D "${bindir}/ipcs"
 ALTERNATIVE_LINK_NAME[kill] =3D "${base_bindir}/kill"
 ALTERNATIVE:${PN}-last =3D "last lastb"
 ALTERNATIVE_LINK_NAME[last] =3D "${bindir}/last"
--=20
2.34.1


