Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE25EC00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 04:04:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.38218.1674101059055357230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 20:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03833ea97a=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30J3Pi5E026190
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 20:04:18 -0800
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3vsqcdvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 20:04:18 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 20:04:18 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 20:04:17 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] glibc: explicit use the internal __time64_t type
Date: Thu, 19 Jan 2023 12:04:16 +0800
Message-ID: <20230119040416.864574-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nBKMiaeOkP5UMU3uh-7uwWNsXUGNjtL2
X-Proofpoint-ORIG-GUID: nBKMiaeOkP5UMU3uh-7uwWNsXUGNjtL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301190027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 04:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176116

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch [1] to explicit use the internal __time64_t type
to fix the issue that nscd wrongly cut /etc/hosts to be /hosts on
32bits system.

Before the patch:
  root@qemux86:~# systemctl status nscd
* nscd.service - Name Service Cache Daemon
     Loaded: loaded (/lib/systemd/system/nscd.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2022-07-25 09:17:41 UTC; 41s ago
    Process: 264 ExecStart=/usr/sbin/nscd (code=exited, status=0/SUCCESS)
   Main PID: 267 (nscd)
      Tasks: 10 (limit: 4810)
     Memory: 992.0K
     CGroup: /system.slice/nscd.service
             `-267 /usr/sbin/nscd

Jul 25 09:17:57 qemux86 nscd[267]: 267 checking for monitored file `/hosts': No such file or directory
Jul 25 09:17:59 qemux86 nscd[267]: 267 checking for monitored file `/nsswitch.conf': No such file or directory
Jul 25 09:17:59 qemux86 nscd[267]: 267 checking for monitored file `/services': No such file or directory
Jul 25 09:18:13 qemux86 nscd[267]: 267 checking for monitored file `/nsswitch.conf': No such file or directory
Jul 25 09:18:13 qemux86 nscd[267]: 267 checking for monitored file `/resolv.conf': No such file or directory
Jul 25 09:18:13 qemux86 nscd[267]: 267 checking for monitored file `/hosts': No such file or directory
Jul 25 09:18:14 qemux86 nscd[267]: 267 checking for monitored file `/nsswitch.conf': No such file or directory
Jul 25 09:18:14 qemux86 nscd[267]: 267 checking for monitored file `/services': No such file or directory
Jul 25 09:18:18 qemux86 nscd[267]: 267 checking for monitored file `/nsswitch.conf': No such file or directory
Jul 25 09:18:18 qemux86 nscd[267]: 267 checking for monitored file `/passwd': No such file or directory
Jul 25 09:18:28 qemux86 nscd[267]: 267 checking for monitored file `/nsswitch.conf': No such file or directory
Jul 25 09:18:28 qemux86 nscd[267]: 267 checking for monitored file `/resolv.conf': No such file or directory
Jul 25 09:18:28 qemux86 nscd[267]: 267 checking for monitored file `/hosts': No such file or directory

After the patch:
  root@qemux86:~# systemctl status nscd
* nscd.service - Name Service Cache Daemon
     Loaded: loaded (/lib/systemd/system/nscd.service; enabled; vendor preset: enabled)
     Active: active (running) since Wed 2022-10-26 05:24:41 UTC; 55s ago
    Process: 235 ExecStart=/usr/sbin/nscd (code=exited, status=0/SUCCESS)
   Main PID: 240 (nscd)
      Tasks: 10 (limit: 4812)
     Memory: 716.0K
     CGroup: /system.slice/nscd.service
             `- 240 /usr/sbin/nscd

Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring directory `/etc` (2)
Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring file `/etc/passwd` (1)
Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring directory `/etc` (2)
Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring file `/etc/nsswitch.conf` (6)
Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring directory `/etc` (2)
Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring file `/etc/group` (3)
Oct 26 05:24:45 qemux86 nscd[240]: 240 monitoring directory `/etc` (2)
Oct 26 05:24:58 qemux86 nscd[240]: 240 monitored file `/etc/resolv.conf` changed (mtime)
Oct 26 05:24:58 qemux86 nscd[240]: 240 monitoring file `/etc/resolv.conf` (7)
Oct 26 05:24:58 qemux86 nscd[240]: 240 monitoring directory `/etc` (2)

[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=fa4a19277842fd09a4815a986f70e0fe0903836f;hp=545eefc2f5da61801ba82b7a32ca2589b769ec90

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...time_t-on-libc-nscd-routines-BZ-2940.patch | 46 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch b/meta/recipes-core/glibc/glibc/0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch
new file mode 100644
index 0000000000..8d324a3074
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch
@@ -0,0 +1,46 @@
+From 3d89d36bb2c7f91fee0d81226234205126971eb7 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
+Date: Wed, 26 Oct 2022 12:29:18 +0800
+Subject: [PATCH] nscd: Use 64 bit time_t on libc nscd routines (BZ# 29402)
+
+Although the nscd module is built with 64 bit time_t, the routines
+linked direct to libc.so need to use the internal symbols.
+Reviewed-by: DJ Delorie <dj@redhat.com>
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=fa4a19277842fd09a4815a986f70e0fe0903836f;hp=545eefc2f5da61801ba82b7a32ca2589b769ec90]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ nscd/nscd.h          | 2 +-
+ nscd/nscd_gethst_r.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/nscd/nscd.h b/nscd/nscd.h
+index 368091aef8..f15321585b 100644
+--- a/nscd/nscd.h
++++ b/nscd/nscd.h
+@@ -65,7 +65,7 @@ typedef enum
+ struct traced_file
+ {
+   /* Tracks the last modified time of the traced file.  */
+-  time_t mtime;
++  __time64_t mtime;
+   /* Support multiple registered files per database.  */
+   struct traced_file *next;
+   int call_res_init;
+diff --git a/nscd/nscd_gethst_r.c b/nscd/nscd_gethst_r.c
+index 9becb62033..31c64275f0 100644
+--- a/nscd/nscd_gethst_r.c
++++ b/nscd/nscd_gethst_r.c
+@@ -112,7 +112,7 @@ __nscd_get_nl_timestamp (void)
+   if (map == NULL
+       || (map != NO_MAPPING
+ 	  && map->head->nscd_certainly_running == 0
+-	  && map->head->timestamp + MAPPING_TIMEOUT < time_now ()))
++	  && map->head->timestamp + MAPPING_TIMEOUT < time64_now ()))
+     map = __nscd_get_mapping (GETFDHST, "hosts", &__hst_map_handle.mapped);
+ 
+   if (map == NO_MAPPING)
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index df847e76bf..4352c6edd7 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -50,6 +50,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
+           file://0001-nscd-Use-64-bit-time_t-on-libc-nscd-routines-BZ-2940.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.32.0


