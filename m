Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C56C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 15:16:52 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.53])
 by mx.groups.io with SMTP id smtpd.web11.210.1721747809164662824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 08:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=f5wq2FEk;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=f5wq2FEk;
 spf=pass (domain: arm.com, ip: 40.107.249.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bvbtjaPEHQi/JJ1JcirJztF4Vi6NQV4nxpKNXVa2FTVDWCLRK8RiWw2f1FVmZzIuw1QKkcal8OO8XtMeJHq/m+NlS0h/VU9ZZ/sTCc50GmgLHr+YhiydPA7SXb4vms0MSX0S387jv7BVTXxA5fRGnhhN36mVtoxHZOyNjtLqEj9hMH8F0jAz1drq6BUriqWqBXiUJAuLTenKiPR2g3Ay+U92y/5MVKZOk4a1+DV2nshc0Iz/kfGffgd54oiRFvXsRg40j7mq4uGRX88oo2ud0vA7QkvTQRmaetmbJp6NUn/bJQqJyW0GRKhPQZW8aWR1GA2rsGU66M5Io6sGrr7RbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FE2lwn3YL2IWgygbt+I0rH1QJiYBZDBi0d5VyGcB+XM=;
 b=tS5CEk9ujZU2SdennFI9fqnpYPjhJuJkGXEGCwkJSbezfLyNhx3JcXmNdkA+jGqhrI/DpTla18QZbQJSvfhbuXE7SArj9zhb3paklgkCUttBpN1k98E8l1Wzpe01PfYfipLfH/cIygG60FShFoTWu5O8stPHZ+HceBnumgLhF2d/k0TCecd0cwpll5SxfiITC1VS+d4DDokur/7OXfLz+/oBsRfzmdwr74xmjSk4Etm4Zq8NZFjPwbh+r+U26boOnq7GsO3RxItcEFUZJEECbjHsUDXBFyz6MjGkaFn7FUBdDetoAsgGDF9IJPlk5dV640QNqHLC6RsJUPSxELmLtw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FE2lwn3YL2IWgygbt+I0rH1QJiYBZDBi0d5VyGcB+XM=;
 b=f5wq2FEkZu+C1Ssdt4OXfh32RHlOhfJuzQDWR1N8oL0fNQwq6lPd1ydwKKH2zNo2FC9nfVnupEKAqjWFOwtgPArY4M89u/cAeiZ4bkK+3uHuwq6BLEbvpaphfNlYFEB4ePkiLJt7Q2jTqJgGFYsxOOn1jv2lMioxj+LIu4+TM2g=
Received: from AM6PR04CA0028.eurprd04.prod.outlook.com (2603:10a6:20b:92::41)
 by DU0PR08MB7519.eurprd08.prod.outlook.com (2603:10a6:10:321::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.25; Tue, 23 Jul
 2024 15:16:44 +0000
Received: from AM2PEPF0001C709.eurprd05.prod.outlook.com
 (2603:10a6:20b:92:cafe::e5) by AM6PR04CA0028.outlook.office365.com
 (2603:10a6:20b:92::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Tue, 23 Jul 2024 15:16:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C709.mail.protection.outlook.com (10.167.16.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Tue, 23 Jul 2024 15:16:44 +0000
Received: ("Tessian outbound ca5638866b89:v365"); Tue, 23 Jul 2024 15:16:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b5c2dccc2295954
X-CR-MTA-TID: 64aa7808
Received: from L09c0654e0c87.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6F822003-B68A-44FB-BFED-DF6192F6A928.1;
	Tue, 23 Jul 2024 15:16:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L09c0654e0c87.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 23 Jul 2024 15:16:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PImvhofByctjLeDkwhtfl0R89/qDgSrw1bP6pgL8bqfnSpmzMK2bZDqdTLc970yXgLZRUIG6rOSSxNhuxl1a9FfETpDaXGWMHLdLCB+ZyXu9REFn3ZFmFqx/6Sji8NzrLGESpgDT6IjE7lwcr7AKqO/Ioo2hIwOKKbXmrMPLiPXV7KCRHsT2Zzmrb4b/M/eROoOA3lbEkElCjD5uD3tBuizot/SmscmJVANYXhnKkOcC0F3boQU6FU7ql4i8aOAmN0j3moyJ6Qp2frNFHl6Gi51D4RlJcColSHQ1dHnde8xcamZNP8yN0uYl21iKZxFSvZIzfAqCqf7iy1mq50rsVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FE2lwn3YL2IWgygbt+I0rH1QJiYBZDBi0d5VyGcB+XM=;
 b=GGIgP8TMb58auFnpKFy/PhHH3HG7lq5ATfHtnFm8bJ7ADiwUHZO8nx/DrbGQ4964ck0zWnthO3B8s/4FqftP93EXZ91JjkQuzmhTBXe7rKGu7uH1S1BNabUQxHwYntii9l8aVYtfXWrLSC19xWeF1M8t2+uQcT59/zG5j22tYtAvFOV658NOH+pkfX5XHYRleEGiw7r7WKxzDcUsGH84lN/67tQ8/udhX0CY5+JJzaIkL4joDN8l2UCCaPoFXutDyXaMnr5Md1FIEjEjU9lYdmbSBj7B6vKTJTqnzGWWw/gIUA6muMnNFkUFVnJNRzfB2AHuD4FIZsur6JqBSKAm8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FE2lwn3YL2IWgygbt+I0rH1QJiYBZDBi0d5VyGcB+XM=;
 b=f5wq2FEkZu+C1Ssdt4OXfh32RHlOhfJuzQDWR1N8oL0fNQwq6lPd1ydwKKH2zNo2FC9nfVnupEKAqjWFOwtgPArY4M89u/cAeiZ4bkK+3uHuwq6BLEbvpaphfNlYFEB4ePkiLJt7Q2jTqJgGFYsxOOn1jv2lMioxj+LIu4+TM2g=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB10181.eurprd08.prod.outlook.com (2603:10a6:102:360::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Tue, 23 Jul
 2024 15:16:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7762.027; Tue, 23 Jul 2024
 15:16:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 20/37] gi-docgen: use python_poetry_core
Thread-Topic: [OE-core] [PATCH 20/37] gi-docgen: use python_poetry_core
Thread-Index: AQHa3RBhoOEB2/70F0u/gbR+dgTh6rIEbGiA
Date: Tue, 23 Jul 2024 15:16:30 +0000
Message-ID: <5D7637ED-6BFF-44CB-A8EC-89CA65C43E97@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
 <20240723145137.74198-20-ross.burton@arm.com>
In-Reply-To: <20240723145137.74198-20-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB10181:EE_|AM2PEPF0001C709:EE_|DU0PR08MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 960709de-eec8-4330-ae29-08dcab2a7680
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?VxtVcdaGHWnICD2nuAvIhauI4tPcU4xfH4fnEu/XGXeJ+w7PsZfiZ+yb6EAU?=
 =?us-ascii?Q?YKpjJBq4KJeEyWhYWRIT0fd/21beClwIUZJ/CC5cG/v5m8ISaNnwW113YR+z?=
 =?us-ascii?Q?b1k3ep0BHXP3k8aGXTpIrWbD+OJdDAYYKFPsd0AnA00zEwIWvBhX51Er5mtz?=
 =?us-ascii?Q?9VhOwh8vMqYGL/zUdkYd6sWmUIR7N/Oclvf1mhbdR4+jw78yEvTqp9B6BPQL?=
 =?us-ascii?Q?fX563+Uo+Yw79JKK5OJORck/6yd9QllaJqIGxS1CBPPV2VkVAIhzy6RDHwB1?=
 =?us-ascii?Q?eTs22vu1xhiiATJj/hhpRk/kjmhP7zJOkCWgVVxBu6uFzYrFS5x80/qKSqDe?=
 =?us-ascii?Q?g/VMRA1OJb3i5cJLpV+pkbxTWc8XCuPjXjLMLaItGroTaMTXFLoaVEJhdfLr?=
 =?us-ascii?Q?8B6jdl6H5QqnuQnuNL6D6EZvPjd/j2+ew1qnV5UppdSV3AzZSFNl4oqeGbQD?=
 =?us-ascii?Q?FPOGPT/qApb5AQkrnNGcWefXBuH1BxVqYQ3RHOJY4X/hPsEkHuLdUZdeev2S?=
 =?us-ascii?Q?bGjHxz7HyLlx6UUZHS72blENhjGOhYFTeKFUwcx7gv9rmsdf1k+AI3K1IfER?=
 =?us-ascii?Q?87r/uDIadNxLK0rPEJmMJ3Zr3vR1Vv71yGuw256ZcxUZLuWx+Y37xfDqpVdz?=
 =?us-ascii?Q?XSLEHfUN2SbNZdaWZU+mhHk+fqgtl4cTDC0HYhcyW7d4InzkqNArHLyX8u0p?=
 =?us-ascii?Q?2U7VXzPrK4eUI8KKZ8M5I+QWEoUAIP1UActkJT44FiMUAg99MApZKsi93Xva?=
 =?us-ascii?Q?bjNsbm4j69GuA+oP/vLQOAJXuM7RUl5q7CU4/IL+FZP9t+wMANUIQp3yCTTn?=
 =?us-ascii?Q?rpF51C0MOWxqiGJ3YNlmS5OrQFNE3a1ov+bAeNGA/OOz0LsMxZcigJWGKG0m?=
 =?us-ascii?Q?kfSdxAMG9/qtOgKwc2GGQ51mBZ/B/tV4wzd5xsUlTHouwhwAQ8Oi8S6OYUK+?=
 =?us-ascii?Q?NpfkLFNJuXdV1OBKVtadAYWjTCXvCAPZ9qbWCb1VNKUPoo9DdOm62VGu0vmM?=
 =?us-ascii?Q?ZOKyAcmOkuH+YbYops1oJUPJUC1SEB40xwKSGejVyn6t7PBX+ax6QC0MDyKE?=
 =?us-ascii?Q?fjrTdx6xyEV9kyUlP1sQ6q1liFLcwrzBdlmL/DOeSIfZsW2uk32lTVD05htI?=
 =?us-ascii?Q?GmEXy2PYDDKlVmNUtlTAZsAcQO3hVEfMuBWOoalkqCIhPrcxWMCAWfVqu8B2?=
 =?us-ascii?Q?hnAG62nNKsvMEz7CKhEB3qOUi0exZifAmyCCqIJhtueCCXs2XifeW/TwfkbA?=
 =?us-ascii?Q?khKoTmoq0Mblia2EdNw3oNJfrsaQEi/gP7Nraz+WKq1y1Lnmmd9vlOAjqNAc?=
 =?us-ascii?Q?ubhMdJn4mqdI8lqInpsDuQtXRqAelGav/uGUB0Nj2FpwGLwXHKw2HfjHz2+L?=
 =?us-ascii?Q?H10lNGU=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <102F51D552ADB6488BFF94E57A6313B4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10181
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dbc0ef9b-3191-4b6e-cc30-08dcab2a6e26
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|35042699022|4022899009|34020700016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EHNtRNcLt8yBa6l8aepKlE+FurQL7UyRK9TZqc6WZ2EagfYYWIIOCAg/EyOL?=
 =?us-ascii?Q?B7auOId+8jZso/qLfyIjtkzYgX0XTH4D1qYzTVYyLtn5DajNGHuwcA2mSqOx?=
 =?us-ascii?Q?Ph61I3Ac7KsycNBdb6MUEE7caOsomT4pZJs9U3m173dYdAZK6lQChmrgUS96?=
 =?us-ascii?Q?fPxpvJHnB1v+6QzfFET+76lMzYt9ybFrJ61zFEWoKAkA1+rix2sFrvCSF5lb?=
 =?us-ascii?Q?ko97UH3gGX+WyIIPTVP5hkti2mzVXRF2kG/isNHd3twnjd4PsBkmHlJuV0R8?=
 =?us-ascii?Q?WBrFk4Rp6fuFfFAfof7awE66eiYnxHeHAnQlO2U2v9cjuqcVxzdNBcxuqqDG?=
 =?us-ascii?Q?zYuYiTQkeMLVY9PIyEfrXVEA7oYvjmUhgDi/koidSs0F7B/3Vc+H11T6c3V/?=
 =?us-ascii?Q?mfSF0RHZTbsK2FUbTOb9DGs9HA5czzLAytX5KqisVwoxFnmiDCll+GvCFhih?=
 =?us-ascii?Q?3/tGpsCJFRHxmoS/P+ykKPhgXNpULnE4Os25yPR5VWjZV5lPB7fMxQ8qXss8?=
 =?us-ascii?Q?ecZIxTTe0TouSJubixtnJSacnVfNn0qi3wt8WFb3L64OhmKShV+QwwOEQECu?=
 =?us-ascii?Q?dWYzFtaIj03fTesMUU0JlTtMge+kX1BZZi1jK6u4ta1/aT9d7CQ22aHfKJuO?=
 =?us-ascii?Q?GuWDmmwuwlTgPUSMWxTsQVbPztMzfjrSvdG96ztSuPnixzl+YULBHwbL8UaF?=
 =?us-ascii?Q?pc873uocfLBB03Gtih5xxP6hv6WWpI8vq6GgdL5rXCQza+yRMO6+yfGgvVBF?=
 =?us-ascii?Q?Z1oeVoja804sAkqEAbwAPEK6SJU+iqHq5Rtxxw4okWMfEzRGfmmq1qiNQMS/?=
 =?us-ascii?Q?C2ofnxfq686377hdyYfAre9EhVLK9ihoXzI1ATKd9GJfh+PfA8spSHb2lFSQ?=
 =?us-ascii?Q?brjezuWEA4mHurRcz0laU6afy1PQ6/CpWrRwPNa0lXIqJ5wJC6jLv/satbi1?=
 =?us-ascii?Q?yHRw9Lqui9F89uJHB2WpEVfcBUl4dFHED0KXqrNcJxMYHS+2D0ezHaBdEvFp?=
 =?us-ascii?Q?mKtB+SaD/SlOasDofOE8ja7lA9ZLI2ucXUEMvToiDwoLckaZKD0NH39ILesx?=
 =?us-ascii?Q?rsAByAJcQejI2AW3D3lTT3bNKeynmvMr1NiB/EeU/dET3uiVVszX29+8P2mt?=
 =?us-ascii?Q?f1Scyd9xAGVNNBI/y1sJnnhxzfGx6ZMICqdxx5UjR/WdlKfBoP7eGXotSlQB?=
 =?us-ascii?Q?MFWSNQwkl3solBqlSxg5UvT2mdLD418toq99tc1EknSd0i75hl60Y+eGX1SN?=
 =?us-ascii?Q?bcNe/tqHgoO+5ONfMFMRzLohK5ftsRUggPbcibA2DVNc12vXLGXHrDqExm7u?=
 =?us-ascii?Q?HDpTH0CmryyQ91s3QiY2zyUA8kIlvvFYqQrbbr2Z5RbcGfxClcGpW2kTgzeI?=
 =?us-ascii?Q?MbTQsumy1tjBrL7FDTXg/8mk2sRudE0tzF8GARi7lhVLDwCoyQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(35042699022)(4022899009)(34020700016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 15:16:44.4419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 960709de-eec8-4330-ae29-08dcab2a7680
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7519
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 15:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202407

Retracting this specific patch, please drop it.

Ross

> On 23 Jul 2024, at 15:51, Ross Burton via lists.openembedded.org <ross.bu=
rton=3Darm.com@lists.openembedded.org> wrote:
>=20
> This package can be built using pep517 classes now.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb b/meta/reci=
pes-gnome/gi-docgen/gi-docgen_2023.3.bb
> index 488f2663cbf..54ca5d9d078 100644
> --- a/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb
> +++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb
> @@ -14,7 +14,7 @@ SRCREV =3D "96f2e9b93e1d8a5338eb05b87fd879856ab7b3cc"
>=20
> S =3D "${WORKDIR}/git"
>=20
> -inherit setuptools3
> +inherit python_poetry_core
>=20
> RDEPENDS:${PN} +=3D "python3-asyncio python3-core python3-jinja2 python3-=
json python3-markdown python3-markupsafe python3-pygments python3-typogrify=
 python3-xml"
>=20
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202387): https://lists.openembedded.org/g/openembedde=
d-core/message/202387
> Mute This Topic: https://lists.openembedded.org/mt/107505901/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


