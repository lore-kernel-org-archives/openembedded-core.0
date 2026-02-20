Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D621CC54F5D
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 06:03:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32936.1771567394243262587
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 22:03:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qzMkLMXp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6511fe63f5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K4A2711865289
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 22:03:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MhbTFU63Dq6v3AGMKjgBvJH1l07fdyQiPRcq1h6H42A=; b=
	qzMkLMXpBuE31fzaR+rF6Mplz1xjAoaCQA0k4ase2z6YPhBZxCAyRjGMAkeW8lp1
	iNzj8Hc2o9KVqvTy8GXwGpvfPn5XLx7fV10hpPF65+6loM3h94IoM++aVGFMxr52
	7cbJvXdw4Qq6nyMdtMwUoiZ4nJm2o8Ev9eNJTSG60phvO46cw0I0uBY7AnMG62av
	A0+arquX+e96b6DAHTqQ233B8wOYO/7oJ6R/Tsn1T8r9B35xigPVG2LqqD7UJzQG
	Pad9S5amWzzhdPnh/eiYGM0z5i27OCwBQ/HlWEiPkYKD5svt8qJUzYfz5gtjhS5m
	GJ0RU8QpFvqr57ebO1hZqw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cdtuahb68-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 22:03:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3mj1pQv4NNTy72fk5IVf/FgvgmAN6e1DrXVBUZQsSWlIcMeKXhJ/69yS+Mpdb+1rJRG8Uao+EWOsFgEgy6We7dp59Q0B2uwhDNd+teBE9bo3izRx7wK3Qik30cwyY7BewlGpsvgeOJ9yZ9XYPT408nrLIpiBtNKzwZfoJwjcyuJ+1o+sU9TM6vFTdg5ht/r70EEiv3uCvgR+3Z02ZvaDN35MDzMv9aegUNJlL1MGuby5GRtXi2oL0TTEej+licwJGIufGrXCu8fNlVCYKSkdsl2w6yt/XaxidDz5ew6mJxLIOzt2N4OwJVH02yirNpT91wUWGguDayEc2/nTDtbuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhbTFU63Dq6v3AGMKjgBvJH1l07fdyQiPRcq1h6H42A=;
 b=IijJGIoWKUPq86LYu+fuAnBEruTQaAaWA8G1WTz2RvP8X65Ku+46n1kHtQlCLo1eeO6nO4blQFNYL4yGaTKN5ErUGi23ZmKjbsd/1RQYaJeg2g2PGDiWqjV9tiJjN6kAWk6iciKICkDyVhNSnESuVgBUTh8/wm/1QS65ZZxWJHlsFOp/pvVmz7jfGkaGYo5I8pRziIUMfPFb5GnVcFhS9N7P2f7HpM8pn35pgm+cU/5V/rWTDeZ/iRNEwumaVgtHlRQOjC3Q8fR3SMtmYI/pOTuTTJtnCzxRapyHloSysHnOQnbDV0VUhVxjxDfrgh1tOHfRBKr+OZgp0amm9KIJ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by SJ5PPF8622363CD.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 06:03:12 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 06:03:12 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH 4/4] rust: Fix rust build failure
Date: Thu, 19 Feb 2026 22:02:52 -0800
Message-ID: <20260220060252.77248-5-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260220060252.77248-1-Deepesh.Varatharajan@windriver.com>
References: <20260220060252.77248-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0048.namprd17.prod.outlook.com
 (2603:10b6:a03:167::25) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|SJ5PPF8622363CD:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d9802f-9718-42c3-4814-08de7045bafb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?01+KEc/71dOds8XAElFyU7L6++192Ft3rey4TyXw8cFj60ICE167FxnUfYQ2?=
 =?us-ascii?Q?kEcWbjegcVJkwqLY1XIAOa9SLpwxcWtg98UK06X2McbCtYnHkdbB2v3G3Jo/?=
 =?us-ascii?Q?2NYeZTluwnj6aLZ5Kn4CcBeqvxMP3YxzjAv/nX7Be5pGiuTmQEw8lxs40V//?=
 =?us-ascii?Q?9FK5kaVy7MQNo93gT8tQMsrLGC4PoMz9YQsNzqB9ZgtMovSl3IzNw5K1f7Dn?=
 =?us-ascii?Q?VMUI0btaACsafytdDD8jQ29fXrqugS/xdDRvkMf5eA19KNteRg04YGaKsRPA?=
 =?us-ascii?Q?aRE08coOfjV9tJ0WrUAA2Kfoggjy6p+0WRc4WmZYNVwAd3vIif8MtXZe8VEd?=
 =?us-ascii?Q?2yRf10XFfjdI5fAw4QtyyX/yMabHrthDxk6Sa24G0Hef1BNlIhtAD4L2zhkp?=
 =?us-ascii?Q?iscrXoDazcIiPl2x/tFHmkOW7huM5iooj0iKD8BLBlx17vGgyr3lOYMErpC4?=
 =?us-ascii?Q?uOOQdcBwjzwZx7TxterOAFqfpoOaqcb00AzmYpjFe31gjryh3mLpFonlDn3M?=
 =?us-ascii?Q?CRhP8+ul2p0JunebzI/ggXSHqlfz9QXFFCHrBQk+Mcl7zZr0VLNruY1Fm9nD?=
 =?us-ascii?Q?oDlA3i3YtMvk3sVCWZrS43hWVQGz84N0x/y16YinJkNoW1xXjAzugPWBsNW2?=
 =?us-ascii?Q?K3kQcT6Vd19nw+Yj/ia9WlQN9ndigSitAyDRY8Xn3QYjw4nFDrGgX2ZF5h91?=
 =?us-ascii?Q?RUbibo/An6jqa9oz9s/7Igk/M1p8UkvHJsLRc2O7c8GR5Sse5PB8fFeutXCX?=
 =?us-ascii?Q?asbk+kLjDdHR0AR3FIwbR6P+Tl5ifgv5UKGP6FRInFM8FhXBtKCZJxLd2nu3?=
 =?us-ascii?Q?y1sOfjacTQZ/XmrZ9nzfPaWMv196cowCHmFDITa62vDYPcU9zRZ6IVY+cQIy?=
 =?us-ascii?Q?Q5ApW5PwD+z9S1bg8oC4NbBcOPvc4yLUkGtMTRr0iFYXexl1PI8QPEwdB61I?=
 =?us-ascii?Q?yEzm9WuJv4rV5fcWBl08ufJJ2JaxDRSD7vZbrLEanvVx6j3i8ApSa15Y9T3v?=
 =?us-ascii?Q?J3LwTQoMhbJi5GF//9M0/8nb7vLVr6EmdjhCsEAZZthR+xU1NFDyMSwOtzbc?=
 =?us-ascii?Q?x2jS2jP4L5IM9EiTLFCt3ACCO/lC3PWcKJVBSfmMc14prRDi1QgD9qQI942y?=
 =?us-ascii?Q?IGna0qm40YwYnMt9FkpB6OAGcUYZY9f7cPlDA3tiunEH28/K6BMrDvs0LxFh?=
 =?us-ascii?Q?72YDhzitQfVw2zwNTsetaAFPQRMicKkLRskkmca80uEHXMz2h0Mb2qsf2W2j?=
 =?us-ascii?Q?XkvB1LQAyharlOipcT3gQvFEiyVftRURMuKCj/H31r4T8Ly8612mJoFL9OHu?=
 =?us-ascii?Q?WoArcK/0bkpUyUmviNuFEEqyMmGJkOz4Cf3jaYVhjk2iEs0Z8yo4DqrduL/j?=
 =?us-ascii?Q?hBFMlDQ+Mao40UolOqI8PxmZEXnnWVWjxvgC/o8Y6PGjyQ4lZsIMouEBm2FJ?=
 =?us-ascii?Q?xBCnPNbRiMHxDzi40zC4RIhoe/p1NE0//MK05I2KAX6O02C1CzV6Hg1o/1Y5?=
 =?us-ascii?Q?OMBtTLek02sWd2dSiu8xZaX4yuIlp2fAkHhAoPWz5BMTi4r3ajzf6LqkWjKL?=
 =?us-ascii?Q?FCD1oE9kpxxS6HOH7SId8TWV3McWFoUbhQKWt10Wdf5ZnZsj8IcZN9CVSi8C?=
 =?us-ascii?Q?MrsQ+rq3VUPWK5hLqzPdP2c=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eD3rTY0iJ4Kh7G8d8/GSmhpkDAcke7xG0qBTlXZhqQ0NAb6sNU93hZNlsZh+?=
 =?us-ascii?Q?y+uTT9vYu05bF7SSJDOzVy0bhcJj5qiR+FoRiloHh/E75hRrjWDWnVMwXi28?=
 =?us-ascii?Q?xacbSDi91WHGpdJwXXvsHhjIRB+UUewXr5LsS4iDkolF3bhFpim5VK0Tbh0l?=
 =?us-ascii?Q?fRCEXUOj8HtDWHlPA1Sr+MEdkr+VoTX1dSLs45iNg+WPRiDgEi9TUIZo56+w?=
 =?us-ascii?Q?O5bqs3e/7YDtFgFIj67c7fhD2hlPlHoe9kAQbdKGE2cp51i8Idp8yON27v91?=
 =?us-ascii?Q?Efb7bBHRl2aopde91JG3M/GotEyB3tnMJc2bil9lxAft98Tkw+6QuYMmLWde?=
 =?us-ascii?Q?jJL+u/mcp2Ho7/XXHcXN38xIpB0KSHk1yPtZbKeyGPQMT2llXU43HsVv7w2t?=
 =?us-ascii?Q?STzG0vhFRUEoZnXuejna8T6QFAxaK+zA/iRH917JaEtI/txdu6J1k3cAAFHM?=
 =?us-ascii?Q?Ep1gk+LtdRfQdDd3aaqGoRYgsvYI4z8qL02a2kXjSMxhVzS4X9bwgqinSNiE?=
 =?us-ascii?Q?qlRIAlAX/ItAwG2Hq8q9suusscQ4iqVFfFNdYRuYEoMF8jE9syLc0k55ifij?=
 =?us-ascii?Q?233+3oAabNfgYXPiAFeQWmu7AhYt1tgUpMoTobAzhhxQUVkMSR7vwvz3s5A5?=
 =?us-ascii?Q?4iXv0vDs/DzB3UkCQiBy9a5EpzDOgeKAMlfq1LkiXxUee9puXecTZUo1PM0W?=
 =?us-ascii?Q?Sk/gE21dp/RCvU/8hjygbfyKwKQplAZl+EurnebNVp1T+h3gKBgZFUJTg/4k?=
 =?us-ascii?Q?cEzQnaiffwQOCju8Wm4hlfQJm25HkAcPv7dtCzkQ2eyvks7csuyApIE3Fpf5?=
 =?us-ascii?Q?YTGVm7TCAUQc+R/dfeiKVetyEkIbQqMKU9zmJuEIII3kYxnM03q3dj9W60Uh?=
 =?us-ascii?Q?nx7bmYF1zq0iGuJghBDoj/k88emBOLYpNr7Sks00ZHdPP6wA0A876amE7ICH?=
 =?us-ascii?Q?0yWgz5F7SEF06w10xHieFnrowd6GVEfU9O4nL3e5dY2gU6YsFUu9bb2Xv8fn?=
 =?us-ascii?Q?BHoQ31HW293fddHzG2dH3pT0rwq1amHd6+AQVnM9rQ7lpw5XAejgNDxPACzU?=
 =?us-ascii?Q?x0i5i70iPg8OR91IaKDW87D25rqEEoOarNT3gpoBvH7iGUfznDS61d8IGJ6m?=
 =?us-ascii?Q?I47+qesLwiINY2mBkOT1rU9j3NyD1C6V5Jn4cLiLEsUA5c5OCga4JvykL3qh?=
 =?us-ascii?Q?5Ho8H5uFXGILj24Y5kOrdpsgSnGxohKziQfFEAT7AkotkYRxObHHgWLYNcxo?=
 =?us-ascii?Q?xkOvE1Bs+demVW4rjI8DCn0l4ysCVHj3e2P33BxbISTSmNwpjgnQavlkljMP?=
 =?us-ascii?Q?G0POE700yD2CGqmjhs3kOb7ORp9iRKdnIF+Sb3PtfqdT90dgnTWWeKJGSrSd?=
 =?us-ascii?Q?ADEJjAsZg9WBqdQPVZts9/1G14M2v4awN+SHUCdMbJR/VL0SWjX0wxakvdVu?=
 =?us-ascii?Q?ZrAFCa4C4Ic6WIGe9MKJLHlj60EPJVPzoVYFVtLQDZDCZW/3LUU8rGPfdesA?=
 =?us-ascii?Q?i2aUeokgbktZ4u3X65cJiv8nVZwLOLCh229UHCFRjPoQaTlniekDeHUtr6lE?=
 =?us-ascii?Q?8nmWIMfAWbcp/zqE3wDznZplAs9GtYsQPMXyS5M5QX5RjhciiZfslBBBqrjD?=
 =?us-ascii?Q?Fak/RTUAKZkvJz4GYoW1xbGNpzHWwsJNyVLrrn8QgG7PhHR/zad8FxqUtWGw?=
 =?us-ascii?Q?OWWkpljk/FwftPdYFw1u+ydV9uqk8RntnfqH3bfioSeEC6lNy5icERLuudu9?=
 =?us-ascii?Q?aLqDuoEY2JW54UHgJiDDzyucfcpit/ds6HMicAJZyeNhyHzI0z0v?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d9802f-9718-42c3-4814-08de7045bafb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 06:03:12.6092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUPnUIT0jD+nsNyqk3gj6rPkYHmH+XAzX/IU+bIma9BvMETHdcTwEyNWMpJohMuox+Zu2YHm+PwapZqJw7Men15ddrUST8ORzhZR6v6dNDljQksRn4qe1eIZDNwFmHvC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8622363CD
X-Authority-Analysis: v=2.4 cv=OqxCCi/t c=1 sm=1 tr=0 ts=6997f921 cx=c_pps
 a=j8kfsx1CyBm2fJFf+vs0Eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=_AV8jFXD_HeXAK5xdaoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ag6zKAIzz46ybwPoFBb54U-a22wusM68
X-Proofpoint-ORIG-GUID: ag6zKAIzz46ybwPoFBb54U-a22wusM68
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA1MSBTYWx0ZWRfXxT4TJtaL+lG8
 zIb+uqUEC5rWvftiPuvTJ1mv5wAPe2f4QmfuEVDIoXNxq2sSmz1XsNyqiNzMWW2Y9a972sIgWhM
 MrCOITCmwK2NP6XRNngTAmMLli84gqgbApF6qOQK2i+TpiGB9EZpghGi44f0dM9ge0eXeZUxpmr
 8iTBERBMXtsWZJwZVm6v8h4AzCSJK3xfmaWGCri9ZSYCwqXY9H8KhL0uiMU0fONE77hPSRnGn5n
 ePZXIZohWuRfeSh/mLnii6Xr8zR1MdajHhkv1stzFLwSRNt0El2BmcgFwZTdJNjYp7LLJo8qVUJ
 RAgRXgGeOTL8ml8nN8Ty/V9f6SoXXTmHNlc/C8FYE31V+4k9d08t4cYqpynLEhU6AJV4Fi1w/F4
 47sNiuCqg2MAnojkoxkl+KCTzyavzBD7yyofoTjAiaqH+5h8H6NwDbWJPf85fulZZhr3z8rgmt3
 6w6OMlPijAB0gMByTgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602200051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 06:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231492

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Target LLVM tools are installed in the sysroot because they are needed
for llvm-lit to run tests. However, this leads Rust to pick up a target
llvm-config that cannot run on the host. Overwrite it with the native
llvm-config so Rust can execute it correctly.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.93.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.93.0.bb b/meta/recipes-devtools/rust/rust_1.93.0.bb
index 2be0bd8d89..86da4f99d4 100644
--- a/meta/recipes-devtools/rust/rust_1.93.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.93.0.bb
@@ -236,9 +236,10 @@ rust_runx () {
 
     # Copy the natively built llvm-config into the target so we can run it. Horrible,
     # but works!
-    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
+    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} ]; then
         mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
-        cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
+        rm -f ${RUST_ALTERNATE_EXE_PATH}
+        cp -f ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
         patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
     fi
 
-- 
2.49.0


