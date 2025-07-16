Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84EAC83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 09:01:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17613.1752656478801351570
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 02:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9292e0fab0=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56G503Vg1381513
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 09:01:17 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdrxhnc0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 09:01:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRmebVq1Cc9uRX/pjE8EstUluH9TfKWTown1n3DD5zNf/iwMfNtLSJ8eY3ZPfvPHaTDNc2yOMwWmPJrIDP+mwB+/CBtMIAQ14NwbOP0XA5ewqZ+++cLjARfQHoL11EtZwHEd2rZw00ZjMKADgTpY3aAKzBw+XXPn1xr1Ttj7T//qRODJykSFSPuWrvd45Mb1SVwIEIr39isje2K4q/trUFpFOuaiyI9GKzwiJ7JRHUuD19KFgu9c+nJzIDMgNaVfWxkTa+QvEHAMhcQI6I32LhEuvycSnOtdmbBNX0WqoXRvzPEuPm2tvaOm+49s43qH2eN/A6VAimggmjXCODULJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d978G7xcRj+SUuoA2d7LQQwAx5lTY8vZVdIOlF4bs60=;
 b=R0j1SRNGVaWgP8fzjsAoY5d1BLvSC11O0RmnGd+DEfY7UhOUdJkh+7c3DOBcCpR4yIEYfhOaMr37BNzsb1J05I2UXFgLWKaoZnWnHVw6MrIp8tcRaS/D94giDXrAbtGeQ6hb3TVEAPV38978gpJJcHQHqeAIceq9SnWOWk9QRuDR7XFHajutDWYiLGNuQpp4t4Wo480yKDbBbCiyXd4ZV3dD/W7I8VIy4kFb00TYWHEXMX6CgzIGt+Cf8XpolAXoeTR70qkwkhmShg18zTfH3Ko2YUDU+JEE0ICV8NbRbeQEi6N1Si2nYdOQNTK+KCDZsOp9rqQOpiBIOVCmTe1sag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by IA3PR11MB9397.namprd11.prod.outlook.com (2603:10b6:208:573::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Wed, 16 Jul
 2025 09:01:15 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 09:01:15 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH] oe-debuginfod: add option for data storage
Date: Wed, 16 Jul 2025 02:01:02 -0700
Message-ID: <20250716090102.2617539-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::12) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|IA3PR11MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: fa022471-56ad-4351-e62b-08ddc44751e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xJeQWA6/9GwGHIInaCIg/HPO3reE/XgRR7W4NI+tn99T/qKz9ZuAOlkv8UsH?=
 =?us-ascii?Q?1BC/FnwLgIgS/kqxpM9pi0AtjvHQB7s02mBwNo6XScGhGsmhFNjrRLT4nmam?=
 =?us-ascii?Q?WxkiIBMjz5jsqwQgar7b2/yzYY/YPtZ9GftrLgKp1r/TD8CcrXCfr4Avhb2L?=
 =?us-ascii?Q?92GgiWGrmRogeIOmF1j52EXfilYAVQvYdt2sIRLdhrN5EOmIwkyepW1mdfzz?=
 =?us-ascii?Q?lCvm0wUG3xQsCaVna1zDvFt67MDU/lQAunxw6FqnIs+9S5XirnYbNYcZjYUq?=
 =?us-ascii?Q?+pSru0YbSYFTWjpsiNLEYvAUvpm5COHrj7g55TjPvA7dgC5u/hrmVFXk35Th?=
 =?us-ascii?Q?dqEdkfopuMxkqKr05BUVmIE8S5Szys03jEQfGjMyFq7CI1h6q7qw/XqM9aOg?=
 =?us-ascii?Q?5LbaN6LvVbnrjr0o5Cr2lMyp/5+92eF4+vx8mP0h/tma8/VC3ayrZ0h9NcUE?=
 =?us-ascii?Q?hS9J7G43sVl8wQU/SkKZ6vN7fUNPaUV/wAjOBhM4emFBcGCDhLp8b/Jnlhg+?=
 =?us-ascii?Q?6qiFCDjC48kwNrOyUY96uI58hX/qvRME4jfqM2gGYCkkDvt0eK4AUDVN5Aue?=
 =?us-ascii?Q?kgRQjXF9w4q7ieKdnomYXh4GDRd4DpPlnX4bcOPsDA946zbdBOcuFtCcOd/E?=
 =?us-ascii?Q?YdBi33bU+CV5L+lWWGdqM5N2rZTTbBI3DR3vgspC9DzWFayvWlzrhAh7bbyv?=
 =?us-ascii?Q?g31npQHrD2DJ8LKwi3uLluXrb0Eetq8jiwPDRwaDZjA5SHNpk1q6/PiOFBGn?=
 =?us-ascii?Q?E8yV9VNzscOG78jYTwFw6EnNkp4r/ZJxSMQdauQG74BNPVrUXQDpFaj/Mcmp?=
 =?us-ascii?Q?6RgTuKVoohTewOElVHQ4xs10TeLlDHS2o2kpKdLA7kafmmYOvHCzJnsoiKu+?=
 =?us-ascii?Q?EvZ7d5wQ8eq7RhIFEhToM7exGRdgDywGl7yqZ3u36eBnsTvWo4WK/v0fw22P?=
 =?us-ascii?Q?/IXF31mz5OJtMA3q202oZ/cr5jQKHbpjopEpU1UK7ApnWpQRtXV9Iru40nn4?=
 =?us-ascii?Q?v+4b2Mm/hbxz+JYNt/OINN+L4LioPDdk26evqprvNb43MQQchSfLXi8kqDOZ?=
 =?us-ascii?Q?92PIjV6N2HEhfpiSSVnluFybsZOL37v7Kcw5vyHrHP/np86UtKTlx9bnUdTD?=
 =?us-ascii?Q?9Oy5ltBDo2eJFJjSbNaQGzJdzs1McoQyqAMRYuFO20ESxOKJyi1Bztrfd5+6?=
 =?us-ascii?Q?eiIkM/GAgx6/zDaubyq8pcNpi960eZmSs/Mr/HzmaNH6hK0IgleiyZO/hAyF?=
 =?us-ascii?Q?udo0dz+RXcx9ceGoEQEBzWRdODWHiRaEew3r8JSAggpZEhokUPXm6XLXmCOD?=
 =?us-ascii?Q?suJh9+1rC1QqImDo85SrI0MZh8YD17UMRu166xmCT2Y2kHb2PXKRXpFCEuNR?=
 =?us-ascii?Q?uQFMRpFIuTgRxsnQJNtrq5ep/K4WHrNcj35NLs7sGd6reYJf2d+f+FfdRyCE?=
 =?us-ascii?Q?CWMHUyAw3bRLrkuGmB4nuyp6U/HbR5VSQ2HuEBsRmKY/Kazd4H9ZbQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fv1zveLU5lKqobf4FZTZ4gUyGiiSW5cjZ6vbgmpgNTjKGjet42ZbsDoKffU2?=
 =?us-ascii?Q?UjuKAftu7Y+T6k3BSOdwkjOJuV4jmpIiUdlQNwPW0qsrf9COeOISgGlE17aO?=
 =?us-ascii?Q?G62emHjNAGFaGP5vVrQWoMFWT9Ae6/sve+enjICMTbe5Ex5ZjmKWdo4g9ppj?=
 =?us-ascii?Q?MFJePzSCpJIGlZl07Bb05Q5NMmoErKgzif7Xsj+gLq4UCl8pCtvftsT+YLCt?=
 =?us-ascii?Q?XNMtvHIEeVRNYspN9JNscEO0nIlTFrYbFQXVjKbQvtxTkJ93dvH0Z8M4T086?=
 =?us-ascii?Q?Jso23fdUpDTstllhTl0vXwt8X2TiASlXxaPLwooYAbNOgUYqkmkMbkr67fzJ?=
 =?us-ascii?Q?UcjTYWeRgDH2dCNNpsq831qKLNR2TUax/DVheqSoTotou0WAtkmvvJlkys8x?=
 =?us-ascii?Q?7HpbbUEYKnP91l2l4w1vuCt7qjuQ87+BCS8CsqPw/CtJO2lqnMDxG5hSj7fu?=
 =?us-ascii?Q?OTMVWxksb7qt+iH3kVlTrSiDQEHGV6V2jlJBzwzQHTdzR/zRlbgFrCDnjR/K?=
 =?us-ascii?Q?rZtfWFiHeHS/hY3dnAQfDb3Klme7WP8/3/5bO2Vfl5b3eiZpO89BdypDZF74?=
 =?us-ascii?Q?bS6e4RL/0YDLt7V077AHcnTuh7Uo4hb4YbcC6ujZASU2+/FOp0W9DZLRLoAD?=
 =?us-ascii?Q?aRm+vaFvajVZIolvAEWdRzu+znilN3KNLCLX8prsZjE4kTJQGIOdZ4m0wv6v?=
 =?us-ascii?Q?s1KatCX983ZyHPNDpOHBU+7SSNF0oRzEl3VvL2vASgdcy7y7ri6278q0eqrS?=
 =?us-ascii?Q?2UUFyROhzzM7oGhJ1uh3un2zizvcTiZ9sUtuZesAI8KEmUFNUigwgxTq52p7?=
 =?us-ascii?Q?VrlHhaZHbXcsg48bjj9W1NQ5zn3/++OdlUf7g3LxE9k3SODSqwDBKu6QasCU?=
 =?us-ascii?Q?AMP1+zkEi9ekpgElMNaJeD0XmG1zwiqXAkbph0XJIRxf7Emw/SgSaamr84sF?=
 =?us-ascii?Q?WF1Hoe93LTyHGyqf4d9JWEYQojGx7TCObZ6EWpwkt0IYGigx0Xa6PVHenN+j?=
 =?us-ascii?Q?LdAjoOWhl3iDZwxku8Pv4NYMWwrEAhCjbA+UXqna/nweL8kiOvYOUSy/nScS?=
 =?us-ascii?Q?P92qS08OhW//lT+ODagEx1tzEEbKxOo1CuN56HNFPkcC+u9kE1aywMRnzdUm?=
 =?us-ascii?Q?O/8GhOdeWZ83iykdl62LdiFz+6oHEAKlEAEFxtzmdqafI4dAmlMyfRGtwJc3?=
 =?us-ascii?Q?CpknENsG+3yZ4EuZEmx1c4WircmSw7yM6nXV83lcX8I0aY1O80RuQCmsik2I?=
 =?us-ascii?Q?pEsCGt4OPNkhuCLLV6USqk3nXlmxre3ZeTYF1UcSgg6HZDFYwgzlCxaktfOD?=
 =?us-ascii?Q?BUlVHjC80DEpQp+O7FPAu8FOgXUvfp9zv2xeL6ouG26OKoyFkWDfucVSQ8IX?=
 =?us-ascii?Q?jwEiEU1jx/lvQWzQjSShvdNcrPcfLRmfzg3MGBHWdLQx1ieq1L/7K+mwBm/A?=
 =?us-ascii?Q?h1gBxN/zCi3XYIVz13GauPttjlftrqVG6cBGZKkRMJy7Qn0mSBnN3lRL1glA?=
 =?us-ascii?Q?mDKR0Z+U6OXAU0dJQNYe9VZnOelB2LcVIxOb/a6xfnLt7rbHv3+8YdwePzO3?=
 =?us-ascii?Q?qLwSBvsjLnENReWCg8ZbUOvkXu0h+hoIwXpe2m6ak7pt4KP71wvBkNbV3Qho?=
 =?us-ascii?Q?kk99p3ETEyC+952KTQE5CAE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa022471-56ad-4351-e62b-08ddc44751e0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 09:01:15.2814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+cyY/N+8v+bnZz7FmzwAfwZjovQE78XkeHpEutRyDvMtqQgPa+3flW8TihUIbbktf3710IKRGm/UJQf4xTCBFoYchpFKIM70/6bRTfb1dqtkDIIT5CZ53FsI598G8X/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9397
X-Proofpoint-ORIG-GUID: FTV97HGGox8zIXQ3GZg-FBSUWttiG1QQ
X-Authority-Analysis: v=2.4 cv=L8odQ/T8 c=1 sm=1 tr=0 ts=68776a5d cx=c_pps
 a=ik8UMrPuXLsbptq6o2EzMw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=0aMSuOhjnTuNweNNQ9UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: FTV97HGGox8zIXQ3GZg-FBSUWttiG1QQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfX0JjiIacEhgKX
 H+8VQ7DUgjuOWBY8LHWUg7CyDUZx48ejc6xltOLvkUP2bztUE/QnyPRJdWDW0zKmgO0MBQ3RlVn
 98X8r2sTdld6S4nkVTXcOjrMKcYHRYvIXkI8zDpBV1pgCcG2edix+pvWepfZO29jn2BO19Vis/X
 7+8AsYAphBCdOsA1ZdPxzkGe/krdiveq/0J+UHK9FxI3Z+LtBFxRjY/jP6m3w609gnXIIFWjiGL
 6UV3TUxzwXf/uPPlsSDSY4yYL3wOJCJ9NVYl6UzyFJt4eZ5RWAxN6SbQW84wY6LXPpP9yrkYUQe
 VAl9ZmcqvAV5WVgvPFU6kpzcGyicnZ1MVK7wHqPB2aq9uAZ1tzWBlM7Ak6bnWFGgbv5t79bViqW
 E9J8bRSj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 09:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220437

From: Joe Slater <joe.slater@windriver.com>

Storing the data files under $HOME can be unreliable if debuginfod
is used for several projects, especially if $HOME is shared
between machines.  We provide an option to save files under the
project directory.  The default behavior is unchanged.

(From OE-Core rev: e1e0cf82f559077e2a51447baf137086202c0c4a)

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 scripts/oe-debuginfod | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-debuginfod b/scripts/oe-debuginfod
index b525310225..60e51addfd 100755
--- a/scripts/oe-debuginfod
+++ b/scripts/oe-debuginfod
@@ -15,14 +15,29 @@ scriptpath.add_bitbake_lib_path()
 
 import bb.tinfoil
 import subprocess
+import argparse
 
 if __name__ == "__main__":
+    p = argparse.ArgumentParser()
+    p.add_argument("-d", action='store_true', \
+                         help="store debuginfod files in project sub-directory")
+
+    args = p.parse_args()
+
     with bb.tinfoil.Tinfoil() as tinfoil:
         tinfoil.prepare(config_only=True)
         package_classes_var = "DEPLOY_DIR_" + tinfoil.config_data.getVar("PACKAGE_CLASSES").split()[0].replace("package_", "").upper()
         feed_dir = tinfoil.config_data.getVar(package_classes_var, expand=True)
 
+    opts = [ '--verbose', '-R', '-U', feed_dir ]
+
+    if args.d:
+        fdir = os.path.join(os.getcwd(), 'oedid-files')
+        os.makedirs(fdir, exist_ok=True)
+        opts += [ '-d', os.path.join(fdir, 'did.sqlite') ]
+
     subprocess.call(['bitbake', '-c', 'addto_recipe_sysroot', 'elfutils-native'])
 
-    subprocess.call(['oe-run-native', 'elfutils-native', 'debuginfod', '--verbose', '-R', '-U', feed_dir])
+    subprocess.call(['oe-run-native', 'elfutils-native', 'debuginfod'] + opts)
+    # we should not get here
     print("\nTo use the debuginfod server please ensure that this variable PACKAGECONFIG:pn-elfutils-native = \"debuginfod libdebuginfod\" is set in the local.conf")
-- 
2.49.0


