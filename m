Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD16BCDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 01:39:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26746.1782437960272931818
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 18:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=q8HNzjXB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0637d125c9=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q1K2Fl2569338
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 18:39:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:message-id:mime-version:subject:to;
	 s=PPS06212021; bh=PencF/xuB23TrjsJd+ZsvYw0hpBKya58YkK5eHtzLsc=; b=
	q8HNzjXBVcdb2DWZLSmOuLBqK7zKupMQi+gqae6Ne6IlqVwuoO8QpNdiMv6AIWuT
	pvgJWaxM2yeQebE6PoM9K5rGMECGPRep0o+vQVgcMzB5MB2nyTbqrnhsTeujtanu
	b2K3G1fObC/gpI2+flP7H8eaTjir4j5NkOjOxkLreIvY8pxIfGeqBt4eVcE7yOCt
	h1tlcdL3Ht8GNNKXSV9RJPtGvFRpJqVxiMP2sgNJdjyVJZyOjVvyH5Hru6MmvPaK
	FW8TqndixLowFNxyGT6WFmF/m1JcDxG44ERYoyE5KZS7cqXnSuYWVnL/QfaGkvm1
	MiPL5FZrZpdZNyk7zLjxfw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013031.outbound.protection.outlook.com [40.93.196.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f1ewpg1h1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 18:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7YNNnLiMNaKblEGpYXrE1bbJlQbhXpR99FIM8wK7xlqfnWe+P4kBbQM/PnuAZJsxhlnd49RVSmYsR+7FynKmq0ihSwDVZ/xQV6rd4LBbFLe3WlprRJJTseMnDW5uddb4fUpcJuWoZP6ESXewrhDttUHJG2kV3jFlYkbAoesRV7DTJaRuKmuZVNH3+vlvLvodATuXhYKKF+2u7NoYcntEwJDn4KtnK2uJkofDXu0wWjfgl69bANpRAXYQDGaQj6FsAosXQegH3/zaLa1DLrQND36Xv8QAqEZA+1eUMSxSQMwHNUV8RsvRZFTddp8q0HOkjCLtT3l6jpPN78EoYHFMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PencF/xuB23TrjsJd+ZsvYw0hpBKya58YkK5eHtzLsc=;
 b=WQYy+2q+ebyxhaBBmRgRlAlRyjIExn0J2IZyt6YRYiXe5VS+Nwvgqj/7MvpHz69dJIzfVcoTcxzvsMFH7NG9QQ9OUXTBfMOE7FdrMYzWKKY5pW0aOKIb3lDj3ZwE9pnx3VWg/NKQ3qUyX5LrtrxSBXzno5WQLuZXQ0ZqoJqtiJQ3i6xrf32lJj5UK07agonVT31RK359bmdFFR3IfQyM1/upHRSEThrh/5WTHApc7f8UZglg/c7EUXuppkXWXBeJizDKjCyhaRsc4QWS9Y7J/iOU71nn2K2cfdgXW1nsw8oIz+E155QeJ2uD1fbGxAjtiyCi47PFEQtwtbAS2H3zig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from substrate-int.office.com (2603:10b6:5:393::22) by
 DM4PR11MB5296.namprd11.prod.outlook.com with HTTP via
 BN0PR04CA0152.NAMPRD04.PROD.OUTLOOK.COM; Fri, 26 Jun 2026 01:39:17 +0000
From: "Gavvala, Kris" <Kris.Gavvala@windriver.com>
Date: Fri, 26 Jun 2026 01:39:17 +0000
Subject: Recall: Re: [OE-core][PATCH] python3: skiptest tracemalloc_track_race
Message-Id: <OYEXNZTIMTU4.SZL09AUZHXX41@ds6pr11mb9917>
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-MS-PublicTrafficType: Email
client-request-id: 52e88bb0-24b7-efa6-3a71-8937f3326b25
request-id: 52e88bb0-24b7-efa6-3a71-8937f3326b25
X-MS-TrafficTypeDiagnostic: DM4PR11MB5296:EE_MessageRecallEmail
X-MS-Exchange-RecallReportGenerated: true
X-MS-Exchange-RecallReportCfmGenerated: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|18002099003|56012099006|19003699004|11063799006;
X-Microsoft-Antispam-Message-Info: 
	HsQ0PPBxSOzqSUviC1rrrQmZiG42eGueBfr9nuvqnev7j9ccRUCqJzMf2qhEkoe69YApplvMQym2drufHeRPXqvguwAYBD8fi8ugYzJnOjojeT1YOPX0pzL423zj/JDEEVqZdZ3EHWsyXMgU8Syzdo9luGHw4BodWT+ZaZf7k4vf2cmubgxM5d/9oZlY6OI1nMTAaTm/pjWAGLUornHEH8sSMKPrhPlbDYOF/jwv+9vDqITwfKzUKtRk2bFrtDhz/r0bvTMHPT6XUfm06TfpkMcvoSwU1KSUz9Njiqr/9wWf9wFbl9KU6tYAM92X2Xc9HIIN/I2qWVSK6uHOWsEb0J3zGr8H1B9bOMQkW7ADb7K8SWTjFdN6R19KwEw49J4mlECWXtWw+L5m+uDgorJ2YgJMwGI7RN3XtjowQZo8w0oLUHaaGfO/Ew2EeltRA++cQ5eUg1MGwtthSRA5c6G29Vuj5GSINvd2QcO8XDlX0UVgYu8XNqSgjyRy5GUMfnqYLNH5JpePSaM6IjbDShqA+aRmJDHGgLWj+jBkuuBHmC30W3AVj2+weEpMUvP2sySrPgWkfi+3in+MTS+8D4e5Rsz2JAWtsewXW9gSIy2rqP8NYW4ch1QgXvssyCcTpfJXzZcPflPDeo6Ur6wvFYaGt7rHqgMt4ZoWDTP0jKW8Wnw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(18002099003)(56012099006)(19003699004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/MeIewF35+wPl3zJc4Tc4rr9F4FlWrs0p6nY7UBfzVu/1ryA2FqD0pBpKwq24vyMEJ7ECzX6ciZKcISLEboxBCX1VVoU/gi9ShAjVM8K2LDtqczshEJt10Z31PS22LBBctMM1+yVLmxwaJiGdRyNG+4XKfTx+YAel9M/DuEaJTk+KaJ2MuyNwi4vLdOZiI8MGSO0qPx/vad0hzI/LrtB92idJFm1UvamI/XrUP4+1PhucgOqHrJyF80xHldt5ERaAlf4leKfWZglLJ3t6fjZbHLNTMFTAl9QITs9U96v5pLyHFIXIqiIABKzsydOI5lh03JPgbdaECL/MNw7Sd4ePYK4i5iQ9Sw7VGWRmff2eButETUdzf+Tki9BToMs+ZwesldBzo7HIg5LRDqCSYe7rc7gPoC/ivudeW+OESOPwxA8uK4Oh+7/3sbdqS/vE6XbbtHoVQsznEqofDIzgjInNjkokiNpuOeitrin0Vd6h5rwjH+neasrpd9YQoh3HLkVd4T6frI+WhlYHnduqOkaZuufULIjacI5JhertZT2vSfXvQ24kx7o8IkPYEd+M+4U
X-Exchange-RoutingPolicyChecked: 
	gWcIbKG2zSrjsPR63wsJuCnuckxiZGtUb/C4Zi79/JjHWf4w2SweiknVLJq6LIxsiH7Vfyna1hYeRE376ErhDSd8uYNZK89EPtzatjL1MQbLuZsv0RO8heRE6d9Ma9y+qvZW31R1LBKe7uRaaErzXw1i6o47mC3irH/NIoKnpD4j2oUwAIgKL6tXmpny4rZs8Zyo5fRXTmQ9nhI4sZrCt0cuXJtSV2kQj0kfH6IZ6ORIbL9vulXnbNsxk4U1ztQ1OazwyoPgCEerkdtlIYmvA9kpDf0oXrP2N65BNyvDS2rfwkgroJajCws5SIvO1qEWuGLGaET4gg113hRhnZuLEQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HttpSubmission-DM4PR11MB5296
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 01:39:17.0456 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
	a4f6f80b-87bd-4fd8-2705-08ded323bc60
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: fcuI57Dg1myYqxh-rITv1ILrTOaGp3DJ
X-Proofpoint-GUID: qs969AubvAgTFK1KHHS0aLK5nf6YHIBy
X-Authority-Analysis: v=2.4 cv=AdSB2XXG c=1 sm=1 tr=0 ts=6a3dd847 cx=c_pps
 a=GI5TgwD/LrSAXmlNZGMSjA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=QBQNWSE2SMIX5PeL4bsA:9 a=QEXdDO2ut3YA:10 a=jijzI9o_07IA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAxMCBTYWx0ZWRfXzy0TQG4DWNVP
 WGnNB3i7PQlTNk/Pu27+R8ftccOq02q2p88VWRVsF5Lh02t9Ahf14sQTDNpLz0icc72oexpXtz6
 Ke7Bu3YurFYrziwQbr+Cz/ofeCTcmOI/7XNiotfkK4sW5S6UJ9RhDG4qe23l0qMCdBNa3lpzKZD
 f8OAvXCiOJ6cRl1Sc2cfMCTKQfQC4hsxwY270kbG3zdzb4VPZV5C84EbZkeU6SPL4Fewr7cpnkQ
 pIINApDgTlrdWtmljoe9v/OLdPubkBHLhYS+L6zIhsmqxCLewwmSqJL6RBmb3NYLNDJqEdpn2nG
 /Z4mHLvhVpra1OAUtbwq/vuAk63OBF7jUSPOEyhcAkoOqcFdXjVTyB974xcZKA7M5xBPUBl1gHn
 sUM62hfVwYSIlcx9PRC0qVM+TlbMf2+7fq75JFcT+7BSlSS0E2gHKVyBSJC0IYo5mUD+6uDWfPx
 XRjcPu3touJZ4EWOIxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAxMCBTYWx0ZWRfX0DlI3ts2NCIm
 wlx8OkKrJ1EYBoc8vV/ISJEUCEh6K/Vop/mD5fMqr91vD0U07yQqiwTVdcMfg66eBmpT5G3ysVS
 6MEKLD5g99yf0eW6wmm+gysuTctnHFTSsIZts+BTCKxD3EN9DKzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 01:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239592

Kris.Gavvala@windriver.com would like to recall the message, "Re: [OE-core][PATCH] python3: skiptest tracemalloc_track_race".

