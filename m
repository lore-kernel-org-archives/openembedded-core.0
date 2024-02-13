Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C03C48BC1
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 12:24:44 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.60])
 by mx.groups.io with SMTP id smtpd.web10.10175.1707827078041803640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 04:24:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=MgzziCTT;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.20.60, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzVIlzYwTycDiZ47VqnOhPLyLcteS4n8HQLdbUMwFQVqf5C68VaIeo7CyML5X+UAgezjcr37jHwZqDLZYDQoTNwfZMh6hO4eT8IJ1EKjMjkvjgmJZ+zWUQh9YDIB+2xzZ2M/rpr0ArI3Of1/h1xw+pH292xt/lhgl9GKXhVglqNiGmyfWAPL3uyeH3KIu/xcv/7sCpFjAWuxwSHBusWhbnfbhdlVKnigyAHC0Ik6FcZSUEVbEv7S2uNBxPgtfXUZdTlWMSc9VDDw5ErPkv+jMwuReFLqByWIEqJvufge7mgeNsH9WE3QDxhQeYtybeHD/MtliDDDMUBnRoe4BBZzIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2oCyysg3d2cb7ex5eLo6Pv+gdEfKU/BTViFNCqfRdA=;
 b=F+Q0S7jYjzaYkdXi254YUGjBjhZlSMwaKdPQ30Rgm1MSqjGk1Ndm3eTH50DCT/Xzb0TSaAjJm30HgWJFyBsDqfHzp5yolSZkEJZm/Gld+tEH1WBzxtqi7JicQsioS4PGIC4Vk3GNRyAVuwRU23fdxWb2Q8F+HYLqRNvxBothIs3+T+uncXww9zciPTUHbozbr2Ha5Nqx7JpNJK8a06wbjDk2MQNWAC83OXC9m+xE3cmEc1wtWmHwnrI2Og2WQGWhoLL/XfFDKM+n4/+zArxvTiqERXPwv7FrSn2kH7QVrMJNf+gpQJAjtMAVe/IJY9p67Oz53z7rnuSfEJbrt1d/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2oCyysg3d2cb7ex5eLo6Pv+gdEfKU/BTViFNCqfRdA=;
 b=MgzziCTTFAt91d7WLLWtHHACCxV1tB5twUu+7urrcZWBskMsIf0JkUqe2V/ZmoQ1eTHNieg8Gru0ln4raMQpbnTri4U90lQSRJ4za1TJn5+Eb7MVoFPOAIH1b6UCUMN57377PScu93oa3xTCkgDGw3mctwAAOiSzyWF4fjbOTfw=
Received: from AM4PR07CA0029.eurprd07.prod.outlook.com (2603:10a6:205:1::42)
 by AM7PR06MB6722.eurprd06.prod.outlook.com (2603:10a6:20b:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 12:24:35 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:205:1:cafe::d0) by AM4PR07CA0029.outlook.office365.com
 (2603:10a6:205:1::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.24 via Frontend
 Transport; Tue, 13 Feb 2024 12:24:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 12:24:34 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 13 Feb 2024 13:24:34 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v1 0/2] initramfs-framework: fix kernel commandline clash
Date: Tue, 13 Feb 2024 13:24:23 +0100
Message-ID: <20240213122426.3570935-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2024 12:24:34.0360 (UTC) FILETIME=[9A4B5B80:01DA5E77]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A796:EE_|AM7PR06MB6722:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 85450caf-f495-41ed-673a-08dc2c8ebd0e
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jVkz5/8qLMA+EtGlq2vqwFYrW/OcB+ggTGVc4gYF5/2BfFHofxcN3v9VM4yBhRTLq3254mrcV6aL61LV7fznmLzT0bNJaSv4ITDc3ZS+YmE1Pt4XQ/g8ZrFLkXvzn4nUmH43gJx3IBDVHR6kw9dlxWFBrJetVHmUczVa+ajByQonN0snGHdUO4TAghAY+QTlSFbEU/9nHexFAgl9dVdoye3FGENnZSSjPP84okjsm1WBvvc8CiRLPfXaVfE28XRPDWx7Hg/BCpyFV7EbkOh/2awZr8CRiARmCUKv/V+fSpSTQqmggDhuXiaaAPodCg+8+/1WHhcQ03Yw2fdgG6YRh28Z2G8sARWkIy2AsXpnVzxoejddHX2b3gsARFC8FF/Aw0/VfqXVHn7qXx7Azg1/h41V1ynxQ0GVAavcRqjoDC32UGIdfNGRVjh9gA9cAWDV+1Mvhz/nUhBRMZlYr7JYVDVQEU16QALkh9UNshDZVgvHP3a7JPja8IAl/innepEe0vacjFVNciYwqiO6u9n4dhzUpswmuXXlNWMgn9p23j9B7X4a6HlD1L/AUMSf06b0qQsbD9WqDfuERCDpdOPt2tBlDMbdfblzIBr0hV+Z+gU=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(396003)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(82310400011)(36840700001)(46966006)(40470700004)(4744005)(44832011)(41300700001)(2906002)(316002)(5660300002)(356005)(82740400003)(81166007)(86362001)(36756003)(107886003)(26005)(336012)(478600001)(2616005)(70586007)(6666004)(70206006)(8936002)(8676002)(6916009)(4326008)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 12:24:34.7646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85450caf-f495-41ed-673a-08dc2c8ebd0e
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6722
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 12:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195392

The initramfs-framwork takes kernel commandline options and converts
them for internal use to variables following the 'bootparam_name'
pattern. The overlayroot module uses 'bootparam_rootfstype' and
'bootparam_rootfsflags' which both collide with linux kernel
parameters 'rootfstype' and 'rootfsflags'.  This collision is solved
by putting the variables in the namespace of the initramfs-framework
module.

changes with V1:
	initial patch submission

