Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: TFsLCZ17HK02cCo2wRSEkfO52Nm1OfvYPbxerbl1JrDyy1iQI4ifw0GKAOTrLHdm5eJCiudm92
 PglGdUzbHcmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613675"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613675"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:36 -0800
IronPort-SDR: X5g/GdyuekQrUZgDBGa6BzNTg00SoNJBL3FoCS4/sSfGmMqUc56BgdZEd8mnK9W0yAZkBhQvdl
 jnRcDyDZsFBw==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209437"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:35 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 13/30] qemu: CVE-2020-28916
Date: Fri,  8 Jan 2021 12:17:55 +0800
Message-Id: <a89f40038f38e3698e49eab64a93eff841a43ffb.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Wang <li.wang@windriver.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-28916

backport patch from:
https://git.qemu.org/?p=qemu.git;a=commit;h=c2cb511634012344e3d0fe49a037a33b12d8a98a

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cbc20b9d8d119bfd777f83432c760dcdb94f07f9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-28916.patch            | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ecff54d61d..69b9a5f89e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-29129-CVE-2020-29130.patch \
            file://CVE-2020-25624.patch \
            file://CVE-2020-25723.patch \
+           file://CVE-2020-28916.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch
new file mode 100644
index 0000000000..5212196837
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch
@@ -0,0 +1,49 @@
+From c2cb511634012344e3d0fe49a037a33b12d8a98a Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Wed, 11 Nov 2020 18:36:36 +0530
+Subject: [PATCH] hw/net/e1000e: advance desc_offset in case of null
+descriptor
+
+While receiving packets via e1000e_write_packet_to_guest() routine,
+'desc_offset' is advanced only when RX descriptor is processed. And
+RX descriptor is not processed if it has NULL buffer address.
+This may lead to an infinite loop condition. Increament 'desc_offset'
+to process next descriptor in the ring to avoid infinite loop.
+
+Reported-by: Cheol-woo Myung <330cjfdn@gmail.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-28916
+[https://git.qemu.org/?p=qemu.git;a=commit;h=c2cb511634012344e3d0fe49a037a33b12d8a98a]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ hw/net/e1000e_core.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
+index bcd186c..d3e3cdc 100644
+--- a/hw/net/e1000e_core.c
++++ b/hw/net/e1000e_core.c
+@@ -1596,13 +1596,13 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
+                           (const char *) &fcs_pad, e1000x_fcs_len(core->mac));
+                 }
+             }
+-            desc_offset += desc_size;
+-            if (desc_offset >= total_size) {
+-                is_last = true;
+-            }
+         } else { /* as per intel docs; skip descriptors with null buf addr */
+             trace_e1000e_rx_null_descriptor();
+         }
++        desc_offset += desc_size;
++        if (desc_offset >= total_size) {
++            is_last = true;
++        }
+ 
+         e1000e_write_rx_descr(core, desc, is_last ? core->rx_pkt : NULL,
+                            rss_info, do_ps ? ps_hdr_len : 0, &bastate.written);
+-- 
+2.17.1
+
-- 
2.29.2

