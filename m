Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206CBCA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:59:07 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5998.1791842339553847944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=gEI/r4r4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202610122158560511b1f02a000207d0-xqrai0@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202610122158560511b1f02a000207d0
        for <openembedded-core@lists.openembedded.org>;
        Mon, 12 Oct 2026 23:58:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=KfNBtP6gWaZPnjNWnmdTrwKAiNpwnsc04jLEsY2vKAQ=;
 b=gEI/r4r4gGMpDxJGkBSH7Ixfu8PI74K+AMXSbgbsLyWCxUgi4S8Z88B63j0ILtgtNCXBIK
 uoNmuUQE4Ras6lyW6EGoxcTiquHo5nA1Zv9VYQ2l+s28+ls/wELTa43JV2SPItIJr4Z+fIhR
 k6Skc4cCe42ctizM1vm9ZNHwFYltkw1qHWxqHg8hZ7nZ/rYYp66LuwyykiX3fXyWuGgOZ8kS
 TBkFbR+J031Hn1gbVtTVVW7q+J3cNXDoKLzJDFGaYetVtTxBDKMDdjjhQGqoUZcF+M8+UZ7g
 Mv2PD+b8KqNqR3NUPnpKCctqKzeXTF6KcnoMrrDnMakqDvjD2lAxNr/g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Subject: [blacksail][PATCH] gcc: Fix for CVE-2026-102010
Date: Mon, 12 Oct 2026 23:58:44 +0200
Message-ID: <20261012215845.3847419-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 21:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247692

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

PR 127656 use-after-free in libstdc++ pbds binary heap erase_if

After reallocating the storage the m_a_entries pointer is left dangling
and the new storage is leaked. Update m_a_entries after reallocation

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-102010
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=127656
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=aaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: afc275bd17dea41c2ea6a5c73c697052c2df4e38)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/gcc/gcc-16.2.inc        |  1 +
 .../gcc/gcc/0026-CVE-2026-102010.patch        | 71 +++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-CVE-2026-102010.patch

diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtools/gcc/gcc-16.2.inc
index 818dea8ac5..3497493619 100644
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -74,6 +74,7 @@ SRC_URI = "${BASEURI} \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
            file://0001-Fix-check-for-working-assembler-gdwarf-4-option.patch \
+	   file://0026-CVE-2026-102010.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-CVE-2026-102010.patch b/meta/recipes-devtools/gcc/gcc/0026-CVE-2026-102010.patch
new file mode 100644
index 0000000000..407119c076
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-CVE-2026-102010.patch
@@ -0,0 +1,71 @@
+From aaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Fri, 25 Sep 2026 18:14:34 +0100
+Subject: [PATCH] libstdc++: Fix use-after-free in pbds binary heap
+ (CVE-2026-102010) [PR127656]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf-8
+Content-Transfer-Encoding: 8bit
+
+After reallocating the storage the m_a_entries pointer is left dangling
+and the new storage is leaked.
+
+libstdc++-v3/ChangeLog:
+
+        PR libstdc++/127656
+        * include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp
+        (erase_if): Update m_a_entries after reallocation.
+        * testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc:
+        New test.
+
+CVE: CVE-2026-102010
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=aaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6]
+
+Reviewed-by: Tomasz Kamiński <tkaminsk@redhat.com>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ .../detail/binary_heap_/erase_fn_imps.hpp     |  1 +
+ .../regression/priority_queues_erase_if.cc    | 19 +++++++++++++++++++
+ 2 files changed, 20 insertions(+)
+ create mode 100644 libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc
+
+diff --git a/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp b/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp
+index 2e70ed5c663..80d2cccbbf0 100644
+--- a/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp
++++ b/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp
+@@ -121,6 +121,7 @@ erase_if(Pred pred)
+       entry_pointer new_entries = s_entry_allocator.allocate(new_size);
+       std::copy(m_a_entries, m_a_entries + left, new_entries);
+       s_entry_allocator.deallocate(m_a_entries, m_actual_size);
++      m_a_entries = new_entries;
+       m_actual_size = new_size;
+       resize_policy::notify_arbitrary(m_actual_size);
+     }
+diff --git a/libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc b/libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc
+new file mode 100644
+index 00000000000..30b8452eff9
+--- /dev/null
++++ b/libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc
+@@ -0,0 +1,19 @@
++// { dg-do run }
++
++// CVE-2026-201020 use-after-free in binary heap erase_if
++
++#include <ext/pb_ds/priority_queue.hpp>
++
++bool is_odd(int v) { return v & 1; }
++
++int main()
++{
++  using __gnu_pbds::priority_queue;
++  using __gnu_pbds::binary_heap_tag;
++  priority_queue<int, std::less<int>, binary_heap_tag> q;
++  q.push(1);
++  q.push(2);
++  q.push(3);
++  q.erase_if(&is_odd);
++  q.clear();
++}
+-- 
+2.49.0

