Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE327C7115C
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 15:30:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2628.1750347039109747087
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 08:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8265f6ad79=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J5IoSF024321
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 15:30:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c83x0qum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 15:30:37 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55JFUaFe024147;
	Thu, 19 Jun 2025 15:30:37 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c83x0quk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 15:30:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czZtOHdXMmilp2J698Kg6mvoHNGEbS0MN71p6KaWUIXk/GIdWNiBmdhbzatmswU1yegtR99xm2aOoGizek4T+Q0bMRGYqQVrRaH9K/4OXqd/NvLm0quUGN10k99J6OdR/5IneY7y6jl6IHeVYSeCiH7hADoWHDEE/9dpPpeIgYXfRGLfoHfK6W0CD+kfJ9ROZWM8X6uVwaJkqT7Wnen2tPRx/WLTUPv2i/PSX4BeB4aItAfA6dZvEwOj2T7lyachdyaYxwQJNi0FY00ED2AHqyt0PqA3ijbb6/hCadw0C0IFNePRM1HsE7n/bzQc0/yYnfEEn9GhTRwlCbDvQksZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=np78Obtr8ZySiD1zGprXcP8W4yakUEzzKEfUjA47xMw=;
 b=CZ3D+vh6W9m0AQaRYRUzvhsFKbzkVjnhz/UMTjAWQ9xaUYerpn/VIK8e5ItDmFEGoYAsXWSYO9RTzQiaahpT6/zNdP7Zpg0BJ0Nex9VRAKItYDWjqP/0xz2dviHO2TAtuwTbquRWxnhfYMgCyZr9SeoWMenmHvg9pe+NGLWnv4yoQ7MP6pHDEQpv8uZ2oeoFEgNGk5e5uRR8qlFzeljFTSGoDulPefSMoBFOF+ilo1vMfw5b+vNFP93ivzqy804PlfjFhPmJ5HJ95xRn1ErT6+CxoxRQp7V+DoVyV1H0TVyld1nXwJqySFFUjpYNwgtJSqTYbaj/ll0NHMR/zQeq3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB8126.namprd11.prod.outlook.com (2603:10b6:a03:52e::13)
 by IA0PR11MB8303.namprd11.prod.outlook.com (2603:10b6:208:487::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Thu, 19 Jun
 2025 15:30:31 +0000
Received: from BY1PR11MB8126.namprd11.prod.outlook.com
 ([fe80::31a7:d56a:3ac7:8793]) by BY1PR11MB8126.namprd11.prod.outlook.com
 ([fe80::31a7:d56a:3ac7:8793%6]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 15:30:31 +0000
From: "Kumar, Praveen" <Praveen.Kumar@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "steve@sakoman.com"
	<steve@sakoman.com>
CC: Niko Mauno <niko.mauno@vaisala.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [oe-core][walnascar][PATCH 1/7] default-providers: Add
 VIRTUAL-RUNTIME_dbus variable
Thread-Topic: [oe-core][walnascar][PATCH 1/7] default-providers: Add
 VIRTUAL-RUNTIME_dbus variable
Thread-Index: AQHb4E6P62nCOi+KVEyPqRS6HyU91bQJP+6AgAFcsFk=
Date: Thu, 19 Jun 2025 15:30:31 +0000
Message-ID: 
 <BY1PR11MB8126495C38C67F38533F4F61EE7DA@BY1PR11MB8126.namprd11.prod.outlook.com>
References: <20250618124256.3261625-1-praveen.kumar@windriver.com>
 <2b0ef034-4ee9-493a-aaae-b57137305378@windriver.com>
In-Reply-To: <2b0ef034-4ee9-493a-aaae-b57137305378@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR11MB8126:EE_|IA0PR11MB8303:EE_
x-ms-office365-filtering-correlation-id: dbee1f6c-8109-4645-4a27-08ddaf463a15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|8096899003|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?g0XDWFcOpxDwwJyfP1hS+m98/bvPlxBBa2tGN850Ji/BuTZpaHP17tYNIUzq?=
 =?us-ascii?Q?flYD6nJI+Joytj6c2pDFQmaWbdnRP0QG5AJSJcNm8IuVN3M+3/lD8JJpPezj?=
 =?us-ascii?Q?9R9SHv47gUo8+zc1zd6R68a6XOm8i2rRTZfc7h4p3ZIPwPCjkiemmeAffmr0?=
 =?us-ascii?Q?MyZD8V1YPKIPdPhHTrQPHyR53Lfzr6rKGtANbv7MiwHk0EzUMiTpRLvwBRDT?=
 =?us-ascii?Q?L6LS8UA7UUlDZik+TpbJGO+QZKoW8Reg1GHTAM8UJyt6Z2PLOI4gobNbwMMk?=
 =?us-ascii?Q?rYz6Tt7tWQSsi3McCgMAnDzh5SgArEVRHgJ1CxEbq7KjdnMZ68o/rGNUtW/v?=
 =?us-ascii?Q?veevZmEBD+fn3debO/G0lBbanOQO/CJ+c3jelHh1UTflWidTEaa5gpYtdo33?=
 =?us-ascii?Q?svoRjmrZkV/Qm9IhJakDD24qxQO3HJLcFtTeK190t+d1hz7H4DQ7czzToyeS?=
 =?us-ascii?Q?tim5Z87R6DI4z/EgBKPe83PUuy8nwR4VDvRXV/s6Nc1TzUHplMQireeehfbX?=
 =?us-ascii?Q?pDLa34C3xHDdzpcMwLZHao0XxcglQdY9HdhtlZdVk2pd0n51D++okhctXkQl?=
 =?us-ascii?Q?sO5A417QMHopV9BGfBOZBXIm2lkqtLvhN5kcF8cwB2qlDTuOYnIDAb5jMGEc?=
 =?us-ascii?Q?5VkIC/xMLKfevhmL5NZ6YNCPMVuP4Affe8vdNGxok0hvnDWVWHzUsH7Uthmr?=
 =?us-ascii?Q?T4tme3ISB7vtWIeNz4u7iOSI8Mkq1psgPC00y420wrWIYGwVmLZZPoCtLVz5?=
 =?us-ascii?Q?NUgz7xi51TvAPZbs/VGu3Q5Y8RNMVWMMBu0Po3B59S8d9BRZJmRgsBFIemMW?=
 =?us-ascii?Q?z//ZPA2Eojjq93dqHOwMp6rcmHH09l8d0rLkgLm9Z0WodFd1M47BSnZCrAQ1?=
 =?us-ascii?Q?9W4fbNGhGgYkkClcRcJanaCD+qNRw0cYQycTeB3q2xqHcQOGP+mWwrzsLUlt?=
 =?us-ascii?Q?2ucvy0n66/oj/jUbMpXBJKPmtYNm7u5/QAXFCQ8n4Pju0Oqgr+HsQlsQzTE5?=
 =?us-ascii?Q?dYWt/sd/q4W0n6fOaej8n7sG9j6RluayUZwf4X4gTpGdYHbPY/qA62Pca9UO?=
 =?us-ascii?Q?pq4WbuCgajdSNtOb405qQp6pKkS42SsvnQf1XPVXqNho88JafbQCGqj8FSqc?=
 =?us-ascii?Q?cTAihsbP7iRjbxsSmCzlkXhtP8+F13APavCVVhEKot0tZSgvthgbcJRArmn/?=
 =?us-ascii?Q?jSEHfObe1RI2DAN5kHw/kG/rTcbj/Vus4cvUmR5gRm36QDpoppF9QdnZrV28?=
 =?us-ascii?Q?V/8me3sCMp1ZEdKVdbgO+iLbelJGNufDSXAH2Sy9t9nZ2h/Xi42A4hsSWWv2?=
 =?us-ascii?Q?Tno2+p4P8Y/HgOQBXCVUpQkl4+bX8FF/xum+tw0mDsMhlV6T1P0ei+sscOF/?=
 =?us-ascii?Q?2l/i36e5rbhLSfAzKdsDuODi3xae9iCnm3ipeezCX+BHrZ/GPspWTZPDidG7?=
 =?us-ascii?Q?Sa3xhJjGOy0flCgldONi4uJM/3ECrFRu?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB8126.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(8096899003)(13003099007)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?TOInCx5EFHsmZg2LjXV54/EolY11IqFevRQQOsQReybXHtpHs9RPOtVxOU2T?=
 =?us-ascii?Q?PtcNBrCC0SgPWtHLCASlGJ6hLVquK5H7TZoZI2jTagNzPbNJgsm8GBdSuq2i?=
 =?us-ascii?Q?217sWrW7J/595ivfNfzXoheLrYvo7IcnJZGpEtV+2edbcOacjkN8S3ZJ0vNy?=
 =?us-ascii?Q?Fo6IpS1wyh4SE9V2JsjsbOwxLeD0mKQiU3zx1oe7ySLk+G9CV+28e0AsjeFe?=
 =?us-ascii?Q?9n7ahHROQppKdzbvd9QAoeQ167pDLhG5y9KV6098uaa2xVvFFjY8YROkzrXE?=
 =?us-ascii?Q?0WeITumeE87rEPrfMHqfOb16kbz2mbbxeB6CeTA8Xw3t+Qia0NL3z2T291Yo?=
 =?us-ascii?Q?mNWYUVdqYEBiutj0iJFcobfK9MSJT/Sryu7pWrDCeqy24pJ2tMRZsFzizac1?=
 =?us-ascii?Q?c1RhgfhYpDyHK/QbOAQ/ZaxFavWleYqXcKmkt7nYrmXrQb0HPdCGXl74BMV6?=
 =?us-ascii?Q?W/qu6zuynu0w05JN7QsDvvBe3X/reBzOsF3/7D/iq2JdwjCwmLihwI6WkaFp?=
 =?us-ascii?Q?mhGj7ga56l8Lq4H+6Z+lAvWy39e+MOnCSztvc6C1/jgYcTSuVcF2O7PXD0DC?=
 =?us-ascii?Q?3StQUX9p+m8F1LXTE0Z7+LAlZ7Otlp+lubcCn8tDBuhYBAB17okdxmeCFi0X?=
 =?us-ascii?Q?yx3/YoBx3qLMwh0eQBEuVS2WaMLYPrX0W1tn+dPEsU26nxZDZkK4kokyNuyX?=
 =?us-ascii?Q?i38NKoEAMTelHzUQkLXtCoCSkCPf1oYJ/obOjYEoyWpz6rstGYOPh9fmoB+I?=
 =?us-ascii?Q?23g8e9AhpKzoFUCDU7GSqSr49W8wewNphVPBDkZ3rZeMp2Dps9tq0ixJOUt6?=
 =?us-ascii?Q?F7Rw73PXCJsHJKR1vre39c//5PdCeH/veYOLQgEVxWF2euREPidhncheJDH9?=
 =?us-ascii?Q?hqSWy4tRFPnww3U/71LhHwWPzqgyWQvO2kJRv4IF1e0JQmMBsF+jM9P3bRya?=
 =?us-ascii?Q?Fshec8PaypLsMfWteQ2e6hjdLToZ5Ejrz/KsO/Q0dDr/wFUhNsOw9ddOP8QO?=
 =?us-ascii?Q?ZHc5FZEMhQ3odqb9FdyC4xppDTIY0/6iEiZ1ovHKHNJSn7jUP1TKX6iqpBit?=
 =?us-ascii?Q?KMH2ieAkf+ylo2qrjaEBMgxZvalEqGmNX3AMtWaR2cWVtIPV9PRJTBwp2TYm?=
 =?us-ascii?Q?ru9+J/YhulNHdxn0+aG6s/qNi7gQwEoxkl0DcZuT52qeKjYZ86LoRMzExB9h?=
 =?us-ascii?Q?CEQFEbC8Rzur/Y63nKNVy/Rz1KzwKqHbmX7vwl0i9WXe2Djavh0BCurHwVoP?=
 =?us-ascii?Q?q1azOCrVWX6XclHyFmLU6ZjVgCtG38hXkBB9JGuAy1MtGkzik1MIdTNUG3uN?=
 =?us-ascii?Q?xHjaAquLpauhFpMKwuu1J84zgcdKtbYCN4feKc4twwLp3X4OLOuD2his/wal?=
 =?us-ascii?Q?S2/THIDKhFHmkeyPdQeuemEsZqLq0ZnvAP642RBFdp/3bYJjUUzlAjtvbrT/?=
 =?us-ascii?Q?5wlNUOeUB7cJoMxtpKMi3wrMCRwbwtHD4A/fpfJ6Xisp0GRX7Byf0x751jNp?=
 =?us-ascii?Q?jwSAfzCeke9NomjPzupXs7FodroEaimHAeufV5v5eccIoTWqeSRmugfh4Eta?=
 =?us-ascii?Q?KtHBlO3W0Aa1UPsGNb+/44tlPw6HX5Lfb5feeXV2?=
Content-Type: multipart/alternative;
	boundary="_000_BY1PR11MB8126495C38C67F38533F4F61EE7DABY1PR11MB8126namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB8126.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbee1f6c-8109-4645-4a27-08ddaf463a15
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 15:30:31.3047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hMUYfLU0iTDwqIncrESRyX5WQNjJN/NCAkObKq5GTqusSrFfLl8FXe3jvEaXJ5FSkW2TLqgaM1Uvo7eGjnk55ZQriUZwwjP65zRJZa+1zFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8303
X-Proofpoint-GUID: jWqZCbRRuBAHw1DSZwBMX2cvfjNUljo6
X-Authority-Analysis: v=2.4 cv=cuabk04i c=1 sm=1 tr=0 ts=68542d1d cx=c_pps a=Hxg71G30CNBv6xsSWT+A2w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=vTr9H3xdAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=eWRtdWc1AAAA:8 a=ag1SF4gXAAAA:8 a=e5mUnYsNAAAA:8 a=w0djyZ46nfjxukPW9R8A:9 a=CjuIK1q_8ugA:10 a=ct7U6d-CKb8LS61o:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22 a=fQEa9puXOWAy-YWvlEz7:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: mk9LEiVoUQCDH0zaADL5uKYvQ-KxKLP4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyOCBTYWx0ZWRfX6gdcT5XmaYow BUADNwGxlPaE2ThrvBNG2X3DdEiwBWiDd8N+Y69iKHI0z+ot3psgr4eQlQv7PjqOE+GiJd4wCwG ePBjYDewdoB5x/Ixiw9418fRzZWJ7zSuiK8MeG+c1DXLxVVqdHLmnxXoVNAiZh3aM6sg1jhkpdM
 ZFpxdPnlfgSBAulwokXJ4RzVH2G9i4mik8eQ+w52ldwOrvqw7Jo97EKER7gVnaDydyduqM2xpqQ 1d9z3y7Funa+MKwK/+iInuZZZmIqJkIpxpdE+jeVmZyF6gRcev3n9iBWOP1Pu1uOGGox5xPSdMM a9IMSXNZ+lj6vdkdcVbhDjIG6wtxN9iLjgcoeUPA6pbB2FMCVAZQrCLvtM9AbsfyCAXrnbkf2rv
 6LUFQwENg+k/xC5Yyo4ifFbAT9n4ipfROO+TrXi/9t4CxhdSBjd4X/Ky11c/cls8zfcQDaXQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506190128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 15:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219087

--_000_BY1PR11MB8126495C38C67F38533F4F61EE7DABY1PR11MB8126namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

Initially, I upgraded glib-2.0 from version 2.84.0 to 2.84.2 in walnascar t=
o address some CVE fixes. However, after upgrading, the build started faili=
ng because the newer glib version now depends on VIRTUAL-RUNTIME_dbus.

To resolve this, I backported a few related commits (around 7) from Poky (m=
aster) that define and support VIRTUAL-RUNTIME_dbus in the distro configura=
tion. These changes are required to ensure the upgraded glib builds properl=
y.

Without these backports, the upgrade would either need to be dropped or wor=
ked around using manual overrides in local.conf. To avoid that and keep thi=
ngs aligned with upstream, I included these patches.

I will look more closely at your comments and keep you posted.

Thanks,
Praveen
________________________________
From: MacLeod, Randy <Randy.MacLeod@windriver.com>
Sent: Thursday, June 19, 2025 12:09 AM
To: Kumar, Praveen <Praveen.Kumar@windriver.com>; openembedded-core@lists.o=
penembedded.org <openembedded-core@lists.openembedded.org>; steve@sakoman.c=
om <steve@sakoman.com>
Cc: Niko Mauno <niko.mauno@vaisala.com>; Richard Purdie <richard.purdie@lin=
uxfoundation.org>
Subject: Re: [oe-core][walnascar][PATCH 1/7] default-providers: Add VIRTUAL=
-RUNTIME_dbus variable

Add Steve who maintains walnascar.


On 2025-06-18 8:42 a.m., Praveen Kumar via lists.openembedded.org wrote:

From: Niko Mauno <niko.mauno@vaisala.com><mailto:niko.mauno@vaisala.com>

The purpose of the new variable is to facilitate oe-core users who wish
to use an alternative runtime D-Bus implementation instead of the
default Freedesktop.org's dbus, such as dbus-broker, a recipe for which
is currently available under
meta-openembedded/meta-oe/recipes-core/dbus/

While introducing this facilitation the intent is to preserve the
existing functionality, while allowing the user to optionally select an
alternative runtime D-Bus implementation by adding the following line
e.g. to local.conf file:

  VIRTUAL-RUNTIME_dbus =3D "dbus-broker"

As a background, for example the Fedora distribution uses dbus-broker
instead of Freedesktop.org's D-Bus implementation. The following
excerpts from
https://fedoraproject.org/wiki/Changes/DbusBrokerAsTheDefaultDbusImplementa=
tion
provide background for their technological decision

  This change provides a more scalable and more reliable implementation in =
place of the reference implementation.
  The reference implementation suffers from long-standing issues including =
potential dead-locks and susceptibility to denial of service attacks, which=
 the replacement implementation does not.

and

  No visible changes in behavior are expected, except for different log mes=
sages.
  Any visibly different behavior to `dbus-daemon` should be reported as a r=
egression.
  Ideally, this change should only improve the performance and security of =
the message bus.

(From OE-Core rev: 81fd917ac05be19d8345fff272a2ffc17a257880)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com><mailto:niko.mauno@vaisal=
a.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org><mailto:r=
ichard.purdie@linuxfoundation.org>
Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com><mailto:praveen.k=
umar@windriver.com>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/dis=
tro/include/default-providers.inc
index d3eefb754b..cebd0400f4 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -31,6 +31,7 @@ VIRTUAL-RUNTIME_base-utils ?=3D "busybox"
 VIRTUAL-RUNTIME_base-utils-hwclock ?=3D "busybox-hwclock"
 VIRTUAL-RUNTIME_base-utils-syslog ?=3D "busybox-syslog"
 VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
+VIRTUAL-RUNTIME_dbus ?=3D "dbus"

Praveen,

This change-set borders on new feature development in a released branch.

Unless you have a very good use case, we'll likely reject it the backport t=
o walnascar.

Can you explain why you want / need the backport in a reply to this thread =
and
if you send a v2, in a cover letter to the v2 series.

Thanks,


../Randy





 #
 # Default recipe providers




-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#219000): https://lists.openembedded.org/g/openembedded-=
core/message/219000
Mute This Topic: https://lists.openembedded.org/mt/113707135/3616765
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core+owner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [rand=
y.macleod@windriver.com<mailto:randy.macleod@windriver.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-




--
# Randy MacLeod
# Wind River Linux

--_000_BY1PR11MB8126495C38C67F38533F4F61EE7DABY1PR11MB8126namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Randy,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Initially, I upgraded glib-2.0 from version 2.84.0 to 2.84.2 in walnascar t=
o address some CVE fixes. However, after upgrading, the build started faili=
ng because the newer glib version now depends on VIRTUAL-RUNTIME_dbus.</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
To resolve this, I backported a few related commits (around 7) from Poky (m=
aster) that define and support VIRTUAL-RUNTIME_dbus in the distro configura=
tion. These changes are required to ensure the upgraded glib builds properl=
y.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Without these backports, the upgrade would either need to be dropped or wor=
ked around using manual overrides in local.conf. To avoid that and keep thi=
ngs aligned with upstream, I included these patches.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I will look more closely at your comments and keep you posted.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Praveen</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> MacLeod, Randy &lt;Ra=
ndy.MacLeod@windriver.com&gt;<br>
<b>Sent:</b> Thursday, June 19, 2025 12:09 AM<br>
<b>To:</b> Kumar, Praveen &lt;Praveen.Kumar@windriver.com&gt;; openembedded=
-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&g=
t;; steve@sakoman.com &lt;steve@sakoman.com&gt;<br>
<b>Cc:</b> Niko Mauno &lt;niko.mauno@vaisala.com&gt;; Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Subject:</b> Re: [oe-core][walnascar][PATCH 1/7] default-providers: Add =
VIRTUAL-RUNTIME_dbus variable</font>
<div>&nbsp;</div>
</div>
<div>
<div class=3D"x_moz-cite-prefix">Add Steve who maintains walnascar.</div>
<div class=3D"x_moz-cite-prefix"><br>
</div>
<div class=3D"x_moz-cite-prefix"><br>
</div>
<div class=3D"x_moz-cite-prefix">On 2025-06-18 8:42 a.m., Praveen Kumar via=
 lists.openembedded.org wrote:<br>
</div>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">From: Niko Mauno <a class=3D"x_moz-txt-link-=
rfc2396E" href=3D"mailto:niko.mauno@vaisala.com">&lt;niko.mauno@vaisala.com=
&gt;</a>

The purpose of the new variable is to facilitate oe-core users who wish
to use an alternative runtime D-Bus implementation instead of the
default Freedesktop.org's dbus, such as dbus-broker, a recipe for which
is currently available under
meta-openembedded/meta-oe/recipes-core/dbus/

While introducing this facilitation the intent is to preserve the
existing functionality, while allowing the user to optionally select an
alternative runtime D-Bus implementation by adding the following line
e.g. to local.conf file:

  VIRTUAL-RUNTIME_dbus =3D &quot;dbus-broker&quot;

As a background, for example the Fedora distribution uses dbus-broker
instead of Freedesktop.org's D-Bus implementation. The following
excerpts from
<a class=3D"x_moz-txt-link-freetext" href=3D"https://fedoraproject.org/wiki=
/Changes/DbusBrokerAsTheDefaultDbusImplementation">https://fedoraproject.or=
g/wiki/Changes/DbusBrokerAsTheDefaultDbusImplementation</a>
provide background for their technological decision

  This change provides a more scalable and more reliable implementation in =
place of the reference implementation.
  The reference implementation suffers from long-standing issues including =
potential dead-locks and susceptibility to denial of service attacks, which=
 the replacement implementation does not.

and

  No visible changes in behavior are expected, except for different log mes=
sages.
  Any visibly different behavior to `dbus-daemon` should be reported as a r=
egression.
  Ideally, this change should only improve the performance and security of =
the message bus.

(From OE-Core rev: 81fd917ac05be19d8345fff272a2ffc17a257880)

Signed-off-by: Niko Mauno <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mail=
to:niko.mauno@vaisala.com">&lt;niko.mauno@vaisala.com&gt;</a>
Signed-off-by: Richard Purdie <a class=3D"x_moz-txt-link-rfc2396E" href=3D"=
mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundati=
on.org&gt;</a>
Signed-off-by: Praveen Kumar <a class=3D"x_moz-txt-link-rfc2396E" href=3D"m=
ailto:praveen.kumar@windriver.com">&lt;praveen.kumar@windriver.com&gt;</a>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/dis=
tro/include/default-providers.inc
index d3eefb754b..cebd0400f4 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -31,6 +31,7 @@ VIRTUAL-RUNTIME_base-utils ?=3D &quot;busybox&quot;
 VIRTUAL-RUNTIME_base-utils-hwclock ?=3D &quot;busybox-hwclock&quot;
 VIRTUAL-RUNTIME_base-utils-syslog ?=3D &quot;busybox-syslog&quot;
 VIRTUAL-RUNTIME_keymaps ?=3D &quot;keymaps&quot;
+VIRTUAL-RUNTIME_dbus ?=3D &quot;dbus&quot;</pre>
</blockquote>
<p>Praveen,<br>
</p>
<p>This change-set borders on new feature development in a released branch.=
<br>
<br>
Unless you have a very good use case, we'll likely reject it the backport t=
o walnascar.<br>
<br>
Can you explain why you want / need the backport in a reply to this thread =
and<br>
if you send a v2, in a cover letter to the v2 series.</p>
<p>Thanks,<br>
</p>
<p><br>
</p>
<p>../Randy</p>
<p><br>
</p>
<p><br>
</p>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">
=20
 #
 # Default recipe providers
</pre>
<br>
<fieldset class=3D"x_moz-mime-attachment-header"></fieldset>
<pre class=3D"x_moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-
Links: You receive all messages sent to this group.
View/Reply Online (#219000): <a class=3D"x_moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/219000">https://l=
ists.openembedded.org/g/openembedded-core/message/219000</a>
Mute This Topic: <a class=3D"x_moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/113707135/3616765">https://lists.openembedded.org/mt/1=
13707135/3616765</a>
Group Owner: <a class=3D"x_moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.open=
embedded.org</a>
Unsubscribe: <a class=3D"x_moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/o=
penembedded-core/unsub</a> [<a class=3D"x_moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
</blockquote>
<p><br>
</p>
<pre class=3D"x_moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
</div>
</body>
</html>

--_000_BY1PR11MB8126495C38C67F38533F4F61EE7DABY1PR11MB8126namp_--

