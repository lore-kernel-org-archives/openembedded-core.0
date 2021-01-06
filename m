Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.42])
 by mx.groups.io with SMTP id smtpd.web08.6961.1609934682207124793
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 04:04:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fU3+qx2i;
 spf=pass (domain: windriver.com, ip: 40.107.68.42, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhZM07QZYYqa8SCvOXmwa2FiW+h9FI4jqMN6p8fJY3jaOxNYo3q8j4Ec87+8C6Thz3Lw+7Q8ill7f7OV3jtFi5EO0M993iny59pgTDU4XNcq1u6Q/eT0sDWsWTF+tJQtqfT4EZxWA2T1ue73ASmeDepe2uSeu1HRlAGD/DR+08q8UJqS8ZYB6PVyDEA6xMU6BK8AjT3yVNlEnMvrHE5RRzrmmrrfxg2tLsTsiyXE9fsQrifdmN1jKAZueAYR245IpMu+zX6as+I6/yQhoW1WuSCgADq7LrkS7W2NTdI4wRH/AlFmx67UDdhCRC7YOES7WmpnYGipWy3fIjQ3X9rZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osJ1p2T7lBE6OKvz137udPzmxLoS9d6SquBcWSRt1RU=;
 b=Qt0N2cTA5GiUcNtgc9QQnLvTFrBYY0xrT3nx75CvPBxVM7dhSrAIan9wFWDvWv3FfEQt+NRQg20uE5stdS3vFy+M96xEfpzUsoQtU4yugYzYlI+2ML1z0NYLV+ujOE4ZkVO1EwpCG2axatKFxOHRDm/zA0mrsMPX6pa5c9gYAyuPAfpfu8mEPE5PFiINNM6a3r5cy70rdF8L96Siusaws3jo2EUq5FigbvGYA0tY83LNE7kahsBWFHVjloy6bLbcw+oUG8UtRiLESIEtJGZUgxvnHcldHoqofl2xcwamCAYoFvbBjduX3Stq13C245XkfI1di+Hca7ywTnjl6W3+CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osJ1p2T7lBE6OKvz137udPzmxLoS9d6SquBcWSRt1RU=;
 b=fU3+qx2iKFob3RWXfJEIRZvmU2FbFkDuj58AIHjn2qRg0yTuqgnu7/xWM1BWgVkN5LpF7REM+gvxEHBRXHeZGAuaMKDRgXlEjokkM+BXC4/ZvQcQI4yeOlLuKFM6cr2njI5JH1F/kosyegt2bBa9AQWBvF52+XlKLtb9gX4Hmo8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (52.135.126.77) by
 SN6PR11MB2894.namprd11.prod.outlook.com (52.135.126.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6; Wed, 6 Jan 2021 12:04:39 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3742.006; Wed, 6 Jan 2021
 12:04:39 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] base.bbclass: Fix dangling NATIVELSBSTRING
Date: Wed,  6 Jan 2021 04:04:31 -0800
Message-Id: <cover.1609934325.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BYAPR21CA0017.namprd21.prod.outlook.com (2603:10b6:a03:114::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.0 via Frontend Transport; Wed, 6 Jan 2021 12:04:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ce20c7d-a6e9-41a1-f2da-08d8b23b3e51
X-MS-TrafficTypeDiagnostic: SN6PR11MB2894:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2894509E2AD496200DB8EA12FFD00@SN6PR11MB2894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/7LU0T0c9syAe8XwbOioub8e2OEi3wOY77KDACqg2FxHYFZ9FcNAcJT/Gti2eyRnm5SAFOgyLFKc6qCIWFrCmlj57TlpIcXAu9ID2wKfhoNIJnZqad+t2wMO9GgqxBf6RG2XhOVXycJeCz4CQEA+26J1hXAvOetIYAW3cNYAHtaKtjzDmdXmwGhkImCmR1DnYYgzXgVfgqYbTnA/8XTYuYZE5GOLtUb7KBEb418M+1MU1l6KiKS+GMpezncssrWTzLOvmU5cZz/1x17Y5KvRdcUtg5OoUA2Z49V/dXjypaXU0CNu70AiUS9KGyOdFjW17C1kx5FFU/54X1yeyH1Tl5cjBnCG+qcz0ZfmzIJ7G7tcFr8wOLuxGv5G7ELSRRdszD2iSnN+iwEb9RMoEfixgXWuKAunBA2KA3AmlE2PNA6yIGDRsuW5uuLujq/if1uzrQSQtIXH5E/bdLtZZohIf27I7lXi3LDzhB59dAXuk7YwyWAUKmXLAKjkGp8iI5VQ9+A2oTLozt+CcFPbn/A6+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39850400004)(136003)(396003)(8936002)(16526019)(186003)(5660300002)(52116002)(6512007)(4744005)(66476007)(6916009)(26005)(6506007)(36756003)(66946007)(478600001)(316002)(66556008)(6486002)(2616005)(956004)(966005)(6666004)(8676002)(86362001)(2906002)(156123004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?xcauGEyDeXCM8aUxDBsEsk8CGKvtMUkYxQh42HXcKBKvKpvs6YInVrnOn3Cd?=
 =?us-ascii?Q?9Z8n0vgJynP8R9DwuavJKvRAa22ZKYE7rO+v9PzSR+kE8NzHshZekBYKmvua?=
 =?us-ascii?Q?ndM3Zj2vAkmncqvKAd52hOsVTzWdAX0tjESnUe2M9w9m7tcBTDrOCErNbQ7z?=
 =?us-ascii?Q?2XJy8dS6696P79tfmu2i/MNmCHjxIpAkooUXnPmyB0qU1XThAL4oOv1F0wLD?=
 =?us-ascii?Q?4BRoIHRl63cClXtrwSdbZE1MFdh99XSomslytDaLcgaUT+phQnNJ5rxn9gGH?=
 =?us-ascii?Q?WZVyGKGkTfpRoLZ11d9uVR8xjmJw85iaRlmzeI3RyYLUaAWPYdy8BJRFdv5y?=
 =?us-ascii?Q?wuLDHevXtNvFgfciDzKTNJTUIiQOJuQuL+eU3hub7MALtucgqhsVaXw7ul6n?=
 =?us-ascii?Q?PiIUZ4IjRZ2E+8HTiIDzslAKM5ix5afMSYl9iVrRnwSfa+O8u9PJNDPnEt+U?=
 =?us-ascii?Q?1VxC4A5zFeJwJoUxy2icjPXdqL8ss6mH5gVEZTnjR96oHt7/s54hHmqmXxw8?=
 =?us-ascii?Q?AA/n+RlSh5jFdl5y6ytEYpwzgsv88mt1da27iTw9u6r3++4R5bYtuRvC6P0A?=
 =?us-ascii?Q?BVDQsElv1BPEjwck/nPfvthT0hbHMcz4Ku+GdmMixwrxEIFM2c4NbMArkiZs?=
 =?us-ascii?Q?CzidRU43ibCypTHiP1dnkhmx9vi8xa7uw29jb+xA9x9IU01tN+4fGfcMHi29?=
 =?us-ascii?Q?w6LbYli0UC2vJkiHncDIdP2WpbVkwsH365VwKJyyDm4vgFJETchENF3E1GKw?=
 =?us-ascii?Q?KyIBEt0PR071GlhaCxsMeAbOShiSxYOQP1DhLAfwEUzTjpE00WqxhhtaBBP4?=
 =?us-ascii?Q?Fw05Is+mIm+sLK6ISaQi/o1sFkCnF7gUdsO5+t4arCSwC1YbUYgOwfSjy1po?=
 =?us-ascii?Q?rR9GCI2dqAe/qlJtI2HCjPuEzFk3+dnindN5CnfJ0HGa55/DLtpdSUJnwk2j?=
 =?us-ascii?Q?hjpG0L+KCOI8MmnHmxfCP0dSyichb7C/dvePBrCrRfE0mlUQor9E07iZLAkB?=
 =?us-ascii?Q?wXS+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 12:04:38.9918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce20c7d-a6e9-41a1-f2da-08d8b23b3e51
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TR3yQSW46Or6iKfODoF5z7wlS+MOR6IvGetNfw5TZRI6tNoICWZoVlC+yprpUz8UB7PP2BnxUoZDmB+aD5Z+/0NZxZ/GwonejeWEHY8z2QE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2894
Content-Type: text/plain

The following changes since commit 23cb39a5fa2a55681e7bc2605f435135cec9173b:

  diffstat: point the license checksum at the license (2021-01-05 13:48:07 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/lsb
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/lsb

Robert Yang (1):
  base.bbclass: Fix dangling NATIVELSBSTRING

 meta/classes/base.bbclass | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.17.1

