Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321B1CD98F0
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10225.1781682348139560213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Lb48WsA2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0628f81a38=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H51RfU451846
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=4vdL/Opab
	C9aFhgzIwvYmhVVZsujouDeAFFgwD7ow98=; b=Lb48WsA2cp5rJBwBq8F31VR6B
	ncb3Rqe2KHBxj/cELQoCcLCUIA9FkCwVrdfOqxHZIdy4Tub3yEZpeJx6UJUqyvoB
	ShZ0ZMUlIYS5ImZfmkJl6wNRYAeulOOwhDOP2DKACKr/8EfZkNuv97wKwJx/OzZb
	y8JAdAiJ92bci+Vua88X5zmaaE//SDp+YWpitkaQl9aFjgVjHbjA5sbp6JUrc0KB
	6oqYi4TWY/K1HvtrO68OrjiMrd0Kyn5VX5rqlCZjNiV41hKDG16m5NcwJqyjuL0d
	FSqZLQDjM0Nu1sfLW7/axao86FyPigftey2Sby7RwYDAjlYc6y/w5oYSa3kxA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010062.outbound.protection.outlook.com [52.101.61.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4euef80mfn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnxk+HP3Dqi3efEzSQH6DXkarU/6Lx5+p9F5cxuAmSHCGSUnJAU/udTJDICzt1NGaQfiHwPLvAvVTBABPIWMgnPUgzLxY7BmRbxGJHHp62aEEpZZFi4wUmqebkckUaL1v4OGV5DH/3etcA7YgeOlDm1h7re9NGX0l+PWXCfczLMv0gspvqexITYBYL24lgJut3PQNEa2LiTISQ5Z76cb6cW0DK+Iz9xFiZ/drkq0XsjOL4+yC+MYEGWCcbfrx5x5odmXgptlWjgqeCqmItAMFfzrsW9P1AjaUMkLsEWsmuxN6Cm1Mz0xISQCCzoQpT3igmjrm+ZaOcJ/PX0jtCJIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vdL/OpabC9aFhgzIwvYmhVVZsujouDeAFFgwD7ow98=;
 b=fTnDoZdu7bKZuiPeikM0Sxu9gyU/MN6JC354uXI1Qb7OVdMH/l0//hy72JnSNpakzXZFbaM657Qd+CeQNS+CU+Tseuiz5g9xcu/eJtfvkgH0GKZpavdXRUnym7PuLZuezdnS9znUVz685ELqEwZunhU8u97nAfsfj0f98x8Y/h61fAS1/fDjebP8Vt57qNVh87ltHgprMX0mTfc+nE7169JR/ABkYZtrZNdCRqV5eARtpyw5GWtRD+AV3KrVbNLFml2LYHOS8vOuZMH8JGjG9eQw1x9x3ZHiC0s5Lkp9InYr9MlRBSr2LG7BP8Ry3EMBIaLFPH2vFqk4K3maiALQkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MW6PR11MB8409.namprd11.prod.outlook.com (2603:10b6:303:24c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 07:45:42 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 07:45:41 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [wrynose][PATCH v2] gcc: Upgrade GCC to 15.3 release
Date: Wed, 17 Jun 2026 00:45:28 -0700
Message-ID: <20260617074528.2177417-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::29) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MW6PR11MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ced6ac-d3e4-40cb-9607-08decc446e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|56012099006|11063799006|6133799003|18002099003|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	hbsj7QZrSmvvwzfa9tmwEUd15WjLVH81D0y7FuRjgMvQD/BH2ZWWkHzhRdbKCK9RFBuJL8Yk8B/h5mv3PkGrYst6fscvTWBNlxyU8M4dX5oj2K1f75Cuur3LIEL2sk/FS2ZA8DPBD35/FFTaFosIq2ytKbXM4v2iHhzSGJYYTKEEPbo780k1fSmvzF7IdseOVjy975FW+wLj8SRfOKjIZAzBUXVUw4HtsCn/xhVNYiod/Iz5fvNT6jbDtoOZzcncQc/PuMYvqs6pSIuDQjf0uxxYIIlrhR8iHeiQLzkZbfnc5xiFVhusq+mAF3bVr5/kmz8HqAexHV3PLrctFA63zi8SsrxC0zWFptfmbpaAtufc6/jgfgheoxpdB3fWCKOnXpJSyDznTXGDooIk+pabysTSFOBcMEUnq3Eqi56wSJ7ALEIEFHDCpsHhhnhfRjaiIUgpokoaLzZh02ZXQF7kpGjKBRIBZ+Zk5lq3WWcVE2JgBbdZfGTsF0VVoq0tzezOoizXT5x/aVo9kSWXYazm3uMo9r/MVFinYk5kXAK1W+qIUFvoR38hkAytooD3WBnPIztSWtrBglQReNHVv5DBix/J1ywptoH5On26IOfIzomgzgnftfTpceG81rYH/wpQnc6GK41supFgbh+q2r9RyNhG0bWnH0c5Z3hsTi6lDeST3bFxOEcZ53wOvztjkee3c1kkWs/w4YzL9h2pkuM/DA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(56012099006)(11063799006)(6133799003)(18002099003)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2bumnxvOJ9V19vJh6e7yPcKZZaMbnEiL8QbQlcSOXRvPbSUejW3ErabpSy5W?=
 =?us-ascii?Q?Xjl1UWipvjJQ1oRGjDSK1sXbt896NspqvCFO5GvBC6BpLppR4GTPO7lC+Drr?=
 =?us-ascii?Q?nKhyUDlQwv4JI1ZbnEnxIZG1E1iJLAgNqAjd019borI62fq8rENge6UBLlEU?=
 =?us-ascii?Q?6E2MRBvKaQXxqF4yyTEN3QrimkAcEUWtAb8n4gDxvVcZtRAIKRyxYZm3I+UG?=
 =?us-ascii?Q?70FwnWqSpak0X/DF/QBAdQ36WV2NgUo+C7zcYFFUPPF4rI1mOdFA0Jyxoeds?=
 =?us-ascii?Q?V/A7/xGzzRbexIPv7X/KgxvMYl+YCGOUUAnqUqJVL2zR+MLxvzBkdAT9Qki9?=
 =?us-ascii?Q?+dT93mxOj6rKXMOrJHtUzKnt2VSc2UXmCKJox1zx5KaD8/oON8qJfGhYBv2K?=
 =?us-ascii?Q?eAYpiaWoSu/7NjPEciJ2mwGT3gJz31OKGDTJwCM4Ybz4p+QrGjh+iKOVngWr?=
 =?us-ascii?Q?2cPIu6FCXMtcWYs4dTHRR3/aOviVz1aWeYV4vSB6bIFRCWs7SxItgNNAkPKl?=
 =?us-ascii?Q?0n81eZFjgXRLGiWhrkUASk5qxds5N5QExxHtKMr4Je0n2aGcojk/X0Gl1TMS?=
 =?us-ascii?Q?mos/9K+ncbY03sDvSdNpSGrOwYH4wI4RCu/2YSfrfYe3Lm1Zy16cUBf9LeGp?=
 =?us-ascii?Q?HGNQYpi/M5uADtln633HM+kjoYcYiOC3A3E+Mg1nN87EJejvJNlLKvXVfnPx?=
 =?us-ascii?Q?tv45bepu7nF7kydNSmBTg8O85i2YYTpFbQRw8p25lLp512p6f6eJ/xQuk2Tv?=
 =?us-ascii?Q?rUGt6CNdrSGEVuBGGE3vQdEk5vk2oq59YfvgmTqoNM625ylz8ufkaaaTqSwR?=
 =?us-ascii?Q?XRLcPcJNNj8NdXpO75l+lTxVCG7IiuZhNJsWMIClQN27r2S6d7oh/aJJJDqt?=
 =?us-ascii?Q?RzUPwtBJitPH7J6nPYO77duJ3HfDsct5M/FApnGJgEELvNaiWDyFFj6cDGb/?=
 =?us-ascii?Q?hDPKWxJTwV7pbJgF7qOD6Q6OnnplaplJvE7iLq35RUYbX2GZ9xuDgK6ZoSiQ?=
 =?us-ascii?Q?FIgZ5+6AD9R1N5T3/Jvsa05iPhIv4QLEm586fnvQz++gg7vim0Dcp+gvaNFo?=
 =?us-ascii?Q?ZXg8QRgcyzGCVSOiibwsTI8iERzAKQ0F9HKVeyV2EgeQ8BRpIXfRHcGehDgQ?=
 =?us-ascii?Q?pKmo0boquzEF0+w+96M0yU2iLjFKia03EBNNp6bXUgal+PmyYbH4FyKwf2HC?=
 =?us-ascii?Q?uGtGJFI5PALq7Q6BB+RW/XQ2E+T/ZECtq0ThENFTh55jn328g49EHrPwXzvM?=
 =?us-ascii?Q?k+mh77s3UXzpJ+vmCd8wf+a/OUEagaqUWFh04Fxw69VT7LwFFdh7vns3AauZ?=
 =?us-ascii?Q?D9kxerTBQ+hgM4QYipP8ei+1iKHL66NToCF8/4yI2/B6cf/FRZhoPl8dakSe?=
 =?us-ascii?Q?YPV+PxLWI4CXWfB+TTRtuBQWWwDpvlOLsBByYa3qIHeksSiux1WR6EGusEbf?=
 =?us-ascii?Q?8Za017u3sZDl1pNbwSCx/hPYRHvlgJGYzaT/u2F80aVo4JMACn1r6hAbTMRY?=
 =?us-ascii?Q?oY8GempDpZ+hyTqHojVWSYhQA9bG1gNZl6dwYDKw/aTbLQ35ubR7bmoEv3/2?=
 =?us-ascii?Q?/UgNRsnEZdT6Rd5UEGwkuKQc9sxitqAyzIWmVK5b+eiqHXvy8Ub0U+nVm+xA?=
 =?us-ascii?Q?mXNL/sAzQpH54rkxvFANhfgMGKjdYF0c3vILV7LTruHG04v+xXBlgoyU2VGS?=
 =?us-ascii?Q?MMd51ZcgoruuBd2QYa3PpBW93g5LO4o5kFGtNDuhLTDIkrJaTz8QwBM6ToMX?=
 =?us-ascii?Q?889/XN4k9wCq8zR/SukVVhjMaU8ugxA=3D?=
X-Exchange-RoutingPolicyChecked: 
	Vmmo1FdFozfNpkQGIDbCFrWnVDp622M0snB6mdDY9cxFZWiM1iuZh1i/8GJ6ZZ1yooIDkzS0Cg+EMpiTqyeati5QYReNET7pIMA6iJTy5opBAPe8/j1bIvCq6uQtIByntcgg4gFIEUeCnaQSZnaMGTkJ6Ib8jl6GbrYb5VsKD9ebJFhQkosrzg1pqjZSIoO3G2WB7T3I+EDbMaT+bbEQwyUU8FJxsvGTmTAmkywhx/EnqNX9FrBkT9ZMPb1iQHG9hySkGyNl8FTFnBvJTS8TUVB4ntMWIgkWcsC9pUH3jIr6L+GnLPI304naIdGCJyB7OHSfX9ex4RyK32ILtuLreQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ced6ac-d3e4-40cb-9607-08decc446e5a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 07:45:41.6270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T898CBrVJ1ajqSs+jWUHrOJKxwW+Hc7ja6n5PxBIhbsfA/ELhIIG+9AsGj92HfIL06/UkQ3SXjv3AMPcYFK5t/1Sp1dIpkzRQ1rnGNvcSXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8409
X-Proofpoint-ORIG-GUID: OTd4YMXkM4aV1GHqteVbZXzn8_jIAMbm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA3MSBTYWx0ZWRfX2AFYmLE6Xvga
 j2cuUM8QToaIwMssxgNECwb189hMic4mXXOd03MlDNvkTCZLNJTga7N5EQg+G2gs9oBM0OdMD/F
 qih9OMLSDYz7yqX6yjrUoSsXASGhgONX5fBND7mwF9Esqbx/+5Nl
X-Authority-Analysis: v=2.4 cv=auCCzyZV c=1 sm=1 tr=0 ts=6a3250aa cx=c_pps
 a=rA8xTxhMCG4Q6PG1LLvkJA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8
 a=20KFwNOVAAAA:8 a=aW_Z1E4S6AGfzCYL-CIA:9 a=qR47EbG77nc-FfNg:21
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: OTd4YMXkM4aV1GHqteVbZXzn8_jIAMbm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA3MSBTYWx0ZWRfX5LbCVMN1BSPp
 oXJV0/2XFUZ9V7QKpOuTyRTxB7XrD9y6faJBiP1GLBSyBAsUXj1RKD5A+QxAX+gqoEYyjGhF86n
 u8uJIDqywhqI0UTpmfydmry/odgdX1mJIZcFd9FrDgDXDr1L+z0sHgdCNCH/qH4Kn4CfEGyMjk7
 QYB2LnUCgjpp8J0A4G58D6hH1OngVOhihZpZJp4qSfONNdJTK4b/SEduLZp6VUa3PD2QRAeX3eg
 cxyXlyhxPuIyPg0+urYw71nTC4fhGmEhcwzHbNfXtDBaNLw9oE7MAiz1ez2Q5FrcLyeYIANB8z5
 fM2bozTw4ltI4JA60wnSqZbaLfq5OW+0lrOrgqj/aPbSKVtHX1fKlV4dsg+jQEV9CZvek5MXEsG
 IdlullQBnjhnRcpsi+YAtfXOaxwb0YGa0NSPyGbFgnX5ICnOBPM3ao4v/nseUzbb6b4MLbRLDea
 5me+w7skCCInrALxH+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239010

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

- Added support for AVR32EB14/20/28/32, AVR16LA14/20/28/32, and
  AVR32LA14/20/28/32 devices
- Added IEEE double functions sincos and sincosl support

* Drop backports available in this release.

Release notes: https://gcc.gnu.org/gcc-15/changes.html
Docs: https://gcc.gnu.org/onlinedocs/15.3.0/
Bug fixes: https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=522382&resolution=FIXED&target_milestone=15.3

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../gcc/{gcc-15.2.inc => gcc-15.3.inc}        |  11 +-
 ...ian_15.2.bb => gcc-cross-canadian_15.3.bb} |   0
 .../{gcc-cross_15.2.bb => gcc-cross_15.3.bb}  |   0
 ...-crosssdk_15.2.bb => gcc-crosssdk_15.3.bb} |   0
 ...cc-runtime_15.2.bb => gcc-runtime_15.3.bb} |   0
 ...itizers_15.2.bb => gcc-sanitizers_15.3.bb} |   0
 ...{gcc-source_15.2.bb => gcc-source_15.3.bb} |   0
 .../gcc/gcc/0026-fix-pr90579-testcases.patch  |  40 ---
 .../gcc/gcc/0027-gcc15-pr122394.patch         |  88 ------
 ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 257 ------------------
 .../gcc/{gcc_15.2.bb => gcc_15.3.bb}          |   0
 ...initial_15.2.bb => libgcc-initial_15.3.bb} |   0
 .../gcc/{libgcc_15.2.bb => libgcc_15.3.bb}    |   0
 ...ibgfortran_15.2.bb => libgfortran_15.3.bb} |   0
 15 files changed, 5 insertions(+), 393 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-15.2.inc => gcc-15.3.inc} (92%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.2.bb => gcc-cross-canadian_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_15.2.bb => gcc-cross_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.2.bb => gcc-crosssdk_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_15.2.bb => gcc-runtime_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.2.bb => gcc-sanitizers_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_15.2.bb => gcc-source_15.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
 rename meta/recipes-devtools/gcc/{gcc_15.2.bb => gcc_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_15.2.bb => libgcc-initial_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_15.2.bb => libgcc_15.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_15.2.bb => libgfortran_15.3.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 07e840ac34..99242af484 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -200,7 +200,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-15.2.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-15.3.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcompat = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtools/gcc/gcc-15.3.inc
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-15.2.inc
rename to meta/recipes-devtools/gcc/gcc-15.3.inc
index a96f2b8411..2f74351085 100644
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.3.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "15.2.0"
+PV = "15.3.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "15.2.0"
+BINV = "15.3.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -44,7 +44,7 @@ LIC_FILES_CHKSUM = "\
 RELEASE ?= "${PV}"
 BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 SOURCEDIR ?= "gcc-${PV}"
-SRC_URI[sha256sum] = "438fd996826b0c82485a29da03a72d71d6e3541a83ec702df4271f6fe025d24e"
+SRC_URI[sha256sum] = "fa59c1beef8995f27c4d71c1df227587189315d3e6faff1bb4306e61b0c530eb"
 
 SRC_URI = "${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -71,12 +71,9 @@ SRC_URI = "${BASEURI} \
            file://0022-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
-           file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
-           file://0026-fix-pr90579-testcases.patch \
-           file://0027-gcc15-pr122394.patch \
            file://0028-fix-gcc-libitm-false-postives-01.patch \
            file://0028-fix-gcc-libitm-false-postives-02.patch \
-           file://0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch \
+	    file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
 "
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_15.2.bb b/meta/recipes-devtools/gcc/gcc-cross_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_15.2.bb b/meta/recipes-devtools/gcc/gcc-source_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_15.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_15.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
deleted file mode 100644
index 6ada61b74f..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 679e24f5a751663998ff7202149a749e0f7251f9 Mon Sep 17 00:00:00 2001
-From: Harish Sadineni <Harish.Sadineni@windriver.com>
-Date: Sun, 10 Aug 2025 20:28:00 +0800
-Subject: [PATCH] testsuite: i386: Fix gcc.target/i386/pr90579.c when PIE is
- enabled [PR118885]
-
-When gcc build with --enable-deafult-pie the following tests
-were getting failed:
- FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+40
- FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+32
- FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+24
- FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+16
-
-    PR target/118885
-
-gcc/testsuite/ChangeLog:
-
-    * gcc.target/i386/pr90579.c: add -fno-pie to dg-options
-    to fix tests when PIE is enabled.
-
-Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=679e24f5a751663998ff7202149a749e0f7251f9]
-
-Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
----
- gcc/testsuite/gcc.target/i386/pr90579.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gcc/testsuite/gcc.target/i386/pr90579.c b/gcc/testsuite/gcc.target/i386/pr90579.c
-index ab48a44063c..19081ec9fdf 100644
---- a/gcc/testsuite/gcc.target/i386/pr90579.c
-+++ b/gcc/testsuite/gcc.target/i386/pr90579.c
-@@ -1,5 +1,5 @@
- /* { dg-do compile } */
--/* { dg-options "-O3 -mavx2 -mfpmath=sse" } */
-+/* { dg-options "-O3 -mavx2 -mfpmath=sse -fno-pie" } */
- 
- extern double r[6];
- extern double a[];
--- 
-2.49.0
diff --git a/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch b/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
deleted file mode 100644
index 9ee371cef7..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0027-gcc15-pr122394.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From e55dcff97708a4937dc4d8736b8b3074ebbff6f3 Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Mon, 27 Oct 2025 17:43:17 +0100
-Subject: phiopt: Fix up DEBUG_EXPR_DECL creation in spaceship_replacement
- [PR122394]
-
-The following testcase ICEs in gcc 15 (and is at least latent in 12-14 too),
-because the DEBUG_EXPR_DECL has incorrect mode.  It has
-TREE_TYPE (orig_use_lhs) type, but TYPE_MODE (type) rather than
-TYPE_MODE (TREE_TYPE (orig_use_lhs)) where the two types are sometimes
-the same, but sometimes different (same if !has_cast_debug_uses, different
-otherwise).
-
-Though, there wouldn't be the this issue if it used the proper API to create
-the DEBUG_EXPR_DECL which takes care of everything.  This is the sole
-spot that doesn't use that API.
-
-Doesn't affect the trunk because the code has been removed and replaced with
-different stuff after the libstdc++ ABI change in r16-3474.
-Before r15-5557 the mode has been always wrong because this was done only
-for has_cast_debug_uses.  And the bug has been introduced with r12-5490.
-
-Enough archeology, while it could be fixed by changing the second
-SET_DECL_MODE argument, I think it is better to use build_debug_expr_decl.
-
-2025-10-27  Jakub Jelinek  <jakub@redhat.com>
-
-	PR tree-optimization/122394
-	* tree-ssa-phiopt.cc (spaceship_replacement): Use
-	build_debug_expr_decl instead of manually building DEBUG_EXPR_DECL
-	and getting SET_DECL_MODE wrong.
-
-	* g++.dg/opt/pr122394.C: New test.
-
-Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=e55dcff97708a4937dc4d8736b8b3074ebbff6f3]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- gcc/testsuite/g++.dg/opt/pr122394.C | 20 ++++++++++++++++++++
- gcc/tree-ssa-phiopt.cc              |  6 ++----
- 2 files changed, 22 insertions(+), 4 deletions(-)
- create mode 100644 gcc/testsuite/g++.dg/opt/pr122394.C
-
-diff --git a/gcc/testsuite/g++.dg/opt/pr122394.C b/gcc/testsuite/g++.dg/opt/pr122394.C
-new file mode 100644
-index 000000000000..1f84bebd74c2
---- /dev/null
-+++ b/gcc/testsuite/g++.dg/opt/pr122394.C
-@@ -0,0 +1,20 @@
-+// PR tree-optimization/122394
-+// { dg-do compile { target c++23 } }
-+// { dg-options "-O1 -g" }
-+
-+#include <compare>
-+
-+struct A {
-+  friend auto operator<=> (A, A) = default;
-+  double a;
-+};
-+void foo ();
-+A b, c;
-+
-+void
-+bar ()
-+{
-+  bool d = c >= b;
-+  if (d)
-+    foo ();
-+}
-diff --git a/gcc/tree-ssa-phiopt.cc b/gcc/tree-ssa-phiopt.cc
-index aaebae6b38c0..3e0ad9d3bb09 100644
---- a/gcc/tree-ssa-phiopt.cc
-+++ b/gcc/tree-ssa-phiopt.cc
-@@ -2995,10 +2995,8 @@ spaceship_replacement (basic_block cond_bb, basic_block middle_bb,
- 	      if (has_cast_debug_uses
- 		  || (HONOR_NANS (TREE_TYPE (lhs1)) && !is_cast))
- 		{
--		  tree temp3 = make_node (DEBUG_EXPR_DECL);
--		  DECL_ARTIFICIAL (temp3) = 1;
--		  TREE_TYPE (temp3) = TREE_TYPE (orig_use_lhs);
--		  SET_DECL_MODE (temp3, TYPE_MODE (type));
-+		  tree temp3
-+		    = build_debug_expr_decl (TREE_TYPE (orig_use_lhs));
- 		  if (has_cast_debug_uses)
- 		    t = fold_convert (TREE_TYPE (temp3), temp2);
- 		  else
--- 
-cgit 
-
diff --git a/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch b/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
deleted file mode 100644
index 431facb011..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
+++ /dev/null
@@ -1,257 +0,0 @@
-From 0ffe3c9af4e5d5468df742512b6e930fe7039230 Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Fri, 21 Nov 2025 16:25:58 +0100
-Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
-
-The following builds with -std=c++11 and c++14 and c++17 and c++20 and c++23
-and c++26.
-
-I see the u8 string literals are mixed e.g. with strerror, so in
--fexec-charset=IBM1047 there will still be garbage, so am not 100% sure if
-the u8 literals everywhere are worth it either.
-
-2025-11-21  Jakub Jelinek  <jakub@redhat.com>
-
-	* cody.hh (S2C): For __cpp_char8_t >= 201811 use char8_t instead of
-	char in argument type.
-	(MessageBuffer::Space): Revert 2025-11-15 change.
-	(MessageBuffer::Append): For __cpp_char8_t >= 201811 add overload
-	with char8_t const * type of first argument.
-	(Packet::Packet): Similarly for first argument.
-	* client.cc (CommunicationError, Client::ProcessResponse,
-	Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
-	IncludeTranslateResponse): Cast u8 string literals to (const char *)
-	where needed.
-	* server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Backport [07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7]
----
- libcody/client.cc | 36 +++++++++++++++++++-----------------
- libcody/cody.hh   | 22 ++++++++++++++++++++++
- libcody/server.cc | 28 ++++++++++++++--------------
- 3 files changed, 55 insertions(+), 31 deletions(-)
-
-diff --git a/libcody/client.cc b/libcody/client.cc
-index ae69d190cb77..147fecdbe500 100644
---- a/libcody/client.cc
-+++ b/libcody/client.cc
-@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
- 
- static Packet CommunicationError (int err)
- {
--  std::string e {u8"communication error:"};
-+  std::string e {(const char *) u8"communication error:"};
-   e.append (strerror (err));
- 
-   return Packet (Client::PC_ERROR, std::move (e));
-@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector<std::string> &words,
-     {
-       if (e == EINVAL)
- 	{
--	  std::string msg (u8"malformed string '");
-+	  std::string msg ((const char *) u8"malformed string '");
- 	  msg.append (words[0]);
--	  msg.append (u8"'");
-+	  msg.append ((const char *) u8"'");
- 	  return Packet (Client::PC_ERROR, std::move (msg));
- 	}
-       else
--	return Packet (Client::PC_ERROR, u8"missing response");
-+	return Packet (Client::PC_ERROR, (const char *) u8"missing response");
-     }
- 
-   Assert (!words.empty ());
--  if (words[0] == u8"ERROR")
-+  if (words[0] == (const char *) u8"ERROR")
-     return Packet (Client::PC_ERROR,
--		   words.size () == 2 ? words[1]: u8"malformed error response");
-+		   words.size () == 2 ? words[1]
-+		   : (const char *) u8"malformed error response");
- 
-   if (isLast && !read.IsAtEnd ())
-     return Packet (Client::PC_ERROR,
--		   std::string (u8"unexpected extra response"));
-+		   std::string ((const char *) u8"unexpected extra response"));
- 
-   Assert (code < Detail::RC_HWM);
-   Packet result (responseTable[code] (words));
-   result.SetRequest (code);
-   if (result.GetCode () == Client::PC_ERROR && result.GetString ().empty ())
-     {
--      std::string msg {u8"malformed response '"};
-+      std::string msg {(const char *) u8"malformed response '"};
- 
-       read.LexedLine (msg);
--      msg.append (u8"'");
-+      msg.append ((const char *) u8"'");
-       result.GetString () = std::move (msg);
-     }
-   else if (result.GetCode () == Client::PC_CONNECT)
-@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char const *ident,
- 			  size_t alen, size_t ilen)
- {
-   write.BeginLine ();
--  write.AppendWord (u8"HELLO");
-+  write.AppendWord ((const char *) u8"HELLO");
-   write.AppendInteger (Version);
-   write.AppendWord (agent, true, alen);
-   write.AppendWord (ident, true, ilen);
-@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char const *ident,
- // HELLO $version $agent [$flags]
- Packet ConnectResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"HELLO" && (words.size () == 3 || words.size () == 4))
-+  if (words[0] == (const char *) u8"HELLO"
-+      && (words.size () == 3 || words.size () == 4))
-     {
-       char *eptr;
-       unsigned long val = strtoul (words[1].c_str (), &eptr, 10);
-@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()
- // PATHNAME $dir | ERROR
- Packet PathnameResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"PATHNAME" && words.size () == 2)
-+  if (words[0] == (const char *) u8"PATHNAME" && words.size () == 2)
-     return Packet (Client::PC_PATHNAME, std::move (words[1]));
- 
-   return Packet (Client::PC_ERROR, u8"");
-@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector<std::string> &words)
- // OK or ERROR
- Packet OKResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"OK")
-+  if (words[0] == (const char *) u8"OK")
-     return Packet (Client::PC_OK);
-   else
-     return Packet (Client::PC_ERROR,
-@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const *include, Flags flags, size_t ilen)
- // PATHNAME $cmifile
- Packet IncludeTranslateResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"BOOL" && words.size () == 2)
-+  if (words[0] == (const char *) u8"BOOL" && words.size () == 2)
-     {
--      if (words[1] == u8"FALSE")
--	return Packet (Client::PC_BOOL, 0);
--      else if (words[1] == u8"TRUE")
-+      if (words[1] == (const char *) u8"FALSE")
-+	return Packet (Client::PC_BOOL);
-+      else if (words[1] == (const char *) u8"TRUE")
- 	return Packet (Client::PC_BOOL, 1);
-       else
- 	return Packet (Client::PC_ERROR, u8"");
-diff --git a/libcody/cody.hh b/libcody/cody.hh
-index 789ce9e70b75..93bce93aa94d 100644
---- a/libcody/cody.hh
-+++ b/libcody/cody.hh
-@@ -47,12 +47,21 @@ namespace Detail  {
- 
- // C++11 doesn't have utf8 character literals :(
- 
-+#if __cpp_char8_t >= 201811
-+template<unsigned I>
-+constexpr char S2C (char8_t const (&s)[I])
-+{
-+  static_assert (I == 2, "only single octet strings may be converted");
-+  return s[0];
-+}
-+#else
- template<unsigned I>
- constexpr char S2C (char const (&s)[I])
- {
-   static_assert (I == 2, "only single octet strings may be converted");
-   return s[0];
- }
-+#endif
- 
- /// Internal buffering class.  Used to concatenate outgoing messages
- /// and Lex incoming ones.
-@@ -123,6 +132,13 @@ public:
-       Space ();
-     Append (str, maybe_quote, len);
-   }
-+#if __cpp_char8_t >= 201811
-+  void AppendWord (char8_t const *str, bool maybe_quote = false,
-+		   size_t len = ~size_t (0))
-+  {
-+    AppendWord ((const char *) str, maybe_quote, len);
-+  }
-+#endif
-   /// Add a word as with AppendWord
-   /// @param str the string to append
-   /// @param maybe_quote string might need quoting, as for Append
-@@ -264,6 +280,12 @@ public:
-     : string (s), cat (STRING), code (c)
-   {
-   }
-+#if __cpp_char8_t >= 201811
-+  Packet (unsigned c, const char8_t *s)
-+    : string ((const char *) s), cat (STRING), code (c)
-+  {
-+  }
-+#endif
-   Packet (unsigned c, std::vector<std::string> &&v)
-     : vector (std::move (v)), cat (VECTOR), code (c)
-   {
-diff --git a/libcody/server.cc b/libcody/server.cc
-index e2fa069bb933..c18469fae843 100644
---- a/libcody/server.cc
-+++ b/libcody/server.cc
-@@ -36,12 +36,12 @@ static RequestPair
-   const requestTable[Detail::RC_HWM] =
-   {
-     // Same order as enum RequestCode
--    RequestPair {u8"HELLO", nullptr},
--    RequestPair {u8"MODULE-REPO", ModuleRepoRequest},
--    RequestPair {u8"MODULE-EXPORT", ModuleExportRequest},
--    RequestPair {u8"MODULE-IMPORT", ModuleImportRequest},
--    RequestPair {u8"MODULE-COMPILED", ModuleCompiledRequest},
--    RequestPair {u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
-+    RequestPair {(const char *) u8"HELLO", nullptr},
-+    RequestPair {(const char *) u8"MODULE-REPO", ModuleRepoRequest},
-+    RequestPair {(const char *) u8"MODULE-EXPORT", ModuleExportRequest},
-+    RequestPair {(const char *) u8"MODULE-IMPORT", ModuleImportRequest},
-+    RequestPair {(const char *) u8"MODULE-COMPILED", ModuleCompiledRequest},
-+    RequestPair {(const char *) u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
-   };
- }
- 
-@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
- 	  std::string msg;
- 
- 	  if (err > 0)
--	    msg = u8"error processing '";
-+	    msg = (const char *) u8"error processing '";
- 	  else if (ix >= Detail::RC_HWM)
--	    msg = u8"unrecognized '";
-+	    msg = (const char *) u8"unrecognized '";
- 	  else if (IsConnected () && ix == Detail::RC_CONNECT)
--	    msg = u8"already connected '";
-+	    msg = (const char *) u8"already connected '";
- 	  else if (!IsConnected () && ix != Detail::RC_CONNECT)
--	    msg = u8"not connected '";
-+	    msg = (const char *) u8"not connected '";
- 	  else
--	    msg = u8"malformed '";
-+	    msg = (const char *) u8"malformed '";
- 
- 	  read.LexedLine (msg);
--	  msg.append (u8"'");
-+	  msg.append ((const char *) u8"'");
- 	  if (err > 0)
- 	    {
--	      msg.append (u8" ");
-+	      msg.append ((const char *) u8" ");
- 	      msg.append (strerror (err));
- 	    }
- 	  resolver->ErrorResponse (this, std::move (msg));
-@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
-     return nullptr;
- 
-   if (words.size () == 3)
--    words.emplace_back (u8"");
-+    words.emplace_back ((const char *) u8"");
-   unsigned version = ParseUnsigned (words[1]);
-   if (version == ~0u)
-     return nullptr;
diff --git a/meta/recipes-devtools/gcc/gcc_15.2.bb b/meta/recipes-devtools/gcc/gcc_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_15.2.bb
rename to meta/recipes-devtools/gcc/gcc_15.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_15.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_15.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_15.2.bb b/meta/recipes-devtools/gcc/libgcc_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_15.2.bb
rename to meta/recipes-devtools/gcc/libgcc_15.3.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_15.2.bb b/meta/recipes-devtools/gcc/libgfortran_15.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_15.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_15.3.bb
-- 
2.49.0


