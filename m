Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7178CC433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 22:22:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.3462.1648765338208421150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 15:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hwwQX3/p;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1089597e26=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22VLpsWG007504
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 22:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=HGtbyCaD4s2V9QXHOlJHaVZQWQczfG+yO4WuZem4fBg=;
 b=hwwQX3/poP2OzyaI4eLBMTTVa5eemN8hIqIhf62P9Qcw7jzpQjanSEREhPmxaWmzhDQx
 78D6j/TG4FX0Enyp0LGMPONkdH/rtZPuH0abtI5eWwn3Ath9GGHGmeYge/9hDJrnD4wB
 +vzyGXza8IxKz8rADdsJKTpKQoKak+n/4PwmE7ACyW1La6lKc+zE4DSHgAc71YsAggVO
 sXjyXyp1883GHVmsCibv9OlnxH7lLn0hJ0eGzUf3MkMufaRJqGHLcEVRJ4pilYPiGh8j
 4gqzBc91jjl98tz0vpGzOb5vblTh20ihXg4wtuNCkjlIEMyhHamxc83tBzusyJQlbiz6 UQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f1r2155f0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 22:22:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xzup2yQxYytGXOBAuCoBY1QhbI51jWJw8ntzqc/m4l3XtbKoqcwVTRMQLicsAcAdkQ+UgTzIEGjQbicuJL5mNNqgGmdMKZWEsxmT0iKb2bSXpdfa6n9ClUghWrkg/wDcCg58SPYqB8kkbitk7ftUaMMTykppjYnG3DhQMBWIHuHTOL98GOXh04t5tqhTD+wY5dsWr9iYSBPgIM8zlCz9nhuJLaFF+En5k1FK/thL1Izc3HN5qJaQqOr00W4i9sYmPuf8CCO1UGIeh/Xq5nSAjW1I4f7QdFP6RG4DgO0V8yB7WLIYaj6rsjx3gglpBX9RPLPje5T9v0IXPWTdhPw3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGtbyCaD4s2V9QXHOlJHaVZQWQczfG+yO4WuZem4fBg=;
 b=aG88J5S1V1XkFIrQhgtHrTvUSq3P0q3cx3NHoIWujXTvhFHa5wUv0nkjQklA18xuqO8QmSx5fUgnkCPB/gA2y/4+YwQW6M+wZpX15RrOEKIf05FxgPdsyeYVL3w6UR6HKZfFXTvVv2cauYRuNlWGXXZJE6MV2Bjw1ORx2AZZrZ8QTRtdlqZ9oaz9y70Ht+NDN9cgkyFMoY266PECpdyoiJR0Ybd10OlCXw/f/NLOuHh7MqDLOose+A1m1KnClr9GXAHqt8iwvIjMBe2CtGNeWR/pB+o9r1ubP54kZwkKdmJTRDcoYYCnaMUafsywQSfGhtN2/DGetyi9UST3aMREaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO6PR11MB5571.namprd11.prod.outlook.com (2603:10b6:5:35f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.20; Thu, 31 Mar
 2022 22:22:15 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2%4]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 22:22:15 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH v2 2/3] kmod: Add an exclude directive to depmod
Date: Thu, 31 Mar 2022 15:21:52 -0700
Message-Id: <20220331222153.76037-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220331222153.76037-1-saul.wold@windriver.com>
References: <20220331222153.76037-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0026.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::39) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 260f24c9-8a9a-4fa3-6c35-08da1364e8f4
X-MS-TrafficTypeDiagnostic: CO6PR11MB5571:EE_
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5571F94C45B5A354F0ACB8EFEEE19@CO6PR11MB5571.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y99y7VVOfDuVGV1TwkC8nrL+uowoyMP0duWL/wlOtSAVLzOUWnQvJvTf2IM7QFzGehkR8u+xZwvZw9jpMu7Qy8js7P2DUrNXKGjG5dSVxfeZNe5Y+dVxTrq0rX9VFdzEkfZrz7fytxmHTHgVOsu0RvgwmH4JmMsGDhn7XPzNtao+IKNMeZrxE7Iknjo47InqQKgZxYSWsofY5Y/9IomRJeZHvCuyV0tX8FXSS0jBMkZ8084DcrFEXSm4OS8VShbCjkQkTbM8glEyAkjEkw2Xp6WC4qM6d3Ni8i6d3HM0Z0B9DD5WsxnYcWcyLkBuKOKJuA49wGrB3vbFij+CChnMRea6QuziWJLds9aLrn95tugKRr8x93n/1vtuHydmN/Ib8nFF3td3ieACClde7s2tj7U5loVmfmyjcmJBkq4LOKbj4VdWA7OZzxgd+X7DZs4cq/3sDNWo4WCYVSuDa6RthSJR7mo4A3zKMmRg555akJLDndJuul1nnbp57saDhP8BJZRkzcl+P7NZ7HTY1y/oOuYqEYgVAiNRxrU3naGr+STo9CObf9fnc74H+kB0FvMaeW8Uvg46yRzQa0dn7N49iPg0m7KJXm+ZH9yQ11LO4ncpeyOV96k9T2MWw0ovMmXm2jcmD4UCG/wQbz5OmqEwUlXW1BMXQUjZno4XsrN03xxg6wjkeReKAPwywWsqS/6HqmI3o//4n69PzP1oipBjHw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(1076003)(2616005)(6506007)(6666004)(107886003)(5660300002)(44832011)(8936002)(38100700002)(38350700002)(186003)(26005)(6486002)(86362001)(6512007)(508600001)(36756003)(316002)(6916009)(66556008)(66946007)(66476007)(2906002)(83380400001)(52116002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UmNKZODcM6EtloXBuFQBFn7i0aPzlsOxy82OnUACl4ZPHEJH0s1E+3FcK0Hg?=
 =?us-ascii?Q?BQZP+j7kwDeuv2H+8KK9DGHrrO9fh3jgRxkQN3JvVkjrA0YqMBdLlkgfqSxk?=
 =?us-ascii?Q?s2zJHmW9p5IwBMe14Fi1zqb4FZ1vv9m/wK0shXkXwBxneaojWn1PH7uEAPuy?=
 =?us-ascii?Q?sC+AsJb6O5tsR8TJG2VBHM5CpQw27/29XuOYR80Nn7BsbieuQE/XEfZTwVE5?=
 =?us-ascii?Q?tP/CM1bgYvTyfUMgGew6J+TmCpCjba+7HYgDAzuDznJllwq/Ii31rDNu2W2s?=
 =?us-ascii?Q?A+DiDoj6vxjO13iXdxKPvaee70D9UsA69hddph1CwnVRo+WabPKcsrUpj2hf?=
 =?us-ascii?Q?uLfCZ1KBdUgWl6G8ZMgkcK5ZykTXSQKwx+gwz++o1IaZR8OkOnjt4bCcOZbz?=
 =?us-ascii?Q?2KVn+YPIZXqxm076YNOfZstrxef/n9Lg0uVMuOzMR/U33dM7M2AHB5bTHh5g?=
 =?us-ascii?Q?u9qsG0Qk3xHzN9RlBP92BAqP/JQaRkfm/L5Bu8L6wMDB6SDkrB/XkvkU4G0z?=
 =?us-ascii?Q?8hBbJp5FOqvodDWC371gE4vlUqNwtFvZ0JD6vkUA8cMNtwR84UKE22MOVynN?=
 =?us-ascii?Q?c9gS1tBqjsXFfwBGb6Xk0rv9/hOprvx5jdJjmpnqX8jfLG1W1yeDiIynXBPA?=
 =?us-ascii?Q?vDtlakzDSbHOK1GIHEXC53ceivEA4P9fyz4loQhw97RC3Mpyy2dZuNjHcWn5?=
 =?us-ascii?Q?vavTAuANQzuOj58kCAfflMQmRCm+Wy+EujleFTAfT/++pKMnqXy7tMtX1+Ba?=
 =?us-ascii?Q?qtHHYBoWfTgZ1AKmiaZJjUztG5/jOyrw6rl8V4bzVv+Qh5ygmy6VRQiHG8oF?=
 =?us-ascii?Q?AgG8sPjT1LCKffYGpRL5Pmw3LUr1DMad2GCKnT4K6+CJj5q+57OlUmCTJqNb?=
 =?us-ascii?Q?WEQw6+Gcm9xGXHb1XfVscQAcRBeqzg6KlTjKxl6jDFpEjfV8vELDOIldHrGp?=
 =?us-ascii?Q?7+7PWuGGpna1XGuZv0hY6kIXgXII21C28HVV6Ocnz6ElhQga0QeZFk2TD8Ed?=
 =?us-ascii?Q?MnAQElnVpQwK6IextzDmRdo65X6YxlNpkuLffy7qsoVsI3mXpVGK30ankK4z?=
 =?us-ascii?Q?Ba4y2CfdZrpQLl+wJP7PRw/9LfxIB/erGa3Bm4ZlMAamXQvChGoWpA/2JiQD?=
 =?us-ascii?Q?Vr1tTeO1ZwGi9IirF3zEWKOWlyCCyXeWfvW0ga+PamwVUqpxvx23tXQTCDEa?=
 =?us-ascii?Q?+0ZnWwp8LTGGyzVUFmg1PYCj7dIXs7Py/jXBVBD3yMpZuhQcBJaRdA0PIa2J?=
 =?us-ascii?Q?kSBllXU2QOjkSMMehpCP8Ink5CM0B7gxQ9YmIOFOXxFKvkZSnbO0Oha3TaZf?=
 =?us-ascii?Q?HVPccj3rWp9Gt9js7gwYN8TAtBB4WWFgzpNvb1A0gnA0px+ft+pTZ8A/+196?=
 =?us-ascii?Q?RGx0vUUK4XeesBzpfRT3bAlI1+ZCMa+o2ohoSlQ8l0yUOxhTHTx6U4V8o+fP?=
 =?us-ascii?Q?R/rHswAbFFC2+VIi/+rnWTTPil1QJQtdhy+c8ZfBtOvmmZxvjgFjs/ahdN9s?=
 =?us-ascii?Q?ElnMri9r0G9LPxarS1ao13h9A78/I7667rEn4ouDqXqZRCSK5kEngElzI9um?=
 =?us-ascii?Q?nfqYy674ic7nRZpGB+9xkv1PC6DecEB+QZoZ2MRCnlHG1bniiRQo9A+phf4M?=
 =?us-ascii?Q?V3VApf4ubuSye0JpkE3gfucf4KMtnIOd7fClP4LQbPIPIRhZwK+WcGoZnESJ?=
 =?us-ascii?Q?ALvB4XmcGnFahOpFloJmS/XZARICE3UgEScoBZdFA63b7gVs2HBfm+QjukYT?=
 =?us-ascii?Q?wRn+nwTG94V3mgnfGiCBOSUHBrpyYAw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 260f24c9-8a9a-4fa3-6c35-08da1364e8f4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 22:22:15.3888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YKlS3h5W+sNRhZQPy1Pydg40k/Oi7KKTylm09f5i+K7V3vhJI0e8Pu8EMWlAZ6Atup882v3al2E698QmShcyPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5571
X-Proofpoint-ORIG-GUID: UlIaot-ltMcz11hzvn8nKhsApJlJFGM2
X-Proofpoint-GUID: UlIaot-ltMcz11hzvn8nKhsApJlJFGM2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-31_06,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203310115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 22:22:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163872

This adds a new configuration directive to depmod that causes
depmod to exclude a give path entry like .debug.

kernel-dbg provides the modules .debug/<module>.ko files and
when installed either directly or when dbg-pkgs are selected
this can cause depmod to fail.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
v2: Updated patch based on upstream comments

 ...dd-support-for-excluding-a-directory.patch | 169 ++++++++++++++++++
 meta/recipes-kernel/kmod/kmod_29.bb           |   4 +
 2 files changed, 173 insertions(+)
 create mode 100644 meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch

diff --git a/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch b/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch
new file mode 100644
index 00000000000..18d97935331
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch
@@ -0,0 +1,169 @@
+From 01f3fe68a7a42b06eb318f3b09fa5e5ea75d46c4 Mon Sep 17 00:00:00 2001
+From: Saul Wold <saul.wold@windriver.com>
+Date: Tue, 22 Mar 2022 12:11:45 -0700
+Subject: [PATCH] depmod: Add support for excluding a directory
+
+This adds support to depmod to enable a new exclude directive in
+the depmod.d/*.conf configuration file. Currently depmod
+already excludes directories named source or build. This change
+will allow additional directories like .debug to be excluded also
+via a new exclude directive.
+
+depmod.d/exclude.conf example:
+exclude	.debug
+
+Upstream-Status: Submitted
+
+Signed-off-by: Saul Wold <saul.wold@windriver.com>
+---
+ man/depmod.d.xml | 14 +++++++++++
+ tools/depmod.c   | 65 +++++++++++++++++++++++++++++++++++++++++++++---
+ 2 files changed, 75 insertions(+), 4 deletions(-)
+
+diff --git a/man/depmod.d.xml b/man/depmod.d.xml
+index b315e93..76548e9 100644
+--- a/man/depmod.d.xml
++++ b/man/depmod.d.xml
+@@ -131,6 +131,20 @@
+           </para>
+         </listitem>
+       </varlistentry>
++      <varlistentry>
++        <term>exclude <replaceable>excludedir</replaceable>
++        </term>
++        <listitem>
++          <para>
++            This specifies the trailing directories that will be excluded
++            during the search for kernel modules.
++          </para>
++          <para>
++	    The <replaceable>excludedir</replaceable> is the trailing directory
++	    to exclude
++          </para>
++        </listitem>
++      </varlistentry>
+     </variablelist>
+   </refsect1>
+ 
+diff --git a/tools/depmod.c b/tools/depmod.c
+index eb810b8..ac365e9 100644
+--- a/tools/depmod.c
++++ b/tools/depmod.c
+@@ -458,6 +458,11 @@ struct cfg_external {
+ 	char path[];
+ };
+ 
++struct cfg_exclude {
++	struct cfg_exclude *next;
++	char exclude_dir[];
++};
++
+ struct cfg {
+ 	const char *kversion;
+ 	char dirname[PATH_MAX];
+@@ -469,6 +474,7 @@ struct cfg {
+ 	struct cfg_override *overrides;
+ 	struct cfg_search *searches;
+ 	struct cfg_external *externals;
++	struct cfg_exclude *excludes;
+ };
+ 
+ static enum search_type cfg_define_search_type(const char *path)
+@@ -580,6 +586,30 @@ static void cfg_external_free(struct cfg_external *ext)
+ 	free(ext);
+ }
+ 
++static int cfg_exclude_add(struct cfg *cfg, const char *path)
++{
++	struct cfg_exclude *exc;
++	size_t len = strlen(path);
++
++	exc = malloc(sizeof(struct cfg_exclude) + len + 1);
++	if (exc == NULL) {
++		ERR("exclude add: out of memory\n");
++		return -ENOMEM;
++	}
++	memcpy(exc->exclude_dir, path, len + 1);
++
++	DBG("exclude add: %s\n", path);
++
++	exc->next = cfg->excludes;
++	cfg->excludes = exc;
++	return 0;
++}
++
++static void cfg_exclude_free(struct cfg_exclude *exc)
++{
++	free(exc);
++}
++
+ static int cfg_kernel_matches(const struct cfg *cfg, const char *pattern)
+ {
+ 	regex_t re;
+@@ -657,6 +687,11 @@ static int cfg_file_parse(struct cfg *cfg, const char *filename)
+ 			}
+ 
+ 			cfg_external_add(cfg, dir);
++		} else if (streq(cmd, "exclude")) {
++			const char *sp;
++			while ((sp = strtok_r(NULL, "\t ", &saveptr)) != NULL) {
++				cfg_exclude_add(cfg, sp);
++			}
+ 		} else if (streq(cmd, "include")
+ 				|| streq(cmd, "make_map_files")) {
+ 			INF("%s:%u: command %s not implemented yet\n",
+@@ -857,6 +892,12 @@ static void cfg_free(struct cfg *cfg)
+ 		cfg->externals = cfg->externals->next;
+ 		cfg_external_free(tmp);
+ 	}
++
++	while (cfg->excludes) {
++		struct cfg_exclude *tmp = cfg->excludes;
++		cfg->excludes = cfg->excludes->next;
++		cfg_exclude_free(tmp);
++	}
+ }
+ 
+ 
+@@ -1229,6 +1270,24 @@ add:
+ 	return 0;
+ }
+ 
++static int should_exclude_dir(struct cfg *cfg, char *name)
++{
++	struct cfg_exclude *exc;
++
++	if (name[0] == '.' && (name[1] == '\0' ||
++			(name[1] == '.' && name[2] == '\0')))
++		return 1;
++	if (streq(name, "build") || streq(name, "source"))
++		return 1;
++
++	for (exc = cfg->excludes; exc != NULL; exc = exc->next) {
++		if (streq(name, exc->exclude_dir)) {
++			return 1;
++		}
++	}
++	return 0;
++}
++
+ static int depmod_modules_search_dir(struct depmod *depmod, DIR *d, size_t baselen, struct scratchbuf *s_path)
+ {
+ 	struct dirent *de;
+@@ -1240,11 +1299,9 @@ static int depmod_modules_search_dir(struct depmod *depmod, DIR *d, size_t basel
+ 		size_t namelen;
+ 		uint8_t is_dir;
+ 
+-		if (name[0] == '.' && (name[1] == '\0' ||
+-				       (name[1] == '.' && name[2] == '\0')))
+-			continue;
+-		if (streq(name, "build") || streq(name, "source"))
++		if (should_exclude_dir(depmod->cfg, name))
+ 			continue;
++
+ 		namelen = strlen(name);
+ 		if (scratchbuf_alloc(s_path, baselen + namelen + 2) < 0) {
+ 			err = -ENOMEM;
+-- 
+2.31.1
+
diff --git a/meta/recipes-kernel/kmod/kmod_29.bb b/meta/recipes-kernel/kmod/kmod_29.bb
index 91951edde16..9b663490666 100644
--- a/meta/recipes-kernel/kmod/kmod_29.bb
+++ b/meta/recipes-kernel/kmod/kmod_29.bb
@@ -20,6 +20,7 @@ SRCREV = "b6ecfc916a17eab8f93be5b09f4e4f845aabd3d1"
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master \
            file://depmod-search.conf \
            file://avoid_parallel_tests.patch \
+           file://0001-depmod-Add-support-for-excluding-a-directory.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -64,6 +65,9 @@ do_install:append () {
 
         # install depmod.d file for search/ dir
         install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${nonarch_base_libdir}/depmod.d/search.conf"
+
+        # Add .debug to the exclude path for depmod
+        echo "exclude .debug" > ${D}${nonarch_base_libdir}/depmod.d/exclude.conf
 }
 
 ALTERNATIVE_PRIORITY = "70"
-- 
2.31.1


