Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2980C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 07:56:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5945.1748937381073545456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 00:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8249c5c905=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5534SXow012213
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Jun 2025 00:56:20 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rrnv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 00:56:20 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5537uJQp000368
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Jun 2025 00:56:19 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rrnv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 00:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzQv5uNGZlp59BEQfKurIuKQ19yQoR281ecI2xqQkL3lxPBPZuPHmYztk4mD0QVGGkpjfn/qzn/cNWY4CqwF9EgCx7hQXMhipbhS5GPvrtWtePa1dV+ZYfGYcyjmEgvCtWwrGUkjEBg0977dRnQ5OMPsWQ5Hbyf3y1UGVDRn3cBUP+ML9wblrS1pMTjnYJ2vjhDOGYVenALeiBN6ecuT8yoqaJYXA9E9MK1SPhezsgAxsdMIzhBVVmPr0m4WLDWA5HkNjxR5FDJCcTF0J5qXNWBd/hhLtv0hKxxSoTYZwbJhrevUH0H3JwZ79cjkS1zGq/SbOpSCoNWYqJZBhwiDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjFsvdab+DLLMxpRDlkXzjZaywbKde94210xgl6ZUYU=;
 b=MaJkVmPtkDkCkECUJYgl7XPbNCThjcAVKxaYMMQ6bGbVgcpytbe7y1X2CKE4W/kK3dZREaqvFaBxVHX6WWaPLaLh3GfUJOyvXriZHY0LDplMFZPxriXccdFuUuPuCR2zFSQIEaICEGVJ15ApNfMPRISP9XWcElvQkPZNStRN1OHZTDdxnJ8lfNoKaGS7RUkhAOl4pT5BYhj6S7OhNk3wVHQkZSUUyOV+KzPtPGkA1oIIO4ZJdl/DXdctA/wBftgBcPE8kI3RxoXHcp+lDey2XCGwVkMCiA32Q7/criWMmbsT2xcD36+Uw30QleuyqoMQXMmhNnWaMnWc5YBYfMVwvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB8126.namprd11.prod.outlook.com (2603:10b6:a03:52e::13)
 by BL3PR11MB6458.namprd11.prod.outlook.com (2603:10b6:208:3bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Tue, 3 Jun
 2025 07:56:15 +0000
Received: from BY1PR11MB8126.namprd11.prod.outlook.com
 ([fe80::31a7:d56a:3ac7:8793]) by BY1PR11MB8126.namprd11.prod.outlook.com
 ([fe80::31a7:d56a:3ac7:8793%4]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 07:56:14 +0000
From: "Kumar, Praveen" <Praveen.Kumar@windriver.com>
To: "steve@sakoman.com" <steve@sakoman.com>,
        "vanusuri@mvista.com"
	<vanusuri@mvista.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][kirkstone 05/12] libsoup-2.4: Fix CVE-2025-32910
Thread-Topic: [OE-core][kirkstone 05/12] libsoup-2.4: Fix CVE-2025-32910
Thread-Index: AQHbzLFvzLDH20I1yUq/0/Zg8Wa7JbPxHtAD
Date: Tue, 3 Jun 2025 07:56:14 +0000
Message-ID: 
 <BY1PR11MB812646004A79B1F1960F015DEE6DA@BY1PR11MB8126.namprd11.prod.outlook.com>
References: <cover.1748093626.git.steve@sakoman.com>
 <b65e3d3a4dc2375d9bb81c7a91c84139cc667a47.1748093626.git.steve@sakoman.com>
In-Reply-To: 
 <b65e3d3a4dc2375d9bb81c7a91c84139cc667a47.1748093626.git.steve@sakoman.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR11MB8126:EE_|BL3PR11MB6458:EE_
x-ms-office365-filtering-correlation-id: 32a98be4-f25b-44fa-a216-08dda2741cf8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|13003099007|38070700018|8096899003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?nNlHHs6yHobl8GUnZ2P3WFiwtLyTy2Jpa0VqvsrgkeUOF+JCfPQMQlxhirW3?=
 =?us-ascii?Q?oUyGUlwMJXJ6FSvPW3xe0p0hx6JWfrc0DKDEob87pWt27LOKTNwcX+zLYzBd?=
 =?us-ascii?Q?bMWIVNjyc8Z3lMSqfhYa1PozKKtfT46ziSFUzzwiSDE3jNDAo3nxS5AIKkaC?=
 =?us-ascii?Q?2o6asToaBGD2GY5p/3hwShmz6bHaaswowjokuaVD8vr0MB8tij2+JAbaKobF?=
 =?us-ascii?Q?lZG6n/Wtztsxj5eHPMe2TD6vHXjWtX83e6N/hirPvh6YRwPSkfjNV3ueQ8FC?=
 =?us-ascii?Q?CnrvlryMeaq/JX5vXguCSMSAiMEqu3DpbvjlHGMoHqA4UX0RjVx12zjQ4jzy?=
 =?us-ascii?Q?X9nR8O3NCGnbv4XVuuXjIqE3bU0KFLgE6Y6mpb1nPWb5j1Sl6Me0yhIkgReZ?=
 =?us-ascii?Q?W1BXhxtNm0QrMjWDLdeeAayM0SxuGQGKJATL+l7Donx1NI1HtnWaTH2iVhGb?=
 =?us-ascii?Q?KU/KEG6cMN6OOTf6BUEs7xf4MvwpanZs007tI9a2aj8c+yi0qKR52wkOCJtN?=
 =?us-ascii?Q?eZjcdlNkGGQQcW3ctrc58lPSp36WSPlipU9Z2PAO+9jrdi/4HpGFZfuaxazv?=
 =?us-ascii?Q?pmWHPkFaeWo2HubR5yIcpEJ+0bXgHXFQ1U82qrw/JC5zky9JcqfvaP4jI7Ug?=
 =?us-ascii?Q?dGBQ7cmzqTpC2OHT6TqMC+xEpYRVM66Q1+LR+tm4Tc+9PzMiix96GY94l6/N?=
 =?us-ascii?Q?ZAzSHnmRiBL0JoUv8pQRmQRsfnkrVO3hxp2LdJMz1G1FO8ELwI6TjwrdGgBA?=
 =?us-ascii?Q?dnLGVz+pUuHUkAFG/HA8fF1VZ6DJyG7TkKAsM7uNXyslpYXCXRHiotXE2vOS?=
 =?us-ascii?Q?S3mAd7UqoayGxIza2ooNNFGOJgT0jmc8Dq2WecnLdgJznHdeXimsOvljeZ5m?=
 =?us-ascii?Q?PXBLB2Do86NpFJlf1Da+m9k5IFg0Blo3kWRQ9CDnOyCrVNOOuzqwMX1YM8rC?=
 =?us-ascii?Q?zRRr5M2Nt3aMnIinqmybbFStEtzP39VwXeZdqs5Rf4KaQAXWXK+4saEiEmpS?=
 =?us-ascii?Q?rz9NuGDayFTRdcFfFzrh0fBH2HVFgrjKwDDMNHrZoyPGoQLys4D3+in7YiuH?=
 =?us-ascii?Q?1B6QV0tMEFWEZMZuLL64WlHVPGDvR4GNwBPk/d73os11E8Oy4gQlNBuFZatA?=
 =?us-ascii?Q?CQBL9X8x5Vf14ikAySYqQSSYF+AstZp4z2RZJZ/DO9qKyT1CYT5QI1el/xAF?=
 =?us-ascii?Q?XkZXEElLflgtvmJZzXlEa7zuKGQTsJGs1RvK3pspnZMeRQzsdrqcREJ3gJ07?=
 =?us-ascii?Q?lyF0TAio/MUyqeWqtWlPUIcR0x3t+ZZuSaMa0hqRjkg8NjsRbZk21aCbEJQR?=
 =?us-ascii?Q?gNgmwdBXC3pEvu4grMsA6fvR92+w+f1ElgVOQyrfQS8yAJl1Ijr+9tle2K4h?=
 =?us-ascii?Q?fDdEII77Wkcv0RtOPRjECQQltL4lMHVrk089qUToxdcjsvtbnAwbpZV4KfJ2?=
 =?us-ascii?Q?xI/s+ZLzZIW8mlHMeXLyNFY4bDUqTGiN?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB8126.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(13003099007)(38070700018)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?F9bfmCvCUA4aqL5u5K4KIcqbem6K81u8MSEKpmkf8iW5uJL8clJi3NukQL2w?=
 =?us-ascii?Q?882s+PvihifbCa5w0n4oBiTdn4Tbca/TnPLd6vL8sa9vDsa/jWHo0aJ4t+IU?=
 =?us-ascii?Q?eZAENLK0BHqPm/AAQK35iOcvr7+PrT6zqK5m1L9LGguK2DNmHLAOS0V/GI2B?=
 =?us-ascii?Q?D7aNsBpx1MsIntjnqWmJ7iL3D2FqLEFU26aeWZYbCVRwX3KP2EZ67yZfKFY1?=
 =?us-ascii?Q?YRzGyx8voOPnNKmaxv+3sW8NGODYs8+JrVjJ/W3c1yhxxqgFI7EZykNN2uUN?=
 =?us-ascii?Q?1rfHNPJM9uNeUooZNmLDzL+4F7dw71ZndTPB24gY8CrpdrmTskUbQHux8ALP?=
 =?us-ascii?Q?FvZu7StH8idY6kYQG/ISV5RVeaVfh6PqZhlSqe9pg2a91BOdiPTCc7mQdlaJ?=
 =?us-ascii?Q?+RamxP6UxreerRZQ3s7u7tTptYrJs3zXCacbOQoqyIHjWra6XYqSwxBvX328?=
 =?us-ascii?Q?6MgN1N84JCQNKxOWm9M291Zb+zPYj3KJaQmQdPvhzm091jZdp2Z8ypsrTlFp?=
 =?us-ascii?Q?RrtpXL0+I4sNV/hFF8akaL98GSaFiBgPBY878e/Kn1G57bhdqmloRkDUPf6q?=
 =?us-ascii?Q?tZxu77nBoPKfu9z6FC2I7Sggwi0mgq9enWy0YEO1oXGSdzjrx408p+yjFfut?=
 =?us-ascii?Q?Gv6QiLXgv+8gHzim+4wdMZizdlB5xZsqGmbPeQ5CMDFDCl8SsBDnaS55hghP?=
 =?us-ascii?Q?nJcug7yEpxOsBUKwMI46CLT6lnwfI5EmmP5l7aOAGujl3pKyrJ0hJuC/1ilM?=
 =?us-ascii?Q?T8MEuAJ30v92JBvx7XUOs1teiDyaQr26QdmdES2DmuEPtUOk+f/iLeM0DptK?=
 =?us-ascii?Q?PGzE+Hye+n8aFqf98sgho5jtHgVoIGi/ccGLcymjibIbv5JjmhGYOe/EjwNN?=
 =?us-ascii?Q?qVjL+WkkzdTRsFz1xGWXQZVgzajp9b9vmVJxw2Tatzs8hZKop0SFQfa4+jl5?=
 =?us-ascii?Q?9XjfwxjOKJEtmWdUwZbXSK/M/TDzcugHt+56SUO7VT9ZVMMk8MiyKpXV0j1N?=
 =?us-ascii?Q?2Cw7KlIjLb8p7aZM9uImw9rWIGEezvxqRxcDwhj1tbjvfaVwNl4bJ+GN8f2X?=
 =?us-ascii?Q?rAjXXigPBxCNM1jmYBrWffmAI9mkkn7VZ54ZZUVvwlmoTAXAMJI73eCHldTG?=
 =?us-ascii?Q?V0rFy6h7ksKsV+cRQRlsArq4lq64TrusxdWgLNOqfep3umWgZi82sQqPB21p?=
 =?us-ascii?Q?hsul3KoQhaQTSxRCR0mfJkh3eJNsyaZGgps1bKws0grFbHnCEUAepAKriqLP?=
 =?us-ascii?Q?17iRREKs/OYdHImRo5IDZU6iE9oh4zDVvLY5beOpXbJAD6Ju9u5uJqMOCxP4?=
 =?us-ascii?Q?dQybKxUnKO0DIEcry3vmITGS+3YT23GryaGCLvH+VHqd2lcPidU9Pz2PduzC?=
 =?us-ascii?Q?ee3z5UVjAY8lFydhf0nSDNd/p1zr1qxB5MbJRC/in0TvFXKBFyi7QnI86FMq?=
 =?us-ascii?Q?/X9iiorr7ZH+UPcW9qNwJKIIqeL13X2Df/LWOoGMenoFK3O/gccPZbeoMX/5?=
 =?us-ascii?Q?+Z63l1jPo/2W+mqIx4nUw9x9EDHS6+WUIyy+5QaMjXIQOpZZj4VU1I4HnF0K?=
 =?us-ascii?Q?vovxEPyNyueWlyPemkZg70m0+Ptfrslo5zaqHLw5ikFIDE8eGHfM3QPc1/lO?=
 =?us-ascii?Q?9A=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BY1PR11MB812646004A79B1F1960F015DEE6DABY1PR11MB8126namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB8126.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a98be4-f25b-44fa-a216-08dda2741cf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 07:56:14.2051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FoS6wYrVxKuk88nD9fXsYal0JsHzS1K8Ibms5e41bgBGiE2sCfJksDJX0+tS4Y/zQG0QxNWvR2UXEi0gjMOo9dpyENIH19p3jd/ij7ny6O4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6458
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA2OCBTYWx0ZWRfXxqwxXHa4kD0Z Rx96SokpiHEMPBi25MdYXOx+7u7lFHa/1+GQ/QeIMUDId6xJ1SJWRu/yNT6X//HZR9ihVE6k8dn facilYnKenjC/W2Y3bz8tl6apwNaNUKkgw2W/Sv259v9ky+jHlLDGwSFqMAi4/WjX5T0yXg2+VC
 247/sSlzU0I24qUWf6WVV46Acbno4iJwMVhqFDb60x/NQCYfi7cYBX9uGxrX4DHmyUW5GELQ8oz m2rR/zcBXw8G0H3VHuk862RheMxGVhyYEgXO6UC6+IU9f07WezoKwWH3dn+eVhMB93bcA7YpFHA HpIgXerRKrhk0hRAZiFiQjn0Zgg4gN8jPYI4pVgXmHa8C4XSSSnq6cYBH5XYjoo4R98nIf3GSws
 xcVr1pohxPFXyPoDKcITfOo2r/uP6pRmdkOCnfPb6xrirvIY/7ANCLq7uTGoKaUKy1zi6toJ
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=683eaaa4 cx=c_pps a=p9nDpOBbYeOQlBo6D++p1g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=xNf9USuDAAAA:8 a=GHR8O2WEAAAA:20 a=Q4-j1AaZAAAA:8 a=fk1lIlRQAAAA:8 a=_enOPnqeAAAA:8 a=V2sgnzSHAAAA:8 a=j9Gkw3vXnVuGLMuZa8UA:9 a=CjuIK1q_8ugA:10 a=LjCbym_77WCty4n8XWsA:9 a=NAFcoAlBtPzPRl5P:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=U75ogvRika4pmaD_UPO0:22 a=XAbD3I9PDrnSMThV5XoS:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-GUID: K1XAJWRnpNF6NibaTk0mXXE5zPYEol1q
X-Proofpoint-ORIG-GUID: Ptfzu0m9ImJo9jbI6hDCYOeW7F-3ii79
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506030068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 07:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217762

--_000_BY1PR11MB812646004A79B1F1960F015DEE6DABY1PR11MB8126namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I noticed that after this patch for CVE-2025-32910 was applied, the build f=
ails for libsoup-2.74.2 when building core-image-sato.

The error is:
../libsoup-2.74.2/tests/auth-test.c:1554:39: error: unknown type name 'Soup=
ServerMessage'; did you mean 'SoupServerClass'?

and something similar to it. If needed I can share the complete log file.

This issue does not happen with core-image-minimal, may be because the test=
 suite isn't built there.

When I revert this CVE patch, the error goes away, and the build works fine=
 again.

Has anyone else seen this?  Should I disable the test suite if it's not req=
uired ?
Please suggest on how we should fix it.

Thanks,
Praveen


________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Steve Sakoman via lists.openembedded.org <steve=
=3Dsakoman.com@lists.openembedded.org>
Sent: Saturday, May 24, 2025 7:06 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [OE-core][kirkstone 05/12] libsoup-2.4: Fix CVE-2025-32910

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from debian to fix
 CVE-2025-32910

Upstream-Status: Backport [import from debian https://salsa.debian.org/gnom=
e-team/libsoup/-/tree/debian/bullseye/debian/patches?ref_type=3Dheads
Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a1=
cbab56f5d15016cc861a503423cfe
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a34597a44bd58c4759e7d5=
e23f02c3b556a
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705=
e5eab34b13832]

Reference:
https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417
https://security-tracker.debian.org/tracker/CVE-2025-32910

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-2.4/CVE-2025-32910-1.patch        |  97 ++++++++++++
 .../libsoup-2.4/CVE-2025-32910-2.patch        | 148 ++++++++++++++++++
 .../libsoup-2.4/CVE-2025-32910-3.patch        |  26 +++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   3 +
 4 files changed, 274 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910=
-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910=
-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910=
-3.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
new file mode 100644
index 0000000000..de4faf5380
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
@@ -0,0 +1,97 @@
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Sun, 8 Dec 2024 20:00:35 -0600
+Subject: auth-digest: Handle missing realm in authenticate header
+
+(cherry picked from commit e40df6d48a1cbab56f5d15016cc861a503423cfe)
+
+Upstream-Status: Backport [import from debian https://salsa.debian.org/gno=
me-team/libsoup/-/blob/debian/bullseye/debian/patches/CVE-2025-32910-1.patc=
h?ref_type=3Dheads
+Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a=
1cbab56f5d15016cc861a503423cfe]
+CVE: CVE-2025-32910
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-auth-digest.c |  3 +++
+ tests/auth-test.c          | 50 +++++++++++++++++++++++++++++++++++++++++=
+++++
+ 2 files changed, 53 insertions(+)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index e8ba990..263a15a 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -142,6 +142,9 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *=
msg,
+       guint qop_options;
+       gboolean ok =3D TRUE;
+
++        if (!soup_auth_get_realm (auth))
++                return FALSE;
++
+       g_free (priv->domain);
+       g_free (priv->nonce);
+       g_free (priv->opaque);
+diff --git a/tests/auth-test.c b/tests/auth-test.c
+index 8295ec3..dfc6b09 100644
+--- a/tests/auth-test.c
++++ b/tests/auth-test.c
+@@ -1549,6 +1549,55 @@ do_cancel_after_retry_test (void)
+         soup_test_session_abort_unref (session);
+ }
+
++static void
++on_request_read_for_missing_realm (SoupServer        *server,
++                                   SoupServerMessage *msg,
++                                   gpointer           user_data)
++{
++        SoupMessageHeaders *response_headers =3D soup_server_message_get_=
response_headers (msg);
++        soup_message_headers_replace (response_headers, "WWW-Authenticate=
", "Digest qop=3D\"auth\"");
++}
++
++static void
++do_missing_realm_test (void)
++{
++        SoupSession *session;
++        SoupMessage *msg;
++        SoupServer *server;
++        SoupAuthDomain *digest_auth_domain;
++        gint status;
++        GUri *uri;
++
++        server =3D soup_test_server_new (SOUP_TEST_SERVER_IN_THREAD);
++      soup_server_add_handler (server, NULL,
++                               server_callback, NULL, NULL);
++      uri =3D soup_test_server_get_uri (server, "http", NULL);
++
++      digest_auth_domain =3D soup_auth_domain_digest_new (
++              "realm", "auth-test",
++              "auth-callback", server_digest_auth_callback,
++              NULL);
++        soup_auth_domain_add_path (digest_auth_domain, "/");
++      soup_server_add_auth_domain (server, digest_auth_domain);
++        g_object_unref (digest_auth_domain);
++
++        g_signal_connect (server, "request-read",
++                          G_CALLBACK (on_request_read_for_missing_realm),
++                          NULL);
++
++        session =3D soup_test_session_new (NULL);
++        msg =3D soup_message_new_from_uri ("GET", uri);
++        g_signal_connect (msg, "authenticate",
++                          G_CALLBACK (on_digest_authenticate),
++                          NULL);
++
++        status =3D soup_test_session_send_message (session, msg);
++
++        g_assert_cmpint (status, =3D=3D, SOUP_STATUS_UNAUTHORIZED);
++      g_uri_unref (uri);
++      soup_test_server_quit_unref (server);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -1576,6 +1625,7 @@ main (int argc, char **argv)
+       g_test_add_func ("/auth/async-message-do-not-use-auth-cache", do_as=
ync_message_do_not_use_auth_cache_test);
+       g_test_add_func ("/auth/authorization-header-request", do_message_h=
as_authorization_header_test);
+       g_test_add_func ("/auth/cancel-after-retry", do_cancel_after_retry_=
test);
++        g_test_add_func ("/auth/missing-realm", do_missing_realm_test);
+
+       ret =3D g_test_run ();
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
new file mode 100644
index 0000000000..0d72afa1d6
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
@@ -0,0 +1,148 @@
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Thu, 26 Dec 2024 18:18:35 -0600
+Subject: auth-digest: Handle missing nonce
+
+(cherry picked from commit 405a8a34597a44bd58c4759e7d5e23f02c3b556a)
+
+Upstream-Status: Backport [import from debian https://salsa.debian.org/gno=
me-team/libsoup/-/blob/debian/bullseye/debian/patches/CVE-2025-32910-2.patc=
h?ref_type=3Dheads
+Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a3459=
7a44bd58c4759e7d5e23f02c3b556a]
+CVE: CVE-2025-32910
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-auth-digest.c | 45 +++++++++++++++++++++++++++++++++++------=
----
+ tests/auth-test.c          | 19 +++++++++++--------
+ 2 files changed, 46 insertions(+), 18 deletions(-)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index 263a15a..393adb6 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -132,6 +132,19 @@ soup_auth_digest_get_qop (SoupAuthDigestQop qop)
+       return g_string_free (out, FALSE);
+ }
+
++static gboolean
++validate_params (SoupAuthDigest *auth_digest)
++{
++        SoupAuthDigestPrivate *priv =3D soup_auth_digest_get_instance_pri=
vate (auth_digest);
++
++        if (priv->qop || priv->algorithm =3D=3D SOUP_AUTH_DIGEST_ALGORITH=
M_MD5_SESS) {
++                if (!priv->nonce)
++                        return FALSE;
++        }
++
++        return TRUE;
++}
++
+ static gboolean
+ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+                        GHashTable *auth_params)
+@@ -169,16 +182,21 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage=
 *msg,
+       if (priv->algorithm =3D=3D -1)
+               ok =3D FALSE;
+
+-      stale =3D g_hash_table_lookup (auth_params, "stale");
+-      if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *priv->hex_urp)
+-              recompute_hex_a1 (priv);
+-      else {
+-              g_free (priv->user);
+-              priv->user =3D NULL;
+-              g_free (priv->cnonce);
+-              priv->cnonce =3D NULL;
+-              memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
+-              memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
++        if (!validate_params (auth_digest))
++                ok =3D FALSE;
++
++        if (ok) {
++                stale =3D g_hash_table_lookup (auth_params, "stale");
++                if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *priv=
->hex_urp)
++                        recompute_hex_a1 (priv);
++                else {
++                        g_free (priv->user);
++                        priv->user =3D NULL;
++                        g_free (priv->cnonce);
++                        priv->cnonce =3D NULL;
++                        memset (priv->hex_urp, 0, sizeof (priv->hex_urp))=
;
++                        memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
++                }
+         }
+
+       return ok;
+@@ -269,6 +287,8 @@ soup_auth_digest_compute_hex_a1 (const char           =
   *hex_urp,
+
+               /* In MD5-sess, A1 is hex_urp:nonce:cnonce */
+
++                g_assert (nonce && cnonce);
++
+               checksum =3D g_checksum_new (G_CHECKSUM_MD5);
+               g_checksum_update (checksum, (guchar *)hex_urp, strlen (hex=
_urp));
+               g_checksum_update (checksum, (guchar *)":", 1);
+@@ -359,6 +379,8 @@ soup_auth_digest_compute_response (const char        *=
method,
+       if (qop) {
+               char tmp[9];
+
++                g_assert (cnonce);
++
+               g_snprintf (tmp, 9, "%.8x", nc);
+               g_checksum_update (checksum, (guchar *)tmp, strlen (tmp));
+               g_checksum_update (checksum, (guchar *)":", 1);
+@@ -422,6 +444,9 @@ soup_auth_digest_get_authorization (SoupAuth *auth, So=
upMessage *msg)
+       g_return_val_if_fail (uri !=3D NULL, NULL);
+       url =3D soup_uri_to_string (uri, TRUE);
+
++        g_assert (priv->nonce);
++        g_assert (!priv->qop || priv->cnonce);
++
+       soup_auth_digest_compute_response (msg->method, url, priv->hex_a1,
+                                          priv->qop, priv->nonce,
+                                          priv->cnonce, priv->nc,
+diff --git a/tests/auth-test.c b/tests/auth-test.c
+index dfc6b09..6fb1e4a 100644
+--- a/tests/auth-test.c
++++ b/tests/auth-test.c
+@@ -1550,16 +1550,17 @@ do_cancel_after_retry_test (void)
+ }
+
+ static void
+-on_request_read_for_missing_realm (SoupServer        *server,
+-                                   SoupServerMessage *msg,
+-                                   gpointer           user_data)
++on_request_read_for_missing_params (SoupServer        *server,
++                                      SoupServerMessage *msg,
++                                      gpointer           user_data)
+ {
++        const char *auth_header =3D user_data;
+         SoupMessageHeaders *response_headers =3D soup_server_message_get_=
response_headers (msg);
+-        soup_message_headers_replace (response_headers, "WWW-Authenticate=
", "Digest qop=3D\"auth\"");
++        soup_message_headers_replace (response_headers, "WWW-Authenticate=
", auth_header);
+ }
+
+ static void
+-do_missing_realm_test (void)
++do_missing_params_test (gconstpointer auth_header)
+ {
+         SoupSession *session;
+         SoupMessage *msg;
+@@ -1582,8 +1583,8 @@ do_missing_realm_test (void)
+         g_object_unref (digest_auth_domain);
+
+         g_signal_connect (server, "request-read",
+-                          G_CALLBACK (on_request_read_for_missing_realm),
+-                          NULL);
++                          G_CALLBACK (on_request_read_for_missing_params)=
,
++                          (gpointer)auth_header);
+
+         session =3D soup_test_session_new (NULL);
+         msg =3D soup_message_new_from_uri ("GET", uri);
+@@ -1625,7 +1626,9 @@ main (int argc, char **argv)
+       g_test_add_func ("/auth/async-message-do-not-use-auth-cache", do_as=
ync_message_do_not_use_auth_cache_test);
+       g_test_add_func ("/auth/authorization-header-request", do_message_h=
as_authorization_header_test);
+       g_test_add_func ("/auth/cancel-after-retry", do_cancel_after_retry_=
test);
+-        g_test_add_func ("/auth/missing-realm", do_missing_realm_test);
++        g_test_add_data_func ("/auth/missing-params/realm", "Digest qop=
=3D\"auth\"", do_missing_params_test);
++        g_test_add_data_func ("/auth/missing-params/nonce", "Digest realm=
=3D\"auth-test\", qop=3D\"auth,auth-int\", opaque=3D\"5ccc069c403ebaf9f0171=
e9517f40e41\"", do_missing_params_test);
++        g_test_add_data_func ("/auth/missing-params/nonce-md5-sess", "Dig=
est realm=3D\"auth-test\", qop=3D\"auth,auth-int\", opaque=3D\"5ccc069c403e=
baf9f0171e9517f40e41\" algorithm=3D\"MD5-sess\"", do_missing_params_test);
+
+       ret =3D g_test_run ();
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
new file mode 100644
index 0000000000..ab0f650804
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
@@ -0,0 +1,26 @@
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Fri, 27 Dec 2024 13:52:52 -0600
+Subject: auth-digest: Fix leak
+
+(cherry picked from commit ea16eeacb052e423eb5c3b0b705e5eab34b13832)
+
+Upstream-Status: Backport [import from debian https://salsa.debian.org/gno=
me-team/libsoup/-/blob/debian/bullseye/debian/patches/CVE-2025-32910-3.patc=
h?ref_type=3Dheads
+Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb0=
52e423eb5c3b0b705e5eab34b13832]
+CVE: CVE-2025-32910
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-auth-digest.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index 393adb6..a1db188 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -66,6 +66,7 @@ soup_auth_digest_finalize (GObject *object)
+       g_free (priv->nonce);
+       g_free (priv->domain);
+       g_free (priv->cnonce);
++        g_free (priv->opaque);
+
+       memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
+       memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/reci=
pes-support/libsoup/libsoup-2.4_2.74.2.bb
index f04d9b2966..517a8e4539 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -23,6 +23,9 @@ SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-=
${PV}.tar.xz \
            file://CVE-2025-32906-2.patch \
            file://CVE-2025-32909.patch \
            file://CVE-2025-46420.patch \
+           file://CVE-2025-32910-1.patch \
+           file://CVE-2025-32910-2.patch \
+           file://CVE-2025-32910-3.patch \
           "
 SRC_URI[sha256sum] =3D "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823=
b6018b40d01159"

--
2.43.0


--_000_BY1PR11MB812646004A79B1F1960F015DEE6DABY1PR11MB8126namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I noticed that after this patch for CVE-2025-32910 was applied, the build f=
ails for libsoup-2.74.2 when building core-image-sato.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The error is:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>../libsoup-2.74.2/tests/auth-test.c:1554:39: error: unknown type name 'S=
oupServerMessage'; did you mean 'SoupServerClass'?</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
and something similar to it. If needed I can share the complete log file.</=
div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This issue does not happen with core-image-minimal, may be because the test=
 suite isn't built there.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
When I revert this CVE patch, the error goes away, and the build works fine=
 again.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Has anyone else seen this?&nbsp; Should I disable the test suite if it's no=
t required ?&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please suggest on how we should fix it.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Praveen</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Steve Sakoman via lists.openembedded.org
 &lt;steve=3Dsakoman.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Saturday, May 24, 2025 7:06 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [OE-core][kirkstone 05/12] libsoup-2.4: Fix CVE-2025-32910<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
From: Vijay Anusuri &lt;vanusuri@mvista.com&gt;<br>
<br>
import patch from debian to fix<br>
&nbsp;CVE-2025-32910<br>
<br>
Upstream-Status: Backport [import from debian <a href=3D"https://salsa.debi=
an.org/gnome-team/libsoup/-/tree/debian/bullseye/debian/patches?ref_type=3D=
heads">
https://salsa.debian.org/gnome-team/libsoup/-/tree/debian/bullseye/debian/p=
atches?ref_type=3Dheads</a><br>
Upstream commit <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit/=
e40df6d48a1cbab56f5d15016cc861a503423cfe">
https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a1cbab56f5d15016cc=
861a503423cfe</a><br>
&amp;<br>
<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a34597a44bd=
58c4759e7d5e23f02c3b556a">https://gitlab.gnome.org/GNOME/libsoup/-/commit/4=
05a8a34597a44bd58c4759e7d5e23f02c3b556a</a><br>
&amp;<br>
<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423=
eb5c3b0b705e5eab34b13832]">https://gitlab.gnome.org/GNOME/libsoup/-/commit/=
ea16eeacb052e423eb5c3b0b705e5eab34b13832]</a><br>
<br>
Reference:<br>
<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417">htt=
ps://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417</a><br>
<a href=3D"https://security-tracker.debian.org/tracker/CVE-2025-32910">http=
s://security-tracker.debian.org/tracker/CVE-2025-32910</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;vanusuri@mvista.com&gt;<br>
Signed-off-by: Steve Sakoman &lt;steve@sakoman.com&gt;<br>
---<br>
&nbsp;.../libsoup-2.4/CVE-2025-32910-1.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 97 ++++++++++++<br>
&nbsp;.../libsoup-2.4/CVE-2025-32910-2.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 148 ++++++++++++++++++<br>
&nbsp;.../libsoup-2.4/CVE-2025-32910-3.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 26 +++<br>
&nbsp;.../libsoup/libsoup-2.4_2.74.2.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +<br>
&nbsp;4 files changed, 274 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-=
32910-1.patch<br>
&nbsp;create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-=
32910-2.patch<br>
&nbsp;create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-=
32910-3.patch<br>
<br>
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch<br>
new file mode 100644<br>
index 0000000000..de4faf5380<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch<br>
@@ -0,0 +1,97 @@<br>
+From: Patrick Griffis &lt;pgriffis@igalia.com&gt;<br>
+Date: Sun, 8 Dec 2024 20:00:35 -0600<br>
+Subject: auth-digest: Handle missing realm in authenticate header<br>
+<br>
+(cherry picked from commit e40df6d48a1cbab56f5d15016cc861a503423cfe)<br>
+<br>
+Upstream-Status: Backport [import from debian <a href=3D"https://salsa.deb=
ian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/patches/CVE-2025-3=
2910-1.patch?ref_type=3Dheads">
https://salsa.debian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/p=
atches/CVE-2025-32910-1.patch?ref_type=3Dheads</a><br>
+Upstream commit <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/e40df6d48a1cbab56f5d15016cc861a503423cfe]">
https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a1cbab56f5d15016cc=
861a503423cfe]</a><br>
+CVE: CVE-2025-32910<br>
+Signed-off-by: Vijay Anusuri &lt;vanusuri@mvista.com&gt;<br>
+---<br>
+ libsoup/soup-auth-digest.c |&nbsp; 3 +++<br>
+ tests/auth-test.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 50 ++++++++++++++++++++++++++++++++++++++++++++++<br>
+ 2 files changed, 53 insertions(+)<br>
+<br>
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c<br>
+index e8ba990..263a15a 100644<br>
+--- a/libsoup/soup-auth-digest.c<br>
++++ b/libsoup/soup-auth-digest.c<br>
+@@ -142,6 +142,9 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *=
msg,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; guint qop_options;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gboolean ok =3D TRUE;<br>
+<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!soup_auth_get_realm (auth=
))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; return FALSE;<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_free (priv-&gt;domain);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_free (priv-&gt;nonce);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_free (priv-&gt;opaque);<br>
+diff --git a/tests/auth-test.c b/tests/auth-test.c<br>
+index 8295ec3..dfc6b09 100644<br>
+--- a/tests/auth-test.c<br>
++++ b/tests/auth-test.c<br>
+@@ -1549,6 +1549,55 @@ do_cancel_after_retry_test (void)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_test_session_abort_u=
nref (session);<br>
+ }<br>
+<br>
++static void<br>
++on_request_read_for_missing_realm (SoupServer&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *server,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupServerMessage =
*msg,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpointer&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; user_data)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupMessageHeaders *response_h=
eaders =3D soup_server_message_get_response_headers (msg);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_message_headers_replace (=
response_headers, &quot;WWW-Authenticate&quot;, &quot;Digest qop=3D\&quot;a=
uth\&quot;&quot;);<br>
++}<br>
++<br>
++static void<br>
++do_missing_realm_test (void)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupSession *session;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupMessage *msg;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupServer *server;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupAuthDomain *digest_auth_do=
main;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gint status;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GUri *uri;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; server =3D soup_test_server_ne=
w (SOUP_TEST_SERVER_IN_THREAD);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_server_add_handler (server, NULL,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; server_callback, NULL, NULL);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uri =3D soup_test_server_get_uri (server, =
&quot;http&quot;, NULL);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; digest_auth_domain =3D soup_auth_domain_di=
gest_new (<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &quot;realm&quot;, &quot;auth-test&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &quot;auth-callback&quot;, server_digest_auth_callback,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; NULL);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_auth_domain_add_path (dig=
est_auth_domain, &quot;/&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_server_add_auth_domain (server, diges=
t_auth_domain);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_object_unref (digest_auth_do=
main);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_signal_connect (server, &quo=
t;request-read&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; G_CALLBACK (on_request_read_for_missing_realm),<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; NULL);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; session =3D soup_test_session_=
new (NULL);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msg =3D soup_message_new_from_=
uri (&quot;GET&quot;, uri);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_signal_connect (msg, &quot;a=
uthenticate&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; G_CALLBACK (on_digest_authenticate),<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; NULL);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D soup_test_session_s=
end_message (session, msg);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_assert_cmpint (status, =3D=
=3D, SOUP_STATUS_UNAUTHORIZED);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_uri_unref (uri);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_test_server_quit_unref (server);<br>
++}<br>
++<br>
+ int<br>
+ main (int argc, char **argv)<br>
+ {<br>
+@@ -1576,6 +1625,7 @@ main (int argc, char **argv)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_test_add_func (&quot;/auth/async-me=
ssage-do-not-use-auth-cache&quot;, do_async_message_do_not_use_auth_cache_t=
est);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_test_add_func (&quot;/auth/authoriz=
ation-header-request&quot;, do_message_has_authorization_header_test);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_test_add_func (&quot;/auth/cancel-a=
fter-retry&quot;, do_cancel_after_retry_test);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_test_add_func (&quot;/auth/m=
issing-realm&quot;, do_missing_realm_test);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D g_test_run ();<br>
+<br>
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch<br>
new file mode 100644<br>
index 0000000000..0d72afa1d6<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch<br>
@@ -0,0 +1,148 @@<br>
+From: Patrick Griffis &lt;pgriffis@igalia.com&gt;<br>
+Date: Thu, 26 Dec 2024 18:18:35 -0600<br>
+Subject: auth-digest: Handle missing nonce<br>
+<br>
+(cherry picked from commit 405a8a34597a44bd58c4759e7d5e23f02c3b556a)<br>
+<br>
+Upstream-Status: Backport [import from debian <a href=3D"https://salsa.deb=
ian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/patches/CVE-2025-3=
2910-2.patch?ref_type=3Dheads">
https://salsa.debian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/p=
atches/CVE-2025-32910-2.patch?ref_type=3Dheads</a><br>
+Upstream commit <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/405a8a34597a44bd58c4759e7d5e23f02c3b556a]">
https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a34597a44bd58c4759e7d5=
e23f02c3b556a]</a><br>
+CVE: CVE-2025-32910<br>
+Signed-off-by: Vijay Anusuri &lt;vanusuri@mvista.com&gt;<br>
+---<br>
+ libsoup/soup-auth-digest.c | 45 +++++++++++++++++++++++++++++++++++------=
----<br>
+ tests/auth-test.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 19 +++++++++++--------<br>
+ 2 files changed, 46 insertions(+), 18 deletions(-)<br>
+<br>
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c<br>
+index 263a15a..393adb6 100644<br>
+--- a/libsoup/soup-auth-digest.c<br>
++++ b/libsoup/soup-auth-digest.c<br>
+@@ -132,6 +132,19 @@ soup_auth_digest_get_qop (SoupAuthDigestQop qop)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return g_string_free (out, FALSE);<br=
>
+ }<br>
+<br>
++static gboolean<br>
++validate_params (SoupAuthDigest *auth_digest)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupAuthDigestPrivate *priv =
=3D soup_auth_digest_get_instance_private (auth_digest);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (priv-&gt;qop || priv-&gt;a=
lgorithm =3D=3D SOUP_AUTH_DIGEST_ALGORITHM_MD5_SESS) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if (!priv-&gt;nonce)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FA=
LSE;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return TRUE;<br>
++}<br>
++<br>
+ static gboolean<br>
+ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GHashTable=
 *auth_params)<br>
+@@ -169,16 +182,21 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage=
 *msg,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (priv-&gt;algorithm =3D=3D -1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ok =3D FALSE;<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stale =3D g_hash_table_lookup (auth_params=
, &quot;stale&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (stale &amp;&amp; !g_ascii_strcasecmp (=
stale, &quot;TRUE&quot;) &amp;&amp; *priv-&gt;hex_urp)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; recompute_hex_a1 (priv);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; g_free (priv-&gt;user);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; priv-&gt;user =3D NULL;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; g_free (priv-&gt;cnonce);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; priv-&gt;cnonce =3D NULL;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; memset (priv-&gt;hex_urp, 0, sizeof (priv-&gt;hex_urp));<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; memset (priv-&gt;hex_a1, 0, sizeof (priv-&gt;hex_a1));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!validate_params (auth_dig=
est))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; ok =3D FALSE;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ok) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; stale =3D g_hash_table_lookup (auth_params, &quot;stale&q=
uot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if (stale &amp;&amp; !g_ascii_strcasecmp (stale, &quot;TR=
UE&quot;) &amp;&amp; *priv-&gt;hex_urp)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recompute=
_hex_a1 (priv);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_free (p=
riv-&gt;user);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; priv-&gt;=
user =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_free (p=
riv-&gt;cnonce);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; priv-&gt;=
cnonce =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset (p=
riv-&gt;hex_urp, 0, sizeof (priv-&gt;hex_urp));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset (p=
riv-&gt;hex_a1, 0, sizeof (priv-&gt;hex_a1));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ok;<br>
+@@ -269,6 +287,8 @@ soup_auth_digest_compute_hex_a1 (const char&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *hex_ur=
p,<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* In MD5-sess, A1 is hex_urp:nonce:cnonce */<br>
+<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; g_assert (nonce &amp;&amp; cnonce);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; checksum =3D g_checksum_new (G_CHECKSUM_MD5);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; g_checksum_update (checksum, (guchar *)hex_urp, strlen (hex_urp)=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; g_checksum_update (checksum, (guchar *)&quot;:&quot;, 1);<br>
+@@ -359,6 +379,8 @@ soup_auth_digest_compute_response (const char&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *method,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (qop) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; char tmp[9];<br>
+<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; g_assert (cnonce);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; g_snprintf (tmp, 9, &quot;%.8x&quot;, nc);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; g_checksum_update (checksum, (guchar *)tmp, strlen (tmp));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; g_checksum_update (checksum, (guchar *)&quot;:&quot;, 1);<br>
+@@ -422,6 +444,9 @@ soup_auth_digest_get_authorization (SoupAuth *auth, So=
upMessage *msg)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_return_val_if_fail (uri !=3D NULL, =
NULL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url =3D soup_uri_to_string (uri, TRUE=
);<br>
+<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_assert (priv-&gt;nonce);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_assert (!priv-&gt;qop || pri=
v-&gt;cnonce);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_auth_digest_compute_response (ms=
g-&gt;method, url, priv-&gt;hex_a1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; priv-&gt;qop, priv-&gt;nonce,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; priv-&gt;cnonce, priv-&gt;nc,<br>
+diff --git a/tests/auth-test.c b/tests/auth-test.c<br>
+index dfc6b09..6fb1e4a 100644<br>
+--- a/tests/auth-test.c<br>
++++ b/tests/auth-test.c<br>
+@@ -1550,16 +1550,17 @@ do_cancel_after_retry_test (void)<br>
+ }<br>
+<br>
+ static void<br>
+-on_request_read_for_missing_realm (SoupServer&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *server,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupServerMessage =
*msg,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpointer&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; user_data)<br>
++on_request_read_for_missing_params (SoupServer&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; *server,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
SoupServerMessage *msg,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
gpointer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; user_d=
ata)<br>
+ {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *auth_header =3D us=
er_data;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupMessageHeaders *respo=
nse_headers =3D soup_server_message_get_response_headers (msg);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_message_headers_replace (=
response_headers, &quot;WWW-Authenticate&quot;, &quot;Digest qop=3D\&quot;a=
uth\&quot;&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_message_headers_replace (=
response_headers, &quot;WWW-Authenticate&quot;, auth_header);<br>
+ }<br>
+<br>
+ static void<br>
+-do_missing_realm_test (void)<br>
++do_missing_params_test (gconstpointer auth_header)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupSession *session;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupMessage *msg;<br>
+@@ -1582,8 +1583,8 @@ do_missing_realm_test (void)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_object_unref (digest_au=
th_domain);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_signal_connect (server,=
 &quot;request-read&quot;,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; G_CALLBACK (on_request_read_for_missing_realm),<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; NULL);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; G_CALLBACK (on_request_read_for_missing_params),<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (gpointer)auth_header);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; session =3D soup_test_ses=
sion_new (NULL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msg =3D soup_message_new_=
from_uri (&quot;GET&quot;, uri);<br>
+@@ -1625,7 +1626,9 @@ main (int argc, char **argv)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_test_add_func (&quot;/auth/async-me=
ssage-do-not-use-auth-cache&quot;, do_async_message_do_not_use_auth_cache_t=
est);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_test_add_func (&quot;/auth/authoriz=
ation-header-request&quot;, do_message_has_authorization_header_test);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_test_add_func (&quot;/auth/cancel-a=
fter-retry&quot;, do_cancel_after_retry_test);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_test_add_func (&quot;/auth/m=
issing-realm&quot;, do_missing_realm_test);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_test_add_data_func (&quot;/a=
uth/missing-params/realm&quot;, &quot;Digest qop=3D\&quot;auth\&quot;&quot;=
, do_missing_params_test);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_test_add_data_func (&quot;/a=
uth/missing-params/nonce&quot;, &quot;Digest realm=3D\&quot;auth-test\&quot=
;, qop=3D\&quot;auth,auth-int\&quot;, opaque=3D\&quot;5ccc069c403ebaf9f0171=
e9517f40e41\&quot;&quot;, do_missing_params_test);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_test_add_data_func (&quot;/a=
uth/missing-params/nonce-md5-sess&quot;, &quot;Digest realm=3D\&quot;auth-t=
est\&quot;, qop=3D\&quot;auth,auth-int\&quot;, opaque=3D\&quot;5ccc069c403e=
baf9f0171e9517f40e41\&quot; algorithm=3D\&quot;MD5-sess\&quot;&quot;, do_mi=
ssing_params_test);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D g_test_run ();<br>
+<br>
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch<br>
new file mode 100644<br>
index 0000000000..ab0f650804<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch<br>
@@ -0,0 +1,26 @@<br>
+From: Patrick Griffis &lt;pgriffis@igalia.com&gt;<br>
+Date: Fri, 27 Dec 2024 13:52:52 -0600<br>
+Subject: auth-digest: Fix leak<br>
+<br>
+(cherry picked from commit ea16eeacb052e423eb5c3b0b705e5eab34b13832)<br>
+<br>
+Upstream-Status: Backport [import from debian <a href=3D"https://salsa.deb=
ian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/patches/CVE-2025-3=
2910-3.patch?ref_type=3Dheads">
https://salsa.debian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/p=
atches/CVE-2025-32910-3.patch?ref_type=3Dheads</a><br>
+Upstream commit <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/ea16eeacb052e423eb5c3b0b705e5eab34b13832]">
https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705=
e5eab34b13832]</a><br>
+CVE: CVE-2025-32910<br>
+Signed-off-by: Vijay Anusuri &lt;vanusuri@mvista.com&gt;<br>
+---<br>
+ libsoup/soup-auth-digest.c | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c<br>
+index 393adb6..a1db188 100644<br>
+--- a/libsoup/soup-auth-digest.c<br>
++++ b/libsoup/soup-auth-digest.c<br>
+@@ -66,6 +66,7 @@ soup_auth_digest_finalize (GObject *object)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_free (priv-&gt;nonce);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_free (priv-&gt;domain);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_free (priv-&gt;cnonce);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_free (priv-&gt;opaque);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset (priv-&gt;hex_urp, 0, sizeof (=
priv-&gt;hex_urp));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset (priv-&gt;hex_a1, 0, sizeof (p=
riv-&gt;hex_a1));<br>
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/reci=
pes-support/libsoup/libsoup-2.4_2.74.2.bb<br>
index f04d9b2966..517a8e4539 100644<br>
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb<br>
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb<br>
@@ -23,6 +23,9 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/libsoup/${SHRT_VER}/lib=
soup-${PV}.tar.xz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-32906-2.patch">file://CVE-2025-32906-2.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-32909.patch">file://CVE-2025-32909.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-46420.patch">file://CVE-2025-46420.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2025-32910-1.patch">file://CVE-2025-32910-1.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2025-32910-2.patch">file://CVE-2025-32910-2.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2025-32910-3.patch">file://CVE-2025-32910-3.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;f0a427656e5fe19e1df71c107e88dfa1b2e673c2=
5c547b7823b6018b40d01159&quot;<br>
<br>
--<br>
2.43.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BY1PR11MB812646004A79B1F1960F015DEE6DABY1PR11MB8126namp_--

