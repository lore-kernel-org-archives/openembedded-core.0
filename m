Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2ECF01815
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 09:30:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65770.1772789396908702478
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 01:29:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LnyECCvl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7525c7b9e6=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6265Tonh2779952
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Mar 2026 09:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Co9Jfu2FJtiZDvE7MTFw
	Ye27uBo8t+KEoFQSP5KRmM0=; b=LnyECCvlZxpSi8f2dPIEeU14XsD/Ima1teEA
	YXbUJbY4OCwLVqcvTR3PLqwyz8RKuLYv578JiQW5rmPrJ9AncWDWkBNnyhpfQAIi
	vH12ysWy/fcBnplaKuH7MZ9lgcL7A41CnxQTRwDUG956TnRlR/rPtO5d095Ljp7k
	gMBTvVPjVt+zz2DN6980SIUl5BJM2/IAgST6RbAKUMU50qAQdndIbUvBXoXeUaDJ
	VOQBoKi695TIVE2dlwtVwgHIroyHF+SUinEkuENjUJph9awQuWd0HVBoPX2s1AqD
	/bITmrmyeQpYBZhaDFNc+4HrypL+4UtRt6mCvckIM9XiCFkbmQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012059.outbound.protection.outlook.com [40.107.209.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvqt2r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 09:29:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLs0mw4YDTHXw/b1J5APUOQQ9dxMKQz6qEXW6GbRqkftsWJbj8DSzH7Tv3SD1xErLgJAnPnR2r/To/1YlhmIZtvduTf/oJY4Q06nnKXufzkWp3xd3XjzNHF+6ZYwSUnj5YvnzFnCxTy7APwqbzC9QploXTKYvIoqU4RYRLyLdTgSRxFi4xpAZ0PwARo7qt537F4bt/GTPqUzqBQtMOjYyc9DSYaxZ96hWJocsDRDglo809xrcnLPw7VBXQryB8qbTKZ/Zh4QNAoYV9+YYDYVRp3vLpVoV0E2vdN114d0crg3BwqqJEhkHR788vNAzYGXtm3Guwq+S7f+TEjxaF/Qcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Co9Jfu2FJtiZDvE7MTFwYe27uBo8t+KEoFQSP5KRmM0=;
 b=F3nHSMqYULJTaAq/NYTmObMy5CT/qwT/7vWNz19fZRhF5XT5cgWEwVsf+ewN2JXnvMOYu5fCuu3rLZ0v8R6TVJFMNvnE23CA3qbwOkAUWZUzMVwA/w80BbhYWpRDooQtMrVHLDa9t+77AxuN9VE7YYEM9D+PcJ0/MVHrMgga3SK3Zj4GABc8iLMBDLyyH8oc3WkgIrTA0JnrdXlhzuz4xPFjsypmzCzwp0Ggd93tPW2r80bsrqnAOlBRd96K9wwQVF4en2i1prL6HiPZ1z8VSmndhep0GtyvJOjNplPCLwzyuYJR6CrOWY49DSD2NzriT4kxC6gu2ePqViVlv+3Djw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by PH0PR11MB7523.namprd11.prod.outlook.com (2603:10b6:510:280::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 09:29:52 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 09:29:52 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] groff: upgrade 1.23.0 -> 1.24.0
Date: Fri,  6 Mar 2026 17:29:39 +0800
Message-ID: <20260306092939.1907718-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::34)
 To CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|PH0PR11MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: b40e5d49-172e-4ee9-a1d4-08de7b62eb7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	LAzSXml8NvKvYlwLcsCzTi+cUDb+Da03dc1RggWRO08jRhxv4fQYrFXHHEkCX9Z0wdBmsu/x3iZFUQa6uq3jZtKG/rq0foFYO0JIoOkE+ybt1TcQOyHU3XeqyzpvW46XBCBRJ9gumKcpC7X4Lb3kixHyQMiiOAGXO3ybNF99nS8xjoh0clqbFao5gMJ1z7NTgKZ6h366HwHrGJIWv25HXWkbvGrCKXDm1K4C3IJktahT3zeRPsbtZUS4+hAdlZwp3NjYy4b+leGec5E0c+tqwMV4B+k/Bj+/0+F0N070EcM8ANLeVWv90FUcTVDG9wCrRvpkQkEgoR1UdGanqFPUE/i2A+BKKUGkDMFQhw4YCB4bsLiyylR5t1gHzTwbYC69V86F6NZBJekh2tFbXLuJjzMssBfkTS5b9cMw8fdEsys0MqHnDJ6+70Dky+0/KUzkEwLMsWgE7vqz0e5qi9Hk3nvLoBNnfmnadIdsI7dGK57I6VGIJ/PNvJj5UxKcJMPQeLduyVKpSE10EXApTAR+8mNP+6LZBxBekOF7Qlw2cw0sz05v2cWAgLgJls/WO5ErCc8CdCDTGyb3XoxH3MhBYHcP2lAmc8cmDoBmcEOWecU1fpl/KdtSW+xYJpTWY5Mye11smyVh6VPDnsYfRU4L5zR83iuOlsbWu7gH50kCsImm+jjynC9iUC6mVfeEqFW85+CuhzRu7b+MVO2H136CYrUH1/5c9yNuBhypqUR2Cyk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?avLX2nDA3fC19v3hvYLQsqEtGVj7Zc161z1TWlJenHUxv8giKUNyTEk3tJod?=
 =?us-ascii?Q?AfN6QIuWpdT9ebV64BNSaZxbH2tYNXiT8AFeAzZUjkUvrrRZQqp9//6mKIuc?=
 =?us-ascii?Q?7tLRWujjlc2TVt6WyyAgU4Cr1onpcVg6ps4Xlrbxv/BjK1izGAnz+4UwTDR6?=
 =?us-ascii?Q?2tL7kTsIyQWJ6o7kZyEGi4NIALLIgqxUF9Ks+zFzBA6EoqI07cYuZVNFFYCg?=
 =?us-ascii?Q?/nwkiosyZZPhPdEBjtty680Zd8IOWOLhG1D7efxUbGaoW83icH+kXxl2tEAY?=
 =?us-ascii?Q?X3pXT+87NuDPqztqHN+wTu+yoW/6Eqykse/jV299BXiiD4v/L7hiNcTTXOLm?=
 =?us-ascii?Q?Z2L/fON/cIolVQ+YWEJf0pysFIzCVMObznek2cskKrz/jga1Lfp2TP4JMam3?=
 =?us-ascii?Q?RMNwROEbr9kmyyNkXQtKYtxx5Q9mShw6CMdk39iV8f4cZ83clDPDO1Ma/SmS?=
 =?us-ascii?Q?/wsTtrlhYzm/LDcBfowC24M/iiR/99DzhyHRqfxyO+tE6Y4ElxtL1OQ+i+3J?=
 =?us-ascii?Q?BqQYHVgpc4fthkG4HwkdornYFgoAoIDxSrWphLsJ2JYO6ZpoNGuwi2X2j0Yh?=
 =?us-ascii?Q?X66LFu7NZTAHbddanU4h4+sngTLjAv04ufwYy5IwmBWDfXW52EXEceXwdpS1?=
 =?us-ascii?Q?YJ4zJ0HanHiykiib5eWfDyDBt+6RudDke2ERO/HLmwAm6N6NYJaX57MeVmVp?=
 =?us-ascii?Q?Wh3t5l+j18M0iKwKojy8WLa4DR/3R2G1WPxryK+ABruMfc7YrLKmb0WnTlCX?=
 =?us-ascii?Q?G7raaUV9J5g9LL9ZaLtPDjCcoYqUv8+LN4QLvQQbg6F8wl2Pj/wd+mwQ7xRd?=
 =?us-ascii?Q?UG48lXjhxJSZav6+9rdajoQou1Rb9f2hnAJzq28iXKgfXHCi0ZvuARbesWVX?=
 =?us-ascii?Q?9spDg65a1d5YocTMpKswWURtw+oYaQlyKECuP2g43PFIjy5xc54kbAiY8ixq?=
 =?us-ascii?Q?vVLv16KLZMW2B5j3RwHT+81YiDA8CiKQmP8sAES9OqCg+XOVAm1qSr8RkCh/?=
 =?us-ascii?Q?WSa1Og1h+/lzVDk+d+g2XlnTua7OhoOlDOv5AzJ8SJ8uRrYcke68nVkaICPN?=
 =?us-ascii?Q?wOSMguowKk3Pk8P3edtwjn4iw0D+j3voL3XI2w5NdpOVhy0JDaAv9dNPj4+J?=
 =?us-ascii?Q?NlhH51aC66SYRc1Zv0udZitaSboObN/fG/9CGvVlxKeZa8Qdwb4kKCkN4lxH?=
 =?us-ascii?Q?QPIS/+KeAQpUqOnzxLM0Nx7j8bTpUPbbzd3Y1WYyfmGfpi+h6qzGYxBQoePT?=
 =?us-ascii?Q?34FwQXjAps+6TJYkqDwkZskPE3b6NJIYxCj1pBPtsD4gYCIEaUQhr+DNX0Ng?=
 =?us-ascii?Q?lb19IgMQlLSLY8WP+621Kgm9ynRnq6k0bfMhSt2/FFgisUHH0AoQS5PbKJLe?=
 =?us-ascii?Q?I2eHL21eyHh6PVTzPdhEgZFbYPHhyS2P2Lqkd4+c4KHkzS3ST5K3Vud30wtp?=
 =?us-ascii?Q?Z8VOW+32VPjfPFSZaqdOZpgfGz07ZX0gADLSzOssUECJPGe8y6cbSnESQtdz?=
 =?us-ascii?Q?n40flkk3NIuJmz6UdKqrlvI2C0M+lrf12igTeJcNA9olvfRuOHc8PlATAAzh?=
 =?us-ascii?Q?LBY5YDMcopMhA8pHFjrxhy4CQKyTfxYbNpVL2lDWUeSYjt594esQ49pNcZjo?=
 =?us-ascii?Q?qRGuT0Y95c9H1NVGOc+005+SJ8oiz9GHEGlkB/H0yOM3H+ce+UwAcm04BIEw?=
 =?us-ascii?Q?mCz7BWUjyorZJ4e1E5HCi7CiRkVaDie4aVke1QPw6aOSgSZPiBUtEA2SVTaP?=
 =?us-ascii?Q?K0G/H1kY7FGpqqW9gH2VqdOJiMm1jkg=3D?=
X-Exchange-RoutingPolicyChecked: 
	NbldD1fglJf5IRCF+C2JJcHROtNCKGhvM5nGIQm7TFAZFnJRtrsM9VjPuk9uoP8jPvZOJnju2PGe/giGGLGs9+7bfXYbADeBBC6q5EBu2AP8c8TBnhPcIafVfI0MogkGevfo+VJgrqtgItPukiM/E+vnchRMdsOTAAL2v7bNk09rrkLsmPbRZd60VLELHF2bGxqqJVYCHoE05ZnumT6sso326mxpZr2GEgMk9PiUNE6w+hnX2X+BOU+fEbzRNwdI3dVcY2hhBUThvh/I0BGtZPsa3AgCJ9hCKhChoYWEEY/3oCscpGM027zpnuXNn85FLLi5IA7J5h78esWsg+YpsA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40e5d49-172e-4ee9-a1d4-08de7b62eb7a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:29:52.5077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRgB6LIWjZR4hqlzlRp79uwnPzuMziuwlS5Rx/kINZfKyIknXMyAUju5HtOeBigsKU8+M4kb//L8U3Bym8BReAQ96H/x/bv08r+cff6LFbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7523
X-Proofpoint-GUID: 2TMFKwPNAk46UKWp1OY8mqBiXXYpcj-1
X-Proofpoint-ORIG-GUID: 2TMFKwPNAk46UKWp1OY8mqBiXXYpcj-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA5MCBTYWx0ZWRfX75S7b+xB/d+5
 Gpqv+0bLMIAXvvw86DQTrDA9HloZ0cTk6rZLszQ6X33B8GqrvHvHTKeYCQBlmTRAmPpgDrw2ROy
 EchrPyy3NSYcjDdD+eTKCDnoU9gEHBQ9fD4Y9kQKYW5UyA7hpxk22WrEriuVQimnEiiZPu5b7aL
 DOPbLOHaVSMUaMC9p2x56k/iHHChc/FhOCjgOKCeAEKz7QbD70JI6BJ/BKf6ygPcXS0m3zcLD9J
 Sz+a9WzlQBfm3OVmjTePMoIQnShD+gAZr5tdORDsPbzZahAdTSD8izZi0BGqcyGqRFvuT8NrGFg
 YjUltqlz9X9BF5spQI9ZKzq47OaeLjq9WcDwaW5Q02knxZjaMRFwtQz3Dex/yymtkj+h6+9zawi
 mu+M/YsPuz3Z3NUZyXKa+b0DXhcYhIp1ofLjF0HrLEs09Ni4COIttnR1P51Bi4l4QxtuW/yldn5
 dT8QjAcJ5n6L7LtulgA==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69aa9e93 cx=c_pps
 a=e24IK3jsPB00aLvKg+wNHQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=NUvdeWyYgivqilr-G6wA:9
 a=IzK17sBsm1lZZRsP:21 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603060090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 09:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232559

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Upgrade to latest revision of 1.24.0.
- Drop patches included in this release.
- Add patch to fix test-groff not found in cross-compilation.
- COPYING, LICENSES: Refresh GPLv3 text.

Release Note:[https://lists.gnu.org/r/groff/2026-02/msg00149.html]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...d-Fix-Savannah-64681-webpage.ps-deps.patch | 51 ------------
 ...1-build-meintro_fr.ps-depends-on-tbl.patch | 31 -------
 ...tbl.am-Fix-race-issues-for-parallel-.patch | 31 -------
 ...getopt-Fix-type-signature-for-getenv.patch | 27 ------
 ...groff-not-found-in-cross-compilation.patch | 82 +++++++++++++++++++
 ...l-Fix-Savannah-66316-missing-grn-dep.patch | 38 ---------
 ...groff-not-search-fonts-on-build-host.patch | 10 ++-
 .../{groff_1.23.0.bb => groff_1.24.0.bb}      | 10 +--
 8 files changed, 91 insertions(+), 189 deletions(-)
 delete mode 100644 meta/recipes-extended/groff/files/0001-build-Fix-Savannah-64681-webpage.ps-deps.patch
 delete mode 100644 meta/recipes-extended/groff/files/0001-build-meintro_fr.ps-depends-on-tbl.patch
 delete mode 100644 meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch
 delete mode 100644 meta/recipes-extended/groff/files/0001-getopt-Fix-type-signature-for-getenv.patch
 create mode 100644 meta/recipes-extended/groff/files/0001-groff-fix-test-groff-not-found-in-cross-compilation.patch
 delete mode 100644 meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch
 rename meta/recipes-extended/groff/{groff_1.23.0.bb => groff_1.24.0.bb} (82%)

diff --git a/meta/recipes-extended/groff/files/0001-build-Fix-Savannah-64681-webpage.ps-deps.patch b/meta/recipes-extended/groff/files/0001-build-Fix-Savannah-64681-webpage.ps-deps.patch
deleted file mode 100644
index eae5dc9998..0000000000
--- a/meta/recipes-extended/groff/files/0001-build-Fix-Savannah-64681-webpage.ps-deps.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From c75965053124149381ada3c394da74be078076cf Mon Sep 17 00:00:00 2001
-From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
-Date: Sat, 16 Sep 2023 16:28:00 -0500
-Subject: [PATCH] [build]: Fix Savannah #64681 (webpage.ps deps).
-
-* doc/doc.am (doc/webpage.ps, doc/webpage.html): Update and parallelize
-  target dependencies.  Resolve race by requiring "grn" and "soelim" to
-  be built first.  Also add dependency on `$(TMAC_PACKAGE_MS)`.
-
-Fixes <https://savannah.gnu.org/bugs/?64681>.  Thanks to Alexander
-Kanavin for the report.
-
-ANNOUNCE: Acknowledge Alexander.
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- doc/doc.am | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/doc/doc.am b/doc/doc.am
-index cddc51907..d3c9ab6b7 100644
---- a/doc/doc.am
-+++ b/doc/doc.am
-@@ -346,6 +346,9 @@ doc/pic.ps: $(doc_srcdir)/pic.ms eqn pic tbl
- 	$(GROFF_V)$(MKDIR_P) `dirname $@` \
- 	&& $(DOC_GROFF) -pet -Tps -ms $(doc_srcdir)/pic.ms >$@
- 
-+# groff(1)'s `-I` implies `-g` and `-s`, so we must depend on grn and
-+# soelim even though the document doesn't require them.
-+doc/webpage.ps: grn soelim
- doc/webpage.ps: $(DOC_GNU_EPS) tmac/www.tmac tbl
- doc/webpage.ps: $(doc_srcdir)/webpage.ms
- 	$(GROFF_V)$(MKDIR_P) `dirname $@` \
-@@ -365,11 +368,12 @@ doc/pic.html: $(doc_srcdir)/pic.ms
- 	&& $(DOC_GROFF) -pet -P-Ipic -P-Dimg -P-jpic -Thtml -ms \
- 	  $(doc_srcdir)/pic.ms > pic.html
- 
--doc/webpage.html: tbl
--doc/webpage.html: tmac/www.tmac
--doc/webpage.html: $(DOC_GNU_EPS)
-+# groff(1)'s `-I` implies `-g` and `-s`, so we must depend on grn and
-+# soelim even though the document doesn't require them.
-+doc/webpage.html: grn soelim
-+doc/webpage.html: $(DOC_GNU_EPS) tmac/www.tmac tbl
- doc/webpage.html: $(doc_srcdir)/groff.css
--doc/webpage.html: $(doc_srcdir)/webpage.ms
-+doc/webpage.html: $(doc_srcdir)/webpage.ms $(TMAC_PACKAGE_MS)
- 	$(GROFF_V)$(MKDIR_P) $(doc_builddir) \
- 	&& cd $(doc_builddir) \
- 	&& $(DOC_GROFF) -t -I $(doc_srcdir) -P-jwebpage -P-nrb \
diff --git a/meta/recipes-extended/groff/files/0001-build-meintro_fr.ps-depends-on-tbl.patch b/meta/recipes-extended/groff/files/0001-build-meintro_fr.ps-depends-on-tbl.patch
deleted file mode 100644
index 3e81b86ac8..0000000000
--- a/meta/recipes-extended/groff/files/0001-build-meintro_fr.ps-depends-on-tbl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From f21e9f13beb57a1e0666edf9693d7c83f2189897 Mon Sep 17 00:00:00 2001
-From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
-Date: Fri, 22 Sep 2023 01:27:57 -0500
-Subject: [PATCH] [build]: meintro_fr.ps depends on tbl.
-
-* doc/doc.am (doc/meintro_fr.ps): Depend on tbl, resolving race in
-  sufficiently parallelized builds.  Overlooked in commit 92349ae223,
-  2022-05-30.
-
-Fixes <https://savannah.gnu.org/bugs/?64695>.  Thanks to Alexander
-Kanavin for the report.
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- doc/doc.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/doc/doc.am b/doc/doc.am
-index d3c9ab6b7..0f95c7774 100644
---- a/doc/doc.am
-+++ b/doc/doc.am
-@@ -334,7 +334,7 @@ SUFFIXES += .me.in .me
- 
- # Use '-K utf8', not '-k', in case 'configure' didn't find uchardet.
- # The French translation uses tbl; its English counterpart does not.
--doc/meintro_fr.ps: doc/meintro_fr.me preconv
-+doc/meintro_fr.ps: doc/meintro_fr.me preconv tbl
- 	$(GROFF_V)$(MKDIR_P) `dirname $@` \
- 	&& $(DOC_GROFF) -K utf8 -t -Tps -me -mfr $< >$@
- 
diff --git a/meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch b/meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch
deleted file mode 100644
index de4a55bbab..0000000000
--- a/meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 771686c042d5f494550d0399f36e00b1ca557b2d Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 11 Nov 2024 14:12:51 +0000
-Subject: [PATCH] contrib/hdtbl/hdtbl.am: Fix race issues for parallel build
-
-Fixed race issues for parallel build:
-groff: error: couldn't exec soelim: Permission
-
-And:
-groff: error: couldn't exec grn: Permission denied
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/groff/2024-11/msg00097.html]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- contrib/hdtbl/hdtbl.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/contrib/hdtbl/hdtbl.am b/contrib/hdtbl/hdtbl.am
-index 9384fac..70f7bc9 100644
---- a/contrib/hdtbl/hdtbl.am
-+++ b/contrib/hdtbl/hdtbl.am
-@@ -119,7 +119,7 @@ SUFFIXES += .roff .in .ps
- 	       -e "s|[@]EGREP[@]|$(EGREP)|" $< >$@
- 
- $(HDTBLPROCESSEDEXAMPLEFILES): $(DOC_GNU_EPS) groff troff eqn pic tbl \
--  grops grn font/devps/stamp contrib/hdtbl/examples/common.roff
-+  grops grn soelim font/devps/stamp contrib/hdtbl/examples/common.roff
- 
- uninstall_groffdirs: uninstall-hdtbl-hook
- uninstall-hdtbl-hook:
diff --git a/meta/recipes-extended/groff/files/0001-getopt-Fix-type-signature-for-getenv.patch b/meta/recipes-extended/groff/files/0001-getopt-Fix-type-signature-for-getenv.patch
deleted file mode 100644
index c69a2b4f67..0000000000
--- a/meta/recipes-extended/groff/files/0001-getopt-Fix-type-signature-for-getenv.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From b68b3c6157c531bdcf5812fd93aadff9c18de6bd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Mar 2025 14:41:23 -0700
-Subject: [PATCH] getopt: Fix type signature for getenv()
-
-This fixes build on musl with GCC 15
-
-Upstream-Status: Inappropriate [Next version is use getopt.c from gnulib]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libs/libgroff/getopt.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libs/libgroff/getopt.c b/src/libs/libgroff/getopt.c
-index 6efa529..ce39115 100644
---- a/src/libs/libgroff/getopt.c
-+++ b/src/libs/libgroff/getopt.c
-@@ -122,7 +122,7 @@ static struct _getopt_data getopt_data;
-    whose names are inconsistent.  */
- 
- #ifndef getenv
--extern char *getenv ();
-+extern char *getenv (const char *);
- #endif
- 
- #endif /* not __GNU_LIBRARY__ */
diff --git a/meta/recipes-extended/groff/files/0001-groff-fix-test-groff-not-found-in-cross-compilation.patch b/meta/recipes-extended/groff/files/0001-groff-fix-test-groff-not-found-in-cross-compilation.patch
new file mode 100644
index 0000000000..e9214519e7
--- /dev/null
+++ b/meta/recipes-extended/groff/files/0001-groff-fix-test-groff-not-found-in-cross-compilation.patch
@@ -0,0 +1,82 @@
+From c0f835a59d7b33452f280c8a73c3214e0a3a3d9f Mon Sep 17 00:00:00 2001
+From: Zhang Peng <peng.zhang1.cn@windriver.com>
+Date: Fri, 6 Mar 2026 05:18:33 +0000
+Subject: [PATCH] groff: fix test-groff not found in cross-compilation
+
+In groff 1.24.0, pdfmom uses GROFF_COMMAND=test-groff to invoke the
+build-tree groff wrapper during document generation. This fails in
+cross-compilation because:
+
+1. GROFF_COMMAND=test-groff is a relative name not in PATH.
+2. test-groff overrides GROFF_BIN_PATH to $builddir and then runs
+   $builddir/groff, which is a target binary.
+
+Fix by:
+- Using $(abs_top_builddir)/test-groff in .am files.
+- When the caller provides a GROFF_BIN_PATH with a usable groff
+  (cross-compilation with groff-native), keep it instead of
+  overriding to $builddir.
+- Run $GROFF_BIN_PATH/groff instead of $builddir/groff so the
+  correct (native or build-tree) binary is always used.
+
+Upstream-Status: Inappropriate [yocto specific]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ contrib/mom/mom.am | 2 +-
+ doc/doc.am         | 2 +-
+ test-groff.in      | 8 ++++++--
+ 3 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/contrib/mom/mom.am b/contrib/mom/mom.am
+index b99e869..120d3ee 100644
+--- a/contrib/mom/mom.am
++++ b/contrib/mom/mom.am
+@@ -24,7 +24,7 @@ mom_srcdir = $(top_srcdir)/contrib/mom
+ #
+ # Use '-K utf8', not '-k', in case 'configure' didn't find uchardet.
+ MOMPDFMOM = \
+-  GROFF_COMMAND=test-groff \
++  GROFF_COMMAND=$(abs_top_builddir)/test-groff \
+   GROFF_COMMAND_PREFIX= \
+   GROFF_BIN_PATH="$(GROFF_BIN_PATH)" \
+   $(PDFMOMBIN) $(FFLAG) $(MFLAG) -M$(mom_srcdir) -K utf8 -p -e -t \
+diff --git a/doc/doc.am b/doc/doc.am
+index 6cf9db5..906a989 100644
+--- a/doc/doc.am
++++ b/doc/doc.am
+@@ -54,7 +54,7 @@ groffmanpagesoption = -P-e
+ endif
+ 
+ DOC_PDFMOM = \
+-  GROFF_COMMAND=test-groff \
++  GROFF_COMMAND=$(abs_top_builddir)/test-groff \
+   GROFF_COMMAND_PREFIX= \
+   GROFF_BIN_PATH="$(GROFF_BIN_PATH)" \
+   $(PDFMOMBIN) $(MFLAG) $(FFLAG) -ww -b $(pdfmomoption) --roff
+diff --git a/test-groff.in b/test-groff.in
+index a65898a..9c6a8b6 100644
+--- a/test-groff.in
++++ b/test-groff.in
+@@ -23,7 +23,11 @@ SEP='@PATH_SEPARATOR@'
+ builddir=@abs_top_builddir@
+ srcdir=@abs_top_srcdir@
+ 
+-GROFF_BIN_PATH=$builddir
++# Keep caller's GROFF_BIN_PATH if it contains a usable groff (e.g.
++# groff-native during cross-compilation); otherwise use builddir.
++if [ -z "$GROFF_BIN_PATH" ] || [ ! -x "$GROFF_BIN_PATH/groff" ]; then
++    GROFF_BIN_PATH=$builddir
++fi
+ 
+ XENVIRONMENT=$srcdir/src/devices/xditview/GXditview.ad
+ export XENVIRONMENT
+@@ -52,4 +56,4 @@ $SEP$builddir/contrib/sboxes\
+ export GROFF_COMMAND_PREFIX
+ export GROFF_BIN_PATH GROFF_FONT_PATH GROFF_TMAC_PATH
+ 
+-exec $builddir/groff "$@"
++exec $GROFF_BIN_PATH/groff "$@"
+-- 
+2.51.2
+
diff --git a/meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch b/meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch
deleted file mode 100644
index d9455af2ac..0000000000
--- a/meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 12169aa269341753d491a69e9adb86c58dca039a Mon Sep 17 00:00:00 2001
-From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
-Date: Thu, 10 Oct 2024 18:17:08 -0500
-Subject: [PATCH] [hdtbl]: Fix Savannah #66316 (missing `grn` dep).
-
-* hdtbl.am (HDTBLPROCESSEDEXAMPLEFILES): Declare dependency on `grn`;
-  because `-I` flags are used, it is dragged in even though not
-  explicitly needed.  Resolves race against `grn`'s availability in the
-  build tree.
-
-Fixes <https://savannah.gnu.org/bugs/?66316>.  Thanks to Ross Burton for
-the report.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- contrib/hdtbl/ChangeLog | 10 ++++++++++
- contrib/hdtbl/hdtbl.am  |  3 +--
- 2 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/contrib/hdtbl/hdtbl.am b/contrib/hdtbl/hdtbl.am
-index b6c334c18..3c37174f2 100644
---- a/contrib/hdtbl/hdtbl.am
-+++ b/contrib/hdtbl/hdtbl.am
-@@ -119,9 +119,8 @@ SUFFIXES += .roff .in .ps
- 	&& sed -e "s|[@]fontdir[@]|$(fontdir)|" \
- 	       -e "s|[@]EGREP[@]|$(EGREP)|" $< >$@
- 
--
- $(HDTBLPROCESSEDEXAMPLEFILES): $(DOC_GNU_EPS) groff troff eqn pic tbl \
--  grops font/devps/stamp contrib/hdtbl/examples/common.roff
-+  grops grn font/devps/stamp contrib/hdtbl/examples/common.roff
- 
- uninstall_groffdirs: uninstall-hdtbl-hook
- uninstall-hdtbl-hook:
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch b/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch
index 23992576f9..111dbd385e 100644
--- a/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch
+++ b/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch
@@ -11,6 +11,9 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 Rebase to 1.22.4
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
+Rebase to 1.24.0
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+
 ---
  font/devpdf/Foundry.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -19,16 +22,16 @@ diff --git a/font/devpdf/Foundry.in b/font/devpdf/Foundry.in
 index e5aba65..5441734 100644
 --- a/font/devpdf/Foundry.in
 +++ b/font/devpdf/Foundry.in
-@@ -20,7 +20,7 @@
+@@ -23,7 +23,7 @@
  
  #=======================================================================
  #Foundry|Name|Search path
--foundry||@urwfontsdir@:(gs):/usr/share/fonts/type1/gsfonts:/usr/share/fonts/default/Type1:/usr/share/fonts/default/Type1/adobestd35:/usr/share/fonts/type1/urw-base35:/opt/local/share/fonts/urw-fonts:/usr/local/share/fonts/ghostscript
+-foundry||@urwfontsdir@:(gs):/usr/share/fonts/type1/urw-base35/:/usr/share/fonts/urw-base35:/opt/local/share/fonts/urw-fonts/:/usr/local/share/fonts/ghostscript/:/usr/share/fonts/type1/gsfonts/:/usr/share/fonts/type1/:/usr/share/fonts/default/Type1/adobestd35/:/usr/share/fonts/default/Type1/:/usr/share/ghostscript/Resource/Font
 +foundry||(gs)
  
  # Enable the font description files for grops (generated from Adobe
  # foundry font files) to be used with gropdf.  afmtodit must not be
-@@ -72,7 +72,7 @@ EURO|N||||*../devps/freeeuro.pfa
+@@ -79,7 +79,7 @@ EURO|N||||*../devps/freeeuro.pfa
  # URW fonts are typically shipped with Ghostscript, but can be replaced.
  
  #Foundry|Name|Search path
@@ -36,4 +39,3 @@ index e5aba65..5441734 100644
 +foundry|U|(gs)
  
  # Define flags for afmtodit.
- 
diff --git a/meta/recipes-extended/groff/groff_1.23.0.bb b/meta/recipes-extended/groff/groff_1.24.0.bb
similarity index 82%
rename from meta/recipes-extended/groff/groff_1.23.0.bb
rename to meta/recipes-extended/groff/groff_1.24.0.bb
index 0c2ef61758..e71df66dfe 100644
--- a/meta/recipes-extended/groff/groff_1.23.0.bb
+++ b/meta/recipes-extended/groff/groff_1.24.0.bb
@@ -5,19 +5,15 @@ SECTION = "base"
 HOMEPAGE = "http://www.gnu.org/software/groff/"
 LICENSE = "GPL-3.0-only"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://groff-not-search-fonts-on-build-host.patch \
            file://0001-Make-manpages-mulitlib-identical.patch \
-           file://0001-build-Fix-Savannah-64681-webpage.ps-deps.patch \
-           file://0001-build-meintro_fr.ps-depends-on-tbl.patch \
-           file://0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch \
-           file://0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch \
-           file://0001-getopt-Fix-type-signature-for-getenv.patch \
+           file://0001-groff-fix-test-groff-not-found-in-cross-compilation.patch \
            "
 
-SRC_URI[sha256sum] = "6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb2d30ae3863511c13"
+SRC_URI[sha256sum] = "e79bbcd8ff3ed0200e7ac55d3962a15e118c1229990213025f2fc8b264727570"
 
 DEPENDS = "bison-native groff-native"
 RDEPENDS:${PN} += "perl sed"
-- 
2.50.0


