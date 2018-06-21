Return-Path: <Lei.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C57877866F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 07:01:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5L6xBHI011613
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Jun 2018 00:00:59 -0700
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 21 Jun 2018 00:00:51 -0700
To: Dengke Du <dengke.du@windriver.com>, <bruce.ashfield@gmail.com>
References: <cover.1528944217.git.dengke.du@windriver.com>
	<0c277ae8807a928932d1ec3b83042851594cb0d2.1528944217.git.dengke.du@windriver.com>
From: lei yang <lei.yang@windriver.com>
Message-ID: <760cfd91-27cc-263b-f251-0b509aaa6e66@windriver.com>
Date: Thu, 21 Jun 2018 15:03:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <0c277ae8807a928932d1ec3b83042851594cb0d2.1528944217.git.dengke.du@windriver.com>
X-Originating-IP: [128.224.162.194]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] linux-yocto: add ptest support
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
X-List-Received-Date: Thu, 21 Jun 2018 07:01:25 -0000
Content-Type: multipart/alternative;
	boundary="------------82FE2A46363D181BB85A61F7"

--------------82FE2A46363D181BB85A61F7
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年06月14日 10:49, Dengke Du wrote:
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto/run-ptest | 138 ++++++++++++++++++++++++
>   meta/recipes-kernel/linux/linux-yocto_4.14.bb   |   9 ++
>   2 files changed, 147 insertions(+)
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto/run-ptest
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto/run-ptest b/meta/recipes-kernel/linux/linux-yocto/run-ptest
> new file mode 100644
> index 0000000..6db4d93
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto/run-ptest
> @@ -0,0 +1,138 @@
> +#!/bin/bash
> +depmod
> +touch kernel.log
> +
> +#dma-example bytestream-example inttype-example record-example
> +list1=("dma-example" "bytestream-example" "inttype-example" "record-example")
> +for i in "${list1[@]}"
> +do
> +  dmesg -c
> +  modprobe "$i"
> +  result=""
> +  IFS="-" read -ra array <<< "$i"
> +  len=${#array[@]}
> +  if [ $len -eq 2 ];then
> +    result="${array[0]}_${array[1]}"
> +  elif [ $len -eq 3 ];then
> +    result="${array[0]}_${array[1]}_${array[2]}"
> +  fi

if you want to substitute "-" to "_" here, using bash pattern 
substitution will be much easier
# i="xx-yy-zz-ff"
# echo ${i//-/_}
xx_yy_zz_ff



> +  lsmod | grep -q "$result"
> +  if [ $? -eq 0 ];then
> +    dmesg | grep "test passed"
> +    if [ $? -eq 0 ];then
> +      echo "$i: PASS" >> kernel.log
> +    fi
> +  else
> +    echo "$i: FAILED" >> kernel.log
> +  fi

most ptest (but not all) result format are following the same rule

"[PASS|SKIP|FAIL]" : testname

look at here 
https://www.yoctoproject.org/docs/2.5/dev-manual/dev-manual.html#testing-packages-with-ptest

PS: unified test output matters for LAVA testparse patten.


> +  rmmod "$i"
> +done
> +
> +#kobject-example kset-example
> +list2=("kobject-example" "kset-example")
> +for i in "${list2[@]}"
> +do
> +  dmesg -c
> +  modprobe "$i"
> +  result=""
> +  IFS="-" read -ra array <<< "$i"
> +  len=${#array[@]}
> +  if [ $len -eq 2 ];then
> +    result="${array[0]}_${array[1]}"
> +  elif [ $len -eq 3 ];then
> +    result="${array[0]}_${array[1]}_${array[2]}"
> +  fi
> +  basedir="/sys/kernel/${result}"
> +  echo "$basedir"
> +  if [ -e ${basedir}/bar -a -e ${basedir}/baz -a -e ${basedir}/foo ];then
> +    echo "$i: PASS" >> kernel.log
> +  else
> +    echo "$i: FAILED" >> kernel.log
> +  fi
> +  rmmod "$i"
> +done
> +
> +#trace-events-sample
> +list3="trace-events-sample"
> +result=""
> +IFS="-" read -ra array <<< "$list3"
> +len=${#array[@]}
> +if [ $len -eq 2 ];then
> +  result="${array[0]}_${array[1]}"
> +elif [ $len -eq 3 ];then
> +  result="${array[0]}_${array[1]}_${array[2]}"
> +fi
> +modprobe "$list3"
> +lsmod | grep "$result"
> +if [ $? -eq 0 ];then
> +  if [ -e "/sys/kernel/debug/tracing/events/sample-trace" ];then
> +    echo 1 > /sys/kernel/debug/tracing/events/sample-trace/enable
> +    sleep 5
> +    ret=`cat /sys/kernel/debug/tracing/trace | grep hello | head -n1 | cut -d':' -f2`
> +    if [ "$ret" = " foo_bar" ];then
> +      echo "$list3: PASS"  >> kernel.log
> +    else
> +      echo "$list3: FAILED-" >> kernel.log
> +    fi
> +  else
> +    echo "$list3: FAILED--" >> kernel.log
> +  fi
> +else
> +  echo "$list3: FAILED---" >> kernel.log
> +fi
> +rmmod "$list3"
> +
> +#trace-printk
> +list4="trace-printk"
> +modprobe "$list4"
> +lsmod | grep "trace_printk"
> +if [ $? -eq 0 ];then
> +  ret=`cat /sys/kernel/debug/tracing/trace | grep trace_printk | head -n1 | cut -d':' -f2`
> +  if [ "$ret" = " trace_printk_irq_work" ];then
> +    echo "$list4: PASS" >> kernel.log
> +    rmmod "$list4"
> +  else
> +    echo "$list4: FAILED" >> kernel.log
> +  fi
> +else
> +  echo "$list4: FAILED" >> kernel.log
> +fi
> +rmmod "$list4"
> +
> +#kprobe_example
> +list5="kprobe_example"
> +dmesg -c
> +modprobe "$list5"
> +lsmod | grep "$list5"
> +if [ $? -eq 0 ];then
> +  dmesg | grep "_do_fork"
> +  if [ $? -eq 0 ];then
> +    echo "$list5: PASS" >> kernel.log
> +  else
> +    echo "$list5: FAILED" >> kernel.log
> +  fi
> +else
> +  echo "$list5: FAILED" >> kernel.log
> +fi
> +rmmod "$list5"
> +
> +#kretprobe_example
> +list6="kretprobe_example"
> +dmesg -c
> +modprobe "$list6"
> +lsmod | grep "$list6"
> +if [ $? -eq 0 ];then
> +  dmesg | grep "_do_fork returned"
> +  if [ $? -eq 0 ];then
> +    echo "$list6: PASS" >> kernel.log
> +  else
> +    echo "$list6: FAILED" >> kernel.log
> +  fi
> +else
> +  echo "$list6: FAILED" >> kernel.log
> +fi
> +rmmod "$list6"
> +
> +echo "#####result#####"
> +cat kernel.log
> +rm kernel.log
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
> index 0449213..9650ee2 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb

only enable ptest for linux-yocto_4.14 is not good.

we can still have one copy of run-ptest for different kernel version, 
but we need to make it works for different kernel.

To be clear, for example, linux-yocto-4.14, you might have 10 test 
cases, while in linux-yocto-4.15, you might have 12 test cases

so run-ptest might be like

a) run whatever test case we have, and the first thing is the check 
whether the test case exists,  for example, if directory 
"samples/trace_printk" exists, run it, if not , do nothing or SKIP.

or

b) maintain a test list in different  kernel recipes, run-pest would run 
the test in the given list from the  kernel recipe.

Lei

> @@ -45,3 +45,12 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>   KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +inherit ptest
> +SRC_URI_append = " file://run-ptest \
> +"
> +do_install_ptest_append() {
> +        install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
> +}
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "features/kernel-sample/kernel-sample.scc", "", d)}"


--------------82FE2A46363D181BB85A61F7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2018年06月14日 10:49, Dengke Du wrote:<br>
    </div>
    <blockquote
cite="mid:0c277ae8807a928932d1ec3b83042851594cb0d2.1528944217.git.dengke.du@windriver.com"
      type="cite">
      <pre wrap="">Signed-off-by: Dengke Du <a class="moz-txt-link-rfc2396E" href="mailto:dengke.du@windriver.com">&lt;dengke.du@windriver.com&gt;</a>
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
+  IFS="-" read -ra array &lt;&lt;&lt; "$i"
+  len=${#array[@]}
+  if [ $len -eq 2 ];then
+    result="${array[0]}_${array[1]}"
+  elif [ $len -eq 3 ];then
+    result="${array[0]}_${array[1]}_${array[2]}"
+  fi</pre>
    </blockquote>
    <br>
    if you want to substitute "-" to "_" here, using bash pattern
    substitution will be much easier<br>
    # i="xx-yy-zz-ff"<br>
    # echo ${i//-/_}<br>
    xx_yy_zz_ff<br>
    <br>
    <br>
    <br>
    <blockquote
cite="mid:0c277ae8807a928932d1ec3b83042851594cb0d2.1528944217.git.dengke.du@windriver.com"
      type="cite">
      <pre wrap="">
+  lsmod | grep -q "$result"
+  if [ $? -eq 0 ];then
+    dmesg | grep "test passed"
+    if [ $? -eq 0 ];then
+      echo "$i: PASS" &gt;&gt; kernel.log
+    fi
+  else
+    echo "$i: FAILED" &gt;&gt; kernel.log
+  fi</pre>
    </blockquote>
    <br>
    most ptest (but not all) result format are following the same rule <br>
    <br>
    "[PASS|SKIP|FAIL]" : testname <br>
    <br>
    look at here
<a class="moz-txt-link-freetext" href="https://www.yoctoproject.org/docs/2.5/dev-manual/dev-manual.html#testing-packages-with-ptest">https://www.yoctoproject.org/docs/2.5/dev-manual/dev-manual.html#testing-packages-with-ptest</a><br>
    <br>
    PS: unified test output matters for LAVA test<span class="l l-Scalar
      l-Scalar-Plain"> parse </span><span class="p p-Indicator"></span>patten.
    <br>
    <br>
    <br>
    <blockquote
cite="mid:0c277ae8807a928932d1ec3b83042851594cb0d2.1528944217.git.dengke.du@windriver.com"
      type="cite">
      <pre wrap="">
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
+  IFS="-" read -ra array &lt;&lt;&lt; "$i"
+  len=${#array[@]}
+  if [ $len -eq 2 ];then
+    result="${array[0]}_${array[1]}"
+  elif [ $len -eq 3 ];then
+    result="${array[0]}_${array[1]}_${array[2]}"
+  fi
+  basedir="/sys/kernel/${result}"
+  echo "$basedir"
+  if [ -e ${basedir}/bar -a -e ${basedir}/baz -a -e ${basedir}/foo ];then
+    echo "$i: PASS" &gt;&gt; kernel.log
+  else
+    echo "$i: FAILED" &gt;&gt; kernel.log
+  fi
+  rmmod "$i"
+done
+
+#trace-events-sample
+list3="trace-events-sample"
+result=""
+IFS="-" read -ra array &lt;&lt;&lt; "$list3"
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
+    echo 1 &gt; /sys/kernel/debug/tracing/events/sample-trace/enable
+    sleep 5
+    ret=`cat /sys/kernel/debug/tracing/trace | grep hello | head -n1 | cut -d':' -f2`
+    if [ "$ret" = " foo_bar" ];then
+      echo "$list3: PASS"  &gt;&gt; kernel.log
+    else
+      echo "$list3: FAILED-" &gt;&gt; kernel.log
+    fi
+  else
+    echo "$list3: FAILED--" &gt;&gt; kernel.log
+  fi
+else
+  echo "$list3: FAILED---" &gt;&gt; kernel.log
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
+    echo "$list4: PASS" &gt;&gt; kernel.log
+    rmmod "$list4"
+  else
+    echo "$list4: FAILED" &gt;&gt; kernel.log
+  fi
+else
+  echo "$list4: FAILED" &gt;&gt; kernel.log
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
+    echo "$list5: PASS" &gt;&gt; kernel.log
+  else
+    echo "$list5: FAILED" &gt;&gt; kernel.log
+  fi
+else
+  echo "$list5: FAILED" &gt;&gt; kernel.log
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
+    echo "$list6: PASS" &gt;&gt; kernel.log
+  else
+    echo "$list6: FAILED" &gt;&gt; kernel.log
+  fi
+else
+  echo "$list6: FAILED" &gt;&gt; kernel.log
+fi
+rmmod "$list6"
+
+echo "#####result#####"
+cat kernel.log
+rm kernel.log
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 0449213..9650ee2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb</pre>
    </blockquote>
    <br>
    only enable ptest for linux-yocto_4.14
    is not good. <br>
    <br>
    we can still have one copy of run-ptest for different kernel
    version, but we need to make it works for different kernel. <br>
    <br>
    To be clear, for example, linux-yocto-4.14, you might have 10 test
    cases, while in linux-yocto-4.15, you might have 12 test cases<br>
    <br>
    so run-ptest might be like<br>
    <br>
    a) run whatever test case we have, and the first thing is the check
    whether the test case exists,  for example, if directory
    "samples/trace_printk" exists, run it, if not , do nothing or SKIP.<br>
    <br>
    or<br>
    <br>
    b) maintain a test list in different  kernel recipes, run-pest would
    run the test in the given list from the  kernel recipe. <br>
    <br>
    Lei<br>
    <br>
    <blockquote
cite="mid:0c277ae8807a928932d1ec3b83042851594cb0d2.1528944217.git.dengke.du@windriver.com"
      type="cite">
      <pre wrap="">
@@ -45,3 +45,12 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+inherit ptest
+SRC_URI_append = <a class="moz-txt-link-rfc2396E" href="file://run-ptest\+">" file://run-ptest \
+"</a>
+do_install_ptest_append() {
+        install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
+}
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "features/kernel-sample/kernel-sample.scc", "", d)}"
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------82FE2A46363D181BB85A61F7--
