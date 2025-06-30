Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79517C8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 10:44:29 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.42])
 by mx.groups.io with SMTP id smtpd.web10.36506.1751280260699060784
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 03:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arri.de header.s=selector1 header.b=sjv9YDpH;
 spf=pass (domain: arri.de, ip: 52.101.66.42, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c26m3ZBPwY1r2WfUKG8dbyTArhlj6GcPVREryOzKqeXHEVRa2hjEazGfj+Rz326vrT++o1D58MQsbYL6uSwOCzETUsi3qWDLa0FajiJhzWIvittdAahGzaBV4GJMiWb/P5Yb/w8QTx0Z4qkJLeVyyhjDpgL3bzuNqw3haG2p8kccRQ0w4aZkcqhpQW7dvL+Zl3DcRqYw7hiEILwDvpVb8DZ3P5AgAS5L5icseaNskx0FvFMzphrKwwpmyQQU/rT+cCw36UI9J1wZrZKd3gh0J2pi5a+A9hcEYE02bhBUZ2KUDLPD6VOvr69APiutch1m0Qv4zQY1II7iE+N18jrh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NC+WKpIAEw+amJTwUvKt4ZqHX1A/lhbIB81+jMG6Uw=;
 b=cdgxnO5wuFwJ9F/XfHEvXZ/OZtfQmsISyfae+p22sLXWJOrR+xfsVndUORJOqxf6odTpDfHTiAzwdkKOXojLa98KbJaoa51EeSSwi65bhYa7LR5/Xd98pzmjbCuudLWjbWI/9N+bg5A6Q1fF4d0RamR+z0eYnorZd547j+ACWGJr4FUwsll55Nbzs9AcGX8lzXApSne9KWrtAnKNBUm8fI4kg4FYFlSev37cnnbTVyLNJdOmoW6BM1OE/ldHETfRwkbj1Ov+zBvEw+yChoWo87vhhmT6+kNnfKEOMp2O/BsTNY/Vi9T82+cuOBX+BsAIDDQze8m6gOPsuoHfRLbwAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NC+WKpIAEw+amJTwUvKt4ZqHX1A/lhbIB81+jMG6Uw=;
 b=sjv9YDpHyekUb4c5hvvz7/MFYQfttAnJn3l3wLpQwELrGqVI/vwFywbFGPDVx7ZWdwtLvkEszp22AFNAlpwWJWGybz5ktOtefBFsFxJb4BwuM3ZNmVZ7JCoL/osJU7zP/IjxB7KtkkImCH8NCIC/S3bxC0v4hapjQbnEfeI3Tyk=
Received: from DU6P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::18)
 by PAXPR03MB7546.eurprd03.prod.outlook.com (2603:10a6:102:1d9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Mon, 30 Jun
 2025 10:44:14 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::18) by DU6P191CA0005.outlook.office365.com
 (2603:10a6:10:540::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.31 via Frontend Transport; Mon,
 30 Jun 2025 10:44:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 10:44:13 +0000
Received: from n9w6sw14.localnet (10.30.5.30) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.38; Mon, 30 Jun
 2025 12:44:12 +0200
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: <gudni.m.g@gmail.com>
Subject: Re: [OE-core] [PATCH] bluez5: add PACKAGECONFIG for MCP
Date: Mon, 30 Jun 2025 12:44:12 +0200
Message-ID: <2183206.9o76ZdvQCi@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <25560.1751195650814567466@lists.openembedded.org>
References: <20250627072643.16692-1-ceggers@arri.de>
 <25560.1751195650814567466@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Originating-IP: [10.30.5.30]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E9:EE_|PAXPR03MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9d77e9-6695-498e-16c2-08ddb7c30db0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?cbIRaRg7jseIcnzbsrusvXxvaVPs2DhHcweb6Qa7gt69Cj0866ZJ0G3i7k?=
 =?iso-8859-1?Q?ebsOulWtwONghWKpyM4vOyhRVUT+cA7ajzuHAl6dqRB02GpnMhJFNqMA71?=
 =?iso-8859-1?Q?KtZiScHleElWetfOKN1RZ8guIaMwTBU7FzOI7K5e1CVuZGJ+wO583QGqop?=
 =?iso-8859-1?Q?Q4WWDUYTiiKmnDZkj6HcDZbjY8i7cTsQbVqghpABcHZk2CDTHTKHWRagnT?=
 =?iso-8859-1?Q?+RGDkm6r2zTtxB/+jbwIFRSMibUF6zUosWyS7nMfnqcy+HXA1ZUOrRADII?=
 =?iso-8859-1?Q?Y6gpRB2MK9i2oZ9SEpG2hvjUr2co19zOPy2sM+k16YXwqmm4qOe0Tpvt3Y?=
 =?iso-8859-1?Q?fXCX/CrP9gS+mxayg9sNkK1yeslJY+LWSLPTeu1p/Jsg6PCc6YwA2p4Uuj?=
 =?iso-8859-1?Q?P30XC6i+a8kcJKvdTgwXYdwZEaxQXrmpNehGNoiz9SanDoEJXLkQNaGnBM?=
 =?iso-8859-1?Q?Z78Pl5paxe2ZI7FzHZHgfvyznYHw7s16cg91Tb82PH+0igfIbTf3IAxi1w?=
 =?iso-8859-1?Q?D1vDyE0ld4jgc+enVfxoyMWvqYa74n78Z3VNvlhhT+TrRjzJQBM6RpPoUs?=
 =?iso-8859-1?Q?QzSwmAdFcS6CgEUiKIoMHZkkarkMa7anttZN1LY+yAkOxEUAYz325uw4PZ?=
 =?iso-8859-1?Q?zTfHEtcbzF9GCCvW13rw5T5h6Z/8nnlTTMNKaNqtOss4WeNpTXeEnk9NjY?=
 =?iso-8859-1?Q?vulCvW2VmNO8uVf4kDOEE6iEKArkhoC3ZCT3Vuj19A3xm0gXOCSVQkRnRJ?=
 =?iso-8859-1?Q?DRO2JFHf1s66/igtYcRsa+5UbXSxtVk6MLMxTyUJsJb19C5LMNYLNg73MN?=
 =?iso-8859-1?Q?BBr8bMt57w8fuG2y6HLgp0pbjpsRmg47mhCx2kW15jhiB1G0F9QFIPJlx8?=
 =?iso-8859-1?Q?UkE/4xwzGzN5bqiV96XYh5j05c0k6Ka+FwxGWg1VDP7cBuyOQ8KHDwcvdz?=
 =?iso-8859-1?Q?EH1766AcEbsz1mCjwau0FV5VIUHso/ASTig/b9d5gTqu2EfrMR4/sChnpz?=
 =?iso-8859-1?Q?Hoe1AARfnK/80IH60w7QON4WwEKwrxqGEIAb9D72l/IyP/95FR9aqEdS1J?=
 =?iso-8859-1?Q?uL7dKbWoG6gPfR9wdtLOaYwHBJ/bas8ddhYgupQ6xZyjgkaWPRtlS+ndGH?=
 =?iso-8859-1?Q?E5g2n5IleSAlmKvSZUK1ll8YytPeLuZer6UtzTc6S8DSonkfVenfjdybC4?=
 =?iso-8859-1?Q?jYrumUZyNRIzyb5QSIG/E2vKREJ05SOLCkKWd77ox1pHONzBvnepq6QR4J?=
 =?iso-8859-1?Q?0EajGq2/94ad0tn1kQ5m0/Kzp9Fm7ZvP83ywg3vz8vDlbLrJjWFy0XsMJd?=
 =?iso-8859-1?Q?4/vr1MbyGlBtXFkFq7ek6A7WXqEhURDqY7VhxV4e1Q2/yTI5ezwTDuLSY4?=
 =?iso-8859-1?Q?6MVgQ+j6YZEHN7nGZqF4iRU1OybsYW+F5e57wlK/RbTCpTnNGF5z2tdi2u?=
 =?iso-8859-1?Q?7ys51sE68t4t7w/YncKxageU4Ne79Nsj5nYwIMg9z2VQSMDOx0W84qtfll?=
 =?iso-8859-1?Q?hZyX9c55ooL4Ul45rjEKfnofrCyn4eBWhKoUoYrfIpUcOAn0fc89NVQ9cp?=
 =?iso-8859-1?Q?RjoG4kzyq72D339yWLBekl9TsgKs?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:44:13.1051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9d77e9-6695-498e-16c2-08ddb7c30db0
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7546
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 10:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219507

On Sunday, 29 June 2025, 13:14:10 CEST, Gu=F0ni M=E1r Gilbert via lists.ope=
nembedded.org wrote:
> This is already included in the file so this patch is only duplicating th=
e code.
>=20
Uups. It's already some time ago I prepared this patch. Somehow I overlooke=
d this during
rebasing ...

Sorry for the noise.




