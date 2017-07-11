Return-Path: <openembedded@mindchasers.com>
X-Greylist: delayed 557 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Jul 2017 17:25:34 UTC
Received: from smtp.webfaction.com (mail6.webfaction.com [31.170.123.134])
	by mail.openembedded.org (Postfix) with ESMTP id 9F8C977E44
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 17:25:34 +0000 (UTC)
Received: from [192.168.1.14] (c-73-197-231-125.hsd1.nj.comcast.net
	[73.197.231.125])
	by smtp.webfaction.com (Postfix) with ESMTPSA id A2836600C158C;
	Tue, 11 Jul 2017 17:16:17 +0000 (UTC)
To: "Burton, Ross" <ross.burton@intel.com>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>
References: <20170709073537.16106-1-soren.brinkmann@xilinx.com>
	<CAJTo0Lb6wS0cYqDmg87_sXh3+SV4mR+kmMA26XUKtscZ4B36GQ@mail.gmail.com>
From: Bob Cochran <openembedded@mindchasers.com>
Message-ID: <2027cffe-93a8-3641-4c91-541ffde23d76@mindchasers.com>
Date: Tue, 11 Jul 2017 13:16:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb6wS0cYqDmg87_sXh3+SV4mR+kmMA26XUKtscZ4B36GQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] valgrind: Update 3.12.0 -> 3.13.0
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
X-List-Received-Date: Tue, 11 Jul 2017 17:25:40 -0000
Content-Type: multipart/alternative;
	boundary="------------5C39CD4721087A8273A6150D"
Content-Language: en-US

--------------5C39CD4721087A8273A6150D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2017 04:43 AM, Burton, Ross wrote:
>
> On 9 July 2017 at 08:35, Soren Brinkmann <soren.brinkmann@xilinx.com 
> <mailto:soren.brinkmann@xilinx.com>> wrote:
>
>     Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com
>     <mailto:soren.brinkmann@xilinx.com>>
>     ---
>     v3:
>      - rebased onto latest master branch
>     v2:
>      - no change
>
>
> Fails to build on PPC if ptest is enabled: 
> http://errors.yoctoproject.org/Errors/Details/147237/


I find that both valgrind 3.12 and the proposed patch fail to build with 
ppc64.  Valgrind 3.12 builds with ppc64 if I switch GCCVERSION back to 6.3

I suppose the 7.1 compiler is uncovering some issues with some of the 
assembly language that has gone undetected before.


Using 3.12 with master branch / GCCVERSION 7.1 fails in coregrind:


powerpc64-poky-linux-gcc  -mhard-float -m64 -mcpu=e5500 
--sysroot=/build/yocto/build_master/tmp/work/ppc64e5500-poky-linux/valgrind/3.12.0-r0/recipe-sysroot 
-DHAVE_CONFIG_H -I. -I../../valgrind-3.12.0/coregrind -I.. 
-I../../valgrind-3.12.0 -I../../valgrind-3.12.0/include 
-I../../valgrind-3.12.0/VEX/pub -I../VEX/pub -DVGA_ppc64be=1 
-DVGO_linux=1 -DVGP_ppc64be_linux=1 -DVGPV_ppc64be_linux_vanilla=1 
-I../../valgrind-3.12.0/coregrind -DVG_LIBDIR="\"/usr/lib64/valgrind"\" 
-DVG_PLATFORM="\"ppc64be-linux\""  -m64 -O2 -g -std=gnu99 -Wall 
-Wmissing-prototypes -Wshadow -Wpointer-arith -Wstrict-prototypes 
-Wmissing-declarations -Wcast-align -Wcast-qual -Wwrite-strings 
-Wempty-body -Wformat -Wformat-security -Wignored-qualifiers 
-Wmissing-parameter-type -Wold-style-declaration -fno-stack-protector 
-fno-strict-aliasing -fno-builtin -DENABLE_LINUX_TICKET_LOCK -g 
-feliminate-unused-debug-types 
-fdebug-prefix-map=/build/yocto/build_master/tmp/work/ppc64e5500-poky-linux/valgrind/3.12.0-r0=/usr/src/debug/valgrind/3.12.0-r0 
-fdebug-prefix-map=/build/yocto/build_master/tmp/work/ppc64e5500-poky-linux/valgrind/3.12.0-r0/recipe-sysroot-native= 
-fdebug-prefix-map=/build/yocto/build_master/tmp/work/ppc64e5500-poky-linux/valgrind/3.12.0-r0/recipe-sysroot= 
-c -o libcoregrind_ppc64be_linux_a-m_debuglog.o `test -f 'm_debuglog.c' 
|| echo '../../valgrind-3.12.0/coregrind/'`m_debuglog.c

| ../../valgrind-3.12.0/coregrind/m_debuglog.c: In function 
'local_sys_write_stderr':
| ../../valgrind-3.12.0/coregrind/m_debuglog.c:203:4: error: PIC 
register clobbered by 'r2' in 'asm'
|     __asm__ volatile (
|     ^~~~~~~
| ../../valgrind-3.12.0/coregrind/m_debuglog.c: In function 
'vgPlain_debugLog':
| ../../valgrind-3.12.0/coregrind/m_debuglog.c:228:4: error: PIC 
register clobbered by 'r2' in 'asm'
|     __asm__ volatile (
|     ^~~~~~~


*************


Using 3.13 patch  with master branch / GCCVERSION 7.1 fails in tests/ppc64


powerpc64-poky-linux-gcc  -mhard-float -m64 -mcpu=e5500 
--sysroot=/build/yocto/build_master/tmp/work/ppc64e5500-poky-linux/valgrind/3.13.0-r0/recipe-sysroot 
-DHAVE_CONFIG_H -I. -I../../../../valgrind-3.13.0/none/tests/ppc64 
-I../../..  -I../../../../valgrind-3.13.0 
-I../../../../valgrind-3.13.0/include 
-I../../../../valgrind-3.13.0/coregrind -I../../../include 
-I../../../../valgrind-3.13.0/VEX/pub -I../../../VEX/pub -DVGA_ppc64be=1 
-DVGO_linux=1 -DVGP_ppc64be_linux=1 -DVGPV_ppc64be_linux_vanilla=1   
-Winline -Wall -Wshadow -Wno-long-long -g -fno-stack-protector   -m64  
-Winline -Wall -O -g -mregnames  -m64   -g 
-feliminate-unused-debug-types 
-fdebug-prefix-map=/build/yocto/build_master/tmp/work/ppc64e5500-poky-linux/valgrind/3.13.0-r0=/usr/src/debug/valgrind/3.13.0-r0 
-fdebug-prefix-map=/build/yocto/build_master/tmp/work/ppc64e5500-poky-linux/valgrind/3.13.0-r0/recipe-sysroot-native= 
-fdebug-prefix-map=/build/yocto/build_master/tmp/work/ppc64e5500-poky-linux/valgrind/3.13.0-r0/recipe-sysroot= 
-c -o test_isa_2_06_part2-test_isa_2_06_part2.o `test -f 
'test_isa_2_06_part2.c' || echo 
'../../../../valgrind-3.13.0/none/tests/ppc64/'`test_isa_2_06_part2.c
| ../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c: In 
function 'usage':
| 
../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:1778:3: 
warning: implicit declaration of function 'fprintf' 
[-Wimplicit-function-declaration]
|    fprintf(stderr,
|    ^~~~~~~
| 
../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:1778:3: 
warning: incompatible implicit declaration of built-in function 'fprintf'
| 
../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:1778:3: 
note: include '<stdio.h>' or provide a declaration of 'fprintf'
| 
../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:1778:11: 
error: 'stderr' undeclared (first use in this function)
|    fprintf(stderr,
|            ^~~~~~
| 
../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:1778:11: 
note: each undeclared identifier is reported only once for each function 
it appears in
| At top level:
| 
../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:1776:13: 
warning: 'usage' defined but not used [-Wunused-function]
|  static void usage (void)
|              ^~~~~


Bob



>
> Ross
>
>


--------------5C39CD4721087A8273A6150D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 07/11/2017 04:43 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0Lb6wS0cYqDmg87_sXh3+SV4mR+kmMA26XUKtscZ4B36GQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 9 July 2017 at 08:35, Soren
            Brinkmann <span dir="ltr">&lt;<a
                href="mailto:soren.brinkmann@xilinx.com" target="_blank"
                moz-do-not-send="true">soren.brinkmann@xilinx.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
              <div id="gmail-:3hs" class="gmail-a3s gmail-aXjCH
                gmail-m15d26481ae6626fa">Signed-off-by: Soren Brinkmann
                &lt;<a href="mailto:soren.brinkmann@xilinx.com"
                  moz-do-not-send="true">soren.brinkmann@xilinx.com</a>&gt;<br>
                ---<br>
                v3:<br>
                 - rebased onto latest master branch<br>
                v2:<br>
                 - no change<br>
              </div>
            </blockquote>
          </div>
          <br>
          Fails to build on PPC if ptest is enabled:  <a
            href="http://errors.yoctoproject.org/Errors/Details/147237/"
            moz-do-not-send="true">http://errors.yoctoproject.org/Errors/Details/147237/</a></div>
      </div>
    </blockquote>
    <br>
    <br>
    I find that both valgrind 3.12 and the proposed patch fail to build
    with ppc64.  Valgrind 3.12 builds with ppc64 if I switch GCCVERSION
    back to 6.3<br>
    <br>
    I suppose the 7.1 compiler is uncovering some issues with some of
    the assembly language that has gone undetected before. <br>
    <br>
    <br>
    Using 3.12 with master branch / GCCVERSION 7.1 fails in coregrind:<br>
    <br>
    <br>
    powerpc64-poky-linux-gcc  -mhard-float -m64 -mcpu=e5500
--sysroot=/build/yocto/build_master/tmp/work/ppc64e5500-poky-linux/valgrind/3.12.0-r0/recipe-sysroot
    -DHAVE_CONFIG_H -I. -I../../valgrind-3.12.0/coregrind -I.. 
    -I../../valgrind-3.12.0 -I../../valgrind-3.12.0/include
    -I../../valgrind-3.12.0/VEX/pub -I../VEX/pub -DVGA_ppc64be=1
    -DVGO_linux=1 -DVGP_ppc64be_linux=1 -DVGPV_ppc64be_linux_vanilla=1
    -I../../valgrind-3.12.0/coregrind
    -DVG_LIBDIR="\"/usr/lib64/valgrind"\"
    -DVG_PLATFORM="\"ppc64be-linux\""  -m64 -O2 -g -std=gnu99 -Wall
    -Wmissing-prototypes -Wshadow -Wpointer-arith -Wstrict-prototypes
    -Wmissing-declarations -Wcast-align -Wcast-qual -Wwrite-strings
    -Wempty-body -Wformat -Wformat-security -Wignored-qualifiers
    -Wmissing-parameter-type -Wold-style-declaration
    -fno-stack-protector -fno-strict-aliasing -fno-builtin 
    -DENABLE_LINUX_TICKET_LOCK -g -feliminate-unused-debug-types
-fdebug-prefix-map=/build/yocto/build_master/tmp/work/ppc64e5500-poky-linux/valgrind/3.12.0-r0=/usr/src/debug/valgrind/3.12.0-r0
-fdebug-prefix-map=/build/yocto/build_master/tmp/work/ppc64e5500-poky-linux/valgrind/3.12.0-r0/recipe-sysroot-native=
-fdebug-prefix-map=/build/yocto/build_master/tmp/work/ppc64e5500-poky-linux/valgrind/3.12.0-r0/recipe-sysroot= 
    -c -o libcoregrind_ppc64be_linux_a-m_debuglog.o `test -f
    'm_debuglog.c' || echo
    '../../valgrind-3.12.0/coregrind/'`m_debuglog.c<br>
    <br>
    | ../../valgrind-3.12.0/coregrind/m_debuglog.c: In function
    'local_sys_write_stderr':<br>
    | ../../valgrind-3.12.0/coregrind/m_debuglog.c:203:4: error: PIC
    register clobbered by 'r2' in 'asm'<br>
    |     __asm__ volatile (<br>
    |     ^~~~~~~<br>
    | ../../valgrind-3.12.0/coregrind/m_debuglog.c: In function
    'vgPlain_debugLog':<br>
    | ../../valgrind-3.12.0/coregrind/m_debuglog.c:228:4: error: PIC
    register clobbered by 'r2' in 'asm'<br>
    |     __asm__ volatile (<br>
    |     ^~~~~~~<br>
    <br>
    <br>
    *************<br>
    <br>
    <br>
    Using 3.13 patch  with master branch / GCCVERSION 7.1 fails in
    tests/ppc64<br>
    <br>
    <br>
    powerpc64-poky-linux-gcc  -mhard-float -m64 -mcpu=e5500
--sysroot=/build/yocto/build_master/tmp/work/ppc64e5500-poky-linux/valgrind/3.13.0-r0/recipe-sysroot
    -DHAVE_CONFIG_H -I. -I../../../../valgrind-3.13.0/none/tests/ppc64
    -I../../..  -I../../../../valgrind-3.13.0
    -I../../../../valgrind-3.13.0/include
    -I../../../../valgrind-3.13.0/coregrind -I../../../include
    -I../../../../valgrind-3.13.0/VEX/pub -I../../../VEX/pub
    -DVGA_ppc64be=1 -DVGO_linux=1 -DVGP_ppc64be_linux=1
    -DVGPV_ppc64be_linux_vanilla=1   -Winline -Wall -Wshadow
    -Wno-long-long -g -fno-stack-protector   -m64  -Winline -Wall -O -g
    -mregnames  -m64   -g -feliminate-unused-debug-types
-fdebug-prefix-map=/build/yocto/build_master/tmp/work/ppc64e5500-poky-linux/valgrind/3.13.0-r0=/usr/src/debug/valgrind/3.13.0-r0
-fdebug-prefix-map=/build/yocto/build_master/tmp/work/ppc64e5500-poky-linux/valgrind/3.13.0-r0/recipe-sysroot-native=
-fdebug-prefix-map=/build/yocto/build_master/tmp/work/ppc64e5500-poky-linux/valgrind/3.13.0-r0/recipe-sysroot= 
    -c -o test_isa_2_06_part2-test_isa_2_06_part2.o `test -f
    'test_isa_2_06_part2.c' || echo
    '../../../../valgrind-3.13.0/none/tests/ppc64/'`test_isa_2_06_part2.c<br>
    |
    ../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:
    In function 'usage':<br>
    |
../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:1778:3:
    warning: implicit declaration of function 'fprintf'
    [-Wimplicit-function-declaration]<br>
    |    fprintf(stderr,<br>
    |    ^~~~~~~<br>
    |
../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:1778:3:
    warning: incompatible implicit declaration of built-in function
    'fprintf'<br>
    |
../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:1778:3:
    note: include '&lt;stdio.h&gt;' or provide a declaration of
    'fprintf'<br>
    |
../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:1778:11:
    error: 'stderr' undeclared (first use in this function)<br>
    |    fprintf(stderr,<br>
    |            ^~~~~~<br>
    |
../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:1778:11:
    note: each undeclared identifier is reported only once for each
    function it appears in<br>
    | At top level:<br>
    |
../../../../valgrind-3.13.0/none/tests/ppc64/test_isa_2_06_part2.c:1776:13:
    warning: 'usage' defined but not used [-Wunused-function]<br>
    |  static void usage (void)<br>
    |              ^~~~~<br>
    <br>
    <br>
    Bob<br>
    <br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0Lb6wS0cYqDmg87_sXh3+SV4mR+kmMA26XUKtscZ4B36GQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------5C39CD4721087A8273A6150D--
