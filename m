Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1295BCD37B2
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 05:31:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6795.1778304653284385964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 22:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sztvhs2C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95895a8adf=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6495RZW84051037
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2026 22:30:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=PQS4ENWqP
	sVL6xNfNx7RuuiRDSQtmNYBYl3+kFy4wYE=; b=sztvhs2CR3uIxrbxD5Ge3PmL4
	8qO7X613EyK7FU39IOqgFo4kkSlbmDBb6hWPzCL/QP5wgG0DMxLhcuQjsQgF0Ly/
	wWfjMj0+NLgEMzbhwwIcBsDZ3496kMP/DjzEqpkhaTrgx0AiU4YkgIaDnPDyB78C
	W012P5XEbc38+Vpr7tNSQ5T5/yB9/MakOF8jSnjqsPTjWVo+tKYEDz/HCFHgA4H1
	QBimS7e17xjE3Wx7nI2jsHzH8SMQqUp27G1IDww1RzTDJw6pPDb3nh25zQ08MDAp
	66Q/vdOda7WEqemxFXH/YAr6AUbO7at3++H4gsSWcnehNMnxvzNjv0YZ1Qjsw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1hmn0smr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 22:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ngen7Q9rHvVmOgXCCY38ajZrWDWOMJOwDhwk/a82+ahR4jYI+fvQKItD2rW9mUKE1zLCPX2UUKnOr5YmDPvwrgyJz/+KbZ0Rn3vbRqofo4ggxUvw9/6bXcXMz1cHb3sbQJgbKkrQIPfZiNTeq4DOfYlGalln5Lf5K6JJ13fJmx39ODy1SdzRyEWaOPiLgtXxcYXObLm854F6hyIn+Wh3/HY8z5KP7sbx76l2njWMRnfna9I9XWjuLscOG67Lz1n1XVsF/xFISSsW+yyQA3MAP0jj+efvV9+6fiw8XZ95vqQwjeRUcA+MVPRVYj0Kchm7SmORUWp/Uczjt6rHUrhHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQS4ENWqPsVL6xNfNx7RuuiRDSQtmNYBYl3+kFy4wYE=;
 b=daPM11T+CpFdOtpvDl/MaBt+PQxUwCCHu00/nJNOIu++NLxyQ8icLNSrJyReLc9c542Ei6/KXcmuF0/LpM1a5cdG6ykDs6OQCXyi78JdMLI5+rK4jMDWVWxinR+mklWkmKKiEmFRY8AdljGh74JG4vdD2RSTmO0igJ3Jo/Z3KC1U90gJU8uESvwA3I43RiYhiPT2Ckt4lZXwGH7Vbs4ZVjP26PlY6wVd08+inCMBaV7cnDT5BCqNfWzXqmgaRzg5EFfO6gbMiI8Re0O6g+gE1Lb0Okhl+U2wqqcov1yN6pI0sjLw4HODMy5qYaoEo9A2O0KwU0A/5CnMTyVadqOCFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8657.namprd11.prod.outlook.com (2603:10b6:610:1ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 05:30:50 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 05:30:50 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V3 1/6] recipeutils: add optional stable_upgrade parameter to get_recipe_upgrade_status
Date: Sat,  9 May 2026 13:30:28 +0800
Message-Id: <20260509053033.1565462-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0281.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df9ead2-ffd2-40d4-4ddc-08dead8c2137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	cPoaJSaRGruFR3OTM3URlOPJQow5vnz9pOBfGVUaP09II3feQlIrS1peCWTJXdMYczcKspWxvB6Pb9QGiIqBKBLPU/6BDOjiUL0vWL6ro+1Hd6+KGVJecEWdoS+IiHUCdqzLFe71p48p3Bv1ui+fRfSgNCIdv88CLfLbM4FEaRu3QQMogQBy8HIhFpKkpgRUTBIolcxX/GjVMUzA3DHcStX44AM8tL3kqnL0+aPR11ZJ7sRPCsL7sffH7INEce18p8nHeTZE/M5aapyDTY9Jc51xI1sg8Qn6vSb4M0EGx33Mgos6u1crgmYPhtEk/NGT+lOkiKyaf0dC6ny54aNLjFhQ653DyghhxKadfREcTsZMdJ4rXzZOM9FwobfRhsGS4b2gSYesn0MvZMk2gblJX5W5BQU56dk6eKpkEq6cNX5ZgEl7kFD0+ZkQEYoSQHGeoqFanCs8saLTKkMAc10Od58XrO0K+sKrVPBnV1xkzSeGkkl6xp8mPWc735RlEjkguh8BMgCi3YO8cu8k6NzHZJjPMVhl1Bjqcqh45GTgPhNgDTeEFvUU+68HPh7RGwo0sIqbtbvj3JXovAolT7UL/kWmtNtxekeGI4/a2D9xWTH+Ga7vUrq7Q1kEaHV9Z/LtmAR1MESfyVdQAJv3fuXj8HSFBBwP+2pBn/xQT7RcdzDclughmY7K7DmVbBOCjbyyKE63UiyqVE9/ktyLg+pNAo2vt4WukosGUBkaHlQ2VjWt2RFNR0ZrD/mNjSAO3gZN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OiYBOHdnaqUN5rfeWojKbZ9a6col/M0mCdCz9dSFEB82ywNxAQL2ySPox4NX?=
 =?us-ascii?Q?PgQIuOf/L6pPxWAfdO6n2A5jtUWMEfDW7ys7+rxmT6rICrLC1AjYhtek4G8p?=
 =?us-ascii?Q?B6XBpK+2qBHMrTNWCLZSVqD9tCSJFv5NF4dnIks1KgOy4iuTardFRrgcdXti?=
 =?us-ascii?Q?3Glv9Zj4c03FpJkQLQniI2egdALgNv/EQQvx4kf4g/YiqNcEZufy0i/QjxrK?=
 =?us-ascii?Q?LCuw4w6jpQA5ug+eLxiVTUUl09CfQgY0Ans/SpAg2RHg87VrYgCMVDkYyu3C?=
 =?us-ascii?Q?yc0E49kJHXyJ+QxRtfEACuHimA8TH+CbedGm/deB5eVAIXuwnTRUJC+RjGxd?=
 =?us-ascii?Q?oDdNVq16/5py8cjJjjSQ8gTKjuT+TOdB5EhY8Yze2AFZSInnS+ayzewA980j?=
 =?us-ascii?Q?6iCDaa7GBpIna2cY4OnkmcCslvplY3c6UHCImCWNBA49nZD+Yyz/zoat0xSt?=
 =?us-ascii?Q?eLCbWtNFa+K37GhMBHy0D1rF92vBTLpx1EVwLKRwhfAMr1vPvC4yc6Bu0Z+K?=
 =?us-ascii?Q?eX2Uk6AfqGmkrsG3sfdvNPosH9BI3AavOZyzrvpu/99i8qti1FUMnxt8HNXJ?=
 =?us-ascii?Q?btnAi3y8HmTYZbP4T5XGL4Lcii4dKvsmlV6ge/5DwSi8ymPJ+aoX16R7QAGF?=
 =?us-ascii?Q?issZ/EC7X6/KFUNI4KjBT7ty+bMRh1q8pWnYy6+HKX3w5uaIoMCkX+nquAK0?=
 =?us-ascii?Q?U+46bteP7hcBGYeNrBAH3lx+KkKzvAfReWA4qn4DH5DxjxwUZuKAB0CG+rb5?=
 =?us-ascii?Q?tXbt+Ug8A3f0b4olZNMvSYSjwQxt2KdX1+wIA2o427cyCwQsc2SxNodMzrPG?=
 =?us-ascii?Q?jA9/wRhXyzcH0kFQCUx003ClhzhGL7mk2hh7o3FOOx0QD+LCER5PT30tJyWb?=
 =?us-ascii?Q?TcpxuSY8Aaa9pez/HBvmMbKeJzBn8LvnbgU/dpCLY1LSI0UX1y6Dins5YFX3?=
 =?us-ascii?Q?oJ/tFtttoxCVflasPzQQoFFbwmJvJpGDwBXGz2kFrN9R+6k29AMPVb97QBRc?=
 =?us-ascii?Q?e7feFcIOoOvnQutPwU9MrgI5ucefFyC4pUyDetiyLPY598ascX/vglzqj7El?=
 =?us-ascii?Q?sdI6aY94XM6Lcyhk+JTqnhVLxT7ubVr9aTakFMy+rzQGAIe5dr4YqTFa9xZb?=
 =?us-ascii?Q?loL+jge+mLTnA3/Kjcm9GKo543izwR+E+4xHy0r2c9X+JlnrMuWCWlo4jLc+?=
 =?us-ascii?Q?DPQLb4UMhG1Vsbg3PtNyI+pT3gVkGmLZVdBVbALF9o02foweHfigW3nyQJJn?=
 =?us-ascii?Q?41knj+IGnfrLDes3VPDUvtqyQH/lxgG7pygRJe0alsKkFNr4DBYphAcwQqFZ?=
 =?us-ascii?Q?YLNcqQP3ri2E5H9IiW26wIqvZZyUYHdvIfrqiq4ewQt3GPVIrO2iWYM8c5bh?=
 =?us-ascii?Q?y/0/9WRj+mjfEq5qC3RDscjUXHaCrmmcx/wxe/vhutwhx0cB72x3nIuHEzCM?=
 =?us-ascii?Q?UDk4to5M8j+gB7CcZ9p2jqhHsSmfALZDfju1++7h87Y+OtqiPf8zq+hDwY/9?=
 =?us-ascii?Q?U/39jesEuIMcRukSOK8WpUXgEURjYCz3UNyA07XQRhEuwm1+FQc+jAxWutOP?=
 =?us-ascii?Q?YjOTQE73WeMstW2IL8c5uHc82Xw1vClNjkMhuqrbP3eil5AoNMyeNgFlePlo?=
 =?us-ascii?Q?gstb1Shg+de5r7hY56y3P7YJwMfvu/xFig7Y/ot6GFMh3AtjMU09v54vd7Kl?=
 =?us-ascii?Q?gVRnVCXOGdMGUvdxG5pa4pdzCaPDjr2hbH0sfngApUpIh1EDLV4FIzWMiqWE?=
 =?us-ascii?Q?HAMO1dUmYQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	JZyMJCfWsU7OBZz1SuycWvy60wjSHrh4KbNcXCohDtr5CN6UAG2verEqhSCFdiz0ARCiJUSgfBKi+Ptf/ZcVRYjJPBc0hOHoLKPR5+e17eRqA5pqCCv7RZZX2rqaTiiCqVYHbIluRtgzaQ0S86no8hbgTOHruE8DXWg+7vikvx5x9dqtG5I3NvV6F1TjYzY3+q8VpcNdFFivSUhnS45ku1VHmECNWzd5+4wJpOTof9KZTJmNcS5kD6Hl/4dqczP5uMjnBq0IvQqN/NjB67F7UHzV5KTcAyPg1oopRLJIFrm4TT4U6zEsZ+KiVnRX6SKmKbVb/v0RlmG2ivEpvsbrKQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df9ead2-ffd2-40d4-4ddc-08dead8c2137
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 05:30:49.9972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWnjIJwVJGtSngKvl1iEStadTdIZpervFUC/yXmNWJuQIiT5KAPolwGIg6vw4M7ctL2wkNghfb56aN/1RS2wyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8657
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDA1NCBTYWx0ZWRfX6fFbALXapVOe
 TIxzefHZu4wz1zu8QbOdQcVI9oOLPNwRojJStw29raDR/Go0TQWOTvMk0adswCK3YkOZYc1HnSt
 2uuZTpIqJAY6Nvqj/tjJcaa2Zg6xV+QaysNlLdV8U/VYPNAemOIYqNKUSnk9M1iqFwPgOvweR1y
 KD3x0auC7fzUDh9WtHJpWueAh9Dd4WHVGd7fKZ4IE7sXj9iL7Ur/mYQaujtyOIf4fOyJHesh3gG
 YDotGMsUuSc5BpE/4/hE6GJsshlBhvuXlLBn5MV4e59/ySY1lNwO5HRqhhhhgP1PWMFPw4exoz2
 iFY1JUs/WI6uIB4SxhzyAoZsbxvjdlZDXFMXeVG3Qh7Hj9HSNcbIDO71F8B2BixEytL8dvcml+K
 cp4Br9GF94u5RujqK+aEswUZ8xhWXW/GeZnTlqydOMdnwoWlKAL8j6QH4TLNjlb7LI0jUhbnW2x
 sYBwLZQk9rURQHobjMw==
X-Authority-Analysis: v=2.4 cv=DsVmPm/+ c=1 sm=1 tr=0 ts=69fec68c cx=c_pps
 a=0XF06BAwF4INxAelKEegqA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=9yvo8pdFzNs4Kck5P0oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: EGLUojNj8bD9ESvb2irHYCDufueULsyW
X-Proofpoint-ORIG-GUID: xhBc2wxN5Bots0mz9BvfdNHXGq_Ysf20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 May 2026 05:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236754

From: Chen Qi <Qi.Chen@windriver.com>

We want the ability to do stable version upgrades for recipes.
To this end, add an optional stable_upgrade parameter to the
get_recipe_upgrade_status function, which defaults to False and
when enabled will try to get the latest stable version of the recipe.

The UPSTREAM_STABLE_RELEASE_REGEX is respected. If a recipe sets
it, it will be used as the filter_regex. If it's not set explicitly,
it means that there's no stable updates or the recipe hasn't been
checked yet.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/recipeutils.py | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index c6604f536d..7c1df518a8 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1009,7 +1009,7 @@ def get_recipe_pv_with_pfx_sfx(pv, uri_type):
 
     return (pv, pfx, sfx)
 
-def get_recipe_upstream_version(rd):
+def get_recipe_upstream_version(rd, stable_upgrade):
     """
         Get upstream version of recipe using bb.fetch2 methods with support for
         http, https, ftp and git.
@@ -1080,7 +1080,15 @@ def get_recipe_upstream_version(rd):
             except bb.fetch2.FetchError as e:
                 bb.warn("Unable to obtain latest revision: {}".format(e))
         else:
-            pupver = ud.method.latest_versionstring(ud, rd)
+            if stable_upgrade:
+                stable_release_regex = rd.getVar("UPSTREAM_STABLE_RELEASE_REGEX")
+                if stable_release_regex:
+                    pupver = ud.method.latest_versionstring(ud, rd, filter_regex=stable_release_regex)
+                else:
+                    # Not explicitly setting "UPSTREAM_STABLE_RELEASE_REGEX" means there's no stable upgrade
+                    pupver = (ru['current_version'], None)
+            else:
+                pupver = ud.method.latest_versionstring(ud, rd)
             (upversion, revision) = pupver
 
         if upversion:
@@ -1094,8 +1102,8 @@ def get_recipe_upstream_version(rd):
 
     return ru
 
-def _get_recipe_upgrade_status(data):
-    uv = get_recipe_upstream_version(data)
+def _get_recipe_upgrade_status(data, stable_upgrade):
+    uv = get_recipe_upstream_version(data, stable_upgrade)
 
     pn = data.getVar('PN')
     cur_ver = uv['current_version']
@@ -1119,9 +1127,10 @@ def _get_recipe_upgrade_status(data):
 
     return {'pn':pn, 'status':status, 'cur_ver':cur_ver, 'next_ver':next_ver, 'maintainer':maintainer, 'revision':revision, 'no_upgrade_reason':no_upgrade_reason}
 
-def get_recipe_upgrade_status(recipes=None):
+def get_recipe_upgrade_status(recipes=None, stable_upgrade=False):
     pkgs_list = []
     data_copy_list = []
+    stable_copy_list = []
     copy_vars = ('SRC_URI',
                  'PV',
                  'DL_DIR',
@@ -1134,6 +1143,7 @@ def get_recipe_upgrade_status(recipes=None):
                  'UPSTREAM_CHECK_REGEX',
                  'UPSTREAM_CHECK_URI',
                  'UPSTREAM_VERSION_UNKNOWN',
+                 'UPSTREAM_STABLE_RELEASE_REGEX',
                  'RECIPE_MAINTAINER',
                  'RECIPE_NO_UPDATE_REASON',
                  'RECIPE_UPSTREAM_VERSION',
@@ -1180,12 +1190,13 @@ def get_recipe_upgrade_status(recipes=None):
                     data_copy.setVar(k, data.getVar(k))
 
             data_copy_list.append(data_copy)
+            stable_copy_list.append(stable_upgrade)
 
             recipeincludes[data.getVar('FILE')] = {'bbincluded':data.getVar('BBINCLUDED').split(),'pn':data.getVar('PN')}
 
     from concurrent.futures import ProcessPoolExecutor
     with ProcessPoolExecutor(max_workers=utils.cpu_count()) as executor:
-        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list)
+        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list, stable_copy_list)
 
     return _group_recipes(pkgs_list, _get_common_include_recipes(recipeincludes))
 
-- 
2.34.1


