Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E798C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 11:04:09 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.45])
 by mx.groups.io with SMTP id smtpd.web10.8174.1721819043886226240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 04:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bviwKH1A;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bviwKH1A;
 spf=pass (domain: arm.com, ip: 40.107.22.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=thP4WrEcZHS+jEJjatg56KcSZXUycfvhtITZ/b5HTRP9mAMfZ/YsYAjqxkMunhs4+L3c+spbEBtv07WaWlXwK/roJSGI6HfRvqLC6Hok1R5IEjiEB5gi6ifNZ2oMc6JXc6GJV/Od1DYMvaV6HGY6/fI1CScBTi5sn5lltSqxTNvO2ct6FOxtoN7EEpPoAJwqcGAXjk++Krr0vJwr5BE6+3MOSDPh7ZbJU0Hu4MlpF5V9X1jAKwQWopL7or/x/jk1Vbl5ehe4KFtK4M1IMgR3cCYfemXFJKYgnw7kEbiOQkz0xjFjWAcswsTV6PJhmkBiVOZqZm2UDJhsZ0c0sMviDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3rsNfePDOG8/bOLPJRVsRtTkhTppDSBFuTxULUsRG4=;
 b=itLHADGqVvbc/XQ6qPO/83hucqZbK2HjKdRi9n/sTJLpP5wxEcnZo6ZhV60GwDnotIVmWdSU3ctk+562CQFpCyN/8vey7iMhQtTmEsM9G74PNhJ/t2LoHMeb2CVlg3O0uLKbtmGyPtZ0FMWBKo/xuVYJpzFLef1z22xDnRpR6hnv2fI1oWPkY/cvRGIzSr966rrQWK33YPegHplG8f320cnqEEpK9hqsL3Da3GQXHAOxs1EQ0Tg/J2CMaiPGqd+0j6wqJQ/XfxcI0MzYHjMeHHSEkG/Yu2K9CC3vojDXbpQ3jGqijI5dQQywRCKtCoQCXwRRnfCuVsGDXWgxmARAHQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3rsNfePDOG8/bOLPJRVsRtTkhTppDSBFuTxULUsRG4=;
 b=bviwKH1A1GMsSGQKBM004Z3hJin8IOzQwoorc+a+v6KTpZf3R2efcrNpZ/k0HrczdeN+WUEMNv0CacL36s6iLm3g/+7Y0WA4Gb6shLP0Oy+DpGB9oNxm5WrcLSgm8SJRmqD7Nzi7vSX385EmQGjNev+pyHqyrFN8ABo27Wn49WI=
Received: from AS9P250CA0017.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::16)
 by VI1PR08MB10220.eurprd08.prod.outlook.com (2603:10a6:800:1bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 11:03:56 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:20b:532:cafe::c8) by AS9P250CA0017.outlook.office365.com
 (2603:10a6:20b:532::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Wed, 24 Jul 2024 11:03:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Wed, 24 Jul 2024 11:03:56 +0000
Received: ("Tessian outbound 2fd79eef2229:v365"); Wed, 24 Jul 2024 11:03:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a6085ae76237a66f
X-CR-MTA-TID: 64aa7808
Received: from Le2b1fd4e7b28.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4F84ED80-690A-4A88-B37B-9FEC692B2D86.1;
	Wed, 24 Jul 2024 11:03:49 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Le2b1fd4e7b28.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 24 Jul 2024 11:03:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXRR1jLWnaoSM6f+JkvmUghHWBrn5btjdb/fpyTK5aj8INSIsw/PF2K0G+qQusZArswZ+ZARHUwexb8fTDLfXvl1f7UZPu+H0my/mYNwKC10e6z3JUgMPfF/VswoX4eJBXYERDuNXR68w3Naf+5hJMoL2y3emacL+FYxsfQ+ozrAOykYdrSQ4U2eB0Lo5cSQaxoOJGyu5+SPPgzcY5T/gnGh2vWVLaWN8Y60TOpi1ZCY+1I3j4LLJtrBlCvW/SXkvYB+i9a6LhEDBAGXwQILmvCJR8HBeT+zD9GfjQfek3NgeFS6V6pEVPjKUUNJeWQ+NFTL87ig3mkdCsvVXmiBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3rsNfePDOG8/bOLPJRVsRtTkhTppDSBFuTxULUsRG4=;
 b=iCri197xUbJ9eTrhyPYYIuVFaYoZX2/VVVrSxhOmDrxqtqSSMY/7v92vINQydRFga/6gCAzQQe4qxyDgBdfWT6H8SQr+7EtfgtoLtOkXP1CnV4tjwVnte3FhX04y8m5dh5Jyr6KGTPt97qKSTJSGFn34ovjKw7Yq4JUafrC2dfVLYWrHZontQ5FlbXHw/oST/YgzsDQNzCBxt1p++nFlUQwOWYsO0x0ui8oIcSiU5P/S68U5RWiGZfOXqI9EDqSjGrMrpCS2c0TqLsVTauX4ts0i5NhkZ0ZM8piJg2+MM2pG3XDEdj6T7rcIJrzrMr7K0mFAaGsJrhokPS99yTW2Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3rsNfePDOG8/bOLPJRVsRtTkhTppDSBFuTxULUsRG4=;
 b=bviwKH1A1GMsSGQKBM004Z3hJin8IOzQwoorc+a+v6KTpZf3R2efcrNpZ/k0HrczdeN+WUEMNv0CacL36s6iLm3g/+7Y0WA4Gb6shLP0Oy+DpGB9oNxm5WrcLSgm8SJRmqD7Nzi7vSX385EmQGjNev+pyHqyrFN8ABo27Wn49WI=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DU0PR08MB8208.eurprd08.prod.outlook.com (2603:10a6:10:3b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Wed, 24 Jul
 2024 11:03:46 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%7]) with mapi id 15.20.7784.016; Wed, 24 Jul 2024
 11:03:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 05/37] python3-pytest: clean up RDEPENDS
Thread-Topic: [OE-core] [PATCH 05/37] python3-pytest: clean up RDEPENDS
Thread-Index: AQHa3Q/xQyJnzDthck2nJ5F/WarsMLIFmMiAgAAfWgA=
Date: Wed, 24 Jul 2024 11:03:46 +0000
Message-ID: <91C3C9C4-DEFE-4D94-965F-2DD6E96D0A9B@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
 <20240723145137.74198-5-ross.burton@arm.com>
 <b52d8f89-e4c4-4e25-954f-ef178a7d82d4@bootlin.com>
In-Reply-To: <b52d8f89-e4c4-4e25-954f-ef178a7d82d4@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DU0PR08MB8208:EE_|AMS0EPF000001AD:EE_|VI1PR08MB10220:EE_
X-MS-Office365-Filtering-Correlation-Id: f0557ce9-6398-4cd9-98f8-08dcabd04fe0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?sp/nysuqsXzfo1+RdC/e92IFsp7Yid8APZqTaBtkTRfUliA49ovp3xmtgx/C?=
 =?us-ascii?Q?0bxWoifSBq3N8dJnCTcN3xjk5Lub3UZysZEDKqdvwZUv3qWh68UZ/Tolud5K?=
 =?us-ascii?Q?Yr3MG/q7Czzkefa7B7mMg1MORx6kATnJl+yI6Hs0hObC6ow4r+2d/OdagJno?=
 =?us-ascii?Q?WrGuuxQDIb64cOA3Dbb9dfaS3tqdA/BaLvc7V7nAKQUm6/5KWZGxxs9dy35B?=
 =?us-ascii?Q?zmWYC99VoZoHru0TI/MgxmOXNm3MyTfDWi59jMFJ7byTBUYyLVIFlscjaf+Z?=
 =?us-ascii?Q?+OONjlHsxXMA3hQFxmm003kFP80dCrjCZFxxOe/Qekwcki7pirFKSGFPKIPs?=
 =?us-ascii?Q?ysEkly5fKBmIDuMdNPGBGp5QL0G1yO9l4xt84inx4F021/hnBpe4XOjvWyw+?=
 =?us-ascii?Q?DKT/hvIF4/ITSM2K0Sbic+zDZlAvIPKB7gI0CodUuQDZwKKWR4/aA5wfDq1D?=
 =?us-ascii?Q?Vbx8+wFlmOp229U2dHI6zMvQ/AMsDt+WmJYsXEA/ZUtXUPxhyL/6qoXyBxaw?=
 =?us-ascii?Q?pP/S4SHDHf/WMF4YJd9RKFCBj8Rl1X/Rqkj7gewjqBFUngB9J3YYFvmYr9TL?=
 =?us-ascii?Q?6fCcJ/utNmHY/fWLzlyUxYY0RdgYaCUwsdIgRZXLXKKh8Ou0+rz0qxXzWc4+?=
 =?us-ascii?Q?fcB4CM6XNKzzSfeOEVoKc1plZVGYE9bYeJOtz8k50GpkZL56+6uBKhWolVdh?=
 =?us-ascii?Q?naDpTLyWlN4JSic3J1PpyEjeImZDHlpXdyXK0v24LypmujjrCLpW3u3bXFm9?=
 =?us-ascii?Q?SRmJ4lAJTpTiMOs8U+ujpSjIw3B+xH2HvKw0tIgobxsFm+pVAwcJahkPO8UG?=
 =?us-ascii?Q?m3VPvuAKRKncOdvLkCrE4dWvksLDFQUvPSA1iMM3zg7jRQ6wIfTtRuLCy886?=
 =?us-ascii?Q?lJgVYxcCcG7kVJ/IkPHTzviZqw2oLQkXuoF4FupYxLsPY34ySXCQ5UzUf7XV?=
 =?us-ascii?Q?Ie2LHHmuBenaT4lPKtkxvLdAdeonc4L0Lvp/p4pFFMPLI2UwLrd9csOrnBKE?=
 =?us-ascii?Q?8zq40OeWscQlVOt4f1YHAqyGkaD+3eQxjbLmGx/1YFRfXjDqnUH+0gzdXCBL?=
 =?us-ascii?Q?kP1besRhPCX7XeuXu98XzFgaChN6fyR8dE/EVUM6Sa3F+XwnwIjG4zm7cg1h?=
 =?us-ascii?Q?xXIsfErYiBHEqJCu+FpNdr17IJQSdfng9r4mYz56Zb6tXN06fPMI2ej7oncb?=
 =?us-ascii?Q?pyqvh3Zr7ra8EiN1TPbTFlFPhX3QgkUepIlr1rwjmxSu3ekq9YVaqZvdtD0b?=
 =?us-ascii?Q?AEHuIsc4k0lMJMZPyzSldUxV7v+TbfZlEEIgC9ZniCMP7Y+aDlV7ynt1pPKS?=
 =?us-ascii?Q?uCBot9yQCphTERygkUGGmUdXKKe3Vb0uupi81S7zFnZmNemh6EDXTySHtynv?=
 =?us-ascii?Q?EzKAV7k=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C7E1633D5B07E74BA8B1F87CF0F643E8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8208
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:4e1::9];domain=AS4PR08MB7429.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b8b8d56f-4021-4d65-edbc-08dcabd04a1b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|1800799024|82310400026|376014|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sQOhCMT9KDdx6PA1bQFa9yiPhIgahwFa/IczhhRWcvMd2X3+tPq4M+dMU2ef?=
 =?us-ascii?Q?SkBdp++rZWYofH39ZrySfDdUdEiyDG+jJwa4x2/8YPg0VPnikQyNgKA+pTBg?=
 =?us-ascii?Q?W7f53IRk+hbGxQyhrIYIWF8cWAXhdswTXaH10i05c+ZU/Uzv/A+gcIdeYUNp?=
 =?us-ascii?Q?1Pl5q+fonfZNdYMu2G9dvw2ruAp6BZZzDdMs98nnUGiEUOskpUMuty6WEXcV?=
 =?us-ascii?Q?2GdeTQNugvVhUhHUM7BR4YU9TfGns+nlE5mz2sQW3ckB9FbfB/5cAfcXZCjy?=
 =?us-ascii?Q?MAy8P/+ZejuoepiduJ2CAbY39clJA1q2bu9g1SDfJ5BikMoGIKpCxnxsrwBl?=
 =?us-ascii?Q?ndw1xdsuLUi/Dgdf5EmRhpS3bDqzOMR9gnnAVOsK829lP/cWUmEbgVD1FtaU?=
 =?us-ascii?Q?PiCrWurwTC5wFJbuHAiwX2SIU9nSaUl99P+ARRE+cybw04cOoBsJIVR5uChd?=
 =?us-ascii?Q?Wfz8wtRYjH7J4hKbaINqSvr1D5k6fnI1KLeFOzyzI/Bh8ymx7DanAoHtNafS?=
 =?us-ascii?Q?VjEU2WMmVwoNvTcU5KJ8wGNBUXLic5bfQb+l06aUgNSWkZPthzRliXDo9IMJ?=
 =?us-ascii?Q?9Mq88bj9ElYpiPtu7hqV/UKIJj0IUknkj4VoACLQxLvdhKJTS9vQCJX8NYyL?=
 =?us-ascii?Q?k4OQayxJxd6C5Djf4PscxKRCD5sKIH3PsU/J5DO/q4W+Y7lQ1E54DIbe+iN7?=
 =?us-ascii?Q?fHIJOplZL6huAtf5ZVGpcLoCQL1sZE9DATzVTuJfhxS59ZYcseNzvCYvqV93?=
 =?us-ascii?Q?kph7wmjzj9PnO1Iq2WtM249j0IR60yJOQ/Y+K3SuCAgW2D2fPDRUs3zyMdcy?=
 =?us-ascii?Q?XFuJsSUYm1cl/QLh4mAXr/8RUYawQPLiXnaGvw/dSn1GUU6CNM0djpS2JNDb?=
 =?us-ascii?Q?BTnb5iys1t+CAE2N8+iLHbWzcsrVc0puzpvVGUiFTE8qJKbePCw0/J18j7U6?=
 =?us-ascii?Q?rtxi59FOM0kwazcc7djYJ52sOcjQZ2vPc5/wJ2KgFRTLW40kXmfqqCEGfALP?=
 =?us-ascii?Q?c4OTJCwst9TQlI7s4nKp3bM+6V37xwWVTGXo/Xs+ofL0igfIrr/5ri7L6V8y?=
 =?us-ascii?Q?n1h8NoLp09e8VVO2Td2ifXRYmgUItHzeol8GIc98FK3IeRmv9NWAZcJxeqXE?=
 =?us-ascii?Q?AdVRF9YgcOMVYgBn4/wzdNiEoeHxu3rfjNhqbWDg766+U29nW4kjvV9oWoQn?=
 =?us-ascii?Q?zyeP2tF54LWCAGX60z7FnFj3rCAVB7N4MQRPqAiu6TsVfRmmvyVs2yry+C4l?=
 =?us-ascii?Q?cGj4AcZ7U+ya9j3JocPv8zNUkCzw1omnjuR35+DuwaRoZNgsoPZsFRhi+Sim?=
 =?us-ascii?Q?20i91zu5LOEL8/4ecT3oAjih0qu1skufAPjDfDIEAt/eiiAEK9ZTezf53nEf?=
 =?us-ascii?Q?baIcy4OOtT9wb3/sSP8Rj8xTdpYS?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(34020700016)(1800799024)(82310400026)(376014)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 11:03:56.0965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0557ce9-6398-4cd9-98f8-08dcabd04fe0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10220
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 11:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202442



> On 24 Jul 2024, at 10:11, Joao Marcos Costa <joaomarcos.costa@bootlin.com=
> wrote:
> There are a few errors potentially related to tomllib removal in the auto=
builder:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6836/st=
eps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6659/st=
eps/13/logs/stdio
> Could you please take a look at them? Thanks!

Yes, v3 sent for the pytest recipe.

The cleanup was removing toml and tomli libraries from dependencies and I o=
bviously got confused with tomllib (which is a core library) which is why t=
his broke.

Ross


