Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1DD7882D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 02:40:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5E2drhS022921
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Jun 2018 19:40:24 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 13 Jun 2018 19:40:20 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Thu, 14 Jun 2018 10:49:23 +0800
Message-ID: <0c277ae8807a928932d1ec3b83042851594cb0d2.1528944217.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528944217.git.dengke.du@windriver.com>
References: <cover.1528944217.git.dengke.du@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V2 1/1] linux-yocto: add ptest support
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
X-List-Received-Date: Thu, 14 Jun 2018 02:40:45 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto/run-ptest | 138 ++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.14.bb   |   9 ++
 2 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/run-ptest

diff --git a/meta/recipes-kernel/linux/linux-yocto/run-ptest b/meta/recipes-kernel/linux/linux-yocto/run-ptest
new file mode 100644
index 0000000..6db4d93
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto/run-ptest
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
+  else
+    echo "$i: FAILED" >> kernel.log
+  fi
+  rmmod "$i"
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
+  else
+    echo "$i: FAILED" >> kernel.log
+  fi
+  rmmod "$i"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 0449213..9650ee2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -45,3 +45,12 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+inherit ptest
+SRC_URI_append = " file://run-ptest \
+"
+do_install_ptest_append() {
+        install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
+}
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "features/kernel-sample/kernel-sample.scc", "", d)}"
-- 
2.7.4


