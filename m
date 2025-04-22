Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C6EC369D3
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 16:07:07 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.70])
 by mx.groups.io with SMTP id smtpd.web10.44033.1745338021963777059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 09:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cJqcpMuI;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cJqcpMuI;
 spf=pass (domain: arm.com, ip: 40.107.105.70, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sW7yRYwsBvc07tv8WMGPhIMiF8ezCSzkoSD/GO0FEoWYIHAPKWVymo2ZPGzifFJ0Kr2QSt2p69Lm+7oDLLJJkriEXSAQKQFrb0OgOdcV47JmFXWma1wAbp0bAbVGtRbBJAWH7yRBWcVduyPHNUGvQnhcLUikg8M7xRdrokdgUtoFsr+FHnAlCPhKnWO0fGTrsi/4uvODUtKeKKFlCexandFutkNoAEosFnFfy58r4BMQGnH2BdEdB4LUBxL3cDJRaTgl7LCRwaitt5JXe0JgdCGqsC/qnYBy9gPEYQT/ZzYs7jbbdRrVs5dU85RxYBNOaPuGf9GFoD/r1AlYLQW5xA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXDr6MFmVLmckcW9u+RbwFd0e8X1P9dXHXfoWDCTJ0Q=;
 b=OmfYKIvYr1L9y7zuxrJsFlCT3v1HKMOO8W52j+usSWW6/MF8u82XSP/eyIGm7nGM5NCsgE1WXme4fcLtXJ2FMDczRMjZ+Ze3FMazlnb4yKiYir/T+Nx+BLwb9nipA7XvB2vHvlg/c1tIdGZCOp/cfklxhiKMIeKtii3MViku4KYWOhg/MJoDETq0Tex+AiDDLVtppAhXwBDnsx53PPhFj8TOV2895Z3c7Y4Kqgdj7Dv4XeoSu12bacqqaqGfLvkdLzk34SsI3LD+dhfxBVrXB/TtQKJ9h3SDj4Z/9yTcwe692qdG+i9vc27dRAoIz1xTKB79KgRsynaJXRAuvSBLfA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXDr6MFmVLmckcW9u+RbwFd0e8X1P9dXHXfoWDCTJ0Q=;
 b=cJqcpMuIDnJlnUcOTQyggRJ8qvYCHaFwwL7DKNH+gaoqJ8oDHj9yRQ8fAQ6Z8FMJ0v6Q+mD0KfkyMfUpBOOquiMP3AivEDfTP5DphiPMxMsRFi+B3anzqIexEwDiyezB69CVrK/BX5uZtma9bOH2640Rc+MvuPF972BOPVKfdo0=
Received: from DU2PR04CA0277.eurprd04.prod.outlook.com (2603:10a6:10:28c::12)
 by AS1PR08MB7513.eurprd08.prod.outlook.com (2603:10a6:20b:480::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 16:06:59 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::d6) by DU2PR04CA0277.outlook.office365.com
 (2603:10a6:10:28c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Tue,
 22 Apr 2025 16:06:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 22 Apr 2025 16:06:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAJ3dY1jlUPX6UwcM5n466c2BnHDti6qxET8LKl6vO8s/oMWy+lDoOiukE8j1/VzyTnlFjNylDGYI96yCIhuWAhQhKCrkYa0WSWfyKCCsyrH45kD3mW2Zv/2Y8cjZpX3vMK9/yWwewBvVh1RiZKOtO2U0B7n0HonH68XXhEY27obLIligwSWcZ+toWDZQduSkgcjArOYLFxdNtcybssUaN1nK1Iqi8qjcjNu/QhGErLDA8AtznlYaRyusKVvlQON7kkEwoacXN7rYINFsLniOIj+CqbixVKcWN2loKyhFYfVHio+GrwIokjmf6O83hvxazzODx6zm4p5IIdsRR+VWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXDr6MFmVLmckcW9u+RbwFd0e8X1P9dXHXfoWDCTJ0Q=;
 b=j/qWF4k3/SiImwRmsjTZecanB06EoToVpt1sWWt58JuV1shQSq2TNTez9PFxNj8LYEESRUxcniLGjduEqzIQeX6cdXuwV61cmKDC2ZhlnoCcdn7mI7QquujO1G2djxu9gArVOLu7KaqaDXHNBTeWiTA7GrQvgGpkTwK1GrwM+/MmGhmDmB7CiEw8f1MQW60so7n7T8vvcx8Tulbx3i6l99n7bVn3LnAzLKuF6jf/HyE7LrNnS0u/TfB1zzEsvAp4IxPlJKJslEF+n1bwSmMdnw0go/UO7YGUjd4HyGhFUu8DxbvCEg8rFBtZ2lfZ+9am3LbmXGlDaYrkkI7+jUa0+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXDr6MFmVLmckcW9u+RbwFd0e8X1P9dXHXfoWDCTJ0Q=;
 b=cJqcpMuIDnJlnUcOTQyggRJ8qvYCHaFwwL7DKNH+gaoqJ8oDHj9yRQ8fAQ6Z8FMJ0v6Q+mD0KfkyMfUpBOOquiMP3AivEDfTP5DphiPMxMsRFi+B3anzqIexEwDiyezB69CVrK/BX5uZtma9bOH2640Rc+MvuPF972BOPVKfdo0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7519.eurprd08.prod.outlook.com (2603:10a6:10:321::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 16:06:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 16:06:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "koen.kooi@oss.qualcomm.com"
	<koen.kooi@oss.qualcomm.com>
Subject: Re: [OE-core] [PATCH] autoconf: mangle PV to avoid
 version-goes-backwards
Thread-Topic: [OE-core] [PATCH] autoconf: mangle PV to avoid
 version-goes-backwards
Thread-Index: AQHbs4gtP4vOJP75F0eof3SIAKeZQLOv2ZIAgAAAUIA=
Date: Tue, 22 Apr 2025 16:06:25 +0000
Message-ID: <E0EC12F2-F914-482E-B5EA-6DE47C2BA3A5@arm.com>
References: <20250422131112.2392350-1-ross.burton@arm.com>
 <D9DANIBXMJQM.21HMU2B4AA96R@bootlin.com>
In-Reply-To: <D9DANIBXMJQM.21HMU2B4AA96R@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7519:EE_|DB1PEPF000509E4:EE_|AS1PR08MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c184254-5018-49a6-daf6-08dd81b7b601
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?Lpq/xrh3eoWoDsBxOWC3b3x6Ia4lYIa/N+Rtmt6QCH+UjUX8jPq94EyLSjyb?=
 =?us-ascii?Q?zJ92dyxsm5AgrZ+fhSIEQHz6a9W1+HGGBek6qtabN+RKlVFukNRT8CSSqcF4?=
 =?us-ascii?Q?xdBAzSuTTq8TK3eYf9YYenr7XdPLcZ3trKnN42y24cxYpJU7UMizN21vjxUU?=
 =?us-ascii?Q?ApQOw7t1MOkLWGMn+byLNVohrak2ce8RBSuNGr/SJ2y7rQJpCxrsLAicV7Qn?=
 =?us-ascii?Q?ghIHhg32QuDTwkIFQULdpYhNKbBn+HkrUYuA92v10IfNV1t14e6LYbY9S1K3?=
 =?us-ascii?Q?83XdZm0KJTDZ2pnPDDVUmBrrZju+Kax8TIjngLEqg//dj49LMAsxk4P6RPfU?=
 =?us-ascii?Q?xiRhLp7J6mYX3GxiRh3BlnZWYAIS/gqdWHrQy5fa5HKmzT8+nQMlcmHj+ekc?=
 =?us-ascii?Q?dNVqTJfwjmwSDB/g9kksYnEfz11+uvhfzijKtVMvCT6ct9vuDZm4kxj7+d3c?=
 =?us-ascii?Q?mIOL9DJ1fTb6R8N+xGK9pZ7sBCClJCNQjctJmC6e1DdWHdA4a929hXxe+RM4?=
 =?us-ascii?Q?XlESNdh2lU6M6ZntCc8amwUG2NB/35rr8yr5ZVG33DCpaukOuWXg03LO8cd6?=
 =?us-ascii?Q?lJ0FaDc3gVSPvAIveJ1+9cOPH+WeADCiaYqIZN3F0jaAtazcFiRASvBgzroP?=
 =?us-ascii?Q?JbmUhpWtacPzrDK9koqSd+RUOaOHO8Q9f7ZISagpEhrIzuatypG7IF9Rqj5y?=
 =?us-ascii?Q?fAZltxPfP909Xd4sezv/5medjFxAl7RklqtYWqvifpvKdSECTdEB0oncZvgL?=
 =?us-ascii?Q?fo0Gc+swyMDBtqSlRrDfMA0jPO+taWGCcRILmJsueQLk54QKm86HTYzImKZv?=
 =?us-ascii?Q?S9EfnOQacuDDWYjgKIaf7m23Lsd+EnLs2z0VcAuT/phAV14xPzwQxMD9ievJ?=
 =?us-ascii?Q?ky/bzBryQrgO/X7H80bgLu+8Z7ZSC3DjqTA9vHhMkWR3jwU7QwsQ7SXVaaM3?=
 =?us-ascii?Q?hUlQT7QDQmLMMdAaqldsHRXYqUyT91AULtjB9kpcBWlWq2fuHMXdwDnLx02a?=
 =?us-ascii?Q?m8WMWTcOl8oHX3iSwuEsJggy22QCINR1Fcs6Qav3GfzSAymSoMJyn6ii8Z1J?=
 =?us-ascii?Q?B/4yZSomkyziYOky4hSWIzGEq3pWn7bMQi67UY7sRfVHV7utNOz7kTVlZasb?=
 =?us-ascii?Q?LIcXiOuDPC6X0P4M71aKgZ++ea6ifOiMeKOJZb0BWEIdZBMoZ/VD1/fbuhi9?=
 =?us-ascii?Q?UMi4uEcO6x1AKeVQww3d04k6I1net42aYBS0bGTwdsBuEWSIqebjBCh+qtC+?=
 =?us-ascii?Q?phg3Mot5fotKSckFVYy/CvTIiyMeLyfwGgg9F81V89K5YN0hP41TkjwnON/8?=
 =?us-ascii?Q?msbMXEuHpMnCw+VDbQMj/EMW74HjLXl4lTHX0ZHkZPjZh5OZMbx5TIZ1ZzZz?=
 =?us-ascii?Q?idtMI9Q1Jx9qYVJE/fL4n9Q4Uq2WCqnpN4dNk8FnCOnjYan19K3nXMaB0Rz4?=
 =?us-ascii?Q?uelSJQccPoQqHlz82NjH6xC/E8YQsykJn2H6hbsp9nYMJy3VTtyUuw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DDCAE49714028F48AEAE3F0C4D60B180@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7519
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1940dcad-0998-4d46-13c6-08dd81b7a258
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|35042699022|82310400026|14060799003|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?C7fPTI7Q7QUlOfmK8FHDUvNXASIMAYuLCUzc8gmHlCBc9bXZQsST4eiXMj0m?=
 =?us-ascii?Q?ikGJbsibS+0LzOl/C797wjaH/K7Dya3KNUUO7k3gCC0JWuLlmc8QkcOp2mZK?=
 =?us-ascii?Q?gPKF0DbYnBPEf1vbgLvbEJt5g6T3v1iOH82i+l9CHlbxYcBSp7SAgmbdhkOo?=
 =?us-ascii?Q?iMIDgQQcgI4PBkbR8T+7cCzfniWdpD60QW5ozEVe7cVDnPKmOA6VOTSyIIPd?=
 =?us-ascii?Q?refmm+d3MJZNlC3mgG1tFdpqRm2fsMz6L+Srjbc3MKZBALYxIzVOacaL6wva?=
 =?us-ascii?Q?SzWvFRTIbSdzPMTUJt5iXosszEgWdgv1fqnZ5V4zODHr8NuYQuHT6hyyVCaT?=
 =?us-ascii?Q?C9DoT6zDtCvwYgpmZTihg98YvCs52Kqzsd437zR+cKwnDm89fYKYITLa/T72?=
 =?us-ascii?Q?V72jC5b9iiIckJS4xcgGKO1KilpGoMPGxeNVGvE4aqo8/A8UAiBnynmMZh2k?=
 =?us-ascii?Q?5qOM1AKuNjqaz8ugHhals1QjD1458tP3Ov1orBqI4FTuyqPmD7CrTo4hDcWW?=
 =?us-ascii?Q?kcFipWK0Esx6q/tI6cM8Cx50xRoPZ/p0OUq+QtDcwcFVgOq0gu1ali7GYCS6?=
 =?us-ascii?Q?UjOIPJz1Sxn053/KT3z2HpqMibMNIrwddMVOWFAGrNVmPxzZhBJ4V39b7vfT?=
 =?us-ascii?Q?dI+d4BSLXzDLoYlK6IYwzwM43NwaOMSV9Dbagv04nIT10adUj2IVQ/4wslPx?=
 =?us-ascii?Q?+U4iS0H1XjMEBZdhtJ/DA0EHjsVbrIZ01Ja8C7eSS+2XWmF/2bpnUZiYxb56?=
 =?us-ascii?Q?sYC8WcvKvqSDysKvNhVVL+EHZSsfEDTV2A8jFRX0vQ9l7TmBl8a8FTGpUpWa?=
 =?us-ascii?Q?+imhNWwxvmMctMTFW9pX+4LCoVw650jVshxtOAle6cFgS0MEz3pnMA/QaEgB?=
 =?us-ascii?Q?cb9gb26p/BnUykcNkS9oyuNqH+Lna+oOLISMgkemES1RR+rhTmfYGGXoOWDT?=
 =?us-ascii?Q?cW45K4+k4KEF9BUd8ekyxGNjgEimnnc6pp7PTpqlR9MMFy5rt0PyKzN7AxLM?=
 =?us-ascii?Q?qj6l9cpzVqTjdBk8QLRSzluXQyoSl7rUwE9wKZbR7ukjYiEDZi5kmyn1pe9f?=
 =?us-ascii?Q?Fs4XeFZ/eVaLfPWYtNwTe2DYDDwW5TiRrsnODxgL8gA0diE84ur26kLCDs80?=
 =?us-ascii?Q?do1qFzC23pCSW9EjIADzLhT3NP8lj0yBUzueIXwP56qpbeyQ0kF0Ku6ulx5O?=
 =?us-ascii?Q?Mx4m/y792yZYVRheBCY7OT27YenVWILZd0BBwXYTtqn1vEp+XjeDZuAM61e0?=
 =?us-ascii?Q?mNZbdLk7gJv0REm3oB7MJ6havCqo4ICIFRVs+M2oMjl5EmI7EeyQxTZHHm9T?=
 =?us-ascii?Q?CR7qaWEt55Y77kYtr7z9EeLSgQvZM1GyLjYTPW3eEs65VzMrCWWZrEhg4Lrc?=
 =?us-ascii?Q?CAMCavhrT45bGbAAb8O+zdbLaIzUO7Oqdwj+3B8c5SFa/SoOTCpd+tPcidKj?=
 =?us-ascii?Q?g8/CyrjoDVHxZU0tv7WWFEWPCYJE34JRS95tFaF7x/85tA/HHKlGA9NNFeez?=
 =?us-ascii?Q?26Zya1P7FHKKLyA5NhG3vicWJNQXDnJZyhjw?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(82310400026)(14060799003)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 16:06:58.8114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c184254-5018-49a6-daf6-08dd81b7b601
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7513
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 16:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215239

On 22 Apr 2025, at 17:05, Mathieu Dubois-Briand <mathieu.dubois-briand@boot=
lin.com> wrote:
>=20
> On Tue Apr 22, 2025 at 3:11 PM CEST, Ross Burton via lists.openembedded.o=
rg wrote:
>> I previously upgrade autoconf 2.72e (the fifth release candidate) to the
>> final release 2.72, but unfortunately failed to notice that the version
>> appears to go backwards as the package managers sort 2.72e _after_ 2.72.
>>=20
>> We could resolve this with an epoch (via PE) but epochs are forever and
>> this mistake is temporary, so set a convoluted PV to fix the sorting
>> order that can be removed when the next major release is made.
>>=20
>> [1] oe-core 11ff8dba0ce ("autoconf: upgrade to final 2.72 release")
>>=20
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>=20
> It looks like this will be used in the fetch URL and so the fetch step
> fails:

Yes, of course. Obvious lack of retesting after rewriting the patch again. =
Sorry, v2 coming shortly.

Ross=

