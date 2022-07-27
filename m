Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A78FC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 15:31:01 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.57])
 by mx.groups.io with SMTP id smtpd.web10.21331.1658935859926832157
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 08:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=rZRAO3ZX;
 spf=pass (domain: arm.com, ip: 40.107.5.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gjWqhcyeOA/B6h8f5V7f0MrPrAkHXH7KhA/HcMVZkCNtVy5HmDhPIkuBmef7yPQNYjOc+u6EEGj7F8VUBjFFZJLBlwnoKPZEd8icZh5K4K2ed6SNZV03KvKzkQ8bqL2I40Sm7k+ouMvaSDtYDYnyxH5iUdid6vSiLzY6uut035WCctNsREjpbmydzrLp5gAGSKO89MT9YGXGL5ukXSjlyWrFddhit+xchlaMKslpFaSA3Ycmlg3PTJ/XzTw4KziDnAjZQSC1GEj+OhKvddYWfdZTszrqf/Mb3aaZmPAO70M+kHnGL057BuPuLErq+yJ9pxFz3ZpRPhrQMwUCNpuBUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hkpYjlJLQLF772F9I+0JT3a7B70taJff8fwW80CGqg=;
 b=Ix8EAnJhgm+4nIV5cBN+hwloQoecQTfWRzJ8V+o6W1whhh5AaHfjoliB37Xgk+F1tWAr2Wtx1evGzOn07w5TmbzgVbczq3zMQKJQbWZaL70dCUDEQhv3edjnlHC9VGPze44cIvqdkJT0T30VRr38zL2uVvz+NhiYiI0tsGaypFuihjMLWpIwnC1lPykxIjdJQkg6yWGIaf6O+S0bkUvCeJ6gH98zd7lMcpSkXcuy7cuFLyoNkM3w/A8pL4cKfNAwafxmshVe69T9Nr+LhYF4t+CrsF7tLFFIh4XRGjzea9OZ6jnWnqO0x53VKGJlA5LX09Ddi5C5Mrmkn0IFc7VuRw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hkpYjlJLQLF772F9I+0JT3a7B70taJff8fwW80CGqg=;
 b=rZRAO3ZXu4zxhJVdpeeLgaw+D8qWJwEoCsL93fFd+QJpDlH24nKr+8Vsq8qMUH/6A/FlthP/gXPmd2D8j43YDaZ5G9IrrVruDi0YDiD0v/HsO7fVWpypnoL9idyBVzr6wwib8AQJYdHGFJw6xq7T+hh8EEAlDhyQPZI9S214hUs=
Received: from AM6P193CA0143.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::48)
 by AM8PR08MB5683.eurprd08.prod.outlook.com (2603:10a6:20b:1d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 27 Jul
 2022 15:30:56 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::48) by AM6P193CA0143.outlook.office365.com
 (2603:10a6:209:85::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Wed, 27 Jul 2022 15:30:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Wed, 27 Jul 2022 15:30:55 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Wed, 27 Jul 2022 15:30:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bca1a5198d131448
X-CR-MTA-TID: 64aa7808
Received: from ed2f91796a71.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA818FB2-6BE1-48BA-8BC4-05A5EE6B9914.1;
	Wed, 27 Jul 2022 15:30:48 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 ed2f91796a71.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 27 Jul 2022 15:30:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOYP2qzOSxXF86CNLAHAE3HrJE2MfTjgwAPWp6jdVzf1hdqDs3mHHv+iLOWtkBOxdfs6DD34ddzHrxSYC+N9CUCJxWbyqLUbRCEwTEh4UPuSAZ4gcwkJrwGNw32WYv6IiMzPG78biwu5YvSWwVBFXErDJvzpTR6atVlx2OtXyZi+br1pNcr8RonVjFZSvzXUumcKzLm1z36o7OfSS5BLFhSk5JCX+kLMiy6hdkEbMNomMyidezQ4yAVhw87ElQIuBdQjD2kCDdqsykOcKNUP0u7rhUTbBbU9Rx79K6P84v9TSG/G+NwMiwvy0ZeGbvd4Ul+ukTbKxgTJwRJO2FJ5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hkpYjlJLQLF772F9I+0JT3a7B70taJff8fwW80CGqg=;
 b=FIIPkKVcHvxVoCZZTgav3sjo2N/hi8M9PlbVKg0eYzhO5QEWiguRQ7CPlsdr3b86T4IG7GFyqgXSBxHflf73EAdE36eh2N5ZQVIwYUbVX7TIS5Jwf16lqwn3vPfk26loX+LxENrHbkTwVVn9o1NR+g0bctt2Kos9/NqqStAqZ7g+aZTR3GiaTAvD5RRbYDP2R7/ILmOUEBLMMaEWjtKjPC/ADn2UneHKpLVkMKJ0mec35momHu3WI2lAO3rph6Ram9U8+/ObOL1Sbtfu4jDYbPYOye/W17pqLDanHpf7GUDjJTzvnhT+BfPlup/c1ECW45DwCw3SW6zBtjMrETiG4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hkpYjlJLQLF772F9I+0JT3a7B70taJff8fwW80CGqg=;
 b=rZRAO3ZXu4zxhJVdpeeLgaw+D8qWJwEoCsL93fFd+QJpDlH24nKr+8Vsq8qMUH/6A/FlthP/gXPmd2D8j43YDaZ5G9IrrVruDi0YDiD0v/HsO7fVWpypnoL9idyBVzr6wwib8AQJYdHGFJw6xq7T+hh8EEAlDhyQPZI9S214hUs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8112.eurprd08.prod.outlook.com (2603:10a6:20b:54e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 15:30:47 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110%7]) with mapi id 15.20.5482.006; Wed, 27 Jul 2022
 15:30:47 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "johannes.schneider@leica-geosystems.com"
	<johannes.schneider@leica-geosystems.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH v2] classes: rootfs-postcommands:
 autologin root on serial-getty
Thread-Topic: [OE-core] [meta-oe][PATCH v2] classes: rootfs-postcommands:
 autologin root on serial-getty
Thread-Index: AQHYoNObk684OBt7fkmJ2YkHglWWPq2SWgcA
Date: Wed, 27 Jul 2022 15:30:47 +0000
Message-ID: <1D505589-2A1C-4E82-B219-80354DAAAD37@arm.com>
References: <20220726093906.619035-1-johannes.schneider@leica-geosystems.com>
In-Reply-To: <20220726093906.619035-1-johannes.schneider@leica-geosystems.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 05df07b6-de94-496d-5a58-08da6fe4ff85
x-ms-traffictypediagnostic: 
	AS8PR08MB8112:EE_|VE1EUR03FT035:EE_|AM8PR08MB5683:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ibNHD1lzgxo4DR7/4CMYS9VE9+EIO3gX2pvrWmUpk/W/RWn/x0Os+ztSWmPmRyQWvZOHmNGR3XfmsO0EXYItPPHq5K21yduBd2CNJO6QknhBZ+N9hwxEkRUBqvUjxoi+/sW+wFQE1T0E9TUuhy0ofWo/jvqavhojdPArVHVYKFd3uHhhBAERUVJbTZlEa/+97Au9gs5spneHtEclLwSZvNJzjPdfzX2aaU2AnodlrsiQVzCK+3YxB2fyzi3IudwWLsEfFvti6wVi2/9O4QkU3VcSjCc6GQolCdX/hi27Uokl/WQWxkBjpJ6vf6qS/B6vR5wsTWXl/04aA50XuhxK+MA3A4zC0bvNGrCiX/rVWTHsl6LT5916G5Vw2RfKCrdcFhEnefvQUCwAcMCGLSEezN2t32zj1VCzgREK+Z1HwJmmia5fXPc6tlElCXGocMRr+P12D6LucG3jwj1ueQx/3yEgd3zel5WcNAgylflF+qLMutCSwhiEKZJmFrs/il5EjtQqmETJRzo+rKwWbl3fTAFIq5NA6LDYxDr+OiMVq/wwzKfuafPrNlCyyAvH3MJmBtT1yqpVLvQSwgt3anbm8sHQMGmY4YRmX2SdHg4QOliO+LslSZ9qy4RvL+B+49iMwBm6ol2YYcweq62Un2L7YxKrv6f7wamXljPTaDvTVQAH1ok1HUkCObLaqbfiK4m4H6AFNk7C5BchcdM17bqJlANUkDNpI0sMzZKMwfANjqMM5xaGNBjHFAckXCFIPzaKKy9++zzujv1Os2Dnr7huQ1e4Xg4Wb3Cw31q4tXh61aYXZLSdaT8tkbIXJqbzQiXN9tRNLWIVTaTiD2H9Vd3IKQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(26005)(6486002)(2906002)(316002)(2616005)(6506007)(38100700002)(33656002)(83380400001)(36756003)(122000001)(6916009)(478600001)(66946007)(66446008)(8936002)(5660300002)(64756008)(66556008)(66476007)(41300700001)(71200400001)(4326008)(8676002)(91956017)(38070700005)(6512007)(558084003)(76116006)(186003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F6739FDCDE9D574D882835D652EAC0BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8112
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	00111139-7acd-4cf1-7c0f-08da6fe4fa82
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FbJga7cgwvugCyXM9MfW1JFKV1EpZtipcZ9B4GN0USoOwCqGqks3kI9945bUvabmozk/OKWY3fHJ30iTqLq56HuhMidtdmLACLEMljA9V7lcd5EpAW3myywlyNPx3Hzo9GvpS/VMIe2uU4MMgIQKRjhuPFDlaTDttkjwCAGTT26pQn99fpZbGxH+Cvpi42nJ/zNtu5TuPNMpuW9GVj7oWTDi9ldxwGeYnZd46tbkmbzj9+sEOv9JkHWs/6FuPz52DfAe+YZ9j+N38KtUwFA+LffRC6OnerOONN7L9E/ZAwPrD4Q1H96PVB7+pzovujtGAd5HpcNWuwRm5LM5QxTe0nIm+heT0uJp0vwP/mzhd3HM0ElwUyIY0uZg+P0gFNB5+6BkVsCF81pn6MQWMX2xi8SbCN92NSE5+mm2Tr5kQjp5+GoXj/lNWhPRrPWc5vhY9g9LmL4I2VYdczo9z5wIYgXlhRycEx9kvxdCLc+pBTd1Yti/y9Ke1tSQtQwQr2D5iDXBPyGlSY/Azsx3Ahkax4Epbv3q2dZZYx0pMXVn+Su8U5/thQpWKiASFgssiv8I1gZrJjucgRypY4DfX83tw6HLHHnefiw6+pNrSJRixj/guj/3aD/VYzHYhToOxkuf397qcsgCVa3cwTISMnUEtJyjEZY1vtN91Q5/NAS8XSasOMbXx5dP5hkISMnfJsMVbS6FwaDMO0sSffpdK9uB2gUFBULwZs/LMUtNV2em4d077T20ntWVz8sopEj8umADttUkgIzWb2GH1ERrfXi01c+1X17x4tbU15iTA9dRnD8z1rXEzESU5MVMpYd+NbY1
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(376002)(136003)(40470700004)(46966006)(36840700001)(186003)(40480700001)(6486002)(2616005)(47076005)(4326008)(70586007)(356005)(83380400001)(8676002)(6512007)(336012)(36756003)(70206006)(41300700001)(6506007)(2906002)(26005)(40460700003)(33656002)(82310400005)(36860700001)(558084003)(86362001)(478600001)(81166007)(8936002)(5660300002)(82740400003)(316002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 15:30:55.5279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 05df07b6-de94-496d-5a58-08da6fe4ff85
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5683
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 15:31:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168570

> +serial_autologin_root () {
> +	if [ -e ${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-getty@.service =
]; then
> +		sed -i '/^\s*ExecStart\b/ s/getty /&--autologin root /' \
> +			"${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-getty@.service"
> +	fi
> +}

What about images using sysvinit?

Ross=

