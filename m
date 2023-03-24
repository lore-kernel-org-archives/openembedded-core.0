Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A270C6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 08:36:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.95942.1679647005050378214
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 01:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2447b4ab7b=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32O7HZbK010484
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 01:36:44 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pgxhs8g0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 01:36:44 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32O8aGL7030678
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 01:36:44 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pgxhs8g0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 01:36:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6/GC4R3jjqBbRWb9MJ2vs2Decz9pg7S5k8/pUSr3Umw1uZN1oWEHCcE9U2YrDGBav/FB2c/XjJvq67hMEcYY29MqzubQb0zZYLvPRQzw7KbyYwsM+PeEkP4JlgT2REXkoHaQKYRBDYyI4nDH/WiuAsiY7v9t+xqn0HDWfP3D/3ZdVUw5QLxQZ0uxy44HhfQS3G/k7W8wtiz7lS19U/b5tCit9DoWICZEPk5w5HRoFXExbeg4mteA6vxdOLtoMrlpYYy+8LMeq+ENZp5NMGhhufTGtjTjUTjGT07dYZtSGBni53SoE6g2BaG27AJBbY/up/R/5Jga8+mRTUp+i9CqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFKmFGAo1Yy2mooeQIOJ/D3hXYhDeW5AOjVuN0YZeiU=;
 b=BTnLBp6IsbR6/u+Y7ABwUFIlA6ZhRm/t3HcAN72t/vwe0Qkh40wkscntYm7VmBW/QxyKoKYzuYdEJbKbmpEgV56JpGZPpSCcpAspBlyf8w6Fq1Cuii8OFuZXDRoXp6VBTdCmpua56Lw0o4lfErOHtjSZDyK+QGvEkG8SXIKN7Cs2d5UrEDM7SZduF73NSyOddI1tP9UKFcABknW5rgkNnqjVIHLlQuXLfX4ECBoS6dkXx277mHqBEAUIrWUFBvY2U4dyFEp1tRe6LfJznZ75AGH3ExhyVPk8korYW16gWO0Nwaq5QRKpcnbL/6y/howJ0AyPuc95Rw+9x1VoEAP6xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 08:36:39 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%5]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 08:36:39 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: richard.purdie@linuxfoundation.org,
        openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] package: moving field data process before variable process in process_pkgconfig
Date: Fri, 24 Mar 2023 16:36:20 +0800
Message-Id: <20230324083620.2028587-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0179.apcprd04.prod.outlook.com
 (2603:1096:4:14::17) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SJ0PR11MB5133:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8f51ff-dc90-4220-9c57-08db2c42e33b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k4hYI7azgal9cAxu3V5n5lWOKVYtMGmdMXtDkHF+kRYONBczO5Otb28lnHU2taexRmt+54G8zoCR/NF2qi5BskSaYBotO8O10afWNrtWF5SBVMdmAY+lv06LO+rK2Vk0PpqmL29Qs7LtLyPWMWel/ndTiROq/SsJMV8tY+a3ZvID/rJ9X97h9Nn1rG3niVsSLbge3a/bLMyOWCg/8cY4lMhFA07HFL/ha+vxWIsWcp38iW8KWki8CF+8FEAzGI3EPMSqhKwd+ik4noDXnMCJNiavugGPOGwM8A4R2W6BGc3MYa4Vn7cbHPNSDLXkODaz2AXh1O4P//eKmVZMkCVaFmifU4OneoPUQ6pqFNAWXHPyicqPGsnOsZRveaiFU9XdJyIvyH+IRMHA3uAx+SIY1DEOcqQ/lm9YHDKN19nEPZgyag4BGZNJMp3u0MafucyUFmyRUBqrwgG1i3qg76mJaJ5Wace1BOmF6FrwWT1g7eyQSG0W5Pfz9VCrAKHj0aac9KAxy8b5mq0NhILiiR99VRjdLampmFGOAWhNFhfiJsxkFy/Ij8qGJUdJ8EQ+vilIWd6Cn6GgziYGALkqspNRxSAxFzuCDrJqup9QmyP+H5wzFGkThWhvCyldtxL89NwCRk8UZHDheTaMkp3KrnSA4cGdzj7NsDY4LsF3jsxGyv91kfdq0RWEnxfEGxNu2BzaQIOEnDAYTCc13UC0/iU6Ow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(39850400004)(136003)(366004)(396003)(451199018)(66476007)(8676002)(66556008)(66946007)(41300700001)(5660300002)(44832011)(316002)(6512007)(6666004)(26005)(1076003)(6506007)(8936002)(186003)(478600001)(83380400001)(2616005)(6486002)(52116002)(38100700002)(83170400001)(38350700002)(2906002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vTdH2ehkxvP5zU8DP7zzWHgDWClpwAVCays7l5BvgIV+pba0olduNtB02GcX?=
 =?us-ascii?Q?F2pzaNYITq5MKBZtgwkYrjRhwUME9CNSAYjq4fWnwsxwx57t34KuiE5Uqzor?=
 =?us-ascii?Q?p+68dKps3MyzzePKCU2TCsaR5NEjhb004oPvjs3sA08ttX4Z7MsB6tbYekHa?=
 =?us-ascii?Q?TpAxZmDxNil9TrLHQe3sl8rj6Q+pa3oBOO3iLzJfOjUvIQn9WqHQAOjj6SOu?=
 =?us-ascii?Q?6gE//xYSHvUqyXGN4tE5wDU1K9ejl52QWXXyKWGCwk+THLLBaNet4bw+d+Da?=
 =?us-ascii?Q?nS/Vx3SfmxIlCuwWPNFZdjsll6RXwQ1a3Lf8UZweGiNjaWLuV0B47I8sL7eF?=
 =?us-ascii?Q?LXSKzwnMgxWvD02ufCfUDBepZfTez9pOCLfb7aXqZ6laEPytckgMlsbZ/Vem?=
 =?us-ascii?Q?LHM/OaYVJQK/P/OELZF2es4TO/fJvumo6ro5dZSJCsjtVC/7sukSNZlet24/?=
 =?us-ascii?Q?5d0L+FO3Q0Vv3Jgxkw+ZkmN+UXbBrUEjr1PpuH79Hdpr9/WaBGtR4C+b1aPM?=
 =?us-ascii?Q?m6zbSm9qYOmMyD36zDWvv+/r+hWQN2RK984ILF26cl9XSdEtQcROZP+foo5j?=
 =?us-ascii?Q?m1Y9VWJcq9nVw3hVl5fTIp3XG1PlDrTL3+1KwFbPnxyWBmOmgltwU424rclD?=
 =?us-ascii?Q?BUI4fiNUK/AxV5ymsSqURMU8BQk43D1n6QuXPu0z+nAgattL0OZzHHdf+QKe?=
 =?us-ascii?Q?dLIamI7JgCAuynwDAdSMnxIEpCQ1OjPh62Tyhf+n3PjUdz2QUv1rzL7+ZjAN?=
 =?us-ascii?Q?Erv6HtlQT15oNkuuPCjTwCbNvsHE2sd6PiTt5agNcpsrACXl4xwfvGrddxeQ?=
 =?us-ascii?Q?CIPhMOM9GeNMkef6mItdsq7T/znZF9VzFwaPWKTnKloHci86wD02bCiMONL/?=
 =?us-ascii?Q?zFH00rJcXQjnMkPTkuSN5QwOagiPx/YRpXfMCBBzyhuqkAYXCGYDyp9Vjp7/?=
 =?us-ascii?Q?/mzo2Gc3dBq3uSDptmxUJmYBNG14sKAMlxOJQu2UB6DbL0pFnPvDVJQGpblT?=
 =?us-ascii?Q?y8o8nbClkiwHWCU+1CGp9+eTSeV2l+Qz4XRhV32l7oJdrF1GeRp8CDlM/Pm7?=
 =?us-ascii?Q?LjSRIGD2vHQHxHKm42SlYePvF0EucxCeo6OqCXPCcr7G6gW4ZxoTrKQQRp3s?=
 =?us-ascii?Q?WIxlowDeHROS/UGkV+laWUWbfkKu0mjaO2jHdNoZazkf+6HE8rV62JG3jcPi?=
 =?us-ascii?Q?aZbtW79pMR1JYvtMyPl+Wrd+zEW7g3Nn2x00UJtA2HH7fAQtSAuFlEr6i5tj?=
 =?us-ascii?Q?wtPnscYvKHnFkVM19jtHkFc2b3lCran/0hqHXE8w5KK3w9hNSvkggvNgJkE1?=
 =?us-ascii?Q?trPiiSNanmEca2gmcPYOXwb6VwWx8kx9rRVqQDtMgMUkWNJdOPd3g/jy39IS?=
 =?us-ascii?Q?Ha1SgjhZVJQgqgNsznddk48iKGyCWtEfN+kTIUgrBFOBnqizYTaKf6AOD/p4?=
 =?us-ascii?Q?OnuSDukW48Ox/0Q35Gn1/1ctvcVdbrf7h0HcxUZNUFcQEfcSp085ipa/TXZC?=
 =?us-ascii?Q?Z9hOAebFRc/d2p393Xi5tWyW9tC2yoeVuzcwjC9ZFUNj7AABqccdezebXE4k?=
 =?us-ascii?Q?CQpV0nItL+kHO4eaQRd9TyypWsXQmyl17wjOw8iif8Diu1i34wlhgskU5dZE?=
 =?us-ascii?Q?tw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8f51ff-dc90-4220-9c57-08db2c42e33b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 08:36:39.6417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4+j67vgDMbKMKUI3515eCaToRXAfzhGomgBvutf+a+uTNcAVaRc2xk5U1K5pnL7/zX1djAsGDoyDZOkA/M4XCG0bEoJFoW+p9V8s9pAHzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
X-Proofpoint-ORIG-GUID: K_qk0ywJU7FyMv88LBZQoOHgE99XYj0S
X-Proofpoint-GUID: fRITIKLBh8SukAn6KfxxoU2D62o_5l2U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_04,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 suspectscore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179019

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Currently, the latest version abseil-cpp contains a new library named "absl_log_internal_format", it's
basic package config(.pc file) as below:

prefix=/usr
exec_prefix=${prefix}

......

Requires: absl_config = 20230125, absl_core_headers = 20230125, absl_log_internal_append_truncated = 20230125,
absl_log_internal_config = 20230125, absl_log_internal_globals = 20230125, absl_log_severity = 20230125,
absl_strings = 20230125, absl_str_format = 20230125, absl_time = 20230125, absl_span = 20230125
......

Normally, the process_pkgconfig() would process variable data before field data in a .pc file, but in the
absl_log_internal_format, the field data in "Requires" section contains "xxxx = xxxx" format, the
process_pkgconfig() treats them as normal variable and using the setVar() in bitbake's data_smart.py
try to process. The absl_log_internal_format field data contains "_append_", this hit the setVar() checking
and finally bitbake stop building and reporting an error as below:

"Variable xxx contains an operation using the old override syntax. Please convert this layer/metadata before attempting to use with a newer bitbake."

This patch move the field data process before variable process to avoid the process_pkgconfig() treat the field
data as variable.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---

Changes:
V1 -> V2: changing the package.py instead of bitbake's data_smart.py
v1 thread please refer:https://lists.openembedded.org/g/bitbake-devel/message/14525

---
 meta/lib/oe/package.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index c9eb75d852..7a6b31957a 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1823,18 +1823,18 @@ def process_pkgconfig(pkgfiles, d):
                     with open(file, 'r') as f:
                         lines = f.readlines()
                     for l in lines:
-                        m = var_re.match(l)
-                        if m:
-                            name = m.group(1)
-                            val = m.group(2)
-                            pd.setVar(name, pd.expand(val))
-                            continue
                         m = field_re.match(l)
                         if m:
                             hdr = m.group(1)
                             exp = pd.expand(m.group(2))
                             if hdr == 'Requires':
                                 pkgconfig_needed[pkg] += exp.replace(',', ' ').split()
+                                continue
+                        m = var_re.match(l)
+                        if m:
+                            name = m.group(1)
+                            val = m.group(2)
+                            pd.setVar(name, pd.expand(val))
 
     for pkg in packages.split():
         pkgs_file = os.path.join(shlibswork_dir, pkg + ".pclist")
-- 
2.34.1


