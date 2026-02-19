Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92EAAE9A05E
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 19:12:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21752.1771528362990103953
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 11:12:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=m7Nflu2d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=651017371c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCKK2B240940
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 11:12:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=gRG6Fn41r7g45AfhIE+Y
	FUq8ttPqh4iq6XVxfINhz0s=; b=m7Nflu2dTJEX7fjJzfVyDljhKutNlaBOf0Gm
	netjgARW0pMsKBj9A23dSCZ2hbHObYkot/S7Rvd0PxIe2PEFYwh7mPK5fJbxSTGd
	w00Bwbe0CM9WZIkUe0GONREPYXoeU2Jg+JUDQaPJAHBxN9DsOL3Urz9GQLImp8lO
	WmivuoXbluzcLlqAvkvLpzmqH/q6AKAICpsQvoDaZ2/gH0psKZ5y68WeBl/e5vqf
	vB9+lOxlOnF9j7tUEJoZhhn2N74qO+G5yn9TdXEYv23C3mV4jh8Zxd4eim4h01C+
	vYPy/CkvRcH6+jsDvZzffVvl5lCCTmxPp7l86QgYXqgsSpj5WA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012014.outbound.protection.outlook.com [40.107.200.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cdtuagrnn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 11:12:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lk523D6cHV8/kuPAh893JNENi7V+24Bxm+PQpUYWpb5DXBmnhwz+OeN576CwJapLMkEpKSSXCUIszLmD2H/J8YP8xtEgr7/lKaEwbVmN6IodB/1+pcCpv3cE4uduUixb9ZnEcLbuyq4TcvLDVbcYw/fWnGuhJloS+BT7UYrn92AFpj2KVTq3hVwIDV4WjJ/9XmMPI3Rm3Q1H1V52b6EJss0rXXIGc87h00EzIFcvP0TDLSThtUvf4ZMw2RebbJAYRQ7k9arkhLuKcYdxEYWrZgjwlbRatTr6bdlTPcjuFCXgBx0RX6eWtUnZGABJ4NnuytGxDkLRe+UHymwCHk1Lvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRG6Fn41r7g45AfhIE+YFUq8ttPqh4iq6XVxfINhz0s=;
 b=m5MP3S4VEN3fxVnoTjnj0ev9Stj1lHK6gcYCwzOK7EHZXSA8QqKEW8mXOrjNLUn73oPsmWSUMXIJqcysTg6qPJ4FG+BQKwgSexERIvoXNY07bZp0fb0mWux+bAfwwhML5IcKpSkW3eLY68d5GXyoq95D2ayrJ76psi7JglNLQ7cIEJhWFG+ci1ntgfLskcJMTUNHN+2TRR83Rn/6rGwsxHJd+yJornuG3Dn3ByOkP3yyGad/rCja+RHEG9VOJSVOGWnIvFVdcIZRz7ykdQtV3dXTxGceTAvpSAYpZ1ImTy01t2C4Ev4BYiAw4fodkbXWgqKPrZ5wOXrLKbfkN8b3pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by LV8PR11MB8677.namprd11.prod.outlook.com (2603:10b6:408:1fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 19:12:39 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 19:12:39 +0000
From: Randy.MacLeod@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] coreutils: kill and uptime are no longer installed
Date: Thu, 19 Feb 2026 14:12:19 -0500
Message-Id: <20260219191220.460166-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0281.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::14) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|LV8PR11MB8677:EE_
X-MS-Office365-Filtering-Correlation-Id: 9094cb93-eb4c-42b6-4131-08de6fead938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7142099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uINU2jpncKkMoqx++hntA7xv17J0/zM4lpxGsbLQzKQEij94lC5PnYfpwa8w?=
 =?us-ascii?Q?C78poB635ALSJlEUo/WXswJ3wqaKaXs4T1t4Me6k8yatqopnV0vXmPZLeLuy?=
 =?us-ascii?Q?1bnV5lty8qRXGVN1laa1LyHD2bBBWR2WH2OAUuilsUjW/xBolDtNONHWq3xB?=
 =?us-ascii?Q?xnsZSMjFvy4Z3zRjAsmAxoI+FWSNSt4Ku0rh6EDdV75D1/44I77+GWZqEgxi?=
 =?us-ascii?Q?g+JGwptC65YIY847I5IWsMOMwFGXQa7wryPxmDCPGhAHZ5jxfXYIGudRAogR?=
 =?us-ascii?Q?a5Shgeys/Uf7JiF9xlaiq/l8xj76zeTlRFHtRJUs4IYLepVV+91Z3O7pZNUE?=
 =?us-ascii?Q?8mRJXPD+aetdOq7x8iQpzCzgx6hOJZXwOj0MdQRtcOkLGHcxab2uZ5D/yk2W?=
 =?us-ascii?Q?xBHiKaqkRAQwk6V4j0eStpI4iLp97MIDF4adaMWPflzW5dYQFo4NjJbb0InY?=
 =?us-ascii?Q?DRWinV24KfXWdVBc10QXSufVDJ54EQLjjK1CsLDO5j4cx6ly+JknFpdhGsMm?=
 =?us-ascii?Q?4oC3v5ggsyzqbLyAGKXCch2dJxIp7IEddc/1NRvRMBeRozNkRCpNmGbH2Q15?=
 =?us-ascii?Q?09hEaw05Gkr9t56jx2woFcX1ezj8OZ9ZIWaVF4nJNzbGbhk5fx24yY/wPsZy?=
 =?us-ascii?Q?xGB8dEwuEIqyjDCeUHn/AVjoXDvhIDOPtqVv8vsjVprHGlyZQVinwS7VCq1d?=
 =?us-ascii?Q?qiYCmbulpocTldjtq7kCMFYERU3CX6QH7IHUJ5+lzHZlBMDIZY5niIo75qbo?=
 =?us-ascii?Q?2N5s3JBW4q2H4KNbv1l4kE+8KasZLbWxg2+dirn3rnFUZLAvIMBI4G0DITPO?=
 =?us-ascii?Q?P/Gs9gaS9keGnldC312Y8jzkcAK9gZViMXBRPe4NJcF6Z01eZUDSFz1v983r?=
 =?us-ascii?Q?y/yYbxyBwtZByJLdKYvSEhaKjCme9CgAVa032kY0fDfceKsrSQXwxooLhjmo?=
 =?us-ascii?Q?XqtXYp+93m2z9n7Rmg9zoAW8HzHQB2Yj7Z5v+AfoJjVVx4Wq90o2JaqPkSus?=
 =?us-ascii?Q?1t0ncpuPwW5h022ZSC5HENTGJY6/OmECuhglPOoqEUz9EpPTelfcCNvJyZOG?=
 =?us-ascii?Q?+TA7rrv7r7Xyj0T/630ssguROdsjcntRdoyF17Ojpl7wEJZe9pHFczBYE0f3?=
 =?us-ascii?Q?NVk7kFMzYvv27iZgMZyKc2gUODnO7vV2xAkCVEyIoklWqELOFEfyS+iW6h7F?=
 =?us-ascii?Q?qZefVbguPaOhXYzjk1O0iQd+7EW9nU5n4k9PGoHcrlGm8vhd83J+QH0M07l8?=
 =?us-ascii?Q?On2TthRCpRVf+fZ2ZqpAPhRUcffRjI/QjuiblQjtSxNxb8Yi0HAI2FEeN6Rn?=
 =?us-ascii?Q?ZJtVIXYZIcTQSxfgMcHVnNXvlfnCnIBflia3O7z8Y0oqR/oEjxNH430S1Xjh?=
 =?us-ascii?Q?AFp2e4I9dWyF1Ym9HJf9pZjs7yVPPbwWZKbkKXEMancM6wRJnR+EHX5Njon5?=
 =?us-ascii?Q?Sh+K3kqe3gM20e68zLB0dQk2qHNRYYpleoiWBo5KsniPBaN4DPeO+tRJqTfU?=
 =?us-ascii?Q?CSbW1RBM0Gn9FRTBGGr6jV456hIjb+fJQQ9AkGp3jYwpTijMVktwFTfzG19y?=
 =?us-ascii?Q?5GZsVl9TRuUaUFS/x8Auvan3E7jxTQYuqfxnwh7dPmAzOmoWbKlt0OLThZA5?=
 =?us-ascii?Q?tWBYEor2APU7nqVkAV8cP4A=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7142099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?beV7Z3kb1KSw83CTDhtnqqppx6xP4lC2XuGNQjUaHih+ZZDfdROcWyo515jO?=
 =?us-ascii?Q?l8PHCvroGLumn52LHkleTr0/SDOGkNcrLHHGneKjpoNMqsKN9xRDQ9wd9DTU?=
 =?us-ascii?Q?X89F3sp1pu+sDgVvS31hSIrtk6zusf4hRKye6frxD1aguJ/CifhdnU/ndRte?=
 =?us-ascii?Q?QLRntH1Nudeof3esOKMHY0pQq1XzcLXdmao9dslLGYF58q+0OJmiZXWaJheV?=
 =?us-ascii?Q?UuFofVvywyNOtVah204GrD6HPjIc3gmOwc1j4mfbWcFEUuc6xYyeHguhgiBX?=
 =?us-ascii?Q?fOa6T00EwkXjyAqBI76+VyEz+BnCD6MFMt17dJYFtMiOv9TvA8qsDw7z3Zc1?=
 =?us-ascii?Q?rcGRBznVMI5F6grLCmENiDrU8vH2QnKME0wRVmAxFhH9DXaWraV5Djf5uUHH?=
 =?us-ascii?Q?jzdhQMVPQAZD6N19NaQB+JvVU+ss0t1AF5KHIcf6veRLKd2ItatGIIm/46Kt?=
 =?us-ascii?Q?Eu3WvfJGcSbhuvFZn+YekNndJJrq7pVDThqXj5nGDuEhp7e8CxIpk+A40c+N?=
 =?us-ascii?Q?I1V2R1JM9mdMJXXkzQWzfrrjaReuLj6D/XQ9BlpPOE5qUxfNeWZl1aaucjui?=
 =?us-ascii?Q?KXnSMv36SPNCpYdRUXuIkI7DKhcAbd/V0gq7ez/6oKjEKwezB/S4bIcMmzjY?=
 =?us-ascii?Q?R8qJGpvSHcuA2Pu75W62QnUaMa/aBdPYStU/Hs7617NMrWGxnAybTIkKZX66?=
 =?us-ascii?Q?WSYk3YvlLysYkNM3ZnhKsPA9tUnsu7BRbGig/mOcEkd8CNc+gR2LhQv/R2uD?=
 =?us-ascii?Q?1fVUidO1ww10cwzcA1Oikksm+3k3KBo9lb8uQ6qJC5+X764Xuw6hDZ+gag1F?=
 =?us-ascii?Q?8Pns8mbK20h5Tq52Fyi+OUjRhJfsOakOO1H4sdxtc7upWzaRHGU2a+y+2geQ?=
 =?us-ascii?Q?BUbJlqZO/p4KXGNEiki074oBigGMG2YGL/kzPV68R1xNKHLgtewKsyCZYqCl?=
 =?us-ascii?Q?v2Dlh2BDIkMFDQOwqGr+jw17SVk6J1XLS+0OtQvKWF0yh5dV4jwKnPqfAxyz?=
 =?us-ascii?Q?pa6h7rf3JjToCu2btsxlgELaChaqw6vr3ZlTxaNEKCDoGm1XmGDDYQ6zOAfU?=
 =?us-ascii?Q?02K3JOjmQTSrslQ0zer5vpJRfrLn2jEeXciOxdFWpEKW6DbGZ08GC+WV7bLd?=
 =?us-ascii?Q?kIA/3gJ2xdouzGGuVuq6l8Sep5aBKFRZKBSS1QSaWKeBrMzXYAuFQ77BSt6Q?=
 =?us-ascii?Q?xly+0QLrgeHheBjt/asP+Wc2tIqD8Fb6cLYR+q8M7RycPs0xvVSY44oH+i7p?=
 =?us-ascii?Q?H/Cmv81AWu7LvsKK3pdfdMxr6cirsRu2D+MSdWLzbh2yxemYCIQIqsaAXJeV?=
 =?us-ascii?Q?u2HEgCwpez8fgtqBwECKlIjkHG1QEo/1Hxpfdr6kZC3BgI63Qc9S2fof/WSO?=
 =?us-ascii?Q?KbS/aXezfjvv/1VYmra/HHm0J1PUMJfWNxxfmOsOHF8vd3maHnwq2A9hUAp1?=
 =?us-ascii?Q?0+d1vMNhnY8FmLLrm+FvHCamOapyNc7O9zXZeE0pu88YPwz2ZUH65uDBdgpX?=
 =?us-ascii?Q?3JM6Dsp4JXLQKP42xVYFCV+04PQ0pLXI1cvO5CL+sqbsmAKhxAxixs+2P4E/?=
 =?us-ascii?Q?RQhvmEYul1XRPuSqW6fGwjTXggxwao4kSsopPChryaQrLuFETIEkvBy5gIf7?=
 =?us-ascii?Q?j84FfEfPMruxMbAiaMvBHlqkrL2O89mBziDsX1DQVt3PI6E4/wACWyv6fyYL?=
 =?us-ascii?Q?3ZotaiaTKso3KQ9kz51lT5i39EYup7gocTGlaxPPTZRVFhc77BNvGoO5P7Qj?=
 =?us-ascii?Q?BSvEuJdnJw8LfqyLdCAL0IwRKIKhw/Y=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9094cb93-eb4c-42b6-4131-08de6fead938
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:12:39.3998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCEfI/Nc4wWq4aIgSVSY4TWX2xkRDIrx8VLkr4bifYFaaNtZwp42CyHfrhDg24esTJza4ex4C0T0m2YLGKkwOhl6btGIwcCbhq+FB6TdnmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8677
X-Authority-Analysis: v=2.4 cv=OqxCCi/t c=1 sm=1 tr=0 ts=699760aa cx=c_pps
 a=3EeCZaq8L1ZepF5DamB/SA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=vsL18U9S038St2NdUxoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 8ocEuSHD1eM0ZKdYPHMjPidRKagPZL0C
X-Proofpoint-ORIG-GUID: 8ocEuSHD1eM0ZKdYPHMjPidRKagPZL0C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE3NCBTYWx0ZWRfXzgwiO7B3oFIT
 m5tJqu5Hc0tHgC56zPpJrbLwt07mXM8utqy8R09eFeKu29YDaIGGOyNSCKVah4hKcyo3ZHhqgMo
 M0GRBEhaHcQEORzQb4QBA0mGknzlXWYkIvTG37smLZZ7AaBwURe5mP5lN3XcHKFl6mq/BjoagTb
 PM0tewqB7HBYnkY4LUe7YzL2WgehaS3D3hb+FjpN4a+sFs+BIbNpcoV+/MPgevRHafL4ivn6g5Y
 ZhvDnBS9zXaJlbAsgdPwvCUWdMMAGsDqZ5dTUu/iauIsgvDU66+tUYJfBl/IsVhU/jrE4j41ebW
 xW+HPOVDvg11+LxctTygKNeq7dfzYSUnktry1tkVqTYi82ea+BYHTikMQYzq20TySgrmVV5LhMI
 OipkgNi1ligEnGn5XRWjz85KZ5MMHgkDNEeNsUMcxy6ROY+gS2VI9FvN0XuEjkiiAWSjfaSWZK+
 jrzvLLo64haw797q/2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602190174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 19:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231440

From: Randy MacLeod <Randy.MacLeod@windriver.com>

In coreutils-9.10, as explained in:
   6b399ad35 build: kill(1), uptime(1): don't install by default

    * build-aux/gen-lists-of-programs.sh: kill and uptime are not installed
    by arch, debian, fedora, suse at least, so add to disabled list.
    Fixes https://github.com/coreutils/coreutils/issues/132

Note that in oe-core:
   kill is provided by busybox, procps and util-linux
   uptime is provided by busybox and procps
and in other layers there may be other providers of these commands.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_9.9.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.9.bb b/meta/recipes-core/coreutils/coreutils_9.9.bb
index 7deadded06..1a017cb0bb 100644
--- a/meta/recipes-core/coreutils/coreutils_9.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.9.bb
@@ -56,10 +56,10 @@ bindir_progs = "arch basename cksum comm csplit cut dir dircolors dirname du \
                 join link logname md5sum mkfifo nl nohup nproc od paste pathchk \
                 pinky pr printf ptx readlink realpath seq sha1sum sha224sum sha256sum \
                 sha384sum sha512sum shred shuf sort split sum tac tail tee test timeout \
-                tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes \
+                tr truncate tsort tty unexpand uniq unlink users vdir wc who whoami yes \
                 ${selinux_progs}"
 
-base_bindir_progs = "cat chgrp chmod chown cp date dd echo false hostname kill ln ls mkdir \
+base_bindir_progs = "cat chgrp chmod chown cp date dd echo false hostname ln ls mkdir \
                      mknod mv pwd rm rmdir sleep stty sync touch true uname stat"
 
 sbindir_progs = "chroot"
@@ -112,7 +112,7 @@ ALTERNATIVE_PRIORITY = "100"
 # Make hostname's priority higher than busybox but lower than net-tools
 ALTERNATIVE_PRIORITY[hostname] = "90"
 ALTERNATIVE:${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base32 base64 nice printenv mktemp df"
-ALTERNATIVE:${PN}-doc = "base32.1 base64.1 nice.1 mktemp.1 df.1 groups.1 kill.1 uptime.1 stat.1 hostname.1"
+ALTERNATIVE:${PN}-doc = "base32.1 base64.1 nice.1 mktemp.1 df.1 groups.1 stat.1 hostname.1"
 
 ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
 
@@ -143,8 +143,6 @@ ALTERNATIVE_LINK_NAME[lbracket] = "${bindir}/["
 ALTERNATIVE_TARGET[lbracket] = "${bindir}/lbracket.${BPN}"
 
 ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
-ALTERNATIVE_LINK_NAME[uptime.1] = "${mandir}/man1/uptime.1"
-ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
 ALTERNATIVE_LINK_NAME[stat.1] = "${mandir}/man1/stat.1"
 
 # The statx() requires glibc >= 2.28 and linux kernel >= 4.11, it doesn't work
-- 
2.34.1


