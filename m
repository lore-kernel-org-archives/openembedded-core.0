Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.40])
 by mx.groups.io with SMTP id smtpd.web11.6272.1617798143329035027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 05:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=INWOpkQA;
 spf=pass (domain: windriver.com, ip: 40.107.237.40, mailfrom: kexin.hao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fi0p8MFg+XMUSK0044UQQm/PmonioC6fZ3zpOVJq81c/uosY4qiZ33UuIErvfn4obpT0dt85mqitsK6JP5uv3yXwuyZ21EdCBaPZ7XDt0RDGoVmQziRaSsTVYqqAPVcNixsLjpxXy2cdJ2mqqcs9c7vlFuKuvoRTuyhViJIFCa+7m8shSWDcYyhNmvkbyxJExrNhK7gWMP3+iQ9n1swzSq+7e9fIP467kpDawOpVf3iGNvvveplCAg8WIpl71pRFdEV2fqYCHeNOFrA88WSIZhC5XDhpP0nSD95IkaMBih+VvUPvxg62z6GJUu9wwgm8b2bukIoDidSSUAMVb4AIWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsPYIle78FoY6VeW5by48WT4JnKjNA4Fg8QvhA+wphU=;
 b=UVMduJxrmS1TnDcvvM9gEMaisXmE1imj7xWfH8IYhFnIFLc9SX9AcHE09TpXdNQHQVsyHHeVZMEBAZfsfoSr7+vfJC7NNhUvQRtlRnj3XWcTCVGwvojSS1K0/8t1Yb0nkJ6LuJ8TqD72z577bsGUvFGuKAahUZizaSpHhdR7QdHIhikU6+Hrad6HT1em0HQNTX+DkCvDZhTa/PBHenjf3AQc7UzdWT4TP57C7smsU/48zEDOxP+nXZVrr6fHMJhLLXVSAwlbNzU/TCUMqZ4gH5EeV+r/NdrBUttFkxCLZ3zH/6r6UetQlgFKN/H6ExkqgO047lQ/L0Cw7nF0URto2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsPYIle78FoY6VeW5by48WT4JnKjNA4Fg8QvhA+wphU=;
 b=INWOpkQAxaKFJ2T9sESGxLJ3p3tjE1bqoxFjpdE9UvJvmqMvknnYhGiBPQ/yCRFacBKOa9iy3cYfzyWMUrDd/oi6T2Q5m6GxdIdDm4S8d1Ul/nNEoowOId+bqwoHs8WOQ45fQvpk1egb6CAlhQfcTqS1LKwDZWshmacrsf9XgRE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2682.namprd11.prod.outlook.com (2603:10b6:5:c3::15) by
 DM6PR11MB3883.namprd11.prod.outlook.com (2603:10b6:5:19f::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.29; Wed, 7 Apr 2021 12:22:20 +0000
Received: from DM6PR11MB2682.namprd11.prod.outlook.com
 ([fe80::b080:6177:793a:2810]) by DM6PR11MB2682.namprd11.prod.outlook.com
 ([fe80::b080:6177:793a:2810%6]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 12:22:20 +0000
From: "Kevin Hao" <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 0/3] Fixes two warnings when boot with qemuppc64
Date: Wed,  7 Apr 2021 20:18:09 +0800
Message-ID: <20210407121812.4099-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.30.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0058.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::22) To DM6PR11MB2682.namprd11.prod.outlook.com
 (2603:10b6:5:c3::15)
Return-Path: kexin.hao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp6.wrs.com (60.247.85.82) by HK0PR01CA0058.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Wed, 7 Apr 2021 12:22:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 667b928e-6f9a-4b27-3835-08d8f9bfca36
X-MS-TrafficTypeDiagnostic: DM6PR11MB3883:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB38832D9FA2428822C8F9BE08E2759@DM6PR11MB3883.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5H+Eu6XnBpUAt9ChXX9WcuJMWHDSS8L6m+hVDsfVc+io8zNYEo957MIfMN7EhlPVc+ZKS7ZSTRAdqb4FYYHBfRIAtGYBlDwtkVpNd+zQAbvbVdc6OovHW8rzSiqVDuRuDXbYW9Ss4srXEHKbYSPB5lbWxPVI5bviDoug9S9umZKsvpQfxkBeMSlEhxY7p9Qs8cZMiT0T5x6GUGb4unpU/bpCgT+bH53lPucNMPr+IbjUQZCxgksla11zmk9DM5lwTmPcK6cRHiQpGt4lXVAm15poZHY9zI1UYWIpQ652uLscuUllDcB7sqe2dQAnG3lQ8FxMMs4JCEeEukwFds2zzY4tLpJcLQ+l1fHTWcKFqOScXyg34sCrH1kH2166VFNi+HpmOs2i+AUti5xPBzxCqFK3br5As6TNbNFip2caUroEieyVjuc56SquWkaC/yNnCtJgq1rL8h6EGXD6YLtKsE/+F8PdguxM7Fw9m5H4m9ioxocGaq84UsRNc1vrCs4sQHva6GRjqlDNcC3JVAjn/wqiZ04wBzY2LGBlcrrOM1MAxzYNI9Dg4cQn8gjCNihc3NWKwpywbZ19ODHmzYyR9d22CYeSKQNKYwLOD7bDSPFzUB8yQOO5vPndlJvCvuPdPBLlLRSffyu+2yaiESallM7qDtQSSnZoGvucp+rY0S65EV0QhAJl1QmA8u+i9fYS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2682.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(346002)(136003)(366004)(26005)(2616005)(956004)(6666004)(8936002)(38350700001)(52116002)(86362001)(6506007)(8676002)(6916009)(5660300002)(66556008)(66476007)(4744005)(6486002)(66946007)(36756003)(1076003)(2906002)(478600001)(316002)(38100700001)(83380400001)(16526019)(186003)(4326008)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?h/3efpLcBk8GYA3Tcw3O8xM4ejZzgPWf3adPzskfPCaFOW15qhQx2jmOClDb?=
 =?us-ascii?Q?y55X0/pKB7yMD8m7g+AUQJYp1tnUxWFrtzYsSFuIqrjNJ5l3jKIcOZo/uEhU?=
 =?us-ascii?Q?TpTgKKedvWeuUufc/aOyYC7yIAIifOQTLv82jYAyeC7oqo0VfygvFoiIjnjR?=
 =?us-ascii?Q?Kd8qttZx+/L4k646vHNOFpweMdowrTmeKfixRSghrchiVF6vSNUH0K8bgSYk?=
 =?us-ascii?Q?7p9u63Zxzo/a8DCe8me5rwZlbPIAt7GUdXVB1q4gkJpUXMrA76GIoc7Wcf2D?=
 =?us-ascii?Q?U1DmBmk7ef8y6NFtEq2gGfWo7WPnncH6m/aOyVfVXwXDp90L46aOF822z9eG?=
 =?us-ascii?Q?Dg+b40L1F7/EcY7YSlMZm0EafYEYpeXBQY1YWdAPLYSKt1Uf+53Q05eUZAv5?=
 =?us-ascii?Q?6yXzTK+c/0NDqPBvDkQ8JghJhuSqXCQ0nANaxxz64izC7G1/ZoOVuOW+jdNs?=
 =?us-ascii?Q?BlbDuwFH9zvlW6vg+L3Pm4B458KEoHegMKn/kVOwzlo8VCKgA1ib70ZsJSjd?=
 =?us-ascii?Q?i/gr1xwGw8HheybTRJoh82Xc1mgp07wQqlDApD02VJvD24mfWOsHy8Av26Wp?=
 =?us-ascii?Q?/gCM1XTHXB/FaMZ3q0Hz6/3rgeRtju2joEMMA8FY15wh5lBnkhTjpJGVHI/g?=
 =?us-ascii?Q?8rUitUcnsjlgSXSY09EQXcfZ+peCWjR/3bKE3She0swoCqQD0SsuWmJluWW1?=
 =?us-ascii?Q?eb7d2T1Ay8Hzu6zCXX5cJH81zQwNo9owf+jju2lkDrau+XGIpoatStfLYxoA?=
 =?us-ascii?Q?35FEz3OR/QaL6VL8mQQjcuOFGZnGuRV7HETazYZqmG6iBWa8cxmG3sktHZxi?=
 =?us-ascii?Q?ldbdZ13zGNDvlB9qoouilKMnQwqRRydtATOmpNxCFhzP1UCa6my7pecTDBy3?=
 =?us-ascii?Q?0XN5d0y55c18ID3pW0RVU0EY5C6bXl3rOnJSraRWkhq0EDQ4WsZYHf3KBWH5?=
 =?us-ascii?Q?Qk3mhs+kQq2R2srQBhPuY4yS5FsShdC1cG1IqayYYR+UDeu5/pQGfWu5oyPA?=
 =?us-ascii?Q?xwCbunQ/w66HHq/YI9wxVIjaxJx/R6Iec6tZMzV6vGfYTsoF2EMrDwHJVBos?=
 =?us-ascii?Q?As4hcHvCHDl89sOZGTYMrZd2/ms/D92ziHLThKAyUQI7/WfNEfoql7Da+Apo?=
 =?us-ascii?Q?UqME9yTIcWMFL/jiDA/gDFlTqMSx2xzYD9e213VDpjC7nxuLCokJoT1508l3?=
 =?us-ascii?Q?fZeA9bUiM7gaEvjutIXmwKmXtDhHijRZekiXvAKVV7T40vSGyKMpEb97vtoK?=
 =?us-ascii?Q?wYal56Fh159H7pRFG5sYvHPkFejr+ZEUgftDbeMk1PQ/0+HCjZlCMX2oRGRg?=
 =?us-ascii?Q?1hq1pv3I5ZvWsw1+0l/2X5Td?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 667b928e-6f9a-4b27-3835-08d8f9bfca36
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2682.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 12:22:20.4293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vN0zJtrXA6Gzsi3I3DGVBDS9n4Dm8Q7MmDGwH+NvDX3RSkkg7egQtY2RhdMYv2CyoDONAOC8Kio5leeuXX/OfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3883
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Fixes two following warnings:
  depmod: can't change directory to 'lib/modules/5.10.25-yocto-standard': N=
o such file or directory
  INIT: Id "hvc0" respawning too fast: disabled for 5 minutes

Kevin Hao (3):
  modutils-initscripts: Bail out when no module is installed
  sysvinit-inittab/start_getty: Check /sys for the tty device existence
  Revert "inittab: Add getty launch on hvc0 for qemuppc64"

 .../busybox/busybox-inittab_1.33.0.bb         |  3 --
 .../sysvinit/sysvinit-inittab/start_getty     | 44 ++-----------------
 .../sysvinit/sysvinit-inittab_2.88dsf.bb      |  4 --
 .../modutils-initscripts/files/modutils.sh    |  1 +
 4 files changed, 4 insertions(+), 48 deletions(-)

--=20
2.30.2

