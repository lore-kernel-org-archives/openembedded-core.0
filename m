Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD0AD1118A
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 16:58:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18132.1764176304078293219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 08:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iM5eIiP/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34257c62b8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQDwbas2527321
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 08:58:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=NDVgkExPhGNVsJDSzqIj
	fGPy+rab5YZI45FErf4HDds=; b=iM5eIiP/U2DayZRzHCZufzvQsnHAibUZVFbZ
	1fYHv0l1ZLI+wHMXu7srEfoAfPdGZL8dWW9ULJ1eayUIowXg7lUX/BbM8qDFF7Mo
	0+zgAqbqD7hfOP8JL30HwPOwu0pCkCpxrFvsfDFlJcCYG+mvx7SBYT3NAzyB0nnj
	pbuJ9671HLJbjIItjIy7tE9AIlP94T8o8nsbiII9obSJTeptdnGiHPSEnqNpgAfJ
	FzZFjzswYjPGG+CkBK136/zaFtslfmqiTvpSb6mXjbZ5gnVHFey+EdeTK5M8eJha
	UbzzBGVnEPMkihZSCrR3G9sHensmC6GdZsuAJ896usRFcVavJA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak9b5cp3x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 08:58:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulxMCc5lrjeNEBH8utjY43vUnOCsJEpo8LBDVRxmGhYiRHxZQZ+yjTDfefgwVUrtPYFsNljqhBslCaYaAjJxQBO+bGLrmPfPktvN4qKYWWdyvQpUuZU+cyBj6MjPf99edR81G5zm+0tJVbOZIHe9HeagPhwyUDei8+2yNVFMQE8Kj+5SF1FNfUdTntw5SuNZsgSSGx84LyNgnN7CF5MvsinlOZnjMVfLTQkm8As+5+2Rb0BG0rirhlDmHzyGqwpyBebrxCV1oWDTiSnmJQwLJAJucG/ToZEoLGd7Q/o1Ug7r2+WcEUc1yOiZcure0AskZJpkUdREe3TgRo4jXDIZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDVgkExPhGNVsJDSzqIjfGPy+rab5YZI45FErf4HDds=;
 b=UGn63nY3MhkQse+PqCRMQVatUg7GoqQzX7hsIMigGeeOlcIpaqvgp/M2Ty4YZ+aqpcG+kAj9NEGE2CYXTMp/NKANmjHSPT0E1vlk0/pgiSEXX1gKsI5eaOtvFig8Kw3ZZ6BECUbcfG4MXy2Xihfz+liQ+5xevY7bkutvQCDIHoadiwGm8y3EJZCKxtKhsZTO39KuJdWp1kvq0E5qkFF2SesaVoRusZSvVVsHYZj6Yn1wh5+xgy18ePI0m63CkZlPY4R285pa7L5oFQfQYa21rGzz6TtQcun4wrtndmmj/23hHpdUkkdgnpn7ZDShw7fp1LnwaPm6U9u3AqxlYfB2Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.11; Wed, 26 Nov 2025 16:58:22 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 16:58:21 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kea: set correct sysconfdir and localstatedir for keactrl
Date: Thu, 27 Nov 2025 00:58:06 +0800
Message-Id: <20251126165806.3422444-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: e23cf486-70e3-483e-82e0-08de2d0d017b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lWjH4xSigHmhu3hAd1++hHNE8CwiYDISZyUi37lnzK5Z/vRPKiTVzekNtaRp?=
 =?us-ascii?Q?gp7QWwCb6PZQ3C/RjYEB0GUsefzoxfiJWMSvtDr5wPObK1ulYevjo1YYMIHx?=
 =?us-ascii?Q?GTJBAcbAImtYxXGzgD4OffUaZp+yxRk1JzfLFmH4yeJjE4xAh2n5jtU0GOLJ?=
 =?us-ascii?Q?sq4Gb1Ejm3twQX/HEimNDpt3BH85RCheTySUkmqjUDmy6qUTQH2AI/FP9p8S?=
 =?us-ascii?Q?lhz1ynHs+hQntaudc3bcgI+krobTVzMa0b+q0qQwOs0fiwBNEhud47dhez8M?=
 =?us-ascii?Q?JoJDYrkffuT28EAnEKaKdA/y4/izJvjejMBqUOWNU+eC+ucbM3oJaTsJH2jy?=
 =?us-ascii?Q?QqhHGCItM3DIFE/vDbVNc6pMmQ1gCEJ46B9JXK8ucZ1pMer+DqIookE6HsVI?=
 =?us-ascii?Q?NFlU20+TRoMbjvG3kDNnssVxABu5DdoZYPVnDup6D1ZqeA2qOQZcJoFcl8HR?=
 =?us-ascii?Q?aLPFvXiQVdG7ARtJwXdkjSj3Ra52tHtdBshSU3JQCaKqfQTmS+Ed9lQS8yaR?=
 =?us-ascii?Q?+SKIpWA9icSyY51rzkxJeU+EdZHq2KIQP1ssP92qGrTlZlX4mill1owDX0S9?=
 =?us-ascii?Q?N374th/ezukWE31y72KgOBg1uzUo1CBPT6zOg/Uh3/QnQi7WZHv3lJ4+JtDR?=
 =?us-ascii?Q?qIwIrG13x5qIVZqh9xbQv6sflej6Vg9j93fgKKpSga1LKxxRndZ1FlH3AmKk?=
 =?us-ascii?Q?PHkEWwyCgRhN73Y3Up9rXAll/O46HqaSRJRNS7dR1+kXAlSYKy/FctIgGur4?=
 =?us-ascii?Q?ACCDJTWnLdYGnlO4PbtPrJmmzYF5nC4RBQuj2DcWw1aCjNM35OoQS5c4Pz7v?=
 =?us-ascii?Q?7ygnNkQs2KvRBKtZRZBisRS1MtCZ0ef2yDU6hNUL4/fRwEMbNjenHW5LdaGY?=
 =?us-ascii?Q?Z73OBgnqnZenzNUYXzqYcTRCSzJxsSs4cRMMxcRXGA5IbmDI9kKEt3YQJYpg?=
 =?us-ascii?Q?TLHfyz7+mdUDZy3AE0UYZkttMMOedSSIXpKoqcmMBqDKJ4hhuzmxgvUIFHLd?=
 =?us-ascii?Q?UK+prI/Qnq2frgYM9vHVaS5mfNZUc59F5SdhcuOOL75xz3Ta8TZBX2OMbMpS?=
 =?us-ascii?Q?88exPztV+vr4NtNQ3O5jd3wWCmfPxly8EUfhg4/yZnXNncQFo+nSZc+HqhXp?=
 =?us-ascii?Q?ZWuEQ0tWsa5HKyYzQIrJ0/GB9z26+LQLdn3Fc1HAW8sB153LZ0whosZs8oCC?=
 =?us-ascii?Q?1C2abQIOR9Aympu8LkNxq06XAwMMm9jWgpMPG/yEmm3g9NNF1kAKJK70Pddg?=
 =?us-ascii?Q?VBfVQF7D3AR0JoL6YeMIXdgJGLYGaXeHOMLODInR8SaOIu+HMO2WLKJS6tAe?=
 =?us-ascii?Q?A1u5eyvx80QwOqXhMD3T54JRgMbXRpeusHb6joACvRivG72uXCmC+eGUaS5L?=
 =?us-ascii?Q?u+rZRgYPIYiZAc3O4ToHrE67r4KXZieXpqO2jnd+cLKaQp7Y+wQmDulFrRxh?=
 =?us-ascii?Q?wJtvdfxsu3JUI4+vGiR86XA4TJO1z4XbH/EHNr78dn4DElndKO/TzanOHROk?=
 =?us-ascii?Q?l5XFjpQSxDoYHJj2jt9kGGGwlNMhFL8r3uyB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VqoH5gotOor+2nG/lq5az9TgssEuIk0ippJTWfUBbzvlfHm7LZyctrXMvFLk?=
 =?us-ascii?Q?41bpasnxk5b+Pn8rpkpInH7A1Pexhv3ksDLccknqAKB3WYhZXnM385mPYu76?=
 =?us-ascii?Q?fIMDZWvF5rMwcsJhNtdL4AKIGsz3g21smMLUCGFpC7hicz1oFpXgqxOiIInp?=
 =?us-ascii?Q?MWwnBt5vslatDNdQ9lydaF4/n6413d+0W5zh9HVgaDcIPoxy0BAepzif9gs9?=
 =?us-ascii?Q?iXg5gpgYbr2Ibvc0NrdD3GWRKTLIZxcvIMs9AuoAGxZvcfOsvWGI9cVdJP3X?=
 =?us-ascii?Q?h8lzhE5QAA5Cy8BTvtk8UdsnsR9ZQaV+lvKMgwObtTGC8bfltK+cTIoTqJAS?=
 =?us-ascii?Q?N6Kcc11M3DAhV639W1ncjDdXZx9oDzsczp+0aAkF2l+JXsIOTJp0Rvqn7BCC?=
 =?us-ascii?Q?aMYW4qFmD5swheMQZ9W6+McXrkUoNaoIA9iORLtBea+Y//H+nOrvPmG66zMH?=
 =?us-ascii?Q?Foune1WtEFYYVlWgkXw2KteCpm/WPEXKUM43IbDTvvnWnnX6cbvGjbBuPFby?=
 =?us-ascii?Q?i5SdScE/t8zMeuLxAYs+68KBRFx89ZLycuqTedtEEa/pGxvNjNSIx74sdVsg?=
 =?us-ascii?Q?mYOL4G8ZBYoJCsezKVUwbR8o6A7sJKGCpm4AoV1J0yifBRLfhT2v5TmfyJbL?=
 =?us-ascii?Q?qT6uYE7BYmXxXOF2fE7FtejYcyt1Di2/52mtJN+5mva7bAMBxasIixQqYanU?=
 =?us-ascii?Q?MbuJBj3SCIwB32OTRP4oWBR/xA9oM/ZAx0Rqwz2bQjXNukKJ2VE8UsueKos5?=
 =?us-ascii?Q?83WhWtV8E4elxQGR0BeTR1VB6zm54omLjHAJ7I6Nv7s89HmTWektjEMmhNKo?=
 =?us-ascii?Q?a2t1LybQJ4kBrj+SgTqAwUCnLr9t4YP7zrjzes6/wRPwjQmyEYYO4Pqj7nIX?=
 =?us-ascii?Q?jHqdIH858WJilPPZsKa1fjei+aYwItDMoEy0WqfZlukh1AukOrsmall6VQdT?=
 =?us-ascii?Q?PjKCSdYz5CDI8//eZK1QxMTB9IRWUoUZKeUNJbGPU4zsX6gGLBKmMD2SPUu0?=
 =?us-ascii?Q?5WyoDyA34w1R7cbwfZyt2Jr1wfl3KuzmcH4phhpuWCbivJkkLHt7Lk/uHl1h?=
 =?us-ascii?Q?onQ+v1DrZXfmpN9K8QNHJvs6YbeTl8Si2KEkHD2ecBDvWyRpkAw9gnWKLyaO?=
 =?us-ascii?Q?m2iwGPQU8KKCygFDHu2D7mKy3mWuWiTWzqG/2wmHHM9kNUtGO5Aax+s+8Q64?=
 =?us-ascii?Q?nrvfuIBaa8KSYA4kdYL840l2TijDk0qawZe1BV+OnDwpGK5Ad4ziRhJOjSEY?=
 =?us-ascii?Q?BD4dC0peLle1hwIKBy+EMOctE6tDuePz35z892CquVyHfWOtEvVvdH/hpdvl?=
 =?us-ascii?Q?hpUtRqOW3a0bZf4UiWj8glmD8LXyAXe424KDtnC2WSF6sy6c5/my+SUb3MPe?=
 =?us-ascii?Q?2URFWy14SQXvJ08ewx6pLlV5IbkoYzxAUDEfo5/YiCnGu1gDmlXaqZAJ6SXj?=
 =?us-ascii?Q?+ojePS97QxU40ePi2+JBPbwhkRr79LjM8m+/vPRU+yuABLDC9i918HPHzbV1?=
 =?us-ascii?Q?HBHSw1jvutxgXO/vACzziX9Lkh4u9sCaWa3XMn33cDHVMlYoFaVWw+9KagXE?=
 =?us-ascii?Q?ywgbTz7B+47piwMc2kXi4yowQG7M4XDyZv7n4Y3v?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e23cf486-70e3-483e-82e0-08de2d0d017b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:58:21.7556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBt0f8ZwLxhv1YAjgtrA3sDc4iybdoUTIiQsadDWquPUO4uCWlun6ma3X3Ce56UbaVEhM9zsWSqa8/HkYYgnhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
X-Authority-Analysis: v=2.4 cv=fozRpV4f c=1 sm=1 tr=0 ts=692731af cx=c_pps
 a=U7vFK3P1qsHFYF4fogjkkw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8 a=ihNkgqTXe_Pm8ySP-iUA:9
 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX6We/dxVZvCpz
 Rj3ENpix3Zvk5lKKD86hSDnE+qKCGUHEDtuFa731qOnJo5gpwkfbBtRwkF6vY0hf2qww9Ayyjh9
 9XREagxF8PO1dqHyFG12zjtD0eW323SKcccWgUGDbkERw5uG1EDTleh04zVXHrLM780UcnfCsfX
 vHoE/8gAhDpczAZ883vTs4LG+VIB9NXlvuAUeX/p/VKqrB42TOf5o/ZZ3nb/7s5iFBsi4aLbt32
 3cFhVpzc58jcUhfmcwIf66QhAoiLFaSaQaKNHgBXq/sN4RnqEZqYzcN3DrhU0eYgrl4UP5FdspP
 HYXNrJ90XNqwAWlRcw7qk+YxWePvhhrsOcD5s6MUMybJjT98RFG1mDCNLjD6arSGahGsrKKRe1x
 g0s4WKNJL73jd4bRtG9xoAe1tjmRJQ==
X-Proofpoint-GUID: wDfmmAiq6VHc_u-lxGuOudCOa97Xl614
X-Proofpoint-ORIG-GUID: wDfmmAiq6VHc_u-lxGuOudCOa97Xl614
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260138
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 16:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226807

In keactrl script, both sysconfdir and localstatedir are prefixed with
${prefix}, causing an error when keactrl runs:

$ keactrl start -s dhcp4
ERROR/keactrl: keactrl configuration file doesn't exist in /usr//etc/kea/keactrl.conf.

Remove ${prefix} to ensure keactrl can find the correct directory.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...correct-sysconfdir-and-localstatedir.patch | 47 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_3.0.1.bb    |  3 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-keactrl-set-correct-sysconfdir-and-localstatedir.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-keactrl-set-correct-sysconfdir-and-localstatedir.patch b/meta/recipes-connectivity/kea/files/0001-keactrl-set-correct-sysconfdir-and-localstatedir.patch
new file mode 100644
index 0000000000..0404fb15cf
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-keactrl-set-correct-sysconfdir-and-localstatedir.patch
@@ -0,0 +1,47 @@
+From 2e9cf3d04d1772660fb8b36df574a055c93764c5 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 27 Nov 2025 00:27:48 +0800
+Subject: [PATCH] keactrl: set correct sysconfdir and localstatedir
+
+In keactrl script, both sysconfdir and localstatedir are prefixed with
+${prefix}, causing an error when keactrl runs:
+
+$ keactrl start -s dhcp4
+ERROR/keactrl: keactrl configuration file doesn't exist in /usr//etc/kea/keactrl.conf.
+
+Remove ${prefix} to ensure keactrl can find the correct directory.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/bin/keactrl/meson.build | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/bin/keactrl/meson.build b/src/bin/keactrl/meson.build
+index 0b5b860..63684b1 100644
+--- a/src/bin/keactrl/meson.build
++++ b/src/bin/keactrl/meson.build
+@@ -3,7 +3,7 @@ keactrl_conf_data.set('PACKAGE', 'kea')
+ keactrl_conf_data.set('exec_prefix', '${prefix}')
+ keactrl_conf_data.set('prefix', PREFIX)
+ keactrl_conf_data.set('sbindir', '${prefix}/' + SBINDIR)
+-keactrl_conf_data.set('sysconfdir', '${prefix}/' + SYSCONFDIR)
++keactrl_conf_data.set('sysconfdir', SYSCONFDIR)
+ if NETCONF_DEP.found()
+     keactrl_conf_data.set('HAVE_NETCONF', 'yes')
+ else
+@@ -14,8 +14,8 @@ keactrl_conf_data.set(
+     PROJECT_VERSION + f' (@SOURCE_OF_INSTALLATION@)',
+ )
+ keactrl_conf_data.set('PACKAGE_VERSION', PROJECT_VERSION)
+-keactrl_conf_data.set('runstatedir', '${prefix}/' + LOCALSTATEDIR + '/run')
+-keactrl_conf_data.set('localstatedir', '${prefix}/' + LOCALSTATEDIR)
++keactrl_conf_data.set('runstatedir', LOCALSTATEDIR + '/run')
++keactrl_conf_data.set('localstatedir', LOCALSTATEDIR)
+ 
+ kea_conf_data = configuration_data()
+ kea_conf_data.set('libdir', LIBDIR_INSTALLED)
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
index 8729b1162e..70738783b2 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://0001-mk_cfgrpt.sh-strip-prefixes.patch \
            file://0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch \
            file://CVE-2025-11232.patch \
+           file://0001-keactrl-set-correct-sysconfdir-and-localstatedir.patch \
            "
 SRC_URI[sha256sum] = "ec84fec4bb7f6b9d15a82e755a571e9348eb4d6fbc62bb3f6f1296cd7a24c566"
 
@@ -68,7 +69,7 @@ do_install:append() {
     install -m 0755 ${UNPACKDIR}/kea-*-server ${D}${sysconfdir}/init.d
     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
            -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-           ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
+           ${D}${systemd_system_unitdir}/kea-dhcp*service
     sed -i -e "s:${B}:@abs_top_builddir_placeholder@:g" \
            -e "s:${S}:@abs_top_srcdir_placeholder@:g" \
            ${D}${sbindir}/kea-admin
-- 
2.34.1


