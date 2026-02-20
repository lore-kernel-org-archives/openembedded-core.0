Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B9AC54F5B
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 06:03:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32934.1771567391587109312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 22:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PKZuMDPr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6511fe63f5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5J0Av1980195
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 22:03:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=4c8bLMI377ZdVBtPp2EDttGVcAB65TrfTNKY3kkNK44=; b=
	PKZuMDPrc2GG2nGvblDUulzI26ovoBJd9ZK1Oc7kGaAELcIDTyn5TINU6Yi6Vpyq
	7e/45DzH+rgckDbI598d5JfWe3XAhm06FGNXARvtztn/lsvxtuZ2NZbCFPFpWyw4
	Y0nuEk30pH8X6GdNa7nxmJcUG8jK3L9/FT++Iwx9hemiY1pH50E/v3DJghb9vm0X
	bFzgrukJ2Ny+yiuhJi+GkLiR36wSZMrWHgic/dLUb2j0557zFEj9DnFmhbn7ZzZk
	ojBbNRW0T3j2kTum3rK1V6Hgjn9wtSkMWsk9O475CtClvbcxFqcrMhGveIxRQhXl
	CnFm33hnyGfeslfg0eNsuw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010042.outbound.protection.outlook.com [52.101.56.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cdtuahb5w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 22:03:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9CuoQPqv1Ff8jtM8n1rvoEW2DIZILQGk++dPtDrm8ILTiqN6Xq0U1iUMWVc5Gqqfw5HWpnY6zdbtF+acuGcdE/HJ9sb3Xl2ilzR1cNMV/OzxP8m7ctnk+ELBNpdn0nlkVv6pRSdWz87NH89qKkwAvxhItlnTV7OsJVWeeMR7Grqq0r/YzngjvTAqIVTqfIsfWAHW9Vrj4r1s8ZBX3Y03TWqicigVIHEC00DRv91syiQOGI/r+pEzxQ3OtKDdc4+o1jzSIDDD4MUVOrQ4Vd4lZye6fVawWaySPqixdmAr1bNfJY+yVPko8otNqZ1RQv4JZYe9K0NFjdaQUQgqkBpxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4c8bLMI377ZdVBtPp2EDttGVcAB65TrfTNKY3kkNK44=;
 b=CczwmNZYF/u7SWD8TXTwOdz5j3Lb1uo/Jj1RnS7sVrx/bVvpfpAKB/g/guMMHnLwqrn60qx+xdfcQYUOQmWk6XLSUuVFm/pt81Bj2l6Pfo11q3qimRqidSwr9RTzGTLJ/O2l4fncE/W+oy2Lb+BrLUqJLG1nAtG3hfnmSr1D5A8QGNeQfivNnStBgrRB85iYeA6NbvlZ09M1/x2ZXy79ah+p7PLx08HgDkh48qmWhlsA7qivtXLvQf7BP8Ywbj/R7l0LZH+dzxQlyKkTfdWoshQ+TOKUG1yAlG7Z/0SbjdTnGd60IwBxhPwdVn0g0liDBakI4zgcvEyDTdB0O1JDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by SJ5PPF8622363CD.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 06:03:09 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 06:03:09 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH 2/4] clang: Enable cmake flags for llvm, clang, lld tests
Date: Thu, 19 Feb 2026 22:02:50 -0800
Message-ID: <20260220060252.77248-3-Deepesh.Varatharajan@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 30401e7a-66e9-436f-0f13-08de7045b8df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4GWT1w6a3CjGRtaoi/wNBkbHXUcw2wMwfWOKDWvsMgVbw/4wGfyitnp6b9cS?=
 =?us-ascii?Q?Hrhm2RudcTqySif8KkPqYl97j0wI1YUN37VYCPPJChcJsvjBZvU3+lXTQhLX?=
 =?us-ascii?Q?9gTX3K8/CrNf0c3RBbYMg4Nskag9rHaOLMJ9c9PHD02C1Ab+zPvyF/PHOAaS?=
 =?us-ascii?Q?N+P63FzBihwop6JeUffflSi+TtLBGGNfK5E8lKxkKWWkHJ4MeyaxDtmC8243?=
 =?us-ascii?Q?axP33IQG+THXb7dA1gnQUF7T52i1ydJk1AxlvyuWrg+Jv2e3yFj8VbCX1U+A?=
 =?us-ascii?Q?F5s213SZwMwlQ2wYMML2AFoOrFOX4oUmkwY13rQpVECJbtMkF2O5fVVfQgeI?=
 =?us-ascii?Q?q/eoSrmfzyzNK8pqV8Qnz1RQZrvoxym1irRx1zhqIfoqYkXEDmO2KwqddkYJ?=
 =?us-ascii?Q?GGhEq6HVohHaRh5GFgB1s+Z5AiTZguAO+blCRWLZSCMHcfntmZmWKzw+oqq3?=
 =?us-ascii?Q?WqVEImiIB6Mgdqcg1TZmnbNF/d0a95ARQzSzObXBxif3B7Tql1dhDYnZduob?=
 =?us-ascii?Q?JOzfNmUDxMX8sLLUQ4GiXFj6Yuu6iQQAkZuGywbMAlnOgUtlSncfOF+oiZvE?=
 =?us-ascii?Q?gH/QkgMUF1dkHcevc3GwsCYrol71wRJDww3m79H9ZubKvn6RPhr5PLL9l6v0?=
 =?us-ascii?Q?bUx0QiD8aJ6JKT0hkL6Ti5gIFo/6V+IHWY8pcfSdXFL22B8cE5sYQqSY8L/Z?=
 =?us-ascii?Q?f56MO4MR5NvcOlIPT80wWlrt4H5jzLLSrH6fJhfNwk5QEbG+0RRjsTmRd5P2?=
 =?us-ascii?Q?QQQD3PCdusnVxqq6CrygFbnhgTofNqAmRcgLtJdmV/TbEGkIQm9BhfaMa4I7?=
 =?us-ascii?Q?Q3ib5s0lUyLJbnfVYUS0RZRa2hTsmTFhZrt5ClRYMitcxkd5MmdB0s7pXc5K?=
 =?us-ascii?Q?958L6vfVf7ipJu0mCTn269RA+d5XHKIUTpWYU0rfpM5OtCFwNqpmFupDrf7d?=
 =?us-ascii?Q?vjnXq1HO2EM1NuzG16g5PWb3Njf66/FhRIbNBnsVPrhPFMXMNCj6qFx+2F/H?=
 =?us-ascii?Q?RTuRAkqlrBaE9f32jiJMZNhpn/6DM13yxpyfeN1GO8/G9ySO+rzpraCORKzv?=
 =?us-ascii?Q?VJfbz+wsBce7MDQ1uyq6CbsEYjXXjXT57ip5rpSMN5U4BfhjsVfeUTz0FuY6?=
 =?us-ascii?Q?/ZQUQivGHXijePPaakQw90JsOI0v3uqTIskvjvrFGEzhGIrdTYgy8nH+ydm6?=
 =?us-ascii?Q?HNhk3/4RrDInEsQ0kuemyZqB8Gx05zV7uurHFjr3MG+4CWb4h1J2RoK4uj41?=
 =?us-ascii?Q?1+rtPF81rzIBO2sgLxiaZYPKlCqmr36DSne7CaquwEW/iT1YzhFqo5mz3D3R?=
 =?us-ascii?Q?XsM/8v8cKKlu98e51cxvtuiJyPghLp1s68DdkOh0vJyanRGQdQ9ISqCTuE3B?=
 =?us-ascii?Q?io4uroonhoaZ2gp3DWAyziciZS2GKyveC7US4tLY5FE2PvRFmjwkD4/KCUq6?=
 =?us-ascii?Q?jvloV2gzzcbi+55Nz1sxPVG6XQ+EmntHu8QGb6qg5BXV2dvEb585wF9g/+vg?=
 =?us-ascii?Q?DnYum8cTtaRhKKFCvuSlnlrRRgtI9mQ5EmLplMVpmfZIo98t657Y84IaDjcU?=
 =?us-ascii?Q?BXN4jII+BdgbPid8k/cAGQbojI8nHSbIdZ2mUTNQ8Sg9TkUgNsMfd0BQjAM/?=
 =?us-ascii?Q?fli6LzWuvTKyNzxJVhGe83A=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NhgB66QSRgFy4UH37kISS1F25cnKG7SIKYV7Cn9J6g/CAOgxxxHXd7tZLUZ/?=
 =?us-ascii?Q?O2e6OplO4P5yzu6s4Lh9RmXSABplUhaTsvRitSvacMmRJ852rTRrnxyhfIbk?=
 =?us-ascii?Q?tT3B0zqQbsxtwlDW4JN5RO1xTrJeoVwyaZmmCyWeyougJN5/dliuxmzAn74X?=
 =?us-ascii?Q?MMFY72dkn+tfTz3RJ6rP8is2e7bwnWzvZLY5N0Y6h/bxZo+Xw5pzynbgv9Cn?=
 =?us-ascii?Q?U237duDDmBrmOgKzpOuHIgZViplXGDrtbD1Zqh8pRIxfJwhbaM+McZs1GhGl?=
 =?us-ascii?Q?GyMGsM0LcCGyCAMVOBwfT7jb4EG9zbn2uuPMZ/YVYQiu6chodBB+Lv2FIvTL?=
 =?us-ascii?Q?uNwiYNFGWM/IaJKJkeQooi3QtgbolmwmOyRJRECCsZe0izeaK/aw5Vaf54vn?=
 =?us-ascii?Q?97N7Ar2uWqZoxp/h70o0cFGfqdSeOKQehIjrBv4qhMM4ECMMRKFcrNVy5ObO?=
 =?us-ascii?Q?+cIw50zuIGwA1YnaZtGhQmwvo4yhfl7vYaXr8O0znhrBCmxWLe5UZMwAw8fN?=
 =?us-ascii?Q?gtEUxg5zgBaFcnAyuFxqTRyNBsU7dD5SGWmDrC8TF/R//2JuCBxtaJmm7Bpv?=
 =?us-ascii?Q?j4R7rvJ28+ZXO803krZgTjtc+9NUkoDVa2AZdbpDyeN3aYHhPhAQLYZDiMEm?=
 =?us-ascii?Q?KttZfCzVYulf6dc9zEB5Mkwlj1B1KfnVEXiXFu9myg0EeUFYG9wy+YFWbhMe?=
 =?us-ascii?Q?NlNnn2yJ5jWpoaiMXa/FgjH0KI/x/nfkxz12cxllYebOfgZKzOioIrf3dI/+?=
 =?us-ascii?Q?epr1olQ6Pvp/uNwL91LdtEGvUxDktxhNqCJhqQXJeHJmCqmUsg4s+FC5TrWE?=
 =?us-ascii?Q?ezTbstS92Zt/RgH5s05j09aMeIz3HFowioYTxelKJ0t++1CJ3stc3l1NUiy/?=
 =?us-ascii?Q?v0iOxrwd/rhAy5Xx09NvQ1WvH3W5MAjNsDDW76WUZ6wqjrn9SbLDizQfCVrb?=
 =?us-ascii?Q?pxuJEWgdYP+ohyN7Ieh4aBxei5shHmcQeNKcvabE1Ka3vDuq96VDacbCP6JY?=
 =?us-ascii?Q?PR68WPjj3/07+pluzY7kHdN8KyrjvS4kWC8LG9MOY/zBi7moRoqUS0kZNRW9?=
 =?us-ascii?Q?A9QMuvCgAibGknl2934xeISYlBsQNfPWmzwptBsBsIV5OBbl64JQQWeaIj+D?=
 =?us-ascii?Q?mZzkmfyZ4QsFF8cKjJeq6/4DtqLwFKkwTcSiPfpV+mFb8dh3xoBN0WgqkZJb?=
 =?us-ascii?Q?qi8ySJlMAv5UFHku0301fXV8AT9MOUDm2IjrzAyve6kxGv8Ez0TCWLTyyaRi?=
 =?us-ascii?Q?rjmsIM8ctKbWdH4gltkSyoNRDAtjIAVAEtgQdmrKjbHiZ+jY3rk5qV/JMUGZ?=
 =?us-ascii?Q?82GL9CIG5Im0tR4iZmlC3Z1PAUXTZ3/ArxMOsSt7I6rM3nwYAmPHDuGoLTdX?=
 =?us-ascii?Q?2TIL/zuMUg320KtdTQxQxlQGlAPoEARBVSLVaZWSLloyZfTEWCEi8MKX1NHY?=
 =?us-ascii?Q?6UpQzEnobGKTssSkXSDBWGGvXrK9FBk+jNL+Q1z3NZL+xx0bU2p/raXXCWdX?=
 =?us-ascii?Q?VcsR62Dp6/kecYkA8Y9kFvFS2bFEW9JZ9DxDs921DC7/NexavrKiEDHbEbjY?=
 =?us-ascii?Q?RIEWItOY0TYYsn0PT3Nudom+XbV24VgM04A/nJMQPNZocMKqEuhX4Bkk5xJ8?=
 =?us-ascii?Q?q42/pDcA46kvhLpQIakySQnAvZrzPvQbKNkfTwB86mm1205OgSB0ziH2LWTz?=
 =?us-ascii?Q?Y/u+p7Oi2jW2VYmbtB2YIX1r/2gFSaibf+fkz23u+PjEZas65mtWNS2KGLmT?=
 =?us-ascii?Q?NFee+ewiW9JvlTSEk4X68ILpYtf4lAje2T9sDHDmmlGXPSITJh4Q?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30401e7a-66e9-436f-0f13-08de7045b8df
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 06:03:09.0700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2cERgzPhg5mieyFsCgVd5UtTQzl8+qr/IMp1Q89g8W1YPKmSkpcciMfgl8RJFpXuvXIEun2dstLXpKM14yo8KvG9WHcxNHRhD/BI4tcf38ASBStf3Xd3rVYNvo/kkyk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8622363CD
X-Authority-Analysis: v=2.4 cv=OqxCCi/t c=1 sm=1 tr=0 ts=6997f91f cx=c_pps
 a=cLTib2BoJD1e+Gs0wkBYAA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=OFDCfX5Y05eup1Ng94UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: zMBd0k-2K5V7cr2HSNC2qAdt5PU3MVXo
X-Proofpoint-ORIG-GUID: zMBd0k-2K5V7cr2HSNC2qAdt5PU3MVXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA1MSBTYWx0ZWRfXwluE/n/Kxl0F
 FaI6GCCUoY5U4e0QXedVxcOFXcu27Dg5bKfLFFnMxjCpP0FG4XatgudgX3XI2Db7s7ARt9ZWPzT
 YVgzcFeGWUGc5dZJj60e2uqjUo5jo75L/VbyCPwOF242JUVM63jKyxAjzBG1Nwz2NEz5IeAr59R
 bjlqs5MVVkQFuIieJz2nRzhcjcE2wWnrx0OdokSNqZYT+unb+1hC0ejKB6h72LkQk2134ASjv6p
 WL9qo3RN6+m99yNHWbmX/91D9Z1rxNjHULgemlHbEydWPbn8rhqJ3t+L8XwR1DYH6OWhnpVaIWY
 S4urwY0jSeHsFDMBjWAfsh9ahIM9cENgY5bpNyk4ukz+RJxcM5F7QKHL0NoV6QP1mjXweHw8zgq
 28SRDhF7Um8fCk0TByu77l39WKJx8EsPUSuU1SBR53BP1/xTK58IWRH95QBXxDtwWRUlj4/y1cM
 WAYtR77/BuYIj8NK2Cw==
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231490

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Enable the necessary CMake flags to build and run tests
for LLVM, Clang and LLD. Install the LLVM target tools
needed to run tests via llvm-lit inside QEMU.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 2 ++
 meta/recipes-devtools/clang/lld_git.bb   | 2 ++
 meta/recipes-devtools/clang/llvm_git.bb  | 8 +++++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index e10c327a2a..a6950e433e 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -77,6 +77,8 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DCMAKE_STRIP=${STAGING_BINDIR_NATIVE}/llvm-strip \
 "
 
+EXTRA_OECMAKE:append:class-target = "-DCLANG_INCLUDE_TESTS=ON -DLLVM_INCLUDE_TESTS=ON"
+
 DEPENDS = "llvm-tblgen-native llvm-native llvm binutils zlib zstd libffi libxml2 libxml2-native"
 DEPENDS:append:class-target = " ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
 
diff --git a/meta/recipes-devtools/clang/lld_git.bb b/meta/recipes-devtools/clang/lld_git.bb
index ba36942790..798e76746a 100644
--- a/meta/recipes-devtools/clang/lld_git.bb
+++ b/meta/recipes-devtools/clang/lld_git.bb
@@ -19,4 +19,6 @@ OECMAKE_SOURCEPATH = "${S}/lld"
 EXTRA_OECMAKE += "-DLLVM_INCLUDE_TESTS=OFF -DLLVM_USE_SYMLINKS=ON \
                   -DLLVM_TABLEGEN_EXE=${STAGING_BINDIR_NATIVE}/llvm-tblgen"
 
+EXTRA_OECMAKE:append:class-target = "-DLLVM_INCLUDE_TESTS=ON"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index 96ea383731..d99d6336ff 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -48,6 +48,7 @@ EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=MinSizeRel \
                   -DLLVM_INCLUDE_EXAMPLES=OFF \
                   -DLLVM_TOOL_OBJ2YAML_BUILD=OFF \
                   -DLLVM_TOOL_YAML2OBJ_BUILD=OFF \
+                  -DLLVM_TOOL_LLVM_EXEGESIS_BUILD=ON \
                   -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
                   -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain-native.cmake' \
@@ -58,6 +59,11 @@ EXTRA_OECMAKE:append:class-target = "\
                   -DLLVM_TARGET_ARCH=${HOST_ARCH} \
                   -DLLVM_HOST_TRIPLE=${TARGET_SYS}${HF} \
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config \
+                  -DLLVM_INCLUDE_TESTS=ON \
+                  -DLLVM_BUILD_TESTS=ON \
+                  -DLLVM_INSTALL_GTEST=ON \
+                  -DLLVM_TOOL_OBJ2YAML_BUILD=ON \
+                  -DLLVM_TOOL_YAML2OBJ_BUILD=ON \
                  "
 
 EXTRA_OECMAKE:append:class-nativesdk = "\
@@ -69,7 +75,6 @@ PACKAGECONFIG ??= "eh rtti shared-libs ${@bb.utils.filter('DISTRO_FEATURES', 'lt
 PACKAGECONFIG:remove:class-native = "lto thin-lto"
 
 PACKAGECONFIG[eh] = "-DLLVM_ENABLE_EH=ON,-DLLVM_ENABLE_EH=OFF"
-PACKAGECONFIG[exegesis] = "-DLLVM_TOOL_LLVM_EXEGESIS_BUILD=ON,-DLLVM_TOOL_LLVM_EXEGESIS_BUILD=OFF"
 PACKAGECONFIG[libedit] = "-DLLVM_ENABLE_LIBEDIT=ON,-DLLVM_ENABLE_LIBEDIT=OFF,libedit"
 PACKAGECONFIG[rtti] = "-DLLVM_ENABLE_RTTI=ON,-DLLVM_ENABLE_RTTI=OFF"
 PACKAGECONFIG[shared-libs] = "-DLLVM_BUILD_LLVM_DYLIB=ON -DLLVM_LINK_LLVM_DYLIB=ON,-DLLVM_BUILD_LLVM_DYLIB=OFF -DLLVM_LINK_LLVM_DYLIB=OFF"
@@ -124,6 +129,7 @@ SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " llvm_sysroot_preprocess"
 llvm_sysroot_preprocess() {
         install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
         install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+        install -m 0755 ${B}/bin/* ${SYSROOT_DESTDIR}${bindir}/
 }
 
 FILES:${PN}-dev += "${libdir}/llvm-config"
-- 
2.49.0


