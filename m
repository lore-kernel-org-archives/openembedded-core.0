Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21188CD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 19:33:39 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.138])
 by mx.groups.io with SMTP id smtpd.web11.20904.1712172811066103107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 12:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=TRzLL0Cx;
 spf=pass (domain: ni.com, ip: 40.107.94.138, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fc7ZxNrBn0Gs2QtEGSgwSMQljmn+STgPbYdZL1m5S1FfjGWLhgA5i/iRQ7uuGEBUs/0UeVfWeKwed0vFU+ACrhj3c6nP0SUVd7bf3iBhQaw6epaOdecjmXdqidKr42buMKMyUTn9AXxc4pSps8hDK3ug5ZCdKEPwaMSfCyMezdF+kmGl9lCLlz0K/Dh8V0jHuImdBdLpWDhrzpLHryP1Y/p2h5MsLK36SNNQhhsldpvaeIbfLoBIGTP9dXLhDhN4m+9NKEnjXHaJBpB7pLWEZqY5efbBPxSKrWoVdWkNt1S45kUS7uAvnOg7veVUpfs3sKqQv7T0iSibcingSlxAhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WtYN3Gj0YwslTJfNwELHCnLfFW8Mux5wbZk1I0Weqs=;
 b=c19XfH1jwcBICdDr5c20k1nsuuFb/oiXuc284rsKsETatKAoUPwfOkUbbF+ngxEjE+tZnIcb5zkIdmW/5Sns2XXcHRzbZ6sOnZ2SS0abGb5gyi81VJ1umKNnQXJ0Kvo+ZfDJ8cARosjsJ2wQWtXB84m258PE7LpLO5cfKKagXCdLCMBIqvBssHklYeWG1Y4GEhdTaZGtht+JdqzktLklwy2SbI9e4NItAv2DN6WcM7Q4jDS4xRmQey9jgWYFo1C3kIO7CxAxm62r3H5EV7UJm7J7wD9LpW7YFAPzbI4hBeCKwv9ToGGLS8s2SwzXog9YrfN5SIA7eMdDdu3hESzj6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WtYN3Gj0YwslTJfNwELHCnLfFW8Mux5wbZk1I0Weqs=;
 b=TRzLL0Cx2xaGnIm57YHbrc7RRoUNYP5+eDVdPrQsdaIhLusZGzVUnwLbDAsspcYt6H8L5pruwtETCeLJsaRNTQyhfgr3uLzt91zQ9nDqR7hczqsYhCE1/5uSIM8Pqxdg/uGtbtUnWG98hgHxXbwNBzX2eWMGRKXNltN9iprLoTI=
Received: from DM6PR04MB5292.namprd04.prod.outlook.com (2603:10b6:5:107::25)
 by SA2PR04MB7692.namprd04.prod.outlook.com (2603:10b6:806:137::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 19:33:29 +0000
Received: from DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::b7bb:be37:fcd1:4440]) by DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::b7bb:be37:fcd1:4440%7]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 19:33:29 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core][kirkstone][PATCH 1/1] perl: ignore CVE-2023-47100
Date: Wed,  3 Apr 2024 15:32:04 -0400
Message-ID: <20240403193216.971802-2-alex.stewart@ni.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240403193216.971802-1-alex.stewart@ni.com>
References: <20240403193216.971802-1-alex.stewart@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: QR0P297CA0019.MEXP297.PROD.OUTLOOK.COM
 (2603:10b6:3d0:16::18) To DM6PR04MB5292.namprd04.prod.outlook.com
 (2603:10b6:5:107::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB5292:EE_|SA2PR04MB7692:EE_
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	weWkqKCsQ1+K4Lm2aNbMF5TP+dKz7JOsd/rfmEOvOUuwr1beHZGK/G1fen3yBi286O4OjgvNNT9J9j+EeqYfZbqqO9rIIMHZ+MXVR8mtTn+eR6Vv/57cpDtS/txCevs1cs9oR8n7NWyZ0iGseETxtlse4NGGZOw7lsXqsXYr4cfTy0EzZYCylvqGSUv+1t7r0/14Zr1TPsz1BzrJk/L+oXz4j5HGtx/Oyb8l26pMUZ6i6FfjCO5S8bhHQYMf7lnCzZm9ya2WF23ewiKzeltDMy+6BgFEXJAR94slXx/qvXxQ5KEad6F9tpRtDac6m3RHYvz4p9IB3CY+b+gaWT7oyANSy17qFtxyPQUeHD91tuRd30uUFfRUjeLQa+6LsoihkcQPik4f0PeBczD67D4b0+VUxgYv2b5plHNVhJ11mHuRz+grxWRzBpoSqyDDSbQjMwpHC/6vZelMAf4TXGWdppPLMu2ProtPT27ChMu42cV9Be+NS00EBj2Sj7aTKafQiTRxrkLBUjeUEPUXBxNQr+1Pb5Srr5vRu8IIxFBSfVwEmdg+IiVGp2a7tMwsHZo29Dlol+jPlfoImz1ULuHxs93jIo/y9DFFO/yNNYSCsQWfnfw4/sh8QtrJnMByG1QBAv3d9chu/oaGzApCOUCfZ1D/DEsie6CxlrZPcQQoTUo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5292.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qt4KzTuNba8gSsBZi2EbzTNMT+dwCQHc+Oj/isuZn1W2/eSRI1gO3SDRKbL7?=
 =?us-ascii?Q?nSoUwgSvQQbwcUh4Ks7UpIQoenkouZhSMyIk3IaFLx2BBQk3xmEysj4/X+Mb?=
 =?us-ascii?Q?Qlev0tLbESY4RX7j6BkQnvDg7KszFrabpdX5czehrTN0DW6n4pQDDNPlgsAV?=
 =?us-ascii?Q?1e+ZlIVsW0HB1MfBJnLooTUStJonjjZGsz1XbCxopjKS13eG9EF0oPi3FnQP?=
 =?us-ascii?Q?MnLb/iZ4avE0vnc4NkOPk//tQFP+GG9f7jW0iTM5tGfy81C0y7L4RKFif/pi?=
 =?us-ascii?Q?1d2qkpw/HIptnOjbObTeh4ZaDInglyY3w3CMBvKG7iaRurznIJhTUY9JjrJM?=
 =?us-ascii?Q?m0+7awsDMiCDOWmcmvwPzEGp9UQPJ80obe0H0E/ODZKMZJeZROAXa/n2AOGn?=
 =?us-ascii?Q?FhOVgEUkMuYUVUIdzA3BSThx9Uz1BF4h4w3muCHGI66D+0gAeRnbySjOoRR8?=
 =?us-ascii?Q?2CQtpy1g7InFp91F7Gl+NZW1XU7OKPkn4u8O4/Chqx/AXpO2NGF00T2nC8MD?=
 =?us-ascii?Q?FLFodO/29R7Pe0l0uxmqPJxFFoqMUXjdM592hGXwyyN0fkXf+7KTPEZnf/ky?=
 =?us-ascii?Q?Fr3mG4f+mgz4B/bnZ8ywcGxHb7moXQ6Gg54EUHj9TH7mPAL55SuVW5tb42Xp?=
 =?us-ascii?Q?H1t7ITJHfspKANa+PaoWDedFT/68+yfrgWGeHkdVaw4rCZa65GrWR5UUlO3U?=
 =?us-ascii?Q?Y2qYoUwVjTOC095bB3qf7fVFsoKtefM+5MCysdY0lYeC3PBGBo+FcXQVGuMp?=
 =?us-ascii?Q?rRLxQY0YsYzUse6DAKOBLMm05NJyMcJsr8f5uQGtgAvS1kdhNTx7RK57jSpR?=
 =?us-ascii?Q?kil2kZBf8zO3c8JQH9ggulNYfaDx3p7YoUVKoeIMWuLa0Rt0XZ7TlwkCgzYI?=
 =?us-ascii?Q?QHbXsxJpYaOujV/ww9I2APdu0KKNv3Q/lQVdwFeeIKNCGTTcU9ddEXPGhIhl?=
 =?us-ascii?Q?PMfnd2BfCemgEnGt3xDlvwAeTpzNjhF4SccZeq2oA/KYHXEky5jqf2OTP2EF?=
 =?us-ascii?Q?2Y+k/woorKuQ/UnDtgFJ4MmRtV03IitRmnv8CsAtzC6hYDkAK3AawTJpZT8b?=
 =?us-ascii?Q?QaDG1L29vF4YDj6DOFNfkeNGnS40MaNF757uMU8tV98B/VNMZjU4Fr0gS9N9?=
 =?us-ascii?Q?FXFcdBE24v7AZPF5ngkrUBYyOmew0hjE2RoB9P6Psn0ORdvhOWsnNnxPmqwt?=
 =?us-ascii?Q?IZfqyh2Xnd9NHTViQLtjW6+CF3xwc0rx1deVKUJ+dhzaJ43JEt94CTMyKIJz?=
 =?us-ascii?Q?pNE4pb1ldJNdTDiC40YQPa+0nA4U6xoJJ9I8pc/3Sqaifq+7y87E7Xe/xJ7f?=
 =?us-ascii?Q?XVVQj+h/LxPQhX/5BGE2BwEp6BbFFFuQaAdbpWzeB9zWT1y/Mltt4ERViaW1?=
 =?us-ascii?Q?Y9Q5oox1r8B1muqUsu2TAB5znJ29Uvk0nya44VzFHa2ZGZeA1+GYJ0tEuJdm?=
 =?us-ascii?Q?+OLBu7YlfTBzwS+FWhBlF04qa+g3oxxaplXCp3yFmnZF+Cvy0dk/RrsPnLQq?=
 =?us-ascii?Q?MTn/EqUL1mQ0aAj8fm0dv7zQordOrbYGZ5gXF645Q6yowxhMDQClyn1t6ydS?=
 =?us-ascii?Q?BCu146YmVEs/Ic2JDCoXntyb2mJdNlu8Blh8o7P+?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afebb208-cda6-4d36-067b-08dc5414f07c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5292.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 19:33:29.1449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRwErBoM8FlDURQjscenAZjqNPFX17toZpQnIKe/kRMzHQT7oC9FFSAcVttlF9BQQpLDeRjtkRAcffvzBWXDVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7692
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 19:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197942

CVE-2023-47100 is a duplicate of CVE-2023-47038. They have the same
advertised fix commit, which has already been merged into the
perl_5.34.3 sources used in kirkstone.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta/recipes-devtools/perl/perl_5.34.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.34.3.bb b/meta/recipes-devto=
ols/perl/perl_5.34.3.bb
index e8b518adc9..215990c8fa 100644
--- a/meta/recipes-devtools/perl/perl_5.34.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.3.bb
@@ -48,6 +48,9 @@ PACKAGECONFIG[gdbm] =3D ",-Ui_gdbm,gdbm"
 # Don't generate comments in enc2xs output files. They are not reproducibl=
e
 export ENC2XS_NO_COMMENTS =3D "1"
=20
+# Duplicate of CVE-2023-47038, which has already been patched as of perl_5=
.34.3
+CVE_CHECK_IGNORE:append =3D " CVE-2023-47100"
+
 do_configure:prepend() {
     cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
 }
--=20
2.43.0


