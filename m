Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32500C982C4
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 15:24:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17574.1789572251726073572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 08:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=L9jXxlmv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3719b62dd9=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFDYeD2197918
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 15:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=DsQ8/3XApkDgSUgskWOKAtEo9Cs/b7wRTa/pRYapOMo=; b=
	L9jXxlmvSfWLBJ8UnPvq7dCukNcqfoRV9WAZVy8ojRvSS+yKN/n9mJCi0TVqeDwl
	nERyiTCMv1cErREnt2k1SWobxMDvcMQiPDMXaLxcJTTyXU1D5k5MtMOMa4bhUnAB
	OIwn6G3v0PP4J0rmRSxlU9ZwoPd9sLShZB0ewWuV8+4P843ZVW27tnTRnF66jYGM
	F07NMYlNI6wLsfE6qmCkov3LHT4MLFJ6f9iIWdIm+Vh3KWT8obzv3G/oGTu3PB1t
	2q5BS4CZHjXZ418qoxNrsm3kIRHTtiRMCOtl3sJOG47nqpZgFGBK4GB/ZYj4yDIC
	kuZ8Yg9eeV5FS/g2nFdnaQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021128.outbound.protection.outlook.com [52.101.57.128])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gqc1nhmn3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 15:24:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ydA5fH54isweQBXxXg/edGcLFgeRFP3TxVa6C+be2HdpBjPuGjfA6lBzEXkVQf4lWwS2JE+cQeh4vaslfRL7ZlY0YYZ/XzM/aZiK/N8lwKNF3J5kiWWyydMIChXv5Dj946mdE6c85meNlNXkXOs1kkH2sLoPZq925LQpfl2iFn6pcSQp1/5hkX0XcHoTs09cJQUrwM4l+ATW7NeWvIYgsquG1pz7RbIYMy0kLZaTAWgPPsFrn2RviAD9t6Tmg87+cFSUnqQ+lzjSyAviziM4/3XePuDIovkjy0hEdUi3QF//ulwg1VcgOF9lqPd34eHKuKYdrP2TlkmU3ZVM6TM5Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsQ8/3XApkDgSUgskWOKAtEo9Cs/b7wRTa/pRYapOMo=;
 b=TT8DWcf7qcKsivcU3whGNXOiOCe3cNfEAWO4Y5HbWTkqo5vxkh8mzdVQSOOKdM6EZGHb9HA1n3gP6X3rlF5ke7PGOBwkYJzDbm+ZxOQOJ3Ob7pSS2lj6roO3gceG6Xzy3DWmLGWcsQX+H+fBwU/QOvoYNnppUAbjj5NcYbq67nPctmvcRx+/CzUUp6u+VXQOgMWPBf7S+ZdVjbQ5sLMrCWd/NVmgmk5fFtOdl9aZNm608UjKRl0f0idRkP2doZTmkAvTbAR2bJEYF18MstP+0HGrVzo1xFygIHzOXA3QW5g6j2yVtBOSPHhLRByX4nyDhWWpepkOy6QeQa8A1TP2dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SN7PR11MB7091.namprd11.prod.outlook.com (2603:10b6:806:29a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 15:24:02 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 15:24:02 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        Randy.MacLeod@windriver.com, alejandro@enedino.org,
        antonin.godard@bootlin.com, sunilkumar.dora@windriver.com
Subject: [PATCH v2 5/5] rust: sort hygiene data before it is encoded
Date: Wed, 16 Sep 2026 20:53:26 +0530
Message-ID: <20260916152327.1765623-6-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916152327.1765623-1-sunilkumar.dora@windriver.com>
References: <20260916152327.1765623-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SN7PR11MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: 05548890-1acb-400f-297e-08df140689b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|23010399003|1800799024|38350700014|13003099007|6133799003|3023799007|10067099003|25016099003|56012099006|11063799006|22082099003|18002099003|29003799003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	y81cmG33w5z1LrZ8IFx1gvLIu/1S9b5IECmxI6mbOu6z9mlb1cu3GmvH862dMazKEaABAlNvbill13PxnyI/qRRCnMEWTUJpsMCPNKOcVyplubcfxAG4AgeRALHE2aZuz+09P7BTdrEv3grMIB3CYMt7OdZC3PzaKvUmPI0gH8VtTk+W32r+bGIMDPWkRqqV20piWTl0KWnJafnJ4349CUtYffyUxdZSypYeospzLAhNWRdqtB9K12OgL4hNWQdAgsRaEKq93eK+/Xky8V+NaUJaqAzK2VZhFXJoizDIKrwMsBaoIRZ9jK75NfHXi10bbZuWRqoT5i+mrH7H6hucgaYoTHiRCsMh51Tk/D0g8WJeYgo/ZpqTO/YLjBlLqGiUc/ge5L5ozBmlgPkbIcXLzW7ZBUtNlCSBczYokpCt6LhD4CTXdFfU558BuLBsB1YfwqrAELGl0nL58Qrgp6hmyOHb3yLNZzF7Zzj6SYwbagspnfH+E7xU0pi5LfuJALGLyy/ozLShPxpL/J2JwkGki3DpwH1AkBKZawyXEDdGWPTKSextO02czeUIECrr+agGCvVjLZ4s+4RWFsB4OUuxqFFF//p6A9xnrjyQo4Nwt7G4A33dp7pHkoJb5G7qv0GahE4C5Yw2sa8Q4WPqQNDhtynuUC1rAxZlprzmejmAceI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(23010399003)(1800799024)(38350700014)(13003099007)(6133799003)(3023799007)(10067099003)(25016099003)(56012099006)(11063799006)(22082099003)(18002099003)(29003799003)(12006099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YFRy+Uhy88kVrqoJ2Sgr4Z1NaPvxAwA5MZGeVvw86snl/ajhuUf/Y3aPBFCB?=
 =?us-ascii?Q?p8k+ioxvG0E8KDgnqzesG3X3uAHpDpTWYm6r5iQlde/PHkXvhW2z4ZgIvPMg?=
 =?us-ascii?Q?bIoLPBUDhTvixfiUsIbE+5Hff7jkt/ExglMl3XNu2iLnJwet8daJ8hi2uv/h?=
 =?us-ascii?Q?2yOLiCu4AHxejZj8M+9kWJ8tazRG3qtY7PQx5CH/MyC+NoXoOHM/2Ltvpk0V?=
 =?us-ascii?Q?uaX9EjBbc6mVs9JSM9mUqV3WiGtchbkAtZj6GONUaabUcjYwqZCI/DNo0c9x?=
 =?us-ascii?Q?Cl3qkmX/ZsOW12XOlNy5o3qMjpJpMTn+0wdeZ9b7dwAjTgP45pzTbLNv91XW?=
 =?us-ascii?Q?pgfP+BCntV4AFcVSMu6QBFTJdRExpPzw4t+dx2M5LJbtxf4R1XYirRmqJ7i/?=
 =?us-ascii?Q?UouebbBu+m/oKtmU4T2JI/gaF+QNOOXPHAesvwGRhMbRGjfp0EJzTTU+tbXI?=
 =?us-ascii?Q?sok1SGVxpF/jGnd9uY+3zhNhDe5ZDU9b/pvVZWg4o9lfvy7jd00/EAMFciLv?=
 =?us-ascii?Q?pn7ZK6BklrGCabh2bGCd7+apDJvjpyTyF8SBwHHlW7mcqbs6mPlUwW3EtFzl?=
 =?us-ascii?Q?wSHep6I/b1HJv7cfACuMAB02M9+sz6nGnhF20SexQfDyJEDwoXG8h7BOh4t2?=
 =?us-ascii?Q?6+po3BuYtkV1hc3KHBs9N3gyqj9nr2bGOWDJ582p3vjUyKWpBqEuNeCEFajX?=
 =?us-ascii?Q?9LM7Ef5VKfncaTUZaD2FLPsqw66SkIrPbfhlK0Fl+8CiXrcltQvn0Q6HeBYS?=
 =?us-ascii?Q?pShFwhPMlQl1KGmsgMJPTFw1avujkiHwoDZEMpOa0EBKhIwqMdS9DVM9q+4m?=
 =?us-ascii?Q?xBb6UDxbsrdx7ojKGwfXHDEO1t/7zVo2jhkcZN9KuBati6O3FtDY46wLcAEK?=
 =?us-ascii?Q?nSPPKjlj9NYCRFF0izrRrcROc89SXu9uh5loE3n2nKrcI5rfy3+7Ppbah//y?=
 =?us-ascii?Q?ZRmPL9qCkcxLY57BVEx6PAiLW+qmTmhTMVRFnAc7J6PChgnUMCKhyxoSQ4OU?=
 =?us-ascii?Q?QD7zF79Znl7By6203FEyHoJo8cSYNBijq8PfPtBspr3qDQBUzq+vQRKTJD2Z?=
 =?us-ascii?Q?m4XobftSMigtGNfYUirdi/TPpwDS/NeKEzBa8gAkwX0fh5TR6v/2qRhlNRpV?=
 =?us-ascii?Q?ALuMoDKuH0k3kXUB5RfXFmDxJBlwj6LPTe3SMv3Dn++ZJ/oHqOlEovAWfW9l?=
 =?us-ascii?Q?/Yaz4LMR6kJSHvM5Cu/HSXm+iPkEpTJg70it3K8yElHQ1E6fUQ+BTMjJVND0?=
 =?us-ascii?Q?Zk9cEUI2oCxHKt0YEsUPqaeC5s80PAaczv9hd216ZiXDsnIxn9mAwCoyXCKk?=
 =?us-ascii?Q?9bvLAYluUq954vz+EUH6VH3H9x5PIAE3medNMbVVJWnQRZK4fQG827eFGxds?=
 =?us-ascii?Q?BFpFGVt33nvvirS+h813V5w/Ceghh7btpUJAUuzXr/WHbR+LywV8nLH1Swjw?=
 =?us-ascii?Q?s4fXLqt496vrwj0wrgCrblzV8aAlRQequogFRxYCv3PyNR8ksbwkV1wr/yNg?=
 =?us-ascii?Q?9DYUwCvqzf3fUPVS8Kz19AKGtsy5/H/gbqar37qB3FlI7jXUiY3G2iJz1Sa3?=
 =?us-ascii?Q?/CDJ4msvWKyVisEnBbTbCvDdtOmPpLyDtA0ZjrrIapqALkUMlbJHbKGoWJ+f?=
 =?us-ascii?Q?2rJiZJ8sU2O4xkLjo9MbT6JXr1S8JXwIs2nq9Cu7xI9bqcm3NAil6FQ/zhPz?=
 =?us-ascii?Q?KgdnUO1bUVRUnIW5obzeTz/Ya5V/Vsb4YhdZiiv6TTsIpRL08VL0b0rwYoAj?=
 =?us-ascii?Q?vQ1kPb5eEV92/DhAWLG0fBiGt4yDqjk=3D?=
X-Exchange-RoutingPolicyChecked: 
	asaq8RPij+9nlxKPsVP0g2eu3ZggnnGZXvZMOVIqP0hWRVWPF+ksULVEfuegvwsignAIuc2F6irCRzs4mwFdJMSDr0eeCLlvQB2VKZzaqhCtgo57sCgm8wew5Om5Kv0BgwvLi46DRnvERF4rhVVKIYZdRiSHcpWAbpdXj0NTDHj/jgfmNv8FoLrWFS7djULGIffkk54RhIQDok3SFoy6FEkYnQDdb10zzjAfdJKOV1uU5HDNxLPWesasQnQoIsMCwJD0L9waKP5mXQ0lcbmzEiKXcirxyd1XEGO9emjq65SDjjqiwW1hM39/fxW75s/NFabQiThZMLSJObFNNwwHYg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05548890-1acb-400f-297e-08df140689b3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:24:02.4023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0+71klPuBFHVzTB9LuiWfaA6d2Cwa7HZ9Ez9lfK0F1U6+8ayy/pb+kzwgv26kx3vyoMcYg+x+VHG0BynCIl+4Lu0VSkLQVZJ8pTszJWbsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7091
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: s4OAHo-IFkt-6nAUpM-fWX0uNdKkW34P
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwOSBTYWx0ZWRfX+Vw6TqPpXo8H
 mWeCt9+2sJ7VZ3VEvHTzXiRpVm+tZcJc1E04gI/83WuZqxcQm9WRSBoFAf6dqm9qISYb1NNERmc
 /zVoJKPWmetC6kP8sIxGNdVg612iSNyWsrprn8swUlsvUcv5AR7E
X-Authority-Analysis: v=2.4 cv=L+GI0OT8 c=1 sm=1 tr=0 ts=6aaab49a cx=c_pps
 a=EDQZ7307M/d1MXNVkApkJA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=zjtiufAZAAAA:8
 a=m9gQ31FgLECOTNHg3yQA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=8zIOOLb7Ym0NljyPXbuS:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=2tRhtM0yMehlNRDZlsEQ:22
X-Proofpoint-GUID: qiRTqjMH8L3g-8Qzfpjq_-nbsijqSYGi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwOSBTYWx0ZWRfXyq/HdzMHINNo
 z7Y0wztdBxA8hoKh+pBBiztBbndTwpOvaa9ETnv8qaOeGEikwBFdfVnBrQNn5a8kGPxmZa+rytX
 crP4Eeh11OxD41aDtHhe11KTGBkIOrZDGB8pdAKFCHo4r0JXW0EkGChdqvV67YbRT7G917nA5oX
 hbeIAq0ayLwJ+j720p4CuVVuSTCfrBWLtiQS0HN8bKFp2gRoSixd2AO86llHkNguEJLuvXZkP+z
 ofAESLvEilq+jO1B2T/LZ0GGy7OS7fssQEJHI/2pKM9OaKrhmhaqXl0eeWdv19m1Fz0uHqrs9nH
 aGIiu3T3zbjkSp6t9a05TdX+y+ebnLXCM/6qEXe/WM28N+cPFrabEhf/J2y3YqAddj6qehft4fd
 G/cwevzWWoXnxck921AI8DvWzu4r0OHwNvpDQMVnQvvrpcqgwdYDoSowNixW+sPJMJYTlqPBJBJ
 ZPppiT/pQYleGpbLXqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160209
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 15:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245986

From: Sunil Dora <sunilkumar.dora@windriver.com>

HygieneEncodeContext::encode walks a hash set while it writes the syntax
context and expansion records into the rmeta, so the byte order of the
records follows the iteration order of the set and differs between
builds on the arm workers. The added patch sorts both sets before they
are written.

Upstream tracks this as rust-lang/rust issue 129094 [1] and has fixed
it differently in pull request 161450 [2], merged after 1.99 branched.
That change is too big to backport to 1.98 safely, so carry this small
sort until a rust upgrade contains it.

[1] https://github.com/rust-lang/rust/issues/129094
[2] https://github.com/rust-lang/rust/pull/161450

[YOCTO #16376]

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
v2: added Alejandro's Signed-off-by, dropped the link paragraph;
upstream references now footnote links (PR 161450 merged meanwhile,
noted why it is not backported here). No code change.

 ...hygiene-encoding-order-deterministic.patch | 59 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch

diff --git a/meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch b/meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch
new file mode 100644
index 0000000000..47a713f82e
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch
@@ -0,0 +1,59 @@
+From 9c190d14f93bf27c7f1c94d400cda6f48f285a34 Mon Sep 17 00:00:00 2001
+From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
+Date: Tue, 15 Sep 2026 17:05:36 +0530
+Subject: [PATCH] rust: sort syntax contexts and expansions before encoding
+
+HygieneEncodeContext encodes the pending syntax contexts and expansions in
+hash-map order, so the encoded rmeta depends on the build host. Sort both
+before encoding. Upstream has fixed the same problem with a different
+approach in https://github.com/rust-lang/rust/pull/161450, merged after
+rust 1.99 branched, so this stays a local fix rather than a backport
+until a rust upgrade contains it.
+
+Patch by Alejandro Enedino Hernandez Samaniego, from his strict-version-hash
+v5 series for openembedded-core:
+https://lists.openembedded.org/g/openembedded-core/topic/120939810
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ compiler/rustc_span/src/hygiene.rs | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/compiler/rustc_span/src/hygiene.rs b/compiler/rustc_span/src/hygiene.rs
+index 1c74205..a464eca 100644
+--- a/compiler/rustc_span/src/hygiene.rs
++++ b/compiler/rustc_span/src/hygiene.rs
+@@ -1313,12 +1313,12 @@ impl HygieneEncodeContext {
+ 
+             // Consume the current round of syntax contexts.
+             // Drop the lock() temporary early.
+-            // It's fine to iterate over a HashMap, because the serialization of the table
+-            // that we insert data into doesn't depend on insertion order.
+             #[allow(rustc::potential_query_instability)]
+-            let latest_ctxts = { mem::take(&mut *self.latest_ctxts.lock()) }.into_iter();
++            let mut latest_ctxts: Vec<_> = { mem::take(&mut *self.latest_ctxts.lock()) }.into_iter().collect();
++            latest_ctxts.sort_by_key(|ctxt| ctxt.0);
+             let all_ctxt_data: Vec<_> = HygieneData::with(|data| {
+                 latest_ctxts
++                    .into_iter()
+                     .map(|ctxt| (ctxt, data.syntax_context_data[ctxt.0 as usize].key()))
+                     .collect()
+             });
+@@ -1330,9 +1330,11 @@ impl HygieneEncodeContext {
+ 
+             // Same as above, but for expansions instead of syntax contexts.
+             #[allow(rustc::potential_query_instability)]
+-            let latest_expns = { mem::take(&mut *self.latest_expns.lock()) }.into_iter();
++            let mut latest_expns: Vec<_> = { mem::take(&mut *self.latest_expns.lock()) }.into_iter().collect();
++            latest_expns.sort_by_key(|expn| (expn.krate, expn.local_id));
+             let all_expn_data: Vec<_> = HygieneData::with(|data| {
+                 latest_expns
++                    .into_iter()
+                     .map(|expn| (expn, data.expn_data(expn).clone(), data.expn_hash(expn)))
+                     .collect()
+             });
+-- 
+2.43.0
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index a50a3fd001..562f4afb65 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -11,6 +11,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch;patchdir=${RUSTSRC} \
             file://0007-cargo-omit-host-triple-from-unit-metadata-hash.patch;patchdir=${RUSTSRC} \
             file://0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch;patchdir=${RUSTSRC} \
+            file://0009-rustc-span-make-hygiene-encoding-order-deterministic.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "be1816e7f6c40abb90245ad6e024bed2a7e88d7dda4561e4d5470207df616b9f"
 
-- 
2.43.0


