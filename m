Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0073DC3DA49
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 14:12:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6764.1721484764673786349
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jul 2024 07:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7931d613be=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46KDZdPB017724
	for <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 07:12:44 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40gcrg01yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 07:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZo8dHQAP1W98qR0bp3A0UshEhQg44awTu8zlUpmHRfl0TZ9bhmUhE3YBmbuKyqJWQflR4Q0U8/Hjaj8TTqpeTeE1xesRDrhtb7sKysZ7mwOQ1ZvcBkrxUVU/LQXmoqQRXI7TJgKeiNweGi4D/9vk6iwKIOh499F9X37ixQ2+k4A/vFt+ZAGWssO7uA/Ckehk2K42nygkiUZbyStC0rLQUHj5oMU5iiWD+uUHyKGZz8ug3xJB4PPUl/prujKEN9ekfF6YSJgKLD8znkYkkTVY9qm5TDxCsbJqmCqYMX7z25Vaor3QntXlq5AsqOX9xCpUnQ8slcoDn7cvoGcpeHcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqIfUSBAbeRdLYjMSID16YGVHforOogGxQqxBt3+P9Q=;
 b=I7kGgwVz7mpmZjTSym4scY5jsUoS2zBNYr4sydyZfA/FNQNlneXZMBkG23G7V14qeDFkO/7iHfhJAIJGvli9cUvbocqqEUWfw8MbI7trER61rFkmzdVhtcGJs0aC4ldR7tz0qEEinuTDWWG2NLMyJFJ+wLO4Le7grhoytVz7C7gOhpObvkJf6yhkRGHcY1dYvqZW5rBpMi8kBCGBSXmfc0qXzFzkolfcGhYLB0zSJ6rGZiqCBLhOkm0QJ02IW4IiRfy1ZUCSRjqIk9IN8U4LnEnAbDshU/9dwKEmHY89xc6CdvKaREcTMYNP1SPgkKzOZmzloakglQw/lO5RC92o+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB7216.namprd11.prod.outlook.com (2603:10b6:8:11c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.18; Sat, 20 Jul 2024 14:12:41 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7784.016; Sat, 20 Jul 2024
 14:12:41 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] util-linux: install lastlog2 volatile file
Date: Sat, 20 Jul 2024 22:12:30 +0800
Message-Id: <20240720141230.1766504-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbe434b-1aaa-4b45-7f44-08dca8c60499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oLCTay+bfHupjZRXw+28YX7YYvYdCDT3iu5CoOsWW8k08DiMJ0loPuqf+HJ3?=
 =?us-ascii?Q?VpLhDLmAWKeYM7Lr7YGLrl6MXLQCoZ96p5UTu3fd21oLGf1JaWH7h1/bT2th?=
 =?us-ascii?Q?Fk9gDHwgN0Nm6cChyYOJ8cw56OaC21RU9s1/DJfpP+lRhZEeSytPtrtxXBYj?=
 =?us-ascii?Q?Jz1XrQXGwOfF4bZLOYf8tXgmus5oGWRThMExaAH2BdLtUUfz6Y4b8Y1CPRbK?=
 =?us-ascii?Q?bNN+6SqfRC9WWGeghwAPRt7cBHEdZicTry+EcIqeYnu+/85+snjenpIfzdYl?=
 =?us-ascii?Q?D0LFdu3W8yNJEMF/ufoeHJOS7L1yczZ8mxqbnhSqpvizA7/GFTXyy83hSmsw?=
 =?us-ascii?Q?MPWuBBHTbp/1eP8S8OU5KPPBHbqGY5CU0jd9a0gNslkdKBfVMlXGBsTeTSut?=
 =?us-ascii?Q?H8FY6A93b+C5qsDFj4VVFyXXr/zhsXIxSG/JljUExiFcQ2/CMlQr8Dt+whUW?=
 =?us-ascii?Q?KRLOerFXVhCuxpEbYIN/Ek1q13CigFAjdFCNzPx7LxmcssiOQxl/h9Mt20zb?=
 =?us-ascii?Q?aswTcVNVjeBUuzPVMUBPS8ljs8Zj5Fv8dA8qXE7ZPcV6vd3gRwJCCrcLjzh2?=
 =?us-ascii?Q?ziOYBt8ZRxOSJvbZpkRf89l+Zk29aASQlHnoSM6yfRyNBxzIJEfwnPrCWkk9?=
 =?us-ascii?Q?k9LYQWocE/iiFQkaQETOL13wXmzFcriNknqQEnEMroDguBVdpZK1W3kGbXmS?=
 =?us-ascii?Q?1HCqYtzgCx9F5bIJgZj+aIetTfokBtd/nuEhMbxKM93rtOnj89z4B0QQsiy8?=
 =?us-ascii?Q?AhEitUGazPJ/8Cus5m2WpAoG+G6dUBmd/0oSVMgN52gL2Yw88kKW1Z9Orxgf?=
 =?us-ascii?Q?/xPebCGKruAb0IC7bMYZAXA3tDfrlAkRBocoartbTmd85LaYO+/VIJs6ga4g?=
 =?us-ascii?Q?kH78EyaU8bTiFkdUQsxJSi3ouzQbHi6S5fV+x9qWpam0cNBIWwl/fNw0WSQJ?=
 =?us-ascii?Q?NwgV+LIxn9vSu3NLKEDBft7ChE+k3bkqaCSpf6HqsdWwtVL0g1bwS9u+g/hf?=
 =?us-ascii?Q?qBhqGGmmsZpDe5roQWn0Xo4udkIUaOF61Xpe7PRXnCnE7ae0q2iuF9x4YvAB?=
 =?us-ascii?Q?WMkPa57CYpj668ex7YPnduq9NGQ2ojtYK4JJFgE7Z8NnsUvjOoYhQJZ0ACxw?=
 =?us-ascii?Q?x32PgYK6tbNXuq/HF3VXtZwlEnWXvLtfJzNiXZ4aBDsVLG00BALAcwFIu2gT?=
 =?us-ascii?Q?LmqPaU69ROMwZC1azTBCSaLi5SRnb8R26SVtH8oB41AA/tkq5IRw2UI82sYs?=
 =?us-ascii?Q?SL8acaXVwuziU3Sv6ddEju+Ee8cLLAPsWCEdMd76bY+HPtClWFvPfn19zpXs?=
 =?us-ascii?Q?++0EzuXmGbaPJbM/UJ9WXhxJsdeUaB44F4YXbNqKQvEa/mEE8E5gt2gaEg8V?=
 =?us-ascii?Q?/CapkBm+kZfq880HC2a1Aq4Uk/NK/R8olTo3/2cPrVkROCPZpw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3y92gLCiIrhV1iYILVQ/OZVa8wRH6CzFdTWGKvjXXZgMvCRo3WmGTOc50JN4?=
 =?us-ascii?Q?S2cpUHUkMF1U+raEn3D72omc41/187GOpvraI0RowSIWPGPfnvLsSJAdIRjz?=
 =?us-ascii?Q?4dg2ReHFSQkpkpglqOfTIIUj0t4ozX2Z3w4ggFRIhRTpT3mS6SWloT22R8VG?=
 =?us-ascii?Q?Z/+YfISm4gXWdKqLSBLcG/E+UVZFHoJNieqaZn4+x+XSOd1neI60zje77Fk7?=
 =?us-ascii?Q?s8L0tjQBR2Szl+JnbuwFIKl5CLr9wQ8Ias3vrLq2S5JwSKOf667gwx4+N1yJ?=
 =?us-ascii?Q?gKyvZTV2ciV+S9zZXc74MOQV7q3iOFOOwRVsxflbbBTiC9vkXFYEfdtivmqd?=
 =?us-ascii?Q?7cNZD/XkVLqhMOKqcFW9zHOpwR+aIfPddiS4P4EN+7olFpQ6MbLnn0MV5WZd?=
 =?us-ascii?Q?U7+v318RAEVkVO+hXXBR6SIBHmCtEnk8TpKFWlWniNPVQkFBx4pT/v9maMQO?=
 =?us-ascii?Q?hz+jYbeMcccT2fOHZIkySHL+Kvj/V8dAtNzZkDh7r3ixbu0/nKqm+bkrrc3D?=
 =?us-ascii?Q?I7DLJPW65wsMehxDDyCoEEHCFA5E85678XdM011zXbYY9eSwc4eTZzjvyoaS?=
 =?us-ascii?Q?FZkD+Kvd5q/b65sr7Ws78xyVoUpAfJiZUeC8oMD7bgYZ3za/7nKMDyEW5G/2?=
 =?us-ascii?Q?xQlC1K3MuZeY6pgN0sjjWpw5my5TT61RlG6Q5F1Qvz0OxsWGlxFvJhJZx9YS?=
 =?us-ascii?Q?yXF0s0dFvAxOH4yfEvL14WUVQd5IofINYltlIxDBdK8MZmMX30LwCOl50vjN?=
 =?us-ascii?Q?txUFVObzrfR7RWVlx4YCSNwPOBJHa5BvuNK+6PPZ55FXYhXT5m/Yo97p4/LT?=
 =?us-ascii?Q?dGpc7Gz3jKDeK1QZM9aaKZvsp1uGHjoxyBWnZrujuq6thV6YUR7Kgjnxuvad?=
 =?us-ascii?Q?auHufhVUNyRIdlcNZ03wcwON5nu6x6Ste7hX+epkf85S10flClh+0DrnU/NE?=
 =?us-ascii?Q?4eResVStivP7r/6zkwEYDp2CGCq+m0aP8j9lkQz5kXuSlbbcZCpGLf0hSV/6?=
 =?us-ascii?Q?Z/rn/m16TrJbE+avSraerj+JM02TqoObWDFfPR2VhmjjRnBbapOsCFjSERka?=
 =?us-ascii?Q?gUH9C3ZRyMEium1QzE2bupoiWNNzg+vZHeyJ4Fscbh/yXdjbKxnHTIOfnJuG?=
 =?us-ascii?Q?CNRZrO/OlSI3CO8j/IjGqa4oDTBHf61Rs1ot30eV02lgr8Ouoz9j4eVyK7dy?=
 =?us-ascii?Q?pHZ/cOAfzcfI3/oYLC8kEa3FHlZEitsUz5lpHzEEQBkAqheQao74QbysF+Kr?=
 =?us-ascii?Q?FS/pQWzfNFGFq3p9p8KBV+HnQm5jb5FGgDymRTc6C18GFYdFcugoYahPuYNH?=
 =?us-ascii?Q?t+l2vCzFaOCO5va/PQCOcsX8fKyaWFiFV6VPoCBfjsJQvs9q615o0dQ/HILm?=
 =?us-ascii?Q?PyVEHt0HLF6HxWbD8tUiBBIbwQplmson7+K5JaZTdqFtztKHwgRer0/CB0Id?=
 =?us-ascii?Q?2ZNdI9plCC5CdJsB9Lvxs1PJ+UWUbsm5kxPgaVMd047u6ZsG7FlORK8QF27K?=
 =?us-ascii?Q?+DVIW0+ueF3AWWVtAbL/X8Br/8BTfJiI7HvPE4VRd1iWcItOzEJSOqS/DYx2?=
 =?us-ascii?Q?lZC7Xuq5qYuRujalylp0CLSyh+UdX274Ov2ZPGh0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbe434b-1aaa-4b45-7f44-08dca8c60499
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 14:12:41.5347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HbUesOybUENKgzmDS052qYwEJiKX8nLrXIRG07r9SpUSusnFlTViKUGQoVrIx15XN68OYQ7aua4kZC0KswgmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7216
X-Proofpoint-ORIG-GUID: 2sPkDdC2fIycZfERGTN-b_S9NvsVNbJi
X-Proofpoint-GUID: 2sPkDdC2fIycZfERGTN-b_S9NvsVNbJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-20_11,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2407110000
 definitions=main-2407200102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 14:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202289

Install lastlog2 volatile file to create /var/lib/lastlog directory to
fix runtime error:

$ lastlog2
lastlog2: Couldn't read entries for all users
lastlog2: Cannot open database (/var/lib/lastlog/lastlog2.db): unable to open database file

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-core/util-linux/util-linux_2.40.1.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
index b70d97a934..a1aab94055 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
@@ -118,7 +118,8 @@ FILES:${PN}-mount = "${sysconfdir}/default/mountall"
 FILES:${PN}-runuser = "${sysconfdir}/pam.d/runuser*"
 FILES:${PN}-su = "${sysconfdir}/pam.d/su-l"
 CONFFILES:${PN}-su = "${sysconfdir}/pam.d/su-l"
-FILES:${PN}-lastlog2 += "${base_libdir}/security/pam_lastlog2.so"
+FILES:${PN}-lastlog2 += "${base_libdir}/security/pam_lastlog2.so \
+                         ${nonarch_libdir}/tmpfiles.d/lastlog2.conf"
 FILES:${PN}-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
                           ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
                           ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
@@ -205,6 +206,12 @@ do_install:append:class-target () {
 		# otherwise it uses "other", which has "auth pam_deny.so"
 		# and thus prevents the operation.
 		ln -s su ${D}${sysconfdir}/pam.d/su-l
+
+		if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+			install -d ${D}${nonarch_libdir}/tmpfiles.d
+			install -m 0644 ${S}/misc-utils/lastlog2-tmpfiles.conf.in \
+				${D}${nonarch_libdir}/tmpfiles.d/lastlog2.conf
+		fi
 	fi
 }
 # nologin causes a conflict with shadow-native
-- 
2.25.1


