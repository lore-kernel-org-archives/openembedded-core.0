Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120B5C77B73
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 09:00:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2976.1685955622132247718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 02:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pM6Oq9Ai;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5520e6da6e=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3558Cail004764
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Jun 2023 02:00:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=oFuwNSaZJMBEp+Z8kMsobTHITJxY3A9W/FXwrCKrkqs=;
 b=pM6Oq9Aikz0VCH0t9Oy+lLymNY6yLYJPLUbrZ8iP4umAmKeLdULJk7EUB8oocIHMMivJ
 NSOlZpaubTZwesCfiO+SLAHgt5/OkS8YUFnmU9V81pEB4S34/htg12pp/dg/T9UBUTJ3
 iBvuYoyuti7/5Zq1lDIcuyDmwqbLfxciinSWJe2AGGI3YAxpkQCCagyvG/NWsqLkb0Gn
 8u7LCfVZYYjMs0pxnFku9cmehpwyc9Ak7qTPRfsGfIf9OlTubxopPzmvAixU2//SLd4d
 p68NPYTJNQlnvEebRwSkPw1AuWKSdRHvpUjaNeJtKiCJMWnqDQb5lmCGqD1a6fo6n/gH iw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r00t39774-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 02:00:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tp2S4jMT7vME1g2L7m9hrrTI/gOvnXrMYSr/hIqpqfD3hcviEOjZTQIdnPVZIaMuZ12HLTz7zAM9CiQWELjkNi5ExQWWsNp9QQWciyICQ9ky3q5x4fba5mdF8XqadRY2vFh1rmxnySPF0GZUVm2m7CzaLM4uPf9oI60XdzKA60za8EvEWRv5fKNcnRjsESElxRR4QOZdd+QRhgDQUkVnW3TEq8ebn72+aCrxofOmM6HHktTRPq03XZgAwGJhgadDfAXIJV+hVV5sQLFN+8DZyH2GCQtAjYlLw/zlOr3aLjH5UKVZBYEcWtZsL0F75GG5JqZ2PUiewOarSMmVelbKzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFuwNSaZJMBEp+Z8kMsobTHITJxY3A9W/FXwrCKrkqs=;
 b=ipdSawZyMgp7oO24l/lyDEkLs718GljwPAUj76z8Woc4Vdi1KrqI1MsLFgK7P07vF9plP0k/F4yCOZW0RlJ9pxw8t8lT8ClVY21DbbDyGP0QzxfnOHE5vKZ359zx76eOCwb49XgdBkpXkddE/SD7wCCB4uHcGN3ElrTuX9DlY+FQVwJMqd/D09MhBNQH+UegKwQj1YiUGVtAdJG4Fc7H7jGavDeez7+HoYSaD75+g1K6XjR2lHj7Bc0ALsbFqF7nPcup8Zikrrq/PjDDs/fnfTicIm6sEo2q/SGgdlWGrJgSCmHGoejTjYuU24U1Ytqo6DBvlzFJDXiEqR9L3izptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB7615.namprd11.prod.outlook.com (2603:10b6:510:26e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 09:00:15 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 09:00:15 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] qemurunner.py: fix error message about qmp
Date: Mon,  5 Jun 2023 02:00:02 -0700
Message-Id: <20230605090002.1825875-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0162.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b21962-42f7-475f-8d69-08db65a3476f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5pqQu1B6xV5E1+Ad/jrlGlk30cMQWOo0oZS60Uy286QfPvTfHZyRse6ce96qJhK6Xa54ROGkh7M68vFbxm01AclUf09wYzAVyD+UhxwzneqwrJ21xBs3D4Uq06MDlqCG0VFkAKSBvGfjBv83dWqqbx1SbO/lnBH4hId13HQ+HqBzoUStAaDrQtKm2fN/JFmH6cHkva/xzhoTS3314VJSknF6xqfT8etprk8hpyRv7o6QzIs8H2mhLxQtHD25jSlUAkW3CATnAepr5XuOF3iV5x1XPHiNlVhBp4AV3o8ERLkBvGSQmlW/Lr+Jltl5iyh5HES7XUri+Dn7c+RTGm/wpK5EX3FT+ug8pWXSOx/42GG85XO8UnPJmTso1tLziMyJrI8SNE8rPIS9vkUWXlE9tiPSByN69oxhi16wgQhxK1f0BieXLrtjZwAPp3JbmCnF/ibeT5sylSRRdvvZqaUOlWWhkJRq3XWajnaCghrVqXoQsPZjXBSxNMNbhsRpQyiqin3mdCDkXOED0sg4NtfOP6NOzdQEHHAswTXtjcS6OqcbFfVGg28k5rZUgrp3V/72+LvR+BLZFCDNG+xb406FC3uCg8qxDVF9pFU1Pf5/5z+6mPXffMtMI7BJJEVPH9au
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(451199021)(478600001)(5660300002)(8936002)(8676002)(36756003)(15650500001)(2906002)(86362001)(6916009)(66476007)(66556008)(66946007)(316002)(38100700002)(38350700002)(41300700001)(2616005)(9686003)(6512007)(6506007)(1076003)(26005)(186003)(83380400001)(6486002)(52116002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wXs0ES2IXbgffdrSavbsVIWKwBsP3nsrlx68wNqsDOn5FIRwCzDffngCOD3z?=
 =?us-ascii?Q?zhGYZpLAMkCiKEn2OPlyPcPPjafUWke1HEIXysKfBodXCJF+NcijVgu3izkH?=
 =?us-ascii?Q?pmFFZOTllU0NTV2RJTljufDk+1tvgXL8kL7+pmLJ7XKukuJyuGUxQtUnwDgl?=
 =?us-ascii?Q?4Eba7Chfom1loHYz+NY4EiVHtBBsphdXTAPuHjALSU0cPg/IVIF+8REKOCDk?=
 =?us-ascii?Q?ocfD5l2rTzOaRF7M4me9mxdJQHIZMdbhusjboWtvj09q4ui++Pr/l0xic3BA?=
 =?us-ascii?Q?X449jIei8TiGQMjQEXbHePIfqA79J5tNSS+ClmypRV+dhuCbbkUyTozAyFW6?=
 =?us-ascii?Q?Q8I9YMgcMKkXFQ+qgwZrlrYcK86dYF3TpMUWC1U//ZN9ptIhfhi3IDz0pBpm?=
 =?us-ascii?Q?q7A4LUqCk3IhS1QR3huUzoq2FJtKA0uCNrb9gzmn2p9swsC1LGkjeUYQhitU?=
 =?us-ascii?Q?LeOU7B3+3vEKD4UIur27PJPv8QBgl4Cv3BZ63QbKKTEgseVZqvGJfxYKbwVJ?=
 =?us-ascii?Q?ryIPhFbxtlUBOijH9OtUHsjCFs8WqHZLzCtbiLDjZEZ/DcKSRqlY2DYfps3U?=
 =?us-ascii?Q?bGg5Z8Fjm/0icQAOH/lcx36VS458or5EOJxcp0hKgMvt0FvKPofBeAUtEGkR?=
 =?us-ascii?Q?cSbiTCGXofbuvzT07B9/y9EtD+muc2D1g7falis9/3OP+nIePn87r5eGj0eL?=
 =?us-ascii?Q?cO6KgZ++uPlUSN3YosMXuunW+58yrMEtQol+ZDzPH2clJni+8MO4T3eIcYf6?=
 =?us-ascii?Q?vdp34/ssgIHu+7G0wSbSHTMV8R7zz0x4qmV+prGxmiusQagba5p20NPpn2A6?=
 =?us-ascii?Q?fMJKozyZ53sqRGA8H5u++OtALN32f14oFGW5D0KFqGxZzuStSUtyyiseN3Po?=
 =?us-ascii?Q?zWIQv/dImBk9x5WuDibH8d+lghRpPEuXYZ98TPEtKIzKtWciMZELSPKNKaMe?=
 =?us-ascii?Q?V3mO2AxsoxEugDlxVaSe5wUjGdKr0B5HT7kH3RDJ/kDSCN1o288Ia7NnqgWp?=
 =?us-ascii?Q?1275TPoR68PCF4deZD33xAq+ZizlQ+c/i2wmNxZgyAynYnNbjLmYsk+7tYZe?=
 =?us-ascii?Q?m07t5IWpQOktk9tWcR7gSTUzmo3E2sqnY2Sx/H7Fc/drA/LW6G61MuBMp6VE?=
 =?us-ascii?Q?CngayRVxUetExayS2pY7Zxi4Owu0sDmrfvv1G8nuyk2mMjxKkW4T3I1ap6ew?=
 =?us-ascii?Q?vnjFdbZf5YCOFdZr5C1HT9x2ocOatjSugh3YfPC+31oBplJTASt3WB8duClM?=
 =?us-ascii?Q?0MNlJKuUx6ar6CuhTrPtsycJcIScb7cBTslTbdF+43FH1VMpfisJQkoP+ooL?=
 =?us-ascii?Q?h8M4h3BueeXicB19gILU7dS+I3TdQhrcJlu9m0L8m3rIAmaOHrB8cRLMe2ro?=
 =?us-ascii?Q?h+pKGR+jaHGIJHso7u6hdZt/WaEl3b1LmsxQK0LL3LhCXpVZifgJEkX6ewJR?=
 =?us-ascii?Q?BANU392x/KEhCv4/qa0T668u/VtuJBB13Cty+3f7jPJC0+zuEqmXCPfFbndy?=
 =?us-ascii?Q?h0Dd1nfHIuYGjRgECkILKdQIQhBCEfq69hcm/EyAj+z1JkafwMuZCMP1a24B?=
 =?us-ascii?Q?izkz//dBzH83CM4c21veB0tFxc/OCaH9jle1NSnx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b21962-42f7-475f-8d69-08db65a3476f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 09:00:15.7037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1Qtgm7zR/Aa5N8pbf/x+Zzu49euzGLoq/GfuZE5VVKRmDmksKz7YCtdk+nQ6DmfGOpROOLfcyCvXTIfDJLjBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7615
X-Proofpoint-GUID: GH5OvTSFycxndJ0Ne7kFh7u0_FUgqOVu
X-Proofpoint-ORIG-GUID: GH5OvTSFycxndJ0Ne7kFh7u0_FUgqOVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=976 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306050080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 09:00:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182375

From: Chen Qi <Qi.Chen@windriver.com>

The error message is a little misleading as the qmp module is a
directory with __init__.py file, not qmp.py file. Also, put the
path where we try to import it from in the error message to make
the message more indicative.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 7f520d47c3..0ef8cf0a79 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -188,7 +188,7 @@ class QemuRunner:
     def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, env = None):
         # use logfile to determine the recipe-sysroot-native path and
         # then add in the site-packages path components and add that
-        # to the python sys.path so qmp.py can be found.
+        # to the python sys.path so the qmp module can be found.
         python_path = os.path.dirname(os.path.dirname(self.logfile))
         python_path += "/recipe-sysroot-native/usr/lib/qemu-python"
         sys.path.append(python_path)
@@ -196,7 +196,7 @@ class QemuRunner:
         try:
             qmp = importlib.import_module("qmp")
         except Exception as e:
-            self.logger.error("qemurunner: qmp.py missing, please ensure it's installed (%s)" % str(e))
+            self.logger.error("qemurunner: qmp module missing, please ensure it's installed in %s (%s)" % (python_path, str(e)))
             return False
         # Path relative to tmpdir used as cwd for qemu below to avoid unix socket path length issues
         qmp_file = "." + next(tempfile._get_candidate_names())
-- 
2.40.0


