Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FB2C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 08:40:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.25142.1704184821163658086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 00:40:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ExjQagrL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=173143555b=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4028PBp2029118
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jan 2024 00:40:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=neyh8AF71hbgbUW5rX
	mJK3nc5H89VA20VzESTXvLGi4=; b=ExjQagrLSptk9LzZ510jZNCQcAhGVkdMRP
	z+eTIKlOw6n/Gk1917tvAOHWf4CcwbHbXPe7Au4iMMI0u3ww0qkFvuPB//zVOXav
	v3+Tegov3htqNo6xko0u7D1F9GqeHJBPvqRXcfhNNg7i5q7Gi3VqXbS6QPbnU+dL
	m29+u4UYRQuih/xaMXn+iGd2raP0wrBcngFa4bx2XyBkTC9A6PfeiCs7ZefJP5JC
	gtJqtZpE6cN+vAFWE4m824vEWQyyVXFE2/jkqOt4EootY/kaRo8E6+TELqUz1zkk
	aReEpGb/QXJPLiWjJsJ+pfbTxsCAZ+smZQEuuQR5wyK+JJkfe/ng==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vakkkt8d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 00:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7RbmwC3iiU8DWzbgZlsgedunDoESJKJbH4FkWOAuR+DCAYZf+pc8dSBbMdLyl3RufrO6YwvcXEhaH1Kv4/deYcDUXKb4owIUB8GYHQ73XmZwYDss2Ki5y7/invAO+EZEHppXbLpgF9QeYy2LEBRxxxtgmcsphh5xvynkyoRmtsf8/qchSnctd61BcOMkKNAArUu7vg8P0OEr61JoXlOCXGn3q2Wt5m7ibNIsiUXo/0JJQXjT80ouCywogsT2kk63B1ctfmVK/6Kcv7tQGdgsEt+POoYAuxzllDaFbP9C//zbHPegAbdK2jgyi8l+fGPNY4Jw2jU91b/K6aCjfL4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neyh8AF71hbgbUW5rXmJK3nc5H89VA20VzESTXvLGi4=;
 b=a/9U5KZieTcgfYpKquCgETJrxQuTiOeorrRsZWCQKTH1S5voxzHyCH1j+OUi4piSEz2vn+pHksyn5JHGThlRQbQIoEarHxttdP9C1ZGBnIc86Eihjv8o2lnFVL+yEVm5i577yvxgYgjMAmqCRlPuGS0jJm0IbYHCjrZfTgdmqIqEUnIdWh4mDRiDKkR73SZFlJFW8sZPWgA68JPqnWflZqGuCouPYrrU2ig5IBfTwABVEYXyWX2icsvUJ7CHm3Fpb3azDqyqhOcvwKeVJ1hBoZlfYyYOyGNMChu//96nBxgicQ1UFMQslwRAuX/Y+My78dehKRjTbm3EY+uYjbXJ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 08:40:18 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 08:40:18 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] devtool: use straight print in check-upgrade-status output
Date: Tue,  2 Jan 2024 16:40:02 +0800
Message-Id: <20240102084002.367885-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:404:f6::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 376f2677-b905-492e-f4ee-08dc0b6e72f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lFGRN4YK2golx66oVTyonivHwme1lN2g9iZlQTc+94K59OocgwsptXy8VOi5a7vKouJ4CkDAroFm4VaAoF6lCEBu5qnl0eyAOpV63gJGsSmTSDzUhpkuIJNaIZoy9XJ7KbZo2RuCCT2SmyaL8ekl5Gp20zE3hCdqigNHzUdvcbLa2bvusBsK4YZqsS5CHIW/+WBAijGTojHLBaDo0L5fsCKwIv78dErUYF+G4c6YoaCOFsk+OiXMo8WOphiKjoDvWCFgyMDsZz0oVoKwObPCEJ+5L/LecXC9ZfA7uq5wjvl69kJW9aT8KRTGv1OaZvjrQ26TzTuaGVnCYYWDBDMDVLRXyMpw7T9bk6SPi17o7nLWLXkzxgHuC7GLa/ghNLk6y9lrv6NcdW6pnKvwgMhKgfnETB7BoWmIHDD29xu/8T4Ep0L5kWxTZn5FWlLcCymntfiI90itcr7SNMgpwZqVJ1RZjWcWrxph6K3L1sp6IdgHW07iUp+rll237vrOA94G10O5C+hbETchQTUAwoDf7SUL4ZZBrzsRgyjUkL+0ipEqgRrOohusvQ0r33R4X3mlxba1Pszb22B7i67RPT8pOhobiVt5V0saxM485AzOQrHlHgmGcDffQ3z/vM4xf9d2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39850400004)(366004)(376002)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(38100700002)(86362001)(38350700005)(36756003)(83380400001)(6512007)(9686003)(1076003)(26005)(2616005)(52116002)(6486002)(478600001)(6666004)(2906002)(6916009)(66556008)(316002)(66946007)(66476007)(6506007)(5660300002)(8676002)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ppMmUZM753eN1pH34cOleiHGk5WRyHMOsPPGWm52Q/fUW0mPgk+8jhGxIuGQ?=
 =?us-ascii?Q?yDgYvlDuEM3O1+dDgBtZyGu6EU9jKlySOaemNYyVl7FAPOM51zt+81jntCf9?=
 =?us-ascii?Q?UKOxZJ0wduYaRVisCOE8UmHOMYBc5zsaIUI8iT+baW4xYepwYyZB9kF1Asj9?=
 =?us-ascii?Q?wuMQaDdM8ynokCXd4lyarlL5yxQMfYdu9QEMqb3ucrun23KXtsI6euhkIB04?=
 =?us-ascii?Q?oORNhSxizJhzEHPCi1YBdaemOB5bMCQuL/+gr01YQ6juMSHij3w7mc39ZTnk?=
 =?us-ascii?Q?5BevIIUVvtcyEy/6DlufnHUi7u6Qbwhhk3Kbfoht3XZjjLhsF3yFbqeE14HF?=
 =?us-ascii?Q?gJ1YytRwX4M1XGx3eTpvcy5I4y/KRKfFdZ0KcLSpc8Ocdoeq9Ay+wFdj0KJY?=
 =?us-ascii?Q?7Px7ZgBas/8/GhqBG7p/WdDtWdWQmKrsdVhnMLeU3ftflHgnSQovgwfJ74jH?=
 =?us-ascii?Q?PUiab2k+6iIShmVFtKlE22pOdALIqJaeh3gyr8Qw/Fqcl/F4YPl879NrX4MM?=
 =?us-ascii?Q?exfDawIf7GUnlUih97hJtTwg1SNIXs0LVWKXC6rzLxfKvCKS4zXEM0ZVz8aq?=
 =?us-ascii?Q?Db7IkJKXisyaD8XPLMkZbTZS6WujHdT1pApmTqwbLuh9qs9bBJtnDnRX6pt1?=
 =?us-ascii?Q?e45/YLDznpYxdrTLvJkBn8rU0zpxZWx56WmrwvPpdGm0SvO6Jeu0S24rr5vf?=
 =?us-ascii?Q?7XT2NmErl3YhAdmiwRbUnzho2/zKsvgZfKUFSnoaOhooSKMy1xK5H/OoFkKU?=
 =?us-ascii?Q?wSSCgeK28nrdJKzst8C50/Gbwi2rT4srXuLVMqbDPdxqm+vakTrlFEa5AdNa?=
 =?us-ascii?Q?MdS0v3BVCaLvQ5OAm1uBbZocvE/BQrP33y+tYEDChlVvMi2/6/jnf5A8SMk0?=
 =?us-ascii?Q?QahT36HomXVNoqsN1fpEU77fyqPS8xZ8kwmH8+QG08h9+/mB4j1a2vF/ObID?=
 =?us-ascii?Q?p4VNSypMT0SDK8XqykMxKbz+Joal0L7ppmJTta4Pvhi0xrC5cIy1FnbXlMJ0?=
 =?us-ascii?Q?UC+N0Xj5k5+fgisGvIdLSq7Dh3j2qFvIbXPdxPCtDsz2FxeRtL3JfLYf2l1p?=
 =?us-ascii?Q?62kBz4MVXkyLIl0zCBCf+Rs+Wrh3oymFtyZOTwwX6O4AhpBYfi8rnJwsauWA?=
 =?us-ascii?Q?QihYJKqc7ggxczLgA6dwg5XiN5njdB6vaqpSzpn1S6s7xMDUYNvguZvbYzx3?=
 =?us-ascii?Q?C/BtVUDjrYshad69MkechcD5xzYEHH6vxGrfaPUNUi/4PlOi4IiN6zy27l7z?=
 =?us-ascii?Q?vLG2J3t4Eqibln5f2qemUckPJ1PUbmFX7Jjss1PkVMYdCekMWLpDWPsjMT6G?=
 =?us-ascii?Q?A6qrh4J8s2ThYtxKNEe7w1v+CD/otTyroj7jEXXxo8f8iiP19Bu/cxM2CdR/?=
 =?us-ascii?Q?0SU9sXs2+zrdl46ppkf97eBiFV0thiWmUjANf4go5UqK2w6vZCGq6zySuUyj?=
 =?us-ascii?Q?TPR3UMMJ9Q6ykRipz/k2HwkkLsMlM3PWKO58vo1kxcFSR6ovrgWgVKDcbclq?=
 =?us-ascii?Q?Z4AzOt8Ia1trFW4KnTXR3B/sV0rjJ8nZiCBf/p6ekwaY2dAXRrxS22yms0QP?=
 =?us-ascii?Q?KSAJ2mISFRnZvgyH88OJCVgOy2uMWmDA+PAT8HMu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 376f2677-b905-492e-f4ee-08dc0b6e72f8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 08:40:18.5219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rzm7q1RwyYMqVq2lteiUYq+x/0p7IADV3plBAmzS4+KScTduGBTey+nYO8eLMOmoDVQacbFLvsTeHoiDwnf1BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7651
X-Proofpoint-GUID: RdfimDuMNOzxmnCiRu9tMgXFsnz49QuE
X-Proofpoint-ORIG-GUID: RdfimDuMNOzxmnCiRu9tMgXFsnz49QuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=771
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401020065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 08:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193221

From: Chen Qi <Qi.Chen@windriver.com>

'devtool check-upgrade-status' is for reporting upgradable
status for recipes. The output should always be printed out. So
we should just use 'print' instead of 'logger.info' as the latter
will be suppressed if '-q' parameter is supplied to devtool.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/lib/devtool/upgrade.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index a98370bc10..ef58523dc8 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -631,7 +631,7 @@ def check_upgrade_status(args, config, basepath, workspace):
     for result in results:
         # pn, update_status, current, latest, maintainer, latest_commit, no_update_reason
         if args.all or result[1] != 'MATCH':
-            logger.info("{:25} {:15} {:15} {} {} {}".format(   result[0],
+            print("{:25} {:15} {:15} {} {} {}".format(   result[0],
                                                                result[2],
                                                                result[1] if result[1] != 'UPDATE' else (result[3] if not result[3].endswith("new-commits-available") else "new commits"),
                                                                result[4],
-- 
2.34.1


