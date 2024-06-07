Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A262C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 10:08:39 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.45])
 by mx.groups.io with SMTP id smtpd.web11.38341.1717754914247848624
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 03:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QKoPIwIa;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QKoPIwIa;
 spf=pass (domain: arm.com, ip: 40.107.105.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=keAnrJUqkBm1g4sCplit7dn5v4c2P9lH2nzZ311gM08qhQh1dLvTB4YPFhHQat5dOYdq7U7eRNCcq4mimyAy+8iw19bI+pOKF9R/Sn5fkuHORQbRcdGIHv2ALIA2YbGYM1EBZtdzyUklOOfvg6fE4DFSkzS0Y9vBGcnarKW9DqhKaYBjwOoV0klEBYSpyuHNtZ5emvFYybtVJ8H2AKxR8fqbXjnAQ+688SQMezSQs4PlGs9JrF/CqjIDzcqEPouebIa9FbtNwHVkXQR6KH2w+YjJBEscKQT+IOMRJrVyvaS1S0Um84ScZ8nUsqlxxfHDx22BE1TCrPJnvYwazDtqzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgtrZ6UaifRG1mRNMZOjO8O8sRx7vA39Zcx2TcMfbR4=;
 b=e0QmOu+OJbugZQmJFNPvRkkQSI4fsP0D/WP4UgbB8GTzYOvviwfdOEK9ioVkNDjLAFgvalPUtoD/ejbnoHEKh1HydVD75XSaHX4cJUhbuJ6Jp2xQTwSshUYEAnTLdPz99G8SX9Gzn2SPl86/AkQKYx6ooD8/jfa2yk/9HdqYA3u6iJMKcJBgJj+MRnkwHy0vJ41rzmws3PnY3s/5WIFhGSzVMR6h415YcmnzGeHejt6APbZDPooWmiW2j+gB2jK+/nEOi6BMaXt5N24+QgHOMgFVHReyZisF/iUviYVzS+cIYTb1AVFtkJZtPI7iYx5ZDdg4xpnBGc7+3yy1HHPQyQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgtrZ6UaifRG1mRNMZOjO8O8sRx7vA39Zcx2TcMfbR4=;
 b=QKoPIwIaZIg0q11IO/wimT9YzJqo9wDbULacG42a2kYIfFlG4AndKspmAM5y2s5jjVxgANr/vymQCVeG16KWeQK37spQ8vDQlli6+lGIrrFBCG/xIvs93QDNH0ijWF1sHG2r33SdcpP8i3HKrsR8RHkVg1fobvgC3MyW4r75pnE=
Received: from DUZPR01CA0340.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::13) by GVXPR08MB10498.eurprd08.prod.outlook.com
 (2603:10a6:150:151::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 10:08:26 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::cc) by DUZPR01CA0340.outlook.office365.com
 (2603:10a6:10:4b8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.21 via Frontend
 Transport; Fri, 7 Jun 2024 10:08:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Fri, 7 Jun 2024 10:08:25 +0000
Received: ("Tessian outbound 10da333da357:v330"); Fri, 07 Jun 2024 10:08:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dadc3db597dbf0ac
X-CR-MTA-TID: 64aa7808
Received: from b6159ad214c1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 97068662-A223-4656-B011-C1AFA7ADD51D.1;
	Fri, 07 Jun 2024 10:08:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b6159ad214c1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Jun 2024 10:08:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q24llcd2mN23Z0r6Ecd7V78SFMbfmyFRd2XStDVrsVSqvUKgDEg5SfCircr13cFpuHh2I5P74fWOSlLRszfEOLooHrUcwDxpKwN5Ag43/+NCZCDigIXO8Q04itRE82tVcNlRcreY/rNO20mydM/jbO7MYAQ6VVTLdu2MOiNjHU1r+dtnLRXy+gx/8cj7T5lYQbb9yH1ghxMkWD9LBBGrA3pfp/L59EstqSySpjRXP7e0BvTGq0GvEePWjjluARLMyg7QtgttQh+/+kULFOrRR4H1Kl5nk8g7T1Tns8/k7TEhpf2jt5A0CROcvniyqhyrFAHAQqdPPp1M2Tx4NpcZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgtrZ6UaifRG1mRNMZOjO8O8sRx7vA39Zcx2TcMfbR4=;
 b=Nu0C6pm+5CffueN7MkfrCJtNR6oOsjyonOB6q4cxV7OYwPebDgn1UwaYfe9N0HVP5FV1Qyy8FCAx8R/Wpizz3jDf7NuLwMJ0uri4I1+ILCkTxkLJuQZkbOlf7ftvNbXTJdkpfTNChaI2YheWMqyNbEZsT+AhDchm6w8bQeqgTkEka+O18ocJ5OYI5QM54kg78CKVmu8rNGinlCn3cVeMGEUQ9r6oqUx8ahc7VKfpkF46wJsZK8eQpEct8IGiCM6qXFAMfKBuG6BDpEznfv8yshSGXEdpQ7+T0y7FKCZ5gkD06lgojwhSTZqp3pPv6TwnhP+EbDD4wFmM9Xxp+IHrdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgtrZ6UaifRG1mRNMZOjO8O8sRx7vA39Zcx2TcMfbR4=;
 b=QKoPIwIaZIg0q11IO/wimT9YzJqo9wDbULacG42a2kYIfFlG4AndKspmAM5y2s5jjVxgANr/vymQCVeG16KWeQK37spQ8vDQlli6+lGIrrFBCG/xIvs93QDNH0ijWF1sHG2r33SdcpP8i3HKrsR8RHkVg1fobvgC3MyW4r75pnE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5705.eurprd08.prod.outlook.com (2603:10a6:102:93::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 10:08:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 10:08:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] site/riscv*-linux: add ac_cv_func_fnmatch_works
Thread-Topic: [OE-core] [PATCH] site/riscv*-linux: add
 ac_cv_func_fnmatch_works
Thread-Index: AQHauKuLr5GKo/vjc0igkTTlA4hBYrG8E9cA
Date: Fri, 7 Jun 2024 10:08:17 +0000
Message-ID: <F2AE1220-171B-47A7-999C-3DD1E7072495@arm.com>
References: <20240607072252.1732005-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240607072252.1732005-1-dmitry.baryshkov@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5705:EE_|DB3PEPF00008859:EE_|GVXPR08MB10498:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4afd37-6d85-4791-1bd3-08dc86d9c566
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?VTh+Nn3J+JKpGYfc9kBmWH4+g0iKs22jc3EqSvdHn6yp+Md8jCxPG8lBgcmJ?=
 =?us-ascii?Q?rKRLlMySsmWuNqYs6CvkOhK1Cafell2OO5mZ1vivcvjCwsyryE36gcnMb4q6?=
 =?us-ascii?Q?MGo2/UKksBfjj+7sHAVeAn0IsZCp+Zw6KDBvkS8sojE5u9KC9YXqPXNn3qSb?=
 =?us-ascii?Q?w4VT8oUw/WWRIpsRI3fKL9bS4y7OldbvstQAsXzXgkXDCKWHATM0R6+7jW8G?=
 =?us-ascii?Q?ST5CyQ4IAll/Q4EgUx0RmQTHAER53qOoD9VKfVCxqIg6mPZ3sdo5BbqhwwHU?=
 =?us-ascii?Q?9lG4Vv6cx3eqcRPk+cESa0a3nOliBm5ANvU6ByFTCv1afJBC5C1asGLU3Ruk?=
 =?us-ascii?Q?94SxMriJ0XE2oFqSsdsHaaQzTlCQKOSpZJ9eA81XG8qHW3EduuaqLGM06qhJ?=
 =?us-ascii?Q?ti4YnErO+XgM+jGhn6sifzwJfS+8UsdaUVoeMg07TmXofv5U8xpV7LCF2vU5?=
 =?us-ascii?Q?uS7Hbpb/trmYjw5Ti/YETL6hHzaDKR9IdlBCfYHi7WIlb5lbm3LuGSdBTE+m?=
 =?us-ascii?Q?nArok32FsejzqaJZhiKPrptNn2wT76DIT5T379qj/6qc/e1iA5lrKky8mQMP?=
 =?us-ascii?Q?EqiCz7m9jV2p3dztQxFiabu9bxLX4q0GuiJFlMi+k+SIq/VPSEVhmsS9jpyV?=
 =?us-ascii?Q?g3rDAiWgsFBEpOqhBeM3akVbkGVSsAghsJKm/rC4QLPg/bF3jbYkuQC8MSBR?=
 =?us-ascii?Q?pthH541aYPknqtKMLx6EcSVjY/oWJ3+KAKsELoelLcTZSDEuUxhrYQ32GZ4t?=
 =?us-ascii?Q?gdcx8545zYOKjYelhTjUXIgTBSJm03CKJ4HY+jdNXkvbJqUPL7dPBzolSLmj?=
 =?us-ascii?Q?XRfsK6kUBHkYBqc3hjZaaiwfee9KJ52GJD2pL/4q+dIsZKESHHV8A++xAua9?=
 =?us-ascii?Q?rG6gqwIFk3iyqzGJ84cchHZAfaaflFTJtPjSX2WkD5b5zRe//mzX7EJBWUvH?=
 =?us-ascii?Q?gOnfRQ6BYItwTB3fqA08I2/DfpvqGR9r7gcX7VhRKIgnOQhn55uEw/WFDoWL?=
 =?us-ascii?Q?n2SZiM87p5vY6T2gv7ZpLMLUyVdwSajO5Abw1T0TuAmylprWNrbLFVkvqrrT?=
 =?us-ascii?Q?lWVTskI8a7VUTM7mUqltiYBt3mjEzsnW0YiOPYI11TlVQkbyexcEGPFsQ7E3?=
 =?us-ascii?Q?CX6uGHC2dcgXebinnYxqvHv+BbrIstOHTHxat8AyEjxT3oNeCpEsF3n0zHz8?=
 =?us-ascii?Q?zhFtdtQwf7WzMG6lQvlBH1D9A4eeIYVjyVL2XZqqimDCArRXbOGTFXheSXgq?=
 =?us-ascii?Q?aIdxjZ9vLPUus92LE9YBQIIBVTq1Zeki9k4SjW6riBsYiW/BFIJEAxSNpqwk?=
 =?us-ascii?Q?BJ467ktVae1hKgmayV/KrFNC?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0971438E5A649749B86E82A583542470@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5705
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	efc026bb-be02-4d96-6cf4-08dc86d9c084
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017|35042699013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+w2jdY/+PbTcyZntpdRzEFxdCS+eQ2fzwLrMUNduavbKlwPzCM3kxDBTny5c?=
 =?us-ascii?Q?7a2lVttLcydPV1JJILQ7qdhI7b59GVVMo/gtdlP8VUISiJ5ZfD5RN1TRxADU?=
 =?us-ascii?Q?W2iqXMqGem3eV2WWcnIpy1eAP8vKHOftA+JYyeH6dNAivq9GUrNpXDmA0W2g?=
 =?us-ascii?Q?Kp8UhOe4ZHJfpgos0GGg4g+F0gHa0NFsyD0CwV+nEk2fVYKrcNPlhmXE/FBL?=
 =?us-ascii?Q?skOUC42FMtxlomb9H7pBmI/RJmpUKBZsbYnJ+CiPj+1A14Y6XZae7trQ/ntU?=
 =?us-ascii?Q?2Cq0qw7Nquf4QAZYWRg8i5M3LdZe8M18ZhkjrSwpOwEmdykKS9ex8wZ0Ww4s?=
 =?us-ascii?Q?PsnMHPS9+ve6+O/+hyaLtGi8FRBAywBkxNrn0wF/DebFMEe8d7/tH77z+MF7?=
 =?us-ascii?Q?mMvIjnDivWhV5pQpTjK5gR8E1Wnq4I95rtiJdPzOBRpUheYa8v6Pu/n5kTK5?=
 =?us-ascii?Q?QCCZyE/B/AQgrqGiHePrMoqJKViRClRJ3FtKfyCZlXl7+qerP2CCcqV8B8WE?=
 =?us-ascii?Q?9eGW6/ltQu9hjMtz6hA7NX4ghWOikbLUhRE4TlEcJUlLSfTSntZza88UZceN?=
 =?us-ascii?Q?o/fi9KiZJDPjaL2K3DSqOU5XaJS3dzJzsLZ9KFcg9tp8iSVfILa+cB5P8WLg?=
 =?us-ascii?Q?nnanMIMizb9HId60ZmcA3LgCbTyX0T9KID2Y6xrk2wyXy5KrCqycJ+4krvqD?=
 =?us-ascii?Q?NtgnGKFYAFbO7JN9xA1bZ6mg7QyGUZRg0YtOlcpk54kAA6bBSFGPOR0CoUc+?=
 =?us-ascii?Q?OtAQ7A8hiDND04G6xiR2aPafKSzZ3zh8WwpISMs/yEBppLRH6B2sqvPOIwRy?=
 =?us-ascii?Q?BR7TsHKNNYAHFSLKzYZMhyc7+9G/Jh7hJOZEOFmDCJIYm9bAsAh+hol6ZgIj?=
 =?us-ascii?Q?FnubHhy2eLHLsdG/HOIWsv/G9lgjusWFKvDN9tT78xMfp9cCC0S8H2hSJWvb?=
 =?us-ascii?Q?m+mc9wGoKt8UORIM6V4Ozfx0ph46FUD1ZYPyrBw5rZ/oCg602t8R5QkFibcS?=
 =?us-ascii?Q?YpwYVz44frntk5i7BxuNs5AISzDZ21xp48Lc5wU9CXO9cbWT7DPih9u/DGpZ?=
 =?us-ascii?Q?KPr/BrWVYdLHpe7M9tuq0VdO9ozBsprsX26WekFONVBTWLWLD595+0Erm2g9?=
 =?us-ascii?Q?gJ10aWY0Ki3PBnFwibZ18M031USDvNW7Xe9pTxXt662GmyE6MlIRcSVMia6U?=
 =?us-ascii?Q?gjWTsZrexbeW7lHNLhLR7bYaYxEsdixHSnNdjbKG6RQz6jU15SX+p8jsgoJp?=
 =?us-ascii?Q?moyJ5VcLNorrmUmdGcp8wMvAZnuzLnV1dnldp4fFX7YgWbTvlH3hC7UvehCP?=
 =?us-ascii?Q?f+K+v7WHe9nZeevK/Fs4uM4FV7RkAOlFdPGapFdU7h/tWO+LcHtHwYjkNLoX?=
 =?us-ascii?Q?ZqQTulw=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 10:08:25.7596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4afd37-6d85-4791-1bd3-08dc86d9c566
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10498
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 10:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200434

This check is not architecture specific, I just sent a cleanup series to mo=
ve this cached value (and others) to the correct places.

Ross

> On 7 Jun 2024, at 08:22, Dmitry Baryshkov via lists.openembedded.org <dba=
ryshkov=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> From: Dmitry Baryshkov <dbaryshkov@gmail.com>
>=20
> Other arch-specific caches have ac_cv_func_fnmatch_works. Add it to
> riscv32 and riscv64 caches too, otherwise cabextract fails to build ([1])
>=20
> [1] https://errors.yoctoproject.org/Errors/Details/785949/
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> meta/site/riscv32-linux | 3 +++
> meta/site/riscv64-linux | 3 +++
> 2 files changed, 6 insertions(+)
>=20
> diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux
> index 2cc26f3b93f4..4956639f5566 100644
> --- a/meta/site/riscv32-linux
> +++ b/meta/site/riscv32-linux
> @@ -5,3 +5,6 @@ ac_cv_alignof_unsigned_long=3D4
>=20
> # startup-notification
> lf_cv_sane_realloc=3D${lf_cv_sane_realloc=3Dyes}
> +
> +# cabextract
> +ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
> diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux
> index 384d3bd87747..cbfebf5e3bd7 100644
> --- a/meta/site/riscv64-linux
> +++ b/meta/site/riscv64-linux
> @@ -5,3 +5,6 @@ ac_cv_alignof_unsigned_long=3D8
>=20
> # startup-notification
> lf_cv_sane_realloc=3D${lf_cv_sane_realloc=3Dyes}
> +
> +# cabextract
> +ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
> --=20
> 2.39.2
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200424): https://lists.openembedded.org/g/openembedde=
d-core/message/200424
> Mute This Topic: https://lists.openembedded.org/mt/106539044/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


