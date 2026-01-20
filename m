Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361C2CA5FC9
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12461.1768931657450949870
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ETqtyxjG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K3qvdE2794329
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Wdy+lg+X962xiv9p3N91fq06al23iC+H9lHkqpeMOFA=; b=
	ETqtyxjGGm0daVTIhaKruNGy6DV0f2RU8LP3wBXByqXg/gC2XdZP6wP56MGUi6Bk
	VTc0WBLG48fSQZ/n1cNF2ijb/DSPhOS5SKn6oX/ZAAUo2kn9lGFYx5gBfPauvvfE
	HO9RJdFfXC+z13drN7bsQFxdtGgvPHUuvwMTWV9JV8gLnchVBx+fYNz9c3G166hH
	1UqRx/vcqmrsPaviweyTSCLH1+/ebseLddH9fK/Efz+8gqZLSs2ZPxCG0/fIVJIB
	Iru+HfpnJnrq3Lx4/xn7Mv++UKCA3OU7h8lUZZ+d2JGj7V6mN+hLEqlF3v/4Rf/8
	kK5wiR8ImPoMg+0tBnnyHw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013041.outbound.protection.outlook.com [40.93.201.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymukf0c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 17:54:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8ntH07dJhV/rg0BtEc0AtVcaWIyZmbVZvO4kaFET+TxWNBzSE4tEhFfGC3EJWJNVrzuv9Dud+Hh5RxYsSmVsgJY4Io6c5ygxK7e6hIZpTnFD+bGEtT6lc6O8OrhhnN3VKRhGJb2NbdHQn/m804tnwjfcuk38borXcYpiaOvxoPsJoEy8T6bz718p0vyUKB2dgziFPVNIFK/XCmI5SeSqURZgbF6oZXznXUGKk7UENUjChQ+52012JnkaRMz3vxttEJzn7vjPid8GuPylRYvSXO+prqXN684soR7rdRSKldg6PKfIWAK+bDe5R33WfymQCFssLiCYjWVuY8rIMaStQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wdy+lg+X962xiv9p3N91fq06al23iC+H9lHkqpeMOFA=;
 b=hvUUlIG6lfno6Js8jyVxik4ooYj3/6J4ySxR+zCmhYgpyGe1r2P9o9vp66/HHBt72LbA4r9vGQhSy3H+sGlulJRPRw9p2HwzKqI0olcpYPoGWEeVTyQKeQRVwKh5gbl4qccpoi7rbDK1kRCNodYi06B0suZE52Y0cXAU9v6Gf+SaXAiznDhtjZrLyI9FoS3pMmR4apVfmTq2KhcP1iw7UbcA1HpgAx6xy9/mMc669vs3aMfVFPaVpyzvppO1/pkNfqv1imiDbE7XiUisxK3o/ElZm1Ro7WorBGD30ZgSCmachKjoiaujqvAaF4nOMfODIppRum4hmCCwgX/2SA93qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:54:13 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:13 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 03/16] rust: install Rust library sources for target & sdk
Date: Tue, 20 Jan 2026 09:52:33 -0800
Message-ID: <20260120175246.2052341-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
References: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ff246d-df70-42d3-1826-08de584cec11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KwNdJY8rX3+Qw49u9NqcaXpyIWZJKCCMKX7BDArp4j2IfX5TSSPybvTukf8n?=
 =?us-ascii?Q?C4ymeOyqHIZ3hg3jB9ITZ/10dzOGwzZzXj0tW4061SAq1wwPkDBNunl22/s1?=
 =?us-ascii?Q?sQ4Rww2C5zzddoHxxX5eoPe9Xg7q+ziDG+u7o2ALxl6JFKXiMlExRjTW2pRX?=
 =?us-ascii?Q?zeU/peWK3iUY3lNfXDURMcuLVwuFej2lZWqHW0S1CVBmOR9YDXupFoQmZapI?=
 =?us-ascii?Q?H9sSOAYOowQjAffPSPvUg2xPiASJdhdfxFOmCddjImFxJaBK40bNjv2vSvfT?=
 =?us-ascii?Q?DSvygXPwcJPSLc2ZyEEmg8nB3EGI7f9GhoLyk2duCVfJ0gSakhRaz4xldc2m?=
 =?us-ascii?Q?0MRcmCw2G8ok7Ucrwp73gC8EerZXrHSGTBeOCqz3z6+1TPtS6hjpDuXqqZdL?=
 =?us-ascii?Q?MpZ1DoKukKuDDSLbFRyOWnqMtvoWCp761tU+NEZsLvaeVqopcaNEt+TDMTRn?=
 =?us-ascii?Q?QVaWGzCdpKXnWX/t2/UWy9ETfnrt+6Oosa+o1FpB2ECUohnc+JDH8mOSn9ZM?=
 =?us-ascii?Q?C8wgXbTv2mY33akxdQ93u20cKShpZkeO2WOWDrxMGr34Ka9+G0M8dNiqJYve?=
 =?us-ascii?Q?xCNM7xzhi4ZknTuLtafxWkKvhnmhZjIFXw0IkmCKIXq4+yvhLr74ws1UZBcf?=
 =?us-ascii?Q?8e72UZ4fkDrhPFMGlewQG6GjgcxfVgJCRZfR5O3iYXYzQ7OIXjL5nSKh1WKa?=
 =?us-ascii?Q?dSQ6vqH8c6Wyb/vZbw39WjEBMO/Raqa8eOoexWkEVQWrm9ZeNay7bw4cpd7y?=
 =?us-ascii?Q?dSzs3XwdubPELBlhleoKsehS0l1lzSM1EjGmxbD8QUS6rk5WFs080KksZ6dP?=
 =?us-ascii?Q?T+LsiZNPYO6hH5g3bOVvyIVBRO86T4yjfs8XcxwLxKNkJn7Z5HrIbRUsx5AT?=
 =?us-ascii?Q?H4EJxRt7kyWgEFVn52Yaa/uIGS2SVh4tNIMFo6v8dMq1R9AvnWIZGhd2rUmb?=
 =?us-ascii?Q?F4fCOG9BpgPfuvrnN2xLiC6HwsaRKVOOq4Gy9bmu84aa+ArNZE5m5+nzhKvD?=
 =?us-ascii?Q?gSwxdNg7Sq7Wf9aJKyrp7C7TJfJ3tAKNx7XHoDCnJoNuAmtRP5G8SCWPmzCx?=
 =?us-ascii?Q?xoNhZc69y8NB2CkdRISwsyziWK0yro94L3jfYG2GDcGhCjlM5nYUmp8WoSFK?=
 =?us-ascii?Q?XK0eXSWz80BU9o3AFtjiXr6uvOrMH4IFrs199koLFYA02CRErN90hmRor5UW?=
 =?us-ascii?Q?5sohfb+sZ+jC4u4K9pto3JcyOT+c9vwvysXif+VoeqnlUGmByxmF++ircLFA?=
 =?us-ascii?Q?FiwwxGgXHimMUjg0/3Aan8H7loUa/B4Jua4s8jETWdyaW/YSi3qzwKipIFCN?=
 =?us-ascii?Q?z6/8zs7kRlm0oWWihxjjw7jGHv3cNuKwqOGkmeqwCapyekHs4l1q10754G6Y?=
 =?us-ascii?Q?FOeMrF6qRj7Q+cu4rhyM0Qw1X29M+mzaBMKfn57Kyp2lRQI8odW2QBpxjsP/?=
 =?us-ascii?Q?jbnWTiTcr8zThKK6T1ZuW5yUXUe47QQd53GOqvH7K3QFV86Xn5XfJ79HrOMJ?=
 =?us-ascii?Q?zGakQvYewkB5OjyUk+NX3Pah9ro6evHE7okzBefF/RqWCSf9WXDN0dKp+uFE?=
 =?us-ascii?Q?iggXRYa0mTuj8rKjKDQNIULbLpbOAyBB2Kp/vyg01pXid4nrQt0Vtn/jeknE?=
 =?us-ascii?Q?Lwd0S3BWyZZjIc0uAiLWeS0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PUY+MDf/LuOw73IhQ1yjvPliBlLl6ma0cXNkgHz6EeFoofVimzNgqc7WVds3?=
 =?us-ascii?Q?iIZJemCCYkJ5QOv53BZm9ZtGPJG7+4UiALvqC5SeW7afjI0B6ktiiOJRJsF6?=
 =?us-ascii?Q?lksdQw6xXTFSH0/YK9kXHNhhAuYvL51+E7sc3up0OR+somrJ/SK6DXGn7o7t?=
 =?us-ascii?Q?R6DwpsihwcHWq2kE5LsTc4UFGj7qoifqLRp/+4HE1lFWWjR8bHqpH0oNZrxt?=
 =?us-ascii?Q?WVdHa6w7CUxB5kTsDXsSPWhxzp9jrpQBZmSN+ei3qCUJXoTLeC5MuOOkRP35?=
 =?us-ascii?Q?LUFYt+V2XxURx80hyk5X1XIf73ya4Ly5DXwPMSuMEHQweEi7qCeF1oLdJDXi?=
 =?us-ascii?Q?rv92DAuE8I7ZfWArgNzyz2IDNummavBpDKQNhMfyoPNdiqucV1yxJVu7rtmm?=
 =?us-ascii?Q?5NNvv7637lgGcCdUi7nfvKvqKoZqNaWYfy5e/rcmI2Xw6L7B86XZJVUex0VR?=
 =?us-ascii?Q?w3qurc+afaEwq2rIm/sH7/bbiK9EYbrA05jEOHflHV+MPOroc8yXk6RgIU2J?=
 =?us-ascii?Q?jg2eq9A4JrLdQg63MMkhGz4DEGyuWeIuRq3qjoJeeM2tR4Ap0//b8fohK9gv?=
 =?us-ascii?Q?gekKYiITScZaucz6YNWmMQ1e3KtHjIhpmagE8xYJRazYHH9q1Ox73liuP1P/?=
 =?us-ascii?Q?TkWvV2CHlY3XEbx9qrK+3j4UEAFap1c0KGuO6IXv3jCCfGif9C472afKDgSX?=
 =?us-ascii?Q?9HNBbHG9vBh7WfpyYsmwGPgHou6CZGSKxsfGfRUA05Y3AVY93A9tO52gj7/3?=
 =?us-ascii?Q?CnqxwSxviuusOw/FKTd4y+kU6jBdYP3vXEyMnzAjn1+qyD0T0YEZU7KdFXa7?=
 =?us-ascii?Q?3bXt6g3v6ebGc/I1NA2OpuE4DFLYNjQk3n2pnTQ4Foeyu8+W7Xn1RG84scEM?=
 =?us-ascii?Q?7+fGu9wYfYdVC4koRLT7bmRo8oJYD0pEuk3tX8KpVgHwNchZutFhPo3yYnq1?=
 =?us-ascii?Q?Y3BfHpLcjcKKgzE7AoO5ZBIM4IrgUJ4wo2Vl3bQMncEQa1tLc1kLUZdHmnO7?=
 =?us-ascii?Q?m7e1pTR/bC7rWSRO00TyXCfxFdik9H4EWst7YFtnCHdpBEqyrASdRG2paj3B?=
 =?us-ascii?Q?XaCTcdP1u/y7TljqnmWNoAc72w3VuZwrdQsr2h+9WoB82REFN8e+THC3smiQ?=
 =?us-ascii?Q?qaBsYQNfNDsxmsYCTNJUN4/b1WF71h29zj4Swkm4TaRhIGTuNE/91j/P1M51?=
 =?us-ascii?Q?wl9eZV74Zqe+75CFUj/jB3pHYb6rFcyXXACWWNjyvi/gzMB/wpyGPYL66RV7?=
 =?us-ascii?Q?R+WmUuIw01Lj5yDPW1Ia9alpeFS5Mux6YX0eFOnhADWmgp2YPuh+61GYdR8L?=
 =?us-ascii?Q?XFZ+HdR5Ivp4n8AvhfSF5gT6PNAT0N7ZMa+sA8rxL9WbsyyJ+Ju1Chw7OIVO?=
 =?us-ascii?Q?2ID6vYYA0tmHLY3eVm4IsU7kgXtJAAqDDnmupZFW8WHZXw4mWsgoqZGgyupb?=
 =?us-ascii?Q?sSt1GzahsbRqIoo0fSMfMhMULFIut8wMF1h+YQAJj6Z6e+QoTys0bxBttTQJ?=
 =?us-ascii?Q?jW0hTXIfK6YzrhfcNGrbIZov0hebArcgdnEdqtyo/Z0dyg4j5MTul82vSvOh?=
 =?us-ascii?Q?plsDeY1D0MTa+8tEf333k4115J3eRJVmUO3m6nZUOweSmzdcaABhaWNvKO0/?=
 =?us-ascii?Q?eRTiGrCa6jx/HZf44Kv1vJ07Wi1SkpQIz/hrbQ3r8PB19qZFQepDQTY2MNeO?=
 =?us-ascii?Q?IKTMYSvf6mh1yzccbUI41vp6Lts7cv6jutnrnsR+b9lbAPg64GE8yvDmHtlf?=
 =?us-ascii?Q?gZAmXx4fIJ8JzAB0z3Dbm40ZPSpF0vM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ff246d-df70-42d3-1826-08de584cec11
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:13.5431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxcJ2KajpPQay+UP7ryh1VEB/Yjc9oRQc1uQpdPPVe47+rINWtzF9d+yGG1bFKW7Cm1rABv8hjHebbXNB3Q+Gqz1YgiUjZ/lV5wamyZ/uX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696fc148 cx=c_pps
 a=7YeuQJ2t1o+NR7xo1DCA9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=QeMy5WPdU9dpobuweN8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: MUbXC4GqG8SPEXT8W2ov0dxXI4PeIsRN
X-Proofpoint-ORIG-GUID: um-oOa1lk2VLF-OteB_t4qk76LrsFkxR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfX30QF7GmwtzoU
 lTlk9sZ+cJ99R2z3QZzkn44/Km4iVurBF7HtJ8gxs8AsJqVysQtEWFlD920Qb9H34ZTDdJ/G8gg
 A/jytOwrgSdwuLIrDoVCBnNE5bTrwrgcG+tnfZy/TJPy3xT4DI21FgigHgOEpBJ0bWRCgYEYP0w
 lq2l1LgLokDh3nhkyOPOLO802SbxJOJfmzhs7vmsRucIQnMCznMKGg7L5RpwUpJPSnJ3ikcWz0c
 4p+mO2U0GYXwg4LrgAMM35Xf7JWnWq9LJZhdCTRaITjELYC6NA8ogyCbPmzGt8JEpLHgvfRUSaB
 10Uyt+D2gyUsm/u7iuRD9NrORiPqf+aUc3peISbnP+7jyYhmxH7DZaGFi3V4BTexxf8mubn9LLy
 mX6Rn5fGxpbVQTHPO5gZAvI0EY7b9Rld0T7fGmtyAOV8To49gzmpYRjETUbjvc5YP67/TxTjVo1
 1TLyJcTvMkGg/Y3/TZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229750

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The `make rustavailable` process (1) expects the Rust standard library source files (e.g., `lib.rs`)
to be present in the `library/` directory under `rustlib/src/rust/`.

This patch ensures the required sources are available by:
- Installing the `library/` directory (of size ~50MB) into `${D}${libdir}/rustlib/src/rust` for `target` class,
  making them available in them available on target.
- Installing the `library/` directory (of size ~50MB) into `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
  `nativesdk` class, making them available in them available in sdk.
- packaging `${libdir}/rustlib/src/rust` sepearately with `${PN}-src-lib`.

1) See the kernel tree for Documentation/rust/quick-start.rst in the section: Requirements: Building

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.92.0.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.92.0.bb b/meta/recipes-devtools/rust/rust_1.92.0.bb
index af739df88a..eaab6a1c16 100644
--- a/meta/recipes-devtools/rust/rust_1.92.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.92.0.bb
@@ -265,10 +265,11 @@ do_test_compile () {
 
 ALLOW_EMPTY:${PN} = "1"
 
-PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt"
+PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${PN}-src-lib"
 FILES:${PN}-rustdoc = "${bindir}/rustdoc"
 FILES:${PN}-tools-clippy = "${bindir}/cargo-clippy ${bindir}/clippy-driver"
 FILES:${PN}-tools-rustfmt = "${bindir}/rustfmt"
+FILES:${PN}-src-lib = "${libdir}/rustlib/src/rust"
 
 RDEPENDS:${PN}-rustdoc = "${PN}"
 RDEPENDS:${PN}-tools-clippy = "${PN}"
@@ -316,6 +317,11 @@ rust_do_install:class-nativesdk() {
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export CC_$RUST_HOST_CC="${CCACHE}${HOST_PREFIX}gcc"
 	EOF
+
+    install -d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
+    cp -r ${S}/library ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust/ -name "*.sh" -type f -delete
+
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
@@ -336,6 +342,11 @@ rust_do_install:class-target() {
 
     install -d ${D}${libdir}/rustlib/${RUST_HOST_SYS}
     install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${libdir}/rustlib/${RUST_HOST_SYS}/target.json
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library/ ${D}${libdir}/rustlib/src/rust/
+    find ${D}${libdir}/rustlib/src/rust/ -name "*.sh" -type f -delete
+    install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${libdir}/rustlib/${RUST_HOST_SYS}/${RUST_HOST_SYS}.json
+
 
     chown root:root ${D}/ -R
     rm ${D}${libdir}/rustlib/uninstall.sh
-- 
2.49.0


