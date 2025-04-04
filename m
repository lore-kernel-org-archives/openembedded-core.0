Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0D0C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 12:03:13 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.61])
 by mx.groups.io with SMTP id smtpd.web11.9627.1743768182734914911
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 05:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KfNzYK0F;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KfNzYK0F;
 spf=pass (domain: arm.com, ip: 40.107.21.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yTQMcHtAotP5M7T6wFKEKzemfQRTsaV1VHRPeVT0YogXDKEEo3qYWyUWx2ym+pmqv2j3js896FMmZzm3UP+q5dL9xddyAbqn5m1E8CwmcODjPZJS2fo1yi/EU3OhrJfGASfbctsfV9AExbMr7Ge5rRIwY6UPslfopYq7uBwsLZ23s4ybqCaZkpe9TCVhDxfhLgoO9t7mbLqx2eipjVJhS3LiUooYw4k7P6vVK+SY0T0E9WQvl8qyUiflyxNx+XemHnUdzBVCjUDXr1FbzKKx3zRYdHf5Zo+9siuWJowazh6uglcdb4Ga9hGEDSj8uAz3EmRXfWyOTmGcmTujPJlQPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSc1qEegT1AGwDgedo07ewNwFevOlSD7HRudcT8lv4s=;
 b=AQ5G8Zm0Pn5IPghgluhHC9kH4p1hK1oViJTOqsvlim4SYON05g0Q4EULzVXg0rYT6SPokkgsr29+8lM+dWGCOg3ljbuS8OZ/DPh80j+iUS6zQwIlx8AJJIYjbxgeF9nWzmaE/4R7IWfRpLEwwjsGpEKMg/s2vel8o9jNYKeWGFBGshxraobHKiBKLz6DPlL0QAPGtXby0N8hol6c1vq1UzL9ymRKD0PTsdDqx6dH1fGQOPbNdUyQa0ieuQ/VQFk3y38s9ysjWYbzcBBvnIoGfKe75bh+EW8NDaAlpgzdj+L9M8cftvrdF+ccJPZQCgjve77XsGfTDp92NWxnn2kYvQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSc1qEegT1AGwDgedo07ewNwFevOlSD7HRudcT8lv4s=;
 b=KfNzYK0F9MVN5x/GobCPhcFFAJoZy326nIWR/iUoN6zIUCI7Ocp/Bgz3B89SUuvW2dqYrCWI8XxNtdX5TQsVSe3NsSwTzrUQWJxfvZmT0R+I3pxCDAM57JJ+N68WB7HOyhxCHvVH63fTOZEDUFvRJCx6Pdqjmy1IHplxK+8+dUc=
Received: from AM0PR10CA0088.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::41)
 by DBBPR08MB6298.eurprd08.prod.outlook.com (2603:10a6:10:1f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 12:02:57 +0000
Received: from AM2PEPF0001C717.eurprd05.prod.outlook.com
 (2603:10a6:208:15:cafe::51) by AM0PR10CA0088.outlook.office365.com
 (2603:10a6:208:15::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Fri,
 4 Apr 2025 12:02:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C717.mail.protection.outlook.com (10.167.16.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Fri, 4 Apr 2025 12:02:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMAJluXSVce0MNTh7RCCTtW2tSehjG2k/lc3Bh8WG8NTpMbUSO7G+jsu4jgSA0hIj7lAnECa1StdhFpd79GTJ6ammk+BIMYFcw8PuEiCxJahgN6+7u/oHrt+YD79SleZm6YwNsAZHFmxP0FQK57oHAub8xp2dNkv0gurD0elAkRH+ROhlv0LBy7tMUXcVDrckd30St+l+6zcyTywtKr4BFZnjgSM/p4xmaI3YoCa+ovSPjbGaRCrCgTFbaRuELIvKt0KKAHdnBWnQ6ioJ8lTCrZXv2CRJK5LwFxLjKCd9YJyx00JR9PjpXECVYJfY53v13LoBbAockikJYjFkCJXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSc1qEegT1AGwDgedo07ewNwFevOlSD7HRudcT8lv4s=;
 b=KKOL9831wwXgi64kGYFzZu8gFW3tLNqqv82alJxX/jkDYjArWK58fYxTZPzczTnK1RNJEjkcsUpeq15GyhKJX2VHv/R+eRlH3hd81OP2z7JfadrYldKaM4uSFnauU2GZDwMqfLhFKqXi/NXSx1nfmXk3tQXDqULOan/6uVzlw5y07bSBrGbpRfYsoU71cwYDXjQ2iyT+kiZK++uTm2SiEiQor+nzOtto2dx0obGJG4m5BroUkolznmtNRLhjZjS1O/7SfhadD27jzuapPg35BLHSHdeqTsHLYOZcrWzwcMy3gP4bgJguvKTWpvAFa7I+uYSz29HhfI6vMs2c1g8dlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSc1qEegT1AGwDgedo07ewNwFevOlSD7HRudcT8lv4s=;
 b=KfNzYK0F9MVN5x/GobCPhcFFAJoZy326nIWR/iUoN6zIUCI7Ocp/Bgz3B89SUuvW2dqYrCWI8XxNtdX5TQsVSe3NsSwTzrUQWJxfvZmT0R+I3pxCDAM57JJ+N68WB7HOyhxCHvVH63fTOZEDUFvRJCx6Pdqjmy1IHplxK+8+dUc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9676.eurprd08.prod.outlook.com (2603:10a6:102:31f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Fri, 4 Apr
 2025 12:02:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 12:02:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kiernan@gmail.com" <alex.kiernan@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH OE-Core 4/5] connman: Add all build options as
 PACKAGECONFIG
Thread-Topic: [OE-core] [PATCH OE-Core 4/5] connman: Add all build options as
 PACKAGECONFIG
Thread-Index: AQHbo+i/NGszMZKlaE258DFaNerL5rOQxr4AgAAHkYCAApysgA==
Date: Fri, 4 Apr 2025 12:02:23 +0000
Message-ID: <038C7174-D53A-4C2B-AEAE-04F61B93A8C8@arm.com>
References: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com>
 <20250402-connman-v1-4-2e4fbbb7caf9@gmail.com>
 <ebfc8f615d694ab3f0c060ed8d3b5c63b88cb7c8.camel@linuxfoundation.org>
 <CAO5Uq5T3xN9s5J4EqcQ5+SxmGf-pFWY-w9xrcmufbCNWxuM=1Q@mail.gmail.com>
In-Reply-To: 
 <CAO5Uq5T3xN9s5J4EqcQ5+SxmGf-pFWY-w9xrcmufbCNWxuM=1Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9676:EE_|AM2PEPF0001C717:EE_|DBBPR08MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f59f3d-36d9-4721-1cae-08dd7370a340
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?svb/Vzt//WWJ2aYsrqefBG7XXVP1aYb0MqXYFgFtD4EVOUjmIKkINXqla8gi?=
 =?us-ascii?Q?fokboILBNAGWgxmFKoTF4JDFzto7/IMYsHXxfWTXJBZJzSvBmW7Gb+wWqzB0?=
 =?us-ascii?Q?e+KtmuXyeUIO356ecxmVmFXQ/7QZxXc1Es1XhurAJ9qNMGM+4Mdmzib6Ko7X?=
 =?us-ascii?Q?Hyg/DK3E/QbsyxWOVFez5WAGksNuqyWZmmkVDZLJ937KV5ysR/lknLTx9/D6?=
 =?us-ascii?Q?QmCUwoXoBTZoKEmBFuJYuY94vUraSsP19YkdHJIrV4h9jULhCc+GILVVOVMA?=
 =?us-ascii?Q?32jgk/qmODw+G3Tkk/+H2V0gBcHYATUyhejIApra7+sVxtOvO7UAhgKUFZ6K?=
 =?us-ascii?Q?Z/hXXF/iv3sQ45h/ZtkyCVO7duzp3KvxAl09DFrbtfc7lazz7TLXBAgjXgJi?=
 =?us-ascii?Q?S6aSliFLURDAo1xevkrDg1cpNYuoq5F7OwS4pmqatfpQRYYJxeIlkrIF4WLN?=
 =?us-ascii?Q?ITIY9bsIVqoECSkpeCPwAy55BmaJFblg+gLOmB/KIrb5dOmZd7IxutER8d3l?=
 =?us-ascii?Q?EIUq3IMNO3BRXrAD5PGdnZwkkNYuCDyNTX+HRJH7vOLDE/HPcozeR2z0NgPV?=
 =?us-ascii?Q?2YVLYPuk5OcpkyucnYRUfaqwHsTaVW3+AdrA6ViveBWo8G8tryEa9gL9oAtl?=
 =?us-ascii?Q?NCsH/2rgUiO9s6HY1HZRsYYqAfrtuvjCFo+8/LRr05CkaVQaNTMfZg5vtvpm?=
 =?us-ascii?Q?cG3/FGI2abML2ypz+9SpqFufcb6ArNx+cpQuiKFLvDt2vO/uXy/Kevp7AZoe?=
 =?us-ascii?Q?pYyiTl7zM39Yg6TBJ0jKYc2ROkslYtKCLFt6LBQnZDo7ickngWZYac7bhCN+?=
 =?us-ascii?Q?Fs5gzjzfvypRN+IgkIihupoDEH/UX1QIGQHmb4TfaTT8U09dC4CYvUbLS2P+?=
 =?us-ascii?Q?npQXi8gm6YLg0ySYB8bVpe5LbpKX+d5aIuKGS/Il7eQtEVIZvMU6w545gjpe?=
 =?us-ascii?Q?yu5no+hl18yEZ59maR2Kr+b4kBDHo6Dnc83JdG5r8YeyralwLL233BXVvM3Z?=
 =?us-ascii?Q?/VvOd+fbiSEibQH3mVAE5RmRL5ihMfrmlGRS3K3PnDyD5pkF8X4PxHAsxdlJ?=
 =?us-ascii?Q?yuP2zs/Lww5kTGnc71q+uJ+7/e2wUrcGc/kX3oE4Ot2IywjtZ9+tNh4PV0qw?=
 =?us-ascii?Q?2u7YLt27qnykg+XKGDt41Zr9F4eYdeJ29S5AKnys9DMQl8VfvH3wopQ5MCFb?=
 =?us-ascii?Q?E1EWk5q5fRq/o+F7dY2ThyH2wnjSZVt09wZ+YsIy67vCX9Bs1ucrcI11BKxK?=
 =?us-ascii?Q?J1POULXSCZulI7UDwTeQztgIUOoRVpC8ovJYaOGUONziJsMaNi18jI74kyiA?=
 =?us-ascii?Q?b3C9OEsBdGJ+ZqAN3BojfTpSGngQ2MRNY7FtSfW4jVKRpaKAg3m+IPHN+kpo?=
 =?us-ascii?Q?mPoPRC5B4FRX8VUOlApRyGdOs1juJJQTJbjnR0iEPFvt7vyboY1nj3xyhRNb?=
 =?us-ascii?Q?f7u0AXBtZryl2i2EAUYUcR+82Jxo4RI+3ek9HA7MGnMUzJ6uvGC+zg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A7D78D965F0B0749A0F5094C54390B20@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9676
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	812c797f-7df8-4413-9a2b-08dd73708f93
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|36860700013|35042699022|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0wIezMt4zCjTQKabrhOcNbE1E1DJd3jZTqtSwXMiHoIH3D4YR5m1oeMQIw00?=
 =?us-ascii?Q?/iX6q8/6dBELpl9RtHZcp57ejY/MhsdcE1kP1fJ5O/7YBDWKpfRFBh1ly2Wm?=
 =?us-ascii?Q?vx2zE24sb+T9Ak0opNxVFDMktuq7c83B8kQJ+jHbttgkeXLRUHGb5j/te2TL?=
 =?us-ascii?Q?hlowTYhk+RxPoORX8M3KEEJOZuIPCkEZcYii/goHUIUX/V2sim9t90kqVlk6?=
 =?us-ascii?Q?/gZQKCDoi4g/tQJVw8hUMEC6TAKzx9/A88uZDuCxLoUQIIQhp/F+QigN7956?=
 =?us-ascii?Q?7fv6aNQ+NUy7a2ndGXDssXeqcWFfAmk7pXy9GzD48/Wtza6tV3t78K85kyrj?=
 =?us-ascii?Q?SY6guhC9QGYPwVFSl1HMa88vlqyt8jW+Y0fjyVH4h9LXwoN5nVTum9wFNpvl?=
 =?us-ascii?Q?V2aw1tGyMXwq+Cztly+p9gMcS2n53+Nhz6nhN8/p19ku/vpVHa4BcmGrtoq4?=
 =?us-ascii?Q?34N2GS26u/PMwPemYBBZhYA3dN3qr9DFtOFjIA9Rrn7Dy5VluWkc6IOSzBE3?=
 =?us-ascii?Q?h3FOPTqIeWZeTK37TjTbvEU4+EoPnOhYQqKHSE1sxFsjL8GlDPcBUZ1LBM5O?=
 =?us-ascii?Q?dWfPn5c0U6l/blRd7/wpCGZCB4+KTY8na2hf9iZF66xfWTAJjwuu7kdBpGuX?=
 =?us-ascii?Q?VtGQWvVH/S3phKL+u7C8/9x062tA3jxAQdyb3yCFvTqE+FQjrr/1mZfXFhkt?=
 =?us-ascii?Q?i2bniphsv3EAk6tWFf09/w4qtEzRYu6nL9+UzeE094kZiPjY2S6ZMzmGA2Qx?=
 =?us-ascii?Q?HO8wZ78ArbHLPvWVKzL3E/j0jCHaz2PWxesTkTpbul6iFHLt/LuX02Zny94z?=
 =?us-ascii?Q?xnRWmmwd9P2XaXE3QLtc7j02z3obqRtJTfT/ECDCsAFT7Jd+/B5MfPCEYtjE?=
 =?us-ascii?Q?jVkc/jsGEgap8DdoH2ptS1ai9SQq6ilzg9OVaFO8ZyiUye2denXyHZPeA7In?=
 =?us-ascii?Q?yqpUxHzcO8PGjhXJztpMfZte/ryHemxucGHLlkRMhk2WcyzveJBAiEx/D/xh?=
 =?us-ascii?Q?7CxvmR/xrbj62oIgORf9kEaZ6o/S9JtFLiZPskXjSuS41XUk/hieDcglbmCH?=
 =?us-ascii?Q?jjp61yetUI6K9O8iJyzNjI/OVHai4dx1S1797Xzkvd669yPSBJv4LNyBztP6?=
 =?us-ascii?Q?p9HJdSKRC3NICAaZCE3B/N/OiEY+/n0s1H9Nw4OKpZhEbqMaB2403sEsH4wc?=
 =?us-ascii?Q?lXWfVvbaNW70B9A14NV6ZkO1r07myoKvD+8gft20imdn+xh0cdFqR7E+Eqbq?=
 =?us-ascii?Q?//t2j9X1kWznBCuozwRmvHeKmMvHEta+oWqDkeSXMbLa+TSF3nn4/EWy5LUB?=
 =?us-ascii?Q?5FVzTs3f6jaErI3qzOtCOjrQIWUji+se+oMLabjZN2RTTZ8OwlNuzNd5Rxjn?=
 =?us-ascii?Q?5+tnZScvmvEbcmrFmxkha1xIXNEBi7CpW44AB+aZPKD/qWi3xXS5liu5Wj3h?=
 =?us-ascii?Q?rvISll3kEyS/gjAntLIEicBS43dky4qA1NVr/UEdZqpyz9JUMtCCbLpedvl6?=
 =?us-ascii?Q?Maan1Do6mrfqoVgFI+K5sfjc9TUqmYJZFIti?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700013)(35042699022)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 12:02:56.8116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f59f3d-36d9-4721-1cae-08dd7370a340
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6298
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 12:03:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214344

On 2 Apr 2025, at 21:08, Alex Kiernan via lists.openembedded.org <alex.kier=
nan=3Dgmail.com@lists.openembedded.org> wrote:
> Argh... thank you. Of course I generated almost the entire list from
> sed/awk across the configure.ac (and then walked through the deps),
> but not iptables/nftables :| Will get an update out in the morning.

This answers a question I was going to ask.

Each option we expose is another combination that is ideally tested, but is=
 explicitly supported.  Do we really need to expose _every_ option that con=
nman has?  I much prefer exposing a limited set of options that make sense,=
 over flooding the recipe with every option possible.

Ross=

