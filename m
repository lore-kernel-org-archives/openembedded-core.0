Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF7FCA5FD0
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12466.1768931665281783998
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HJjqTrMq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K5Y6ho3683153
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 09:54:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=mwjScj2EK+/RakRhzOEpDwEq3zm8izOsaHcpxQ21qp0=; b=
	HJjqTrMqV0qaJ8vcJNh8y7nw+qjarAYXMoKIIeRsWtiUOXGxBD0hlZiFBQ31EYCA
	8ZTiiGQ5dsIm4f2R4bqUNTgIzp+HrIZElt/oXVrR/g5ekaBEtt6rJU8DnJrtwvSN
	RS7ifP4vnnyr3QSOj13wsQxAbqYWYJgVUDVG7hdUvi9bIaoGE2a+Do6j/dPK+nLs
	TFHlIOZqLwfBzrhexqp/R0T5m8KCVvcficQiNIr9R+5iXQdpFaturR7SrMBXNril
	newhwFLiTG1UMiCxUKt/K90MrUxdRknczmwHu88UZK97NhScWQLYFZFzjbLRexZe
	5CxV+/odidtCuRMr+jnxQA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012069.outbound.protection.outlook.com [52.101.43.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bratgu24g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 09:54:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+U6vMXfYoVJjG+jOQ/aKQmIAbz6URfzLR8jScqANmfRmJabGfmHPLf9YJWrOF8KA6RX4DiCURVe2zqCv3tT4zpuyh2PtO4mNIeEg6LvlUQbYj+3Rgi5yrfvCaHS1QDt5OmMyCflAwwq1546oMI575Qv1/5pJPiq2KYIGF/oVyEpBUcaeINkzAu3zC5uvlwF3rc/JiCqWF9tk9GoInoYtblIFyBVnZUWuWAJWYlTbpxwTfpqxIWU2u69BoHLA24z688vmdmFhzYGiADygunJDKB/CyaOuNffsUefmlyy2SexnuOmVDu2mRteO1BedOUP1qvLiWNoba20MCJ/chQIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwjScj2EK+/RakRhzOEpDwEq3zm8izOsaHcpxQ21qp0=;
 b=em2Ob6xTFFKN3K8C56lfiptKq9WAZ/IqRlQpP/cKPpeISAXT9z4hdKXoyAp/nbvt9p61W6Tgrnh0NMyMi0aYxBLxIEbwHPeo6SYcnjeSb6+F3lkuM5maxbJyigQ3onylpevtgbr4Jg9h7MN2VKBqovoaTQhNOhKiMbg1t0ys62IOJ9FcUN5t1dSOHxI//eMPidY2lGAjiUIBtDHTuM+9UTCeMwQUjxrZSTAX7zAkd4yMCSoUNR42XVdrZ9mk1YD9aN1Jp0pz/vbtM1ALrxxZwzGGkY1bTI9QrGmgZtSA9nhhjd40Ia+MTxunFB1gqnOUEharR3IhYjOTaxI5uR2dhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:54:22 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:20 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 07/16] make-mod-scripts: split `HOSTCC` flag to align with to linux-yocto
Date: Tue, 20 Jan 2026 09:52:37 -0800
Message-ID: <20260120175246.2052341-8-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: d87cfa87-69f4-4f6b-f31c-08de584cf01a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dRcaQwOC5LBm1cqq8mo16sHjAy8y6lmbvDvXzHsL2bmolDzgM6mctl7rOPxz?=
 =?us-ascii?Q?cJZRkPZWonqlSkyudeydFDDmOzqxqyN1AzTkUcWpxwYKAimcN7mr4nCIej6x?=
 =?us-ascii?Q?UkK/LeaGZNe4BteSDiCNfaR7sRfONo84pi7kKL2GxFG01JCKoAh0CyeUpkXY?=
 =?us-ascii?Q?gf0T5JQhRyjhGMe5fb69binrzcyoYBbe3BAQ1975TFHtKkWYqhrYsxNCOfMh?=
 =?us-ascii?Q?J6QJ1FCtEgDiTQQzmSLGiUCU4hnTjBXzeVoC+TSYRuL8VMdZ+T0x55aObMZ7?=
 =?us-ascii?Q?zobuOJ16amSieuWfEqfK62/aWl8JEZSE+YQdtaLh0KtPJa07d1GMUTTm207J?=
 =?us-ascii?Q?2m19DJ+B6pBmFWwg3cjwdts37A4V3KPyxvZs3kNts1KD7I7GBBGUvt6/6iEN?=
 =?us-ascii?Q?LQDthKbL5Cez4TOXGpTdbQIARWsoVb4VVTAKFxnZSTj8DuyAkM4US6Nnot3I?=
 =?us-ascii?Q?2XyrjLUqre3Rk3rovAD6d8ldmx8ZIzTn+cFfYWpKDUpl2pJ0Vazi47CXeToT?=
 =?us-ascii?Q?13GeTJtlf69O14LUi15dS9i7ImbQmDtR96eLMhr+GhRh2TE8TG+D5srmTTlB?=
 =?us-ascii?Q?PNPJ4kIRAx84JMsR7fqwyo/c2/lCMGlxhE7HRhqt5CgEbKbbY6Nswbexj7YI?=
 =?us-ascii?Q?pp53Ho7tReLYu4FYnvsKdtu3IUP5I/3fXFzjQJADIMFjS9yBT33esee/bqCk?=
 =?us-ascii?Q?LlQq94Vcinf9xTCRWfxptBC6iaVq6mSWhmecZmD98xWFeovsDi+m9lkjyEzT?=
 =?us-ascii?Q?d4H+PU4QyIdXdU/lEGn4TmPwgnnHitumsoiy6AmNom7f+74I8PGEBl5TfA1+?=
 =?us-ascii?Q?LrR/iV+ISFQl/CyGFGx8eMdfx+zDhZdRgSSXTeKZogiCRgOqULKVK8qgpDTD?=
 =?us-ascii?Q?Y92EbT502GV2/YL/VdiHrsVLFo3pkinmwSwceh/ZISckPAMrGNxGVa0S0k/w?=
 =?us-ascii?Q?Xhqo8t8gMCeogvbKgDDxA5kj5yj1oXb349F0DnrhqwT/zhi042v+hIugUUz1?=
 =?us-ascii?Q?rOwMxfFvZj4PDtt8QRsWJPxeOGOgSV2xtE8D0JIlnit4FbNk9Mvk+JTYeDNC?=
 =?us-ascii?Q?Gsh+ATHzrTw1J3o7/PMIUl9ZjxT2nN04tbIYXuHQqZi8+lheIzRmC6cocvj8?=
 =?us-ascii?Q?lupOfu8WTgxClqIBMZJF77rIvT0gpigF5IJ84RodYtKHZtOGqT5CgCIGWqtr?=
 =?us-ascii?Q?SwEfAPI8LfkejvovMjLrxsXwKYjLmio0XSPOOUqUVNWrzpAQnZeRPvIpFTIW?=
 =?us-ascii?Q?3nIZxNC1X5FOLdCX5JsvWeYMndFPR1hthlQ2kRZNBxOGzOD/aY6e8sbvQhPl?=
 =?us-ascii?Q?8EkyAkYcpbZ3IOSpqmsVDZBwKxjeqIyqCgBY7N9TiUmTFS3em0+9i0JKb9rG?=
 =?us-ascii?Q?18jXw7ZHEuSKQXZP2oFHX0CflmUlRyuJ6sXY6/D44LKWsFNFdOmUxM/dVhob?=
 =?us-ascii?Q?1qfTGiTh8C3BWuQ/DG6gty008IOIrW764vv2Irb2aSdhlyUJbk0i9Nc5OOP3?=
 =?us-ascii?Q?Ks6G79hs+xdASGrlKDIjjJFHXTfhBdyj7wfDamwjsQT4RaIZgb+LiHM9J7Bx?=
 =?us-ascii?Q?bs3Z2lMCwMfl9Wv922oMAViH1sKekIvUMkAu75OLhl0V32ftMEpOwVbf5L5r?=
 =?us-ascii?Q?QVd+GZ128XL6OWwXiPIKCeQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oFVZ/X5NdAedVfG3BZlbKxOewqGBayPp8En3aM8AsJbb6GtX9ayXgoZbg1tn?=
 =?us-ascii?Q?Z01zMdMuGRaqO8XqPlV8Q0oJyAV9QSO1cgPieh7YgOIwDcZjiKcKVjhLR0Sv?=
 =?us-ascii?Q?q7gRgVZkFrFfIYlcvqnfGUGhG7yy8U1LX5lyF6StkkV5bprgZ1QaWT+Iw0iU?=
 =?us-ascii?Q?A0oNHREDLNWWpj1TJIM+9W0G1dMcXDni9gudkaWRY35Iqq687u3FG7MHgFb4?=
 =?us-ascii?Q?aGadPOVTOkqTx1CWj76GvgCad2QQYiyuRPtKJy3mlHEJBxptCfea25euogq6?=
 =?us-ascii?Q?0Zc3j1s4Qi6ZILqmN3MgCZZsyXKIsZYSmJZJy6ViyFrG63fNtdgsvzMd/5rV?=
 =?us-ascii?Q?d0IEHMu4fk628vZ0zcvoJ4sCfqMmCJ3t5ctuX/jUXkMznEW8tnPHrwtx8Gpv?=
 =?us-ascii?Q?icsNaKPsf5t4TDGziEOYF1DIgqh8ZxSuPcH81SVYekDpY4Kf7lKllzhhgW7O?=
 =?us-ascii?Q?69eGoWuwcIw3SzH93DXXBmC/ZkYeDzrnufLDq3UuDFzwPE1kGho8MAacsooy?=
 =?us-ascii?Q?7eX6H4Xy4jbcys/s9TLjS1NX86NhztRVQhChHuKau8AJ0H746I7DFGSLJNzO?=
 =?us-ascii?Q?9hKYjSpPQf4PGdNFdre4QZr1PEkVA5Nsrh7hJz4UNnUFsa1+DEBerETpRoH+?=
 =?us-ascii?Q?/A96KLJeVlVkbeoRsa2KOfTLwHnW0lpLmD9Bd6JJWb8yaKifL8I2zon/JYwn?=
 =?us-ascii?Q?dMR7HDxaZY1DHqLOb2BemsRrTB+ydaTCAYsZN9j3bFD/bQYJcPMD/ryxV0mG?=
 =?us-ascii?Q?hR8/4XU3WiWLVJtrp/kAjGFC3TYUEo2J7nIJ9NskFiZbIaxK3WOC6o3Oh/Hh?=
 =?us-ascii?Q?nxdqLh9OXw02Sxb8IAgNsb4LCOvP4QuNMV5vqy0NiP3UqzqoL1N6RS1c9wG4?=
 =?us-ascii?Q?LYzTUG72OzLJXpybfmOBbQzPgMVwKHp05i9y3JGMY79yKQxOZqI+dNqdfkc/?=
 =?us-ascii?Q?5cJxvG00er8B+s+4PhYxLdaTbMdXLD9i5SYw4cIq3au20zc1oOImrY9vk2Au?=
 =?us-ascii?Q?PU0XAMNhXWPnSJAKC4FJKJ7pp9TpsDaY2nk18MGrG00WDCi3GYQ6O8FVzQV+?=
 =?us-ascii?Q?BFUqJ47N+qEmHJTCAzAeDzswLk9Oqsn0iT3TwXdDLTLmwEHxRyF2KfYiebfl?=
 =?us-ascii?Q?R0lQoo6Ci3/ClbrN1Bp7Ht1LYt1CuPn9ujobltCLzqVACd6fNE8S9L9kYl7e?=
 =?us-ascii?Q?0Mi7EO0qczEG6tOdyw+n+LTr3s2rFJayqxweLgBU8ioQZlf4u0LEDj4gX75D?=
 =?us-ascii?Q?8TCy0FnffYdf99IRcFG71IZ1pccVQ6IbMGuC59109u/tP/3A5/fI9PH/BwI2?=
 =?us-ascii?Q?FqKxMt1fyieZ8k6gw7W1oW3wpOwgfSLJabzF4Xv2fzpcC3Tr86s8jpc15xLm?=
 =?us-ascii?Q?6NsTIZxac0HdzFoNNPm5pzQz0ijJLbEpSgVciC2QqwK8+NYTn0E08mmNsyPU?=
 =?us-ascii?Q?NMC6ND+jTF86Yje3lQOOwVF37T/FASP2HkbMoeo4nbHS8sCd8JXhLKRSOVXS?=
 =?us-ascii?Q?ucejcsQu0mnGzsU+R3BaraLKYLxHdXfGOUr8VaH3bBr2VhDgMYcjCtNN7CRL?=
 =?us-ascii?Q?5T5RmKKd+ScJZy2bx0ZHoSVSGvP7/DnW2uw6wPgqT3796VJ9LUzaSLo6n4Wk?=
 =?us-ascii?Q?WfKVtmQLT8mD9nIglatyVtd1CX/HwvLh1GJ0vlLvEzi1+1rWM3stY77rlGl1?=
 =?us-ascii?Q?jE1Zosh2Ad0suMmFKa1hVbVOl25rmB/jwDm1iDRzXQg8XSAS7hZCwnYT6vmQ?=
 =?us-ascii?Q?GvmBq+KJMpQZIp3D+h7CYwlJAkUBGZ4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d87cfa87-69f4-4f6b-f31c-08de584cf01a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:20.3193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1E0PbD6TfyS3bwFYe/duZVkwcU0V7kn/J5wjY5rU/RGOdExdjihFnLLwaYgxFQtxlEwcPhFNfkIqQNG06bX9DBG8hunJuoGjBbiunj8XTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: TSdk5m4pJiyS33r5wC9VugruZmZP5LkQ
X-Proofpoint-ORIG-GUID: b7fvR3cPHUK-_pEvT6FF1XT04LCWtXLF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfX7Ab9tfH1/vPk
 HZ8BjIsTKeZbxBVPyFw65HdaZII/lBJpoQIfpMWvbq05pIkEn1cgWWTervooV4oJMUBcjlXqLNu
 cKwIWbOI2s1pzRSk4Rd+N5AUKhYIAoloJaPWG9nLoNfTQ5KTMjU5smBt/ojwWw+yyWK8stp9nGm
 TXmOkmhWYiutT7Ck0/H81RWB9P6n+i97I74HXHFmATZvioL4tiTiQCUccbXPSw+B/nTxvgnI/qk
 V7xeTJU7DJKIOhFjfxtLcTKWRoCcNw7TVcFaAnHGwb7zSxIlqFEKLXOA59qrUv660m5puBmecVU
 9MR9xH4QDMAaoHeozpcOiqq94YsDPjJ+yfFLhwHT5KA6t27aFVi59fjQOVKRACg8GA6LwqbszIj
 sJP1crOI9/8HKC0u+FJmGrq+RtSwtOXj3wj7snNYqQzh7iY1aNgnLJ/HRFn0e9xARiiCJoQfwqK
 UhQfpDUauURWsrN/OiQ==
X-Authority-Analysis: v=2.4 cv=DY4aa/tW c=1 sm=1 tr=0 ts=696fc150 cx=c_pps
 a=gkvpKNK0ht0eUS52gBn1PA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=KVLK08duqDOLNOE2CNUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229754

From: Harish Sadineni <Harish.Sadineni@windriver.com>

when compiling rust-out-of-tree module recipe 'make-mod-scripts' failing
with the following error:

HOSTRUSTC scripts/generate_rust_target
error: Unrecognized option: 'i'

This issue occurs because CFLAGS are being passed to HOSTRUSTC.
Updated the flags in the make-mod-scripts recipe to align with
the flags used by linux-yocto.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 8fcb5e6eb3..874e16e642 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -18,7 +18,7 @@ DEV_PKG_DEPENDENCY = ""
 DEPENDS += "bc-native bison-native"
 DEPENDS += "gmp-native"
 
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 
 KERNEL_LOCALVERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
-- 
2.49.0


