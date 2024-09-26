Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC5FCCFA1A
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 11:41:26 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.75])
 by mx.groups.io with SMTP id smtpd.web11.40617.1727350884284090851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 04:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Zbyzxf/h;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Zbyzxf/h;
 spf=pass (domain: arm.com, ip: 40.107.22.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jlEPa0h+SnzozZuCikv3kA9Mz1//mDMlMIVum0jMyCX0AIucNSzHEljbrHp7S1c7t+1CaX2b+HPvKM+SPvXxlCu6tJsOzgBHq8lCX7GeXOSjuFPBLG8S/N1kUTauCI2MYnH4kdfApcDBk8Ziv1p9SPAyLvKadqaUqnX1cFEjO082FNAa9yebxTxGt34HcU3ns1yTOclHJ+oIh/bhADpmnP6WU0dE29g9LR/PhqBJ6w/ohi9UY8DOR1Bj+Epz6ER1iG8dozMZDIIqPDyz30ZHCUezwYuQZ1Ojhog5tFzuJlD7WdJtzmiC2NZUsi/LO6BGaOMLXp9dOeRWixuqOwhJsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQe1Ur01xFn7ToHsPYjaToNJR4D0ZdPYb6jf4KBAitw=;
 b=bLnFbJhwIC6Vt7ZnXtKcjIHq78qjjoT9qfE3Yw5OsnodPagS0314heN32WqYjW82ZYbXS4xHLcpZHGDVW2U/s22Jrd8NJuOUJJ57WtXg/Y1fTfvJK9EHKUw386e1rJCNhYZb4QhSofd8ChE0Ik/g8tkije+ASMiCRA1xavY1WXD+JLPWizbyr2wtN/t5Y5mxqmy2NIrWE2daA63YQUmCut0X+DlBH6SMfLasGNGmZzm/H662nG0RoFsparzuhIPak6OnnKjyTkzYiz3bcPQ1gq4D7vFuachsnlvRfF4Xvy1AjEo3r999fIYM7JZ41wazQpHegsll6kKBdqDVulJBpw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQe1Ur01xFn7ToHsPYjaToNJR4D0ZdPYb6jf4KBAitw=;
 b=Zbyzxf/hIScCkJDWd80hiBPO3JQIoMuBsoDoUL5S6in/hf2I9LL9Cp3fari4LNT0WUk+QxJR0I/yvdlhSbsNGXxb9aB4L5lS1OiLCTVFBUGqEoA2Cm/H8vNJGXMYJLoM0v28+jtdJvzI2Kyos6+s5lWZAjGPxSZtwnI37pWcTwY=
Received: from DU2PR04CA0326.eurprd04.prod.outlook.com (2603:10a6:10:2b5::31)
 by AS2PR08MB9893.eurprd08.prod.outlook.com (2603:10a6:20b:5f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Thu, 26 Sep
 2024 11:41:14 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::aa) by DU2PR04CA0326.outlook.office365.com
 (2603:10a6:10:2b5::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.16 via Frontend
 Transport; Thu, 26 Sep 2024 11:41:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Thu, 26 Sep 2024 11:41:13 +0000
Received: ("Tessian outbound 245dacdadcd4:v465"); Thu, 26 Sep 2024 11:41:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9eb34fcdf0ad16fa
X-TessianGatewayMetadata: g/kb0bcZhTqh8AMgHr4qCKJFKBErB0z67vNRiXAFYwOz2/AiI1ZxDrvoHZqHKmug+VZuBh9UZBIMQ0SRfDOtIOtHISKpjw3PkkB+NA3f0JVZGKJ/LyLtjTd/0WUvM4PygR+HwTJy1L1e+kcK++FgT/fCF6NRPNJsrKHjlOcKU+A=
X-CR-MTA-TID: 64aa7808
Received: from L9a55fd9f4ce8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F06899DE-90E0-4265-B3C6-E8419F6060CF.1;
	Thu, 26 Sep 2024 11:41:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L9a55fd9f4ce8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 26 Sep 2024 11:41:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lx5b2GV3P3wTNIoCn2M7hM3zUNRELPhKn3blWU1txd6x624EdMFMswr+jdZVt0DMbVR4L3sYLEt2Lr5iP9ItjhX/CRqpkDe2bObLJH0TI/Qu8p4G4N0t3sxbLSn82M3MB8PWjp2HA9BN/V+1vSuGP/SdxAE50nFz/lUlJe9iYjAlTCIVWOmaKyf868MoJ6cLqvXZDK4S6c9oRyUUwavkD8stNvX90TR5+CEDgtlY1Bmz+8NHSE0WkDohtvr1xttau5dUdVTDPzjswQRTu+1kMHuvB7uK7herKjK5R3cOyraAFk9AwLqctrDd2UCfm+8Xy6GyfX2EjwwixPXuvfbSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQe1Ur01xFn7ToHsPYjaToNJR4D0ZdPYb6jf4KBAitw=;
 b=Ry+/TBlMVVj3FOKQDsdrL1mfnbs8hxa9GJ/e/5SP0M+xwhTIzNf5RjY94THUjTOzyRZhJ7BUulvg8x/IdURNAW2lyFF9a/q8G/S8bthMxsKLH5YUezpqe6HIWP7ERgvUX0Uh3Ni94+tYZWtRmqLSSJuEN1cS5sJ04Z0X6/34B8laZRqTJT0QaXi/7tflJltBpZpPaxB8ZVj12C6PODZ3+RPj/D254y/fyeigrbID2Ts0QM42H1Hp2x6Na4aOKe55r9Bbcul+jGMKJSC7aRoeHkza4XKA2P22ZW9wLMS1AeoQgD94f91gK2h0Y8hijzMJSA0Dm2ju/XvLs5jfTKBJMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQe1Ur01xFn7ToHsPYjaToNJR4D0ZdPYb6jf4KBAitw=;
 b=Zbyzxf/hIScCkJDWd80hiBPO3JQIoMuBsoDoUL5S6in/hf2I9LL9Cp3fari4LNT0WUk+QxJR0I/yvdlhSbsNGXxb9aB4L5lS1OiLCTVFBUGqEoA2Cm/H8vNJGXMYJLoM0v28+jtdJvzI2Kyos6+s5lWZAjGPxSZtwnI37pWcTwY=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DBBPR08MB6041.eurprd08.prod.outlook.com (2603:10a6:10:206::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 11:40:58 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%2]) with mapi id 15.20.8005.010; Thu, 26 Sep 2024
 11:40:58 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 18/47] liburi-perl: upgrade 5.28 -> 5.29
Thread-Topic: [OE-core] [PATCH 18/47] liburi-perl: upgrade 5.28 -> 5.29
Thread-Index: AQHbDxdimOcNduB9DUGbLa83d/BIprJp860A
Date: Thu, 26 Sep 2024 11:40:58 +0000
Message-ID: <3844F93E-5CCC-49CF-892F-9EE5B447FAA6@arm.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
 <1727246960-20665-18-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1727246960-20665-18-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DBBPR08MB6041:EE_|DB1PEPF00050A00:EE_|AS2PR08MB9893:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c59b71-ebba-4009-5dcc-08dcde201fd6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?m2qx0eDqRdi1KtwC8RBHZoIDFN4aR2DeXZV6tkaJIbL9dO3Zypgq1y/BJ9Jh?=
 =?us-ascii?Q?fiJeU246Alft0fRR+dZ6LrYctKlslffxBBv2fi7PSeMt4C6DY/MJFhFxtmQh?=
 =?us-ascii?Q?AxopJWW0AU16kAz1Eaiz2M9xKFsPRkU4QmJFcJoUMZYJxcbJg25xl8UUdEnx?=
 =?us-ascii?Q?fgF0I+eimIKcXG/O7+NHzVuBq/mq1i0rO3IJzQpiQwOhxDVNl1VEtEHArLBb?=
 =?us-ascii?Q?7MMmYuMf8gLcX4WmT9yFH/dKzwCHQUKnlbPwqS4/LqvYHtCwN2PWngHTDz2e?=
 =?us-ascii?Q?5+qju+EOvielIB63TIxyTqdtLEn2UxDzslVmlCqfGACsCaZ4PCL2PXtcjhN5?=
 =?us-ascii?Q?gLsPEIejA2Iq84Dm3P5Ld3kNW+eEiDSy1pBHI3NEwU9zZ5Mp+Fnfrl4N2qv+?=
 =?us-ascii?Q?0D7OztlQXjp7lHpTbur5ZT3sqp8tPgv+IGqAABxXGDqfsPZdBk0ds5bR25pz?=
 =?us-ascii?Q?XsRZ/3f7ed1OnqhpkDfh41jILBk1hlbL3+SabwAITxRsj5osTZnUPuVYggHD?=
 =?us-ascii?Q?FJJ9GDfWqsbmJmOcIRLf7LoDaXBz08ebCdyEOn4HfddytNQiZOAJf/vKw+Ll?=
 =?us-ascii?Q?pU8aSExGSGLgGlMOYPByJKHlqX1RCA40v+qOE1roG9pnW5KH4Q0LkSchwFd+?=
 =?us-ascii?Q?NIqQ06XUOLVd/CqsVeo5sIcTmLFhbxT37Jj0YvW4QyXzJWdOa5v+M8fCcdgo?=
 =?us-ascii?Q?qexx3OUfdrYxwWanmHgkBc+mYvvoikLg4oboJpOFG3E4n7cSkP+oyLCPvERO?=
 =?us-ascii?Q?5/Zgnye5cGIirVeTuS+ejnjN5alCzkCxY/mjuHnsBIbmFyvjd+cEQVvGV1Pv?=
 =?us-ascii?Q?45d6FA5ZSpLcRQwKwKPK6h2/AmU8ZLtrzEwpNA3irF8lIBWEhs+jEZSZe5Cn?=
 =?us-ascii?Q?vJ5PoPxyuLJZwPWZL68uChAI156T+8hrt80d4udXeqOFwflwb9fhHi5Zi9/P?=
 =?us-ascii?Q?WQoSK4JNNbfc2gNLzqKkY1z4+LRNERhMVD48+9SbgSGhW8PH8ZCyDanClD1/?=
 =?us-ascii?Q?IX1CQGp7NEHh31Y+V4W30+Ma8x3jXC3yP2f2CkP5De0akYW/wmx7NQWetD9x?=
 =?us-ascii?Q?9W4i8tZgGSWJDVuhug2/uJBYyswY1oBq+Qhz99khh2Ck7zNwJS2i6FpvhuqM?=
 =?us-ascii?Q?n88qiaak8MvHIi1eLR0G+iWAa6BE/AG8Pwx22eBKJyBADmQpCnAa40pb6fpy?=
 =?us-ascii?Q?4uYnnJtjsPOawRSLO2rc/PQPP98iJMqLLjRdgSdihluombPd0U4wfsk0mNr7?=
 =?us-ascii?Q?K0jCAdSddzNjocAFFSe5sIMbsiND+Ayr55Gs4v5RO3ZkWqsd+XUn/F4S3eMS?=
 =?us-ascii?Q?y3ZacSOuM0hyVj+1w3mjDmGvH/oIfK5z0Cfqgu8pl77WWXjLT5yGJh1P/wdq?=
 =?us-ascii?Q?Pd20xiWeD0y5cmCK7XUS6W8ojMdErjdWteQNB9/thmjYFhDyaw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B81539D70270DC4F8F4A064C91DC143E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6041
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:4e1::9];domain=AS4PR08MB7429.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	318a49a6-c2f8-4d1f-1b6f-08dcde2016ec
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YyOxpfTxKzbr2yEVH3XMfPvq/wp5X3ECvzezsC4hEDPkApcTEf0aXdbWj2hR?=
 =?us-ascii?Q?98CzpnhoEeHtpVOq4bev/tNpc1fJZ6NVAJU6Lxo8gOx7JeI5kz1MCrXpnRFr?=
 =?us-ascii?Q?ir8SXO86eUkH6H9vOGbliFpXNMtXy3BxRBeR/7SiV8dVU9bRaPcFvCcB4XBM?=
 =?us-ascii?Q?DoEHtFJafu29MLu4K1N0ioEwXpZ1E+wk9qCggoRLQQk5N+W927ZDkgMc/bhR?=
 =?us-ascii?Q?Xx3sfb4WE7UEyOCl2aALVfSeqXMxWOkARpzsH1pHjTPyyHaQTASFeUGIIgHP?=
 =?us-ascii?Q?2ZJIyFnatZMW9rvhEreKCzheiFyD/maZbsj0jq3DcghwGHIB6p93vlPIf+ww?=
 =?us-ascii?Q?L3XdH2yWBvzjxydzYBi8Fva3rsljIUmTBcWOGLnN+WkiNFq3+aUWeQT/wTa4?=
 =?us-ascii?Q?TUl70tTV3gDkHkVAzhMTO7kmwub7NNzsRhSBaGlSNRlwy7SGE9irQH947grS?=
 =?us-ascii?Q?0FR4TEqVLTTJ0bWqf6UDMWQ17TwLNIzQBGnGCEdDLQKRO7/xOo2oDvLYfWpu?=
 =?us-ascii?Q?75TB3duxyxH+7aY1J+ugc+uSXI0PH7+Nzilf+u3NA9pFReOXoT/9OVfex6U8?=
 =?us-ascii?Q?1u7FTdLVgQ8z57Y6IF029ZJ7WMLlCz9pqc1Zu6hHpz1feRMb/mOOjXfNNXAB?=
 =?us-ascii?Q?oXIBTjo0jPr/TiVhOLUKSIY2x+NE9XZ0v/Xh3XFsTm2/wVDx48Kq6dA23EuJ?=
 =?us-ascii?Q?VpnIn7XifLhushvf7ZIuon35totbR0ONHkrYqG2Mu9dBrEAz+3dpNMnH7arK?=
 =?us-ascii?Q?6BwsiLce2tdghE5FNYjWIMKreJinJnQ57hKEt3QzLNj3zUyQpf88b2/VWpdk?=
 =?us-ascii?Q?IXtZB8RqNKxpMSVoPg4coQ6ODWtE2ouKdDwuJmmQ14ADM0o8PusLEWVLfU54?=
 =?us-ascii?Q?1KGSHAzWTg4PSYUZeK/K2U5P+IxXNIpptIkMM9F729khDp05+puF84ZP0KAf?=
 =?us-ascii?Q?kYMn5kt+99yHKWql3FOv9gYuY4KTk94NDqgLYc/Gpk/m3TC0pUy8maQV1p2t?=
 =?us-ascii?Q?MQPteA/NGN5b1Zbgwj4AD2IJ34365eyFb7ldyqctRZySx/3SlNrjmG4Yv140?=
 =?us-ascii?Q?dOPRmA1qo/GAPA6GgKhBl/3eEsLpwK+vXPPpjmLwzP/Akd8EVCKtHS+m0VRt?=
 =?us-ascii?Q?HpzxksIiaBdbb3oThT4MR55Y6eR8HE4IANQnZjOx4FbXMuVri2FNNGyDFGZ+?=
 =?us-ascii?Q?etLoDYJNCYSDZYue0omdTLYKB82WxOPxHwfCAnlI4sNvc04C2l1Yb5Ahhh/g?=
 =?us-ascii?Q?+q9rzfYUf5HFg3tnd+W84WifWX8P7tSSrUp26Xuntx5Vl8D8mBonuEvYsCs7?=
 =?us-ascii?Q?kyjjIaSYp9gPkTT6zT7EM3GY9ovb0U/CjjGYhdDCUIjGGA79TP3mMUzOOhUo?=
 =?us-ascii?Q?q0LK/r6ctU2KDZz46CrzBOc2DLsj?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 11:41:13.3917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c59b71-ebba-4009-5dcc-08dcde201fd6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9893
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 11:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204976

On 25 Sep 2024, at 07:48, wangmy via lists.openembedded.org <wangmy=3Dfujit=
su.com@lists.openembedded.org> wrote:
>=20
> Changelog:
> - Add otpauth URI

Fails in ptest:

{'liburi-perl': ['t/otpauth']}


Ross=

