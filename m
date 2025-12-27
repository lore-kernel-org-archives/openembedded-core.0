Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2053E9270C
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:34:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6599.1766835241782877025
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FuRExV6q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBWYfm2171288
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1hgkzVh45fB8yLND+Nro/r3sd+Y8J44QlEFsNoxIiSY=; b=
	FuRExV6qxgrF/cz4i1Qo3zpYTBj9ohuFbtrFZX72wl8zophbLWQutKnL9XrIXJA6
	MagSh+Js4e8cuFP8OuW9lMQN1Qn98ian9ajr4/NjqJb4xUateq55TMIEOaYfJ7gV
	l1rskWNSmdQEqC0DA5n4dNjdRBa2tn9E8ra5p571NRhA1gGwgsbu2URyyyfLXM3R
	yvOTIyqqSvaOA4bJt1CVQBP/zNODsEFoIPMJat6nAR1FhkcVRDWuxmS/Ogt2rBjP
	mB4goMm8jAUrXz6Hn1k6Oc+c/0URgB/3vsroZM6r3e/86V3yEsYt8X7THWh38pIZ
	r6yUMrepip3eX+54jbH12w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011057.outbound.protection.outlook.com [40.93.194.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4r6ve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 11:34:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cK/1YqUTCO/8MuAV4CaERmrvwokQxNukgcvM9W4V9+t4Y34/0P/R0vdANuy/VzwHHvX+9zb2IHew/6ecq78y3xK18kIhNgdIgh3XizbeknhwR0h63mAChtTxlBzzzV/qKMsDrLMqdw5RdM7w8pINz0CiLp6NWmUitqpwFapmuWsjEhH/e9GIyQjFl7dWFoE5rvfdrbXQH/kPOPxVuVZeoaluGCrrsEwjsQ1Lc4pFGgqyyKrcU4KhrUYJDYyTtyuPTRRRPIv9AQ9wFbeH4ZEcSsBBML/bt/8rfbUCTr60G7nRDCidPy4MmBUET/FxWuC9vuH2DdNwL+xUlCKkdCwBkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hgkzVh45fB8yLND+Nro/r3sd+Y8J44QlEFsNoxIiSY=;
 b=ebjN7LatFZqEeQEZ1TtGbMZukyuAlB8MDLZ73DvonPu9VqtR65diNa/Z06EHTfCZhGIjLH7EM4i7KI42Ayp92DilRIkZTpMFjBVGd++ZjbiJN/Qk8/JCCFDC2zaq2xRzWnPOWpwRBUFudfj58KeY1gczdIXN6hWYg/9XAXbImQsbnCzi2uKSXUyVtCSAUW6w/dplL3w2boieCfsCkYbhMTLr15Qvy9qBzFDq7R5uq/aFjsRpjCpLb2ymXuN6NYEPyETRQMgO8AS3ipXCiqYqhFpUrQjUXvT931UxVq8eOR0/k1LpvNCuWpbkRDN5BE+IbrBhiXkncOvgdYEyOF/z7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:58 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:58 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 16/16] runtime_test: Add rust-out-of-tree selftest
Date: Sat, 27 Dec 2025 03:32:51 -0800
Message-ID: <20251227113251.773795-17-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 11a3c150-4e6b-4d89-d004-08de453bd387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?An+dcLFphGjxTycnKDAD2j8/1kvPJkxepzOehQApvsyvm0E4xNvXfYvNAouW?=
 =?us-ascii?Q?cRWm8o1esP/yjHLiSnSwA4jYNjI+Q5Yrm8fARG+Ide1h4u2bxy9/nEB2kCOy?=
 =?us-ascii?Q?2nrRyDLhZoDTQ51w8ZahBEifqwibii4RMaZ2Z5uGQHskO65rOXpEPB5lXTX6?=
 =?us-ascii?Q?034xLolro+CbSBKQOwhELKvHQhkZfe7MGXyaK08t9oIfWnlSOdqEhG/T21ie?=
 =?us-ascii?Q?9KITudN0sCC5ttjl/ffmIK0DUlySYvdSrNs0QS/Ifup00fdCrSqRBSVpfddX?=
 =?us-ascii?Q?E8bKVZb2LO+zRrmZVNdbKaYpkMJXS4pjN6GDRmuVl2VKdss0IwIT5vV6UWUP?=
 =?us-ascii?Q?RS2Unr9dtQt6FLY6G8wZ9Z//52cEjga4AhoXnGK2zKT0IjOjkIzU1e+N2dHK?=
 =?us-ascii?Q?t2xCDKimIDRfQ6iXPGQERsMHoqDfYNNVLLOJq/U0uAZ4ThYp1I4XXQUMqYn3?=
 =?us-ascii?Q?9P88doXRvig1vDWpK7Dh2XuecdaVTa/O8buw0Eq1xn92w48D44kP7p/oyqwx?=
 =?us-ascii?Q?A9z2EsasCAZtqf2LHDUmGmJEu9UGEZrNrckbiFLN37JAkH84cW0T01523oJV?=
 =?us-ascii?Q?TU0Q8ZcFxTaWN0W8wF5er1HvDu7RnRbOXhyalHJ0mZ1ZDvCvBvJYuZc8fT9W?=
 =?us-ascii?Q?hY+NMPkHkI5T9oq5GdicRMGSncBa+ygdh9wpnVlF7mZaMFWqVqTT4GMztlCP?=
 =?us-ascii?Q?x5imW73YMRhDzZWOuLaEUJuH7fz2yf8P+LKEOZGVC8OFcLeUZfmkfFl5U1XX?=
 =?us-ascii?Q?GkTdsSinzYtKG3DfeRtjdNh4Jkt2TF2OmjeOYV4w5cW5J6xEcaKfl7ZLbLCx?=
 =?us-ascii?Q?4PybGtYuAueAoT/RVNS64C4LJchTGUy/CGjzd0xhox6v1rstMItFgqjSckgx?=
 =?us-ascii?Q?SEuChARtey1h62NQ32oJDhDh3TwLZ1YOAvF1P0tUZPFK7AnUYClEAh9aCV4+?=
 =?us-ascii?Q?7K07o5NO+bLy5TLOJ3pJVdJzdiqIZ0odGHOLN+iqpVIA4Py0UQzbeNZHB6Z3?=
 =?us-ascii?Q?P0mxQ9W1WC7hQFF2Iz4khZfr2H8/fVcIz01PPbIR0z+GcXG8gK6OEPyFB5hG?=
 =?us-ascii?Q?tDOj5HXJ1vhg+F0OfzVYH2apOOPqVQNozvhb60/kPQblzimNsODRE9KzlaDQ?=
 =?us-ascii?Q?Bl/RgQ6fjU59qoey3SLTu5dXXpWDUlc1o9MP5xTwtAdGkQVtOdB05+ahQKhP?=
 =?us-ascii?Q?/MeNSlkx4hKfQGRCGvBDtNJ0EYEz7NOn/vhGotRu/elTGYJXYS7kDrpcjk0I?=
 =?us-ascii?Q?EA0Dtriqcj1MJWnpEDANYhotfcMAJeMYaDOsvKmOmHCDg2rLYy1u55W5MsoJ?=
 =?us-ascii?Q?lDlXAh5ec+zljeaXgBRBzuJNeL5caKknZ4LktdeDVbqfdlKxxRXqOLjbKA35?=
 =?us-ascii?Q?4hU/DXBvHSPvqx4AsrIAHd1xbsq/fiPRlmrYbbJrdBKNUE2lSef3yE4xv8ev?=
 =?us-ascii?Q?YnJg9jar3eVgIb6adSSKTHs72wukonXL5ZlMSN07t+D81LjvRAPRVGrOc8S8?=
 =?us-ascii?Q?vPRlvFCIbwhx3iF78jf8RZ1B89fC6OPJbmhc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?np/v4oWy78xUWcJIStZ1+cluJi9/ZNyYG4+eF/AD9/OBfjfUbwt7mfgqDg8+?=
 =?us-ascii?Q?B6QgeAmZSGamF2q76nmOZVvu4vfr0UJKxhuwrG8vd1avguRpKXlqy8apKD8m?=
 =?us-ascii?Q?KVOuhj6PVyCjqxWZYvay+EO4ENdsa8KEh3GQvWA1qLXtjP36e3DN9BqIIxQ9?=
 =?us-ascii?Q?ByRWT4uzus5MItXruoyaiWATdgCEGxmhOZA42ZnlXoonpwZtzYdmM+6Pg7Gv?=
 =?us-ascii?Q?WVaiJybazXeqzlWUM8UH4TOc0X+RU/xAG7lNVFD/cjIsUp9ZN9IJgZXVIIDE?=
 =?us-ascii?Q?okLyDPfQasF0B8mfrRUzeu/VFI8hzL3Lqr8x+HSGMLoxHqDGSBNUfytBR68B?=
 =?us-ascii?Q?XrPPjWXj9tin2XDwT9lSKEkx95xonN0Q97tGbm5kKXObWb0Jpf8ZTR/bTAJN?=
 =?us-ascii?Q?j8cu5Z+KJ/Anrq61Epp+Gd6sDZPjgkt6MJIjxOCBAd71RtuiPEy/6vSU+CoE?=
 =?us-ascii?Q?SiQK8ttBOMB26/lpYRpEaNLGqf4mRpwmMtZ3FxVNU07oA0zKeGYAxeLQ2DnH?=
 =?us-ascii?Q?5jjH/SoXsHhnqqO7M45gLz7Pb81IuzhLFMe4DKL3kzl09T6ernxQqCvv/f4E?=
 =?us-ascii?Q?Pae7qeRKnGODqjLw5m30eLCLd6aikzfiX9I/uq0v5l1lYtr5WIfhYhCfAYUn?=
 =?us-ascii?Q?eLrk9bbdvqnM8jplcdY7QBc3V+DxA34HA/R+U4a9ggSQfy4kV+mUJ0oAVzR3?=
 =?us-ascii?Q?HgBZT7HUgZYVC8I/Ui1O7yMEmWPLUvbSePmD1rfr70KAHGuwSkjXn0PmUzr+?=
 =?us-ascii?Q?op27aaSQAfUPq29gnUPX0V3pgQ+ka2ylldkJHx03oqVfH/a1KkOdy3Msk+UK?=
 =?us-ascii?Q?Wl6Qll1paAkNVAUY62IiYJVbxKNnt4rj9aEniRbURNfBEPIiQzXMpbYpqs8h?=
 =?us-ascii?Q?DY98lEtdX2IzxvcZ2fK0tTqs+2sCbThO7jGvEshWil8Yium4EDHgi48F+vy7?=
 =?us-ascii?Q?ocaXw+qio3p6Ou8jCGJz/KKetejYX5gA48OsFoOfV3hokk7ZXGobX9j4gSFA?=
 =?us-ascii?Q?4KEc2CG+HxToMIqiQEaX1Lp6kNbruWlF6SPGU6zaB1qNmvwbTQTdmgZABBxc?=
 =?us-ascii?Q?mHt3XEZ2dKdwRLph3UXegaqlT3SgyQBmhrqOGnXw5QtVjNgcFyXoyqlkMhBD?=
 =?us-ascii?Q?5fvjozThIIxdfQRqAIDk6QwRfcDR8ZSqx7S91NliYfRr47sLLOPt3SG5rkmg?=
 =?us-ascii?Q?r7BfpRDLuu4+Dx/cl93kzSfUj54HtNxxSxzXk0MLMEPFg2c2dEMvNeDZBKPe?=
 =?us-ascii?Q?YGZnxrYcpLM6FktVMFTw9OpHNHv54nrpVqpBn5jiSIaAwDOC0xjufD9vtUeM?=
 =?us-ascii?Q?y5NrFyjc6MKP9MgQ60eDmTx2jdP+EzO4GURmIRgxBb4MvX8q2HjDFs0NNs7p?=
 =?us-ascii?Q?fwWRXzqQjmjBzqGixAPicGcarxepbYMWuAYXI0C9kqDGuT6blxT7th/zxZwz?=
 =?us-ascii?Q?9Ux+M95AYxQj7VSNDADvQulGS5ULNR3BDnTMCftSST7LnygbJADIQ9G5d3w6?=
 =?us-ascii?Q?P3lroFebDfmERzLuXc9l49PBT4Z9A3H6ujNJUWehxGLT9DLQQcgi3hZAL3HU?=
 =?us-ascii?Q?0CPPrp74dm2SDbKGpqBQCUH2B4vqY0KKSL7b7V6Ni94m660ARgXAtif58Vt+?=
 =?us-ascii?Q?OZZ9b39v0TDmPakE4KopPew5dC0JE3frBlhQIBWU2QiDzea6pBHZxypwrZN/?=
 =?us-ascii?Q?B4nIZnlLkNgylfgpmaxC1GmYh3/iJCqiBUQ+eqZN131FsUXf6aZOFP3kdw2/?=
 =?us-ascii?Q?vbNbjV12stOMoQaQy6qV5h+AGMajPi4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a3c150-4e6b-4d89-d004-08de453bd387
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:58.8315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3H7hP4x9Nwps8bwtRy5z3RGX+0/tHRzgDzOvEMnXljx5OrtDKXWFxUTrO1R9T/jT8WOh0TdZlFike3mF9Wt482RuoBsMbkmsbgtdOn4UAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: M3vr2JP9u1WbvV5ZLLnakBkb4qhUXWJp
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=694fc428 cx=c_pps
 a=vEsArsaSdKs0mJrCYyxDvw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=PMCPsi-Yzk6GkJUXyKcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: bN2vlOgVPHTCtvn86gf7RSumTfGI7IvT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfX71DnijkfE8GY
 0giH2FtfdsB/J2Jrli3m/JeBEv3pXvsgJX+euIg9WglIrpkjrXpdaq+iGOd0nE5uhMOU9cDl6Ks
 V4uOxtVoYi5F4Uoo33xgJp/14gNgYdE1NqMj+EARsdo6e02+uSyHuoZbxnOJoNdvdz/QRv59ebQ
 c+7oMJ1ngtdd32tOdyKeBRNfIZTimQw2/NU6wnKQ0FPplf6A5PDy50K5SA8t2fm1trsuLugI/LD
 FIF94I3eXhVlMbIbjAoGQlOgRAWfVVpNurCQpYRFk39MNmqxZt9ChGMeymSDfWNRBGPvQ9BfpLo
 SiszVX0gKabiI5j1iaeNlSsHFGn9tLR0llrYTyTi17MymPuMjbAPdqbFQ0/bGQ2D+WQcmYEO8eJ
 2QoJqH61puIlr+0We0kHCjh+cNlLfV8Qt8isrf9y5bYLxQO6HW+pGMlX6auQLQZLA+QmuUxjTqG
 YLM8G+Et9ZmeqhMADkw==
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
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228570

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust-out-of-tree-module recipe compiles and
run properly: check that the dmesg output is as expected.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index e8374606a4..461116601d 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -494,8 +494,11 @@ class RustKernel(OESelftestTestCase):
             self.write_config(textwrap.dedent("""
                 DISTRO_FEATURES:append = ' rust-kernel'
                 KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc'
-                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal kernel-module-rust-out-of-tree"
             """))
+
+            runCmd('bitbake-layers add-layer %s' % os.path.join(get_bb_var("COREBASE"), 'meta-skeleton'))
+            self.add_command_to_tearDown('bitbake-layers remove-layer */meta-skeleton')
             bitbake(self.image)
 
             with runqemu(self.image, runqemuparams = "nographic") as qemu:
@@ -506,3 +509,10 @@ class RustKernel(OESelftestTestCase):
                 self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
                 self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
 
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_out_of_tree")
+                self.assertEqual(status, 1, "Loading rust_out_of_tree module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_out_of_tree dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust out-of-tree sample", output, "Out-of-tree Rust sample expected output not found in dmesg")
+
-- 
2.49.0


