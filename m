Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7F6C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 21:24:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.3739.1640899445295786590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:24:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lqIXFjB6;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=899815eeb8=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BULLQuq024385
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:24:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=t5KiHGfkhMgIp8SxwyO5//uU1/9FItFdBZya/RgRGWE=;
 b=lqIXFjB6vofxCEhvPTd+uyORvn7OvYhRa5WWCLpprdJpLwMaAMZoBZvQBEtBwTJlgAVS
 ESIFO6ahL1POrwZXi4Cg+RcmS5LJF9Y2eDSGOOiWeMVXrZNml2tn4mStrvBFm5qf2gsP
 +4WmZLZP4St5H6+3u2S+SGac/EaxFFwUkgpkT7SwxjRU5PGkkOWrGb85NN8fAvzVfAFQ
 0GVwQeFAT7U+Tnm95kSUvWwnrZtnFZHb6BR9J31FXuGRm/LYaLYvGoslo/zpqKKBRmLD
 iPmVtKOxPc7+CPPtUQhtKIRpyAtPN0UqM0yp5METj+ZBAy3+nl1ZAgTnN6+QlsWFKAl2 AA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d94k6re53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:24:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hul/eU2UjfNJzLSilmVawEXxAgVH2gd3nNHuMnW3ZACwdoGNdj65qME9UqO5YBKfoG2VvcGOx9dKrhEV23PxHzIjThBPCAkJp/wHSIUu66kVHsfx0ZPlfP1XvuHqEgyH1Wg6sodDiKrtN81/Xwg8eCetKAxnvm8AOwxozOf3GaC5HH9jCag0tHP9oVgTDdZEev2Ozsyrcfz3QoNfh5rzyOW7CDiJNdpFaKBjmHnb2sFjDOBy1pNgSb1s1GLNzLKntal6FEHE5XPw5pTqFwrfT3o8bciDfRI+u7RKWq41HNo+xirrotFEDThzv53ZTH5FXWYTUhnFszwNbOwmx2xRnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5KiHGfkhMgIp8SxwyO5//uU1/9FItFdBZya/RgRGWE=;
 b=lumHDBUKHPuoMjJu05ge6DjDr2Gdfqko5yaO801VqJMSF5mmwuzINdALpJLPz9hV6t4XAqUtTk/xmQBRJx0MBJV0N2nlEPA7dR3PuUDjANXwkcNiGFp432dYs6ggu0r/BiEYq+T3ED78tMBgAVmBk3dG3/yP2TDrukV39SBkZZjuU7G3696+c+J8rZuh31m4G+xjbygG3kkk0LWIkBV2VBuTonYUPXJvFnzacH1em/GdFqDf40O/o3xK0ipyAwbeYNqPenNw+8b8mcM0+KrTsIOaNsQLyqrkDxWkqq4wr3g/QaKRJKL31FjCP969rI0Pe3QLkVgPqW15ZB6Wp6Ex3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1792.namprd11.prod.outlook.com (2603:10b6:300:10b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.22; Thu, 30 Dec
 2021 21:24:02 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4844.014; Thu, 30 Dec 2021
 21:24:02 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH] perl: Enable threading
Date: Thu, 30 Dec 2021 13:23:44 -0800
Message-Id: <20211230212344.94913-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0007.prod.exchangelabs.com (2603:10b6:a02:80::20)
 To CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0150561b-807b-4ffa-783f-08d9cbdab2fb
X-MS-TrafficTypeDiagnostic: MWHPR11MB1792:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB17921D6E19AEC71ED882619AEE459@MWHPR11MB1792.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kYrXDzN+htVRCl0PJ5KuDXSuF/FxrwvgilrIBzGwO5uw6BQd0vUlXvIB9QX6+2h6aZYNMph1jvcrbiRLT6Ccn5JIZslnBes4AdCeoFtgtpafJfquVaxQ9Yd8SPxNJCO0W/9/DO5Rd0zb2GriLNhLfnQOdINBUeKq5dm1nFofivRGHPTazNkUL7gR541RUWIKG6xe3J7RBp34PhiubB+AS7O0/0Z4+xlDUeNmbFqoYZ8KGE0ltFW0vNKOSOfV6ZvIPTk09dxZxKjfQGo7Z0p1f9aqQ5l90zIX9ekzTQXvRFJxl3bvI94T17n5mDCOmOkPsEoLCcuLsRNgpc8dJVw4TTUMkbIfQbzsuimfXXzcCqwG5yTpW27H4k1qy+9jzcx8B5IjoBqTkm5DjEiAzjFhk9vCUBV90t9YgF2M65yU4RUeeDfBsyXXDocor+hsYxwLAETHDGDOiM+Q+2zxMSm3T9J4utqZO/C0UTwDhBQh0F5A2+iO08zrmQABvTAa7/ehBOlGu0AcghLcMIOVqTWeH+7aJOLx+puD+7IY8hbum5SCUV7arP+TCM2Cc75pcennQYHzg401D6qbZMW9pBJojezFFOoEzRDwiuWaaNw79YT5Ag7ot/eZOCQwl3+r7bvyD7MzpslOSdwOzZwyBpXzE+Kzj7n1PzIwutjuryvB9hgXk+Nx0qeTiWSf6tw95H6QiaGBLkj5NiIma3/NeEfeGw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(107886003)(4326008)(36756003)(508600001)(2906002)(6916009)(52116002)(8676002)(5660300002)(38100700002)(6666004)(66556008)(316002)(6512007)(66476007)(38350700002)(8936002)(6486002)(4744005)(83380400001)(66946007)(44832011)(6506007)(2616005)(86362001)(186003)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PhLMWefUQUGmmoRAjzAIerlgk1ojD8jZCD5ZGnDxgqBwf96omk4o1V011Ok0?=
 =?us-ascii?Q?4ZgGUrk2epSpi+JS+lv3B6IRi2RdEAUPxjULCdxaF2n9pISNkz5NXeVDNex8?=
 =?us-ascii?Q?LH2GYVSC8+pyCk0E4zErG0ehyLT1Txf/6SW/iTtnJh+aNhj7w+WtMieTJuOb?=
 =?us-ascii?Q?E7Zfe1wMEmRB8akhFPHcP+oW1QQKku8FnI4pa3c/zMQfCpnpGr6m1tnoem2o?=
 =?us-ascii?Q?KXthBiDO4UEQZ1Y7X8H5TR2ocPxIzJcn0FH3Wr2/irGg4Fn0yZSGgzYzdNyJ?=
 =?us-ascii?Q?alsOq532rZt2y0r+1bVRge0/bGpbQXIq5+3x7+CAGjVX5cdvZxnU4jpWU7Dh?=
 =?us-ascii?Q?0pyq/fQ9PwQmIENZF0IrXJDJxzXmzsXCAOmHRj7IVxoAdjCTAv5EgsaxKbxK?=
 =?us-ascii?Q?UPJ1KTbx4PqsJmvYl83emBZPbeNX8dbK2d+kXODsVjexfjr554bA68yL/Wq+?=
 =?us-ascii?Q?0yQRn5DzpjZ8RbQs6tvqrFPLjfrLPYxVOn5+iROOGC3pCSYTacq+bv6zKEHH?=
 =?us-ascii?Q?gofPMeyont5eR7zQmUuaqlHzTAz82hdqZaeHIMw77sSBYpgzJl+B6+PDBGqs?=
 =?us-ascii?Q?QkkiI42+ZLpZrMm/LaKMTqT28I9bi94KHgKzd8ma+oQxbtjmAKWzGyzhzAi7?=
 =?us-ascii?Q?ZftBk83KnqnzPYIT/Oa8l+pxR6HY3fzGVg6BLJuiGhfY9OFSRIjfbexfb9oZ?=
 =?us-ascii?Q?AOUk+75k0Hd9GKcmv/z3oWSQPMGLJlWBi2OUci3AcreWnvwCJM2W0oi9D2Wc?=
 =?us-ascii?Q?LrpBVj/swrHO2kzgZL0yH+9RFk0gy+BzJW36DgJQyuQYEyap6+EX8W/fRs+U?=
 =?us-ascii?Q?BiTvVAo4UyLeIn72I7QQtf1mtwfy/K8V8EBtbVU5wI9arnlJvUVQF+Iz9GY7?=
 =?us-ascii?Q?hCVHkmvaARskkm2hNec3SNlVKgNMsI9I6dsT3ZQOaPTgHChztzhaLyJjDesZ?=
 =?us-ascii?Q?tIWdMEJ62Rb0iVUhFcfqj9PtxBwo4s2dIEIVrBiubxoZ1QwOTZD/UUhiFOWk?=
 =?us-ascii?Q?WA0f1PRZz37s+uN7PWNPM1fRndQSEhyHYfFUnNBsSSANdKqabTJ4Qsd7pBcD?=
 =?us-ascii?Q?IjM1SI4BmQeVWjW3/w7DhuBSgW/IQq+QLimv4zYxc+KNucgJ1InN+0jorVg4?=
 =?us-ascii?Q?hIhJdceviCEFxVd8iZxNcdZ1KbU0ch7P8FIQVymzVT90+PvqUhp3tILded0o?=
 =?us-ascii?Q?2glQjTk7DzYFTXxSS7ehR1sAfP0eQr/0JGomUfFvIIaGnJnYjYdbp4fGRcGZ?=
 =?us-ascii?Q?W1YPAshO93rJdu1zp4zO36e6WpIrNEUhf1Dd+G+JuzsoFkENPelgsERL3qLL?=
 =?us-ascii?Q?hh1s0BQPZMcxThpfuxl0+V7PPyL1x/qzwFi4Cov6kjaDzEHPJhylLEi95I+f?=
 =?us-ascii?Q?QlZDISi+R5NmcCVpwTpJz/6jrXrESyKXqqwkdRG4Jpvo2C07YWJAWLfWGuI/?=
 =?us-ascii?Q?glNmgblvKXqoN/YUxau81nMZW7tUFxMME/7wV+zB+RrT6OBKjfQvasXUUq7+?=
 =?us-ascii?Q?0gZomJwUQyJCFQXsrCAKV7XJgdVunnY36YweZy7PqoaeLQIHpiJTMfXHl+pm?=
 =?us-ascii?Q?N8f4zsr+aA2UqZR0tWD50SGXBSDfohsgfQq70XsbbhKUiitOfl4fnRuxml/z?=
 =?us-ascii?Q?PBht6alQiOZs/2FLg0kBd9c=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0150561b-807b-4ffa-783f-08d9cbdab2fb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2021 21:24:01.9518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 N6pAieJHXQsRbJE1SkxIdcfdaR7jv8tM9p31znMGc9mac+sUcS8PkFi87QKY1CuToeLCBm9waajbmxXdb4Fssw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1792
X-Proofpoint-ORIG-GUID: y6Ai2rjVZMgO4PCSVYXd1TYZNu8hlbo9
X-Proofpoint-GUID: y6Ai2rjVZMgO4PCSVYXd1TYZNu8hlbo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-30_08,2021-12-30_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 spamscore=0 mlxlogscore=789 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112300122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Dec 2021 21:24:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160066

When the tranisiton to perl-cross occured, the threading define
seems to have been missed.  The perl tests for threading where
simply skipped, so there was no direct failures.  This was verified
by running perl ptest before and after the change to see PASS vs SKIP
results of threaded related tests.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.34.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index a6ae80f07e1..3306a093692 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -53,6 +53,7 @@ do_configure:class-target() {
     ./configure --prefix=${prefix} --libdir=${libdir} \
     --target=${TARGET_SYS} \
     -Duseshrplib \
+    -Dusethreads \
     -Dsoname=libperl.so.5 \
     -Dvendorprefix=${prefix} \
     -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
-- 
2.31.1


