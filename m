Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4898C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 14:46:11 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.63])
 by mx.groups.io with SMTP id smtpd.web11.44131.1717771567710489641
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 07:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VaB7nd3t;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VaB7nd3t;
 spf=pass (domain: arm.com, ip: 40.107.247.63, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mGN4n66iqujj2z4uPsemQzwqHJbi08NKE5HmG+ohjNp77vtI/lqhWG/UQUjV/BiHcwINhtO3VTAFK9ewIMVD2y4n5em7+GsomPPzrA8WU7ggWA/D7H/2VejEW+SfrcgnaNhJMfMI1lszSiNhijoHGwU3SKVaAPBP1vwecmSnIAvesh5OMNAo9QpvacjxO0ovBqmFqQ/OyXHIpie56BKCT/yanMtvzO5Qi2dep/wwhCPNDn6SHbZFEVsIo+XL0z37bitagmcfuOu21TepkSdgWvwg17S61gOvn+b+kzV7iK7qLwxUh14F8eSih3eeHWWOSgUJxHcSZTfXFu3F1TNvVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4G+Mdid+j+Lwo/NPxTbMbJLcPpA5Bf7rsGb8Wbq7r2g=;
 b=kJJMkNFC1ulVujmL94p83USWuzxl0roacfTtK9HI7JEiKA6lCof/YdvJ483xqJWxJVQfDG6QL6jlzsohKY9yAgVjiYI52q/gimYbt51A2E4PVD1judO2quIXG+cS2Q8oXIvwN6JZPUkrumn966H6dtSUKeaXkl7v6oMPGTLT8DZFXOvM6w48b/xgwBh6T01g00RhyC5JceDDBXL6JWhQ1w0Byj0L1W/7Y47CxYoSNCyyQGkU/EgRCunFLr79TrolNfA4ON/ucdsTSYJH/S5H1XS7AJmcfbCzy3n+Azl3V/frMasiqm1NAuvQyaqUCefUy1IBbvnLH3qoD1PhqCh6eQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4G+Mdid+j+Lwo/NPxTbMbJLcPpA5Bf7rsGb8Wbq7r2g=;
 b=VaB7nd3t3dGOVWOMQJQDBddRpi+0E96IW9ayO39ZujaaY32ts8hUHmj8h9lo8VJXxoJi69xf+xdsbqeGuLktq9PCtGDTVBheHCo3rLvGDe+7vyC9I4FlPFwyocJzoTN5/JdAF0Scf0JtfmVMSdHeAusrTvNK7aVKwU7uQm/MtNo=
Received: from DUZP191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::23)
 by GV2PR08MB8509.eurprd08.prod.outlook.com (2603:10a6:150:b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 7 Jun
 2024 14:46:03 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::f6) by DUZP191CA0004.outlook.office365.com
 (2603:10a6:10:4f9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.22 via Frontend
 Transport; Fri, 7 Jun 2024 14:46:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Fri, 7 Jun 2024 14:46:01 +0000
Received: ("Tessian outbound 22b47b37b644:v330"); Fri, 07 Jun 2024 14:46:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 24f2b88825046ee7
X-CR-MTA-TID: 64aa7808
Received: from 8dab192107b7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B96648DA-2708-44F0-955B-68B2079CC2B1.1;
	Fri, 07 Jun 2024 14:45:54 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8dab192107b7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Jun 2024 14:45:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJPwyP/mQEXcmJHCHic9thGxOGKKPWj+1HyMZ1EDBcVQOZdw+ZqomFLeGuysI/wU8Cs+3EHrdde8NEcV92D79ZswI5HpFGR1EtBQA+TrS9VjDfmWGK+GzVC4I1mpssGOKqnzbDgel6PTUfLz7lgVIvVvfdbCisi5s4jRqwtpAZM8Lvkt7P3ZEwisi1Rkazc6dh6sfvm8ZgDkN6IRJhNYWQWDohlhvARx2EWmZ82pAdPb1UJ+eZfgvbC/NLBsYP5hAHIcjmiPb/rzFDerLhQl/oOc+rF+zFdddRAAMzjtZKL7F4GJes/4OkMrQQ4QpQ3606OhMuH+H0+M0RmvzfMKMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4G+Mdid+j+Lwo/NPxTbMbJLcPpA5Bf7rsGb8Wbq7r2g=;
 b=D+AD6LkuFQsZvY+xAMkzo1PwYsvAgBflWvMvPRZ7FDwrK9ORLE3ALME2G5RMwl/wBDXO2Z254evSzfNnJH+Zb1RZoU4WkC0zcXjuMGjbjLj5IrJNj/WD2PdCyCUrqsXoXGVtrMyhKCXV+DRT2yr+aWU5ZRGFPGT/Wg0XLaDJIOq3dJTvV2Om3ivsHXg59H+zOuHnDnjRTFQANCWqt+tqT5QyD2QUl52ijbjAu6A/EhSVCG691qlBRgOi1sfqmmddRHXiGgEIbKT6vc2BD+KThtab2/FGEWBMb2rw6Yoh6qk81jZqs10Oz0pC10A+pf95F+evkl5GbxbkHjoOyEHcmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4G+Mdid+j+Lwo/NPxTbMbJLcPpA5Bf7rsGb8Wbq7r2g=;
 b=VaB7nd3t3dGOVWOMQJQDBddRpi+0E96IW9ayO39ZujaaY32ts8hUHmj8h9lo8VJXxoJi69xf+xdsbqeGuLktq9PCtGDTVBheHCo3rLvGDe+7vyC9I4FlPFwyocJzoTN5/JdAF0Scf0JtfmVMSdHeAusrTvNK7aVKwU7uQm/MtNo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU5PR08MB10415.eurprd08.prod.outlook.com (2603:10a6:10:519::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Fri, 7 Jun
 2024 14:45:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 14:45:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: ChenQi <Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/2] coreutils: split out coreutils-getlimits
Thread-Topic: [OE-core][PATCH 1/2] coreutils: split out coreutils-getlimits
Thread-Index: AQHauAv2qjuTSjwIe0yTdY4KAjFfgLG8TnwAgAACSgCAABHcgA==
Date: Fri, 7 Jun 2024 14:45:50 +0000
Message-ID: <ED5C1C84-D389-451F-8D9A-242D4C7928FF@arm.com>
References: <20240606122013.145187-1-Qi.Chen@windriver.com>
 <F1C4FA48-6A4A-4471-8AE2-1C1E3AC20A97@arm.com>
 <CO6PR11MB5602F9E6285EBA317395BB3BEDFB2@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: 
 <CO6PR11MB5602F9E6285EBA317395BB3BEDFB2@CO6PR11MB5602.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU5PR08MB10415:EE_|DB1PEPF00039232:EE_|GV2PR08MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ffa703-caa0-42a0-aace-08dc87008d01
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?jbV1uhZ+QBB1aB9Hv63QiR9HOO4sFdpJhOLOclan8iEXIv+sThk/i4uXRKI7?=
 =?us-ascii?Q?6dAesyASz5ynsccJ+QFZnCEvP63+TCzdHvE0Mz9BCum+h/f10GlTCekdIPA0?=
 =?us-ascii?Q?7PX26SXUtROSR0LTNRLkn7aVt00aZ2jUgLEh/+1voLqfdeWJHVnumADGFhW9?=
 =?us-ascii?Q?OeImXZJnCee+RoXHtXZpen8PBrP5gVOqVVSPF9otRbdsVJVXJMzweyEQ8dpN?=
 =?us-ascii?Q?6A0fswwti0+6H61RTVTcyGgKn514nsY0or47fiX3qbC6Qv2yw4AWsYN063z7?=
 =?us-ascii?Q?wPrKAPudBO0Foo4mr/i0HKRtWSc3osXaDade3KGXmXa5sS6C7EdvqlrzDzL7?=
 =?us-ascii?Q?sfw3R4LNaIDtZnQC2msLE+ui7P10p/L+3HU3pOhrIjksX0KJX5S5S+cxZVW0?=
 =?us-ascii?Q?79K3c6OXiJ+F8ZaNqiU7zEYNJ/Dbw69370nwug7R/cqhtnRoahFXUJpBRc5u?=
 =?us-ascii?Q?XWCJj9Zw2nptwWpuY8xBQMPak3fTkRiBgYCJyULf1+P/3JwDgBG52CeHd6jI?=
 =?us-ascii?Q?2Swrk5SmEeA3dOTFBkxoscOPkpKG6JioSaK2zlsmBF6vJnr+ogv1fLKehLUx?=
 =?us-ascii?Q?2AaAE8S0j+v9OhbmJOdwDOLxMoF1ASJ2vvvejaTFkPieHtz4Mj6I5C8QHNjV?=
 =?us-ascii?Q?2aDTbHpmVvRKt+sStofN/+ryrC0+/8GdYMRWM5HYWcpHl5hUxehfunyTDR7O?=
 =?us-ascii?Q?wUeb/uscS/ZslfpCFjEtfvYhbyaTZ4ffnSc4CZWf3Tt/Zom4aUf8Uwxbb4qh?=
 =?us-ascii?Q?VlKd0DGY7YPQG6ofuKg0aB7szGdaMawoVdiHyishXsp84OHwAoc71gKkr7Si?=
 =?us-ascii?Q?E/cj7ivQ1mODSN4H9MRPQf8aWDHdxzWikPJD9z+8P6Sx/pUbjspSQNn8StWT?=
 =?us-ascii?Q?0fyvgtg4eQk6DkqpNsoh+PCi8xqJUFCrSDa0NgZL2/zF0bLgnNhZQO7Y68nj?=
 =?us-ascii?Q?iRRrrJ2Rzzjuj5fQxS9BeZ3W72zJnHdK1FU6vme88h9TYXI2h89b2ADRxyzZ?=
 =?us-ascii?Q?mfkYkZOcf8m96HATwJliAWh3STGa5frEBldDaPj3sGwjOhsCucNhjjKK/j+h?=
 =?us-ascii?Q?JoV9ti2dHa6wDvF2o0/Bo1E//0hZ3LXIGcnwNTdeiWWUcmTE5UgvSgaJMyZZ?=
 =?us-ascii?Q?0BU9+vep/oN0H9KIR8QojKgZgCPz7lXIHZNeaP1lOlMXoBjms1HpWZrPgDUK?=
 =?us-ascii?Q?Tw7v5XQo1EfcF4QSQPg5K/jh5CwCHR3Rk9qVAj5ENnDcLw8FQPLnNaPMig0S?=
 =?us-ascii?Q?Wu13FtyGV6r6WU2zV74zjERsRdZWMFE7HFGjUXZ275E/UrgdF/aBv5gYHUlc?=
 =?us-ascii?Q?2eBjbcQJHI2eYwkZguZOvQ18y0FlB70cDlUVUK6VmWRaFgLVwtqMG6rGX1UH?=
 =?us-ascii?Q?9obDeqQ=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4E7F3A88485D494F8D9D0F5974750948@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10415
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	eba9f8c5-b2f9-4909-f1be-08dc8700865e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|36860700004|82310400017|35042699013|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ezTohx9RYdvhIIPScLZSzPb8S0dawMH26eALvAc8TAGM7AEr0xr2GolGsMFS?=
 =?us-ascii?Q?cb9T48kI4EsvW/mS6EyE63/nPgee2yqDQ4Sr4Lxths/PdPI334KpH6AZj9K9?=
 =?us-ascii?Q?2GAFeNHzSUg8f5u2saStjuA2vtxvxv3SjzmcjhFyjp1vwy0bLz6v1DSRYhUn?=
 =?us-ascii?Q?8JzkNLUrYqXbB2OoI937Gq+2WVTiA2IC1jDJQjMIhJ6aCz6bhYGSD5ITdGEY?=
 =?us-ascii?Q?GU3lfDUexELZR+0S3wycD4L8CyxtWZXNeM1MGAqnkYSfOA90wXYGGoo0VILa?=
 =?us-ascii?Q?fE/KnuV7RTP8Wl+Em0QxMMobqIuOtEljPmVZqFnrvEr1sdCZKAgcu359jKTo?=
 =?us-ascii?Q?uLQy7a/E04kqW5H0Q7BlZdLFOkP1nNKm9RoJfV2UKrV61+B1C2X/U76rMXI/?=
 =?us-ascii?Q?nA+sRcUtsBoVjKquUxbazyYvctvEb5Wo4lHoc4F6kD2e/loP2nRxgN6tnheh?=
 =?us-ascii?Q?r/JkhEP0BNgtkvSINijI84XEcbNZvNixwEXJ+1Ewx++jb+pEBuUO2ynNXAz2?=
 =?us-ascii?Q?AN0BP/jHIeXTAQWsdCwCQsEggwjPQKauncykZ1g94roNrlkEoVJO0RDxGASb?=
 =?us-ascii?Q?YwR/bubAIBhBr1m/OOta2xLSSaoDNqS+ak1sgBe807TXbbdtKfoMQCRxq+n8?=
 =?us-ascii?Q?lXg1Rp0S6aKoCSg3YbNMohZbb/hLuU/yh8mQmB/Av4uCKmSf3cBfFL2gNEJy?=
 =?us-ascii?Q?/oBKyIW3oQQL0ob7hLZEeyzvXu8SgYljHHAKsCI5v5WRunGI3EN1jwuHlf+H?=
 =?us-ascii?Q?G7OlYF1s5MumlYe+4VdAFlfp2tUto+VzK+VM+jv9+R9FEE5mCt1QDuU6V1kp?=
 =?us-ascii?Q?AbVrHl5ZvpzWj8yOzETdMehImkn82dNosPyL6OR7rM0fUjRduiChMGDJzlT9?=
 =?us-ascii?Q?3ApuZNiDF30FEIha/0LZ4M+hgdIENhOxS+ZVcsrFY0RzNSPcBZv+YbFIrSwW?=
 =?us-ascii?Q?D8sK/4WfEMJhJFWGCvDWoJ2u+prhzN6FfbuaXnTEZUsJDS4k9gkJX0OYZE5m?=
 =?us-ascii?Q?YKZpFfhi+q4TmXJKIPVrhKrTP3Im3WMSTcj/CaSBWTgn1WgejtmlxvS2srER?=
 =?us-ascii?Q?UppOp6+Mr5DTjotBLpQ1x/nIV5A+1afORRWfHjsxswbhCbFH5KAtVQWvC+cU?=
 =?us-ascii?Q?bi8iKari+KTTom+K5VpDn9Gb+d3cAySC7ztn6DoK0sGxj36A3SV5X3JAsKas?=
 =?us-ascii?Q?FdZPPZM6Mfi4iOq2tZel5QigUjVzLv5JxcrETJiuoUEjdXo/LBabk3oGRt3L?=
 =?us-ascii?Q?ic5MUE9Xa7TTFHw0Rm5WwbEYtmAfHIG8Lqari5gEBKYtCtLqr2bqRfIAPz+O?=
 =?us-ascii?Q?BXQF2CGX6zsqfRZxNE+PBp8ipeKGq/krdnW2DX1eTDy3OdjBTFI6+wa1Oj1h?=
 =?us-ascii?Q?h0c5vKtJondI7hZUmqvvn0xGDLx7jO37eiZNwTi2EAlXGMwWVw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400017)(35042699013)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 14:46:01.5214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ffa703-caa0-42a0-aace-08dc87008d01
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8509
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 14:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200445

On 7 Jun 2024, at 14:41, Chen Qi via lists.openembedded.org <Qi.Chen=3Dwind=
river.com@lists.openembedded.org> wrote:
>=20
> Because unlike other commands, getlimits is a noinst_PROGRAM. It's expect=
ed to be used by its tests only. I checked Ubuntu, Debian and Fedora, none =
of them provides getlimits. So if not for the ptest packages, we would not =
be using this command either.

So if nobody installs it, how does anyone else run the findutils test suite=
?

Ross=

