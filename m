Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC9DD6B09D
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:40:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19163.1769704791220536469
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=k0gtv4o6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=64894db884=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T4Zwox1232896
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 08:39:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1hgkzVh45fB8yLND+Nro/r3sd+Y8J44QlEFsNoxIiSY=; b=
	k0gtv4o6ZECzt2WkpB4rUaCYbyjtWox79j+Ps3Un6M5e6vSFFrrL2J9ds2JEkcD8
	k2Pj5sV+Oj5STO1+LJ8Z4D5ATWYONsm5JW4t9F33yeZATNoUxLmrsf7cvD9ykTad
	D3UYgkc8rT3Q6QM+tGwvewtB3vjqBgDGN4vxtI+473LnTow5I9le6/aMtbPmXK89
	DoD8Qit6z4a69G9iPUOtSgG83C8HQUGnqIkRcZHAXOYuOgmBk6gvVN3F6ZcFFXCC
	9iYM6LYNRG/ADF5QkRmtjIiUZEb57H0QSmdaRZFS7LIJpa6Bn99ODjKiXuQvLxGL
	N2QFDj3pHsGemPk8OFqdGA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013069.outbound.protection.outlook.com [40.93.201.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwrgssm-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 08:39:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hq0kIsiyTT8QIPT547M4EKHCWLi2Hx42aGkBbRRzPIBr3TZT1RMtaRvh/KIePwLXUV/60yUmYVWXhhT5qGtZN/CxAQ7sISqV4cOSvL60llKIEqJkuz0TF6HkXPl8hvJyl+gKLppwRX6adfn462gY0ym0HWElXsYCq4snyRKbgzjkcIgTrSOiGHEBGqXB87gtAfSdOn4Djcp0mPsrcYNx37xUcPBEjNMeM0gyyc48eM2u6nrR6btWKkSGDR1Y56ottXkyOe3lfj/vnrmWkS+G8Y9EEKtNBJbu0jhY7vNX0DZ0tQX4Zh0ZpNeQnsNQLMSXunIXxm/5rsUruXWRSYLeEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hgkzVh45fB8yLND+Nro/r3sd+Y8J44QlEFsNoxIiSY=;
 b=yBsX6mIHrHqoUr3v6iAmPWnTNHLaDdLjjHOPbsvTkDKy1+rTFCBhAn0JteWoEv8NjQ2Vpu2CUFH0cCKiagpZG33Rd2itG4y9HX0lFRcmeq7xfyUn9V0Js+yRCnj8+7gc9/kaRs+f8wSdZ+JfGPrW+5jywcxsCI+lNDGIY/F4piu0tH4ZZXrcm3NMCajSoXvTTlJwtWEWFYZPSrLehDa3nXR4rQzO2tAVDd/Gb2+SO48VTvt50wQqO3pQDf/Ldj7nSrO3qXToudL+73jbu1PEKMRY6aQ+wQOb73Ts5JZ/m6KXG/PXX187u9M1vTrpI1yrPaUeqQ1w1lgm8Vi65PHmNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 16:39:48 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:39:48 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v5 15/15] runtime_test: Add rust-out-of-tree selftest
Date: Thu, 29 Jan 2026 08:39:10 -0800
Message-ID: <20260129163910.2612040-16-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA0PR11MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b1b072-5938-45ff-2006-08de5f550446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HmSiuh/bWFzOAxSOy50dXMaz/BC8UD2LVMgAp6Jrbe4b01y6jILpVeN6M+yE?=
 =?us-ascii?Q?vk+YPYVvL35OuKyOTc7F0W373GlLoBjjNm54F5fO+svRb8KFtPQmu4in/9eB?=
 =?us-ascii?Q?Gm6qx8vObNatpfZBEZFszKEvkd8KIATJzzk1qBYpWvu57xojoUFTkzJNEd3m?=
 =?us-ascii?Q?qGSvbAy9yVay+6tEiQxITMu8dQyKbBZnFl1gBxEoCVSMc0PFNlAg3OWqWhIh?=
 =?us-ascii?Q?Ul6z2pMs7NCbXGgSxNl1viKcOaqNenLN+jTTkwsP7D8v3hyEtd3chUeT+1lj?=
 =?us-ascii?Q?ve4ChPDbcWIRGIu1G631pWwTtwyDpnbJrG/lLRuOf1EfGuwW44RJhe5E9AMr?=
 =?us-ascii?Q?p3AuWmcwm6+9x3sm0i6ftzsQ/ST2D60yGIPVgpYmxq723jYrdsd1G3ZY4fqx?=
 =?us-ascii?Q?WVuluFB5r+Siam9srHHZVAIFU7EaJPNYMv9cwvbF4a6RV5JfUUcuC4AEnhX8?=
 =?us-ascii?Q?ZnER/QX7w6ipC9heV1i+30X0dnEnqgEVw5md4OHi04prS8WUPdBkJglWylW4?=
 =?us-ascii?Q?/GPxefWVH6Y5iZfAQNgXCi5qvokXOoM59CWxZBl3U5jredq6yrw1a5+hLqby?=
 =?us-ascii?Q?ZmqwcJ3IROkN+NOHWcJtqTweViyvquaMk9elyuRrvqqbNqj4IGhBzg4BSbOO?=
 =?us-ascii?Q?ILEZ0GkBr3vCqQByfKNMq22E5MPxGO53K1nuWFURefshjsvzwHH+pbaTz/Pw?=
 =?us-ascii?Q?tmBVvR5RtCQFmsSRUl3sRKwE2KahweNlBprG0Hw6V2Xx9Scg6DSAvRa5rSex?=
 =?us-ascii?Q?YPg5cxHTYmPjRzBmtKrUvykR8Eg4skO+Ehriff2J8AJjwC0lWuANViTO9yyH?=
 =?us-ascii?Q?vhIcgs8teCK+tJRyyw4d5J8UxI5QExqMGTNQUBAzGg1Pg5JdNs9A1gCTON0u?=
 =?us-ascii?Q?UQdHNk9WgjuvJsmszid5cF5rBdZeP/tjV4GA1XCm4SUeIoPspArrBOuX6r3i?=
 =?us-ascii?Q?gT1RBNBfMXDwCLv9tfSpqYBw/u3bw+NJZDmBXzDs21IWp8vQyrq8GDvdUBjg?=
 =?us-ascii?Q?VBvxVNmm6RL38OUwBZCkjHHGfN7pr/jP1DnDQ21vFPlbuwpxn3OrkZsdq2ID?=
 =?us-ascii?Q?VBZE2tXp913Q8/QiQNjlSvE9jB4SQVyRglgZk1YqD5O0yNJXGnJlUvO4h7B7?=
 =?us-ascii?Q?QA6FylZV81niiB2/oNFtNxYWeb9EvlWM1GwjhI5od6Hqc1zDnuu2dCf/+1/p?=
 =?us-ascii?Q?GdNTGA6zas4Jdwiyx0mohIot0Fso9UEW464KhTysc8BQCjeMCS8rDHxfyUbr?=
 =?us-ascii?Q?kYuZ/C4ZWa7oXBF+9/ljdW+/xu4cGrzVp8EJ39RGC+jSEpcxK+bpzPN+azSO?=
 =?us-ascii?Q?L/tvqg7WjoJMBKEN98PlVKnFLh5kGvflbPDMdcrLC4Gzj2tEp0LAmAvrl+nl?=
 =?us-ascii?Q?/eOzjdziFk1U+nbyo4Oua0yP/k1TQTfBFp50qFMZIjU6SQI1B84Zyeb74U8a?=
 =?us-ascii?Q?BgXyeylZQ2MTWNoH1TEC0Vvbq3LYEdLtAuqPBuDXMBHec2fN/kOxpluX9hy3?=
 =?us-ascii?Q?qpS9to6xN/Caph/XKn97ORlKj+2MMGbrn8ohkMmn5UIjqiMcrwahwAnAByX2?=
 =?us-ascii?Q?aqVZlWrJtQa+8Y84P/icque013r/smGmMP7HK46pZkwUTshM6seeVNWqqIDO?=
 =?us-ascii?Q?ggOdRH+k4vPBabAypLlKgDI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MSCP8EnkBpXysft1wYM64oLRyAFncBJfe9k5KLMhJgJ4gQqpvO3DDWb8mwPN?=
 =?us-ascii?Q?45MwH/Y9ljd5ngIujcFMMbQbSdXkwsqTfVLVzxT2ybBzI9C8Uo9/2iG0RsvG?=
 =?us-ascii?Q?OCwm8xHZ7gDVkX1rXrAlhGnz+dRndnr/DcBBE6gcCLAcb/fLmyrM4x7uk9AU?=
 =?us-ascii?Q?cIEhQSnJNVvZZBfY36KvhjrDnnEYSMjc0QjfcPk4WeLDlWnKYkdqUewwVgUa?=
 =?us-ascii?Q?3aBRxtbxBiuiF+DLddYNPek4T/TjxPXshWjS5kG7ez7G4d3QeVApJfJy/fWe?=
 =?us-ascii?Q?+72q0AXS0nnGBa0VhvE7panYIlMSoEcahheqI96uxclBtFH71jY3m5sfgHy3?=
 =?us-ascii?Q?nFVXuctoXwt2XZo5bJ5GLVcRiwcr2Gh3Pe7TJKUB65XndFtKDFcxfl5yEljf?=
 =?us-ascii?Q?owvm2K7c0d9lD1XFXcOpJ+ng0XTyqioP8t6gQ3UCwhZ+1FnxwoBgqlYfZtn8?=
 =?us-ascii?Q?wf0uZcwYYGynj0cSbXJHu5LlzEessmsSiTuXA7gzeAMQ+XhTUpVQ0sfK9Uow?=
 =?us-ascii?Q?eRcN0WYviivuwkl0eCKl7zz+uJ6zZYbLAYHnDxZiAkxjF2lsAxb9aQXbgK9g?=
 =?us-ascii?Q?P9bxOx/dAuJIJWZ9xIJPA0xObxfGcMzp0sMHnO5cJiBvdKtH9lM47jTg19mU?=
 =?us-ascii?Q?mHGPwX6cvQDOSD+YysUvTlEDnQNTxeS34YiwIPgGw6JRZQ8JcE2BkRmXllc3?=
 =?us-ascii?Q?sl+gzkuBm8SnsjnrfqfAcgQfcmRB1b3+7HORAOoeXvOYw79ESP5t7JOsRa0N?=
 =?us-ascii?Q?xq4JfaHuVUQIosIbQvQnL6QWFAcpYerb4vZJhD2cFKs7hkO2MvOqiPDmCpON?=
 =?us-ascii?Q?ELs15rl6ru0ZSHiArRRnB1LPx6TIfh7kr8Szp0Vnfr5rNttgdMFl+lT2HkDo?=
 =?us-ascii?Q?ZhGiT1vtWYPXxOyPECRmW9g3dkNvcCtR1mvmllTre07O+HuIru7qtjG07jyq?=
 =?us-ascii?Q?yzL3EprWU7gzTKw3qdD/GnBZVOrwh4/THVOShoStcLhkdOuLqiPGtowkCqph?=
 =?us-ascii?Q?RInIZsF4blMvL2PVnGjoGTKVscyliK9MXpEYhW3liW2hz5TrpFkhE12Q0kGb?=
 =?us-ascii?Q?KNi3O7yzauX5sQD5rEs30RIJdDdwDwYoPVZRNJ+Jrzoid4baKGo9+C5VCe5Z?=
 =?us-ascii?Q?wkLlWH+kmQw5qNoFjq1zEkCySv+t5+sTztSizFzfXqSFntgjBED0uDn5MMbA?=
 =?us-ascii?Q?1AWiqlKDZjRNUkWqWAalWYoo59wzRoh3LQNzHrbG9V75Jirl7//CFCtR7PEG?=
 =?us-ascii?Q?Xr6xGlYEvt+N7OJPaBBFRYlVU1obm0WL3/b8UNc4Wn7e0tryIlyz4JVflNO6?=
 =?us-ascii?Q?F//hamslv3ONMWSKaXrGtQ1ptyB0fB3IA4A+VfQV8o1NwxK1+erm+prG5aaf?=
 =?us-ascii?Q?P9scYGr/zMrmjES/7tSUmpCwmyIJdMGF+OHWK9YKdBfDRFR9XvLmjIDF9BL6?=
 =?us-ascii?Q?Z4rSPrAMsibVQycRQWCskhWQ7vHBuFuERxdtaRXVbxYRd45UhcL8R4o0jxLE?=
 =?us-ascii?Q?uCYazPZcpKbWKOqfFJwB5GOEXmhYiOn9hH4gCmstYQJOdtnpQTUrNdkCWvsV?=
 =?us-ascii?Q?wEoiv7Ug0LFs3Dho22+HyDC6lVP7PPzt9sj1FK7BVSZLWl6BR1JaTuxvwjzM?=
 =?us-ascii?Q?rTkkhPfq0FTy0QyNR/r7LxgLkTEMQDNFeC5qCzwcASgyOO9ewPYTbEooFQc5?=
 =?us-ascii?Q?PB+72btke4hNPJv59p7rmssTyveN8Q4W3YTmcK/J/i0E9b8tE5GGxwl4cBg8?=
 =?us-ascii?Q?pFhOlm18BBPSfJB2xV567ZF2N3c/SJg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b1b072-5938-45ff-2006-08de5f550446
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:39:48.2580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPhwB7k2koJ6AUJVgWx/pFyxdwtlm2KoosX2kiSRJImrxJ0FDraEBCyEYW36qNWJiEV31Nrnt30VYoJZoASyX8KuqSnMlveBhEd8V/Ph4yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7910
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 2SJhxJuIxj41ZcMErnUV-R0og2wCSTBz
X-Authority-Analysis: v=2.4 cv=KMVXzVFo c=1 sm=1 tr=0 ts=697b8d56 cx=c_pps
 a=/NeaHkXls/iJsjBnUIdqww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=PMCPsi-Yzk6GkJUXyKcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNSBTYWx0ZWRfX3tv+v/ii0Lu+
 IkGLZl9pWlYMJBLNO323L1stf3KPnVbw0nxz8gI1FMcHb3yveToUAnnLA0iNxnqvY86zm36ro4/
 kyZEegaq1PFP92RMiWz06XoBHcEmA08OFRLQpF1Fnz/m5/KjSYuZ440yvmoTf3dlSou09dbAWnS
 HAE0U7PAgLY7xtbu/uhl9XweR74vVsGu43VV8Z9E63op6c7vY/qbDluQiec6s3JlZnrehpkvIEU
 +bR1nRTb8iejXgEr5tKQg09q8Y2Zkl3Y+8FqaQxcH5dDQOi3IET9LRrCB/9Pf3hdYbKpaWggbhY
 i5KpshIQ+eSUFOKWBJ8gNE5tM6TSIxNtcnoHSghmiwRgA6vknE6jMxjtf3NL+OBtJO93yr+urDh
 gfxUHa8SWgtRo51oVW9ITJ3Yd2bqLjqKOFc0RjJ9wPzmdoc2g4Zzix1+qMKp4qT6ViMtDcDGJhs
 BPG3Rllgz9o9YJG/9cg==
X-Proofpoint-GUID: ZAhdqdLu9If_KgBU7iVo_F3ed6v0kKjA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230156

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


