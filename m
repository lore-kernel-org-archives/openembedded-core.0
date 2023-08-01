Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537FAC41513
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 09:48:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8907.1690883305600589974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 02:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7577cab25c=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3716qYQr008298
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Aug 2023 02:48:25 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s6daqrw3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 02:48:25 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 02:48:23 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 02:48:23 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] qemuppc64: Set the default memory to 512M
Date: Tue, 1 Aug 2023 17:48:23 +0800
Message-ID: <20230801094823.4007276-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: eHOzyQqUxTUeyoY--vFtJbJrmyetPeyE
X-Proofpoint-GUID: eHOzyQqUxTUeyoY--vFtJbJrmyetPeyE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_04,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=14 mlxscore=14 impostorscore=0
 mlxlogscore=78 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=14 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308010089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 09:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185226

From: Mingli Yu <mingli.yu@windriver.com>

When use 256M memory, it issues below OOM, so update the default memory
to 512M to make the runqemu "runqemu slirp nographic qemuppc64" works
well.

[   26.878923] Call Trace:
[   26.878994] [c0000000034835d0] [c00000000106e058] dump_stack_lvl+0x6c/0x9c (unreliable)
[   26.880196] [c000000003483600] [c0000000003772d8] dump_header+0x64/0x2a4
[   26.880312] [c000000003483680] [c000000000375d00] oom_kill_process+0x2e0/0x2f0
[   26.880415] [c0000000034836c0] [c0000000003767b8] out_of_memory+0x138/0x7b0
[   26.880472] [c000000003483770] [c0000000003f91c4] __alloc_pages+0xda4/0x1430
[   26.880549] [c000000003483970] [c000000000412738] alloc_pages+0xd8/0x210
[   26.880604] [c0000000034839b0] [c0000000003694e4] filemap_alloc_folio+0x104/0x1d0
[   26.880672] [c000000003483a50] [c00000000036dcec] __filemap_get_folio+0x17c/0x490
[   26.880730] [c000000003483b00] [c00000000036e184] filemap_fault+0x184/0xaa0
[   26.880782] [c000000003483bc0] [c0000000003c3700] __do_fault+0x60/0x100
[   26.880839] [c000000003483bf0] [c0000000003cb0ac] __handle_mm_fault+0xb8c/0x1010
[   26.880900] [c000000003483ce0] [c0000000003cb6f0] handle_mm_fault+0x1c0/0x290
[   26.880959] [c000000003483d30] [c00000000006c3e4] ___do_page_fault+0x284/0xa50
[   26.881042] [c000000003483de0] [c00000000006ce90] do_page_fault+0x50/0x110
[   26.881095] [c000000003483e10] [c000000000008c84] instruction_access_common_virt+0x194/0x1a0
[   26.881183] --- interrupt: 400 at 0x7fffbbbcdb08
[   26.881538] NIP:  00007fffbbbcdb08 LR: 00007fffbbb76b60 CTR: 00007fffbbbcdb08
[   26.881613] REGS: c000000003483e80 TRAP: 0400   Not tainted  (6.1.38-yocto-standard)
[   26.881710] MSR:  800000004280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48004882  XER: 20040003
[   26.881928] CFAR: 00007fffbbaae610 IRQMASK: 0
[   26.881928] GPR00: 00007fffbbb76b44 00007fffe6621060 00007fffbbcb7a00 0000000122a4b680
[   26.881928] GPR04: 0000000000000000 0000000000000002 0000000000002029 0000000000000009
[   26.881928] GPR08: 0000000000000000 0000000122a569a0 0000000000000001 0000000044004883
[   26.881928] GPR12: 00007fffbbbcdb08 00007fffbbd615e0 0000000000000000 0000000000000000
[   26.881928] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[   26.881928] GPR20: 0000000000000000 0000000000000000 00007fffe66214b8 0000000122a5e340
[   26.881928] GPR24: 000000000000074f 00007fffe6621120 000000012299d020 00007fffe662113d
[   26.881928] GPR28: 00007fffe6621100 0000000000000003 0000000000000001 0000000122972600
[   26.882587] NIP [00007fffbbbcdb08] 0x7fffbbbcdb08
[   26.882640] LR [00007fffbbb76b60] 0x7fffbbb76b60
[   26.882702] --- interrupt: 400
[   26.900248] Mem-Info:
[   26.907378] active_anon:65 inactive_anon:1134 isolated_anon:0
[   26.907378]  active_file:7 inactive_file:22 isolated_file:0
[   26.907378]  unevictable:0 dirty:0 writeback:0
[   26.907378]  slab_reclaimable:226 slab_unreclaimable:528
[   26.907378]  mapped:36 shmem:239 pagetables:67
[   26.907378]  sec_pagetables:0 bounce:0
[   26.907378]  kernel_misc_reclaimable:0
[   26.907378]  free:77 free_pcp:6 free_cma:0
[   26.907799] Node 0 active_anon:4160kB inactive_anon:72576kB active_file:448kB inactive_file:1408kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:2304kB dirty:0kB writeback:0kB shmem:15296kB writeback_tmp:0kB kernel_stack:1744kB pagetables:4288kB sec_pagetables:0kB all_unreclaimable? no
[   26.908057] Node 0 Normal free:4928kB boost:0kB min:1536kB low:1920kB high:2304kB reserved_highatomic:0KB active_anon:4160kB inactive_anon:72768kB active_file:704kB inactive_file:2048kB unevictable:0kB writepending:0kB present:262144kB managed:163008kB mlocked:0kB bounce:0kB free_pcp:448kB local_pcp:384kB free_cma:0kB
[   26.908374] lowmem_reserve[]: 0 0
[   26.908516] Node 0 Normal: 39*64kB (UM) 5*128kB (ME) 7*256kB (UE) 0*512kB 0*1024kB 0*2048kB 0*4096kB 0*8192kB 0*16384kB = 4928kB
[   26.908956] 296 total pagecache pages
[   26.909050] 0 pages in swap cache
[   26.909102] Free swap  = 0kB
[   26.909150] Total swap = 0kB
[   26.909268] 4096 pages RAM
[   26.909303] 0 pages HighMem/MovableOnly
[   26.909343] 1549 pages reserved
[   26.909453] Tasks state (memory values in pages):
[   26.909498] [  pid  ]   uid  tgid total_vm      rss pgtables_bytes swapents oom_score_adj name
[   26.909777] [    125]   998   125      104       21    22272        0             0 rpcbind
[   26.919186] [    126]     0   126      430       66    23552        0          -250 systemd-journal
[   26.919387] [    145]     0   145      471       60    23808        0         -1000 systemd-udevd
[   26.919478] [    150]   989   150      307       56    23552        0             0 systemd-resolve
[   26.919547] [    156]   988   156     1458       56    23808        0             0 systemd-timesyn
[   26.919616] [    176]     0   176       62       13    21760        0             0 atd
[   26.919676] [    177]   995   177      133       31    22528        0             0 avahi-daemon
[   26.919741] [    178]     0   178       68       15    21760        0             0 crond
[   26.919805] [    179]   996   179      126       24    22016        0          -900 dbus-daemon
[   26.919886] [    180]     0   180       89       16    22016        0             0 dhcpcd-systemd-
[   26.919952] [    181]   995   181      131       26    22272        0             0 avahi-daemon
[   26.920017] [    184]     0   184      299       52    23808        0             0 systemd-logind
[   26.920082] [    186]     0   186       89       16    22016        0             0 sshd_check_keys
[   26.920168] [    196]   990   196      328       58    23552        0             0 systemd-network
[   26.920261] [    202]   999   202       68       16    22016        0             0 dhcpcd
[   26.920322] [    203]     0   203       66       16    22016        0             0 dhcpcd
[   26.920381] [    204]   999   204       65       14    22016        0             0 dhcpcd
[   26.920450] [    205]   999   205       65       13    22016        0             0 dhcpcd
[   26.920510] [    211]   999   211       66       15    22016        0             0 dhcpcd
[   26.920570] [    212]   999   212       66       15    22016        0             0 dhcpcd
[   26.920638] [    226]     0   226     4587       67    28672        0             0 rsyslogd
[   26.920703] [    236]     0   236      142       20    22528        0             0 xinetd
[   26.920773] [    241]   997   241      338       52    24064        0             0 named
[   26.920830] [    244]   999   244       66       15    22016        0             0 dhcpcd
[   26.920890] [    245]   999   245       66       15    22016        0             0 dhcpcd
[   26.920948] [    246]     0   246       95       23    22016        0             0 dhcpcd-run-hook
[   26.921013] [    247]     0   247      354       78    23552        0             0 (agetty)
[   26.921077] [    249]     0   249      354       76    23552        0             0 (agetty)
[   26.921140] [    253]   997   253     3865      102    26112        0             0 named
[   26.921198] [    259]     0   259       89       16    22016        0             0 postfix-script
[   26.921262] [    271]     0   271       89       15    22016        0             0 postfix-script
[   26.921325] [    272]     0   272      204       30    22784        0             0 postconf
[   26.921409] [    273]     0   273       58        9    21760        0             0 sed
[   26.921490] [    274]     0   274      292       53    23296        0             0 resolvconf
[   26.921610] oom-kill:constraint=CONSTRAINT_NONE,nodemask=(null),cpuset=/,mems_allowed=0,global_oom,task_memcg=/system.slice/named.service,task=named,pid=253,uid=997
[   26.923381] Out of memory: Killed process 253 (named) total-vm:247360kB, anon-rss:5824kB, file-rss:768kB, shmem-rss:0kB, UID:997 pgtables:25kB oom_score_adj:0

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/conf/machine/qemuppc64.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
index 2fbd26a6f9..1a833a79d8 100644
--- a/meta/conf/machine/qemuppc64.conf
+++ b/meta/conf/machine/qemuppc64.conf
@@ -14,6 +14,7 @@ QB_SYSTEM_NAME = "qemu-system-ppc64"
 QB_MACHINE = "-machine pseries"
 QB_CPU = "-cpu POWER9"
 QB_SMP ?= "-smp 2"
+QB_MEM = "-m 512"
 
 QB_NFSROOTFS_EXTRA_OPT = "wsize=524288,rsize=524288"
 QB_KERNEL_CMDLINE_APPEND = "console=hvc0 nohugevmalloc"
-- 
2.25.1


