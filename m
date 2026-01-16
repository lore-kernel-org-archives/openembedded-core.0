Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 085DCD4A616
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 09:01:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2163.1768554100297491880
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 01:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=r/gt48yq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54765a9f88=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G40TEE2401250
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:01:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=He1b9+Wld
	IhoieLCAu8nnlVwuGb3PC4hZNwAQTOSzw8=; b=r/gt48yqxZ5Xs6OVDGg6L8bIg
	xsiincjXNRqszR0loUeM/ZO9m9ZXISBJlbQLC04RqiRgjDygbs5x+XbElzw+REXA
	Zb5PXPVaLzGDJ75Q6G0hPvOkUa9PLAAh7N1KDFxYcxXYBZigL28TTpvmeruueloS
	EZvcDJrrRQLd+jKpk7aYAbZu9iqlS5BYAnLuucnJdfbLj8KwaCpF25aQPtHNDUe4
	ycpDd3XwWMH55co1v0VydB7aJTjrAaosJZ2qe48CMswuVqvs1nO8CuCEHj+YRbJ5
	WBGwgQiRq382rV7+0DzZqqOsumUbLXdgDJ6aiU9sYeQXEwsFkWtTHj/SL1DuQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012012.outbound.protection.outlook.com [40.93.195.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqd8e887k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 01:01:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvRLgl1dmf16hH0GLjsFHDVwyg9G9Wujnm0g7ueZkoM4fBjW/U/HYPevZMygVpoehf/KdfO9kvvxVnx0z0C0QDc2/FArF1DIpwiBCneSNOYFNqk8kZZsTEXk6rUyxLFDsFbA736/N/DTqDbrnkwYfJx9FO0s9BGX8s25zB9lKKokSOd8rvnICXiViU+m3HReCWRvf5UxnmfOuOuuwwPORi9vibUjZOOuSU8qDNEN0lTqQX9kDBn1VdFkw5USZc9ib2Z9eO66hiA+JdMJaYHD5TsTVkMde8s+RcAbI1Y3mRBCAd84T9NoLqtQ73bnnjQ0ObsFTYXcOvWqjHKIeOZx4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=He1b9+WldIhoieLCAu8nnlVwuGb3PC4hZNwAQTOSzw8=;
 b=R3ueHu2bLRDcpKNEScjFHxUUkuYt5M3/EN3e6kazrF72Afa73YNDLJlgonKWdvM6T5TxnuUdTw4V9OBUsjS+xOLjaVX+AuwM/IFLmMCcotxidgaPigmOY4xDD2qqQI7OlqPCj4ds4fnT02PpDEuZ5NXBUnuDSOT6MMqKuTZVLQ8Y9xqPL1GRFWsMYf3LyI85AjZE404HWdr5NxsVNt7V2F2LrnOlQ5zuGTL3GeO3sFNJO1/24ruubKapO3R2pp1vXu7fkXMQD/b2a7RRdVkn1qBJF2R37uLP6iOfrKeNn018Asu07rrHr58O3aNU/URmN8HRRzsk47JyZETRwc/rXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7619.namprd11.prod.outlook.com (2603:10b6:a03:4d1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.6; Fri, 16 Jan 2026 09:01:37 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9520.003; Fri, 16 Jan 2026
 09:01:37 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: liuyd.fnst@fujitsu.com
Subject: [PATCH 1/2 v2] blueprint-compiler: add recipe
Date: Fri, 16 Jan 2026 17:01:20 +0800
Message-Id: <20260116090121.2432867-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: abae87a0-b184-4a77-4fb8-08de54dddaa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?o1v0dIGwmROKFGloK5I11Q7GXzt5HlWRxeCKTbscd3lBm3ajR/M0CLrD2Dq9?=
 =?us-ascii?Q?9r8WIVz36eoIjK38ZDDsz24qoWQ9tTR8UYBV/sHWMM/yCXpPjRS7aSI51f2/?=
 =?us-ascii?Q?6ONAX9LkLbr1xuW5aa9uT1G2k3BMO/++SP59gJljpu8ZlEECwSkXk1n2CntE?=
 =?us-ascii?Q?5ScOAt3ItssSkCXQ+teNjYBl+8U/ZCV1cmr6tBTIlsFRzUVHkATu8YUWEjAh?=
 =?us-ascii?Q?fm1OHBGRK5dexldmxQNRLWdIWxUww0fa6/XcS/PAERIIigt6kTF/eGaV8rfl?=
 =?us-ascii?Q?i6EVS1iZBgQ7BVVZbrpLiSLsl3nfcq0d7xohWnlPmiTodmSNu/PTv8injiV9?=
 =?us-ascii?Q?X2s2s5I6BzW67VREqN3Swxngyre4s6rqLM89pvQwGKYW9V1pwbmJGpDqDA+u?=
 =?us-ascii?Q?Oq9vTzfbfKxtODDS9Jjd4GbQmJH0dXTrIFolY3cHblAMPX2NAUp8VReyQ90E?=
 =?us-ascii?Q?RpMPnDfz5sxDG+QZX/22PLaHzZS+JhIXsts3gFNnuDVUIovQnI6HqXKYZhO3?=
 =?us-ascii?Q?3vAKzGEPks30eoeaXmdFOfD1Z+LFg0zvSjuqNFFT8naVeS2zu+U3cJB3hj34?=
 =?us-ascii?Q?ffzEfL1m8x/PK5YHHgpLly6xFCcH7MU09ajnrdrM3nNEdV/0p1BzRpDkXQF0?=
 =?us-ascii?Q?OIfDqIy4pLLKrce4HgkrG3mFXEAAT5dsJRZLiKkHABHiAK8NnnwrpUH4/o8Q?=
 =?us-ascii?Q?MwwW/duouP+mmYKfRO5auiAKh9sR9XjOys3phnaCQt9It9p2/1vns2veLIg8?=
 =?us-ascii?Q?zfRYxrLTl3ui24BquOVipmnzwTidmuE8Vvxi+6jrargGGStYKMPVlGL0VSwS?=
 =?us-ascii?Q?CbChG5+scowBU7HjW3A22/Hh8WoZo6BuKj3oTHjOFYkyrtj2KW9rlGJzSlOZ?=
 =?us-ascii?Q?7UVegfI+al6+gtFTkbelcxuJCee6b2BeaVsRIfpevCy9flq5MxcxiqtW42EK?=
 =?us-ascii?Q?xCiMGUzhA1/mrAfYu5Ie86TnqEOb7ivC3WCkqY3ZorzLq7plAzsVS70X7QQY?=
 =?us-ascii?Q?VRPd1vZcOeXXT/9zJhUj9EK6iLuiYS5i1vHNH7figdaUOemlraL0/oFHvs1Z?=
 =?us-ascii?Q?Kns7DWnY11ggEciQ5qff62b/nq3gcBBdwKHNtNAdE3jufIxKFgKsA5k8WT72?=
 =?us-ascii?Q?6nkGcAgb2FoS1QlpDxrJU3kEbIjP8t6e62bYUh9SE/9nt35TKXeZGEBDuyC8?=
 =?us-ascii?Q?wYNJ1oVKMZ+tDHsAb89fEvY5W5NwKPBGF4fSzyW2MKlrCBsJIClx7qHz/G6J?=
 =?us-ascii?Q?pp+MfVqCmg1OJy+5V85l8eDt6scbpGE2Miulpc7mBPBT58e6VbOfFeOWySTC?=
 =?us-ascii?Q?s5ymZbTbmbKSsUIU2gMpVJq+YoRTc8WG4Gcr19w0l63jWb3xi6Uf4+vPhqDK?=
 =?us-ascii?Q?xilOb24pWsdZR64cWLHaG19Q9Mg2w5GYS9vom4E8XeeQ0wyLHA2dnHSdXh2Y?=
 =?us-ascii?Q?c08JBw7Xd+OLonU0Nxz45fimY++dqFuQwaP41g1ARa8j/00LfEZhBxZRLv9n?=
 =?us-ascii?Q?8/5J+Rf/MlJ8b210OcU4B5msOS1HBiFnUs3/ZE+s6jebBq5/N+lSfY2Ka2HS?=
 =?us-ascii?Q?u5wmcS4x2bMvD6M7W3t9NedoNxhdKhUfW0g0S2E3pKSoefVn3bTUWFwtt4d5?=
 =?us-ascii?Q?64vP5uH7ZAeNB6lj3QP5JE0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OqoP0b1ZvSMepnNxS8epC7dH5H8MFBxyXlC8WyVw4lZa/BYVhAk3huOg7kJa?=
 =?us-ascii?Q?M0QqWb7S//CVLyblLJfEbHjZtP9jsgFNezOMx7B69ZSX1gi1fIcXM/OnHiOA?=
 =?us-ascii?Q?K95d++S63xKneOwjiNtnEZZ8PQvweem4fMs9GWem8VYiFDUwDS/eX78+Lvqu?=
 =?us-ascii?Q?uj342efy/QBDUnmBCf3fkJgQkQZYg1Z+kPame3NohqGtZJnOYJP6YTt4QIb+?=
 =?us-ascii?Q?1N/5zqEInJ7NVkUUzeMt/cyfzxyzHvUqmBnBFTEUe+6w2pWDxtaFGYqxws6X?=
 =?us-ascii?Q?j+4LVo0LBOFBWEGC8WIHEl+0KDikiEufmSXBzX7CC+4qWz4vJwx0eXuKKJBT?=
 =?us-ascii?Q?9BewZluLoVpGBTU4h3eR5bIPdmYj+Ps9kPyDqAuMrJgA2tA7kk9rSHxkV1zW?=
 =?us-ascii?Q?hzztlmeRgYfxaxq3SiuMkEzTRpY3io/7mh7L/Pr+TGevuSbGSIKgT9hpaSkC?=
 =?us-ascii?Q?Sh/+JM6H+mRQUCB968JJKULQjqKUg7QtNdtfPZ3ZDjnklpM36LFXMyWULSLf?=
 =?us-ascii?Q?CtYqNLmQNDI73SMbTXo8SKEfzZsf/bDtSMBx4FcV6RVCBij740Z8qIUhJRSH?=
 =?us-ascii?Q?l0X7gIsH5ZVnZdbX8Kt+Ymn8Zcub02oAQQesz12d7wDPFTi/NsrQCE8n4iq6?=
 =?us-ascii?Q?ETFKwhpfmPI7+LCfpjmwAqbvxbNftPZuoPv3uORp8aNJGwQW55qwZJ4z6LJU?=
 =?us-ascii?Q?36Ej9CsYS7WdGq50X6Ke/crFhmRzG8ZzOYeclw7BQPGosQGeM+/tHKlpypF+?=
 =?us-ascii?Q?rMKj3WTp1dX4/rPN6lN/BLuSoIGZl+Lz0IcVENlMHVKVmljJ4WogjbI4zlBi?=
 =?us-ascii?Q?BJTi6blk5zonvSCcHdyNGlpQLklc5IQTk0ULF6jhM4y70ijXqzfTiEAmNXB0?=
 =?us-ascii?Q?cznBtIG0RdbPHfrmXnUC7e1oDuclHY/L4j4cDADsY2eyD6oMBd8c4/RkOrHA?=
 =?us-ascii?Q?A0soDjej/nOShNtvt2p7IFatpeHqyzR+7Dw43pLICgjVoz+JKl0d9cjuA63i?=
 =?us-ascii?Q?L08W3szbuNDpOghy2iZ5krtD/8zKjMSe5wn2b4CIiq6wbACujNCC+LL/rtkq?=
 =?us-ascii?Q?RuVhs0vrtQ9Jpo53wz/iJJN9wFJJKBYE+5T8FHl1Ta0BE3Y+iX4dePyvoB/C?=
 =?us-ascii?Q?0FpokCwzPfbaDxEU45Xp7v3o18vXXsP4vfuviaSKI21Tn4+VrktIHiGbi+eM?=
 =?us-ascii?Q?XwlgOTDxzk3OeZGSB7F8lpD1o8F+ynUnVAEDlj2Ot6a6NghiKX3IV6cqYYa5?=
 =?us-ascii?Q?ZGHT3doL+Y+eN0foHhjzsKNb24CyM8uVcHkpACGly1EScyHpFZV3ThO5eCYU?=
 =?us-ascii?Q?xwAQTYr+Wz0LgFIMVQl835JoDgKfoVg/kjd3CWNXgAjfgK3bIpKU9Kef9iV4?=
 =?us-ascii?Q?Mk11VipmpwZFkDNLVP4KKxG5MiuVXLApORiwAaB6VeKeXXyfAlVdNNOMRE0M?=
 =?us-ascii?Q?QkcaBW600nYHHwmmIL+PwAwWoFPPy2sl4UcTe5qyN7JDQi71iXtSt/rfNa70?=
 =?us-ascii?Q?bNq8X0efkb/HAZReo25U+IahJOxn9EjHsK0XG8bvYogrgl9SYtBu9iwS+hA0?=
 =?us-ascii?Q?cZbgGvmSZFpbfMRwlF3q0N+QlVE/ra1wtWz3V3nPtv6hiX/DPZ+DzbA7Vlyu?=
 =?us-ascii?Q?5vsofTX3zSY19RNHg/NAJe7NVqqI2QJLDuzSzRt6hfMqJBlPHOOMY8SGY9uE?=
 =?us-ascii?Q?UXL5PbwfaCwvx9yLEnwFLKq3+igWLscpM/R8CjpZc7SW6Nl84EwK+qNMFhVd?=
 =?us-ascii?Q?d+dS7Rv9cg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abae87a0-b184-4a77-4fb8-08de54dddaa9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:01:37.0487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cg8WnkpLAgDPf9qDf3D6+lcLth6zfDqvpyEKrFCYHRhT8ZSvYJBKi6SPYU1zI8dLqtYBSIhZpljJQxVEo07ERA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7619
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=U7SfzOru c=1 sm=1 tr=0 ts=6969fe73 cx=c_pps
 a=AUi/O1gD07nBRLizZNiypw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GHR8O2WEAAAA:20 a=omOdbC7AAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=iGHA9ds3AAAA:8 a=2X12lZP5CFuO6KqQosoA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: YUUWpD4e7NMNyCj5b8bcpkysZBYciIwh
X-Proofpoint-GUID: lm2glznZwNOQkBJE1qKL53Heo-_yqr79
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA2NiBTYWx0ZWRfXyF5YU9Wa46Oo
 iwHfVxT7eg9zJdFvrb+FuSmaLqsuwN0OP/4C/0mSwtJYpMvZ+v0TnjO/ZQAG8YGF2F0l2OZHRJI
 KS0TCHxTsHXkDXbh1tGhH8rHjeTv2jBfYRW23lWwVhBz3gN5HC0c/afam1CVmcqS7JORtl91k3v
 0qregPJf/CKkWnMULJLbaoHNdwVDCSOxiy12MfaiSr0d/9XVLqQTRSR03nmnYeCzlxxSJMMLEgK
 3jnPE4GNxIEr5VjsPiBL/elDrPugqrToGnCEn40LjsHPFGYYnbt5P2uA2VThN3UhZNSgLY1c7kN
 e3b9B/Ur/5CknebuK9ltemstlSxwgJm+P4r95U7mxjxOEkLOUpOfvUJBtdp5WcCYTN6K/BIZF9b
 L2t1WVIu0LoYFM0RfeqEChnw3G4Da9ikzNqn2/5AI9I9Plrzmef02hpCQE2hempTs8M/s+TZ+LH
 ZSk9nNMkWFvUrBw07pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229524

Blueprint-compiler is a markup language and compiler for GTK 4 user
interfaces.

Move it from meta-openembedded to openembedded-core as it is required by
epiphany 49.2.

The original author Liu Yiding, is willing to continue maintaining the
recipe. Add him as maintainer for this.

CC: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/conf/distro/include/maintainers.inc         |  1 +
 .../blueprint-compiler_0.18.0.bb                 | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e830648945..b231daf485 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -71,6 +71,7 @@ RECIPE_MAINTAINER:pn-binutils-testsuite = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-bison = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-blktrace = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-blueprint-compiler = "Liu Yiding <liuyd.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-bluez5 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-bmaptool = "Trevor Woerner <twoerner@gmail.com>"
 RECIPE_MAINTAINER:pn-boost = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
new file mode 100644
index 0000000000..10ac93d452
--- /dev/null
+++ b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A markup language for GTK user interface files."
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/blueprint-compiler"
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
+
+SRC_URI = "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=main;tag=${PV}"
+SRCREV = "07c9c9df9cd1b6b4454ecba21ee58211e9144a4b"
+
+inherit meson pkgconfig
+
+PACKAGES += "${PN}-python"
+
+FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+RDEPENDS:${PN}-python = "python3-pygobject"
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


