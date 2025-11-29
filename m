Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0415ACFD2F6
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 04:05:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9187.1764389126336443895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 20:05:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gs1x3mY1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4428fcfaaa=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT3K5cc582206
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 20:05:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=eMIgmxNM7MpzUga8UEDG
	lT/rgtZAa9kC6SYT1kkcvg4=; b=gs1x3mY1O10e9YJ5sOF2ieD02cMEmWNnj75Q
	o5nK3qRTg1lTQeO1gMNv71TJLRjGyTrRMYRc6Pbte7bP4fT+XVTfC/MWt1qsQznP
	oiWxi1QXARnx4bTesHqxBewM/wXIndl96bXp3vsZB+Y/a0IBr0a6sdxd1OnH+npj
	XRTMXJF7YlCWIpKbqA80O2KvB6/Qx98CyTmkZTwYtzbmXczs6bYJVbWVn+Ps1uWA
	DqsynxEo9clYlKfMlRSmjGZxWM1Mu02aW32bSbAQn501kotWa/2hhK9bgILErDbl
	PBmWKe0nnMI+H0Px5kW8P04AtMrz6Q8zj3iylWfqlwqIPD91sQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010028.outbound.protection.outlook.com [52.101.193.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak9b5fbnt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 20:05:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtCJM80HsI3zYPW3lpgP8wxUQsSnOXi+lJGzahLpPnVJmc6aV764hu7b+8deexESuLSTosx91SbNtyV3U7avBjpRGy7pU0wW1HsPpVW+LB7CVicG063jcld3To9S9LVHvGNFhZUh6ztehVlTdKHOl2feoL41R5kK6lLMsiigGDGA8hoPLgQwAjJBMCYiLscBuUoeQihVJbh34gP9NbijTL0ZZH9ClKhe18qPo95I1lrahY2/hlKr9Fc6VHl5uWcEXRNrgzLavYO4euOisP/A9jG7zagocujdq0df0s1R+1mE9LPBqrUPWSVrECq7VE3gwuh9cWZPEMU4ex/51PYadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMIgmxNM7MpzUga8UEDGlT/rgtZAa9kC6SYT1kkcvg4=;
 b=fuiaTJLr677GzIj+qnXPm2TeXwHUiR0Z8Za9FFkbKbPIjC0MRHxiB8ski3D4ueddMtHE1S4+U2m0zwA0mLVk0RptMsVR2mwnY22dlF+LJV33PuVOJlpi7qIpdYTRLxlZx6DolFfACG6rhrxxVC1QVP4iuhH0CANPu5XAxWtmEvKfVOLmCbIsvFzbEbKYS+nbBOr5fHH4KsNMvgIl9imbQZEJWswUouvTHCtfk8YitSzPtZJoctKh+ZVV3fmps/GpJYoBekAdKcSLdPLMx5qHhQ6WSUBfrPXjCS+k0YHNEuPqc2e/KR0SyxlbnQuu5DOeyzKFgI4/1hWqJJyYbjegOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Sat, 29 Nov
 2025 04:05:20 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 04:05:19 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V7 1/3] base-passwd: add clock group
Date: Sat, 29 Nov 2025 12:05:01 +0800
Message-Id: <20251129040503.3958950-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH8PR11MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: 9800c31d-4d73-4664-233f-08de2efc8269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KitV4Req4IZIt1xgZSHbxyxbvIldLkqSNpT2hD23R0GCwz8EUhr6rWxBBeiG?=
 =?us-ascii?Q?DrRRaZCnC3vDb2GxMf5Pr/Bd5760b//SzI+R8zRlU05yYtWe+waVijTNtkBk?=
 =?us-ascii?Q?p8WbVlkBfFzToj44CN/imBkN3uHqBpZdKzqujcZQUrdg5fH7/aER3SV1hsYX?=
 =?us-ascii?Q?xZCwLriQ/Kq6YRoNiHEuv30mkxo89hTfavzWsFNNZ02e5vK3MAFoNqCMKabS?=
 =?us-ascii?Q?BeDAC7ohVrvh/181VRyfolrkkYPTM1VaEFqlPrhysmyuPoR667KxNydGPbNr?=
 =?us-ascii?Q?MOfU8n+59SHTQ5ayvUuYV0ojRVz+XY3C+Nyz0NrMbvFluJ9UfUeXqE88TYaq?=
 =?us-ascii?Q?qz7cBDZ9VzNnI1uIqSYnBf7z5tLK03K93YxJAtEg9PlT7vDsSHkLL65jI7n1?=
 =?us-ascii?Q?GStA2uzCvHYtkmgOUWxyrsUSIcyQqhtTrejfvz863QcXOqz2hcPhaBlM5lv8?=
 =?us-ascii?Q?jEKJQiG4c4yWqOlOs1ofV4u726P0OcGqvUsYTwtk9abXQSkqjxbjvnLkZQen?=
 =?us-ascii?Q?ltd3A15IfANd2df9jI+9xR4+zzAop8cMdm8bAqrax/2kY9Ix+GcaEqHvDaRn?=
 =?us-ascii?Q?msjlbOtw0q8XS2AIw3K8huRp0djBlYnF99AqMldGVALPHM1oSg3lqAK3oPsq?=
 =?us-ascii?Q?BVCP3HTAPBQjs8Y04h3CYzFPUYsHkiTglJwW+GHAJTYy4AhkOVYT34SwJIQe?=
 =?us-ascii?Q?M5H9m95B9suL5pJEw4IrtBGzIu2fdfbna/XO3XJHpTr/qulxXxP/WQJOSjxN?=
 =?us-ascii?Q?fRO05XOoxldOxbJ0p8bLajKZSjF4yApy2n3HjY2p0fPc/iHJkGVCdsMzScJL?=
 =?us-ascii?Q?YdJ/9OipHQUG2Yb9a6m8k9vqn0+8gUcfgV/+X+EByyEsbjR+wRH3jcbsH85P?=
 =?us-ascii?Q?PSSPdCTlDCb7sApIjzvBl1FdTdh+MUaV7wXHcF2HxOoVjTO9wjsurSgTjN6s?=
 =?us-ascii?Q?Q88j3OVf/jyilRZtODHAGXQf0AmilmoXJMXtY3Dhy6V3f4ZNAoYpnSEZQYzF?=
 =?us-ascii?Q?PQY1W4bil/qmPYZotuuJhhtJCeJ9In3esk5tWDVeWibfJkwmcPEJk6Yz9ZaJ?=
 =?us-ascii?Q?prp+ZNVqwEoP5XjHMbFdmy9mUTS3F9L9T39FoUSePSAzHKHu772AWQC0hfeK?=
 =?us-ascii?Q?P7AFb9LCXTGhdszsOi1re5iNS+3JwyWGujFeDxpGg/RWhG38YqSBQrqXYpe9?=
 =?us-ascii?Q?67fw3Sdjcq1DDUOfplUc+X7oKz0XuXYKqWrByji8yp18cgfBZpMAQNAwdkCM?=
 =?us-ascii?Q?Y8x1jGA2fcaQX/S64usVyffDRr9ECk2E8fN95AOiFBFNWNMu1TCizrpLdGoi?=
 =?us-ascii?Q?w0XNCjaL3McNvEOxfhf5rOYi6ZQtzFXVjQQ7yptmgvA2wF6gEiEwHVFC7ajZ?=
 =?us-ascii?Q?k3qy2A+yk6sI1zYno05ylsHaHz4LLTFuN1ShGzRVwNl/XV6xor4YQrWBVJzH?=
 =?us-ascii?Q?86KelRoR6//8Hfjh1Cy/oaXbbcIht2ucNzlTf65434MXr0/nJhCLZw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oFJLp0xjQ+9G0l33HV9B1pAITRU+/wVfm/76FGN8D7fPo95ZfZ7MvSdTU+eQ?=
 =?us-ascii?Q?PHLI4F35LVd+i3JbQtHIuBz7WQAbIG2hVEAJFbo+cQIi08lDC6d6DowGue9f?=
 =?us-ascii?Q?M+C/cqs7K8ru4z4YSPsWu3VecfsJhmiEO4+lfHeRwgifnR8XNCXXDr1NckGz?=
 =?us-ascii?Q?fLI2WJi54iH6+zZR0DyFQ7z4KY7ZgnCfHh53pzlkaAsThu0gxwY7Dqtn5Z9Q?=
 =?us-ascii?Q?fsLCQCqOeWZy7GQu/D8JRKdw2ahFk3dWE6V2ZTQpt/SwqLCer3Ifq+WO/b1n?=
 =?us-ascii?Q?WqfDWLi614aCzdBYFbmMvQQHhSHwxz6dl8y9ol3lezGfwxwpvorsQ863v/QU?=
 =?us-ascii?Q?YZuqSvcKdfKUZ1rWDpK+sSOy4Ly5Fwl2CDBrT19UyN+V4tpVkjWa8rz9lusk?=
 =?us-ascii?Q?5ISNFzMsvRo+5GQ7Bh5nYs7w+ZB83F5VK8bGLUwG3szApDWv4+lyzqFokVud?=
 =?us-ascii?Q?5G15mDbg+roeOpsGD9rsjOG5d5m8JLCq2e3QWilYCofmbnwNAtnbqD9QIHH7?=
 =?us-ascii?Q?hGdCxNu6ubbcU9j4jqoFk1E5ffbnYwmoT1YAA4ZIba9y0poRfY8SV8X3HJgi?=
 =?us-ascii?Q?gpkplyh3xAo2/8aZcg4TcaifzJbQZL8oqd1fT5acKEAolmmXhRZns9bIh3Yf?=
 =?us-ascii?Q?oUZ3HBD1YuqWE+ie5Oj91k8m9TN47Abh3fHtYmXencLz5A5D17VCx7BezWvx?=
 =?us-ascii?Q?ofWXSRDTgcVUFEbfhhBqUocJIaByK1wEsgKk+DIE2fziuLMrEzKAibRkZeKd?=
 =?us-ascii?Q?vZ5EZwnzcOa8mJ3JF2Tw/u4LqcmBe6FikVK33GpE0Du8utrrgEKwdwVAuNby?=
 =?us-ascii?Q?mqN95LXPgO4EuWF8aCyqYtH0Ow5v73nTOBNuxgvyx/aLXuJ46QIAH5xeUC/k?=
 =?us-ascii?Q?kemSm1nGjJh5/OHLs21tq1y5bk7o5E2opqigivE/OxTyOuLwBiyEB4d7E9Iu?=
 =?us-ascii?Q?yXxn78zgIZfl0ar5mLIZHxoAOKfNZNcJ+YTrqKA2Sh0QHkGLUublaC43r22f?=
 =?us-ascii?Q?XmLcQ1lAdXd2L0U98cn3/7WK4LJCReC5AzcncMX8HHlekLKZs03hDkNJmMVz?=
 =?us-ascii?Q?NV/+sdCBSVYhS3T9Pr37KVELrSX6KEPxNIl5K4xN05YNDnHw2V/0pH7BFQI0?=
 =?us-ascii?Q?kLf3BeWhxubxVoBDhECoxiaLr54sRNGsXni+9enKGhp0NQbH6C6JaeYr844t?=
 =?us-ascii?Q?9b9+3x5xd0EG2tKDRP2S88Q4OxdvwXHd8NhqnlYEvcwEUzhz0QrmgJcUnJt6?=
 =?us-ascii?Q?Uc8uibi2o9XqKswdrWXfPqvd8HcTz2uAePp78m+tSmmWIZqhTW071q8cHOdG?=
 =?us-ascii?Q?9RvMF3+3ftq9Nm0k5t3RgS5eu83Br1tZvPAEeLTSJrn/hjQ99FtY4SD6E2G6?=
 =?us-ascii?Q?sfRIrNqM/qSxeWQrBS3F33h4JehFqMjxCZ7nWmG+BjQds7hiKaTCnULgBqyR?=
 =?us-ascii?Q?8kLzQ55/emJn3dr0uYEpEw437CLcY/x7BtCj34ro8jO+/hF3wQIUlLhce3Az?=
 =?us-ascii?Q?mUpZLjOUJQZVyijSZA/RCduLgrJA9V22ZGrGQFUOVmP6fvU/SYw4zbgbq7qm?=
 =?us-ascii?Q?Q74SyciUZ9d8HPPW0AwlHlxHC8+fiSd1+5CIBzbo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9800c31d-4d73-4664-233f-08de2efc8269
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2025 04:05:19.1185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPU4VSKjNkoWfnGo/boCs6rJRQaFDXOJSza/IohkZ87YEk2xg8ICEyM7oanGLFg3CvFPJ5IubXP0kH728Q3qgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6779
X-Authority-Analysis: v=2.4 cv=fozRpV4f c=1 sm=1 tr=0 ts=692a7105 cx=c_pps
 a=e4reWzpetjGbn3OykFohnA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8 a=danhDmx_AAAA:8 a=t7CeM3EgAAAA:8
 a=lAJc9iLRGbhysMPo7VQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyOCBTYWx0ZWRfXzv39QTP6NhLM
 uMhVQhrwLMiZRmDTcGp6Vhsft7L9t7Gbd7tul2ovAc1Y5ZTqALeOxYfjIGoRuU1mhkltMls8zqo
 uccSjKXKLfl+FkEwGvGkFqU969SqE9x2IAVz1LhPgdO8nIMu90FNBrdC+g37rhQHMfIIhyzxH93
 LSPkPEl4uB437EfD0DAlvUZS1YgWhDK+rDTRozx9ysD3kdoKF+oKwa+hXO3p70Z8H9Ok5LXVfai
 USv9uT1zQeIpwXEnSsuZHPm3V9gup9DahDNAQsMX0Ngn+1HBTyStHF92fc7uMSAF85S+aD5r1fm
 cUGHruyz9BVqtAXkYqggU27COtSbv4Yt5D8p9xrBnzmFjvfhCxl3IeHXgaznf+Hmp4d0xS0H7vA
 Wa9ASACIFInDLtDmK8OPK5HK3MUDhA==
X-Proofpoint-GUID: Vnd8VW6FcrGfxrRdmKBxQabSF8oVTzcw
X-Proofpoint-ORIG-GUID: Vnd8VW6FcrGfxrRdmKBxQabSF8oVTzcw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 04:05:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226927

From: Chen Qi <Qi.Chen@windriver.com>

New systemd version (v258) introduces a new group, clock, to
"enable applications like linuxptp to open clocks without root
privileges".[1]

This results in warning at do_rootfs time:
WARNING: Group clock has never been defined

Add group clock with gid 81 to fix this issue. The wheel group's
gid is 80, so 81 is chosen.

Note that Debian rejects this patch because they're using sysusers
to handle such groups, including 'clock', 'kvm', 'sgx', etc. We're
not relying on sysusers, so we have to add a patch here.

Below are more detailed reasons for why these groups (wheel, sgx, kvm,
clock) need to be in base-passwd as oe-specific patches instead of being
added via separate recipes:
OE currently does not have a mechanism like systemd-sysusers that if a
group has been added, the related configurations in separate packages
do not have confliction.
In OE, when multiple recipes need the same group, and these recipes
do not necessarily have deps on each other, the current viable way
to do this is to add that group to base-passwd.
If things change in the future, which means significant change to our
useradd related bbclasses, we might do similar as Debian. But before
that, these groups need to remain in base-passwd.

[1] https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../base-passwd/0001-Add-clock-group.patch    | 34 +++++++++++++++++++
 .../base-passwd/base-passwd_3.6.7.bb          |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
new file mode 100644
index 0000000000..af871949fa
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
@@ -0,0 +1,34 @@
+From 4b3a8f347179d7e2a1062eeed13a6474deb28728 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 16 Oct 2025 08:48:49 +0800
+Subject: [PATCH] Add clock group
+
+The clock group is needed to "to enable applications like linuxptp
+to open clocks without root privileges". See the link below:
+https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd
+
+Note that this group is needed as long as people use udev from
+systemd because 50-udev-default.rules needs it. See the above
+commit.
+
+Upstream-Status: Denied [https://salsa.debian.org/debian/base-passwd/-/merge_requests/17]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index e54fd1d..6f84539 100644
+--- a/group.master
++++ b/group.master
+@@ -39,5 +39,6 @@ staff:*:50:
+ games:*:60:
+ shutdown:*:70:
+ wheel:*:80:
++clock:*:81:
+ users:*:100:
+ nogroup:*:65534:
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
index 177927d674..e4e0890293 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0005-Add-kvm-group.patch \
            file://0007-Add-wheel-group.patch \
            file://0001-base-passwd-Add-the-sgx-group.patch \
+           file://0001-Add-clock-group.patch \
            "
 
 SRC_URI[sha256sum] = "cf869870fed7862b57bfa9e99cd5cd6f365e2349705a1b65af7fc182629bd1ab"
-- 
2.34.1


