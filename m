Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A78F74FE6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 07:55:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w517tNvF000127
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Jun 2018 00:55:23 -0700 (PDT)
Received: from [128.224.162.190] (128.224.162.190) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 1 Jun 2018 00:55:22 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1527735211.git.dengke.du@windriver.com>
	<59e700bb0582088cba026b990ed423ab0d1e2ebe.1527735211.git.dengke.du@windriver.com>
	<CADkTA4MU3Po893UfDcTeusYA0kkJdMHFHPWx3Z3RdMJS5gj8Xg@mail.gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <0b696fa7-bf61-d6f6-34a8-f63e4c827a60@windriver.com>
Date: Fri, 1 Jun 2018 15:52:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4MU3Po893UfDcTeusYA0kkJdMHFHPWx3Z3RdMJS5gj8Xg@mail.gmail.com>
X-Originating-IP: [128.224.162.190]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto: add ptest support
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
X-List-Received-Date: Fri, 01 Jun 2018 07:55:24 -0000
Content-Type: multipart/alternative;
	boundary="------------BDDDEE409D3B7BE2A8051F4F"
Content-Language: en-US

--------------BDDDEE409D3B7BE2A8051F4F
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年05月31日 12:19, Bruce Ashfield wrote:
>
>
> On Wed, May 30, 2018 at 11:08 PM, Dengke Du <dengke.du@windriver.com 
> <mailto:dengke.du@windriver.com>> wrote:
>
>     Signed-off-by: Dengke Du <dengke.du@windriver.com
>     <mailto:dengke.du@windriver.com>>
>     ---
>      meta/recipes-kernel/linux/files/run-ptest    | 138
>     ++++++++++++++++++++++++++
>
>
> Nothing else in linux-yocto uses "files", and this shouldn't either.
>
> We can't guarantee that these are version independent, so they need to 
> be in  a versioned
> kernel subdirectory.

Ok, I will put it in versioned kernel subdirectory.

>
>      meta/recipes-kernel/linux/linux-yocto.inc     |  8 ++
>      meta/recipes-kernel/linux/linux-yocto_4.14.bb
>     <http://linux-yocto_4.14.bb> |   2 +-
>      3 files changed, 147 insertions(+), 1 deletion(-)
>      create mode 100644 meta/recipes-kernel/linux/files/run-ptest
>
>     diff --git a/meta/recipes-kernel/linux/files/run-ptest
>     b/meta/recipes-kernel/linux/files/run-ptest
>     new file mode 100644
>     index 0000000..a3d9e14
>     --- /dev/null
>     +++ b/meta/recipes-kernel/linux/files/run-ptest
>     @@ -0,0 +1,138 @@
>     +#!/bin/bash
>
>
> This script should have a license and proper header file.
>
> Also, if the ptests are mainly trace/sample related, name the script 
> to indicate that.

Ok.

>
> The kernel already has a significant number of selftests, which are 
> likely better than
> these ptests. Is there any reason why they aren't being used instead ?

This is different to selftests, this ptest was based on kernel samples 
in sample directory,
those samples were some tutorial modules, the modules that we can modify 
it and learn
it(some basic kernel theory), in the end build it into our image to test 
and verification our
thought easily.

>     +depmod
>     +touch kernel.log
>     +
>     +#dma-example bytestream-example inttype-example record-example
>     +list1=("dma-example" "bytestream-example" "inttype-example"
>     "record-example")
>     +for i in "${list1[@]}"
>     +do
>     +  dmesg -c
>     +  modprobe "$i"
>     +  result=""
>     +  IFS="-" read -ra array <<< "$i"
>     +  len=${#array[@]}
>     +  if [ $len -eq 2 ];then
>     +    result="${array[0]}_${array[1]}"
>     +  elif [ $len -eq 3 ];then
>     +    result="${array[0]}_${array[1]}_${array[2]}"
>     +  fi
>     +  lsmod | grep -q "$result"
>     +  if [ $? -eq 0 ];then
>     +    dmesg | grep "test passed"
>     +    if [ $? -eq 0 ];then
>     +      echo "$i: PASS" >> kernel.log
>     +    fi
>     +    rmmod "$i"
>     +  else
>     +    echo "$i: FAILED" >> kernel.log
>     +  fi
>     +done
>     +
>     +#kobject-example kset-example
>     +list2=("kobject-example" "kset-example")
>     +for i in "${list2[@]}"
>     +do
>     +  dmesg -c
>     +  modprobe "$i"
>     +  result=""
>     +  IFS="-" read -ra array <<< "$i"
>     +  len=${#array[@]}
>     +  if [ $len -eq 2 ];then
>     +    result="${array[0]}_${array[1]}"
>     +  elif [ $len -eq 3 ];then
>     +    result="${array[0]}_${array[1]}_${array[2]}"
>     +  fi
>     +  basedir="/sys/kernel/${result}"
>     +  echo "$basedir"
>     +  if [ -e ${basedir}/bar -a -e ${basedir}/baz -a -e
>     ${basedir}/foo ];then
>     +    echo "$i: PASS" >> kernel.log
>     +    rmmod "$i"
>     +  else
>     +    echo "$i: FAILED" >> kernel.log
>     +  fi
>     +done
>     +
>     +#trace-events-sample
>     +list3="trace-events-sample"
>     +result=""
>     +IFS="-" read -ra array <<< "$list3"
>     +len=${#array[@]}
>     +if [ $len -eq 2 ];then
>     +  result="${array[0]}_${array[1]}"
>     +elif [ $len -eq 3 ];then
>     +  result="${array[0]}_${array[1]}_${array[2]}"
>     +fi
>     +modprobe "$list3"
>     +lsmod | grep "$result"
>     +if [ $? -eq 0 ];then
>     +  if [ -e "/sys/kernel/debug/tracing/events/sample-trace" ];then
>     +    echo 1 > /sys/kernel/debug/tracing/events/sample-trace/enable
>     +    sleep 5
>     +    ret=`cat /sys/kernel/debug/tracing/trace | grep hello | head
>     -n1 | cut -d':' -f2`
>     +    if [ "$ret" = " foo_bar" ];then
>     +      echo "$list3: PASS"  >> kernel.log
>     +    else
>     +      echo "$list3: FAILED-" >> kernel.log
>     +    fi
>     +  else
>     +    echo "$list3: FAILED--" >> kernel.log
>     +  fi
>     +else
>     +  echo "$list3: FAILED---" >> kernel.log
>     +fi
>     +rmmod "$list3"
>     +
>     +#trace-printk
>     +list4="trace-printk"
>     +modprobe "$list4"
>     +lsmod | grep "trace_printk"
>     +if [ $? -eq 0 ];then
>     +  ret=`cat /sys/kernel/debug/tracing/trace | grep trace_printk |
>     head -n1 | cut -d':' -f2`
>     +  if [ "$ret" = " trace_printk_irq_work" ];then
>     +    echo "$list4: PASS" >> kernel.log
>     +    rmmod "$list4"
>     +  else
>     +    echo "$list4: FAILED" >> kernel.log
>     +  fi
>     +else
>     +  echo "$list4: FAILED" >> kernel.log
>     +fi
>     +rmmod "$list4"
>     +
>     +#kprobe_example
>     +list5="kprobe_example"
>     +dmesg -c
>     +modprobe "$list5"
>     +lsmod | grep "$list5"
>     +if [ $? -eq 0 ];then
>     +  dmesg | grep "_do_fork"
>     +  if [ $? -eq 0 ];then
>     +    echo "$list5: PASS" >> kernel.log
>     +  else
>     +    echo "$list5: FAILED" >> kernel.log
>     +  fi
>     +else
>     +  echo "$list5: FAILED" >> kernel.log
>     +fi
>     +rmmod "$list5"
>     +
>     +#kretprobe_example
>     +list6="kretprobe_example"
>     +dmesg -c
>     +modprobe "$list6"
>     +lsmod | grep "$list6"
>     +if [ $? -eq 0 ];then
>     +  dmesg | grep "_do_fork returned"
>     +  if [ $? -eq 0 ];then
>     +    echo "$list6: PASS" >> kernel.log
>     +  else
>     +    echo "$list6: FAILED" >> kernel.log
>     +  fi
>     +else
>     +  echo "$list6: FAILED" >> kernel.log
>     +fi
>     +rmmod "$list6"
>     +
>     +echo "#####result#####"
>     +cat kernel.log
>     +rm kernel.log
>     diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>     b/meta/recipes-kernel/linux/linux-yocto.inc
>     index 95ec2a2..7e1773e 100644
>     --- a/meta/recipes-kernel/linux/linux-yocto.inc
>     +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>     @@ -67,3 +67,11 @@ do_install_append(){
>      addtask kernel_version_sanity_check after do_kernel_metadata
>     do_kernel_checkout before do_compile
>      addtask validate_branches before do_patch after do_kernel_checkout
>      addtask kernel_configcheck after do_configure before do_compile
>     +
>     +inherit ptest
>     +SRC_URI_append = " file://run-ptest \
>     +"
>     +do_install_ptest_append() {
>     +       install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
>     +}
>     +KERNEL_FEATURES_append = "
>     ${@bb.utils.contains("DISTRO_FEATURES", "ptest",
>     "features/kernel-sample/kernel-sample.scc", "", d)}"
>     diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
>     <http://linux-yocto_4.14.bb>
>     b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
>     <http://linux-yocto_4.14.bb>
>     index 16142f8..7002693 100644
>     --- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
>     <http://linux-yocto_4.14.bb>
>     +++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
>     <http://linux-yocto_4.14.bb>
>     @@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?=
>     "74f6cd2b6976e37491779fcb1bc4966d3a61492c"
>      SRCREV_machine_qemux86-64 ?=
>     "74f6cd2b6976e37491779fcb1bc4966d3a61492c"
>      SRCREV_machine_qemumips64 ?=
>     "9863b327e770b42b8c18da3e0cfaf06e8f99ae97"
>      SRCREV_machine ?= "74f6cd2b6976e37491779fcb1bc4966d3a61492c"
>     -SRCREV_meta ?= "ea9330894eea727bd1655569b16f338976b72563"
>     +SRCREV_meta ?= "53336e1b7d969f21d8214ec9ceeb48fba4f99372"
>
>
> Do not bump the SRCREV for meta in this series.

Ok.

>
> If your feature depends on something in the meta branch (which it 
> does), wait until I've sent my next series before sending this.
>
> Bruce
>
>
>      SRC_URI =
>     "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}
>     <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRANCH%7D>;
>     \
>                
>     git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}
>     <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=$%7BKMETA%7D>"
>     -- 
>     2.7.4
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"


--------------BDDDEE409D3B7BE2A8051F4F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2018年05月31日 12:19, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4MU3Po893UfDcTeusYA0kkJdMHFHPWx3Z3RdMJS5gj8Xg@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Wed, May 30, 2018 at 11:08 PM,
            Dengke Du <span dir="ltr">&lt;<a
                href="mailto:dengke.du@windriver.com" target="_blank"
                moz-do-not-send="true">dengke.du@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by:
              Dengke Du &lt;<a href="mailto:dengke.du@windriver.com"
                moz-do-not-send="true">dengke.du@windriver.com</a>&gt;<br>
              ---<br>
              <span class=""> meta/recipes-kernel/linux/<wbr>files/run-ptest 
                   | 138 ++++++++++++++++++++++++++<br>
              </span></blockquote>
            <div><br>
            </div>
            <div>Nothing else in linux-yocto uses "files", and this
              shouldn't either.</div>
            <div><br>
            </div>
            <div>We can't guarantee that these are version independent,
              so they need to be in  a versioned</div>
            <div>kernel subdirectory.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Ok, I will put it in versioned kernel subdirectory.<br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4MU3Po893UfDcTeusYA0kkJdMHFHPWx3Z3RdMJS5gj8Xg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"><span
                class="">
                 meta/recipes-kernel/linux/<wbr>linux-yocto.inc     | 
                 8 ++<br>
                 meta/recipes-kernel/linux/<a
                  href="http://linux-yocto_4.14.bb" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">linu<wbr>x-yocto_4.14.bb</a>
                |   2 +-<br>
                 3 files changed, 147 insertions(+), 1 deletion(-)<br>
                 create mode 100644 meta/recipes-kernel/linux/<wbr>files/run-ptest<br>
                <br>
              </span>diff --git a/meta/recipes-kernel/linux/<wbr>files/run-ptest
              b/meta/recipes-kernel/linux/<wbr>files/run-ptest<br>
              new file mode 100644<br>
              index 0000000..a3d9e14<br>
              --- /dev/null<br>
              +++ b/meta/recipes-kernel/linux/<wbr>files/run-ptest<br>
              @@ -0,0 +1,138 @@<br>
              +#!/bin/bash<br>
            </blockquote>
            <div><br>
            </div>
            <div>This script should have a license and proper header
              file.</div>
            <div><br>
            </div>
            <div>Also, if the ptests are mainly trace/sample related,
              name the script to indicate that.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Ok.<br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4MU3Po893UfDcTeusYA0kkJdMHFHPWx3Z3RdMJS5gj8Xg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>The kernel already has a significant number of
              selftests, which are likely better than</div>
            <div>these ptests. Is there any reason why they aren't being
              used instead ?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    This is different to selftests, this ptest was based on kernel
    samples in sample directory,<br>
    those samples were some tutorial modules, the modules that we can
    modify it and learn<br>
    it(some basic kernel theory), in the end build it into our image to
    test and verification our<br>
    thought easily.<br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4MU3Po893UfDcTeusYA0kkJdMHFHPWx3Z3RdMJS5gj8Xg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              +depmod<br>
              +touch kernel.log<br>
              +<br>
              +#dma-example bytestream-example inttype-example
              record-example<br>
              +list1=("dma-example" "bytestream-example"
              "inttype-example" "record-example")<br>
              +for i in "${list1[@]}"<br>
              +do<br>
              +  dmesg -c<br>
              +  modprobe "$i"<br>
              +  result=""<br>
              +  IFS="-" read -ra array &lt;&lt;&lt; "$i"<br>
              +  len=${#array[@]}<br>
              +  if [ $len -eq 2 ];then<br>
              +    result="${array[0]}_${array[1]<wbr>}"<br>
              +  elif [ $len -eq 3 ];then<br>
              +    result="${array[0]}_${array[1]<wbr>}_${array[2]}"<br>
              +  fi<br>
              +  lsmod | grep -q "$result"<br>
              +  if [ $? -eq 0 ];then<br>
              +    dmesg | grep "test passed"<br>
              +    if [ $? -eq 0 ];then<br>
              +      echo "$i: PASS" &gt;&gt; kernel.log<br>
              +    fi<br>
              +    rmmod "$i"<br>
              +  else<br>
              +    echo "$i: FAILED" &gt;&gt; kernel.log<br>
              +  fi<br>
              +done<br>
              +<br>
              +#kobject-example kset-example<br>
              +list2=("kobject-example" "kset-example")<br>
              +for i in "${list2[@]}"<br>
              +do<br>
              +  dmesg -c<br>
              +  modprobe "$i"<br>
              +  result=""<br>
              +  IFS="-" read -ra array &lt;&lt;&lt; "$i"<br>
              +  len=${#array[@]}<br>
              +  if [ $len -eq 2 ];then<br>
              +    result="${array[0]}_${array[1]<wbr>}"<br>
              +  elif [ $len -eq 3 ];then<br>
              +    result="${array[0]}_${array[1]<wbr>}_${array[2]}"<br>
              +  fi<br>
              +  basedir="/sys/kernel/${result}<wbr>"<br>
              +  echo "$basedir"<br>
              +  if [ -e ${basedir}/bar -a -e ${basedir}/baz -a -e
              ${basedir}/foo ];then<br>
              +    echo "$i: PASS" &gt;&gt; kernel.log<br>
              +    rmmod "$i"<br>
              +  else<br>
              +    echo "$i: FAILED" &gt;&gt; kernel.log<br>
              +  fi<br>
              +done<br>
              +<br>
              +#trace-events-sample<br>
              +list3="trace-events-sample"<br>
              +result=""<br>
              +IFS="-" read -ra array &lt;&lt;&lt; "$list3"<br>
              +len=${#array[@]}<br>
              +if [ $len -eq 2 ];then<br>
              +  result="${array[0]}_${array[1]<wbr>}"<br>
              +elif [ $len -eq 3 ];then<br>
              +  result="${array[0]}_${array[1]<wbr>}_${array[2]}"<br>
              +fi<br>
              +modprobe "$list3"<br>
              +lsmod | grep "$result"<br>
              +if [ $? -eq 0 ];then<br>
              +  if [ -e "/sys/kernel/debug/tracing/<wbr>events/sample-trace"
              ];then<br>
              +    echo 1 &gt; /sys/kernel/debug/tracing/<wbr>events/sample-trace/enable<br>
              +    sleep 5<br>
              +    ret=`cat /sys/kernel/debug/tracing/<wbr>trace | grep
              hello | head -n1 | cut -d':' -f2`<br>
              +    if [ "$ret" = " foo_bar" ];then<br>
              +      echo "$list3: PASS"  &gt;&gt; kernel.log<br>
              +    else<br>
              +      echo "$list3: FAILED-" &gt;&gt; kernel.log<br>
              +    fi<br>
              +  else<br>
              +    echo "$list3: FAILED--" &gt;&gt; kernel.log<br>
              +  fi<br>
              +else<br>
              +  echo "$list3: FAILED---" &gt;&gt; kernel.log<br>
              +fi<br>
              +rmmod "$list3"<br>
              +<br>
              +#trace-printk<br>
              +list4="trace-printk"<br>
              +modprobe "$list4"<br>
              +lsmod | grep "trace_printk"<br>
              +if [ $? -eq 0 ];then<br>
              +  ret=`cat /sys/kernel/debug/tracing/<wbr>trace | grep
              trace_printk | head -n1 | cut -d':' -f2`<br>
              +  if [ "$ret" = " trace_printk_irq_work" ];then<br>
              +    echo "$list4: PASS" &gt;&gt; kernel.log<br>
              +    rmmod "$list4"<br>
              +  else<br>
              +    echo "$list4: FAILED" &gt;&gt; kernel.log<br>
              +  fi<br>
              +else<br>
              +  echo "$list4: FAILED" &gt;&gt; kernel.log<br>
              +fi<br>
              +rmmod "$list4"<br>
              +<br>
              +#kprobe_example<br>
              +list5="kprobe_example"<br>
              +dmesg -c<br>
              +modprobe "$list5"<br>
              +lsmod | grep "$list5"<br>
              +if [ $? -eq 0 ];then<br>
              +  dmesg | grep "_do_fork"<br>
              +  if [ $? -eq 0 ];then<br>
              +    echo "$list5: PASS" &gt;&gt; kernel.log<br>
              +  else<br>
              +    echo "$list5: FAILED" &gt;&gt; kernel.log<br>
              +  fi<br>
              +else<br>
              +  echo "$list5: FAILED" &gt;&gt; kernel.log<br>
              +fi<br>
              +rmmod "$list5"<br>
              +<br>
              +#kretprobe_example<br>
              +list6="kretprobe_example"<br>
              +dmesg -c<br>
              +modprobe "$list6"<br>
              +lsmod | grep "$list6"<br>
              +if [ $? -eq 0 ];then<br>
              +  dmesg | grep "_do_fork returned"<br>
              +  if [ $? -eq 0 ];then<br>
              +    echo "$list6: PASS" &gt;&gt; kernel.log<br>
              +  else<br>
              +    echo "$list6: FAILED" &gt;&gt; kernel.log<br>
              +  fi<br>
              +else<br>
              +  echo "$list6: FAILED" &gt;&gt; kernel.log<br>
              +fi<br>
              +rmmod "$list6"<br>
              +<br>
              +echo "#####result#####"<br>
              +cat kernel.log<br>
              +rm kernel.log<br>
              diff --git a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc
              b/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
              index 95ec2a2..7e1773e 100644<br>
              --- a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
              +++ b/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
              @@ -67,3 +67,11 @@ do_install_append(){<br>
               addtask kernel_version_sanity_check after
              do_kernel_metadata do_kernel_checkout before do_compile<br>
               addtask validate_branches before do_patch after
              do_kernel_checkout<br>
               addtask kernel_configcheck after do_configure before
              do_compile<br>
              +<br>
              +inherit ptest<br>
              +SRC_URI_append = " <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \<br>
              +"<br>
              +do_install_ptest_append() {<br>
              +       install -D ${WORKDIR}/run-ptest
              ${D}${PTEST_PATH}/run-ptest<br>
              +}<br>
              +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_<wbr>FEATURES",
              "ptest", "features/kernel-sample/<wbr>kernel-sample.scc",
              "", d)}"<br>
              diff --git a/meta/recipes-kernel/linux/<a
                href="http://linux-yocto_4.14.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">li<wbr>nux-yocto_4.14.bb</a>
              b/meta/recipes-kernel/linux/<a
                href="http://linux-yocto_4.14.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">li<wbr>nux-yocto_4.14.bb</a><br>
              index 16142f8..7002693 100644<br>
              --- a/meta/recipes-kernel/linux/<a
                href="http://linux-yocto_4.14.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">li<wbr>nux-yocto_4.14.bb</a><br>
              +++ b/meta/recipes-kernel/linux/<a
                href="http://linux-yocto_4.14.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">li<wbr>nux-yocto_4.14.bb</a><br>
              @@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "<wbr>74f6cd2b6976e37491779fcb1bc496<wbr>6d3a61492c"<br>
               SRCREV_machine_qemux86-64 ?= "<wbr>74f6cd2b6976e37491779fcb1bc496<wbr>6d3a61492c"<br>
               SRCREV_machine_qemumips64 ?= "<wbr>9863b327e770b42b8c18da3e0cfaf0<wbr>6e8f99ae97"<br>
               SRCREV_machine ?= "<wbr>74f6cd2b6976e37491779fcb1bc496<wbr>6d3a61492c"<br>
              -SRCREV_meta ?= "<wbr>ea9330894eea727bd1655569b16f33<wbr>8976b72563"<br>
              +SRCREV_meta ?= "<wbr>53336e1b7d969f21d8214ec9ceeb48<wbr>fba4f99372"<br>
            </blockquote>
            <div><br>
            </div>
            <div>Do not bump the SRCREV for meta in this series.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Ok.<br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4MU3Po893UfDcTeusYA0kkJdMHFHPWx3Z3RdMJS5gj8Xg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>If your feature depends on something in the meta branch
              (which it does), wait until I've sent my next series
              before sending this.</div>
            <div><br>
            </div>
            <div>Bruce</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
               SRC_URI = "git://<a
href="http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRANCH%7D"
                rel="noreferrer" target="_blank" moz-do-not-send="true">git.yoctoproject.org/<wbr>linux-yocto.git;name=machine;<wbr>branch=${KBRANCH}</a>;
              \<br>
                          git://<a
href="http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=$%7BKMETA%7D"
                rel="noreferrer" target="_blank" moz-do-not-send="true">git.yoctoproject.org/<wbr>yocto-kernel-cache;type=kmeta;<wbr>name=meta;branch=yocto-4.14;<wbr>destsuffix=${KMETA}</a>"<br>
              <div class="HOEnZb">
                <div class="h5">-- <br>
                  2.7.4<br>
                  <br>
                  -- <br>
                  ______________________________<wbr>_________________<br>
                  Openembedded-core mailing list<br>
                  <a
                    href="mailto:Openembedded-core@lists.openembedded.org"
                    moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                  <a
                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                </div>
              </div>
            </blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          <div class="gmail_signature" data-smartmail="gmail_signature">"Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------BDDDEE409D3B7BE2A8051F4F--
