Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C8046AF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 06:25:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAM6PrLH029557
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Nov 2013 22:25:53 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 21 Nov 2013 22:25:52 -0800
Message-ID: <528EF8E6.9090301@windriver.com>
Date: Fri, 22 Nov 2013 14:25:42 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>, Mark Hatle
	<mark.hatle@windriver.com>
References: <cover.1385039538.git.hongxu.jia@windriver.com>	<0e29f77b1778e75f547289c20e670fc0ffd5e070.1385039538.git.hongxu.jia@windriver.com>	<528E541B.7000104@linux.intel.com>	<528E6199.80306@windriver.com>	<528E6239.8040507@linux.intel.com>
	<528EF295.9040704@windriver.com>
In-Reply-To: <528EF295.9040704@windriver.com>
Subject: Re: [PATCH 4/4] qemu: add bash and python to qemu's RDEPENDS
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
X-List-Received-Date: Fri, 22 Nov 2013 06:25:55 -0000
Content-Type: multipart/alternative;
	boundary="------------090301070200060002010102"

--------------090301070200060002010102
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/2013 01:58 PM, Hongxu Jia wrote:
> On 11/22/2013 03:42 AM, Saul Wold wrote:
>> On 11/21/2013 11:40 AM, Mark Hatle wrote:
>>> On 11/21/13, 12:42 PM, Saul Wold wrote:
>>>>
>>>> Why are you adding bash to qemu?
>>>
>>> My understanding is that there was a bash script that was added as 
>>> well,
>>> once the python rdepends was resolved.
>>>
>> Any chance of "de-bashing" the script?
>>
>

Hi Saul,

The script could not be de-bashed,  it was made by create_wrapper
which is bashism:
Vim image/usr/bin/qemu-mips
...
#! /bin/bash
realpath=`readlink -fn $0`
export QEMU_RESERVED_VA=0x0
exec -a `dirname $realpath`/qemu-mips `dirname $realpath`/qemu-mips.real 
"$@"
...

The exec's -a option is bashism, so we need to add bash to RDEPENDS.

//Hongxu

> Hi Saul,
>
> How about to de-bash the script by the following patch:
> ...
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -5,6 +5,7 @@ DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 
> pixman dtc libsdl"
>  DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native 
> pixman-native dtc-native"
>  DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl 
> nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
>  RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
> +RDEPENDS_${PN}_class-target += "python"
>
>  require qemu-targets.inc
>  inherit autotools
> @@ -76,6 +77,12 @@ do_install_append() {
>                 create_wrapper ${D}/${bindir}/qemu-mips \
>                         QEMU_RESERVED_VA=0x0
>         fi
> +
> +       # De-bashing the script
> +       files=`grep "^\#\! *.*\/bash" ${D} -rl`
> +       for f in $files; do
> +                 sed -i "s:^#! *.*/bash:#! /bin/sh:" $f
> +       done
>  }
>  # END of qemu-mips workaround
> ...
>
> The build test is ok.
>
> //Hongxu
>
>> Sau!
>>> --Mark
>>>
>>>> Sau!
>>>>
>>>>
>>>> On 11/21/2013 05:14 AM, Hongxu Jia wrote:
>>>>> | Note: adding Smart RPM DB channel
>>>>> |
>>>>> | Note: to be installed:  qemu@x86_64 run-postinsts@x86_64
>>>>> kernel-modules@qemux86_64 packagegroup-core-boot@qemux86_64
>>>>> | Loading cache...
>>>>> | Updating cache...
>>>>> ######################################## [100%]
>>>>> |
>>>>> | Computing transaction...error: Can't install
>>>>> qemu-1.5.0-r0.0@x86_64: no package provides /usr/bin/python
>>>>> |
>>>>> | Saving cache...
>>>>> |
>>>>> | WARNING: exit code 1 from a shell command.
>>>>> | ERROR: Function failed: do_rootfs (log file is located at
>>>>> tmp/work/qemux86_64-wrs-linux/wrlinux-image-glibc-small/1.0-r1/temp/do_rootfs/log.do_rootfs.21373) 
>>>>>
>>>>>
>>>>>
>>>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>>> ---
>>>>>    meta/recipes-devtools/qemu/qemu.inc | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/meta/recipes-devtools/qemu/qemu.inc
>>>>> b/meta/recipes-devtools/qemu/qemu.inc
>>>>> index 21ce489..3f3431d 100644
>>>>> --- a/meta/recipes-devtools/qemu/qemu.inc
>>>>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>>>>> @@ -5,6 +5,7 @@ DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11
>>>>> pixman dtc libsdl"
>>>>>    DEPENDS_class-native = "zlib-native alsa-lib-native
>>>>> glib-2.0-native pixman-native dtc-native"
>>>>>    DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl
>>>>> nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
>>>>>    RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
>>>>> +RDEPENDS_${PN}_class-target += "bash python"
>>>>>
>>>>>    require qemu-targets.inc
>>>>>    inherit autotools
>>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--------------090301070200060002010102
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 11/22/2013 01:58 PM, Hongxu Jia
      wrote:<br>
    </div>
    <blockquote cite="mid:528EF295.9040704@windriver.com" type="cite">On
      11/22/2013 03:42 AM, Saul Wold wrote:
      <br>
      <blockquote type="cite">On 11/21/2013 11:40 AM, Mark Hatle wrote:
        <br>
        <blockquote type="cite">On 11/21/13, 12:42 PM, Saul Wold wrote:
          <br>
          <blockquote type="cite">
            <br>
            Why are you adding bash to qemu?
            <br>
          </blockquote>
          <br>
          My understanding is that there was a bash script that was
          added as well,
          <br>
          once the python rdepends was resolved.
          <br>
          <br>
        </blockquote>
        Any chance of "de-bashing" the script?
        <br>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
    Hi Saul,<br>
    <br>
    The script could not be de-bashed,&nbsp; it was made by create_wrapper<br>
    which is
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    bashism:<br>
    Vim image/usr/bin/qemu-mips<br>
    ...<br>
    #! /bin/bash<br>
    realpath=`readlink -fn $0`<br>
    export QEMU_RESERVED_VA=0x0<br>
    exec -a `dirname $realpath`/qemu-mips `dirname
    $realpath`/qemu-mips.real "$@"<br>
    ...<br>
    <br>
    The exec's -a option is bashism, so we need to add bash to RDEPENDS.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote cite="mid:528EF295.9040704@windriver.com" type="cite">Hi
      Saul,
      <br>
      <br>
      How about to de-bash the script by the following patch:
      <br>
      ...
      <br>
      --- a/meta/recipes-devtools/qemu/qemu.inc
      <br>
      +++ b/meta/recipes-devtools/qemu/qemu.inc
      <br>
      @@ -5,6 +5,7 @@ DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11
      pixman dtc libsdl"
      <br>
      &nbsp;DEPENDS_class-native = "zlib-native alsa-lib-native
      glib-2.0-native pixman-native dtc-native"
      <br>
      &nbsp;DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl
      nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
      <br>
      &nbsp;RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
      <br>
      +RDEPENDS_${PN}_class-target += "python"
      <br>
      <br>
      &nbsp;require qemu-targets.inc
      <br>
      &nbsp;inherit autotools
      <br>
      @@ -76,6 +77,12 @@ do_install_append() {
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create_wrapper ${D}/${bindir}/qemu-mips \
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; QEMU_RESERVED_VA=0x0
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi
      <br>
      +
      <br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # De-bashing the script
      <br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; files=`grep "^\#\! *.*\/bash" ${D} -rl`
      <br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for f in $files; do
      <br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i "s:^#! *.*/bash:#! /bin/sh:" $f
      <br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done
      <br>
      &nbsp;}
      <br>
      &nbsp;# END of qemu-mips workaround
      <br>
      ...
      <br>
      <br>
      The build test is ok.
      <br>
      <br>
      //Hongxu
      <br>
      <br>
      <blockquote type="cite">Sau!
        <br>
        <blockquote type="cite">--Mark
          <br>
          <br>
          <blockquote type="cite">Sau!
            <br>
            <br>
            <br>
            On 11/21/2013 05:14 AM, Hongxu Jia wrote:
            <br>
            <blockquote type="cite">| Note: adding Smart RPM DB channel
              <br>
              |
              <br>
              | Note: to be installed:&nbsp; qemu@x86_64 run-postinsts@x86_64
              <br>
              kernel-modules@qemux86_64
              packagegroup-core-boot@qemux86_64
              <br>
              | Loading cache...
              <br>
              | Updating cache...
              <br>
              ######################################## [100%]
              <br>
              |
              <br>
              | Computing transaction...error: Can't install
              <br>
              qemu-1.5.0-r0.0@x86_64: no package provides
              /usr/bin/python
              <br>
              |
              <br>
              | Saving cache...
              <br>
              |
              <br>
              | WARNING: exit code 1 from a shell command.
              <br>
              | ERROR: Function failed: do_rootfs (log file is located
              at
              <br>
              tmp/work/qemux86_64-wrs-linux/wrlinux-image-glibc-small/1.0-r1/temp/do_rootfs/log.do_rootfs.21373)
              <br>
              <br>
              <br>
              Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
              <br>
              ---
              <br>
              &nbsp;&nbsp; meta/recipes-devtools/qemu/qemu.inc | 1 +
              <br>
              &nbsp;&nbsp; 1 file changed, 1 insertion(+)
              <br>
              <br>
              diff --git a/meta/recipes-devtools/qemu/qemu.inc
              <br>
              b/meta/recipes-devtools/qemu/qemu.inc
              <br>
              index 21ce489..3f3431d 100644
              <br>
              --- a/meta/recipes-devtools/qemu/qemu.inc
              <br>
              +++ b/meta/recipes-devtools/qemu/qemu.inc
              <br>
              @@ -5,6 +5,7 @@ DEPENDS = "glib-2.0 zlib alsa-lib
              virtual/libx11
              <br>
              pixman dtc libsdl"
              <br>
              &nbsp;&nbsp; DEPENDS_class-native = "zlib-native alsa-lib-native
              <br>
              glib-2.0-native pixman-native dtc-native"
              <br>
              &nbsp;&nbsp; DEPENDS_class-nativesdk = "nativesdk-zlib
              nativesdk-libsdl
              <br>
              nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
              <br>
              &nbsp;&nbsp; RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
              <br>
              +RDEPENDS_${PN}_class-target += "bash python"
              <br>
              <br>
              &nbsp;&nbsp; require qemu-targets.inc
              <br>
              &nbsp;&nbsp; inherit autotools
              <br>
              <br>
            </blockquote>
            <br>
            _______________________________________________
            <br>
            Openembedded-core mailing list
            <br>
            <a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
            <br>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
            <br>
            <br>
          </blockquote>
          <br>
          _______________________________________________
          <br>
          Openembedded-core mailing list
          <br>
          <a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
          <br>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
          <br>
          <br>
          <br>
        </blockquote>
        _______________________________________________
        <br>
        Openembedded-core mailing list
        <br>
        <a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
        <br>
        <a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
        <br>
      </blockquote>
      <br>
      _______________________________________________
      <br>
      Openembedded-core mailing list
      <br>
      <a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
      <br>
      <a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------090301070200060002010102--
