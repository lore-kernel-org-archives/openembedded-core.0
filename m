Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31FFE92709
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:33:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6443.1766835230393029583
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kaxTBRER;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBUHPt2167583
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9BDXHt2bsA4L6nYWybTJZnV4CIB571q9JgJaGZpfFnE=; b=
	kaxTBRERcaqNCmyXJHNYAnyNTUgoLJTeW67o2vNDjN5QU+KF01ql/KMzthOoN9PI
	NlzWhi6VmBF5GcWokPobYZ0vVQdx5DqVsms3XT0E/A+J9t736uYEPSEz7hg0lrnD
	dK93bxFqmSw/PS9yfR2mgtfIKYtbcUDR3rSz6PkhB/9ntqf+kRmiGpzmKTyfVRa+
	mVaVZFTidsnAtr8Um1EELk80l0vShh3zhtku1ycsoZlzGybznuUP68zGejMAp2EA
	0Inl8PTC5q6sM3FqsYPzejE30QQQkUh6XlB9YffLAq63dkRl9e9bdWiW7x9IIQ8d
	GX9F+sdBBW5bUpJLRnN39A==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011020.outbound.protection.outlook.com [40.93.194.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4r6v1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 11:33:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6zTlmBq1a/IR1zAi3vFOHX0d+EUhw6C5Jed2R3uXuBmU+GCkGssm+TIQjmp6Cfj4v3fjHERDiutH1Ubfo29PsI7Bt+808k/CNdbxKeOqagbyrNSppId87FTa7fb+RgojRz+yHO/AANgeBxm4h0AUqAsCmWe83C1Xiiiis2jBjecNaioAt3RYfvS04uKwlJkX8vymAcH1mFl9r4hKSdhUwTEBJOrOC2C8oqkvMNCJqTjiR5+oGLooB2zH3lAqXQV3+gK5t251kw9/CG4xBJKMNq/piAzzCPlTuG0PISep9moAv8ySiyC0/GbUIFr6VCpMnkbDrv42RVPvTcU97SCnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BDXHt2bsA4L6nYWybTJZnV4CIB571q9JgJaGZpfFnE=;
 b=mg3M9DRV1emkIHN1GCFwI8tYE61Wb0IFFqGemsdImI3wvEaCrghKqu0GRViIUMYNqd/sCsxn0sZheNek4aswayaKreAGrvB18Pz6331sEDbnDLm9p+ecrzny3PF0kRrDbEtmXUEPGolKrf9Ezrq7mT9BdGm0J00mTV+g5oKwBhM9FoGA14Ne8js+74ub7R9T2bBWaviPCXuSIQxeD6F7wY2zRCsv1kgEKsiJd5zlePMI+sDvfbp6/9UJoPYJ8dQrvL1gqUyPJrSvZdAsSnewQ+z/DQJdEMxYKRwyUvSmOtcOYuovv5A1qNLGP7tsiWrjBG9C8JXpFcUs1Nmc+vHJpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:47 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:47 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 09/16] kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
Date: Sat, 27 Dec 2025 03:32:44 -0800
Message-ID: <20251227113251.773795-10-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d915cb-7782-479b-74a1-08de453bccc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bPjtGpHglr38CArQzmpKLJLFbqeSoi0w49D49yUEv7Khn70MQZ+TwpocA3UC?=
 =?us-ascii?Q?hnKA2we3i/Zj8vNghoY3F6dB5isK5ullKAjPr0nPSTRMxhvsgNNkMUfBy24I?=
 =?us-ascii?Q?uMbaH7cHFu5CkV27cOiGHJbgLsVN8iaCr75FTng+6Y6zvQeELTvoMg+M4UGP?=
 =?us-ascii?Q?0chaOXpiAUO0NYPUeMEfYa3ffruqodfZnS0t8/93n8gE5Y/VM02lbjq+zALe?=
 =?us-ascii?Q?xx7J66LN9n5/shpi8a0J+VGDl7tWr1vgGlX2wd2WoC36eETkYr++XG9/iGQr?=
 =?us-ascii?Q?7qy/jeXk28j3JPlNgvlqtGbx+0NGJm7LUo0XVy+z4lLK40i2WOAYD+k53V+O?=
 =?us-ascii?Q?K80XzaYC/vbL6W6F4+6Q0jQOV35RXSbdHz7dWwikAHpsa7gnn5kc0DzElgmi?=
 =?us-ascii?Q?QoAfgcq6z9nBTiAOEG/nsw6pC2VM/3jdqsp/6Ea8AcX5XpSOw7sQe8z+vYIX?=
 =?us-ascii?Q?RLwsTRfhXr3Ql+uw+p+y9YbpaE68lvqiuXkyLvi1AlgcmIXlV+LWuG/JSW+k?=
 =?us-ascii?Q?TSElyGRsd54WEaIbxwDzsS1da3vd6RqTE5z92e26tfbe6gjtoG1YkHwDVcGH?=
 =?us-ascii?Q?8ZcSg4k7h+2zTPL+S20hdVqkBZXqYvrCDnGWo4ZJSsAv6aBpITQHXI6BILuw?=
 =?us-ascii?Q?WY24TyuI0Mdbon5CfmTgHQRCBgI1T5iIqYwLX0XE4h4d4dL+5SbE0IhU93Xu?=
 =?us-ascii?Q?YW4p5sjM1qlvXvl3RLGmz/EO39d2ZEqnw42Wk6ZKxXFAp5UFhfrxjo5Z2jL7?=
 =?us-ascii?Q?BCtmaZ6SaT3Mh1U4jPmNuEJyrW7MDzKHGLPG/FBIQkyGre4HRAIwXZWI2XuA?=
 =?us-ascii?Q?oTm5HFtaUtab/NC0UEHIky3u313m6CrlzXlRBypCThyNsUio8TmY27YelLYj?=
 =?us-ascii?Q?+X5GelPoT6kYMw263IiwLrJ39ODWFaj9+tA9lLD9L1JQZYuIOKBaAp5xEH6O?=
 =?us-ascii?Q?d422oR/bN2MlYv5fPHGPiQjaSOMgFk+zW90Hm5fY+s2gC8MNnqUYRkl+0cvq?=
 =?us-ascii?Q?SUPbWuFkgDeb1LLK8a3m6ZavvuQAe0okLv7IdIoTH42fTB1tivhJbPyKBGRd?=
 =?us-ascii?Q?sumsC3PlLSHPNvh3K8RXxy2taVygGXfvKSGUb1QSBQ0NFN/y92t924t+tept?=
 =?us-ascii?Q?qW1rOSBLK+nEZ/Q2Rw1Tw3+E2pd/acw01dpVBzVS0ktc9r7ENKd4CaHG3Rh6?=
 =?us-ascii?Q?en57iB9cLBzQOeyeedAQifW9DwYlBXim/ih6gTvtOUYxKyi+afLudrZNTQ2o?=
 =?us-ascii?Q?BZpj3TDlINXemG91QGtA1NuvWYhwE1p1pXEltsiik4NM1n/ZeMOLYfqHwwz2?=
 =?us-ascii?Q?R07I6eKFpGp74sY5cDVMdABbMScIlNrPtkgSjjiVAClsOh5BlLJoqxaGWOnN?=
 =?us-ascii?Q?b6D1u0IcjzVdz43soeOHsfnJQd+NkTzi4kH8QLEmGmfa9p2LYzi5JUs4Lwqh?=
 =?us-ascii?Q?Jy4RtsEWwczXuiGMQ/FgsWNxv6hXsR7pKEo2YDBM5crKr8xfsvvIGkq95OkV?=
 =?us-ascii?Q?m1OulNvAor/tk7HGnfu5k87cUsF9xPbl+w/t?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MTStMGV+S6W/Rc97xcpFko/r7ulzoFZVes4gFvOu4VcDqs5NAC/jdBEYWABZ?=
 =?us-ascii?Q?RzL5lelWwSfe/pKZ+qhrcT6rOHc9DZD28A9gSoqeovvnkBkANSMD/wW70xUF?=
 =?us-ascii?Q?rp1X6NTZRB70jnStjTf90XRANfV4jA4aU+7Jw7dfA3gvmai5bKGiciHj/9RX?=
 =?us-ascii?Q?jTSfZyYuVzBOSl+M3YY/9kQ125bxhFYQk4PeLhDYgXcCFLChXN92OuQeMkWv?=
 =?us-ascii?Q?9L/9jCoehC07j1AtfrHmucsw8xMjpl5Lj48SqzHPE/2ZAQnl1zJwPfbznSDi?=
 =?us-ascii?Q?L+p8PaSOcxku6LRwh2UvMPy2XYKbcAyg1Gw/ODoSSSCw4jPyXhfxo8A2QaOq?=
 =?us-ascii?Q?lAm9ae82488yyf8M6BVkkQuxmbbTFDFb91xKzqr0wDE+V/u73+jyUpB4PUlC?=
 =?us-ascii?Q?ZJOzfxqZPa+U7ZPkVjrwIpLyS1Bx0Lg8aV7Jo83foZZMDkJVZlhAZhDyShPd?=
 =?us-ascii?Q?fyE5BPw7vGe2lxf1kXdBN1F6A5bDALMq8YPLjoFWiImkpLfZBQGrammh67ef?=
 =?us-ascii?Q?vfqwUWM0l/H3R2cEUkd8HuaMZRbYWq40iVCz6xQetIdiXs7iKcq1/VzMQKh3?=
 =?us-ascii?Q?u/ZdIjZ0HxQ/Q5QIta6TaKQTcDjCNnqeVNuAPrTYE92POnEoPGzwB306sMdh?=
 =?us-ascii?Q?vv+R0qCHLMewEEjVlCVHYjAMrj9mMdnuBhMm2RFPMkPzg7yioUBSsj2abkRY?=
 =?us-ascii?Q?Wwd5Y+ls53g1WqdCSeqLB4sx7E/sS93sngrH1Jasb6jlXVUdF/YoWaB4/Z27?=
 =?us-ascii?Q?uBjTISQ4YI2WYiuO9t9zslBFcN2Qn1aFdCnd8CkjXgHRNff4v/2jcnN77sEO?=
 =?us-ascii?Q?S5SStek92/G+L0ouXXe67Q5Hy54cRm/pZ5NIX/j4jcy5axgOqKrjPMEQul5v?=
 =?us-ascii?Q?nYyNIhk3sFUPu8zsZWmh2ginPJKdYRq8DSUMSA4myN0M9Kkmf4RfTPSI/COn?=
 =?us-ascii?Q?LHv5e+VeWbzP0J+MaILAh7+UBc4z7yrFIRSr0DrTvLyjkZG5nLKssX7C1UIW?=
 =?us-ascii?Q?AD1b9tipBJ9qMc50qzbygtWCcSKVqDWUp/Coktcv/u2UcOK7vbbHc9tL1ZCC?=
 =?us-ascii?Q?xN5oYSbwHegXvif+mokcaiXPE7VClnnVMNP+ztHQfFUorVTKgmYHZVKtPYRF?=
 =?us-ascii?Q?BAYVRw4fThB996rTSGZCTQBzjSy3wuncee86LWGgslHXZTfJ9zzWyEifoQXU?=
 =?us-ascii?Q?e+PpoAFDeTmJ77FUiTbRL75Xanlhg0BFNZoc3t+FRRLcqEeUBBtyLvsPw0/k?=
 =?us-ascii?Q?J2ceJ3MvzOUFFkexBgJ2Itv3+vhC+kNY9LtIO47e7QrbAEZYRaRGQMsO6REO?=
 =?us-ascii?Q?fvaSQNGx59iBXWtmTOQzrxj3f6SXE7kFxOw9iO/MU5TDb0XRLfBTsrnizD9Z?=
 =?us-ascii?Q?ZKTfnipFJlfhFV3+THWE6hf83SZyqpYja4pGS8CnAI4RN/IelCtuLRdYrUjR?=
 =?us-ascii?Q?LLXKSs6Tlc+wR59cdhUhmDSvjM2RsZXx8MMUnh5w8/PTUGHQqmpvdch8Iesg?=
 =?us-ascii?Q?yNyaw+kfOuYTyLZFatpRzd9JwYRa/6t3jSZri5mxti5+CBY0FrKpzSMrK9dC?=
 =?us-ascii?Q?8Yp+6mmbyFL11xjOp2Dvn6sKSH81mY2BGxFhiG6IDsheOhYYnpkgixHqzMeM?=
 =?us-ascii?Q?oPXwPDcpPbofC+xPKG+3qRSRmDwHyX7UP1wJ0RCh5rQdJFGOsoym7Mzba1xb?=
 =?us-ascii?Q?IHC+1yjJ5DMVmoz3mxRBSNcRKqp0oZFPJ2dfmiq9vE65zey3T1TsB+jG8Nx0?=
 =?us-ascii?Q?HvSPw2RO48Ip0xRGfXhjf9zbc4xXb84=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d915cb-7782-479b-74a1-08de453bccc6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:47.4799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZHPZ+1DkapjA5wAk8sfXPDyr5E0bR/yvBG/HDiTipPCQlgm/cZ+oYsouwgfBy/oBDP/Usrpt7/EYBdW5EItMZxVcuuOiVHHVMF8Rmr/ArU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 3Hw54mBoe38Sr32Aoq2NOldhXTezoiji
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=694fc41d cx=c_pps
 a=ut66qxPycOxoCiL0Gbz/2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=1kRfWWIhwYc51yMvilMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5PZAdm6BepD1XYBTIGqqypFwtbAAuT5g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfX2wM8NBsTKLt9
 1uNQpJTht9DedV4FohWbqptPHTEOoZXnCd49RfO7MGAKVpRmiyoGP09/mpL6iojMwUC+iU/AThW
 EkO29Lgt37fJ8JB4/jm2FqJMPYKdDJBd+F7Yh2zMepYk7DTZ8y8KDq1TnCQ7SNSH0piplprISn7
 OVs2vYoI3yvk9RP6092g+EyBhyWML4JUQGlY4S2Wi3Dmp5xUHNIX+LlWoQKXOhu70OP1rv1mjkt
 FMY1in1UW1XVUC09eqKfuBIbd0KPLKNeniOh1mGL9RJ7YX1qVEd2aBcu3I65JrCe7S16IEtKKJc
 9jIitcm6V52qVzCBFLlJ6cN9mn/hQUxqTpbobX50bwPlZMOtWyxgj5cT+R3yygDupISMv2aSxhO
 Q6tb8Sww25tKRlMHUepc8uQrGQ9xw6Q5YrjbsgvGiARn9+chs0mLY3XEDoakftnkcfpO93uCbZM
 18N7sRX34/TZwC00SUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228563

From: Yoann Congal <yoann.congal@smile.fr>

Currently, a ccache enabled build fails with:
  |   HOSTRUSTC scripts/generate_rust_target
  |   HOSTCC  scripts/kallsyms
  |   HOSTCC  scripts/sorttable
  |   HOSTCC  scripts/asn1_compiler
  |   TOUCH   include/generated/gcc-plugins.h
  |   DESCEND objtool
  | error: multiple input filenames provided (first two filenames are gcc and
.../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)

when using ccache, value of "HOSTCC=cache gcc" when this value is passing
to rustc, It is thinking gcc is a input file. when ccache is not used "HOSTCC=gcc" is passed.

Disable ccache for kernel build if rust-kernel is enabled to workaround
this.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index c3e1137200..43b440e721 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -34,6 +34,11 @@ RUST_DEBUG_REMAP = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '--re
 KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
 EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
 
+# TODO: rust-kernel enabled kernel fails to build with:
+#  | error: multiple input filenames provided (first two filenames are gcc and .../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)
+# Disable ccache for kernel build if rust-kernel is enabled to workaround this.
+CCACHE_DISABLE ?= "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '1', '0', d)}"
+
 # returns local (absolute) path names for all valid patches in the
 # src_uri
 def find_patches(d,subdir):
-- 
2.49.0


