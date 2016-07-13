Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD9F46E65F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 01:19:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6D1JhO5005201
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Jul 2016 18:19:44 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 12 Jul 2016 18:19:43 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 12 Jul 2016 21:19:33 -0400
Message-ID: <f570af572fd253a06422eba719609ce6e3621b4c.1468372600.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1468372600.git.bruce.ashfield@windriver.com>
References: <cover.1468372600.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] linux-yocto/4.4: pwm and mei updates
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
X-List-Received-Date: Wed, 13 Jul 2016 01:19:43 -0000
Content-Type: text/plain

Backporting upstream mei changes, and two pwm changes from
Mika Westerberg's pwm-4.4 branch:

  pwm: lpss: Prevent on_time_div overflow on lower frequencies
  pwm: lpss: fix base_unit calculation for PWM frequency
  mei: don't use wake_up_interruptible for wr_ctrl
  mei: fix waiting for wr_ctrl for corner cases.
  mei: don't clean control queues on notify request timeout
  mei: drop global me_client_index
  mei: do not pin module if cldrv->probe() failed
  mei: bus: use scnprintf in *_show
  mei: fix format string in debug prints
  mei: fix double freeing of a cb during link reset
  mei: wd: drop AGAIN the watchdog code from the core mei driver
  mei: split amthif client init from end of clients enumeration
  mei: hbm: send immediate reply flag in enum request
  mei: bus: run rescan on me_clients list change
  mei: drop reserved host client ids
  mei: hbm: warn about fw-initiated disconnect
  mei: fixed address clients for the new platforms
  mei: fill file pointer in read cb for fixed address client
  mei: discard replies from unconnected fixed address clients
  mei: clean write queues and wake waiters on disconnect
  mei: wake blocked write on link reset
  mei: drop superfluous closing bracket from write traces
  mei: bus: fix notification event delivery
  mei: bus: fix RX event scheduling
  mei: amthif: interrupt reader on link reset
  mei: amthif: use rx_wait queue also for amthif client
  mei: amthif: drop parameter validation from mei_amthif_write
  mei: amthif: replace amthif_rd_complete_list with rd_completed
  mei: amthif: allow only one request at a time
  mei: rename variable names 'file_object' to fp
  mei: constify struct file pointer
  mei: amthif: don't drop read packets on timeout
  mei: amthif: don't copy from an empty buffer
  mei: call stop on failed char device register
  mei: fix possible integer overflow issue
  mei: debugfs: allow hbm features list dump in earlier stages
  mei: debugfs: adjust active clients print buffer
  mei: trace pci configuration space io
  watchdog: mei_wdt: re-register device on event
  watchdog: mei_wdt: register wd device only if required
  mei: bus: whitelist the watchdog client
  watchdog: mei_wdt: add status debugfs entry
  watchdog: mei_wdt: implement MEI iAMT watchdog driver
  mei: wd: drop the watchdog code from the core mei driver
  mei: drop nfc leftovers from the mei driver
  mei: always copy the read buffer if data is ready
  mei: prevent queuing new flow control credit.
  mei: bus: remove redundant uuid string in debug messages

Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Eric Ernst <eric.ernst@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 5da74c7acc24..82297d2ae587 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.14"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "62acc21a6d4492d649fd6361c9cd18b9624845c6"
+SRCREV_machine ?= "8361321fec015bc3823d01dad25db7f3af31b6d5"
 SRCREV_meta ?= "e775f4ed1e1358ce0647751e69cc54aa9d5d5d06"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index cd24a25e453c..56fcf344e900 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "06702ee20de46795634c3f4e6497a73935856c99"
-SRCREV_machine_qemuarm64 ?= "62acc21a6d4492d649fd6361c9cd18b9624845c6"
-SRCREV_machine_qemumips ?= "b7cb5132e86d30640da745b8c36727291e7109e6"
-SRCREV_machine_qemuppc ?= "62acc21a6d4492d649fd6361c9cd18b9624845c6"
-SRCREV_machine_qemux86 ?= "62acc21a6d4492d649fd6361c9cd18b9624845c6"
-SRCREV_machine_qemux86-64 ?= "62acc21a6d4492d649fd6361c9cd18b9624845c6"
-SRCREV_machine_qemumips64 ?= "53c911666987c77a3171db8291d4b6df83836620"
-SRCREV_machine ?= "62acc21a6d4492d649fd6361c9cd18b9624845c6"
+SRCREV_machine_qemuarm ?= "d1fcd96376a6ef0e8003914ea5df043ede813f92"
+SRCREV_machine_qemuarm64 ?= "8361321fec015bc3823d01dad25db7f3af31b6d5"
+SRCREV_machine_qemumips ?= "55be46bf1e4c5452a01a3e1f72a6408f38a57fc0"
+SRCREV_machine_qemuppc ?= "8361321fec015bc3823d01dad25db7f3af31b6d5"
+SRCREV_machine_qemux86 ?= "8361321fec015bc3823d01dad25db7f3af31b6d5"
+SRCREV_machine_qemux86-64 ?= "8361321fec015bc3823d01dad25db7f3af31b6d5"
+SRCREV_machine_qemumips64 ?= "f9bf508ee3fdccebe3554b968b43675cafe0a5a1"
+SRCREV_machine ?= "8361321fec015bc3823d01dad25db7f3af31b6d5"
 SRCREV_meta ?= "e775f4ed1e1358ce0647751e69cc54aa9d5d5d06"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


