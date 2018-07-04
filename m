Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3ED278801
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 10:07:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w64A76pQ001757
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Jul 2018 03:07:06 -0700
Received: from [128.224.162.149] (128.224.162.149) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 4 Jul 2018 03:07:05 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1528944217.git.dengke.du@windriver.com>
	<0c277ae8807a928932d1ec3b83042851594cb0d2.1528944217.git.dengke.du@windriver.com>
	<CADkTA4Ok5WgoOWgBwyNbSaJg_hpN6eKPRV-1FkL9GnMsnOw2wg@mail.gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <7d36f446-99f9-03c1-165b-8c5e170ed0f9@windriver.com>
Date: Wed, 4 Jul 2018 18:04:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Ok5WgoOWgBwyNbSaJg_hpN6eKPRV-1FkL9GnMsnOw2wg@mail.gmail.com>
X-Originating-IP: [128.224.162.149]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 04 Jul 2018 10:07:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2018年06月21日 20:57, Bruce Ashfield wrote:
> My general comment still stands from v1, That I don't see a lot of
> value in creating a
> whole set of custom tests and wrappers just for ptest use.
>
> i.e. ltp already has a lot of these covered. kprobes, as do the
> built-in self tests.

The ltp doesn't contain kernel selftests, the kprobes in kernel samples 
directory just contain some easy test for kprobes.

>
> I want to be sure that we aren't creating custom wrappers that will
> need to be maintained
> for a long time.

The maintaining work very little, because the kernel samples and kernel 
selftest's change were not constantly changing very much.

>
> Comments/documentation in the script don't exist, so it is difficult
> to look at this and
> understand what it is actually trying to test. A header block and
> comments before each
> test are required.

Ok, I have complete it and will send V3.

>
> On Wed, Jun 13, 2018 at 10:49 PM, Dengke Du <dengke.du@windriver.com> wrote:
>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto/run-ptest | 138 ++++++++++++++++++++++++
>>   meta/recipes-kernel/linux/linux-yocto_4.14.bb   |   9 ++
>>   2 files changed, 147 insertions(+)
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto/run-ptest
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto/run-ptest b/meta/recipes-kernel/linux/linux-yocto/run-ptest
>> new file mode 100644
>> index 0000000..6db4d93
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/linux-yocto/run-ptest
>> @@ -0,0 +1,138 @@
>> +#!/bin/bash
>> +depmod
>> +touch kernel.log
>> +
>> +#dma-example bytestream-example inttype-example record-example
>> +list1=("dma-example" "bytestream-example" "inttype-example" "record-example")
>> +for i in "${list1[@]}"
>> +do
>> +  dmesg -c
>> +  modprobe "$i"
> All of the modprobes really should be checking for failure, I realize you are
> doing some lsmod calls and checking those, but that isn't always the case
> in this script.
>
> Cheers,
>
> Bruce
>
>> +  result=""
>> +  IFS="-" read -ra array <<< "$i"
>> +  len=${#array[@]}
>> +  if [ $len -eq 2 ];then
>> +    result="${array[0]}_${array[1]}"
>> +  elif [ $len -eq 3 ];then
>> +    result="${array[0]}_${array[1]}_${array[2]}"
>> +  fi
>> +  lsmod | grep -q "$result"
>> +  if [ $? -eq 0 ];then
>> +    dmesg | grep "test passed"
>> +    if [ $? -eq 0 ];then
>> +      echo "$i: PASS" >> kernel.log
>> +    fi
>> +  else
>> +    echo "$i: FAILED" >> kernel.log
>> +  fi
>> +  rmmod "$i"
>> +done
>> +
>> +#kobject-example kset-example
>> +list2=("kobject-example" "kset-example")
>> +for i in "${list2[@]}"
>> +do
>> +  dmesg -c
>> +  modprobe "$i"
>> +  result=""
>> +  IFS="-" read -ra array <<< "$i"
>> +  len=${#array[@]}
>> +  if [ $len -eq 2 ];then
>> +    result="${array[0]}_${array[1]}"
>> +  elif [ $len -eq 3 ];then
>> +    result="${array[0]}_${array[1]}_${array[2]}"
>> +  fi
>> +  basedir="/sys/kernel/${result}"
>> +  echo "$basedir"
>> +  if [ -e ${basedir}/bar -a -e ${basedir}/baz -a -e ${basedir}/foo ];then
>> +    echo "$i: PASS" >> kernel.log
>> +  else
>> +    echo "$i: FAILED" >> kernel.log
>> +  fi
>> +  rmmod "$i"
>> +done
>> +
>> +#trace-events-sample
>> +list3="trace-events-sample"
>> +result=""
>> +IFS="-" read -ra array <<< "$list3"
>> +len=${#array[@]}
>> +if [ $len -eq 2 ];then
>> +  result="${array[0]}_${array[1]}"
>> +elif [ $len -eq 3 ];then
>> +  result="${array[0]}_${array[1]}_${array[2]}"
>> +fi
>> +modprobe "$list3"
>> +lsmod | grep "$result"
>> +if [ $? -eq 0 ];then
>> +  if [ -e "/sys/kernel/debug/tracing/events/sample-trace" ];then
>> +    echo 1 > /sys/kernel/debug/tracing/events/sample-trace/enable
>> +    sleep 5
>> +    ret=`cat /sys/kernel/debug/tracing/trace | grep hello | head -n1 | cut -d':' -f2`
>> +    if [ "$ret" = " foo_bar" ];then
>> +      echo "$list3: PASS"  >> kernel.log
>> +    else
>> +      echo "$list3: FAILED-" >> kernel.log
>> +    fi
>> +  else
>> +    echo "$list3: FAILED--" >> kernel.log
>> +  fi
>> +else
>> +  echo "$list3: FAILED---" >> kernel.log
>> +fi
>> +rmmod "$list3"
>> +
>> +#trace-printk
>> +list4="trace-printk"
>> +modprobe "$list4"
>> +lsmod | grep "trace_printk"
>> +if [ $? -eq 0 ];then
>> +  ret=`cat /sys/kernel/debug/tracing/trace | grep trace_printk | head -n1 | cut -d':' -f2`
>> +  if [ "$ret" = " trace_printk_irq_work" ];then
>> +    echo "$list4: PASS" >> kernel.log
>> +    rmmod "$list4"
>> +  else
>> +    echo "$list4: FAILED" >> kernel.log
>> +  fi
>> +else
>> +  echo "$list4: FAILED" >> kernel.log
>> +fi
>> +rmmod "$list4"
>> +
>> +#kprobe_example
>> +list5="kprobe_example"
>> +dmesg -c
>> +modprobe "$list5"
>> +lsmod | grep "$list5"
>> +if [ $? -eq 0 ];then
>> +  dmesg | grep "_do_fork"
>> +  if [ $? -eq 0 ];then
>> +    echo "$list5: PASS" >> kernel.log
>> +  else
>> +    echo "$list5: FAILED" >> kernel.log
>> +  fi
>> +else
>> +  echo "$list5: FAILED" >> kernel.log
>> +fi
>> +rmmod "$list5"
>> +
>> +#kretprobe_example
>> +list6="kretprobe_example"
>> +dmesg -c
>> +modprobe "$list6"
>> +lsmod | grep "$list6"
>> +if [ $? -eq 0 ];then
>> +  dmesg | grep "_do_fork returned"
>> +  if [ $? -eq 0 ];then
>> +    echo "$list6: PASS" >> kernel.log
>> +  else
>> +    echo "$list6: FAILED" >> kernel.log
>> +  fi
>> +else
>> +  echo "$list6: FAILED" >> kernel.log
>> +fi
>> +rmmod "$list6"
>> +
>> +echo "#####result#####"
>> +cat kernel.log
>> +rm kernel.log
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
>> index 0449213..9650ee2 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
>> @@ -45,3 +45,12 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>   KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
>> +
>> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>> +inherit ptest
>> +SRC_URI_append = " file://run-ptest \
>> +"
>> +do_install_ptest_append() {
>> +        install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
>> +}
>> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "features/kernel-sample/kernel-sample.scc", "", d)}"
>> --
>> 2.7.4
>>
>
>


