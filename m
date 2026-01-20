Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D29CA5FDD
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13442.1768933888807543814
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=J2RF9yJ5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K4fuoS2877846
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/fNPJsNUzB15zY/Z7VL8Ab7MlDGtE5Jq7HXUqGHSuak=; b=
	J2RF9yJ5K7ufmuuibhUzciWvQZU8MTaLS8nMga10R/9piuS8IhP3uoQpAaXnRBGL
	mEgzXma6+qh3QIxLgz6NbXddxBg5mx8hNTemhS0sRAr2jxO96g+ihzU92ua6DgFL
	vDWEkn3lsrDL4Lgg04ju8Mi4sgTlhtXHNNVYwboEZOvig5BxKE+sqGBLBiA8Zmq/
	IbWCoSwyz5aDSszSp2TTLya/VkXtK9Ph6hVOyuFa3YtWBWHn7aqqobID9NmElDdN
	pM5Mgko5GtqfZ/XXYLrCrXBuJo5Mvo/gdKZjDiqSh4nYJ1ExTYr0bS1v9IS47nz7
	dL+ZnjkZDdOd24wbnP3m6g==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymukgy0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 18:31:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAmk/5WmkqJkIpGSd+GJjrIL9nOJH09qw/wGPep7R9wXYp8/uRHgUmO2TUhlT22uGr9Tp01lao5JBrUOU0OqUm7ne+yVaJwNFmh+M07tUqGMkZ80jJfN5JsNsp2+IpnBDUeWpDgwGOqSQGAAgrRU0tNmoJqZqa6xo3/2P6U338lqbZz0dEa1vtFn4ZjOFdb1LFjenrSIexDpBOZ0pVi4QmFruLISP9oAIOTHVWMno6YVhz1ORUwvwTuBcXIEPaGDOkY8cltdsbnDpC0333ZgA7rj5Tzwzm0IbrogYWWxTH1gP9uHQXZTKaorYXnzNTHXKAtrdYVIjsBsMaaxNLocmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fNPJsNUzB15zY/Z7VL8Ab7MlDGtE5Jq7HXUqGHSuak=;
 b=yXjhybNK2UdNDFLkwo+9GJJhs2vJdtc8pQSgOmS4+YzRskprpiLzuBYz2NqoFvHrhDEkM5HR2kyj/Y4p+rr/dEVS5W5F+ciDEUjIzG277l9u665kP81ow0qp9Thp2G8nr2FH0JFgCQMs/fpYa/CIByPc4hEplG6/xiNvP2X7Nnz3rBy8QGub/evGLipEYAlkashDu/HpQVGDXQxBXshwK6x5uqtfsE3KLSBjTAlJ48NqoCuvQ/9HAt8ued0bUnkHdsQYrOhV5hxnzWJYCHr76O1Unl2tGVO0e/nH6GQi8qCQXhxiCFAS4ghaluo550ccKsojpSA3lUk3rrcIgNbrDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 18:31:24 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:23 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 04/16] kernel-yocto: enable Rust kernel support via 'make rustavailable'.
Date: Tue, 20 Jan 2026 10:29:35 -0800
Message-ID: <20260120182947.857242-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: 6684a627-ec5b-4bdd-e602-08de58521d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MAp2tvV9aeDntzgjnp4zTFAFX0l+wrgH50XIJm1lsMcuqL9KhAanwAaqaqqY?=
 =?us-ascii?Q?fRCRY6eTbI5vGgkkSQ+Dg09o7qS1lJX+BR81hC3BmtDes/9fVhVg8XzXqv9A?=
 =?us-ascii?Q?rj3AXzlOPwBeGxUCchpbyOc6C12/2yCFbxvdiuSYluu9RGxvt7fEl6r9YrnZ?=
 =?us-ascii?Q?O9mlcT+QaZZ1vai7cKC4lAa6uME5h2Yx5gubuc4B/aP6ZlAkZqSEjNYfbnZ5?=
 =?us-ascii?Q?iD4/xH4/ppyjUOSXBa0HK7cyTGciF5rnUqi257P/ZL1itpYdCURzuFlEnJa5?=
 =?us-ascii?Q?cWGrgb2k/rxRy0ntS6e60p0/FwUuhhbQs8aK6bpd5+YAImPgUoscxrDYkj44?=
 =?us-ascii?Q?a7YaRH47qTPR4m7Z4aw0M2O0u273ews0MwWM+ZCew2mZ5aYD1eSQndowLW10?=
 =?us-ascii?Q?8yyuUEdNN6N/+3XVwPCwAD+ztm9KNVqKZEqUnA+PTsSbKrgs1j+IhDzxI4zc?=
 =?us-ascii?Q?0SpeFGJdHDaAck6iFu5O4b4EQPgfkH+Q5iEGpql0ix72cZqHfygVQ5J2OkJV?=
 =?us-ascii?Q?0AaKp6Q+HqsJsLH4GzeBBdnGcVxIIBlznz/OMlj9GoEyN52ATUjYYYUu2NYZ?=
 =?us-ascii?Q?yjTCvmqImWaMzBEICa3+DcI5TunwwetxlgHgFsR1qNT9uC2n+4PUcdaewePx?=
 =?us-ascii?Q?/rvlJg4cD1bYUmWJj8JZDkJ99DVo6e/MXh6iIU5vm5dNrCvcWr18yDvU8OUx?=
 =?us-ascii?Q?iu2XM6D6/t5uRozYUODfoOeuV61bn4Ez/35YWVVPkUVOEvgcZukRmosV8xtd?=
 =?us-ascii?Q?b67WSmrY7NY0lmlT2BDNhlgSUTuip4WOQUYIuPIEaYhkra8loo6cvsrokXhR?=
 =?us-ascii?Q?xASRY36tiU1ZkgrfiaGM3aNv0ieyNbA4mk47ZoQ5r8PK0zb4Ww8fQ7BsTXMz?=
 =?us-ascii?Q?Xa1HyIkrMt2sY7edaqwzPUWd4PytYiiHMy8oXHgpozzWzTZ8v/wQhRixNNjL?=
 =?us-ascii?Q?r+O/9JZPyt+SQNpd8dSup//ViBGLZ5OtxXsVqIGhnWZ9IeBl0D67Y0gJSr/s?=
 =?us-ascii?Q?SvOIuNbfmAccWZFxiCYg+JoUof+e2bLGQuxjpyKuGUUhY3GvGS1aHaH/J5kT?=
 =?us-ascii?Q?45eWl0cf4ohB6vyUQcE+Xa5UhaQePsQaIxJd5phn/uQWTLPPBs2gzIDyH5za?=
 =?us-ascii?Q?UmW2UsJ5PhoqD92hAx944grN5VCfd41QIkc7ObLVFoYQ3wMhMekMvLw7zZlC?=
 =?us-ascii?Q?3t+O4TZdXjpxoj1XmUPamr4nb0L0mSvyespHdbEA5AYNUmUejKpcOeW3HxOf?=
 =?us-ascii?Q?e+ro/ojR8gz73TiI30Evns2NCIHgW2Dbcio4P6uYv0r37ZUx3eKkpAY6cMZr?=
 =?us-ascii?Q?QaU2ikUZWQlV4QQIhj9PwDPFCjD9bJasD/bLS0v4D89FhP1rrwcTDx9AsTqH?=
 =?us-ascii?Q?7WJZniEVxsayFEzsRyV5qx44ZZmK6ErSOeuJwhYWvyPBjy6OPoMliSE2S1q2?=
 =?us-ascii?Q?tsOj5v6fewTtsIcBbH62u1uBbOsY+RcfKusuJKPpnUOS5OyLUio7yBGg5oKC?=
 =?us-ascii?Q?zvbyNz2KcO6dKV+XLL0InJ1zw1NloI3tsqfkcd5qbk+KGwOiKYCHJ+9Gkjmu?=
 =?us-ascii?Q?fjL8ofCOJwwyNI70LTy6+PoUxG6bCNns0ZYmoJhvo8Uy5btEbSOBK9iuHRu4?=
 =?us-ascii?Q?PQPfYtUo+upcEJFzO0ZbbsE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yYcncrLDZg+zXBll2yvmnBbQE+TWzbrVUnI7dLw4pCQLEl0ktm2inMcAKBgU?=
 =?us-ascii?Q?fFQmQT0g/Me4NZoCpI/dSqo1Z+Ukc/vqFRb7+fWnglH9tj8zBuYupaxxVvIF?=
 =?us-ascii?Q?2AYnNts4PSmdqc4B297JTEKm4Fv/ssnbthoNxOgbrssu8egxrcl03v6klAGO?=
 =?us-ascii?Q?vzc+w4QNgQYY5/PYVoJFeX52TGoR2x5jAwuQ0/e/Z+IfeFWp25IxgQYQsEbN?=
 =?us-ascii?Q?TB1K4sbxV2bL+47oIVQ2Md6ZPCSeEdUPYQ17lBoHJvJDvaFB5XXaYSWN3JzT?=
 =?us-ascii?Q?Z8O/QTSuVvsL3da5VWzBBENU1tKM/YAzmA9OOqyBfYov/RypHu/wmWFH2Gzx?=
 =?us-ascii?Q?dTNjZlzTwxDHTY/CtlSRVnTBitmr+zyXgcEhSrz5YZJziP1Ir3Ad/h9XbYTD?=
 =?us-ascii?Q?4o77mqvEH3x+R6vz0DALxaZG1zUdr3LQ8BaDLYaM5ywomkYLFpgZtF2Q4o3w?=
 =?us-ascii?Q?jxHbp0TfiQZs1yZV4HHkTEUT4bdAf2URZt6WU7/tKVuaKZRYjMEy1Y6jrHMi?=
 =?us-ascii?Q?naMmrTRezO8MO66amequG/p+KYlW5HHMowQhyEOaKhzKIqonbPeJm4aM8QPD?=
 =?us-ascii?Q?CF6++m97ysAe+Hu+NsWQ7PAVDsmO/HN4xgAERTZa4Ya0tzugP69mcuwE6wX/?=
 =?us-ascii?Q?sj2b52bGdjTPqFZegjDd7SSsGLqSDcVejmnCToQwQ9H7CFsKeLHvWBTbwAn/?=
 =?us-ascii?Q?26SKhBJyX+14rju29yiM/L0ltxMwjEPOUjEw/7Crv977pYSM96ABrPc13+tZ?=
 =?us-ascii?Q?A21mthhfvYtuYZgO9tM1WLmX3XPn+FQdxGnh4HTO7b97I9KsKE6YvFb+qTZm?=
 =?us-ascii?Q?trFBwFfs0etNTZ+knJCW0LeDnwpEEWRiHqdJK9CaTJUv8IL6cUQW6ljK4Jf7?=
 =?us-ascii?Q?Jri6w0CGS3YtZCOMExkEl4bm19LayHd7AsbqLIgaZe1w7EVuwlvD/lp9qL7A?=
 =?us-ascii?Q?qDpPxwKU7Z7WfRvU84VFbpZ9S0erUCkbLB/2E74mw1Z6TZTjJ18p0YnUeBqX?=
 =?us-ascii?Q?0og4aTw+4Ya557eKn0VNsKA65B0ci1agQ9VH3oEwVNuOzEBoAjKPO0VYkj+L?=
 =?us-ascii?Q?QWt6P4RJtmJg3cUdC9pCa4GwsOKtJV9RQgfCGkDBgCAXgDDza4Rc+FRzEMZY?=
 =?us-ascii?Q?bQUTPCxWDndOWi963Qz9sNPgtCfcVklvj6c9CSPODRd9bJmuHhyCo2ZW1mJF?=
 =?us-ascii?Q?3ujm8GZsO2zzW9EZPpnmG7Wm+Z51u3IzuBWIWL99uhw5wZkXV636TVhsU/0G?=
 =?us-ascii?Q?FfnmhqRHeejxhFExBcALIs/9D+HPIaek5+omn6NrJ9WRI3duUSKoa/YqiEEr?=
 =?us-ascii?Q?QmTk05X7SP9clEIlmULFCYZR/5rbb/uqeAECOC+ckNvRJG0OumzzdUSPYX/a?=
 =?us-ascii?Q?lvpqNeC5g/9CAuPbIbhO17Hw8lOEYZiL28Jvp678XB6alDJh7sisIRaO7j9H?=
 =?us-ascii?Q?P0wBDc12gE+JvV8pj7Y4GOnBoOOToQZ8iLMHg6DHwjXkfiJ2J9sxWhbuY1R4?=
 =?us-ascii?Q?4S7rUUW70W8eEaynKGlbiKVbghbu8TbzecTyXz7LhwrRqb374AeLVppMY1Zj?=
 =?us-ascii?Q?vsTmuCR6/EQjrm6LMP2d87TqORCHFJerM3GC3liOZ2giduni5+r6SobWzfFO?=
 =?us-ascii?Q?cYPvw506cZQKC3aziQmry9VrxGhXqq2t//r8blNqKIGZSnoddE+OEFT27j5Y?=
 =?us-ascii?Q?PzLkSPFyxNHd7UQ3RjE4vSMpLu2G3h4MFOL+Jm5CQU57B8UkzSz9YstSAjJk?=
 =?us-ascii?Q?wCWwEJDO5WbT67KMTbbieUraUpFMkY4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6684a627-ec5b-4bdd-e602-08de58521d79
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:23.9528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mOPxsx/+ina9Y4iR/2PQPwCvbsiChfR7seKV5YBRETamC4UeQ/kirxPSmH2v+QQ0DlFGvdOQ16HwtkWhEO8GRzzsxi5E2EPzMbWEVxVx4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696fc9ff cx=c_pps
 a=n/3lZCR83+ZXmFnVV+4wNg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jcMc0Nsmbg0OvNgs5mYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 0aU_quSnDf5jWlsHglJFgKg4qZvVH0Go
X-Proofpoint-ORIG-GUID: LfjXYrosY2uPqdE3noRWNUoYgJRLdzzo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NCBTYWx0ZWRfX4Vrn+uESawfR
 8CdSWRj6OAoaEOUupD9t/J4bmn7sOHUfRLon4Rgp3DmaXIc4PelliRngiIMKew/RpSX7b0P6SDn
 aBdus/k7g5dMW9sJiDSyXu85qGNsxDxZGk07TjYsAxdGs/Fo9Ggd0e7lfH10unmy/FW4YS2DsmX
 mH9iJskBIv+xlkRAzAqH9LiQX8oK+ichxIaBLZcIqtMBDK9OYPuMbufbB+bvqW6k4bZVQJAZLWO
 eNl2scLbSS366XX+vpntUAF3J8kzJkfUDhuaxX1naI/fYcBe6TECalp4JczgNv0JXbMxD9WevBL
 0Z8rP8LvX/PVStMcq+3N0tOTdAZbqxrV6/JxROL2OIt47BZ1nAgUsD+9tQd/PuJ485bFk200xZY
 4Gbd69jds9E+gqo38DmjOGyK0/LVxT7OKNd4JHC5h1v8d6MBvaIt+Iz1OrQTvfUUGRum5T2RkxT
 bMEMzHJd2PXB8xGvrsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229771

From: Harish Sadineni <Harish.Sadineni@windriver.com>

This change adds support for Rust-enabled kernel builds by:

-Extending do_kernel_configme dependencies to include rust-native,
 clang-native, and bindgen-cli-native.

-Invoking make rustavailable during do_kernel_configme() to prepare the
 kernel build environment for Rust.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e53bf15194..4323c4c80a 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -463,8 +463,14 @@ do_kernel_configme[depends] += "virtual/cross-binutils:do_populate_sysroot"
 do_kernel_configme[depends] += "virtual/cross-cc:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
 do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
+RUST_KERNEL_TASK_DEPENDS ?=  "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' \
+                                  rust-native:do_populate_sysroot \
+                                  clang-native:do_populate_sysroot \
+                                  bindgen-cli-native:do_populate_sysroot', '', d)}"
+do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
+
 	do_kernel_metadata config
 
 	# translate the kconfig_mode into something that merge_config.sh
@@ -506,6 +512,10 @@ do_kernel_configme() {
 		echo "# Global settings from linux recipe" >> ${B}/.config
 		echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
 	fi
+        
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+		oe_runmake -C ${S} O=${B} rustavailable
+	fi
 }
 
 addtask kernel_configme before do_configure after do_patch
-- 
2.49.0


