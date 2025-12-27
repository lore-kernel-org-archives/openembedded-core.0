Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE94DE9270B
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:33:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6595.1766835234028211002
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:33:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Hb6zeHmW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBUHPv2167583
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=jUXONzz4P67x5nLEqTEWIiU6UVB9l/81Cl93tXcdHLc=; b=
	Hb6zeHmWGuE75qYMePi/uU8m4lYJ+gil7ZJIfm28Ipesw9VcExTnyEBpWq4TQQ0O
	/GGPk8F7ToYaGp7Y8Aa3mEzOecWQmMx4RpoIURq0LfCkQUo25+XRq55iVOeWPyFe
	T4uxqIkDO1gQTaue/+52T2r4px2upTu0wJkq7FzAFWIc8ekgZ7cXEuu470zerqeN
	WQwgSO1a97Qp5gF1/b59IWu2Ob/kTOglbcAVtGmwE8jk6/0PNH5PpgcbDMS9E1Yi
	bh2cLrybP2SFp0AFuNgcHgNg1axCwTm7c92ojtbyEbHFsTRRM7hBqMZCiGQs+Xvt
	Y3DCUtXAUTqMt8IYGWv+Ww==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011002.outbound.protection.outlook.com [40.93.194.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4r6v4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 11:33:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmgqPSvYPl+ldAACto6cd/iO3N542bcG7KoqezbBV3xGnBtx58QBIAp8nyeYM35PgkaW+lVQPqM6tHAIiZJyiZqqUr+gUjeFCULczA+ermjoiI1chYExq2Vh/3TbiuRE9dhBJ4FdAEq4u1ufokTiXbgrUiq/y7pcAnLMOzGEMwQ0AsSkEBW766Sl4/BcauEEUCUpmQE4fdaWOCkfDQpcBAH1NLbn4eGG779w5+ol9BjEm0BPo1Po+/oKN3hNpNp9ZZB3h/cO2oyW1FnAcuGBfwUVkTqn/9WDtqvP1QVtLzvKDtG1C3Pi+RVqSKlnc7qRwgDlr63XeYiZaHLbHKkkpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUXONzz4P67x5nLEqTEWIiU6UVB9l/81Cl93tXcdHLc=;
 b=C5eSGHaz6448kyUlbllHTVngSdo0hphpLgD/IfL6ysedhoMjB0mB7o3MMW2Re4mVo956fZ1DTOS0tiDQ9nZEJdA808VH8++iGyiOasTidQczDJDDcA1qV2KCF+KyfBA7OnAvqfiyHA2EFtI/t9esYrlpI7f0GNFLoq2ibDZwaASEbVma06UMMLiunxmI3u7d1YwPMZRxcYgW7EGWb9e+3Tq4VxYXNwlDZ58ihBlx+apyilnMeLCduE2pMua81VTkz/fS8tj+qrGkBp2sRpl/MiLF73cD17TrhUZ13j8bSCfioVH884OG01vYvuS+Uba1qa8EoMKYdhN0PBemzlgdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:51 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:51 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 11/16] selftest/cases/runtime_test: Add test for Linux Rust sample
Date: Sat, 27 Dec 2025 03:32:46 -0800
Message-ID: <20251227113251.773795-12-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 464bc264-8963-45a6-a930-08de453bced9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?66SSUwTjq0m9n+AL8JayAl/oHQiCLeCL5g5o5nxPJDzZnOb3Js3lXQe3YLmu?=
 =?us-ascii?Q?XOWPW3UdSAYvyIbyW/uqPG9zHEOoPIa+S4U78TxUC2ERXwLE/fhsFnikTly5?=
 =?us-ascii?Q?RTMaaZBJLdd9OkJfYRJ3S7jU9uv1lmgKWJ2It4FYs4n+g8r1u/CwLFl/9LZf?=
 =?us-ascii?Q?T/44Unl/xq6QgvqDjnRVVg3WvYbGSDY5MdB5FN+5hiegiKrWNsq9nq56e2dx?=
 =?us-ascii?Q?C1tIX+VdKu01MqYWv7e0fDIb0BDDycS5Eh9lbDGWyJiKLzGoq86QW0tF2Qgp?=
 =?us-ascii?Q?5+6DZtbEJKE6PRhqQ9Ru6iZKVDBZMgKvMPxS5GCIjU5zPJ64Crc8Im5jrKoa?=
 =?us-ascii?Q?hegTbiz1D4QFLFbBoqBvllta9g2rDZC626iFuNC0hdHgbtGPYhCp0kyGTeCk?=
 =?us-ascii?Q?242UnnNr7k2+hnQEz4GCPg8jNf9pLT40cePZSKVAuB+9B0D6xceKBr0SWExQ?=
 =?us-ascii?Q?azbEF4lpRS4KJ1Toqpb2fT/31KmgJIAWGs6ZkPFhZwVx/zEQPhep7dE63fNk?=
 =?us-ascii?Q?LwjqpxSlIUzRt3NviQWHIv4hWRkG6W8rScravNKGayoIdcErEKaomcwVK1CP?=
 =?us-ascii?Q?YT/NIDRa+4EuG9q5FmPidg6Ba5/pwX/9ujvak5Tq444aeEGSlhmTnWQ7+car?=
 =?us-ascii?Q?z6Mscb047ZU3u1OarnSoqtFozf4UsVTc3oYai+0ehT3ilrCmasaAughpkxWS?=
 =?us-ascii?Q?CiYLymwdb8Z2HpmBoftDuyPaPfn9Cg9F0sQnOjOhOaSS8f2Gwym4ZCpQaQLk?=
 =?us-ascii?Q?fvWRshX/CNNtCmL1p/c2gUiFuEXa/QiPeA7fMiz0I7vQKrWxqHumdXqhiuzV?=
 =?us-ascii?Q?RBn62mk7Seqt0BI9IMtC6DRZgMI6KrwBWXl9p4chNEQVn+usTIplZXuERQkt?=
 =?us-ascii?Q?RrJSbs8H7l3QyxCT5X09YTA/xRsjY+hG7z3+W5wCHjyNGXcZu9L67rvd4wPA?=
 =?us-ascii?Q?uarkQ0Uk6IId7NMj3HzczHcvrqX1l5kfmR6rz6Qe3tnYbxXuegjfXJXBMXBo?=
 =?us-ascii?Q?rDT+r3TsGXPUOva0zomWSbRJy3+tRYAnYtwA00hMC/KDA9dJIvPV/PJ1rZNA?=
 =?us-ascii?Q?pyB3E8jGvXdxhbD5PUt7CQzKyJbw3XNO5E/+57cIi3tJHxwx+VJ5/yOOyXTT?=
 =?us-ascii?Q?DRMgSO2e61jLnlhYheoNRu/UDPexC0/y6o5X6GDGp7jGQjSGjP1pUQ+9UX/i?=
 =?us-ascii?Q?IsU+pCMdK8k/D+5vusPy8qGfDf+u0OK9T2F9VxaDxUWSCDpjAQV3nEWF0NPq?=
 =?us-ascii?Q?95ksriTnQmQGoaqbzjPhcYyWZxIAV+zC7zxg6rIwn2+Q/r+vLW2+OPtTZpLw?=
 =?us-ascii?Q?gt1Kl7NpQ0aW13sM7qVPMplCKW0noEyeArACXWlmwvENLaIB6tEndFbIhO33?=
 =?us-ascii?Q?8AFZuWAPS9621DsDi/VelEg8aX8pE5GDCyGZdVuziJX6dfnqU6rEW83MITMO?=
 =?us-ascii?Q?nviyGKOlyglqe8fmtXtR3id5GoEhpOnFziFslVKc+ji8PaJZcoZikAuvBHBh?=
 =?us-ascii?Q?RN0BVsBcgQq8jjBbx720TMuR8LMTihdDRl+x?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?19FC/vFm6gNV2s+79YXkIdKbDTF+tJbLv/Peph+Bibl0dmuEpRDmWpzUb0e1?=
 =?us-ascii?Q?FvWIcWuoBYwRNoprB0gXH1mcNW8315/wfgmeeNuPAoJU8r5luuVVNLP+NAeh?=
 =?us-ascii?Q?q48nXEfeDSmn/qTFaYgh0JaHdXcP3kE8cl6mXj9QfjnlribowldLgeXYCwq2?=
 =?us-ascii?Q?r8wLEw5Axp3RpEUf1621CoAYYUb+LrOIVWJC1jMwGxYWeN0Vu5CK/ZV8xPUO?=
 =?us-ascii?Q?uwa0duF+0cga9v4NJvocArb+ngm+iuiBmdUK69djo3ku3zP0gwJ0HlRF2Ugf?=
 =?us-ascii?Q?8tAy0Myu+9n4BT0M8PWFXgOytc1B+PpRs6zoLFQdybnedarh7LpIW2ZrKSsL?=
 =?us-ascii?Q?heJ5NLddeSVpYzSetTUyiBVe7zzaur7DArdxLNLNzahr/geHPQmwcGXSlzf7?=
 =?us-ascii?Q?HZyWKlw07w1rJNyg+08idDBn0vXw4RemLpVyQcJf7HrkLGSDL8jNgqo58XeK?=
 =?us-ascii?Q?wiSs0dkwm8eQUm982XAbvyE3jpOjpOvqwaQpKij6LmKS7kbdWf7Kbo3JQ/CB?=
 =?us-ascii?Q?Ah0sPzqhlXhTaEdHAp5AnGDfW9XYN12naq4ov/JL5Uq0LdgHgjBHJzhI4q8F?=
 =?us-ascii?Q?2GE4WD+7+VzRrmSgrFnq+HB6KEqzugotoWyf2XFsQ26S/kvqj4cGzGPSJU73?=
 =?us-ascii?Q?CWVSgdPzb5pjHojMrE9+ilzS9YETk5Zi94Q6Xm2olw7weCyjvHpTSgJcD6cO?=
 =?us-ascii?Q?1HEEAEiaCae3M1CRH8z71g29kVDOxtjgTqajbBrhieJm5cy4GHyp5hqRldcA?=
 =?us-ascii?Q?W4SZ6szHgJyoDdx3Uiq3LH96+4WaZw7qpqekKrbK9RNR8TAQ13Y6evj8Cx4O?=
 =?us-ascii?Q?s0j0eAvwpTsmz8tkqpxy4TnEVrYfcLhZ2Jll1Asi5QydrrtR7nnF69yHHJXb?=
 =?us-ascii?Q?9BI4hf/QkUilerFQS4aLt16TYlZo5rJlgv2uGm77KEXXWiEjS02kZu6NiLMw?=
 =?us-ascii?Q?GEhrXownAIBcxfnX9cDvD/QThucmzMlkI0qEXS27bJJYLw4tOvFWRkggP4y5?=
 =?us-ascii?Q?CdwRd2B/hL3Rd2Xpr3RtjyWKHWGG9msrnAuXqS7xS7mMG6phTqxwssX6+80G?=
 =?us-ascii?Q?Ibf43lgiLIVHBY2uXi0v7mRZT8/jd24r8AAxTOm6XjmPm68tYJO+TiQtxygs?=
 =?us-ascii?Q?9kd5dVbrAoCjkBuZlh5Z4pD34xy+HmaoEBDrnbMyJYeZswhJcbl6I5AZPi0T?=
 =?us-ascii?Q?2VwT4q4z41qdg9jnZmktqi+dJeDrIHrIcBYonWH7edX5SwCNP332HglJzcaL?=
 =?us-ascii?Q?2ZF5KvPkvo1X/9EpcefKmBFBfe29Z5V1On3MdstnLWyxSzK7fvKsJ4VVbqOO?=
 =?us-ascii?Q?MemmtBer2dzKGQXllr2t8pjLT/KQvdY0ZdkOTrP4K7BXU6J0U1cjkHnaedWJ?=
 =?us-ascii?Q?Fw1rVRGqkTmnFvOKfHq7lL5uUYf5pTp/mLcyMOYqvI+P9T51Ktw1yzymsETB?=
 =?us-ascii?Q?0wu6zUBYsHPfQ28xsW9ixyK8ZV5Iro03tnya6L5pH74PjOBVrPJtGJQ9RHR1?=
 =?us-ascii?Q?l8mTkmaE9oczo8muLtebR2f/QH7i+jLRCkZ0Hd3H7eM2fWWLb+c9oYzQa13I?=
 =?us-ascii?Q?iw2jbuk3KZyG/3AGwmNx3EdiznJhCi2KGUiPO/kmQekiDH+MoADVExEnWZ1t?=
 =?us-ascii?Q?pvT/gtwhK2kJOdTqAZMJqrXxZKCHInBysOWWSfQYq0synVSn9FeDppaH+wid?=
 =?us-ascii?Q?g/hnFn1Ygutyvp4RJGxYRmrmJol/nXpU25sNDgFXv+dZixw1DOKkeIinfPV8?=
 =?us-ascii?Q?KtQ7Ft+PCmynC4E20UXpfH9E4NT/CC0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 464bc264-8963-45a6-a930-08de453bced9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:51.2011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQU5dZXZmKlvLnY8Ah18VT/achS4Q9yaYhF6MJ2uy/eFNNDpkdYY5OTlbPIn5JM2ocaxp+HX7djqG8tzHrB25sUsY3yYYOUHxt4NMUPBh98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: sYhioZFfG5rcUau7JWaNXqRSBt30qV4m
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=694fc420 cx=c_pps
 a=QA4htdGqYz999Ta5EyqdmA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=p_vdLtrgfc09iYJXKugA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: MwagafcCLUJgnIzY8Q_8xLmQO68z5Kax
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfX+edlQJgo5rpX
 e1o4+TKTyPLuoh4fOHOX4R9wpJSeQgs8B6glXCZpRDEsOsj4ZZQ9PxlOaWuC8Zmj14rgjNPAoq4
 C1QJjBeyRmc00WLJdMtbbhkI+AnWWOVJ7tBFoZN6Pfd0DcLKQ8F4dA6w4H1FtWE3ybM7BG+th33
 EVhiRgcXfgkGDwWY4k9wilUZQgiaLfYGdRvnBlHKCwiwbfssz1vyhOk4Co5NCDeQT+csbCxqTMF
 kxAh2Ye0X33CP7gO7l/2s1uEGZhWvhRiANX2GdQzO4z+yOjueBanTBdwUbQmuyHZHSHSFSkvUbD
 EggYtNrxEY3g83wOgaPsEAVyECU/z9d9CzzKeELVV2l77FIPNAv2D+5G3+6rkYUG6f2ShINCB79
 Ixnm72XOAE1xN1RAbjJEtR0NExIRpYa3+t218+FytQGePCsMnYyXr2RfYt5k3/VjZEZb2s4qSoG
 uvF1jYem9ezotrb3qBg==
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228565

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust_mininal sample inside the kernel source
tree is buildable and works properly: check that the module can be
loaded and that it prints correctly.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d58ffa80f5..e8374606a4 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -481,3 +481,28 @@ IMAGE_INSTALL:append = " systemtap-runtime"
                 cmd = "crosstap -r root@192.168.7.2 -s %s/process/ syscalls_by_pid.stp" % systemtap_examples
                 result = runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap  syscalls_by_pid returned a non 0 status:%s' % result.output)
+
+@OETestTag("runqemu")
+class RustKernel(OESelftestTestCase):
+        @classmethod
+        def setUpClass(cls):
+            super(RustKernel, cls).setUpClass()
+            cls.image = "core-image-minimal"
+
+        def test_kernel_rust_sample(self):
+            import textwrap
+            self.write_config(textwrap.dedent("""
+                DISTRO_FEATURES:append = ' rust-kernel'
+                KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc'
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+            """))
+            bitbake(self.image)
+
+            with runqemu(self.image, runqemuparams = "nographic") as qemu:
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_minimal")
+                self.assertEqual(status, 1, "Loading rust_minimal module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
+
-- 
2.49.0


