Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588C6C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 18:47:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1394.1667587641757391861
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 11:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bzZBdLL5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=830754cb05=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A4DmGOR026705
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Nov 2022 11:47:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=1E08JR6UUFzEQ5WMK2Qp7tCNjcSh5+Ch+kXYi4MZaeQ=;
 b=bzZBdLL5UwGlkqCubNdr0pSV3IMuxzXAgoj+sCOaWv2VhDW79FUHZBDslvd4VVgaUp7w
 03Nl3GjKGAz98hHma6tyAx0EzAfWK1Ydy0UfrnY6SgtJzfw7kqZSz2f/wNDG8pO2oAQr
 wcAILkU8Xo9fgiKbDEUxnR1huYoxFe5dDjuSEqGNjqw7Ciw6ThXmTKWqYH3O2IIWSDQ8
 kN2XnPaImf+uddx0mNtwIeiHpAaUVn1BMLHYqrXGq/dFJ0OoNs07pQZqfC6K1mgjYJ6C
 V0Uz1i+tLibwOpKxFOLiqpy4vhcSMb6ukEX3T9RlfjzGYPZ04fX5a1S3ljtmPpm0U3/m xg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kmpesrt7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 11:47:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZOJxxra9hObf3VjuQLhRqhPncaX9RWoRibMQBzsOswmzHTSix++P2/dIPTpjmGbF0DPTFDGDztwrg8NL2A7ogXygE6DyIK/Xw4sItq01aEfTnDPGBhNTuSZ2AkAyrsIkfm1QIGczGpH33fpYCDK/arSlmzjtotihIxOcaxpAiWCiNO1Vz2ViDVWmp+fcAYwGfa4RHWuYzmsCiCodP6B46/M5uz806LdXqu9Pxxmwtxmqhyb8fpuBA1zwjC/2UPrxiFnqSYmmduehlgCoz2mqQhl4/95kHFeS8TUJQttWaQVwph3mlouQWdY5iTnbaReru1/hBDLr1sGWrPrzSx3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1E08JR6UUFzEQ5WMK2Qp7tCNjcSh5+Ch+kXYi4MZaeQ=;
 b=YCVXqFwT9HpJrLKqFWl2fcTFeHRBx8VUergEuR9l84CKzzfdBzdHZ2vSUKSPCK0VXASBNMkzZeBOy0CNdy1UkzlO5ZOP+KN7fkdqIndtsSS6gfMwqtN6urnxSufzNzpd+71bl9L5oUQd0s6h+NimvyNdmW6a2GtAXTY4mSiN9+x06Q/a0a/eeC0V0Ng7rOvl7xpdOsSAERVeajLmzkwbEotodlCwy0uO6ELnYTyfwTg5cS+td/UKWnXkd13Hk7rmcWkc4fZjandcELHSvBj+32F6RP7ylmnMWhfvNcOO6ICYXjS+COEUgb5ueHzbPQ+CXB+5v2Rg4+tgOgxG2f4X1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by MN2PR11MB4616.namprd11.prod.outlook.com (2603:10b6:208:26f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 18:47:18 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::76f2:e715:ba23:e517]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::76f2:e715:ba23:e517%9]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 18:47:18 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: zheng.qiu@windriver.com, randy.macleod@windriver.com
Subject: [master][PATCH] valgrind: remove most hidden tests for arm64
Date: Fri,  4 Nov 2022 14:47:05 -0400
Message-Id: <20221104184705.24777-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQXPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::19) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|MN2PR11MB4616:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9a76c2-7cf7-4fb0-004d-08dabe94ff6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gLfq1oHDgWEYHAGff+fUEBO/FIVy1FdhCmOC43Cr5uN2jHNuP2TwrIfchumql9ICyhGo451oS6lxWlFIFj8bgrgdzbS9Fj1fNWhCCcKmRv8amW/b/BaWY+Xjx1lvWrtSnEQp4PvzwKSwtKb0FaA1AFWuoYLWUv6g5npDw9kM22o/K3Cl8iMh76unZHa/UMoTJ9RoFo6WlK8jayaC4IEFbzSNIG9X0LiZdjNt+11kLl8zZ57713bLhilf0xrksVlHKWhM2rBsL5kv1iMXryz9Smi3v4vWWQQZu+N7AvofFTMghmZZMrc8fJNfejZxsTXZ+GwC0iwTKdTMFyofiKURNx/8mwbZn5VlmOPq+7PKmMr0PBGdm1cTWYbP/CPJ64iowKU1szzsGOHoBx76pOQDNU3+QlPXO2vSNY5xJNu3gWfbnzVaEtFjmoTE3CcKrrpgQKvQs7Bg59tFoUB66J06w92ACM29lzBzVuQEwaHlES24VcwMQsc9vW1g7lCg2ARPA+NFGzqZwgrIoLcTBizdYCrMWr4nxuu2Hk5XLvgLJKyuy1AQtWPGl1RRCSSmUYgo07eTryo2OI8eTERz+aj0Y/Dg6y/HdijDZ4VhJCIsH6A3efdTenVNd19iS6cnpadDZ8n3ecdC/WHWWZZWzCJ6SdpJahQitN53p5FhyFZaL9WIqui4ILG7uF18Zn0Y+qdCkE8VBLm0ZUg4+SuWz+JGDAuuH3d/UpfM1cltnvUM61aPl/oCHprxHnU2y/JbEkKELYP7KUp79sIfa5PRfMApwqalduFA7tDsqrz8eOD9a7E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(366004)(376002)(136003)(346002)(451199015)(86362001)(83380400001)(2906002)(36756003)(8676002)(6512007)(26005)(66476007)(4326008)(66556008)(41300700001)(66946007)(316002)(107886003)(38100700002)(38350700002)(6666004)(8936002)(5660300002)(186003)(1076003)(6486002)(2616005)(6506007)(52116002)(6916009)(478600001)(966005)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6y7ODJDab9req1bpWTrXY45xW0tY+M9pdm1fK44Gmwj8OMx30L5YYg+Umui2?=
 =?us-ascii?Q?2Zy9d0hHpytSAXZuO9TnbolnsTkcdClV7h629PduA2LoNypYlcdM4/Zo0Zfw?=
 =?us-ascii?Q?WNxD2MUWYhcPIk6LIqz4a7F7QkMIuCY/VsV2Jn4Lc6j3UI0P+7Ema2hJpQUb?=
 =?us-ascii?Q?X+B5ZPhJ3pQc5Fkq1r5/lQjtNF8r9M8d6U3kPHhaUXcJu43Sv2wHvzINoBUY?=
 =?us-ascii?Q?ZXeE/2VU2+wEPMmq44bzjjaNfsMt8opX5z+dYEL4kJDch2N1nz+tsRqJiCGG?=
 =?us-ascii?Q?Q8Vy3nUhzjamrzYI712wjV5nPVjbQjoqoMIOWdXnqRJr7e3rI2+FAuiMbPGS?=
 =?us-ascii?Q?WlHkijzbfWUiierklvMkJUdNWD2CzCvAmnxL4sXIhBfcAI6RjGkInBDOvhGj?=
 =?us-ascii?Q?hPVtaG9xJKHlAX48/CS2JtNY5pVRVbBaelOCE8VF+yymAVZG5pCh7E/XJszT?=
 =?us-ascii?Q?W1sl3UY4F3YfChvVP1o2eXotqpltAtcQsatMfQHNzY14I3D/pY7+0H4Ya8c7?=
 =?us-ascii?Q?A3SXzT7kXg6+l3vDhkNfjDQmvLzjBepoNF0uAvZTWAMTqSfIaNk6sFUNYIIe?=
 =?us-ascii?Q?ukiHbM3kB4eg/8OiwitCysIyU9aALxFfj3WRDObAMp6AXrf60+gQ6oSBHPi8?=
 =?us-ascii?Q?Zdzl2CZLv+beFPG/hF6mIngbLAljP1LPGfFq+ya1a8puG284tL18B6IPZgwb?=
 =?us-ascii?Q?PYdEJ506EY2gmwydkwO5VTr6PNdKghBM80XO9tVf4WQIcbTWGig8Wrg89+v6?=
 =?us-ascii?Q?sVlxuNYZ6LJbMf4q3xTAoJjozbgVW/8vUa6xet8GfRc+dPJm4mbp4MPEG2eX?=
 =?us-ascii?Q?Ik1JwDkeJjFsu5zNpdm399LL7r396ZGRV4Of9qNtXV5FejU53nHR9abFJTGa?=
 =?us-ascii?Q?OguW9z+7uu8B5Xt8rls5R7cSTaB3rYfM9+MdLoRMVNE2/QRoT7APjJp1RowD?=
 =?us-ascii?Q?+xHXU/b2NZCKvPxFpIBzds8eD9pcXLJzSeVQHI5z2ZYbdamOm44i1SSRqoYf?=
 =?us-ascii?Q?qoUs4+9yhNvWQbzUYmwu4AyJrJzOTS0gGGlhuQmlYsvUyXUyATKA28k+uM6P?=
 =?us-ascii?Q?7ujyIfVXW4yk/oun8ALnywQ1zOEn4X5/NqlWSunkjE7cys1Q5oWGm1sTUgbM?=
 =?us-ascii?Q?bvGAS0YTViRGP2bSIF0PDltZMXep01KTY16ihMT7OUPtw0aqcSe4R4ZEoaq0?=
 =?us-ascii?Q?nWPQLvt7btZ2H2kGD0oWUkm/xgwaxF87s7/DMiqvsiVJ2BV2vL/FEcidbPvC?=
 =?us-ascii?Q?rWJNMAFICz64ndBa8Aw8K5/9mdrtSwAiyH8Wiif/Kx8tg5gXygyW5WvjxHn3?=
 =?us-ascii?Q?RQ2Aq2VqaLRT4RpEX4rqE4VW5+N7F8uJt9sfMfCj48EjX5aLX7wtt6qWZpv1?=
 =?us-ascii?Q?zEB46yNS2kx5tS9REyvn2LLDvCoAesAR4vtcj9085ep18L88pjDytXOULE4b?=
 =?us-ascii?Q?r6ALPxbW4TDiwU1BchVDP88P4yNZiEogYrpkeLfvJ8yUyRF4+3DsGtjqT1qA?=
 =?us-ascii?Q?5Vegl2oFSFHdvphfZ8NfY9URqKzlEO0Ja7KvKkJ6EapJ2dO3wqyGQ0FegKY3?=
 =?us-ascii?Q?V8MV4Z//azqkjR1XrV5bYBZWSyXJwpXBw8cZGGcNSn8IowKiYNSX2w9oRtBi?=
 =?us-ascii?Q?hQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9a76c2-7cf7-4fb0-004d-08dabe94ff6e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 18:47:17.8369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmuZ/onVprgv3xSUcwgViQBPvrrfO/gjVZZJedSFYdDmS1bW7YuRaHAfQr/b4wQpOV0aVZ6MQEGHwnEe7cK4MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4616
X-Proofpoint-ORIG-GUID: OYUUhe3_rlosDxqmN9gXvr0RtponC55L
X-Proofpoint-GUID: OYUUhe3_rlosDxqmN9gXvr0RtponC55L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_11,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 18:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172727

An earlier version of valgrind fixed the defunct processes bug, so those
tests that were skipped specifically for arm can pass now in master,
kirkstone, honister, hardknott, and dunfell.

Detailed test result with remove-for-aarch64 skipped on qemuarm64:

    Commit           Pass   Fail    Skip
    master           624    9       21
    kirkstone        618    10      20
    honister         616    10      19
    hardknott        609    13      18
    dunfell          598    16      17
    zeus             Out of memory: Killed (with many defunct processes)

There are now only 12 skipped by remove-for-aarch64 because 9 fail on
qemuarm64 and 3 more fail on raspberry pi. These are tracked by:
    https://bugzilla.yoctoproject.org/show_bug.cgi?id=14960

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
---
 .../valgrind/valgrind/remove-for-aarch64      | 227 +-----------------
 1 file changed, 3 insertions(+), 224 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index 887bfd2766..a9809e5d8c 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -1,211 +1,6 @@
 gdbserver_tests/hgtls
-cachegrind/tests/ann1
-callgrind/tests/simwork1
-callgrind/tests/simwork2
-callgrind/tests/simwork3
-callgrind/tests/simwork-both
-callgrind/tests/simwork-cache
-callgrind/tests/threads
-callgrind/tests/threads-use
-drd/tests/annotate_barrier
-drd/tests/annotate_barrier_xml
-drd/tests/annotate_hbefore
-drd/tests/annotate_hb_err
-drd/tests/annotate_hb_race
-drd/tests/annotate_ignore_read
-drd/tests/annotate_ignore_rw
-drd/tests/annotate_ignore_rw2
-drd/tests/annotate_ignore_write
-drd/tests/annotate_ignore_write2
-drd/tests/annotate_order_1
-drd/tests/annotate_order_2
-drd/tests/annotate_order_3
-drd/tests/annotate_publish_hg
-drd/tests/annotate_rwlock
-drd/tests/annotate_rwlock_hg
-drd/tests/annotate_sem
-drd/tests/annotate_smart_pointer
-drd/tests/annotate_smart_pointer2
-drd/tests/annotate_spinlock
-drd/tests/annotate_static
-drd/tests/annotate_trace_memory
-drd/tests/annotate_trace_memory_xml
-drd/tests/atomic_var
-drd/tests/bar_bad
-drd/tests/bar_trivial
-drd/tests/boost_thread
-drd/tests/bug-235681
-drd/tests/bug322621
-drd/tests/circular_buffer
-drd/tests/concurrent_close
-drd/tests/custom_alloc
-drd/tests/custom_alloc_fiw
-drd/tests/dlopen
-drd/tests/fork-parallel
-drd/tests/fork-serial
-drd/tests/fp_race
-drd/tests/fp_race2
-drd/tests/fp_race_xml
-drd/tests/free_is_write
-drd/tests/free_is_write2
-drd/tests/hg01_all_ok
-drd/tests/hg02_deadlock
-drd/tests/hg03_inherit
-drd/tests/hg04_race
-drd/tests/hg05_race2
-drd/tests/hg06_readshared
-drd/tests/hold_lock_1
-drd/tests/hold_lock_2
-drd/tests/linuxthreads_det
-drd/tests/matinv
-drd/tests/memory_allocation
-drd/tests/monitor_example
-drd/tests/new_delete
-drd/tests/pth_barrier
-drd/tests/pth_barrier2
-drd/tests/pth_barrier3
-drd/tests/pth_barrier_race
-drd/tests/pth_barrier_reinit
-drd/tests/pth_broadcast
-drd/tests/pth_cancel_locked
-drd/tests/pth_cleanup_handler
-drd/tests/pth_cond_race
-drd/tests/pth_cond_race2
-drd/tests/pth_detached2
-drd/tests/pth_detached3
-drd/tests/pth_detached_sem
-drd/tests/pth_inconsistent_cond_wait
-drd/tests/pth_mutex_reinit
-drd/tests/pth_once
-drd/tests/pth_process_shared_mutex
-drd/tests/pth_spinlock
-drd/tests/pth_uninitialized_cond
-drd/tests/read_and_free_race
-drd/tests/recursive_mutex
-drd/tests/rwlock_race
-drd/tests/rwlock_test
-drd/tests/rwlock_type_checking
-drd/tests/sem_as_mutex
-drd/tests/sem_as_mutex2
-drd/tests/sem_as_mutex3
-drd/tests/sem_open
-drd/tests/sem_open2
-drd/tests/sem_open3
-drd/tests/sem_open_traced
-drd/tests/sem_wait
-drd/tests/sigalrm
-drd/tests/sigaltstack
-drd/tests/std_atomic
-drd/tests/std_string
-drd/tests/std_thread
-drd/tests/std_thread2
-drd/tests/str_tester
-drd/tests/tc01_simple_race
-drd/tests/tc02_simple_tls
-drd/tests/tc03_re_excl
-drd/tests/tc04_free_lock
-drd/tests/tc05_simple_race
-drd/tests/tc06_two_races
-drd/tests/tc07_hbl1
-drd/tests/tc08_hbl2
-drd/tests/tc10_rec_lock
-drd/tests/tc11_XCHG
-drd/tests/tc12_rwl_trivial
-drd/tests/tc13_laog1
-drd/tests/tc15_laog_lockdel
-drd/tests/tc16_byterace
-drd/tests/tc17_sembar
-drd/tests/tc18_semabuse
-drd/tests/tc19_shadowmem
-drd/tests/tc21_pthonce
-drd/tests/tc22_exit_w_lock
-drd/tests/tc23_bogus_condwait
-helgrind/tests/annotate_rwlock
-helgrind/tests/annotate_smart_pointer
-helgrind/tests/bar_bad
-helgrind/tests/bar_trivial
-helgrind/tests/bug322621
-helgrind/tests/cond_init_destroy
-helgrind/tests/cond_timedwait_invalid
-helgrind/tests/cond_timedwait_test
-helgrind/tests/free_is_write
-helgrind/tests/hg01_all_ok
-helgrind/tests/hg03_inherit
-helgrind/tests/hg04_race
-helgrind/tests/hg05_race2
-helgrind/tests/hg06_readshared
-helgrind/tests/locked_vs_unlocked1_fwd
-helgrind/tests/locked_vs_unlocked1_rev
-helgrind/tests/locked_vs_unlocked2
-helgrind/tests/locked_vs_unlocked3
-helgrind/tests/pth_barrier1
-helgrind/tests/pth_barrier2
-helgrind/tests/pth_barrier3
-helgrind/tests/pth_destroy_cond
-helgrind/tests/rwlock_race
-helgrind/tests/rwlock_test
-helgrind/tests/shmem_abits
-helgrind/tests/stackteardown
-helgrind/tests/t2t_laog
-helgrind/tests/tc01_simple_race
-helgrind/tests/tc02_simple_tls
-helgrind/tests/tc03_re_excl
-helgrind/tests/tc04_free_lock
-helgrind/tests/tc05_simple_race
-helgrind/tests/tc06_two_races
-helgrind/tests/tc06_two_races_xml
-helgrind/tests/tc07_hbl1
-helgrind/tests/tc08_hbl2
-helgrind/tests/tc09_bad_unlock
-helgrind/tests/tc10_rec_lock
-helgrind/tests/tc11_XCHG
-helgrind/tests/tc12_rwl_trivial
-helgrind/tests/tc13_laog1
-helgrind/tests/tc14_laog_dinphils
-helgrind/tests/tc15_laog_lockdel
-helgrind/tests/tc16_byterace
-helgrind/tests/tc17_sembar
-helgrind/tests/tc18_semabuse
-helgrind/tests/tc19_shadowmem
-helgrind/tests/tc20_verifywrap
-helgrind/tests/tc21_pthonce
-helgrind/tests/tc22_exit_w_lock
-helgrind/tests/tc23_bogus_condwait
-helgrind/tests/tc24_nonzero_sem
-memcheck/tests/accounting
-memcheck/tests/addressable
-memcheck/tests/arm64-linux/scalar
-memcheck/tests/atomic_incs
-memcheck/tests/badaddrvalue
-memcheck/tests/badfree
-memcheck/tests/badfree-2trace
-memcheck/tests/badfree3
-memcheck/tests/badjump
-memcheck/tests/badjump2
-memcheck/tests/badloop
-memcheck/tests/badpoll
-memcheck/tests/badrw
-memcheck/tests/big_blocks_freed_list
-memcheck/tests/brk2
 memcheck/tests/dw4
-memcheck/tests/err_disable4
-memcheck/tests/err_disable_arange1
-memcheck/tests/leak-autofreepool-5
-memcheck/tests/linux/lsframe1
-memcheck/tests/linux/lsframe2
-memcheck/tests/linux/with-space
-memcheck/tests/origin5-bz2
-memcheck/tests/origin6-fp
-memcheck/tests/partial_load_dflt
-memcheck/tests/pdb-realloc2
-memcheck/tests/sh-mem
-memcheck/tests/sh-mem-random
-memcheck/tests/sigaltstack
-memcheck/tests/sigkill
-memcheck/tests/signal2
-memcheck/tests/threadname
-memcheck/tests/threadname_xml
-memcheck/tests/unit_oset
+memcheck/tests/leak_cpp_interior
 memcheck/tests/varinfo1
 memcheck/tests/varinfo2
 memcheck/tests/varinfo3
@@ -213,21 +8,5 @@ memcheck/tests/varinfo4
 memcheck/tests/varinfo5
 memcheck/tests/varinfo6
 memcheck/tests/varinforestrict
-memcheck/tests/vcpu_bz2
-memcheck/tests/vcpu_fbench
-memcheck/tests/vcpu_fnfns
-memcheck/tests/wcs
-memcheck/tests/wrap1
-memcheck/tests/wrap2
-memcheck/tests/wrap3
-memcheck/tests/wrap4
-memcheck/tests/wrap5
-memcheck/tests/wrap6
-memcheck/tests/wrap7
-memcheck/tests/wrap8
-memcheck/tests/wrapmalloc
-memcheck/tests/wrapmallocstatic
-memcheck/tests/writev1
-memcheck/tests/xml1
-memcheck/tests/linux/stack_changes
-memcheck/tests/linux/timerfd-syscall
+helgrind/tests/hg05_race2
+helgrind/tests/tc20_verifywrap
-- 
2.33.0


