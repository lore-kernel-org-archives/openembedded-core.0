Return-Path: <tobiasschmidl@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC3FC433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 12:25:56 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.44])
 by mx.groups.io with SMTP id smtpd.web09.5932.1653481546029091831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 05:25:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=j4JOOsoI;
 spf=pass (domain: siemens.com, ip: 40.107.6.44,
 mailfrom: tobiasschmidl@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUskIqIcmbkxStSbrRX71mGhq8HQDOidJQJiJsNyzj1BkJ1qtqrR97m6RzEPQtgsBNSwbnfIsoZXNcS3iwWQ7xpqTS/FiX3rfvZ29IpTvyK6eeAl89tPjPGr7R41KBM7hgpkg/Bn5soWCl+0IgvWH7uNdXF1i3I3EPCRluikPkNCjr5qpDC53MKZHd7coUDXYOJ85XOxEK9JG8fbmSz3l4QZMUX0IRkYodlUCdKnZOjgRNbAezyHSCuMb86N2OyeW+ZmZZ5Q3uYw+bIEr1Duk0IL7brbjcDMZxoXfhyYANtfhoMTeYy6J8AlKOiPRGn3VydVxJ2CU3fPYQ9YnmNm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlloAgcY/QU820yJ6vRfN63h1TuXAwWFW6a8Y1CYL54=;
 b=a5D4s/Xg4pZq6k3v0kMudbVmm4Pmo+i7Jq4n5LOF3uiTfUgP/u+AeDhC6Y2ZdyW4agoumfNqcrnkPaZ7tJkjwnk0H2MVllkTnmen/qlVVBMBWA1wa7J2HPAxNCsRuf3UBSknM9U05+tSqTwx2wGCcbfsi8IlQmxZ9T2o1nxeXLvGWum6110EQTcGxFTma+OxIJnDTlkTAgobW9O4vXh5wZJe0aK/HJFGw5Th5xdKz29M6kL32oQPZNDxMw2g65tZMK7LZHdS218lel/ST/WTunJd5F75TSxadUrFHpGtjFecEMJHs5a7N3t6vKyrInhMo5kyN9AMHWjEcFEwcegX/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlloAgcY/QU820yJ6vRfN63h1TuXAwWFW6a8Y1CYL54=;
 b=j4JOOsoITxdTuoWkUt9+hKkbpuFrM8MTsdqNRwtRvAN46LPCkocUIPG51m4gSdlMtUwLifIRlfSvp5lVm3CHyloaC9Fid/XsY10ZSQomfFXKD2ZxY0ii6ttbkGvtQf82n2AjsMKeKDcGi42M/7+wLwvMaFs/TUgacLZZew5XJ4MDaX9r11wlnGoxedyb202s1XmL7U/Gyv8Y5hrNodD+fMh7CxSrR2FGENz9yZ+kySvEQujNYhd9bXt14g1aL9E5FRroxNM6K5dkLdbTWgODlZPW6ZnumIjBZBrjKz5mGk1IajO62pGDq3xBNi/M6LXkVbl6USM4h+x96ZLqx4/FQw==
Received: from AM6PR0502CA0062.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::39) by AS1PR10MB5338.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:4ae::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23; Wed, 25 May
 2022 12:25:43 +0000
Received: from VE1EUR01FT023.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::57) by AM6PR0502CA0062.outlook.office365.com
 (2603:10a6:20b:56::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23 via Frontend
 Transport; Wed, 25 May 2022 12:25:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.70) by
 VE1EUR01FT023.mail.protection.outlook.com (10.152.2.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Wed, 25 May 2022 12:25:42 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Wed, 25 May 2022 14:25:42 +0200
Received: from wonse.private.schmidl.cc (167.87.1.124) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.24; Wed, 25 May 2022 14:25:41 +0200
From: Tobias Schmidl <tobiasschmidl@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Tobias Schmidl <tobiasschmidl@siemens.com>
Subject: [PATCH v2 0/2] wic/plugins/images/direct: Allow changes in fstab on
 rootfs
Date: Wed, 25 May 2022 14:25:25 +0200
Message-ID: <20220525122527.765791-1-tobiasschmidl@siemens.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.1.124]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--11.921800-8.000000
X-TMASE-MatchedRID: 5vV0XjnGfUl8J6cKGoYvWKwePkardoUbgJXstD6J/JHKE9oA9cXOzf6l
	pfpte41hL6Rvb61UlO00Yn+yUq2DqjjwCUdlQwvfIP+gA/px5g79kbyhKg6JlAi0LLplf+UvTXo
	3QMP219+bKItl61J/yfJvocwUrWp7FBpuM64i9KELbigRnpKlKSPzRlrdFGDwtdh84pcoKEVJmm
	qmt6z4WZwDkKbFLH2qrbZa+tOMfLDi8zbEF1czJg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.921800-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 9F5D9FD4289C15CA4E6CF4B152EC0F4DEB7457B82584DB7DC15E3FE4C6F3A6892000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ee430ae-858c-4027-163f-08da3e49afbb
X-MS-TrafficTypeDiagnostic: AS1PR10MB5338:EE_
X-Microsoft-Antispam-PRVS: 
	<AS1PR10MB533897651CAFA667020CAF0EA9D69@AS1PR10MB5338.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hxi90w9Uac4jN3HWWEGbQAUXQ0dGJkD0eRLTUW8AboDz2De5JO4HiL/hG3KwSd3DFoJiVX3+To0QG80GvQknYpNVH9fxDeWgzCdhgIAguGOfdzUvNcn04F1vhMaBuRoJUrJwOtGdrnFoLBlZrN3gwt/KwTL7aNH1BNSkQhYbzCWekM579HCDfHHB/ukngiQIoq0bMJVp2DVsP+RnSVkqnqLspiP94Nm5kWXD6Nz8RbXIknBPqQ5Lt9hrb6DQ0NHuNHFAPwSp/DDEbbtOMeQEZWLni9sv7GXuiCByvOg/eXZ6PhoTOYlDC6uFFnKKbPA5Dtj/8FJxYE2xdnSUAyddkYBSMg67YVFOYyt9NTGXjS2DKmhgVz6Sw8jyFlRrcaeAWKwAEAZlfvPWPZW35zso+54kTKwFo8kIbyNwMWd5eTqi8VvDitZHG/bWuqp9BMXHNStSumSqDyYEkhevNfB2Z32M/IQ2Cs0M65Yo6Ddt+4KEKSDEdM8Lju216vUXIVV2PRgV1T4ur4M2OgO6IMd0JV5oJJCRsoa+O3n51TDPzovjUwJZUNYXJFOQFMqSmwc0goP+rAIqrY+FXprfJNNHINRvHNHh7tnAbBxbO2WgDC9Rgjd4TfoIzNJe6encW7/yYa1jtuulAqJAi1OJ33a895y9e+ol5y/PLxyuiVkg413dap4kSezIXbO2gNCjcQl4
X-Forefront-Antispam-Report: 
	CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(4326008)(82960400001)(7596003)(82310400005)(6916009)(356005)(86362001)(6666004)(2906002)(7636003)(8676002)(316002)(36860700001)(40460700003)(26005)(2616005)(956004)(70206006)(70586007)(36756003)(5660300002)(508600001)(107886003)(83380400001)(8936002)(1076003)(186003)(336012)(47076005)(4744005)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 12:25:42.7217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ee430ae-858c-4027-163f-08da3e49afbb
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT023.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5338
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 12:25:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166120

This patch removes the exclusion of `/` in the fstab update. This is
useful for a lot of things, including but not limited to:
- The setting of `fspassno`, proposed as "[PATCH v2] wic: added fspassno pa=
rameter to partition"
- The writing of `fsoptions`

The latter is used for example for systemd-growfs:

```
part / --fstype ext4 --fsoptions "defaults,x-systemd.growfs" --fspassno 1 -=
-align 1024 --part-type 8304 --use-uuid
```

Changes to v1:
- Repaired selftest wic.Wic2.test_qemu

Tobias Schmidl (2):
  wic/plugins/images/direct: Allow changes in fstab on rootfs
  oeqa/selftest/wic.py: Repaired test_qemu()

 meta/lib/oeqa/selftest/cases/wic.py      | 2 +-
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--=20
2.36.1


