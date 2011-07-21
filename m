Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjmWl-0007aQ-FP
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 08:14:31 +0200
Received: by yib18 with SMTP id 18so494276yib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 23:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=8yQqo2R+kBEdhiMsFSH7IrjK5MfpXiretaI+ui8dVMM=;
	b=NGLZjgixkOKKkfh801cVk2qFLg0W8yyhE8ssaIG73NLYCxrp/cCTL+0/2SQ3ku4W2u
	VUIrdX6NBSgDowOmyoxPhmbJ4WREX/8zMszUrSu/g1kttjN4VaND03dhnZV7XDD4hHsN
	MSzK8v71fJo829V/T4d/wAL0LqNKcVkMuF8g8=
Received: by 10.236.185.136 with SMTP id u8mr12403547yhm.320.1311228623965;
	Wed, 20 Jul 2011 23:10:23 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id f14sm1398877icm.3.2011.07.20.23.10.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 23:10:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 23:10:13 -0700
Message-Id: <1311228617-29732-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1311228617-29732-1-git-send-email-raj.khem@gmail.com>
References: <1311228617-29732-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/6] task-core-tools.bb: Exclude lttng-ust for x86_64/uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2011 06:14:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/tasks/task-core-tools.bb |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-tools.bb b/meta/recipes-core/tasks/task-core-tools.bb
index eed4afb..b0eb7d4 100644
--- a/meta/recipes-core/tasks/task-core-tools.bb
+++ b/meta/recipes-core/tasks/task-core-tools.bb
@@ -58,6 +58,15 @@ RRECOMMENDS_task-core-tools-profile = "\
 SYSTEMTAP = "systemtap"
 SYSTEMTAP_libc-uclibc = ""
 
+# lttng-ust uses sched_getcpu() which is not there on uclibc
+# for some of the architectures it can be patched to call the
+# syscall directly but for x86_64 __NR_getcpu is a vsyscall
+# which means we can not use syscall() to call it. So we ignore
+# it for x86_64/uclibc
+
+LTTNGUST = "lttng-ust"
+LTTNGUST_libc-uclibc = ""
+
 #    exmap-console
 #    exmap-server
 
@@ -66,7 +75,7 @@ SYSTEMTAP_libc-uclibc = ""
 # (which is required by lttng-ust) may not build on other platforms, like
 # MIPS.
 RDEPENDS_task-core-tools-profile_append_qemux86 = " valgrind lttng-ust ${SYSTEMTAP}"
-RDEPENDS_task-core-tools-profile_append_qemux86-64 = " lttng-ust ${SYSTEMTAP}"
+RDEPENDS_task-core-tools-profile_append_qemux86-64 = " ${LTTNGUST} ${SYSTEMTAP}"
 RDEPENDS_task-core-tools-profile_append_qemuppc = " lttng-ust ${SYSTEMTAP}"
 RDEPENDS_task-core-tools-profile_append_qemuarm = " lttng-ust"
 
-- 
1.7.4.1



