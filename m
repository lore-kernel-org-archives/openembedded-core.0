Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8D6EFCBC4
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 06:44:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44825.1773643447994538571
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 23:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iupz5fpN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7535dcf6df=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G5cYPP3187598
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 23:44:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=yytvJAMp05rs5qMYEX/P+2JJQ6Cddc6Dsirs35tBX94=; b=iupz5fpNJLLx
	V1rQU0Y1GNlRxwahZ/AtpXBYwmoK1FT02ZLS6Np3xZYWY7LNxaO+IJurV2D44m3w
	hQ3cJPu5n9zdiE8wbbun4GlBSeASL7zQ0tq3SI2QMvGJZsb2LAt1cFtWAX/xEh9a
	AAqZ1UlZcvTSSwG58wq47HXn8LeyGBvxRS2PRtWzKZks2UfLC5sObP0CvJT8hEv/
	G3FjRIq2qkkgQYh2ktjRmbib3Ikk712rIs5vgtaqjxTAtkiisltXdN1PtiEpqvTY
	g4AgLZqoFwVUxMlN+NfqFg3kJksbNLMsN6wFaAzZeGq+H68CEhkmYW5R0TS8wdFN
	fhE85jvnoQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76dsb5u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 23:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GT/rJyLvm/V2NH0f5zKAg5xiTzZ/P+pWwLW5BSXDV+j5T8MNJoNgnUU+jG7nI1y5bGW6t+u7ftlPx7kKYmp4eZGP6vLPYhp9bMLvoXetD1CqXEfkvSAfE5TpCtXd5+m9fyscqUcEU3iR5QG32HSyij4Th6tl5IzVSRFCAnouZpwqt+pyWKh7goD89fnqR+YnUazb1zWIF75mbqGgglXrC0cw7dPDAPOWtsQUE1cjZ8FwhtNqay/qizBOhuWkoatCRkBFcq2b0xkZ9n2mq/49/GZOkcIu6bTIT2xF0tsx/e2rXl/gA47yAaBCj44NtZQy+4M4SVmcFEWzAPDZE3f2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yytvJAMp05rs5qMYEX/P+2JJQ6Cddc6Dsirs35tBX94=;
 b=UV48wdc+LxoPxYj6R+i6NoegNkBFVuXdO4suGhTlzm9DblPXrg/XNGJg6G1ITq9Rkg8auAZL24W6yup26/jEhZSAgjpZlnkm8OhgCbWN0lRRbP2gaBAGeQjWSz6b92GPqX0iWCMTyfSQAaRiMv0Ex3jNuzbnqfHDW9FFbesveI5lgZwlGwhZ1/k0vGR+lu7z59HyMfL6siwzUAPaA1qMhIWIVW2NkE5hdcVIh1ZvHsCgyNA8bvlgFz6hr+PHMwOmGn1Ty2X3vrr/+Xpu56Yrryyv5vyf4yJ79tMdrDno+oGMhZjqPZBTm9eeLK2QHyUZy4WSe4cwVEFlGxrUU1gAuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 06:44:05 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::e716:bbea:7a00:2c30]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::e716:bbea:7a00:2c30%4]) with mapi id 15.20.9700.010; Mon, 16 Mar 2026
 06:44:05 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
Thread-Topic: [OE-core] [PATCH] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
Thread-Index: AQHcr5PWQNQWQ0Mg006jBGVPmG8eALWwwRbw
Date: Mon, 16 Mar 2026 06:44:04 +0000
Message-ID: 
 <IA4PR11MB942098DC2791FB16B1EC7F22B840A@IA4PR11MB9420.namprd11.prod.outlook.com>
References: <189B1AAB1A82DEE0.1236027@lists.openembedded.org>
In-Reply-To: <189B1AAB1A82DEE0.1236027@lists.openembedded.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=c7d91289-ef4e-43f7-8047-8be46028271f;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-03-16T06:42:55Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|PH8PR11MB9534:EE_
x-ms-office365-filtering-correlation-id: 01fa7db6-ff36-4590-3345-08de83276ab8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|18002099003|56012099003|7053199007;
x-microsoft-antispam-message-info: 
 gWkUoXCv99MsMpdQdnvO+tbrpyU5wO10snQMrZbwBVov945/RWW5o5YqM5L70Y1sQs+txFTLkquyExObfJaLKo8BeTx7ilcyTlyoeUKgSutpxY4N4+fdcqduoLYG3u7i+VR9VRUFx+v592tmMul0RKg9BjTnFpuRKBUixOoLQE/cb3Liu+g891C7OAiBG5HWy9UBid9G1sxeOPrlx5R9QJmL5cJvs1PrLUoB0IZnekLn823rgdqHXFlX7cZ7kPo/wbgyuvslIn83Nf7E3HkoMfpkfNb8V9T4tTm+4DIWLnm86bb7i2Qz2e96lVjyrVBa4uQhC0qslpCZgC7H2KlsCo4x1DEIOtddrZDcEQXKZ7w6qx5sjtOEqeEgPwtO2zuVe8RJiVOo+0Zyk/lF8pSiVmBoe3VjaMcQfOUAV17gHha9YA44LU5kR6ylmoO3CPIcI3ApDWWtwi3gcqvkvcE4bWuVC6lMyX22EhMEw6XV5wlOPYpJzMhFJ7dH74mxcOYh5UgFS/jYG4QmLGaGTos/f362fyxXYUim49eKynSYOMQiI5JQApYy4rKs1z3cfnoS2jwCs0ivJMxNuA5b6Dq/4/k85sHbATZcCiTxiRxMf9EpM+uISGDsKj7tN3RqfwIDVa/9RLnkaEJRFyEvhNs/BAmTiRAF6feQ72PSdbTj5Kp5KL2jM67M7d4q8LD5dMeW4OXhABZJCqSD9Wwrhbsy3mgCW54/y6WgTdBu99rDH+phgJA/miVVpmR6bp+yovmy4K3t5SRYhIpIWmJIa6Bm9HeaLfxgouYs5V10vaBWVSc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ZS2Tuft8q3aED4kSI09yyxRF0PrTfhpEk47VofYKUDsXcdF7qTH9oo8in9QQ?=
 =?us-ascii?Q?RbN1H7J6lqCXoo5ntQaBBVfLcb6OK2Bb7aJlEi7gJKAz9OZiazqu7DdFZVE5?=
 =?us-ascii?Q?UWZU7aGkv/au6KmoGXgsBDMbU60Ki+yfM1/rCYiTEY/f93AOXI0jO1N3a78w?=
 =?us-ascii?Q?TaseG9yN8JSPvI7QvQeIpiEgnlhCZKIxixua8vGRCZ4F31fUYa5kv/BDk3F7?=
 =?us-ascii?Q?7N5RI8C/UArxBL3Ey3k7ph9xZRhqFFxvaoUgoug+o0Xs8BSEWlX/NfuHU/Sw?=
 =?us-ascii?Q?pyyPR1eoqkChAungdOEQUWRx8k6iqeSrY7f78aViaLIOBqBfcGyjr0MpB60z?=
 =?us-ascii?Q?G19j5vH5rF4Yy14k3SdU2aIFx3ALtP/mJdwxCw/DQxFLgwLhnPbTjKaULJng?=
 =?us-ascii?Q?MXK53dYUmqzdeOgeEnionRyn7mxgqII6zpf29VhUss4HgindI82J0zRFlhw7?=
 =?us-ascii?Q?ucRiqHaVaYlIhtPZ4iDVvkIdU+wKNvgVuxoa68FGsNoRrP4XUwW3YePjGFAe?=
 =?us-ascii?Q?8TXDLfDcajUof60H3KNwe1HQYpgGk006zKhvXXYHwDRoSPsOxW2aubVWSpSC?=
 =?us-ascii?Q?yCK+YSIyDQG+aiVzRhU58daF4U9jVv0h8CZTBFXFrc3JZvML2cO+3E/0dSdS?=
 =?us-ascii?Q?C8MTGMc0jV90zzCGzucso9ZqbM0KncvtXo2S637+w10JFnVLldioyVsjEak9?=
 =?us-ascii?Q?SJw+KDgunhJcY1AbPXE5uUbbehrAwPf3PHFqEqaqdoAo32DifU7L5BuWgUJz?=
 =?us-ascii?Q?GnWATm5WsaPf4SeCLsQ3A3drlDcU+bc9WLXKcFYpxAMGRdszVHK1/07Olcw/?=
 =?us-ascii?Q?XjFS3GNDgMZOANJTQmBhHCP4O5hPHgCQTTf7w0LrJ7eDpwFVHrrQzsW7Vequ?=
 =?us-ascii?Q?91GIpLYCvf6rYoofNEOb1NkyAR1hqq90/n5st+WAvz8iGUiNnazNjaWLxT1S?=
 =?us-ascii?Q?ge1gWqCO5kNK7UyGDQQpQ+Hchnku0jNNngfV1j/dK0VbTMThCPSejXurI/uS?=
 =?us-ascii?Q?9GR9ciirLtBSUiY0JudnxwPP+R5lMlOj57RMI112D4HCs+2iUn5/p/cVY9uc?=
 =?us-ascii?Q?2DIUxdJf69FB0C9NBkI67IJ3evjB59G7CL5Zap+2Shooppr4sxvrrXz/7Nht?=
 =?us-ascii?Q?mjnlil/HKu910Bmmn1oGqROLHqhb1msIYr66TDIaJ2JQ/snZoJTVHKhck5+8?=
 =?us-ascii?Q?QB1gQzAKU8YgUmT3hvLN/T6P9k52krvJv1L1IOM1p0JC4Z2/qHXIfAXo+rh3?=
 =?us-ascii?Q?f4/axHxba027PDB2nkoqSCeoWMhwyGJWj5PT7MK0zpGxE2Hfor6yJHfKJ/vW?=
 =?us-ascii?Q?b2NkSMEXwZIGND9DEJBMe/c4NzKoswvTZ1haeLYEQHQgDzziXbaIlKYiNwy5?=
 =?us-ascii?Q?wBvnN5ngRf9wLGXd+KwZvcPxHtjUM/DOCP4ycEkyL1dhNKS1vNa6PhyxjQPK?=
 =?us-ascii?Q?+GdyFioOjXkC7dfhga5Bat1vgptntEfYMGaSPgrT8Kd1EMNSiaV9ofJ7Qwqd?=
 =?us-ascii?Q?3tSC/wrH/bGDL5NZ+3GVWQkdY9YAzkR5jISf0w+RgwViXXHoDnWYnFii5n7f?=
 =?us-ascii?Q?srm3cqB9KHEGodQHHrHzZHg1KHFnAhjxIQhlc+u6Bl017gEcxgx9/yWmX69X?=
 =?us-ascii?Q?HyleD3b2qq9/cQAjXxgG+6ackFkjrw0Cg6oy1XvTrsQC6/M1qvjbGeej6p+8?=
 =?us-ascii?Q?fAMcX0zYqO8S2GVHg90kxVvyv11SQVGA3O0X1SZu2A/cdasHqv58q/W0jL6Y?=
 =?us-ascii?Q?Gtrvbxj3wA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	CKcsTnJKGOroD6kJGRz4YVXU73v2ZyY9w/B3nnNymDxf0JYzDiwKCqGTqXB37pFDFzxM9q3/eYnipMDsZr2OypFJPX/26J69HY6JLVImS1ZsRQgnlqCKQbP+o0PAuaO4c1borI4jTDx8ED26rq8cYiepIfL+HQIWC2s3lh4n/uag69k6L3a4zER5NlC2j0Xd6Sp6GNpxpPWciS5e0HlZRROCNTXqd0SnUyx+TUMKOYhQbyfXa4GnWZgDTFBSFiwLmHWGn0R8HUKDwU9HXNsuDoZrgAAC76CGvNeogSVXQs40jj0h395nO3iKDMpvkSiF7PXD+feu4aBAf40Q6/FrWQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fa7db6-ff36-4590-3345-08de83276ab8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 06:44:04.8332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YxH5HC4/QS04mCtFKvuAGL6WDXBZEI+9e0TLk1U+Zk7FSpH8PARE6unKCXibsGfwUUe/E2q58rzzqKYC2JbU8REBaUW1sfs5qxfDB0g9FRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9534
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b7a6b7 cx=c_pps
 a=wUQTFLLo3/oASVCpA6ZfNQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=nQYV5XC8AAAA:20 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=ao83s6u6bLxKcUkD2-4A:9 a=CjuIK1q_8ugA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA0OCBTYWx0ZWRfXyJQYj+YrZxwO
 piETNK8dBvbyExXx40pM6r8z7jxWNuZCDSWlkzR/01c23dB+xCvxDZO5u+UDIEXjEVa3B1/Jxy4
 1ZpbSj8Q2qWXzW7YZLiYsl1ki2L6HRNImGCVvFobJgI6nT8Uni1HzZOzXA5Tw6lXmQwW6klB6BD
 UTouf9UVebko8wLVG+aliFkud/yI5snNbSQPjSZ7Z65dlym9X5lg/pPFJoHDaL7ZH2MLGHlA8ra
 YgYEM9PtbVvqSmAaHlFMlE7bflP4HVvkoa8Xxzju7e2TjN0zNlki2wBMBCkpRJdcYrp9/uUWqSi
 8gekxSPv9xj1TE7kz3cV0/FsvFilHWcQZMPcA49prQ1Vz4H+GoLYLvxSnax4vNjjgtSd5btPdV/
 I+UqD4X6QbUROTAXlsraSAD5xiWTcg9M0+0xmcBFlzw0l4yYqTSCe1aa2aQ30HP4A4vNY2TGXyq
 KGUMz5SfmvniDkoOYbg==
X-Proofpoint-ORIG-GUID: _aIwIPXiqnnpf26_6S2qGsB-ILLRQLeM
X-Proofpoint-GUID: _aIwIPXiqnnpf26_6S2qGsB-ILLRQLeM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 06:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233212

kindly ping

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
Sent: Monday, March 9, 2026 3:10 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changelog:https://github.com/Rogdham/pyzstd/blob/master/CHANGELOG.md

Recipe changes:
- Remove 0001-Remove-setuptools-version-limit-of-74.patch (no longer needed=
)
- Switch from python_setuptools_build_meta to python_hatchling
- Add python3-hatch-vcs-native to DEPENDS
- Add python3-misc to RDEPENDS (provides compression.zstd module)
- Remove obsolete do_configure:append:arm:toolchain-clang (setup.py no long=
er exists)

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...emove-setuptools-version-limit-of-74.patch | 27 -------------------  ..=
.std_0.17.0.bb =3D> python3-pyzstd_0.19.1.bb} | 12 ++++-----
 2 files changed, 5 insertions(+), 34 deletions(-)  delete mode 100644 meta=
/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version-limi=
t-of-74.patch
 rename meta/recipes-devtools/python/{python3-pyzstd_0.17.0.bb =3D> python3=
-pyzstd_0.19.1.bb} (53%)

diff --git a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setupt=
ools-version-limit-of-74.patch b/meta/recipes-devtools/python/python3-pyzst=
d/0001-Remove-setuptools-version-limit-of-74.patch
deleted file mode 100644
index f2910322ff..0000000000
--- a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-ve=
rsion-limit-of-74.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Apr 2025 14:38:31 -0700
-Subject: [PATCH] Remove setuptools version limit of '74'
-
-Upstream sticks to 0.74 since setuptools have dropped msvc9compiler -suppo=
rt beyond that which is needed for python 3.9 on windows. We -do not have t=
his problem on Linux
-
-Upstream-Status: Inappropriate [OE-specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml -index dd885e4..5d4d511 10064=
4
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,6 +1,6 @@
- [build-system]
- # setuptools 64+ support --build-option
- # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9 un=
der Windows --requires =3D ["setuptools>=3D64,<74"]
-+requires =3D ["setuptools>=3D64"]
- backend-path =3D ["build_script"]
- build-backend =3D "pyzstd_pep517"
diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb b/meta/r=
ecipes-devtools/python/python3-pyzstd_0.19.1.bb
similarity index 53%
rename from meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
rename to meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
index af7069b6ed..cda074221d 100644
--- a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
+++ b/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
@@ -9,12 +9,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daedb5a2679cd15=
52fb61c181ef974b9e"
=20
 PYPI_PACKAGE =3D "pyzstd"
=20
-SRC_URI +=3D "file://0001-Remove-setuptools-version-limit-of-74.patch"
-SRC_URI[sha256sum] =3D "d84271f8baa66c419204c1dd115a4dec8b266f8a2921da21b8=
1764fa208c1db6"
+SRC_URI[sha256sum] =3D "36723d3c915b3981de9198d0a2c82b2f5fe3eaa36e4d8d5869=
37830a8afc7d72"
=20
-inherit pypi python_setuptools_build_meta ptest-python-pytest
+inherit pypi python_hatchling ptest-python-pytest
=20
-# clang-16 with -flto segfaults on arm, therefore ignore flto for now
-do_configure:append:arm:toolchain-clang() {
-    sed -i -e "s|'-flto'|''|" ${S}/setup.py
-}
+DEPENDS +=3D "python3-hatch-vcs-native"
+
+RDEPENDS:${PN} +=3D "python3-misc"
--
2.34.1


