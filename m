Return-Path: <jma1@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 579807E391
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 06:48:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4N6lfoj002847
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 23:47:56 -0700
Received: from pek-lpggp2 (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 22 May 2019 23:47:30 -0700
Received: by pek-lpggp2 (Postfix, from userid 20544)	id 84FFC7214CF; Thu, 23
	May 2019 14:29:55 +0800 (CST)
From: Jiping Ma <jiping.ma2@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 May 2019 14:29:53 +0800
Message-ID: <20190523062953.10582-2-jiping.ma2@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190523062953.10582-1-jiping.ma2@windriver.com>
References: <20190523062953.10582-1-jiping.ma2@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] qemu: IRQ Stats not shown with virsh command
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
X-List-Received-Date: Thu, 23 May 2019 06:48:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Issue: LIN10-5872

Add IRQ statistic code in kvm/i8259.c.

(LOCAL REV: NOT UPSTREAM) -- oe-core already included it.

Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
---
 ...1-kvm-i8259-support-info-pic-and-info-irq.patch |  76 +++++++++
 .../0002-i8259-use-DEBUG_IRQ_COUNT-always.patch    |  89 +++++++++++
 ...59-generalize-statistics-into-common-code.patch | 177 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.10.0.bb          |   3 +
 4 files changed, 345 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-kvm-i8259-support-info-pic-and-info-irq.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-i8259-use-DEBUG_IRQ_COUNT-always.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-i8259-generalize-statistics-into-common-code.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-kvm-i8259-support-info-pic-and-info-irq.patch b/meta/recipes-devtools/qemu/qemu/0001-kvm-i8259-support-info-pic-and-info-irq.patch
new file mode 100644
index 0000000000..1640ac403d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-kvm-i8259-support-info-pic-and-info-irq.patch
@@ -0,0 +1,76 @@
+From ba55afb7804d9d77234440b4cf00529b052e8b87 Mon Sep 17 00:00:00 2001
+From: Peter Xu <peterx@redhat.com>
+Date: Sun, 10 Dec 2017 14:38:18 +0800
+Subject: [PATCH 1/3] kvm-i8259: support "info pic" and "info irq"
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Let's leverage the i8259 common code for kvm-i8259 too.
+
+I think it's still possible that stats can lost when i8259 is in kernel
+and meanwhile when irqfd is used, e.g., by vfio or vhost devices.
+However that should be rare IMHO since they should be using MSIs mostly
+if they really want performance (that's why people use vhost and device
+assignment), and no old INTx should be used.  As long as the INTx users
+are emulated in QEMU the stats will be correct.
+
+For "info pic", it should be always accurate since we fetch kvm regs
+before dump.
+
+More importantly, it's just too simple to do this now - it's only 10+
+LOC to gain this feature.
+
+Upstream-Status: Backport
+
+Signed-off-by: Peter Xu <peterx@redhat.com>
+Message-Id: <20171210063819.14892-5-peterx@redhat.com>
+Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
+---
+ hw/i386/kvm/i8259.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/hw/i386/kvm/i8259.c b/hw/i386/kvm/i8259.c
+index 11d1b726..57abe091 100644
+--- a/hw/i386/kvm/i8259.c
++++ b/hw/i386/kvm/i8259.c
+@@ -111,6 +111,7 @@ static void kvm_pic_set_irq(void *opaque, int irq, int level)
+ {
+     int delivered;
+ 
++    pic_stat_update_irq(irq, level);
+     delivered = kvm_set_irq(kvm_state, irq, level);
+     apic_report_irq_delivered(delivered);
+ }
+@@ -139,12 +140,15 @@ static void kvm_i8259_class_init(ObjectClass *klass, void *data)
+     KVMPICClass *kpc = KVM_PIC_CLASS(klass);
+     PICCommonClass *k = PIC_COMMON_CLASS(klass);
+     DeviceClass *dc = DEVICE_CLASS(klass);
++    InterruptStatsProviderClass *ic = INTERRUPT_STATS_PROVIDER_CLASS(klass);
+ 
+     dc->reset     = kvm_pic_reset;
+     kpc->parent_realize = dc->realize;
+     dc->realize   = kvm_pic_realize;
+     k->pre_save   = kvm_pic_get;
+     k->post_load  = kvm_pic_put;
++    ic->get_statistics = pic_get_statistics;
++    ic->print_info = pic_print_info;
+ }
+ 
+ static const TypeInfo kvm_i8259_info = {
+@@ -153,6 +157,10 @@ static const TypeInfo kvm_i8259_info = {
+     .instance_size = sizeof(PICCommonState),
+     .class_init = kvm_i8259_class_init,
+     .class_size = sizeof(KVMPICClass),
++    .interfaces = (InterfaceInfo[]) {
++        { TYPE_INTERRUPT_STATS_PROVIDER },
++        { }
++    },
+ };
+ 
+ static void kvm_pic_register_types(void)
+-- 
+2.18.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0002-i8259-use-DEBUG_IRQ_COUNT-always.patch b/meta/recipes-devtools/qemu/qemu/0002-i8259-use-DEBUG_IRQ_COUNT-always.patch
new file mode 100644
index 0000000000..f6484de67e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0002-i8259-use-DEBUG_IRQ_COUNT-always.patch
@@ -0,0 +1,89 @@
+From 67cdfed7e6515e773bd5927a1a3c2860537d4d50 Mon Sep 17 00:00:00 2001
+From: Peter Xu <peterx@redhat.com>
+Date: Sun, 10 Dec 2017 14:38:16 +0800
+Subject: [PATCH 2/3] i8259: use DEBUG_IRQ_COUNT always
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It's not really scary to even enable it forever.  After all it's i8259,
+and it's even not the kernel one.
+
+Then we can remove quite a few of lines to make it cleaner.  And "info
+irq" will always work for it.
+
+Upstream-Status: Backport
+
+Signed-off-by: Peter Xu <peterx@redhat.com>
+Message-Id: <20171210063819.14892-3-peterx@redhat.com>
+Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
+---
+ hw/intc/i8259.c | 17 +----------------
+ 1 file changed, 1 insertion(+), 16 deletions(-)
+
+diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
+index fe9ecd6b..993aef9d 100644
+--- a/hw/intc/i8259.c
++++ b/hw/intc/i8259.c
+@@ -42,7 +42,6 @@
+ #endif
+ 
+ //#define DEBUG_IRQ_LATENCY
+-//#define DEBUG_IRQ_COUNT
+ 
+ #define TYPE_I8259 "isa-i8259"
+ #define PIC_CLASS(class) OBJECT_CLASS_CHECK(PICClass, (class), TYPE_I8259)
+@@ -58,12 +57,8 @@ typedef struct PICClass {
+     DeviceRealize parent_realize;
+ } PICClass;
+ 
+-#if defined(DEBUG_PIC) || defined(DEBUG_IRQ_COUNT)
+ static int irq_level[16];
+-#endif
+-#ifdef DEBUG_IRQ_COUNT
+ static uint64_t irq_count[16];
+-#endif
+ #ifdef DEBUG_IRQ_LATENCY
+ static int64_t irq_time[16];
+ #endif
+@@ -136,21 +131,15 @@ static void pic_set_irq(void *opaque, int irq, int level)
+     PICCommonState *s = opaque;
+     int mask = 1 << irq;
+ 
+-#if defined(DEBUG_PIC) || defined(DEBUG_IRQ_COUNT) || \
+-    defined(DEBUG_IRQ_LATENCY)
+     int irq_index = s->master ? irq : irq + 8;
+-#endif
+-#if defined(DEBUG_PIC) || defined(DEBUG_IRQ_COUNT)
++
+     if (level != irq_level[irq_index]) {
+         DPRINTF("pic_set_irq: irq=%d level=%d\n", irq_index, level);
+         irq_level[irq_index] = level;
+-#ifdef DEBUG_IRQ_COUNT
+         if (level == 1) {
+             irq_count[irq_index]++;
+         }
+-#endif
+     }
+-#endif
+ #ifdef DEBUG_IRQ_LATENCY
+     if (level) {
+         irq_time[irq_index] = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+@@ -258,12 +247,8 @@ static bool pic_get_statistics(InterruptStatsProvider *obj,
+     PICCommonState *s = PIC_COMMON(obj);
+ 
+     if (s->master) {
+-#ifdef DEBUG_IRQ_COUNT
+         *irq_counts = irq_count;
+         *nb_irqs = ARRAY_SIZE(irq_count);
+-#else
+-        return false;
+-#endif
+     } else {
+         *irq_counts = NULL;
+         *nb_irqs = 0;
+-- 
+2.18.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0003-i8259-generalize-statistics-into-common-code.patch b/meta/recipes-devtools/qemu/qemu/0003-i8259-generalize-statistics-into-common-code.patch
new file mode 100644
index 0000000000..bdfcf617cf
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0003-i8259-generalize-statistics-into-common-code.patch
@@ -0,0 +1,177 @@
+From 902e70eb3bf4f8148a234b80343bce236190b46e Mon Sep 17 00:00:00 2001
+From: Peter Xu <peterx@redhat.com>
+Date: Sun, 10 Dec 2017 14:38:17 +0800
+Subject: [PATCH 3/3] i8259: generalize statistics into common code
+
+It was only for userspace i8259.  Move it to general code so that
+kvm-i8259 can also use it in the future.
+
+Upstream-Status: Backport
+
+Signed-off-by: Peter Xu <peterx@redhat.com>
+Message-Id: <20171210063819.14892-4-peterx@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
+---
+ hw/intc/i8259.c                 | 37 +----------------------------
+ hw/intc/i8259_common.c          | 41 +++++++++++++++++++++++++++++++++
+ include/hw/isa/i8259_internal.h |  6 ++++-
+ 3 files changed, 47 insertions(+), 37 deletions(-)
+
+diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
+index 993aef9d..11a768ac 100644
+--- a/hw/intc/i8259.c
++++ b/hw/intc/i8259.c
+@@ -25,11 +25,9 @@
+ #include "hw/hw.h"
+ #include "hw/i386/pc.h"
+ #include "hw/isa/isa.h"
+-#include "monitor/monitor.h"
+ #include "qemu/timer.h"
+ #include "qemu/log.h"
+ #include "hw/isa/i8259_internal.h"
+-#include "hw/intc/intc.h"
+ 
+ /* debug PIC */
+ //#define DEBUG_PIC
+@@ -57,8 +55,6 @@ typedef struct PICClass {
+     DeviceRealize parent_realize;
+ } PICClass;
+ 
+-static int irq_level[16];
+-static uint64_t irq_count[16];
+ #ifdef DEBUG_IRQ_LATENCY
+ static int64_t irq_time[16];
+ #endif
+@@ -133,13 +129,7 @@ static void pic_set_irq(void *opaque, int irq, int level)
+ 
+     int irq_index = s->master ? irq : irq + 8;
+ 
+-    if (level != irq_level[irq_index]) {
+-        DPRINTF("pic_set_irq: irq=%d level=%d\n", irq_index, level);
+-        irq_level[irq_index] = level;
+-        if (level == 1) {
+-            irq_count[irq_index]++;
+-        }
+-    }
++    pic_stat_update_irq(irq_index, level);
+ #ifdef DEBUG_IRQ_LATENCY
+     if (level) {
+         irq_time[irq_index] = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+@@ -241,31 +231,6 @@ static void pic_reset(DeviceState *dev)
+     pic_init_reset(s);
+ }
+ 
+-static bool pic_get_statistics(InterruptStatsProvider *obj,
+-                               uint64_t **irq_counts, unsigned int *nb_irqs)
+-{
+-    PICCommonState *s = PIC_COMMON(obj);
+-
+-    if (s->master) {
+-        *irq_counts = irq_count;
+-        *nb_irqs = ARRAY_SIZE(irq_count);
+-    } else {
+-        *irq_counts = NULL;
+-        *nb_irqs = 0;
+-    }
+-    return true;
+-}
+-
+-static void pic_print_info(InterruptStatsProvider *obj, Monitor *mon)
+-{
+-    PICCommonState *s = PIC_COMMON(obj);
+-    monitor_printf(mon, "pic%d: irr=%02x imr=%02x isr=%02x hprio=%d "
+-                   "irq_base=%02x rr_sel=%d elcr=%02x fnm=%d\n",
+-                   s->master ? 0 : 1, s->irr, s->imr, s->isr, s->priority_add,
+-                   s->irq_base, s->read_reg_select, s->elcr,
+-                   s->special_fully_nested_mode);
+-}
+-
+ static void pic_ioport_write(void *opaque, hwaddr addr64,
+                              uint64_t val64, unsigned size)
+ {
+diff --git a/hw/intc/i8259_common.c b/hw/intc/i8259_common.c
+index c2fd563b..ae12b5ff 100644
+--- a/hw/intc/i8259_common.c
++++ b/hw/intc/i8259_common.c
+@@ -25,6 +25,10 @@
+ #include "qemu/osdep.h"
+ #include "hw/i386/pc.h"
+ #include "hw/isa/i8259_internal.h"
++#include "monitor/monitor.h"
++
++static int irq_level[16];
++static uint64_t irq_count[16];
+ 
+ void pic_reset_common(PICCommonState *s)
+ {
+@@ -96,6 +100,43 @@ ISADevice *i8259_init_chip(const char *name, ISABus *bus, bool master)
+     return isadev;
+ }
+ 
++void pic_stat_update_irq(int irq, int level)
++{
++    if (level != irq_level[irq]) {
++        irq_level[irq] = level;
++        if (level == 1) {
++            irq_count[irq]++;
++        }
++    }
++}
++
++bool pic_get_statistics(InterruptStatsProvider *obj,
++                        uint64_t **irq_counts, unsigned int *nb_irqs)
++{
++    PICCommonState *s = PIC_COMMON(obj);
++
++    if (s->master) {
++        *irq_counts = irq_count;
++        *nb_irqs = ARRAY_SIZE(irq_count);
++    } else {
++        *irq_counts = NULL;
++        *nb_irqs = 0;
++    }
++
++    return true;
++}
++
++void pic_print_info(InterruptStatsProvider *obj, Monitor *mon)
++{
++    PICCommonState *s = PIC_COMMON(obj);
++
++    monitor_printf(mon, "pic%d: irr=%02x imr=%02x isr=%02x hprio=%d "
++                   "irq_base=%02x rr_sel=%d elcr=%02x fnm=%d\n",
++                   s->master ? 0 : 1, s->irr, s->imr, s->isr, s->priority_add,
++                   s->irq_base, s->read_reg_select, s->elcr,
++                   s->special_fully_nested_mode);
++}
++
+ static const VMStateDescription vmstate_pic_common = {
+     .name = "i8259",
+     .version_id = 1,
+diff --git a/include/hw/isa/i8259_internal.h b/include/hw/isa/i8259_internal.h
+index 6954b6ec..9d5c8845 100644
+--- a/include/hw/isa/i8259_internal.h
++++ b/include/hw/isa/i8259_internal.h
+@@ -28,6 +28,7 @@
+ #include "hw/hw.h"
+ #include "hw/i386/pc.h"
+ #include "hw/isa/isa.h"
++#include "hw/intc/intc.h"
+ 
+ typedef struct PICCommonState PICCommonState;
+ 
+@@ -78,6 +79,9 @@ struct PICCommonState {
+ void pic_reset_common(PICCommonState *s);
+ 
+ ISADevice *i8259_init_chip(const char *name, ISABus *bus, bool master);
+-
++void pic_stat_update_irq(int irq, int level);
++bool pic_get_statistics(InterruptStatsProvider *obj,
++                        uint64_t **irq_counts, unsigned int *nb_irqs);
++void pic_print_info(InterruptStatsProvider *obj, Monitor *mon);
+ 
+ #endif /* QEMU_I8259_INTERNAL_H */
+-- 
+2.18.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.10.0.bb b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
index 04c575f842..7e7cd3b76b 100644
--- a/meta/recipes-devtools/qemu/qemu_2.10.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
@@ -66,6 +66,9 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://CVE-2018-19364-2.patch \
            file://CVE-2018-18849.patch \
            file://CVE-2018-19489.patch \
+           file://0001-kvm-i8259-support-info-pic-and-info-irq.patch \
+           file://0002-i8259-use-DEBUG_IRQ_COUNT-always.patch \
+           file://0003-i8259-generalize-statistics-into-common-code.patch \
            "
 
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
-- 
2.11.0


