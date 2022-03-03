Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A3CC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 00:43:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5613.1646268198045345010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 16:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CuHsHczo;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=006138127c=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2230EotY029201
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Mar 2022 00:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=OaMiRNusKfvkIsw+a5/E1MJba8NtWC7E5wCxoc3j5mA=;
 b=CuHsHczoMMyRDSZrrYvWv48e2BcSFwcyaJLY5EkvRaDZLZefMSjuaDlEKttVgTYImujh
 LNXKxSLVbLd08EAZKHH4vrAEBe5hxND8bwxz+KLeZPd9WV78boCK66Qh9pE7p5btaceA
 PkQRfhKcsBFEJDOWYvn3iFIuQPrEdPBko/9v5xvr0N6A5NYAQXLzUu3wsB3lDSqDpkz4
 U2eVwLHeDJGmKGyPInFUuVRfD3AfekAbt4sDPORiWfMVTv8NhzIOED4izjkTp0G4bedw
 fnvm+n+j9sQFcm67CJFtcKJp/ALpYjSxjthhYOfkzffC+G/pVwocFWOE+XZs1od/Te+L lA==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eh0yjab6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 00:43:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COGv+b6qDkbMui4iqcGl3yp+iJmdubKd9yorBvvEoVB0x+gAPKH9QgMljNkB7737LkSrWfRXKrhHlXlrfH1P727PapWEAJlclP4XCfZcOaQvcLSGB7VE/FQNdlNxLQd+XNW4wesUYaSpNvQxFtsEoCxtqstmhSYbB6Ug20tS/FFazccEFO59x35hAh2C7BNkAzw7x4dBCv2DRQan6iY3oPYXRwWgHltgB/52qbomHjfVqC1cI7HouuIAlDhBUzJyYRrDJQM2yP2KJHFOKOHIzW0b3Lmt5tZ5YgoaLdsJ7cIR7WOwHc4cIJ+mgIDkO2vxexfuVKwG3hABYd8WfLvfsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaMiRNusKfvkIsw+a5/E1MJba8NtWC7E5wCxoc3j5mA=;
 b=SbJiariv426IYl+WrFrUqgBUIjVQBaet7jRpEf+INZTAFmNegtaRzf1xn5OyNg0riNlUGGLHf40sljZmRSsQ0ntW+5uUCDDVcp0NQ8I15zLX5FgwNXEXYkH/iBSvKZiDiqd8OqNm7M1C2auP2XQIs4QqZbUzNXOnWKe8zT+zwVD3oKWVvxdskO8OFYdedPl3i25/SEdvty7xlwPI+Tse1MKQ2zTqye2gkP0ikY61wItIuMCMHGe/6UnrLRwSr2rV5TXT//3KZhM72EI7MCdlrljukGojxBkkat0E3DIds5n80PErb8S/70ClCfmujNkaBAs3B69+zbCOOpYPFakJ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CY4PR11MB1510.namprd11.prod.outlook.com (2603:10b6:910:c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 00:43:13 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%8]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 00:43:13 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] convert-variable-renames: Fix output string
Date: Wed,  2 Mar 2022 16:42:32 -0800
Message-Id: <20220303004232.519421-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0048.namprd02.prod.outlook.com
 (2603:10b6:a03:54::25) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 586a0996-e69d-4989-41fa-08d9fcaecc79
X-MS-TrafficTypeDiagnostic: CY4PR11MB1510:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB15106223989EB83710EE8ECFEE049@CY4PR11MB1510.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9tYGpouth1QvxOEmM34nvDO5O2yyq7W7tEGAeZyzynHsFfcEMOPv4veRhTfuoNhH+F2jiQJ1letVyo6NXcwoyNpFQLX66OrzCeUfnV94RdC1DJzZyGTjfAyeCrDwd8E5uMV1ZRqWH8FkE8i6zKrOFmZfcA/WmokUOJKiMvHCw44VG41n16A7jamdF0mh6fPaXWTnhPOpR/qQjzjFZVamk2l1PMC/cjHqCtDbQ5RP7tiPWcitxaxUGigxPPEtnofSHQptc5jLd6FYfczCB+cPjy7Aa0aEgLF3DQQ2YaSoOAtb1EHhuqUUVyXnbe31DP5aODI8C1h6HI7qeebtpp5HDRFv1KWyGj7UwbzgSCEdGGcRfxOibdEf4r8hv3WL1a4fRZ2Fd/nw9Ab0sBz9L8cxo4SBwLQZlF19Ob7BLV/fPsGidsSEBsjtJBwiXubs0XhJGCdNhcdtotQkybmawRXoL5pd6roGAHyBQP8BdL/QEmlwW9nKa4IPPRsjGvlzjmc7lic/cRuOV+c0umVCi+WXpE4mAx0uItpmlMfpAB2rkxcg/X3DO66qrauslftg9nle6kk7M/jyH8nzHaMZUh/CIPRS+AIqz1pfuf45kqppoarcBFosoC/DVrc9ZDYBKejBoSFgGCB7PvKruviB/T6nKQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(4744005)(66946007)(8936002)(6512007)(8676002)(66476007)(66556008)(2616005)(2906002)(86362001)(5660300002)(186003)(44832011)(6666004)(36756003)(83380400001)(6486002)(508600001)(316002)(6916009)(6506007)(52116002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NWKijJWZ+Kq1+FoD375K7CuFlwjSPzX/d1+EWkV7kNHEqywNW/ireXcoB4C8?=
 =?us-ascii?Q?dNyi3CLIhDk9bws5MsuwSdbMi7r0Zd5wyztJpcMwG64FhkItsJBRyUa8N2ao?=
 =?us-ascii?Q?00odCbuPIhtbBTOrEh7NxWr/D9a0+0izYDv3qSZKGh0YCWk+tH3f3caiJ0vz?=
 =?us-ascii?Q?MYElGz4Fe9BCn555eb6kx1uUSnO34v5yujkSSzpMqfZ5lYiABOrSf3L6ryYP?=
 =?us-ascii?Q?sMEu7PUZWoFZrYfXEJ48WitBInB8NLjga8rkOb3G3/gyR8THUVmFrkXVj7Us?=
 =?us-ascii?Q?mLYnT8qD3dH1AczOGOKTfE+OWYoWovlmLWJpTCz3udVYLDbEfM+THpA2u7Cy?=
 =?us-ascii?Q?jK5Ropb3oeYTlcAaAbzORjSgOR1GD/VJVT6qOsW1yZT9skVPHWp+KT2gGUfN?=
 =?us-ascii?Q?au7cM5JlFqgfxO0zGM7BLpTImI93QG2iy1SYu3XsYzpSe0XQlKnlTCKszO3i?=
 =?us-ascii?Q?y0dwVshA8hCLbSmIGRUvrK/jJvYdDpUNQ/YR050/2M8V8yKnEVyLniwjePvk?=
 =?us-ascii?Q?f0V0jsWHl7AKkekB/aD/uqwBt3Wuli3yULvsX07ovXmtX+amqz0teE6f6rC2?=
 =?us-ascii?Q?mZlWHij4yPDGGEr+ju5TyF+9byrKeQpCtve/0KFHbajhoiIyOwknKft8YIPf?=
 =?us-ascii?Q?70+tnlQZlrzf46aTDrNcbZv+JAXbISSTtAZ/4uY1rr/aj+r6thSvlqQg2GR/?=
 =?us-ascii?Q?/YUkmv5j5Lz2Fs3819R8zxEaqyj1BphDLrdGJhsMeMS2encIWWr1zj7eURNw?=
 =?us-ascii?Q?Ah9XkoU5VEMV9n6rZX7/CsPxKgMSm14Ddzbxoh+ar3wK3tVewoH6/YJkCOsr?=
 =?us-ascii?Q?1A2pwwuSd30qZhphGxmYXuORaTHXeOGTQzydJ/8mzFiAZu+s23poN7gLMAEI?=
 =?us-ascii?Q?M6Ad7ELYkhbIZVgvWtkrCnOgVJnEUEMC4Imdn3cLiAXFJiW/c/14zFlP4U7w?=
 =?us-ascii?Q?ofuO21wRlirpFtKvEGKxqWC9U/svJEH87sbumkiI7ZgN1Bzs7Lk8ELm5ahyT?=
 =?us-ascii?Q?6lfFSbB6dldxhFHwD6R5u7eYCCn7H6QO20J0BLR+LKZv8M6zft3O7aWRyXjK?=
 =?us-ascii?Q?JnuK5fwCyK8LMCbz0G86VydON/1e1MuhhUQZTJBR2LxcCcBGj4uJLTlrCau3?=
 =?us-ascii?Q?+emriwZLlnBGu4pqNVb1Jji5mUg6uIgKavWpNXOwZlgmJEqbKdh0QcrmdLZj?=
 =?us-ascii?Q?PQ3XIyhJ0u4M6YiuqthHCDW4s5Lx2VReunvtgEMMeLFkTxk44RgJyNl+VR8j?=
 =?us-ascii?Q?PcpgBFR7QF4N1m+1pVTu8os2c48hUt2r21V9GtIC4GUiU+4yPTkbwFxZEZNU?=
 =?us-ascii?Q?6YvGF7u8XogKGLZC0sbm4YyhvWWhIxu2jv2Nulfi3At/0DjNgeWVZMknd2SY?=
 =?us-ascii?Q?zfQ7R55D3XtdX3IXnqsotTp1BuzNp4659ySd5gXGBh9Q+6uKag96DCpUfIbD?=
 =?us-ascii?Q?8AtfqthqbqYZDNmr5kXZMTKfoliyw4shxrezXL1GB51xHHWPqwUOlWQ75mEx?=
 =?us-ascii?Q?JmhtGRIN/6hNbO8kFe9iyHtHMh+Ax2cqbsGPNEA23cen4Gkfar5FVA/QARFs?=
 =?us-ascii?Q?tyCBHP0qLmPc9QFOWc+bYBLxTG63a/S4/D/V1GTm3Y5pRFb5bDPa/irC8pai?=
 =?us-ascii?Q?F/NEpzRulGIF8/Yn4C/DLIYNYBUWbkBzGySceHWOAO3Ye3qgQ2XlwtKn3HsU?=
 =?us-ascii?Q?89GHR94w/N4k99QaRyxxQSoyUM8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 586a0996-e69d-4989-41fa-08d9fcaecc79
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 00:43:13.6674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hCZb/TJh6UWqtLsblqABOkM+993RnpYdiSmhFpJ621N6BkfgnDUr6v4ZPZDk02VI5bQKPstnpcwbHbj+WEPQ7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1510
X-Proofpoint-GUID: 7c3NL_iSu0Cqj4u6_selEQD6gdI2d81y
X-Proofpoint-ORIG-GUID: 7c3NL_iSu0Cqj4u6_selEQD6gdI2d81y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=677 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203030001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 00:43:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162632

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 scripts/contrib/convert-variable-renames.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/convert-variable-renames.py b/scripts/contrib/convert-variable-renames.py
index ed012610db..856c001e11 100755
--- a/scripts/contrib/convert-variable-renames.py
+++ b/scripts/contrib/convert-variable-renames.py
@@ -79,7 +79,7 @@ def processfile(fn):
                     # Find removed names
                     for removed_name in removed_list:
                         if removed_name in line:
-                            print("%s needs further work at line %s because has been deprecated" % (fn, lineno, remove_name))
+                            print("%s needs further work at line %s because %s has been deprecated" % (fn, lineno, removed_name))
                     for check_word in context_check_list:
                         if re.search(check_word, line, re.IGNORECASE):
                             print("%s needs further work at line %s since it contains %s"% (fn, lineno, check_word))
-- 
2.25.1


