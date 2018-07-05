Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A46C278803
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 06:37:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w656bECs008839
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Jul 2018 23:37:14 -0700 (PDT)
Received: from [128.224.162.149] (128.224.162.149) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 4 Jul 2018 23:37:12 -0700
To: <bruce.ashfield@gmail.com>
References: <cover.1530762357.git.dengke.du@windriver.com>
	<28c38e14f4127420c7b6984888fe102ec409631f.1530762357.git.dengke.du@windriver.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <2981b3e5-9b86-e83b-7ce8-c4ff041288d7@windriver.com>
Date: Thu, 5 Jul 2018 14:34:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <28c38e14f4127420c7b6984888fe102ec409631f.1530762357.git.dengke.du@windriver.com>
X-Originating-IP: [128.224.162.149]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 1/1] linux-yocto: add ptest support
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
X-List-Received-Date: Thu, 05 Jul 2018 06:37:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Please ignore this.


On 2018年07月05日 12:09, Dengke Du wrote:
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto/run-ptest | 144 ++++++++++++++++++++++++
>   meta/recipes-kernel/linux/linux-yocto_4.14.bb   |  15 +++
>   2 files changed, 159 insertions(+)
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto/run-ptest
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto/run-ptest b/meta/recipes-kernel/linux/linux-yocto/run-ptest
> new file mode 100644
> index 0000000..d8391b4
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto/run-ptest
> @@ -0,0 +1,144 @@
> +#!/bin/bash
> +depmod
> +touch kernel.log
> +
> +# dma-example: This module shows how to handle fifo dma operations.
> +# bytestream-example: This module shows how to create a byte stream fifo.
> +# inttype-example: This module shows how to create a int type fifo.
> +# record-example: This module shows how to create a variable sized record fifo.
> +list1=("dma-example" "bytestream-example" "inttype-example" "record-example")
> +for i in "${list1[@]}"
> +do
> +  dmesg -c
> +  modprobe "$i"
> +  mod=${i//-/_}
> +  lsmod | grep -q "$mod"
> +  if [ $? -eq 0 ];then
> +    dmesg | grep "test passed"
> +    if [ $? -eq 0 ];then
> +      echo "PASS: $i" >> kernel.log
> +    fi
> +  else
> +    echo "FAIL: $i" >> kernel.log
> +  fi
> +  rmmod "$i"
> +done
> +
> +# kobject-example:
> +/*
> + * This module shows how to create a simple subdirectory in sysfs called
> + * /sys/kernel/kobject-example  In that directory, 3 files are created:
> + * "foo", "baz", and "bar".  If an integer is written to these files, it can be
> + * later read out of it.
> + */
> +
> +# kset-example:
> +/*
> + * This module shows how to create a kset in sysfs called
> + * /sys/kernel/kset-example
> + * Then tree kobjects are created and assigned to this kset, "foo", "baz",
> + * and "bar".  In those kobjects, attributes of the same name are also
> + * created and if an integer is written to these files, it can be later
> + * read out of it.
> + */
> +
> +list2=("kobject-example" "kset-example")
> +for i in "${list2[@]}"
> +do
> +  dmesg -c
> +  modprobe "$i"
> +  mod=${i//-/_}
> +  basedir="/sys/kernel/${mod}"
> +  echo "$basedir"
> +  if [ -e ${basedir}/bar -a -e ${basedir}/baz -a -e ${basedir}/foo ];then
> +    echo "PASS: $i" >> kernel.log
> +  else
> +    echo "FAIL: $i" >> kernel.log
> +  fi
> +  rmmod "$i"
> +done
> +
> +# trace-events-sample
> +# This modules test trace-events for a thread "foo_bar", return string "foo_bar" when everything goes well.
> +list3="trace-events-sample"
> +mod=${list3//-/_}
> +modprobe "$list3"
> +lsmod | grep "$mod"
> +if [ $? -eq 0 ];then
> +  if [ -e "/sys/kernel/debug/tracing/events/sample-trace" ];then
> +    echo 1 > /sys/kernel/debug/tracing/events/sample-trace/enable
> +    sleep 5
> +    ret=`cat /sys/kernel/debug/tracing/trace | grep hello | head -n1 | cut -d':' -f2`
> +    if [ "$ret" = " foo_bar" ];then
> +      echo "PASS: $list3"  >> kernel.log
> +    else
> +      echo "FAIL: $list3" >> kernel.log
> +    fi
> +  else
> +    echo "FAIL: $list3" >> kernel.log
> +  fi
> +else
> +  echo "FAILED: $list3" >> kernel.log
> +fi
> +rmmod "$list3"
> +
> +# trace-printk
> +# This modules just a simple test for trace-printk, return string "trace_printk_irq_work" when everything goes well.
> +list4="trace-printk"
> +modprobe "$list4"
> +lsmod | grep "trace_printk"
> +if [ $? -eq 0 ];then
> +  ret=`cat /sys/kernel/debug/tracing/trace | grep trace_printk | head -n1 | cut -d':' -f2`
> +  if [ "$ret" = " trace_printk_irq_work" ];then
> +    echo "PASS: $list4" >> kernel.log
> +  else
> +    echo "FAIL: $list4" >> kernel.log
> +  fi
> +else
> +  echo "FAIL: $list4" >> kernel.log
> +fi
> +rmmod "$list4"
> +
> +# kprobe_example
> +# Here's a sample kernel module showing the use of kprobes to dump a
> +# stack trace and selected registers when _do_fork() is called.
> +list5="kprobe_example"
> +dmesg -c
> +modprobe "$list5"
> +lsmod | grep "$list5"
> +if [ $? -eq 0 ];then
> +  dmesg | grep "_do_fork"
> +  if [ $? -eq 0 ];then
> +    echo "PASS: $list5" >> kernel.log
> +  else
> +    echo "FAIL: $list5" >> kernel.log
> +  fi
> +else
> +  echo "FAIL: $list5" >> kernel.log
> +fi
> +rmmod "$list5"
> +
> +# kretprobe_example
> +# Here's a sample kernel module showing the use of return probes to
> +# report the return value and total time taken for probed function
> +# to run.
> +# When everything goes well, the result contain "_do_fork"
> +list6="kretprobe_example"
> +dmesg -c
> +modprobe "$list6"
> +lsmod | grep "$list6"
> +if [ $? -eq 0 ];then
> +  dmesg | grep "_do_fork returned"
> +  if [ $? -eq 0 ];then
> +    echo "PASS: $list6" >> kernel.log
> +  else
> +    echo "FAIL: $list6" >> kernel.log
> +  fi
> +else
> +  echo "FAIL: $list6" >> kernel.log
> +fi
> +rmmod "$list6"
> +
> +echo "#####result#####"
> +cat kernel.log
> +rm kernel.log
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
> index 0449213..4755acb 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
> @@ -45,3 +45,18 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>   KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +inherit ptest
> +SRC_URI_append = " file://run-ptest \
> +"
> +do_compile_ptest_append() {
> +	echo ${CC}
> +	echo ${CFLAGS}
> +#	oe_runmake CFLAGS="${CFLAGS} -I${RECIPE_SYSROOT}/usr/include" -C ${S}/tools/testing/selftests
> +}
> +do_install_ptest_append() {
> +	install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
> +	install -D ${S}/tools/testing/fault-injection/failcmd.sh ${D}${PTEST_PATH}/failcmd.sh
> +}
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "features/kernel-sample/kernel-sample.scc", "", d)}"


