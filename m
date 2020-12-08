Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.5490.1607414651398842449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 00:04:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=l5o8vfy9;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhjCNMJsrUSTdo2c59Dj2TKYMgOhh0KoT/OSl7hAFJDG4mV7vLyMfFLEJGGxU4I0j8PtxQjtDNCu8nqHiQHMJ31kkNplpJM6H6JUuHDGtZwl/b3Nx9CyLpPPaTz895LcIQ9fUIApFd/G0oYOWS2P5LquzTLIQKk+6fPX7iHcNhwKwMABIVedBaeAXUOakEcPTNkkmPyLSRRs7XAT15aF2VW2XVvIGo0MpVyn4p4XU3GuBbcSeeFuUKqJ9tdjdNPs9QoepaqHuuVlbZZmd3ZuuDoKg/c6NIaJ2PIKO3P1CryFVv3U/ZprgQ33m20kRy2lAEma6Amnna1/lQ2bdRk3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J9izCQJd2omU2eDoWJTGzDIuckIrtj9F2gDmJnm85c=;
 b=Q2opEDAHRerpFOx/ZCk5nu1Hx8cF68aIdk3UyAxktfYi3ygc6jsktjX3Mnyw/xDLkYqBilP6eqW9nPS6qy83qemUouZIbbQj5uDdomRd4lrFkuUHugguhJLgynrKsUKdTF+cLacH7gmqLBCvV+/ZPY88wvgzhodcVtv+y/71YMHd7dflwGP8uLGi4+8YFpLrFoSMq+/IGz30Q8ZR8VwGK3rMxf6ETrZwAE/sCnzybmXND3VkjbBMjGYuLyrzPKI4ds874pjBFASlglrdkJsKnhQiwC3cPB4xbLfP517k6D5gOROPsbsi/USvdmSOSChgAJPW5TqV2v9AsyGlcysFXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J9izCQJd2omU2eDoWJTGzDIuckIrtj9F2gDmJnm85c=;
 b=l5o8vfy9WkoFiZkuLe6FPCWfD6008V75Mi8Y5wZjHONTCXU1mEGlb2ihQogkky7bbPRXIRf3QgSJV+MFeadv4yHvfPFdVwG9lBkaSqnUrfjcK1SomqnosWd0ezS9vcbw9iXzgLL7whH8n1eDCFGzHckDgfmjzwtt8i14MTjz6lQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 08:04:11 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16%7]) with mapi id 15.20.3632.018; Tue, 8 Dec 2020
 08:04:11 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] ncurses: Make ncurses-tools depend on ncurses-terminfo-base
Date: Tue,  8 Dec 2020 00:03:55 -0800
Message-Id: <2a8814100571b9b90d5a904c6598c84b8a7ba5ff.1607414579.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607414579.git.liezhi.yang@windriver.com>
References: <cover.1607414579.git.liezhi.yang@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::20) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 8 Dec 2020 08:04:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ec3651d-5ddb-4b64-bcd5-08d89b4fd8a5
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4574C8C7523D5D0C7C5BC4A6FFCD0@SA0PR11MB4574.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	22Ule8NYR9d3xywUeprhklIVsTXIBMgxc+FS7MruKVFwIogSM64na5qfzr+oIYJ/UVT+V/r4fTPmbyV2gP708o7fT8JUnWARiUtwGPdZLXi58D7Zj99Uwktg1cH3y97SiJC4yzG+a2fH7aIcS8K1TVsjiK6zb19+KPvUXECbxpNNgUkR/ptyy40fnKSVvJAbJwpfUXnP4HV/zXpufDJaxIf6wtk4soYQ53e8HMyb7f5gCom+VC2BfLBfOQ6yVq4Q7feqMfCCnuIFmJ0lpKaZ3PM0ngiSoYQyauQruXJkoVpU1tOr64efqoUHGIrHwDdC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(39850400004)(376002)(5660300002)(6666004)(86362001)(83380400001)(2616005)(6486002)(66556008)(316002)(66476007)(4744005)(36756003)(16526019)(8936002)(26005)(956004)(66946007)(6916009)(6506007)(8676002)(186003)(6512007)(2906002)(478600001)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?qMJUv+m+trzEY43mW1uh26hfbUiyvo1+vSI3cywVKiwnNQk/KwZtA32sbzPU?=
 =?us-ascii?Q?QZe8hfXUkZd/YZeLpUJYkX3lA8f1u+vttlYtZrno8wAosJ1QwKweCynb8xT8?=
 =?us-ascii?Q?L7xLB4+tkl3rarOxGvFha/aBrdkptsCeswwOCsdF28L0hCuMGMSUcS8LM4YC?=
 =?us-ascii?Q?T/MDrfXfJ9bV0Gl9o8MwWeXSy5sS4HJikMKI09g+DQ9Dr3iNP+oZjuVLMZlS?=
 =?us-ascii?Q?W86DCznuDaIqABFP+FyJfcnNnLm6KkbCHgaYDpvR/mG5btGhjU2Nk9/+GHkx?=
 =?us-ascii?Q?cxlcca6qs65f6BaUh3H9gxMvAUoGJnAZ5ylOwbzTOGcb/AXOh6bzFe/m+Ig4?=
 =?us-ascii?Q?j6U6UTOD0I+AdmHWrUbrCg1HBxlUslpVN6xPagUniPwY65JkyJTAv8JBFEE+?=
 =?us-ascii?Q?KXM1rKJKZ+8VHTuIpvVoEf4b0h4ENxt9bu40VCpxMTuZNnGCUspM4i04H3mD?=
 =?us-ascii?Q?VO4uUDcsOWpi3Oja/xeyGjCZOqZQ44Nei07vyC0DFzwfkciiR9T4jNeF/V81?=
 =?us-ascii?Q?w4yn3BcZDb+nyLL5cR9peHKBGRYzh+5gwlvcWy53FY7/9Kc5PVmy6WUeU4Pg?=
 =?us-ascii?Q?hW37YQtnrvSyPUqDf8AWDhPLtJx/ZHR3D7OPe8QWGuiokJ8rvWc2S4YPf6jb?=
 =?us-ascii?Q?hxj1TI6m/ROZbJZ5ntEJLr4qPzhO9asy6jg+GFl0WQO5b2aDvSwpMpQ9Fq3O?=
 =?us-ascii?Q?8irzd8W6IfletYuJiYg3N6Os+L8PP9WSHODKlK5Wjo6LqOsDwYR5xD3OujSu?=
 =?us-ascii?Q?7tnZLdyz8BqaDWPX3vpXhMUR0KNn2aRABmSQt7Oex9JbwyTYb+7HeitzN0EO?=
 =?us-ascii?Q?3IPISyySe3aT9PDdCqLR4bYZOFY2/Ca9pP7lvsGuk4IizoPW0ubwZiT1MwT9?=
 =?us-ascii?Q?8GBqB0yfxzH9GgJZBoGhFQt4mf+WrzCPz/18nKS0C3UoKnjX7gAmIi3xIAYp?=
 =?us-ascii?Q?+SA5g8VeZpNr6VWdbadPi1ZSDnQ0b6f5jHSlSfDEZEvGABT8V0YQUxqLAwdf?=
 =?us-ascii?Q?EAY+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 08:04:11.1108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec3651d-5ddb-4b64-bcd5-08d89b4fd8a5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjjQY+TdY0otgtr8kIldsF105NksJ9GP3gMf/lxi6bVczWvJw0xqAhcYf8urmzoYBeBABBiqXmVow55Pls8ttfSU5x4tIpmoL3cintByTIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
Content-Type: text/plain

Fixed when ncurses-terminfo-base is not installed:
$ infocmp
infocmp: couldn't open terminfo file linux.

The required file is in ncurses-terminfo-base

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 4b618896680..fe4e8a5d6e1 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -312,7 +312,7 @@ FILES_${PN}-tools = "\
 "
 
 # 'reset' is a symlink to 'tset' which is in the 'ncurses' package
-RDEPENDS_${PN}-tools = "${PN}"
+RDEPENDS_${PN}-tools = "${PN} ${PN}-terminfo-base"
 
 FILES_${PN}-terminfo = "\
   ${datadir}/terminfo \
-- 
2.17.1

