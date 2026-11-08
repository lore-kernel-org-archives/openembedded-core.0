Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.411.1794156671209416123
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 08:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ewPSPSLu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2026110816510748229c408f000207f8-w_qvzg@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2026110816510748229c408f000207f8
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Nov 2026 17:51:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=DBIHlGAIPlVRbMTq5W6WKdh8YpV0HmIgeJWMV/cf1YE=;
 b=ewPSPSLu61JdSCdXM5CQOiN7+TbR77FabdXgZ0TvKOhRpJbvSrWF8TBipVaBmuZPtEotiS
 VpFrvd1+bWAyEXiSFugtVBlWa7kH4b6pqjRkNs6hF0knuSCXIhSdXmn6lLqio1praRc8GWaE
 LyS71zVPDCh99/dR0dM1ZPmBo+IYXbfGFJq/xQEnJ+3Pr6w1A/JGGtNND135b3x3YSaEMnup
 Co4hH3aWRNxjliBIlkgjEcW8wKLOkhlk0VDmWhjX2BR4bpF8SHaxHP2L1C8/a/Fl4nxPQND2
 7V2JEuW2ANcSrQeYgsBw0l3SNzSch3Ah/99+R6LBTxo7whH+afdgfNFQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] gcc: patch CVE-2026-102010
Date: Sun,  8 Nov 2026 17:51:01 +0100
Message-ID: <20261108165102.1213272-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 16:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249757
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/gcc/gcc-13.5.inc        |  1 +
 .../gcc/gcc/0028-CVE-2026-102010.patch        | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-CVE-2026-102010.patch

diff --git a/meta/recipes-devtools/gcc/gcc-13.5.inc b/meta/recipes-devtools/gcc/gcc-13.5.inc
index 13fbfa5a980..2de17a41770 100644
--- a/meta/recipes-devtools/gcc/gcc-13.5.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.5.inc
@@ -66,6 +66,7 @@ SRC_URI = "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0027-Fix-gcc-vect-module-testcases.patch \
+           file://0028-CVE-2026-102010.patch \
 "
 SRC_URI[sha256sum] = "ec3df0015ed01411f91f9a9cd5b4da3070eb1222b02fadf4133c30c090399855"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0028-CVE-2026-102010.patch b/meta/recipes-devtools/gcc/gcc/0028-CVE-2026-102010.patch
new file mode 100644
index 00000000000..3bd1afeee3d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0028-CVE-2026-102010.patch
@@ -0,0 +1,68 @@
+From aaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Fri, 25 Sep 2026 18:14:34 +0100
+Subject: [PATCH] libstdc++: Fix use-after-free in pbds binary heap
+ (CVE-2026-102010) [PR127656]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+After reallocating the storage the m_a_entries pointer is left dangling
+and the new storage is leaked.
+
+libstdc++-v3/ChangeLog:
+
+	PR libstdc++/127656
+	* include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp
+	(erase_if): Update m_a_entries after reallocation.
+	* testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc:
+	New test.
+
+Reviewed-by: Tomasz Kamiński <tkaminsk@redhat.com>
+
+CVE: CVE-2026-102010
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=aaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
