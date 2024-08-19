Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAA0C5321E
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 11:14:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.207973.1724066081702502695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 04:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8961a927c4=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JB7b6S015396
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 04:14:41 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412q541h8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 04:14:41 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47JBEeaW026373;
	Mon, 19 Aug 2024 04:14:40 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412q541h8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 04:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Im7IfkcTZ9ZIkw4h2vFvVWeS0msLuEN2Wx3m66ewSfSYTVwcz/L2uI332OZwNXA9blWoUErcmt+vf7ELF8VLs8/pMURxhZgR2OFRn+svkyyIigAWPnML2CL8jzzgqE9jAcrZnG8YfXY+P/IOL6F53wUw6oKj1PIqcQkN4JR1hMjK5FcbhMPGjD86kgWx6KSIeBcDwuI3HucmUDpS692ScUjZmrEbJr8bT+coIiHUdb+v9wp0U7ixdKCvVJJBxnemM6T0r5ThosqszaQHtXIXJ6d9D24TK2yPK31vox4FkE5UFujE/i1qMQHOUD759lvldOOGl84vCXj6bl3Wq7mwyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cwAPjzxG2ORfLUuFIqx+Q2VBLXRpbfmKpfQb/aAIXA=;
 b=KmnfUcS95ikX/7DyIn8DD5aQMAimyVyTZ6Mhhigj//95h3uFx727vWAAw7X/DqPq3uKvAOTaqqKHUSxJV3zk6apP8W0mlFiuT6mkz47/eGoy2Z/DuToiwCAe6h5P8JQq1hK5WxlfX1+jyKFAQKRNNlqUBoURpv0JU7RzHKoEuCQWoS+Lpnnl9mRX6W1GwX3iPdZIgM6VN7dO2nNblNz1eu2+MHXFdSOg7gN9pBWofdgv3j01OlF167J7RGIUFHvKvL5hyIGoza6CpqVpn9xZtT8p2e+BoHEbY+4aNTT/LZOaQKIRX6N1n1oaf8/7W3qBPoBaoiRNPiO1I7fDwHus6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7320.namprd11.prod.outlook.com (2603:10b6:208:424::14)
 by SA2PR11MB4826.namprd11.prod.outlook.com (2603:10b6:806:11c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 11:14:36 +0000
Received: from IA1PR11MB7320.namprd11.prod.outlook.com
 ([fe80::5547:934e:1997:835c]) by IA1PR11MB7320.namprd11.prod.outlook.com
 ([fe80::5547:934e:1997:835c%7]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 11:14:36 +0000
From: "Varatharajan, Deepesh" <Deepesh.Varatharajan@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>,
        "Gowda, Naveen" <Naveen.Gowda@windriver.com>,
        "Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>,
        "Kokkonda,
 Sundeep" <Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [scarthgap][PATCH] rust: rustdoc reproducibility issue
 fix
Thread-Topic: [OE-core] [scarthgap][PATCH] rust: rustdoc reproducibility issue
 fix
Thread-Index: AQHa8hzH0GU5U5o5L0i+FGXKsUXbZLIuaAWAgAAAsCGAAAMDAIAAAaSc
Date: Mon, 19 Aug 2024 11:14:36 +0000
Message-ID: 
 <IA1PR11MB73208F20FD47C2F6B27F39D2908C2@IA1PR11MB7320.namprd11.prod.outlook.com>
References: <20240819094701.27210-1-Deepesh.Varatharajan@windriver.com>
 <CANNYZj9MxBgY-v=vDyhqMn_euNAtT7Am1EJN9Xc4s_7t=jD8qQ@mail.gmail.com>
 <IA1PR11MB73203EA21C1DC3257EE94C80908C2@IA1PR11MB7320.namprd11.prod.outlook.com>
 <CANNYZj9yDyd984X8rD7VuxsvUezLXMJq35hAN_b=Lqq8q7eggA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9yDyd984X8rD7VuxsvUezLXMJq35hAN_b=Lqq8q7eggA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7320:EE_|SA2PR11MB4826:EE_
x-ms-office365-filtering-correlation-id: 226134c1-e874-4a88-5fe8-08dcc0401c67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Rq/onyGiZl6y4xT8PopCTI73Pm1+26Vz107A31YKC0UYnzMnxCE9JJa3N/TQ?=
 =?us-ascii?Q?g3C3fjMhbwc9tIK2twhiYy/N7NBwIW5HAhtaGpfzRTgUGRAv8Uksr9cdJkBw?=
 =?us-ascii?Q?JtgbKhhMAa7Nc2glJ0OzikPHicxVhxq8fEk11DSuj88BABKOjEWOdVKL1oZE?=
 =?us-ascii?Q?FSkKOBXlL2XBdso9ZVGnPQrmXtV7NOJTeE0xC8dUfUygX3a3/cEFZ6GD1iVd?=
 =?us-ascii?Q?falEnAiBRbWTIRSja/hBxWYGTKlvf4/eEfNJlmzdJoAgOxZ8XpOHMIa7/nCV?=
 =?us-ascii?Q?vrquG6e3XJtuEVfnFAMSPnGLyFoiMlBdJ2NtCno1PBDi4NR+lO/MywlrCUiM?=
 =?us-ascii?Q?kQWKSTQGGJgtUALOaV26bgwCSQnLROisLLtSf9zp4PGm0LMZImB0gJh6bcJ9?=
 =?us-ascii?Q?f7oyHIjPcqKsbTVcG3aDrNI7kSP9somGFonXkyt/VopRQe9HlNY0SdlD0Uro?=
 =?us-ascii?Q?LE1BmSxyiq38Wfhe8sQ1pCXNQesrTkqeXY+ZbYY8eGtknCYbIHJ4BQoXwK3c?=
 =?us-ascii?Q?iKTYOckj/7BbFyfEzoOMjk9HhcGSrQZXGK9ifHu2NezQFtxAAJjI82RT5No9?=
 =?us-ascii?Q?mDDqjCbR3G2U0d6M1ksEOVJByAbfK46u4Fr+dY5AFjCwiBoNwAMYkeji4QOq?=
 =?us-ascii?Q?v3t5oI6f0ZFO+9CQLIfgGb+UyTegeD0Tmry20J90coY3h9tHgTTTMbKn+l+6?=
 =?us-ascii?Q?7OC7YnCQ6vuV4vB5b44T8C7pVB0GKwuHPzWjo7sc4UjtbIbg6/9vXyEhZlT6?=
 =?us-ascii?Q?kaXHvWxr/zi41WlsQNkwLdn2gqiRjnVQtTkIIVPhtrmTZFMPCS8UbN2STDDV?=
 =?us-ascii?Q?MJi7RXog7isb/mvhV9mEB8OHX+kNSNFBamENo9ZQa1rbyaLOqgRlVZy/JL2G?=
 =?us-ascii?Q?qVy+VB/WonFEvrevI33GeNowOj/9RcGavv0AUkJCyQGG994xN4JFeOL2gmmZ?=
 =?us-ascii?Q?xDP17lf8CkJ6PBkXizean689bAlVyh8ok+4GHN4bts8HgXudi/4/ZXQTdV93?=
 =?us-ascii?Q?tJpO9hVTjRB1q7JoTJ9nyq5urLXt53xWn8TEu6JauNXrFu0gOdMIKgQLFxIW?=
 =?us-ascii?Q?tCtWZ/EFpzzNhl+m9N/YG2uA7wGUNb9nDlmEgY+2LCd1b/3wDsykEVSE8JLU?=
 =?us-ascii?Q?EDGKF2qf6WnXS1YVaNWBwRibXBALUydc7oyAuxdBiL818vTR6KexEuHRkgDA?=
 =?us-ascii?Q?CY4rT91ATO3F02jNEqYz4vQMjGKvgZzz98dGidLoFn8GfmFLoMsu/RGhTkcK?=
 =?us-ascii?Q?WmfSw28S8PDHW72so8HyjF1+2M38MEk6hEXP0vvljMX6/uQOGFn7qkpE/6YD?=
 =?us-ascii?Q?bCBSV3eTCyj9PuBwIsm4BPZ6Iux0QMkIrFHlJ/goF3QK/GLxIsvc4fc/7atw?=
 =?us-ascii?Q?deGPvlw=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?w4qpxV/ff/vF3MK9rIynt1X4MOSCKOLq6cmk4O3fOVyQ1PursTo5rQ0V0zsa?=
 =?us-ascii?Q?BsnbfL0xcJmCXK5Ccz8FJM4j7Ju5TdHuwbHvZO/+Re9s+O/OLo/UxlfNTWih?=
 =?us-ascii?Q?Ecw/TDOBQhoQzKN4eEBjeowG/XoT8fOVYUsR6soSZxFr0u0cM67ppplJkjVY?=
 =?us-ascii?Q?QfS1Zxip/b8TmAp4CrVsD5P3uDjbtp+17ppzTxMcCeU6Yle216vA9FGC20bf?=
 =?us-ascii?Q?7kXrywvBmzAr6iN94pwtz1234sXDDKnf+iMlYYOw+35r6Ae03MDhoK143bn2?=
 =?us-ascii?Q?pjJs+pfYX8Ec+3H+7n+QV0OoBrrJtf8fnUlgw9UhnqV4bNcQbb9vbp+IJR/1?=
 =?us-ascii?Q?5wTE08hlTk9/KtHjWM5OqTQ2eu1nLK1okqVwOm3IWX9NoJwc7yC0EgOQBMZm?=
 =?us-ascii?Q?cnPXbgGIxNp3EM0E/uw0AfTkfpgUESlOs8PYxOUkAuy/8bADMwtUvtkB1muj?=
 =?us-ascii?Q?i/xp2g1JDu/eo5t4aJC/sU15aRi/NTuvbz72ckSWyXGPLj55z5z1pnCIXR2j?=
 =?us-ascii?Q?igIO37djAlC0rpsx+Fj3RTrFx5nmmYLsqgA2irNvguIBaa/1dXTbQaOuOhui?=
 =?us-ascii?Q?41xx2F9iXH1H6yKdqtaKdExR6DFe4M3QLLGYQz4PGv9aZprllo6Iv1MgPqU9?=
 =?us-ascii?Q?O598cO+VdFsdnl7eIsDqw4fKrFBYiQ+veVepPNySg5nHQ8BSzWBSl0dbKaMD?=
 =?us-ascii?Q?UvnbhUOherOdoXkrhON5KbhjRtcW/q0H0yKSxmC0/AarhDI6C8OVEHY7iyGi?=
 =?us-ascii?Q?AtYocWvIu7F9XeyPH01hhyxVcVtBCmw5eZOZXdM1RbuyMmCT9o5Qi+HaOwFy?=
 =?us-ascii?Q?mcc1jJubjn6hUqpZsyhDN6ZGqmBCr4LDWeasi1TT8VVjo9YIZOU7gRDldicV?=
 =?us-ascii?Q?AQIRkQAIvQRpok1FSWzLYZ4eRUUc6qKuujEPaLqu8FBy7DATfkL9oXSWl+kh?=
 =?us-ascii?Q?lU5fb00Tx/O/55xxcT6bNJBNCXn1LOz7+SMHigi+IRIofqn5nn6BKcx880W0?=
 =?us-ascii?Q?aGEZOlBxQJjlhotIghaxR538puI3bS93SuvkhGyUoJcPKBl6sqEOM1eE8Gab?=
 =?us-ascii?Q?4yYXEHTLYasg47E9UWkjAoy4n+WZV7pC7AcpsJ33uthCgB9OtUnRM5Uqkz/4?=
 =?us-ascii?Q?pj85mykqIZydh4mKn5c33Uorbyxd2lL47CSPIQF97bRPDBN6yN3s/4VxlqF/?=
 =?us-ascii?Q?7b7aLkb4L2EJlB4YWJalXqkgKGuBKnh7nF7SjRWNqN3P0S7+5CWNT8azmrDL?=
 =?us-ascii?Q?3777Myt/xh/HViyUedSc+MVuOjmY6bi9g08ES53DGKY6+sN5WHhQ496s4Z07?=
 =?us-ascii?Q?vJXb/Pbfk0RRjkpvHc45qR0YZ65NsiJvcbLyEL/NxOK3ZcwMjvRwPCaNZnHR?=
 =?us-ascii?Q?zcmrjxcOkYXiZT7z8i9uoKegoomZ/Olbc+WuO9bHZF7otEWV0n9N04lw/hi2?=
 =?us-ascii?Q?H6s9r9vVEaxXSifEBXWbNike42ag+YpLFFF3IIeVH8TFopk/ltk3H5neccJq?=
 =?us-ascii?Q?D3xDAeEXdlid7nv+dJFkmIxFXlVKnxBnnWzP1dtC8IqoE/OTteUuUibUAfIo?=
 =?us-ascii?Q?3PzitwKh+gYMBjNPi4Ir2MO3Z2lnOp/BBOgQfjv35Mv1r/7mNQIgBOg0Iu9W?=
 =?us-ascii?Q?ctk7eJ8RbTEs8/6ofYmq5AMi1mMsWl2/7KRFmITVrW3I?=
Content-Type: multipart/alternative;
	boundary="_000_IA1PR11MB73208F20FD47C2F6B27F39D2908C2IA1PR11MB7320namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 226134c1-e874-4a88-5fe8-08dcc0401c67
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 11:14:36.6182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MJ88Z7N9Ah4kzTPY5aGgVtAsYCVhileT87kDG3c23HDB9NAqVVQFG1cTnmC3PqIOXi5B3O+4vmiA9VJzKUKBtNcOC8pPla06++UF0LWe563NpJM7Ai02Ehhh5nJQgcoM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4826
X-Proofpoint-GUID: GdVDGRudVWBEma-S7nQ4Qdm42VnBjnE4
X-Proofpoint-ORIG-GUID: itW7VRxoBWC8LDWgP5y0KQ8WnylCWF2m
X-Authority-Analysis: v=2.4 cv=b+3g4cGx c=1 sm=1 tr=0 ts=66c32921 cx=c_pps a=ynuEE1Gfdg78pLiovR0MAg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=_EeEMxcBAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=CjuIK1q_8ugA:10 a=pbxqds3gQIwA:10 a=I06YHlQDP-VU5PQb:21 a=_W_S_7VecoQA:10 a=syqr5EOPB93U0NEwqYpB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_10,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408190075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 11:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203505

--_000_IA1PR11MB73208F20FD47C2F6B27F39D2908C2IA1PR11MB7320namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,


Yes, but the rustdoc reproducibility changes from this patch are not there =
in the  Scarthgap branch. So, the missed changes are backported from master=
 branch.


Thanks,
Deepesh


Get Outlook for Android<https://aka.ms/AAb9ysg>
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Monday, August 19, 2024 4:37:26 PM
To: Varatharajan, Deepesh <Deepesh.Varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; MacLeod, Randy <Randy.MacLeod@windriver.com>; Gowda, Naveen <=
Naveen.Gowda@windriver.com>; Moodalappa, Shivaprasad <Shivaprasad.Moodalapp=
a@windriver.com>; Kokkonda, Sundeep <Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [scarthgap][PATCH] rust: rustdoc reproducibility iss=
ue fix

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Mon, 19 Aug 2024 at 12:58, Varatharajan, Deepesh
<Deepesh.Varatharajan@windriver.com> wrote:
> The exception list 'exclude_packages' in meta/lib/oeqa/selftest/cases/rep=
roducible.py is already empty.

If it's already empty, then what reproducibility problem is the patch
fixing? Something does not compute here.

Alex

--_000_IA1PR11MB73208F20FD47C2F6B27F39D2908C2IA1PR11MB7320namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"auto">Hi Alex,&nbsp;</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">
<div dir=3D"auto">
<p>Yes, but the rustdoc reproducibility changes from this patch are not the=
re in the&nbsp; Scarthgap branch. So, the missed changes are backported fro=
m master branch.</p>
<p><br>
</p>
<p>Thanks<span>,<br>
Deepesh</span></p>
</div>
<br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">
<div><br>
</div>
Get <a href=3D"https://aka.ms/AAb9ysg">Outlook for Android</a></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Monday, August 19, 2024 4:37:26 PM<br>
<b>To:</b> Varatharajan, Deepesh &lt;Deepesh.Varatharajan@windriver.com&gt;=
<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; MacLeod, Randy &lt;Randy.MacLeod@windriver.com&g=
t;; Gowda, Naveen &lt;Naveen.Gowda@windriver.com&gt;; Moodalappa, Shivapras=
ad &lt;Shivaprasad.Moodalappa@windriver.com&gt;; Kokkonda,
 Sundeep &lt;Sundeep.Kokkonda@windriver.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH] rust: rustdoc reproducibil=
ity issue fix</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Mon, 19 Aug 2024 at 12:58, Varatharajan, Deepesh<br>
&lt;Deepesh.Varatharajan@windriver.com&gt; wrote:<br>
&gt; The exception list 'exclude_packages' in meta/lib/oeqa/selftest/cases/=
reproducible.py is already empty.<br>
<br>
If it's already empty, then what reproducibility problem is the patch<br>
fixing? Something does not compute here.<br>
<br>
Alex<br>
</div>
</span></font></div>
</body>
</html>

--_000_IA1PR11MB73208F20FD47C2F6B27F39D2908C2IA1PR11MB7320namp_--

