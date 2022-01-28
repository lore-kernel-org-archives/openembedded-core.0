Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA57C433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 09:07:24 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.4820.1643360842820645152
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 01:07:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20S97LxR003535
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 01:07:22 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20S97Kgt019865
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 01:07:21 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 28 Jan 2022 01:07:20 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 28 Jan 2022 01:07:19 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 28 Jan 2022 01:07:19 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] mdadm: fix testcase 00multipath failure
Date: Fri, 28 Jan 2022 17:07:18 +0800
Message-ID: <20220128090718.35339-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 09:07:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161073

From: Changqing Li <changqing.li@windriver.com>

After upgrade to 4.2, mdadm's testcase 00multipath failed,
because a bug in 4.2 makes "-r" not work in manage mode.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...parsing-of-r-in-monitor-manager-mode.patch | 74 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Fix-parsing-of-r-in-monitor-manager-mode.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-parsing-of-r-in-monitor-manager-mode.patch b/meta/recipes-extended/mdadm/files/0001-Fix-parsing-of-r-in-monitor-manager-mode.patch
new file mode 100644
index 0000000000..3fb46cc60a
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Fix-parsing-of-r-in-monitor-manager-mode.patch
@@ -0,0 +1,74 @@
+From 969fbb35e40100f599d4a9781911251f21792698 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 27 Jan 2022 17:53:01 +0800
+Subject: [PATCH] Fix parsing of "-r" in monitor/manager mode
+
+This revert commit 546047688e1 [mdadm: fix coredump of mdadm --monitor
+-r], and fix the coredump issue of 'mdadm --monitor -r'.
+
+commit 546047688e1 make -r not work in manager mode, and testcase
+00multipath failed.
+
+Upstream-Status: Submitted [send to maintainer jsorensen@fb.com]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ ReadMe.c | 8 +++++---
+ mdadm.c  | 2 ++
+ mdadm.h  | 1 +
+ 3 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/ReadMe.c b/ReadMe.c
+index 8139976..070eea5 100644
+--- a/ReadMe.c
++++ b/ReadMe.c
+@@ -81,11 +81,13 @@ char Version[] = "mdadm - v" VERSION " - " VERS_DATE EXTRAVERSION "\n";
+  *     found, it is started.
+  */
+ 
+-char short_options[]="-ABCDEFGIQhVXYWZ:vqbc:i:l:p:m:r:n:x:u:c:d:z:U:N:safRSow1tye:k";
++char short_options[]="-ABCDEFGIQhVXYWZ:vqbc:i:l:p:m:n:x:u:c:d:z:U:N:sarfRSow1tye:k:";
+ char short_bitmap_options[]=
+-		"-ABCDEFGIQhVXYWZ:vqb:c:i:l:p:m:r:n:x:u:c:d:z:U:N:sarfRSow1tye:k:";
++			"-ABCDEFGIQhVXYWZ:vqb:c:i:l:p:m:n:x:u:c:d:z:U:N:sarfRSow1tye:k:";
+ char short_bitmap_auto_options[]=
+-		"-ABCDEFGIQhVXYWZ:vqb:c:i:l:p:m:r:n:x:u:c:d:z:U:N:sa:rfRSow1tye:k:";
++			"-ABCDEFGIQhVXYWZ:vqb:c:i:l:p:m:n:x:u:c:d:z:U:N:sa:rfRSow1tye:k:";
++char short_increment_options[]=
++			"-ABCDEFGIQhVXYWZ:vqbc:i:l:r:p:m:n:x:u:c:d:z:U:N:safRSow1tye:k:";
+ 
+ struct option long_options[] = {
+     {"manage",    0, 0, ManageOpt},
+diff --git a/mdadm.c b/mdadm.c
+index 26299b2..2a3b2ee 100644
+--- a/mdadm.c
++++ b/mdadm.c
+@@ -227,6 +227,7 @@ int main(int argc, char *argv[])
+ 			shortopt = short_bitmap_auto_options;
+ 			break;
+ 		case 'F': newmode = MONITOR;
++			shortopt = short_increment_options;
+ 			break;
+ 		case 'G': newmode = GROW;
+ 			shortopt = short_bitmap_options;
+@@ -268,6 +269,7 @@ int main(int argc, char *argv[])
+ 
+ 		case NoSharing:
+ 			newmode = MONITOR;
++			shortopt = short_increment_options;
+ 			break;
+ 		}
+ 		if (mode && newmode == mode) {
+diff --git a/mdadm.h b/mdadm.h
+index ecfc137..42148dd 100644
+--- a/mdadm.h
++++ b/mdadm.h
+@@ -421,6 +421,7 @@ enum mode {
+ extern char short_options[];
+ extern char short_bitmap_options[];
+ extern char short_bitmap_auto_options[];
++extern char short_increment_options[];
+ extern struct option long_options[];
+ extern char Version[], Usage[], Help[], OptionHelp[],
+ 	*mode_help[],
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index fa51364283..e3bbb4cf33 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -22,6 +22,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
            file://include_sysmacros.patch \
            file://0001-mdadm-skip-test-11spare-migration.patch \
+           file://0001-Fix-parsing-of-r-in-monitor-manager-mode.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
-- 
2.17.1


