Return-Path: <ting.liu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0244.outbound.protection.outlook.com [207.46.163.244])
	by mail.openembedded.org (Postfix) with ESMTP id 28F5165D03
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 09:59:31 +0000 (UTC)
Received: from BLUPR03CA036.namprd03.prod.outlook.com (10.141.30.29) by
	BY2PR03MB157.namprd03.prod.outlook.com (10.242.36.12) with Microsoft
	SMTP Server (TLS) id 15.0.990.7; Wed, 16 Jul 2014 09:59:29 +0000
Received: from BN1AFFO11FD006.protection.gbl (2a01:111:f400:7c10::102) by
	BLUPR03CA036.outlook.office365.com (2a01:111:e400:879::29) with
	Microsoft
	SMTP Server (TLS) id 15.0.985.8 via Frontend Transport; Wed, 16 Jul 2014
	09:59:28 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD006.mail.protection.outlook.com (10.58.52.66) with Microsoft
	SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Wed, 16 Jul 2014 09:59:28 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net [10.193.20.99])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s6G9xN6L007827;
	Wed, 16 Jul 2014 02:59:25 -0700
From: <ting.liu@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jul 2014 18:00:21 +0800
Message-ID: <1405504821-28349-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(76482001)(88136002)(85306003)(62966002)(33646002)(104016003)(50466002)(50986999)(87936001)(23676002)(87286001)(74662001)(83072002)(106466001)(92566001)(105606002)(86152002)(81156004)(92726001)(110136001)(6806004)(89996001)(74502001)(85852003)(95666004)(4396001)(77156001)(77982001)(229853001)(79102001)(107046002)(2351001)(83322001)(19580405001)(21056001)(97736001)(102836001)(50226001)(44976005)(36756003)(551934003)(20776003)(26826002)(47776003)(104166001)(64706001)(80022001)(46102001)(86362001)(31966008)(84676001)(68736004)(69596002)(19580395003)(575784001)(81542001)(93916002)(81342001)(99396002)(559001)(569005);
	DIR:OUT; SFP:; SCL:1; SRVR:BY2PR03MB157;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 0274272F87
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.158.2
	as permitted sender) receiver=; client-ip=192.88.158.2;
	helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=ting.liu@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 3/3] oprofile: backport two patches to support e500mc/e6500
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jul 2014 09:59:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Ting Liu <ting.liu@freescale.com>

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
v2: add Upstream-Status

 .../0001-Add-freescale-e500mc-support.patch        |  219 ++++++++++++
 .../0002-Add-freescale-e6500-support.patch         |  364 ++++++++++++++++++++
 meta/recipes-kernel/oprofile/oprofile_0.9.9.bb     |    2 +
 3 files changed, 585 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Add-freescale-e500mc-support.patch
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/0002-Add-freescale-e6500-support.patch

diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-Add-freescale-e500mc-support.patch b/meta/recipes-kernel/oprofile/oprofile/0001-Add-freescale-e500mc-support.patch
new file mode 100644
index 0000000..ed80606
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/0001-Add-freescale-e500mc-support.patch
@@ -0,0 +1,219 @@
+From ca3f796b3a7742215ed35b56fc072595174c410e Mon Sep 17 00:00:00 2001
+From: Ting Liu <b28495@freescale.com>
+Date: Thu, 5 Sep 2013 07:43:55 -0500
+Subject: [PATCH 1/2] Add freescale e500mc support
+
+Upstream-Status: Backport
+
+Signed-off-by: George Stephen <Stephen.George@freescale.com>
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+Signed-off-by: Ting Liu <b28495@freescale.com>
+---
+ events/Makefile.am           |    1 +
+ events/ppc/e500mc/events     |  120 ++++++++++++++++++++++++++++++++++++++++++
+ events/ppc/e500mc/unit_masks |    4 ++
+ libop/op_cpu_type.c          |    1 +
+ libop/op_cpu_type.h          |    1 +
+ libop/op_events.c            |    1 +
+ utils/ophelp.c               |    1 +
+ 7 files changed, 129 insertions(+), 0 deletions(-)
+ create mode 100644 events/ppc/e500mc/events
+ create mode 100644 events/ppc/e500mc/unit_masks
+
+diff --git a/events/Makefile.am b/events/Makefile.am
+index be87781..e496f98 100644
+--- a/events/Makefile.am
++++ b/events/Makefile.am
+@@ -76,6 +76,7 @@ event_files = \
+ 	ppc/7450/events ppc/7450/unit_masks \
+ 	ppc/e500/events ppc/e500/unit_masks \
+ 	ppc/e500v2/events ppc/e500v2/unit_masks \
++	ppc/e500mc/events ppc/e500mc/unit_masks \
+ 	ppc/e300/events ppc/e300/unit_masks \
+ 	tile/tile64/events tile/tile64/unit_masks \
+ 	tile/tilepro/events tile/tilepro/unit_masks \
+diff --git a/events/ppc/e500mc/events b/events/ppc/e500mc/events
+new file mode 100644
+index 0000000..8197a7d
+--- /dev/null
++++ b/events/ppc/e500mc/events
+@@ -0,0 +1,120 @@
++# e500mc Events
++#
++# Copyright (C) 2010 Freescale Semiconductor, Inc.
++#
++event:0x1 counters:0,1,2,3 um:zero minimum:100 name:CPU_CLK : Cycles
++event:0x2 counters:0,1,2,3 um:zero minimum:500 name:COMPLETED_INSNS : Completed Instructions (0, 1, or 2 per cycle)
++event:0x3 counters:0,1,2,3 um:zero minimum:500 name:COMPLETED_OPS : Completed Micro-ops (counts 2 for load/store w/update)
++event:0x4 counters:0,1,2,3 um:zero minimum:500 name:INSTRUCTION_FETCHES : Instruction fetches
++event:0x5 counters:0,1,2,3 um:zero minimum:500 name:DECODED_OPS : Micro-ops decoded
++event:0x8 counters:0,1,2,3 um:zero minimum:500 name:COMPLETED_BRANCHES : Branch Instructions completed
++event:0x9 counters:0,1,2,3 um:zero minimum:500 name:COMPLETED_LOAD_OPS : Load micro-ops completed
++event:0xa counters:0,1,2,3 um:zero minimum:500 name:COMPLETED_STORE_OPS : Store micro-ops completed
++event:0xb counters:0,1,2,3 um:zero minimum:500 name:COMPLETION_REDIRECTS : Number of completion buffer redirects
++event:0xc counters:0,1,2,3 um:zero minimum:500 name:BRANCHES_FINISHED : Branches finished
++event:0xd counters:0,1,2,3 um:zero minimum:500 name:TAKEN_BRANCHES_FINISHED : Taken branches finished
++event:0xe counters:0,1,2,3 um:zero minimum:500 name:BIFFED_BRANCHES_FINISHED : Biffed branches finished
++event:0xf counters:0,1,2,3 um:zero minimum:500 name:BRANCHES_MISPREDICTED : Branch instructions mispredicted due to direction, target, or IAB prediction
++event:0x10 counters:0,1,2,3 um:zero minimum:500 name:BRANCHES_MISPREDICTED_DIRECTION : Branches mispredicted due to direction prediction
++event:0x11 counters:0,1,2,3 um:zero minimum:500 name:BTB_HITS : Branches that hit in the BTB, or missed but are not taken
++event:0x12 counters:0,1,2,3 um:zero minimum:500 name:DECODE_STALLED : Cycles the instruction buffer was not empty, but 0 instructions decoded
++event:0x13 counters:0,1,2,3 um:zero minimum:500 name:ISSUE_STALLED : Cycles the issue buffer is not empty but 0 instructions issued
++event:0x14 counters:0,1,2,3 um:zero minimum:500 name:BRANCH_ISSUE_STALLED : Cycles the branch buffer is not empty but 0 instructions issued
++event:0x15 counters:0,1,2,3 um:zero minimum:500 name:SRS0_SCHEDULE_STALLED : Cycles SRS0 is not empty but 0 instructions scheduled
++event:0x16 counters:0,1,2,3 um:zero minimum:500 name:SRS1_SCHEDULE_STALLED : Cycles SRS1 is not empty but 0 instructions scheduled
++event:0x17 counters:0,1,2,3 um:zero minimum:500 name:VRS_SCHEDULE_STALLED : Cycles VRS is not empty but 0 instructions scheduled
++event:0x18 counters:0,1,2,3 um:zero minimum:500 name:LRS_SCHEDULE_STALLED : Cycles LRS is not empty but 0 instructions scheduled
++event:0x19 counters:0,1,2,3 um:zero minimum:500 name:BRS_SCHEDULE_STALLED : Cycles BRS is not empty but 0 instructions scheduled Load/Store, Data Cache, and dLFB Events
++event:0x1a counters:0,1,2,3 um:zero minimum:500 name:TOTAL_TRANSLATED : Total Ldst microops translated.
++event:0x1b counters:0,1,2,3 um:zero minimum:500 name:LOADS_TRANSLATED : Number of cacheable L* or EVL* microops translated. (This includes microops from load-multiple, load-update, and load-context instructions.)
++event:0x1c counters:0,1,2,3 um:zero minimum:500 name:STORES_TRANSLATED : Number of cacheable ST* or EVST* microops translated. (This includes microops from store-multiple, store-update, and save-context instructions.)
++event:0x1d counters:0,1,2,3 um:zero minimum:500 name:TOUCHES_TRANSLATED : Number of cacheable DCBT and DCBTST instructions translated (L1 only) (Does not count touches that are converted to nops i.e. exceptions, noncacheable, hid0[nopti] bit is set.)
++event:0x1e counters:0,1,2,3 um:zero minimum:500 name:CACHEOPS_TRANSLATED : Number of dcba, dcbf, dcbst, and dcbz instructions translated (e500 traps on dcbi)
++event:0x1f counters:0,1,2,3 um:zero minimum:500 name:CACHEINHIBITED_ACCESSES_TRANSLATED : Number of cache inhibited accesses translated
++event:0x20 counters:0,1,2,3 um:zero minimum:500 name:GUARDED_LOADS_TRANSLATED : Number of guarded loads translated
++event:0x21 counters:0,1,2,3 um:zero minimum:500 name:WRITETHROUGH_STORES_TRANSLATED : Number of write-through stores translated
++event:0x22 counters:0,1,2,3 um:zero minimum:500 name:MISALIGNED_ACCESSES_TRANSLATED : Number of misaligned load or store accesses translated.
++event:0x23 counters:0,1,2,3 um:zero minimum:500 name:TOTAL_ALLOCATED_DLFB : Total allocated to dLFB
++event:0x24 counters:0,1,2,3 um:zero minimum:500 name:LOADS_TRANSLATED_ALLOCATED_DLFB : Loads translated and allocated to dLFB (Applies to same class of instructions as loads translated.)
++event:0x25 counters:0,1,2,3 um:zero minimum:500 name:STORES_COMPLETED_ALLOCATED_DLFB : Stores completed and allocated to dLFB (Applies to same class of instructions as stores translated.)
++event:0x26 counters:0,1,2,3 um:zero minimum:500 name:TOUCHES_TRANSLATED_ALLOCATED_DLFB : Touches translated and allocated to dLFB (Applies to same class of instructions as touches translated.)
++event:0x27 counters:0,1,2,3 um:zero minimum:500 name:STORES_COMPLETED : Number of cacheable ST* or EVST* microops completed. (Applies to the same class of instructions as stores translated.)
++event:0x28 counters:0,1,2,3 um:zero minimum:500 name:DL1_LOCKS : Number of cache lines locked in the dL1. (Counts a lock even if an overlock condition is encountered.)
++event:0x29 counters:0,1,2,3 um:zero minimum:500 name:DL1_RELOADS : This is historically used to determine dcache miss rate (along with loads/stores completed). This counts dL1 reloads for any reason.
++event:0x2a counters:0,1,2,3 um:zero minimum:500 name:DL1_CASTOUTS : dL1 castouts. Does not count castouts due to DCBF.
++event:0x2b counters:0,1,2,3 um:zero minimum:500 name:DETECTED_REPLAYS : Times detected replay condition - Load miss with dLFB full.
++event:0x2c counters:0,1,2,3 um:zero minimum:500 name:LOAD_MISS_QUEUE_FULL_REPLAYS : Load miss with load queue full.
++event:0x2d counters:0,1,2,3 um:zero minimum:500 name:LOAD_GUARDED_MISS_NOT_LAST_REPLAYS : Load guarded miss when the load is not yet at the bottom of the completion buffer.
++event:0x2e counters:0,1,2,3 um:zero minimum:500 name:STORE_TRANSLATED_QUEUE_FULL_REPLAYS : Translate a store when the StQ is full.
++event:0x2f counters:0,1,2,3 um:zero minimum:500 name:ADDRESS_COLLISION_REPLAYS : Address collision.
++event:0x30 counters:0,1,2,3 um:zero minimum:500 name:DMMU_MISS_REPLAYS : DMMU_MISS_REPLAYS : DMMU miss.
++event:0x31 counters:0,1,2,3 um:zero minimum:500 name:DMMU_BUSY_REPLAYS : DMMU_BUSY_REPLAYS : DMMU busy.
++event:0x32 counters:0,1,2,3 um:zero minimum:500 name:SECOND_PART_MISALIGNED_AFTER_MISS_REPLAYS : Second part of misaligned access when first part missed in cache.
++event:0x33 counters:0,1,2,3 um:zero minimum:500 name:LOAD_MISS_DLFB_FULL_CYCLES : Cycles stalled on replay condition - Load miss with dLFB full.
++event:0x34 counters:0,1,2,3 um:zero minimum:500 name:LOAD_MISS_QUEUE_FULL_CYCLES : Cycles stalled on replay condition - Load miss with load queue full.
++event:0x35 counters:0,1,2,3 um:zero minimum:500 name:LOAD_GUARDED_MISS_NOT_LAST_CYCLES : Cycles stalled on replay condition - Load guarded miss when the load is not yet at the bottom of the completion buffer.
++event:0x36 counters:0,1,2,3 um:zero minimum:500 name:STORE_TRANSLATED_QUEUE_FULL_CYCLES : Cycles stalled on replay condition - Translate a store when the StQ is full.
++event:0x37 counters:0,1,2,3 um:zero minimum:500 name:ADDRESS_COLLISION_CYCLES : Cycles stalled on replay condition - Address collision.
++event:0x38 counters:0,1,2,3 um:zero minimum:500 name:DMMU_MISS_CYCLES : Cycles stalled on replay condition - DMMU miss.
++event:0x39 counters:0,1,2,3 um:zero minimum:500 name:DMMU_BUSY_CYCLES : Cycles stalled on replay condition - DMMU busy.
++event:0x3a counters:0,1,2,3 um:zero minimum:500 name:SECOND_PART_MISALIGNED_AFTER_MISS_CYCLES : Cycles stalled on replay condition - Second part of misaligned access when first part missed in cache.
++event:0x3b counters:0,1,2,3 um:zero minimum:500 name:IL1_LOCKS : Number of cache lines locked in the iL1. (Counts a lock even if an overlock condition is encountered.)
++event:0x3c counters:0,1,2,3 um:zero minimum:500 name:IL1_FETCH_RELOADS : This is historically used to determine icache miss rate (along with instructions completed) Reloads due to demand fetch.
++event:0x3d counters:0,1,2,3 um:zero minimum:500 name:FETCHES : Counts the number of fetches that write at least one instruction to the instruction buffer. (With instruction fetched, can used to compute instructions-per-fetch)
++event:0x3e counters:0,1,2,3 um:zero minimum:500 name:IMMU_TLB4K_RELOADS : iMMU TLB4K reloads
++event:0x3f counters:0,1,2,3 um:zero minimum:500 name:IMMU_VSP_RELOADS : iMMU VSP reloads
++event:0x40 counters:0,1,2,3 um:zero minimum:500 name:DMMU_TLB4K_RELOADS : dMMU TLB4K reloads
++event:0x41 counters:0,1,2,3 um:zero minimum:500 name:DMMU_VSP_RELOADS : dMMU VSP reloads
++event:0x42 counters:0,1,2,3 um:zero minimum:500 name:L2MMU_MISSES : Counts iTLB/dTLB error interrupt
++event:0x43 counters:0,1,2,3 um:zero minimum:500 name:BIU_MASTER_REQUESTS : Number of master transactions. (Number of master TSs.)
++event:0x44 counters:0,1,2,3 um:zero minimum:500 name:BIU_MASTER_I_REQUESTS : Number of master I-Side transactions. (Number of master I-Side TSs.)
++event:0x45 counters:0,1,2,3 um:zero minimum:500 name:BIU_MASTER_D_REQUESTS : Number of master D-Side transactions. (Number of master D-Side TSs.)
++event:0x46 counters:0,1,2,3 um:zero minimum:500 name:BIU_MASTER_D_CASTOUT_REQUESTS : Number of master D-Side non-program-demand castout transactions. This counts replacement pushes and snoop pushes. This does not count DCBF castouts. (Number of master D-side non-program-demand castout TSs.)
++event:0x48 counters:0,1,2,3 um:zero minimum:500 name:SNOOP_REQUESTS : Number of externally generated snoop requests. (Counts snoop TSs.)
++event:0x49 counters:0,1,2,3 um:zero minimum:500 name:SNOOP_HITS : Number of snoop hits on all D-side resources regardless of the cache state (modified, exclusive, or shared)
++event:0x4a counters:0,1,2,3 um:zero minimum:500 name:SNOOP_PUSHES : Number of snoop pushes from all D-side resources. (Counts snoop ARTRY/WOPs.)
++event:0x52 counters:0,1,2,3 um:zero minimum:500 name:PMC0_OVERFLOW : Counts the number of times PMC0[32] transitioned from 1 to 0.
++event:0x53 counters:0,1,2,3 um:zero minimum:500 name:PMC1_OVERFLOW : Counts the number of times PMC1[32] transitioned from 1 to 0.
++event:0x54 counters:0,1,2,3 um:zero minimum:500 name:PMC2_OVERFLOW : Counts the number of times PMC2[32] transitioned from 1 to 0.
++event:0x55 counters:0,1,2,3 um:zero minimum:500 name:PMC3_OVERFLOW : Counts the number of times PMC3[32] transitioned from 1 to 0.
++event:0x56 counters:0,1,2,3 um:zero minimum:500 name:INTERRUPTS : Number of interrupts taken
++event:0x57 counters:0,1,2,3 um:zero minimum:500 name:EXTERNAL_INTERRUPTS : Number of external input interrupts taken
++event:0x58 counters:0,1,2,3 um:zero minimum:500 name:CRITICAL_INTERRUPTS : Number of critical input interrupts taken
++event:0x59 counters:0,1,2,3 um:zero minimum:500 name:SC_TRAP_INTERRUPTS : Number of system call and trap interrupts
++event:0x5b counters:0,1,2,3 um:zero minimum:500 name:L2_LINEFILL_REQ : Number L2 Linefill requests
++event:0x5c counters:0,1,2,3 um:zero minimum:500 name:L2_VICTIM_SELECT : Number L2 Victim selects
++event:0x6e counters:0,1,2,3 um:zero minimum:500 name:L2_ACCESS : Number L2 cache accesses
++event:0x6f counters:0,1,2,3 um:zero minimum:500 name:L2_HIT_ACCESS : Number L2 hit cache accesses
++event:0x70 counters:0,1,2,3 um:zero minimum:500 name:L2_DATA_ACCESS : Number L2 data cache accesses
++event:0x71 counters:0,1,2,3 um:zero minimum:500 name:L2_HIT_DATA_ACCESS : Number L2 hit data cache accesses
++event:0x72 counters:0,1,2,3 um:zero minimum:500 name:L2_INST_ACCESS : Number L2 instruction cache accesses
++event:0x73 counters:0,1,2,3 um:zero minimum:500 name:L2_HIT_INST_ACCESS : Number L2 hit instruction cache accesses
++event:0x74 counters:0,1,2,3 um:zero minimum:500 name:L2_ALLOC : Number L2 cache allocations
++event:0x75 counters:0,1,2,3 um:zero minimum:500 name:L2_DATA_ALLOC : Number L2 data cache allocations
++event:0x76 counters:0,1,2,3 um:zero minimum:500 name:L2_DIRTY_DATA_ALLOC : Number L2 dirty data cache allocations
++event:0x77 counters:0,1,2,3 um:zero minimum:500 name:L2_INST_ALLOC : Number L2 instruction cache allocations
++event:0x78 counters:0,1,2,3 um:zero minimum:500 name:L2_UPDATE : Number L2 cache updates
++event:0x79 counters:0,1,2,3 um:zero minimum:500 name:L2_CLEAN_UPDATE : Number L2 cache clean updates
++event:0x7a counters:0,1,2,3 um:zero minimum:500 name:L2_DIRTY_UPDATE : Number L2 cache dirty updates
++event:0x7b counters:0,1,2,3 um:zero minimum:500 name:L2_CLEAN_REDU_UPDATE : Number L2 cache clean redundant updates
++event:0x7c counters:0,1,2,3 um:zero minimum:500 name:L2_DIRTY_REDU_UPDATE : Number L2 cache dirty redundant updates
++event:0x7d counters:0,1,2,3 um:zero minimum:500 name:L2_LOCKS : Number L2 cache locks
++event:0x7e counters:0,1,2,3 um:zero minimum:500 name:L2_CASTOUT : Number L2 cache castouts
++event:0x7f counters:0,1,2,3 um:zero minimum:500 name:L2_HIT_DATA_DIRTY : Number L2 cache data dirty hits
++event:0x82 counters:0,1,2,3 um:zero minimum:500 name:L2_INV_CLEAN : Number L2 cache invalidation of clean lines
++event:0x83 counters:0,1,2,3 um:zero minimum:500 name:L2_INV_INCOHER : Number L2 cache invalidation of incoherent lines
++event:0x84 counters:0,1,2,3 um:zero minimum:500 name:L2_INV_COHER : Number L2 cache invalidation of coherent lines
++event:0x94 counters:0,1,2,3 um:zero minimum:500 name:DVT0 : Detection of write to DEVENT with DVT0 set
++event:0x95 counters:0,1,2,3 um:zero minimum:500 name:DVT1 : Detection of write to DEVENT with DVT1 set
++event:0x96 counters:0,1,2,3 um:zero minimum:500 name:DVT2 : Detection of write to DEVENT with DVT2 set
++event:0x97 counters:0,1,2,3 um:zero minimum:500 name:DVT3 : Detection of write to DEVENT with DVT3 set
++event:0x98 counters:0,1,2,3 um:zero minimum:500 name:DVT4 : Detection of write to DEVENT with DVT4 set
++event:0x99 counters:0,1,2,3 um:zero minimum:500 name:DVT5 : Detection of write to DEVENT with DVT5 set
++event:0x9a counters:0,1,2,3 um:zero minimum:500 name:DVT6 : Detection of write to DEVENT with DVT6 set
++event:0x9b counters:0,1,2,3 um:zero minimum:500 name:DVT7 : Detection of write to DEVENT with DVT7 set
++event:0x9c counters:0,1,2,3 um:zero minimum:500 name:CYCLES_NEXUS_STALLED : Number of completion cycles stalled due to Nexus FIFO full
++event:0xb0 counters:0,1,2,3 um:zero minimum:500 name:DECORATED_LOAD : Number of decorated loads.
++event:0xb1 counters:0,1,2,3 um:zero minimum:500 name:DECORATED_STORE : Number of decorated stores
++event:0xb2 counters:0,1,2,3 um:zero minimum:500 name:LOAD_RETRY : Number of load retries
++event:0xb3 counters:0,1,2,3 um:zero minimum:500 name:STWCX_SUCCESS : Number of successful stwcx. instructions
++event:0xb4 counters:0,1,2,3 um:zero minimum:500 name:STWCX_UNSUCCESS : Number of unsuccessful stwcx. instructions
+diff --git a/events/ppc/e500mc/unit_masks b/events/ppc/e500mc/unit_masks
+new file mode 100644
+index 0000000..395c653
+--- /dev/null
++++ b/events/ppc/e500mc/unit_masks
+@@ -0,0 +1,4 @@
++# e500 possible unit masks
++#
++name:zero type:mandatory default:0x0
++	0x0 No unit mask
+diff --git a/libop/op_cpu_type.c b/libop/op_cpu_type.c
+index 89d5a92..7d50a2d 100644
+--- a/libop/op_cpu_type.c
++++ b/libop/op_cpu_type.c
+@@ -125,6 +125,7 @@ static struct cpu_descr const cpu_descrs[MAX_CPU_TYPE] = {
+ 	{ "AMD64 generic", "x86-64/generic", CPU_AMD64_GENERIC, 4 },
+ 	{ "IBM Power Architected Events V1", "ppc64/architected_events_v1", CPU_PPC64_ARCH_V1, 6 },
+ 	{ "ppc64 POWER8", "ppc64/power8", CPU_PPC64_POWER8, 6 },
++	{ "e500mc", "ppc/e500mc", CPU_PPC_E500MC, 4 },
+ };
+  
+ static size_t const nr_cpu_descrs = sizeof(cpu_descrs) / sizeof(struct cpu_descr);
+diff --git a/libop/op_cpu_type.h b/libop/op_cpu_type.h
+index aeb6bb2..10f000b 100644
+--- a/libop/op_cpu_type.h
++++ b/libop/op_cpu_type.h
+@@ -105,6 +105,7 @@ typedef enum {
+ 	CPU_AMD64_GENERIC, /**< AMD64 Generic */
+ 	CPU_PPC64_ARCH_V1, /** < IBM Power architected events version 1 */
+ 	CPU_PPC64_POWER8, /**< ppc64 POWER8 family */
++	CPU_PPC_E500MC, /**< e500mc */
+ 	MAX_CPU_TYPE
+ } op_cpu;
+ 
+diff --git a/libop/op_events.c b/libop/op_events.c
+index bb86833..638dc5c 100644
+--- a/libop/op_events.c
++++ b/libop/op_events.c
+@@ -1308,6 +1308,7 @@ void op_default_event(op_cpu cpu_type, struct op_default_event_descr * descr)
+ 
+ 		case CPU_PPC_E500:
+ 		case CPU_PPC_E500_2:
++		case CPU_PPC_E500MC:
+ 		case CPU_PPC_E300:
+ 			descr->name = "CPU_CLK";
+ 			break;
+diff --git a/utils/ophelp.c b/utils/ophelp.c
+index 1b913ca..0647360 100644
+--- a/utils/ophelp.c
++++ b/utils/ophelp.c
+@@ -753,6 +753,7 @@ int main(int argc, char const * argv[])
+ 
+ 	case CPU_PPC_E500:
+ 	case CPU_PPC_E500_2:
++	case CPU_PPC_E500MC:
+ 		event_doc =
+ 			"See PowerPC e500 Core Complex Reference Manual\n"
+ 			"Chapter 7: Performance Monitor\n"
+-- 
+1.7.3.4
+
diff --git a/meta/recipes-kernel/oprofile/oprofile/0002-Add-freescale-e6500-support.patch b/meta/recipes-kernel/oprofile/oprofile/0002-Add-freescale-e6500-support.patch
new file mode 100644
index 0000000..2c10382
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/0002-Add-freescale-e6500-support.patch
@@ -0,0 +1,364 @@
+From b91794fd855177946719b34ea5cd3822c7993caa Mon Sep 17 00:00:00 2001
+From: Ting Liu <b28495@freescale.com>
+Date: Thu, 5 Sep 2013 07:45:52 -0500
+Subject: [PATCH 2/2] Add freescale e6500 support
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+Signed-off-by: Ting Liu <b28495@freescale.com>
+---
+ events/Makefile.am          |    1 +
+ events/ppc/e6500/events     |  266 +++++++++++++++++++++++++++++++++++++++++++
+ events/ppc/e6500/unit_masks |    4 +
+ libop/op_cpu_type.c         |    1 +
+ libop/op_cpu_type.h         |    1 +
+ libop/op_events.c           |    1 +
+ utils/ophelp.c              |    1 +
+ 7 files changed, 275 insertions(+), 0 deletions(-)
+ create mode 100644 events/ppc/e6500/events
+ create mode 100644 events/ppc/e6500/unit_masks
+
+diff --git a/events/Makefile.am b/events/Makefile.am
+index e496f98..d91d44b 100644
+--- a/events/Makefile.am
++++ b/events/Makefile.am
+@@ -77,6 +77,7 @@ event_files = \
+ 	ppc/e500/events ppc/e500/unit_masks \
+ 	ppc/e500v2/events ppc/e500v2/unit_masks \
+ 	ppc/e500mc/events ppc/e500mc/unit_masks \
++	ppc/e6500/events ppc/e6500/unit_masks \
+ 	ppc/e300/events ppc/e300/unit_masks \
+ 	tile/tile64/events tile/tile64/unit_masks \
+ 	tile/tilepro/events tile/tilepro/unit_masks \
+diff --git a/events/ppc/e6500/events b/events/ppc/e6500/events
+new file mode 100644
+index 0000000..f34f82d
+--- /dev/null
++++ b/events/ppc/e6500/events
+@@ -0,0 +1,266 @@
++# e6500 Events
++#
++# Copyright (C) 2012 Freescale Semiconductor, Inc.
++#
++event:0x1 counters:0,1,2,3,4,5 um:zero minimum:100 name:CPU_CLK : Cycles
++event:0x2 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_INSNS : Completed Instructions (0, 1, or 2 per cycle)
++event:0x3 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_OPS : Completed Micro-ops
++event:0x5 counters:0,1,2,3,4,5 um:zero minimum:500 name:DECODED_OPS : Micro-ops decoded
++event:0x6 counters:0,1,2,3,4,5 um:zero minimum:500 name:TRANSITIONS_PM_EVENT : 0 to 1 transitions on the pm_event input
++event:0x7 counters:0,1,2,3,4,5 um:zero minimum:500 name:CPU_CLK_PM_EVENT : Processor cycles that occur when the pm_event input is asserted
++event:0x8 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_BRANCHES : Branch Instructions completed
++event:0x9 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_LOAD_OPS : Load micro-ops completed
++event:0xa counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_STORE_OPS : Store micro-ops completed
++event:0xb counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETION_REDIRECTS : Number of completion buffer redirects
++event:0xc counters:0,1,2,3,4,5 um:zero minimum:500 name:BRANCHES_FINISHED : Branches finished
++event:0xd counters:0,1,2,3,4,5 um:zero minimum:500 name:TAKEN_BRANCHES_FINISHED : Taken branches finished
++event:0xe counters:0,1,2,3,4,5 um:zero minimum:500 name:TAKEN_BRANCHES_FINISHED_NOT_BTB : Finished unconditional branches that miss the BTB
++event:0xf counters:0,1,2,3,4,5 um:zero minimum:500 name:BRANCHES_MISPREDICTED : Branch instructions mispredicted due to direction, target, or IAB prediction
++event:0x10 counters:0,1,2,3,4,5 um:zero minimum:500 name:BRANCHES_MISPREDICTED_DIRECTION : Branches mispredicted due to direction prediction
++event:0x11 counters:0,1,2,3,4,5 um:zero minimum:500 name:BTB_HITS : Branches that hit in the BTB, or missed but are not taken
++event:0x12 counters:0,1,2,3,4,5 um:zero minimum:500 name:DECODE_STALLED : Cycles the instruction buffer was not empty, but 0 instructions decoded
++event:0x13 counters:0,1,2,3,4,5 um:zero minimum:500 name:ISSUE_STALLED : Cycles the SFX/CFX issue queue is not empty but 0 instructions issued
++event:0x14 counters:0,1,2,3,4,5 um:zero minimum:500 name:BRANCH_ISSUE_STALLED : Cycles the branch buffer is not empty but 0 instructions issued
++event:0x15 counters:0,1,2,3,4,5 um:zero minimum:500 name:SFX0_SCHEDULE_STALLED : Cycles SFX0 is not empty but 0 instructions scheduled
++event:0x16 counters:0,1,2,3,4,5 um:zero minimum:500 name:SFX1_SCHEDULE_STALLED : Cycles SFX1 is not empty but 0 instructions scheduled
++event:0x17 counters:0,1,2,3,4,5 um:zero minimum:500 name:CFX_SCHEDULE_STALLED : Cycles CFX is not empty but 0 instructions scheduled
++event:0x18 counters:0,1,2,3,4,5 um:zero minimum:500 name:LSU_SCHEDULE_STALLED : Cycles LSU is not empty but 0 instructions scheduled
++event:0x19 counters:0,1,2,3,4,5 um:zero minimum:500 name:BU_SCHEDULE_STALLED : Cycles BU is not empty but 0 instructions scheduled
++event:0x1a counters:0,1,2,3,4,5 um:zero minimum:500 name:TOTAL_TRANSLATED : Total LSU micro-ops that reach the second stage of the LSU
++event:0x1b counters:0,1,2,3,4,5 um:zero minimum:500 name:LOADS_TRANSLATED : Cacheable load micro-ops translated.1 (Does not include WT)
++event:0x1c counters:0,1,2,3,4,5 um:zero minimum:500 name:STORES_TRANSLATED : Cacheable store micro-ops translated.1 (Does not include WT)
++event:0x1d counters:0,1,2,3,4,5 um:zero minimum:500 name:TOUCHES_TRANSLATED : Cacheable touch instructions translated. Includes: dcbt / dcbtep dcbtst / dcbtstep icbt ct=2
++event:0x1e counters:0,1,2,3,4,5 um:zero minimum:500 name:CACHEOPS_TRANSLATED : Number of dcba, dcbf, dcbst, and dcbz instructions translated (e500 traps on dcbi)
++event:0x1f counters:0,1,2,3,4,5 um:zero minimum:500 name:CACHEINHIBITED_ACCESSES_TRANSLATED : Number of cache inhibited accesses translated
++event:0x20 counters:0,1,2,3,4,5 um:zero minimum:500 name:GUARDED_LOADS_TRANSLATED : Number of guarded loads translated
++event:0x21 counters:0,1,2,3,4,5 um:zero minimum:500 name:WRITETHROUGH_STORES_TRANSLATED : Number of write-through stores translated
++event:0x22 counters:0,1,2,3,4,5 um:zero minimum:500 name:MISALIGNED_ACCESSES_TRANSLATED : Number of misaligned load or store accesses translated.
++event:0x23 counters:0,1,2,3,4,5 um:zero minimum:500 name:FETCH_2X4_HITS : Each fetch retrieves up to 8 instructions, but only the first 4 are required. This event increments if at least one instruction of the second 4 are actually used.
++event:0x24 counters:0,1,2,3,4,5 um:zero minimum:500 name:FETCH_HITS_ON_PREFETCHES : Fetch hits on instruction prefetch when the data is still in the ILFB.
++event:0x25 counters:0,1,2,3,4,5 um:zero minimum:500 name:GENERATED_FETCH_PREFETCHES : Number of prefetches generated.
++event:0x29 counters:0,1,2,3,4,5 um:zero minimum:500 name:DL1_RELOADS : This is historically used to determine dcache miss rate (along with loads/stores completed). This counts dL1 reloads for any reason.
++event:0x2c counters:0,1,2,3,4,5 um:zero minimum:500 name:LOAD_MISS_WITH_LOAD_QUEUE_FULL : Counts number of stalls; Com:52 counts cycles stalled. Includes: cacheable loads, CI loads, loadec, larx, touches, ibll, ibsl,ibllsl
++event:0x2d counters:0,1,2,3,4,5 um:zero minimum:500 name:LOAD_GUARDED_MISS_NOT_LAST_REPLAYS : Load guarded miss when the load is not yet at the bottom of the completion buffer.
++event:0x2e counters:0,1,2,3,4,5 um:zero minimum:500 name:STORE_TRANSLATED_QUEUE_FULL_REPLAYS : Translate a store when the StQ is full.
++event:0x2f counters:0,1,2,3,4,5 um:zero minimum:500 name:ADDRESS_COLLISION_REPLAYS : Address collision.
++event:0x30 counters:0,1,2,3,4,5 um:zero minimum:500 name:DTLB_MISS_REPLAYS : Counts number of stalls; Com:56 counts cycles stalled.
++event:0x31 counters:0,1,2,3,4,5 um:zero minimum:500 name:DTLB_BUSY_REPLAYS : Counts number of stalls; Com:57 counts cycles stalled.
++event:0x32 counters:0,1,2,3,4,5 um:zero minimum:500 name:SECOND_PART_MISALIGNED_AFTER_MISS_REPLAYS : Second part of misaligned access when first part missed in cache.
++event:0x34 counters:0,1,2,3,4,5 um:zero minimum:500 name:LOAD_MISS_QUEUE_FULL_CYCLES : Cycles stalled on replay condition - Load miss with load queue full.
++event:0x35 counters:0,1,2,3,4,5 um:zero minimum:500 name:LOAD_GUARDED_MISS_NOT_LAST_CYCLES : Cycles stalled on replay condition - Load guarded miss when the load is not yet at the bottom of the completion buffer.
++event:0x36 counters:0,1,2,3,4,5 um:zero minimum:500 name:STORE_TRANSLATED_QUEUE_FULL_CYCLES : Cycles stalled on replay condition - Translate a store when the StQ is full.
++event:0x37 counters:0,1,2,3,4,5 um:zero minimum:500 name:ADDRESS_COLLISION_CYCLES : Cycles stalled on replay condition - Address collision.
++event:0x38 counters:0,1,2,3,4,5 um:zero minimum:500 name:DTLB_MISS_CYCLES : Cycles stalled on replay condition - DTLB miss.
++event:0x39 counters:0,1,2,3,4,5 um:zero minimum:500 name:DTLB_BUSY_CYCLES : Cycles stalled on replay condition - DTLB busy.
++event:0x3a counters:0,1,2,3,4,5 um:zero minimum:500 name:SECOND_PART_MISALIGNED_AFTER_MISS_CYCLES : Cycles stalled on replay condition - Second part of misaligned access when first part missed in cache.
++event:0x3c counters:0,1,2,3,4,5 um:zero minimum:500 name:IL1_FETCH_RELOADS : This is historically used to determine icache miss rate (along with instructions completed) Reloads due to demand fetch.
++event:0x3d counters:0,1,2,3,4,5 um:zero minimum:500 name:FETCHES : Counts fetches that write at least one instruction to the Instruction Buffer.
++event:0x3e counters:0,1,2,3,4,5 um:zero minimum:500 name:IMMU_TLB4K_RELOADS : iMMU TLB4K reloads
++event:0x3f counters:0,1,2,3,4,5 um:zero minimum:500 name:IMMU_VSP_RELOADS : iMMU VSP reloads
++event:0x40 counters:0,1,2,3,4,5 um:zero minimum:500 name:DMMU_TLB4K_RELOADS : dMMU TLB4K reloads
++event:0x41 counters:0,1,2,3,4,5 um:zero minimum:500 name:DMMU_VSP_RELOADS : dMMU VSP reloads
++event:0x42 counters:0,1,2,3,4,5 um:zero minimum:500 name:L2MMU_MISSES : Counts iTLB/dTLB error interrupt
++event:0x43 counters:0,1,2,3,4,5 um:zero minimum:500 name:TAKEN_BRANCHES : Completed branch instructions that were taken.
++event:0x44 counters:0,1,2,3,4,5 um:zero minimum:500 name:TAKEN_BLR : Completed blr instructions that were taken.
++event:0x45 counters:0,1,2,3,4,5 um:zero minimum:500 name:BTB_TARGET_MISPREDICT : Number of target mispredicts (BTB).
++event:0x46 counters:0,1,2,3,4,5 um:zero minimum:500 name:MISPREDICT_TARGET_BLR : Number of link stack mispredicts (LS).
++event:0x47 counters:0,1,2,3,4,5 um:zero minimum:500 name:TAKEN_BTB_BUT_MISS : Number of BTB misses, but taken (BTB allocates).
++event:0x52 counters:0,1,2,3,4,5 um:zero minimum:500 name:PMC0_OVERFLOW : Counts the number of times PMC0[32] transitioned from 1 to 0.
++event:0x53 counters:0,1,2,3,4,5 um:zero minimum:500 name:PMC1_OVERFLOW : Counts the number of times PMC1[32] transitioned from 1 to 0.
++event:0x54 counters:0,1,2,3,4,5 um:zero minimum:500 name:PMC2_OVERFLOW : Counts the number of times PMC2[32] transitioned from 1 to 0.
++event:0x55 counters:0,1,2,3,4,5 um:zero minimum:500 name:PMC3_OVERFLOW : Counts the number of times PMC3[32] transitioned from 1 to 0.
++event:0x56 counters:0,1,2,3,4,5 um:zero minimum:500 name:INTERRUPTS : Number of interrupts taken
++event:0x57 counters:0,1,2,3,4,5 um:zero minimum:500 name:EXTERNAL_INTERRUPTS : Number of external input interrupts taken
++event:0x58 counters:0,1,2,3,4,5 um:zero minimum:500 name:CRITICAL_INTERRUPTS : Number of critical input interrupts taken
++event:0x59 counters:0,1,2,3,4,5 um:zero minimum:500 name:SC_TRAP_INTERRUPTS : Number of system call and trap interrupts
++event:0x5a counters:0,1,2,3,4,5 um:zero minimum:500 name:TBL_BIT_TRANS_PMGC0 : Counts transitions of the TBL bit selected by PMGC0[TBSEL].
++event:0x5b counters:0,1,2,3,4,5 um:zero minimum:500 name:PMC4_OVERFLOW : Counts the number of times PMC4[32] transitioned from 1 to 0.
++event:0x5c counters:0,1,2,3,4,5 um:zero minimum:500 name:PMC5_OVERFLOW : Counts the number of times PMC5[32] transitioned from 1 to 0.
++event:0x61 counters:0,1,2,3,4,5 um:zero minimum:500 name:L1_STASH_HIT : Stash hits in L1 Data Cache.
++event:0x63 counters:0,1,2,3,4,5 um:zero minimum:500 name:L1_STASH_REQ : Stash requests to L1 Data Cache.
++event:0x64 counters:0,1,2,3,4,5 um:zero minimum:500 name:TIMES_LSU_THREAD_PRIO_SWTICHED : Number of times the Load Store Unit thread priority switched based on resource collisions.
++event:0x65 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_THREAD_REQ_FPU_DENIED : Number of cycles both threads had Floating Point Unit requests and one was denied.
++event:0x66 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_THREAD_REQ_VPERM_DENIED : Number of cycles both threads had Altivec Permute requests and one was denied.
++event:0x67 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_THREAD_REQ_VGEN_DENIED : Number of cycles both threads had Altivec General requests and one was denied.
++event:0x68 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_THREAD_REQ_CFX_DENIED : Number of cycles both threads had Complex Fixed-Point Unit requests and one was denied.
++event:0x69 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_THREAD_REQ_FETCH_DENIED : Number of cycles both threads both threads made a Fetch request to the L1 Instruction Cache and one thread wins arbitration.
++event:0x6e counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_LSU_ISSUE_STALLED : Cycles the LSU issue queue is not empty but 0 instructions issued.
++event:0x6f counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_FPU_ISSUE_STALLED : Cycles the FPU issue queue is not empty but 0 instructions issued.
++event:0x70 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_ALTIVEC_ISSUE_STALLED : Cycles the AltiVec issue queue is not empty but 0 instructions issued.
++event:0x71 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_FPU_SCHEDULE_STALLED : Cycles FPU is not empty but 0 instructions scheduled.
++event:0x72 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_VPERM_SCHEDULE_STALLED : Cycles VPERM is not empty but 0 instructions scheduled.
++event:0x73 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_VGEN_SCHEDULE_STALLED : Cycles VGEN is not empty but 0 instructions scheduled.
++event:0x74 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_VPU_INSTRUCTION_WAIT_FOR_OPERA : Cycles VPU instruction waits for operands.
++event:0x75 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_VFPU_INSTRUCTION_WAIT_FOR_OPERA : Cycles VFPU instruction waits for operands.
++event:0x76 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_VSFX_INSTRUCTION_WAIT_FOR_OPERA : Cycles VSFX instruction waits for operands
++event:0x77 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_VCFX_INSTRUCTION_WAIT_FOR_OPERA : Cycles VCFX instruction waits for operands.
++event:0x7a counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_IB_EMPT : Number of cycles the Instruction Buffer is empty
++event:0x7b counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_IB_FULL : Number of cycles the Instruction Buffer is full enough such that fetch stops fetching.
++event:0x7c counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_CB_EMPT : Number of cycles the Completion Buffer is empty.
++event:0x7d counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_CB_FULL : Number of cycles the Completion Buffer is full enough such that decode stops.
++event:0x7e counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_PRESYNC_SI_IB : Number of cycles a pre-sync serialized instruction holds in the Instruction Buffer and is not decoded.
++event:0x7f counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_CLK_0_INSTRUCTIONS : Increments if 0 instructions (micro-ops) completed.
++event:0x80 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_CLK_1_INSTRUCTIONS : Increments if 1 instruction (micro-op) completed.
++event:0x80 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_CLK_2_INSTRUCTIONS : Increments if 2 instructions (micro-op) completed.
++event:0x88 counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_IAC5S : Every valid IAC5 detection.
++event:0x89 counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_IAC6S : Every valid IAC6 detection.
++event:0x8a counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_IAC7S : Every valid IAC7 detection.
++event:0x8b counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_IAC8S : Every valid IAC8 detection.
++event:0x8c counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_IAC1S : Every valid IAC1 detection.
++event:0x8d counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_IAC2S : Every valid IAC2 detection.
++event:0x8e counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_IAC3S : Every valid IAC3 detection.
++event:0x8f counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_IAC4S : Every valid IAC4 detection.
++event:0x90 counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_DAC1S : Every valid DAC1 detection.
++event:0x91 counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_DAC2S : Every valid DAC2 detection.
++event:0x94 counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_DVT0 : Detection of a write to DEVENT SPR with DVT0 set.
++event:0x95 counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_DVT1 : Detection of a write to DEVENT SPR with DVT1 set.
++event:0x96 counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_DVT2 : Detection of a write to DEVENT SPR with DVT2 set.
++event:0x97 counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_DVT3 : Detection of a write to DEVENT SPR with DVT3 set.
++event:0x98 counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_DVT4 : Detection of a write to DEVENT SPR with DVT4 set.
++event:0x99 counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_DVT5 : Detection of a write to DEVENT SPR with DVT5 set.
++event:0x9a counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_DVT6 : Detection of a write to DEVENT SPR with DVT6 set.
++event:0x9b counters:0,1,2,3,4,5 um:zero minimum:500 name:DETECTED_DVT7 : Detection of a write to DEVENT SPR with DVT7 set.
++event:0x9c counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_COMPLETION_STALLED : Number of completion cycles stalled due to Nexus FIFO full.
++event:0xa1 counters:0,1,2,3,4,5 um:zero minimum:500 name:FPU_FINISH : FPU finish.
++event:0xa2 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_FPU_DIV : Counts once for every cycle of divide execution. (fdivs and fdiv).
++event:0xa3 counters:0,1,2,3,4,5 um:zero minimum:500 name:FPU_DENORM_INPUT : Counts extra cycles delay due to denormalized inputs. If there is one, this is incremented 4 times, Two operands increments it 5 times. This shows the real penalty due to denorms, not just how often they occur.
++event:0xa4 counters:0,1,2,3,4,5 um:zero minimum:500 name:FPU_DENORM_OUTPUT : FPU denorm output.
++event:0xa5 counters:0,1,2,3,4,5 um:zero minimum:500 name:FPU_FPSCR_FULL_STALL : FPU FPSCR stall.
++event:0xa6 counters:0,1,2,3,4,5 um:zero minimum:500 name:FPU_PIPE_SYNC_STALL : Synchronization-op stalls: count once for each cycle that a ��break-before�� FPU is in the RS/issue stage but cannotissue. Also count once for each cycle that an FPU op is in the RS/issue stage but cannot issue due to ��break-after��: of an FPU op currently in progress.
++event:0xa7 counters:0,1,2,3,4,5 um:zero minimum:500 name:FPU_INPUT_DATA_STALL : FPU data-ready stall: cycles in which there is an op in the RS/issue stage that cannot issue because one or more of its operands is not yet available.
++event:0xa8 counters:0,1,2,3,4,5 um:zero minimum:500 name:FPU_INSTRUCTIONS_GEN_FLAG : FPU instruction sets FPSCR[FEX].
++event:0xac counters:0,1,2,3,4,5 um:zero minimum:500 name:PW20_CNT : Number of times the core enters the PW20 power management state.
++event:0xb0 counters:0,1,2,3,4,5 um:zero minimum:500 name:DECORATED_LOADS : Number of decorated loads to cache inhibited memory performed.
++event:0xb1 counters:0,1,2,3,4,5 um:zero minimum:500 name:DECORATED_STORES : Number of decorated stores to cache inhibited memory performed.
++event:0xb3 counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_INSTRUCTIONS_SUCC : Number of successful stbcx., sthcx., stwcx., or stdcx. instructions.
++event:0xb4 counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_INSTRUCTIONS_UNSUCC : Number of unsuccessful stbcx., sthcx., stwcx., or stdcx. instructions.
++event:0xb5 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_LSU_MICROOPS : Completed Load Store Unit micro-ops. Every micro-op that goes down the LSU pipe. Includes: GPR loads / GPR stores, FPR loads / FPR stores, VR loads / VR stores, Cache ops.  Memory barriers Other LSU ops (dsn, msgsnd, mvidsplt, mviwsplt, tlbilx, tlbivax, tlbsync)
++event:0xb6 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_GPR_LOADS : GPR load micro-ops completed. This event only counts once for misaligns. Note that lmw that causes a fault may end up double-counting micro-ops -- once for first pass, once for second pass.
++event:0xb7 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_GPR_STORES : GPR store micro-ops completed. This event only counts once for misaligns. Note that stmw that causes a fault may end up double-counting micro-ops -- once for first pass, once for second pass.
++event:0xb8 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_CACHEOPS : Cache ops completed. Includes: dcba / dcbal, dcbf / dcbfep, dcbi, dcblc / dcblq, dcbst / dcbstep, dcbt / dcbtep / dcbtls, dcbtst / dcbtstep / dcbtstls, dcbz / dcbzep / dcbzl / dcbzlep, icbi / icbiep, icblc / icblq., icbt / icbtls
++event:0xb9 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_MEM_BARRIERS : Memory barriers completed. Includes: msync (sync, lwsync, elemental barriers) mbar (eieio) miso.
++event:0xba counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_SFX_MICROOPS : SFX micro-ops completed.
++event:0xbb counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_SINCLK_SFX_MICROOPS : SFX single-cycle micro-ops completed.
++event:0xbc counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_DBLCLK_SFX_MICROOPS : SFX double-cycle micro-ops completed.
++event:0xbe counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_CFX_INSTRUCTIONS : CFX instructions completed.
++event:0xbf counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_SFX_CFX_INSTRUCTIONS : SFX or CFX instructions completed.
++event:0xc0 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_FPU_INSTRUCTIONS : FPU instructions completed.
++event:0xc1 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_FPR_MICROOPS_LOADS : FPR load micro-ops completed.
++event:0xc2 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_FPR_MICROOPS_STORES : FPR store micro-ops completed.
++event:0xc3 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_FPR_MICROOPS_LOADS_STORES : FPR load and store micro-ops completed.
++event:0xc4 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_FPR_SINPRECISE_LOADS_STORES : FPR single-precision load and store micro-ops completed.
++event:0xc5 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_FPR_DBLPRECISE_LOADS_STORES : FPR double-precision load and store micro-ops completed.
++event:0xc6 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_ALTIVEC_INSTRUCTIONS : AltiVec instructions completed. (non-LSU).
++event:0xc7 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_ALTIVEC_VSFX_INSTRUCTIONS : AltiVec VSFX instructions completed.
++event:0xc8 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_ALTIVEC_VCFX_INSTRUCTIONS : AltiVec VCFX instructions completed.
++event:0xc9 counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_ALTIVEC_VPU_INSTRUCTIONS : AltiVec VPU instructions completed.
++event:0xca counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_ALTIVEC_VFPU_INSTRUCTIONS : AltiVec VFPU instructions completed.
++event:0xcb counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_VR_LOADS_MICROOPS : VR load micro-ops completed.
++event:0xcc counters:0,1,2,3,4,5 um:zero minimum:500 name:COMPLETED_VR_STORES_MICROOPS : VR store micro-ops completed.
++event:0xcd counters:0,1,2,3,4,5 um:zero minimum:500 name:VSCR_SAT_SET : Number of times the saturate bit flips from 0 to 1.
++event:0xd2 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_SFX0_IDLE : Cycles Simple Fixed Point Unit 0 is idle.
++event:0xd3 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_SFX1_IDLE : Cycles Simple Fixed Point Unit 1 is idle.
++event:0xd4 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_CFX_IDLE : Cycles Complex Fixed Point Unit is idle.
++event:0xd5 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_LSU_IDLE : Cycles Load Store Unit is idle.
++event:0xd6 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_BU_IDLE : Cycles Branch Unit is idle.
++event:0xd7 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_FPU_IDLE : Cycles Floating Point Unit is idle.
++event:0xd8 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_VPU_IDLE : Cycles AltiVec Permute Unit is idle.
++event:0xd9 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_VFPU_IDLE : Cycles AltiVec Floating Point Unit is idle.
++event:0xda counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_VSFX_IDLE : Cycles AltiVec Simple Fixed Point Unit is idle.
++event:0xdb counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_VCFX_IDLE : Cycles AltiVec Complex Fixed Point Unit is idle.
++event:0xdd counters:0,1,2,3,4,5 um:zero minimum:500 name:L1_CACHE_MISSES : Data L1 cache misses. (Includes load, store, cache ops).
++event:0xde counters:0,1,2,3,4,5 um:zero minimum:500 name:L1_CACHE_LOAD_MISSES : Data L1 cache load misses.
++event:0xdf counters:0,1,2,3,4,5 um:zero minimum:500 name:L1_CACHE_STORE_MISSES : Data L1 cache store misses.
++event:0xe0 counters:0,1,2,3,4,5 um:zero minimum:500 name:LMQ_ALLOCATED_LOADS : Loads that allocate into Load Miss Queue. (Data L1 cache misses, but may not be to different cache lines).
++event:0xe1 counters:0,1,2,3,4,5 um:zero minimum:500 name:LOAD_THREAD_MISS_COLLISION : Number of times that this thread��s load hits a line that is valid for the other thread but not this thread.
++event:0xe2 counters:0,1,2,3,4,5 um:zero minimum:500 name:INTERTHREAD_STATUS_ARRAY_COLLISION : Number of times that two threads collide on status array access.
++event:0xe3 counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_SGB_ALLOC : Number of Store Gather Buffer allocates.
++event:0xe4 counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_SGB_GATHERS : Number of Store Gather Buffer gathers.
++event:0xe5 counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_SGB_OVERFLOWS : Number of Store Gather Buffer overflows. (Causes SGB full condition when additional store request is made).
++event:0xe6 counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_SGB_PROMOTIONS : Number of Store Gather Buffer promotions.
++event:0xe7 counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_SGB_INORDER_PROMOTIONS : Number of Store Gather Buffer in-order promotions. (Also includes oldest-entry timeout condition).
++event:0xe8 counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_SGB_OUTOFORDER_PROMOTIONS : Number of Store Gather Buffer out-of-order promotions.
++event:0xe9 counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_SGB_HP_PROMOTIONS : Number of Store Gather Buffer high-priority promotions. (Load hits on pending store).
++event:0xea counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_SGB_MISO_PROMOTIONS : Number of Store Gather Buffer miso promotions. promotions. (Load hits on pending store).
++event:0xeb counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_SGB_WATERMARK_PROMOTIONS : Number of Store Gather Buffer watermark promotions.
++event:0xec counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_SGB_OVERFLOW_PROMOTIONS : Number of Store Gather Buffer overflow promotions.
++event:0xed counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_DLAQ_FULL : Number of cycles the DLink Age Queue is full.
++event:0xee counters:0,1,2,3,4,5 um:zero minimum:500 name:TIMES_DLAQ_FULL : Number of times the DLink Age Queue is full.
++event:0xef counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_LRSAQ_FULL : Number of cycles the Load Reservation Set Age Queue is full.
++event:0xf0 counters:0,1,2,3,4,5 um:zero minimum:500 name:TIMES_LRSAQ_FULL : Number of times the Load Reservation Set Age Queue is full.
++event:0xf1 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_FWDAQ_FULL : Number of cycles the Forward Age Queue is full.
++event:0xf2 counters:0,1,2,3,4,5 um:zero minimum:500 name:TIMES_FWDAQ_FULL : Number of times the Forward Age Queue is full.
++event:0xf3 counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_FWD_STQ_COLLISION_TIMES : Number of times a Store Queue collision is forwardable. The following cases are not forwardable: store address + size does not contain the load, cache-inhibited store, denormalized, floating point store, stcx, guarded load.
++event:0xf4 counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_FWD_STQ_COLLISION_TIMES_DATA_RDY : Number of times a Store Queue collision is forwardable and is ready with data to forward.
++event:0xf5 counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_FWD_STQ_COLLISION_TIMES_DATA_NORDY : Number of times a Store Queue collision is forwardable but is not ready with data to forward.
++event:0xf6 counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_NOFWD_STQ_COLLISION_TIMES : Number of times a Store Queue collision is not forwardable and must wait until the store leaves the Store Queue.
++event:0xf7 counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_FWD_STQ_COLLISION_CLK : Number of cycles a Store Queue collision is forwardable. (Number of cycles from the detection of a forwardable Store Queue entry until the load is replayed in stg1).
++event:0xf8 counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_FWD_STQ_COLLISION_CLK_DATA_RDY : Number of cycles a Store Queue collision is forwardable and is ready with data to forward. (Number of cycles from the detection of a forwardable Store Queue entry with valid data until the load is replayed in stg1).
++event:0xf9 counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_FWD_STQ_COLLISION_CLK_DATA_NORDY : Number of cycles a Store Queue collision is forwardable but is not ready with data to forward. (Number of cycles from the detection of a forwardable Store Queue entry without valid data until the load is replayed in stg1).
++event:0xfa counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_NOFWD_STQ_COLLISION_CLK : Number of cycles a Store Queue collision is not forwardable and has to wait until the store leaves the Store Queue. (Number of cycles from the detection of a non-forwardable Store Queue entry until the load is replayed in stg1).
++event:0xfb counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_FALSE_EA_COLLISION : Number of times the lower 12-bits of EA matched but the upper bits did not, leading to a false load-on-store replay. Cycle penalty is 4x the number of times.
++event:0xfc counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_LSO_BUS_COLLISION : Number of LS0 result bus collisions. Cycle penalty is 3x this measurement.
++event:0xfd counters:0,1,2,3,4,5 um:zero minimum:500 name:NUM_INTERTHREAD_DBLWORKD_BANK_COLLISION : Number of inter-thread double-word bank collisions. Measures when both threads attempt to access the same double-word bank. Cycle penalty is 3x this measurement.
++event:0xfe counters:0,1,2,3,4,5 um:zero minimum:500 name:L1_CACHE_IM : Instruction L1 cache demand fetch misses. (Includes icbtls. Does not include prefetch).
++event:0x100 counters:0,1,2,3,4,5 um:zero minimum:500 name:IMMU_MISSES : Counts misses in the level 1 Instruction MMU.
++event:0x101 counters:0,1,2,3,4,5 um:zero minimum:500 name:IMMU_TLB4K_HITS : Counts hits in the level 1 Instruction MMU TLB-4K.
++event:0x102 counters:0,1,2,3,4,5 um:zero minimum:500 name:IMMU_VSP_HITS : Counts hits in the level 1 Instruction MMU VSP.
++event:0x103 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_IMMU_HW_TABLEWALK : Counts IMMU cycles spent in hardware tablewalk. This represents the cycles from the point where the L2 MMU miss occurs to when the page table walk completes with a valid translation or exception.
++event:0x104 counters:0,1,2,3,4,5 um:zero minimum:500 name:DMMU_MISSES : Counts misses in the level 1 Data MMU. (Does not count replayed operations).
++event:0x105 counters:0,1,2,3,4,5 um:zero minimum:500 name:DMMU_TLB4K_HITS : Counts hits in the level 1 Data MMU TLB-4K. (Does not count replayed operations).
++event:0x106 counters:0,1,2,3,4,5 um:zero minimum:500 name:DMMU_VSP_HITS : Counts hits in the level 1 Data MMU VSP. (Does not count replayed operations).
++event:0x107 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_DMMU_HW_TABLEWALK : Counts DMMU cycles spent in hardware tablewalk. This represents the cycles from the point where the L2 MMU miss occurs to when the page table walk completes with a valid translation or exception.
++event:0x108 counters:0,1,2,3,4,5 um:zero minimum:500 name:L2MMU_MISSES : Counts level 2 MMU misses. (Does not count misses that occur due to dcbt / dcbtst / dcba / dcbal instructions that fail translation and are no-oped. Does not count misses in L2MMU-VSP when looking up an indirect entry).
++event:0x109 counters:0,1,2,3,4,5 um:zero minimum:500 name:L2MMU_4K_HITS : Counts level 2 MMU hits in L2MMU-4K.
++event:0x10a counters:0,1,2,3,4,5 um:zero minimum:500 name:L2MMU_VSP_HITS : Counts level 2 MMU hits in L2MMU-VSP. (Does not count indirect lookups).
++event:0x10b counters:0,1,2,3,4,5 um:zero minimum:500 name:L2MMU_INDIRECT_MISSES : Counts level 2 MMU indirect misses. This represents indirect entry lookups that do not have a matching indirect entry.
++event:0x10c counters:0,1,2,3,4,5 um:zero minimum:500 name:L2MMU_INDIRECT_VALID_MISSES : Counts level 2 MMU indirect valid misses. This occurts when the indirect entry is valid, but the corresponding PTE[V] = 0 or the premissions in the PTE are not sufficient for the requested access.
++event:0x10d counters:0,1,2,3,4,5 um:zero minimum:500 name:LRAT_MISSES : Counts Logical to Real Address Translation misses. This includes LRAT misses from tlbwe instructions or from page table translations.
++event:0x110 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_LMQ_LOSE_DLINK_DUE_SGB : Cycles the Load Miss Queue loses DLINK arbitration due to the Store Gather Buffer.
++event:0x111 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_SGB_LOSE_DLINK_DUE_LMQ : Cycles the Store Gather Buffer loses DLINK arbitration due to the Load Miss Queue.
++event:0x112 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_THREAD_LOSE_DLINK_DUE_OTHER_THREAD : Cycles thread loses DLINK arbitration due to other thread: Cycles thread loses DLINK arbitration due to other thread.
++event:0x116 counters:0,1,2,3,4,5 um:zero minimum:500 name:DECODE_MASK_VALUE : One mask/value pair that allows instructions to be counted in Decode.
++event:0x1bb counters:0,1,2,3,4,5 um:zero minimum:500 name:SHR_L2_DLINK_REQ : Number of DLINK requests made from core to Shared L2.
++event:0x1bc counters:0,1,2,3,4,5 um:zero minimum:500 name:SHR_L2_ILINK_REQ : Number of ILINK requests made from core to Shared L2. (Includes instruction fetches and L2MMU hardware tablewalk requests).
++event:0x1bd counters:0,1,2,3,4,5 um:zero minimum:500 name:SHR_L2_RLINK_REQ : Number of RLINK requests made from Shared L2 to core. (back invalidates, stashes, barriers).
++event:0x1be counters:0,1,2,3,4,5 um:zero minimum:500 name:SHR_L2_BLINK_REQ : Number of BLINK requests made from Shared L2 to core. (back invalidates, stashes, barriers).
++event:0x1bf counters:0,1,2,3,4,5 um:zero minimum:500 name:SHR_L2_CLINK_REQ : Number of CLINK requests made from Shared L2 to core. (back invalidates, stashes, barriers).
++event:0x1c8 counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_HITS : Number of L2 Cache hits. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1c9 counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_MISSES : Number of L2 Cache hits. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1ca counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_DEMAND_ACCESS : Number of L2 Cache demand accesses. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1cb counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_ACCESSES : Number of L2 Cache accesses from all sources (demand, reload, snoop, etc). Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1cc counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_STORE_ALLOCATE : Number of L2 Cache store allocates. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1cd counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_INSTRUCTIONS_ACCESS : Number of L2 Cache instruction accesses. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1ce counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_DATA_ACCESS : Number of L2 Cache data accesses. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1cf counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_INSTRUCTIONS_MISSES : Number of L2 Cache instruction misses. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1d0 counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_DATA_MISSES : Number of L2 Cache data misses. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1d1 counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_HITS_PER_THREAD : Number of times this core/thread hits in the L2 Cache. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1d2 counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_MISSES_PER_THREAD : Number of times this core/thread misses in the L2 Cache. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1d3 counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_DEMAND_ACCESS_PER_THREAD : Number of times this core/thread makes a demand access to the L2 Cache. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1d4 counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_STORE_ALLOC_PER_THREAD : Number of times a store from this core/thread allocates in the L2 Cache. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1d5 counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_INSTRUCTIONS_ACCESS_PER_THREAD : Number of times an instruction from this core/thread accesses the L2 Cache. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1d6 counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_DATA_ACCESS_PER_THREAD : Number of times a data operation from this core/thread accesses the L2 Cache. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1d7 counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_INSTRUCTION_MISSES_PER_THREAD : Number of times an instruction from this core/thread misses in the L2 Cache. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1d8 counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_DATA_MISSES_PER_THREAD : Number of times a data operation from this core/thread misses in the L2 Cache. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1d9 counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_RELOAD_FROM_CORENET : Number of L2 Cache reloads from CoreNet. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1da counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_IN_STASH_REQ : Number of incoming L2 Cache stash requests. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1db counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_STASH_REQ_DOWNGRD_TO_SNOOPS : Number of incoming L2 Cache stash requests downgraded to snoops. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1dc counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_SNOOPS_HITS : Number of L2 Cache snoop hits. Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1dd counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_SNOOPS_MINT : Number of L2 Cache snoops causing MINT.
++event:0x1de counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_SNOOPS_SINT : Number of L2 Cache snoops causing SINT.
++event:0x1df counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_SNOOPS_PUSHES : Number of L2 Cache snoop pushes.
++event:0x1e0 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_BIB_STALL : Stall for Back Invalidate Buffer entry (cycles). Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1e2 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_RLT_STALL : Stall for Reload Table entry (cycles). Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1e4 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_RLFQ_STALL : Stall for Reload Fold Queue entry (cycles). Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1e6 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_DTQ_STALL : Stall for Data Transaction Queue entry (cycles). Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1e8 counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_COB_STALL : Stall for Castout Buffer entry (cycles). Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1ea counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_WDB_STALL : Stall for Write Data Buffer entry (cycles). Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1ec counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_RLDB_STALL : Stall for Reload Data Buffer entry (cycles). Counts 0, 1, 2, 3, or 4 per cycle.
++event:0x1ee counters:0,1,2,3,4,5 um:zero minimum:500 name:CLK_SNPQ_STALL : Stall for Snoop Queue entry (cycles).
++event:0x1fa counters:0,1,2,3,4,5 um:zero minimum:500 name:BIU_MASTER_REQ : Master transaction starts. (Number of AOut sent to CoreNet).
++event:0x1fb counters:0,1,2,3,4,5 um:zero minimum:500 name:BIU_MASTER_GLOBAL_REQ : Master transaction starts that are global. (Number of AOut with M=1 sent to CoreNet).
++event:0x1fc counters:0,1,2,3,4,5 um:zero minimum:500 name:BIU_MASTER_DATA_SIDE_REQ : Master transaction starts that are global. (Number of AOut with M=1 sent to CoreNet).
++event:0x1fd counters:0,1,2,3,4,5 um:zero minimum:500 name:BIU_MASTER_INSTRUCTION_SIDE_REQ : Master instruction-side transaction starts. (Number of I-side AOut sent to CoreNet).
++event:0x1fe counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_STASH_REQ : Stash request on AIn matches stash IDs for core or L2.
++event:0x1ff counters:0,1,2,3,4,5 um:zero minimum:500 name:L2_SNOOP_REQ : Externally generated snoop requests. (Number of AIn from CoreNet not from self).
++
+diff --git a/events/ppc/e6500/unit_masks b/events/ppc/e6500/unit_masks
+new file mode 100644
+index 0000000..b7e7a23
+--- /dev/null
++++ b/events/ppc/e6500/unit_masks
+@@ -0,0 +1,4 @@
++# e6500 possible unit masks
++#
++name:zero type:mandatory default:0x0
++	0x0 no unit mask
+diff --git a/libop/op_cpu_type.c b/libop/op_cpu_type.c
+index 7d50a2d..badb7ba 100644
+--- a/libop/op_cpu_type.c
++++ b/libop/op_cpu_type.c
+@@ -126,6 +126,7 @@ static struct cpu_descr const cpu_descrs[MAX_CPU_TYPE] = {
+ 	{ "IBM Power Architected Events V1", "ppc64/architected_events_v1", CPU_PPC64_ARCH_V1, 6 },
+ 	{ "ppc64 POWER8", "ppc64/power8", CPU_PPC64_POWER8, 6 },
+ 	{ "e500mc", "ppc/e500mc", CPU_PPC_E500MC, 4 },
++	{ "e6500", "ppc/e6500", CPU_PPC_E6500, 6 },
+ };
+  
+ static size_t const nr_cpu_descrs = sizeof(cpu_descrs) / sizeof(struct cpu_descr);
+diff --git a/libop/op_cpu_type.h b/libop/op_cpu_type.h
+index 10f000b..934fe9e 100644
+--- a/libop/op_cpu_type.h
++++ b/libop/op_cpu_type.h
+@@ -106,6 +106,7 @@ typedef enum {
+ 	CPU_PPC64_ARCH_V1, /** < IBM Power architected events version 1 */
+ 	CPU_PPC64_POWER8, /**< ppc64 POWER8 family */
+ 	CPU_PPC_E500MC, /**< e500mc */
++	CPU_PPC_E6500, /**< e6500 */
+ 	MAX_CPU_TYPE
+ } op_cpu;
+ 
+diff --git a/libop/op_events.c b/libop/op_events.c
+index 638dc5c..9d2aa5e 100644
+--- a/libop/op_events.c
++++ b/libop/op_events.c
+@@ -1309,6 +1309,7 @@ void op_default_event(op_cpu cpu_type, struct op_default_event_descr * descr)
+ 		case CPU_PPC_E500:
+ 		case CPU_PPC_E500_2:
+ 		case CPU_PPC_E500MC:
++		case CPU_PPC_E6500:
+ 		case CPU_PPC_E300:
+ 			descr->name = "CPU_CLK";
+ 			break;
+diff --git a/utils/ophelp.c b/utils/ophelp.c
+index 0647360..3b2896a 100644
+--- a/utils/ophelp.c
++++ b/utils/ophelp.c
+@@ -754,6 +754,7 @@ int main(int argc, char const * argv[])
+ 	case CPU_PPC_E500:
+ 	case CPU_PPC_E500_2:
+ 	case CPU_PPC_E500MC:
++	case CPU_PPC_E6500:
+ 		event_doc =
+ 			"See PowerPC e500 Core Complex Reference Manual\n"
+ 			"Chapter 7: Performance Monitor\n"
+-- 
+1.7.3.4
+
diff --git a/meta/recipes-kernel/oprofile/oprofile_0.9.9.bb b/meta/recipes-kernel/oprofile/oprofile_0.9.9.bb
index 6080a3e..63ef6af 100644
--- a/meta/recipes-kernel/oprofile/oprofile_0.9.9.bb
+++ b/meta/recipes-kernel/oprofile/oprofile_0.9.9.bb
@@ -6,6 +6,8 @@ DEPENDS_append_powerpc64 = " libpfm4"
 SRC_URI += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
             file://0001-Add-rmb-definition-for-AArch64-architecture.patch \
             file://0001-Tidy-powerpc64-bfd-target-check.patch \
+            file://0001-Add-freescale-e500mc-support.patch \
+            file://0002-Add-freescale-e6500-support.patch \
            "
 SRC_URI[md5sum] = "00aec1287da2dfffda17a9b1c0a01868"
 SRC_URI[sha256sum] = "1e523400daaba7b8d0d15269e977a08b40edfea53970774b69ae130e25117597"
-- 
1.7.3.4


