Return-Path: <Oliver.Rohe@wago.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4DDC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:57:01 +0000 (UTC)
Received: from mx08-005c9601.pphosted.com (mx08-005c9601.pphosted.com [205.220.185.5])
 by mx.groups.io with SMTP id smtpd.web11.16510.1747731419556222064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 01:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wago.com header.s=p012021 header.b=VL8/SVvr;
 spf=pass (domain: wago.com, ip: 205.220.185.5, mailfrom: prvs=1235086a97=oliver.rohe@wago.com)
Received: from pps.filterd (m0237837.ppops.net [127.0.0.1])
	by mx08-005c9601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JLcDoA015778;
	Tue, 20 May 2025 10:56:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wago.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p012021; bh=6j
	y/lDOp3fLaIOsZcAaZG+lxroQe3POcA3xGv1rAKkw=; b=VL8/SVvrwx6f160oEG
	smUqgMeN6M8H3PSE1itQkpWpA+6RIRKL9C3Pw6zt8EWAT+O8VTITcPFPog0bcvr/
	JtROBmaeH98SpE6MvyE/aunICctodZyfnjfXYs2PUe62gY/8nmAUqX8EcyE9F8QI
	4UnnXITkWQ5JENXyB08BUzQKLiuE4ifX34lkrx8r2NaqoErGIifcWCYR1kb4CcFw
	qODea5L/zBIRemfBRAYG3zNJbxHk9bSG1Q353SA8EMxQg6Z4jUx0aKDocpCepnE1
	cqXIp2nt8PHWq1FazW8qa4BORqnvEkjjM/hje3irBBpz7E25JW8i0zeve8Ii6kQL
	/5bA==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazlp17013013.outbound.protection.outlook.com [40.93.64.13])
	by mx08-005c9601.pphosted.com (PPS) with ESMTPS id 46pf37jr1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 10:56:57 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9bPeCnErYmk4GnucH9VN4tfu6l5QsRiEql/U00JZNgTFMi5clNPzlYERwwKmWJWjZX+XmIAlBak2IQcWGPgrqpZBaDH2ZNY/IUdvrRswywtPQLM7SVuNinGk8j6lFE62K8XUs9ETmxOIeKpJgzC3+5i7IT+CTyxULMB748FmQRn0PQqLriLSAJ9SNB9RkCueNC4ytDH3UXkjRG6k0nVi8rKhm92hp6rnSLfCYKvw/DeIZ4yGtyEhZBRFMT/1ei65/Ni9/D04lSkIo0JspdqpDUxKKX1gK3PHLjIXZcLKN+fxacx+KgEe4sWEgWYWsYXePu830ZGbXgrSNKBQTXzXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jy/lDOp3fLaIOsZcAaZG+lxroQe3POcA3xGv1rAKkw=;
 b=cpMnj3Wm4dxeuMiNcjNvQv45qgzM444FK0hYta+CX+OYhX1TVFsWMUZWTdd2eU0r45hrAwFaqxIS9vU5xYx5IpDud3P8e25KO9JkGL9GAUPEDoUGhgPurPe8MN/ikpgLq1vxfTAjiLsw5LDhOfpFq/VPE7w3PJ/T6Op58jw0V0JdC7hCjtwOVbMWQF3Frr4/cHmDdPhullBbthnL7MB9Cep/v4qJYaiHZCKizHbhSMim/v9z3XBNbeaMUYA1FhD4BkErpPFADwyGUWanphuf7tGFzmHMGGNlc/5vlDQYeKbPK3YOh8mvmjxW+Iut8uhcvS11PNbCAtWMjB6oRDrfsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wago.com; dmarc=pass action=none header.from=wago.com;
 dkim=pass header.d=wago.com; arc=none
Received: from DB4PR08MB8102.eurprd08.prod.outlook.com (2603:10a6:10:386::8)
 by DU0PR08MB8114.eurprd08.prod.outlook.com (2603:10a6:10:3ea::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 08:56:53 +0000
Received: from DB4PR08MB8102.eurprd08.prod.outlook.com
 ([fe80::93b6:7bd:c4e5:7e99]) by DB4PR08MB8102.eurprd08.prod.outlook.com
 ([fe80::93b6:7bd:c4e5:7e99%4]) with mapi id 15.20.8722.027; Tue, 20 May 2025
 08:56:52 +0000
From: Oliver ROHE <Oliver.Rohe@wago.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap] kernel-fitImage: allow overwrite the
 configuration dtb label
Thread-Topic: [OE-core] [scarthgap] kernel-fitImage: allow overwrite the
 configuration dtb label
Thread-Index: AQHbyK8wuuk0gmzqn0aP7Tt6e+zNjbPaGZuAgAEeomE=
Date: Tue, 20 May 2025 08:56:52 +0000
Message-ID: 
 <DB4PR08MB8102EE478E4F7773FB2218429E9FA@DB4PR08MB8102.eurprd08.prod.outlook.com>
References: <20250519110649.35526-1-oliver.rohe@wago.com>
 <DB4PR08MB8102778287B8B1408AF455BB9E9CA@DB4PR08MB8102.eurprd08.prod.outlook.com>
 <CAOSpxdZAxDj4N+kohxF4Bmg_G_AshEYCzdV+9k_PTEN2wLfYRg@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdZAxDj4N+kohxF4Bmg_G_AshEYCzdV+9k_PTEN2wLfYRg@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Enabled=True;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_SiteId=e211c965-dd84-4c9f-bc3f-4215552a0857;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_SetDate=2025-05-20T08:56:52.280Z;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Name=Internal;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_ContentBits=0;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR08MB8102:EE_|DU0PR08MB8114:EE_
x-ms-office365-filtering-correlation-id: 48e840e6-6a9c-4009-6b48-08dd977c43f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?utf-7?B?TTBxem0vT0xrU1BZdkVHWTNGT25HNGcwdTE1allyRloxQzg5RWpyZERpcWNt?=
 =?utf-7?B?VnpGWmtZSjBTc0pqaURzeXFCcFRhak9GblM1dWQzL1p5Ky1MRUN3M05OYVp6?=
 =?utf-7?B?L0U4a0dYWWRKMTdUSGd4NThxdWlVUUl4Ky1MT3QxOHY1bzE4d2NIWmF6Q2Q4?=
 =?utf-7?B?OVMvNHNyOTZmWjJjU1JhNkQ0UjJPNkNaNWRNaU4yQmpRcy9jR3d5ZU1aUzlV?=
 =?utf-7?B?ejRZbGlTU0s0WE5kZWNQcnNBQVFBRHorLURaTzJtMnNrdlFJMlc4ZnAyd21Y?=
 =?utf-7?B?ZDViQ3AzOEp5bnpIQkhzby94OTVEdHFsamRrQ3dxMVNWcWdRcWdqT1FHTm5K?=
 =?utf-7?B?NG5NcjFtRUJ0NFNiY3FqS1ViQnZuUHBaVnJ0REJjYUx4bnBjenV0dFA5UHBs?=
 =?utf-7?B?aDlpQ2szN3hSRHJuU1RQWnRmZFRLc0VvMzVWam9Gdmp2MkcwNFJ5Z3JjSWVU?=
 =?utf-7?B?SUpMb2REUUxRTmNVb29JMDNJUWw5VndhMTIvRGV2Z3h2Vzd3T2llTXBncG1J?=
 =?utf-7?B?TzlDM1U1YnQ1ektQVGVNSGdNeDRUWkVHdmdTWjZZdistQjRFNUhOS2VMNkRP?=
 =?utf-7?B?d1JKb3duQWcrLW1zSXg5TEs0VmJYcTF2WDRucHFGVFd4RjEzVE1jM00rLXpo?=
 =?utf-7?B?ckI4YnhyU2hlV1AxcVNDLzV1TEtYZmpXVjJ1YXVXMFdDTzFnZVNtWkRlSjQz?=
 =?utf-7?B?Nk1Pd1RrdURwejJQUkQ2TjRiWFNtSEU1UU9rbTRzKy1TVFlVanIzKy1ZL3Nv?=
 =?utf-7?B?L3UrLU5RWGU3dzcvQTBjc1oxbHpQYnJRem9xTnRJMVYvV283NE9YVXdpcWxE?=
 =?utf-7?B?clJHeTI3L1k4cGNrYmxnaFdMV21RRWVBYUZ0OFQvV0lJc1NRU1g0SG1yTUdI?=
 =?utf-7?B?TEZpRHJobUVxYi9rMlZzVmFGMEw0VkZZdGpFOXliUHBVUk5WRDl2VUdDbDhr?=
 =?utf-7?B?MmovTzRiRVE1OUF3dU92MGhUZVI2Mnl6RzkwckJuOFFXN25qRWFDMUtRM3Vw?=
 =?utf-7?B?QXF6MXQ2ZXpsZnlNdXVpY0VSYkxneEVoZ2dyMHpERGRHSzJRaktxZXBNWWtr?=
 =?utf-7?B?cjZMaVZFMmNHeVZPZTRveVRyaWxEM3ZMVGtWSHFhOVRZWSstY2tzZzZMdWZy?=
 =?utf-7?B?Ni81NXFaRTNGTkt2WkU3eGtXNlE4WXpaUnN6Z2V6ZHcvVnE0TFhRdUZsMDlG?=
 =?utf-7?B?clNmRUJtVU9mT05rd214VDhWMHJZYk9zKy1NTDNKV1ZQMnNaWGE0Y0RmQmZa?=
 =?utf-7?B?b3hubXNtTWdrTzV2dEhMdUlIWmdsUEZSNE9NMDBUdlVsdnVROTVxQnU1cGdk?=
 =?utf-7?B?Yk83aDNaclFVVm1QdWhLamJ1c3R3RUFsWHFVRGYxeWJkaVNGMGs3TlcwWk5Y?=
 =?utf-7?B?R2w1VTJKY2xJYnExZ2pwREQxb0NIeTFSV3JYMG9xcklFTmJLNDZTenJkVTEv?=
 =?utf-7?B?NWNVYUR4UWVpSkdkS2E4M2pVSXVtRXNJdmJRMkVpNVNhY1JlNmcwZ3BJeFYz?=
 =?utf-7?B?WFFQcTY0UEE3MXkxdnhUWmJpM3YxMnR6OHpybEZvcG13SVRRb0tsSERkdWth?=
 =?utf-7?B?Vkoyd3Z2akNLMHRwczdhMUZJTkZ1anVSUTRPU1RWUFU0aG1YUlVmREYzVGRp?=
 =?utf-7?B?OWpQUTRyc2ZOclhUdno2YmhpUTczckYyU3BHN05oRTJ1UFM1NUR6TTlobndk?=
 =?utf-7?B?NUNCSkRTMXQydHZTbVhlb0FkOGtjVHVOVlNldU5jUXNxYzhnLzh5c01WU3Fj?=
 =?utf-7?B?VU56WHk2TmpDSmxENHVFcXBtekpDbHlxQUhCRE5iRGluTistOHp4aVRnMGlH?=
 =?utf-7?B?ZXdKbHRUaistaGF1SkNjNVE2UW5MSjFNTlNheUlpRHFQTVFGL0ZpNG1kQ2Ro?=
 =?utf-7?B?VDNsRHpPYlZsYjRDN2pSNmFwSmVabmdZVDF2Y1FMSVhuckVTUFppZWVSTXht?=
 =?utf-7?B?QllVbzRWMDZxOGpGcGFBaTZaaXltRkljK0FEMC0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB8102.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-7?B?bzBuKy1OcCstalBTV2Y0QmtxVENWdlkyQUxOUzhhV1hYUXlUZWpBNThqb3dh?=
 =?utf-7?B?RWM1NDZtT1VOdEk1aW1JTmJZRVRXeFZoazVjTG1yemd3c2p6MG5VQnFUY1Qz?=
 =?utf-7?B?R0VPSG5mZkVTek5JNHVrL1hxNTQyMXdnaGpvUTVYRmZNakNMVmxldVN2OFhM?=
 =?utf-7?B?MEErLWZvZkVDcHJHS2dROUJBbVRYSWRRTlJyU2VLL1F5cldYWG5JZ0p1dEVS?=
 =?utf-7?B?NUdwelNFeEl3MUhaSFVKTHovRVdxRVdyME9hZzVLNDM0cklMUG9janBnZ2tQ?=
 =?utf-7?B?ZElPUGNJNlU4Z2h1ckJlc2YxVWhxR3h6OWw0UXFPT3NRSFpNT0w3dW5pOGJo?=
 =?utf-7?B?M25KUEQ3bXZLQU1EV0dUbTlUUUpDKy0wWXRVQnJIZkcvZXRHS1pqbFVDa3ZZ?=
 =?utf-7?B?NWQxam1CWXhhWWxuY0FXaldLQzFXQ0lEU3dIcC95OUc0d3BqU3dZMnJ6VTU=?=
 =?utf-7?B?Ky1XYlJncFByNDdIbDRvdWI5MkJUejZHeVYrLUJidjlUVE5LRG1nRWI5WHRC?=
 =?utf-7?B?NXhLNFd4dy9nOFJTMjhmREZlS01kUUxlNnVqcmducGt2TXFISU81MklvMnlC?=
 =?utf-7?B?cWUzTTRaSWgxUWtTcGF5czlQTFdKWGNNUistSlg2M2piT2dJNXJnMlk4QU5C?=
 =?utf-7?B?UHpaL2hsdW00OURzZ2NvMHJBV3FUQnRzVGZ2OGd0aGxLUENnbDV6Z3N6Sksz?=
 =?utf-7?B?cG9PdGtmYi92TlZMbERDZnFWQ3pIS3hzeDVLSHpRQ3l6dDVFZkZGQWs5TDZj?=
 =?utf-7?B?dWdkM3BBRklkNXhSNHpxL2tQQVNzS3lZaUFpNE9CWXgzQjN4VVNXcWE4Y2I1?=
 =?utf-7?B?UGpYM1g3QXlqSmhMNGVSU0VHcTNWbWZQOVUvWGNZUnUvem1xT2JWUkFRbDJW?=
 =?utf-7?B?T3FHOGNBQUdFWU5nd0E3eCstMjR2eWhsckQveW9RSEV3d2NVckJMN3RiMi9x?=
 =?utf-7?B?Q2lKd2dBNGIvV281OVZ1anB5eDFLZTduNGJoR2UyV0phcGFxWDNBY29LdUIw?=
 =?utf-7?B?VnNKM3lBL2VGeUEvVUZ0WXk1Q0pKU05ka2xNOFpybjB5Z2tacXpPWFNyLzBt?=
 =?utf-7?B?TzVwRmxSRVh3Y2pBSHh5Y0pTVDErLXNlL0grLUY5RTZsUmxxZWtMbDE2TkZu?=
 =?utf-7?B?M3dNNWU4WmlZajAvOGd0TkRGQXJzYTlXQnpiUEl0aFlndXh2OVNLQjZJNVFY?=
 =?utf-7?B?bG9QMGJmVXNGUUgwZXBRRGs2QUJKZU5zem1pM2hTY2o1eDVYSGYvckNKVktT?=
 =?utf-7?B?OWhHa0t5MXhlKy0zd1hvRistSkdTMXloZ29VSVU1b3UyNkdFZnBVQWpXMFc1?=
 =?utf-7?B?N0I5UDJDSlUrLVI3VTNoYVpqS0pHTTRTVkJVdystS0ZuWTg0WU5jdElQWUpY?=
 =?utf-7?B?SXlXNnN3eHpNdENydjdLLzEzNUliVi8rLWo5eVJUeGhwNVFUbUZRZ2JFMHNt?=
 =?utf-7?B?QURnOGZPYmRETDljdnpFWXBJSHlHY2JWT0F1OGhKemhwNkJqUDlJQTl2eXIw?=
 =?utf-7?B?L1dZSzhZREJ6THZjamhCTEMyY09KM3lONFlCQ2I2eDk4OTJxVysteG9FT1dk?=
 =?utf-7?B?NHBXWXBOR0NMVjdHc2RxT2c2bVFaMHErLTBXZGtrNDNqTWRGdTk4WUFyalow?=
 =?utf-7?B?M2I0N3ZxSVNHbkt3WldrUDNlUUE0MUF3L0l2bjh0Qk5GeXFuNHBOeTM0eUd2?=
 =?utf-7?B?ZFRTaHdnbVFEZjRJZjBFT2UxNW9QU2QwKy1SNDZTWW82ZHFlbW5NeVhydlB0?=
 =?utf-7?B?TFBsOVYzRGhPV0dPMTNVQzlybWhTQzAwVjc5TUljcFlTb2grLXlCNnpjaEJ4?=
 =?utf-7?B?Q3RGbzQzSmlLOSstTnNUeTdEUHJTckFuWkJHN0dHTkVBUzBRMW5JWlFBS2dh?=
 =?utf-7?B?aG1sRndHQ1hQcjljWmFCQ21TeW0zWDE2eVZiZ0x3V0g5MystL0dXYUpLUXdx?=
 =?utf-7?B?M0xpdGhyYjZMa1lnVjVnRHh1S0JiM0RRbU5WbTNHRkZycmp0TVQ3emVJNTRy?=
 =?utf-7?B?a3hyMUhxYlkxY1dwanJzbG45ekNsQXZHeWF5UThUdldYMXNIOVM3VThDVE1K?=
 =?utf-7?B?SllSQmp3L1J1ZnF6WEJCa0c2ekRENjB6U0crLXNrSURCSCstc3gzRm1Bdkhr?=
 =?utf-7?B?VXJaMmVuVGZ1OG5rKy1CZmdhalhiVXlmanl5UU0rQUQwLQ==?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	PJHgx38becNvtFCc/ua/WN+Lx1N/VvzByr+i9JA9M9qk3p9iAqt1aKTwxbJ8o5+pQcfnU8bf/84bO3JBAt1v3RIydRMq1NQe7A6UHfgwveC3pGPqAV+HAy2DwYZE/iAylONU5gQuwss9Brst94DB+vFLZQPiQcTgJNan0Pn9ikITbI5swnAMoOkMCXXReJMyk7hMKXAvcrt0CaSqQ6yum8XCz2o9v/4JKihGAS+670MWDEND6E8no/1hdF+t++jkUjyKtl9TE+eASJE8t7UeVsERUWcD6FQyeUIncBVDWhMt9t9/T9GZKpa/9rru9z45OX+mNZ4DvETD5+bZAx9y7odpFslYbpCjXNAti110qObXvfkqzL5/U2d+cmmyCBzUG4oxBxFqibVdSmmP5iHA/7qtqJLxMOn/iT+Mh0j23rPq3le0+xDwj/lSK7gavAS7vJNJN5162BUuZxln+HJzh/ULteX0JLF0oLbNSXoLBmMPbWdGpU4gjiXz6JjJALlbpTI/wlgM5//tLUXi9rqyRO7KvV8d5qIARyPM0F8+jhZr4Ft8q2jxpSHl9i0dBMYbwU9K4u5Sz57VJNsSXKOcRPakZ4gyyLVKyS0//Afkn0qGOtsrgY94jW3Zt2mgxFqi
X-OriginatorOrg: wago.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB8102.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e840e6-6a9c-4009-6b48-08dd977c43f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 08:56:52.7860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e211c965-dd84-4c9f-bc3f-4215552a0857
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 47snALtFiC46KX19tUCA/1X1LEKherfHZg/JRb34aTwKPZT/lV9oNWR7pB5Sgt5xvsXLHoJJkjmN1WgIF7fCoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8114
X-Proofpoint-GUID: 4pnFmqF0zHCV2ZqTRAR17-k31CavA2yw
X-Authority-Analysis: v=2.4 cv=PM4P+eqC c=1 sm=1 tr=0 ts=682c43d9 cx=c_pps a=pKEIMpKgTAyMp9GMYe9rGQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=wzW8d0FwaosA:10
 a=TjCsNTqe5bEA:10 a=dt9VzEwgFbYA:10 a=uherdBYGAAAA:8 a=Q4-j1AaZAAAA:8 a=_enOPnqeAAAA:8 a=ThMX_IV2AAAA:8 a=P-IC7800AAAA:8 a=PsGttSeWAAAA:8 a=BeCs0L9fAAAA:8 a=MFFWu9hoAAAA:8 a=x_K2OgyKAAAA:8 a=Z04a_Ar88DutOfuy62wA:9 a=avxi3fN6y70A:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=XAbD3I9PDrnSMThV5XoS:22 a=0jcnvs3wCqEDeep41k2a:22 a=d3PnA9EDa4IxuAV0gXij:22 a=efdZSoI4qTPEuUsFB-sz:22 a=6GxDtIppGXzhLb-t5ksx:22 a=SV2Tz2c5VQls2wiQynLY:22 a=uSGbBGx2Jid6J7mcpKVF:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA3MiBTYWx0ZWRfX7LH5jUO1/Ye4 F+SD6DLvho855wAy47mulExvSUU5i0jfca4+HcrfC0iDfIzn5B+FB6dasJ8MMOugVWpMnEuKrli 9Okc5CamAtvT2RCVJR9aTLiXUiSg3bo0PAqAEXy9wZ8z/D/YjjFw7HzWJ65y1HDQQ8GXIpoCqmJ
 qy8OYAAhIhFfi/MLrdbVv6toPlQRk3HAiKZ2IGXRsSiCLywpveAkh72u2f9U2KsjAJJ+hWFn4fu nnFVz5aGHW2TPYkb33Zebr51Q4qP/OAwq9REeKzFxkmlLdPQEsPVLtVNonHnqSv8WJQfUGSNqcK bL00YxzoLnUfYD/8kUlcIiA3gGM/AnnckKC7zU/iUSa8pieRTGAY0qNb+g+luex53RmFJ5frWfN
 msJ+6C93Z4odUAhO8PRcTRABQFOiIh2Kt1go/yELdPxNE7rM0txvJxeeOLDQ8JEBWRotOwhq
X-Proofpoint-ORIG-GUID: 4pnFmqF0zHCV2ZqTRAR17-k31CavA2yw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505200072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 08:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216893

Hi Steve,

+AD4- Does the master branch allow this?  I can't see a similar commit
+AD4- there, so it would need to be submitted there first.
+AD4- Since this is a new feature, there would need to be some discussion a=
s
+AD4- to whether this would be appropriate for stable branches.

The patch is already on the next, sorry I am a little bit ahead :)
I can ping you again once it makes it into the master. Thx a lot+ACEAIQ-


Internal
+AF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF=
8AXwBfAF8AXwBfAF8AXwBfAF8AXwBfAF8-
From: Steve Sakoman +ADw-steve+AEA-sakoman.com+AD4-
Sent: Monday, May 19, 2025 5:48 PM
To: Oliver ROHE
Cc: openembedded-core+AEA-lists.openembedded.org
Subject: Re: +AFs-OE-core+AF0- +AFs-scarthgap+AF0- kernel-fitImage: allow o=
verwrite the configuration dtb label

Does the master branch allow this? I can't see a similar commit there, so i=
t would need to be submitted there first. Since this is a new feature, ther=
e would need to be some discussion as to whether this would be appropriate =
for stable branches.+IAo-
ZjQcmQRYFpfptBannerStart
This Message Is From an External Sender
Please use caution when clicking on links or opening attachments+ACE-

ZjQcmQRYFpfptBannerEnd

Does the master branch allow this?  I can't see a similar commit
there, so it would need to be submitted there first.

Since this is a new feature, there would need to be some discussion as
to whether this would be appropriate for stable branches.

Steve

On Mon, May 19, 2025 at 4:14+IC8-AM Oliver ROHE via lists.openembedded.org
+ADw-Oliver.Rohe+AD0-wago.com+AEA-lists.openembedded.org+AD4- wrote:
+AD4-
+AD4- This allows to provide a custom label for each dtb
+AD4- without having to overwrite the whole function.
+AD4-
+AD4- Signed-off-by: Oliver Rohe +ADw-oliver.rohe+AEA-wago.com+AD4-
+AD4- Signed-off-by: Mathieu Dubois-Briand +ADw-mathieu.dubois-briand+AEA-b=
ootlin.com+AD4-
+AD4- ---
+AD4-  meta/classes-recipe/kernel-fitimage.bbclass +AHw- 25 +-+-+-+-+-+-+-+=
-+-+-+-+-+-+--------
+AD4-  1 file changed, 17 insertions(+-), 8 deletions(-)
+AD4-
+AD4- diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/class=
es-recipe/kernel-fitimage.bbclass
+AD4- index 4b74ddc201..53b5acb0fc 100644
+AD4- --- a/meta/classes-recipe/kernel-fitimage.bbclass
+AD4- +-+-+- b/meta/classes-recipe/kernel-fitimage.bbclass
+AD4- +AEAAQA- -382,6 +-382,15 +AEAAQA- symlink+AF8-points+AF8-below() +AHs=
-
+AD4-         echo +ACIAJA-realpath+ACI-
+AD4-  +AH0-
+AD4-
+AD4- +-+ACM-
+AD4- +-+ACM- Simple function to allow overwriting the configuration node l=
abel
+AD4- +-+ACM-
+AD4- +-+ACM- +ACQ-1 ... DTB image name
+AD4- +-fitimage+AF8-emit+AF8-section+AF8-config+AF8-dtb+AF8-label() +AHs-
+AD4- +-       dtb+AF8-img+AD0AIgAk-1+ACI-
+AD4- +-       echo +ACIAJAB7-FIT+AF8-CONF+AF8-PREFIX+AH0AJAB7-dtb+AF8-img+=
AH0AIg-
+AD4- +-+AH0-
+AD4- +-
+AD4-  +ACM-
+AD4-  +ACM- Emit the fitImage ITS configuration section
+AD4-  +ACM-
+AD4- +AEAAQA- -442,7 +-451,7 +AEAAQA- fitimage+AF8-emit+AF8-section+AF8-co=
nfig() +AHs-
+AD4-         +ACM- conf node name is selected based on dtb ID if it is pre=
sent,
+AD4-         +ACM- otherwise its selected based on kernel ID
+AD4-         if +AFs- -n +ACIAJA-dtb+AF8-image+ACI- +AF0AOw- then
+AD4- -               conf+AF8-node+AD0AJA-conf+AF8-node+ACQ-dtb+AF8-image
+AD4- +-               conf+AF8-node+AD0AJA-(fitimage+AF8-emit+AF8-section+=
AF8-config+AF8-dtb+AF8-label +ACQ-dtb+AF8-image)
+AD4-         else
+AD4-                 conf+AF8-node+AD0AJA-conf+AF8-node+ACQ-kernel+AF8-id
+AD4-         fi
+AD4- +AEAAQA- -480,13 +-489,13 +AEAAQA- fitimage+AF8-emit+AF8-section+AF8-=
config() +AHs-
+AD4-                 +ACM- default node is selected based on dtb ID if it =
is present,
+AD4-                 +ACM- otherwise its selected based on kernel ID
+AD4-                 if +AFs- -n +ACIAJA-dtb+AF8-image+ACI- +AF0AOw- then
+AD4- -                       +ACM- Select default node as user specified d=
tb when
+AD4- -                       +ACM- multiple dtb exists.
+AD4- -                       if +AFs- -n +ACIAJA-default+AF8-dtb+AF8-image=
+ACI- +AF0AOw- then
+AD4- -                               default+AF8-line+AD0AIg-default +AD0-=
 +AFwAIgAkAHs-FIT+AF8-CONF+AF8-PREFIX+AH0AJA-default+AF8-dtb+AF8-image+AFwA=
IgA7ACI-
+AD4- -                       else
+AD4- -                               default+AF8-line+AD0AIg-default +AD0-=
 +AFwAIgAkAHs-FIT+AF8-CONF+AF8-PREFIX+AH0AJA-dtb+AF8-image+AFwAIgA7ACI-
+AD4- -                       fi
+AD4- +-                       +ACM- Select default node as user specified =
dtb when
+AD4- +-                       +ACM- multiple dtb exists.
+AD4- +-                               img+AD0AJA-default+AF8-dtb+AF8-image
+AD4- +-                       else
+AD4- +-                               img+AD0AJA-dtb+AF8-img
+AD4- +-                       fi
+AD4- +-                       default+AF8-line+AD0AIg-default +AD0- +AFwAI=
gAk-(fitimage+AF8-emit+AF8-section+AF8-config+AF8-dtb+AF8-label +ACQ-img)+A=
FwAIgA7ACI-
+AD4-                 else
+AD4-                         default+AF8-line+AD0AIg-default +AD0- +AFwAIg=
AkAHs-FIT+AF8-CONF+AF8-PREFIX+AH0AJA-kernel+AF8-id+AFwAIgA7ACI-
+AD4-                 fi
+AD4- --
+AD4- 2.43.0
+AD4-
+AD4-
+AD4-
+AD4- Internal
+AD4-
+AD4- -+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--
+AD4- Links: You receive all messages sent to this group.
+AD4- View/Reply Online (+ACM-216854): https://urldefense.com/v3/+AF8AXw-ht=
tps://lists.openembedded.org/g/openembedded-core/message/216854+AF8AXwA7ACE=
AIQ-B6Ltl4Q+ACE-uMGd9cVJYlgmmgM2omZGiLPwbnvFT9Nq+AF8-aQ7xbbhAQcFmqgQrRdSYSj=
GjLGkHPQKZqJtktrwRWw4Gg+ACQ-
+AD4- Mute This Topic: https://urldefense.com/v3/+AF8AXw-https://lists.open=
embedded.org/mt/113189715/3620601+AF8AXwA7ACEAIQ-B6Ltl4Q+ACE-uMGd9cVJYlgmmg=
M2omZGiLPwbnvFT9Nq+AF8-aQ7xbbhAQcFmqgQrRdSYSjGjLGkHPQKZqJtktrMDDl7Ew+ACQ-
+AD4- Group Owner: openembedded-core+-owner+AEA-lists.openembedded.org
+AD4- Unsubscribe: https://urldefense.com/v3/+AF8AXw-https://lists.openembe=
dded.org/g/openembedded-core/unsub+AF8AXwA7ACEAIQ-B6Ltl4Q+ACE-uMGd9cVJYlgmm=
gM2omZGiLPwbnvFT9Nq+AF8-aQ7xbbhAQcFmqgQrRdSYSjGjLGkHPQKZqJtktqpvnYCZQ+ACQ- =
+AFs-steve+AEA-sakoman.com+AF0-
+AD4- -+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--+AD0--
+AD4-


