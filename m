Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57C7374616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 02:59:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4V2xWo4014074
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 19:59:33 -0700 (PDT)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 30 May 2018 19:59:32 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2018 11:08:30 +0800
Message-ID: <59e700bb0582088cba026b990ed423ab0d1e2ebe.1527735211.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527735211.git.dengke.du@windriver.com>
References: <cover.1527735211.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] linux-yocto: add ptest support
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
X-List-Received-Date: Thu, 31 May 2018 02:59:33 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-kernel/linux/files/run-ptest     | 138 ++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc     |   8 ++
 meta/recipes-kernel/linux/linux-yocto_4.14.bb |   2 +-
 3 files changed, 147 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux/files/run-ptest

diff --git a/meta/recipes-kernel/linux/files/run-ptest b/meta/recipes-kernel/linux/files/run-ptest
new file mode 100644
index 0000000..a3d9e14
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/run-ptest
@@ -0,0 +1,138 @@
+#!/bin/bash
+depmod
+touch kernel.log
+
+#dma-example bytestream-example inttype-example record-example
+list1=("dma-example" "bytestream-example" "inttype-example" "record-example")
+for i in "${list1[@]}"
+do
+  dmesg -c
+  modprobe "$i"
+  result=""
+  IFS="-" read -ra array <<< "$i"
+  len=${#array[@]}
+  if [ $len -eq 2 ];then
+    result="${array[0]}_${array[1]}"
+  elif [ $len -eq 3 ];then
+    result="${array[0]}_${array[1]}_${array[2]}"
+  fi
+  lsmod | grep -q "$result"
+  if [ $? -eq 0 ];then
+    dmesg | grep "test passed"
+    if [ $? -eq 0 ];then
+      echo "$i: PASS" >> kernel.log
+    fi
+    rmmod "$i"
+  else
+    echo "$i: FAILED" >> kernel.log
+  fi
+done
+
+#kobject-example kset-example
+list2=("kobject-example" "kset-example")
+for i in "${list2[@]}"
+do
+  dmesg -c
+  modprobe "$i"
+  result=""
+  IFS="-" read -ra array <<< "$i"
+  len=${#array[@]}
+  if [ $len -eq 2 ];then
+    result="${array[0]}_${array[1]}"
+  elif [ $len -eq 3 ];then
+    result="${array[0]}_${array[1]}_${array[2]}"
+  fi
+  basedir="/sys/kernel/${result}"
+  echo "$basedir"
+  if [ -e ${basedir}/bar -a -e ${basedir}/baz -a -e ${basedir}/foo ];then
+    echo "$i: PASS" >> kernel.log
+    rmmod "$i"
+  else
+    echo "$i: FAILED" >> kernel.log
+  fi
+done
+
+#trace-events-sample
+list3="trace-events-sample"
+result=""
+IFS="-" read -ra array <<< "$list3"
+len=${#array[@]}
+if [ $len -eq 2 ];then
+  result="${array[0]}_${array[1]}"
+elif [ $len -eq 3 ];then
+  result="${array[0]}_${array[1]}_${array[2]}"
+fi
+modprobe "$list3"
+lsmod | grep "$result"
+if [ $? -eq 0 ];then
+  if [ -e "/sys/kernel/debug/tracing/events/sample-trace" ];then
+    echo 1 > /sys/kernel/debug/tracing/events/sample-trace/enable
+    sleep 5
+    ret=`cat /sys/kernel/debug/tracing/trace | grep hello | head -n1 | cut -d':' -f2`
+    if [ "$ret" = " foo_bar" ];then
+      echo "$list3: PASS"  >> kernel.log
+    else
+      echo "$list3: FAILED-" >> kernel.log
+    fi
+  else
+    echo "$list3: FAILED--" >> kernel.log
+  fi
+else
+  echo "$list3: FAILED---" >> kernel.log
+fi
+rmmod "$list3"
+
+#trace-printk
+list4="trace-printk"
+modprobe "$list4"
+lsmod | grep "trace_printk"
+if [ $? -eq 0 ];then
+  ret=`cat /sys/kernel/debug/tracing/trace | grep trace_printk | head -n1 | cut -d':' -f2`
+  if [ "$ret" = " trace_printk_irq_work" ];then
+    echo "$list4: PASS" >> kernel.log
+    rmmod "$list4"
+  else
+    echo "$list4: FAILED" >> kernel.log
+  fi
+else
+  echo "$list4: FAILED" >> kernel.log
+fi
+rmmod "$list4"
+
+#kprobe_example
+list5="kprobe_example"
+dmesg -c
+modprobe "$list5"
+lsmod | grep "$list5"
+if [ $? -eq 0 ];then
+  dmesg | grep "_do_fork"
+  if [ $? -eq 0 ];then
+    echo "$list5: PASS" >> kernel.log
+  else
+    echo "$list5: FAILED" >> kernel.log
+  fi
+else
+  echo "$list5: FAILED" >> kernel.log
+fi
+rmmod "$list5"
+
+#kretprobe_example
+list6="kretprobe_example"
+dmesg -c
+modprobe "$list6"
+lsmod | grep "$list6"
+if [ $? -eq 0 ];then
+  dmesg | grep "_do_fork returned"
+  if [ $? -eq 0 ];then
+    echo "$list6: PASS" >> kernel.log
+  else
+    echo "$list6: FAILED" >> kernel.log
+  fi
+else
+  echo "$list6: FAILED" >> kernel.log
+fi
+rmmod "$list6"
+
+echo "#####result#####"
+cat kernel.log
+rm kernel.log
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 95ec2a2..7e1773e 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -67,3 +67,11 @@ do_install_append(){
 addtask kernel_version_sanity_check after do_kernel_metadata do_kernel_checkout before do_compile
 addtask validate_branches before do_patch after do_kernel_checkout
 addtask kernel_configcheck after do_configure before do_compile
+
+inherit ptest
+SRC_URI_append = " file://run-ptest \
+"
+do_install_ptest_append() {
+	install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
+}
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "features/kernel-sample/kernel-sample.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 16142f8..7002693 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "74f6cd2b6976e37491779fcb1bc4966d3a61492c"
 SRCREV_machine_qemux86-64 ?= "74f6cd2b6976e37491779fcb1bc4966d3a61492c"
 SRCREV_machine_qemumips64 ?= "9863b327e770b42b8c18da3e0cfaf06e8f99ae97"
 SRCREV_machine ?= "74f6cd2b6976e37491779fcb1bc4966d3a61492c"
-SRCREV_meta ?= "ea9330894eea727bd1655569b16f338976b72563"
+SRCREV_meta ?= "53336e1b7d969f21d8214ec9ceeb48fba4f99372"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
-- 
2.7.4


