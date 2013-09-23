Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C588C61102
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 09:11:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8N9BL1C015994
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 02:11:21 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 23 Sep 2013 02:11:20 -0700
Message-ID: <524005B5.6060105@windriver.com>
Date: Mon, 23 Sep 2013 17:11:17 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1379488760.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1379488760.git.hongxu.jia@windriver.com>
Subject: Re: [RFC YOCTO #5248] core-image-lsb: Why FPU doesn't work correctly on qemux86-64
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
X-List-Received-Date: Mon, 23 Sep 2013 09:11:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/23/2013 04:55 PM, Hongxu Jia wrote:
> *Preparation
> 1, vim local.conf
> ...
> DISTRO ?= "poky-lsb"
> MACHINE ?= "qemux86-64"
> ...
>
> *Problem
> 1, Build core-image-lsb
> ..
> bitbake core-image-lsb
> ..
>
> 2, Start qemux86-64, there are 21 LSB tcl test failures on
> qemux86-64, you could reproduce it by tcl interpreter:
>    1, On qemux86-64's terminal, start tcl interpreter
>    root@qemux86-64:~# $ tclsh
>    %
>
>    2, Run 'binary scan' to assign ieeeValues(-Subnormal)
>    % binary scan \x00\x00\x00\x00\x00\x00\x08\x80 d ieeeValues(-Subnormal)
>    1
>
>    3, Run 'puts' to output ieeeValues(-Subnormal), the result is '0.0'
>    % puts $ieeeValues(-Subnormal)
>    -0.0
>
>    Expected:
>    -1.1125369292536007e-308
>
> *Analysis
> 1, On the previous environment, add IMAGE_INSTALL_append = " tcl" to
> local.conf and build core-image-sato, the result is expected.
>
> 2, Trace tcl's source code, you could also reproduce the issue by
> compiling and executing the following C codes on core-image-lsb-sdk.
>
>    1) Build core-image-lsb-sdk, and Run qemux86-64.
>    2) On target's terminal, create a C source file:
>       root@qemux86-64:~# cat >> test.c << EOF
> #include <stdio.h>
>
> int main(int argc, char *argv[])
> {
>    double dd = 0;
>    char *p = (char*)&dd;
>    p[0] = 0x00;
>    p[1] = 0x00;
>    p[2] = 0x00;
>    p[3] = 0x00;
>    p[4] = 0x00;
>    p[5] = 0x00;
>    p[6] = 0x08;
>    p[7] = 0x00;
>
>    if (dd == 0.0)
>      printf("Incorrect equal 0.0\n");
>    else
>      printf("Expected not equal 0.0\n");
>
>    return 0;
> }
> EOF
>
>    2) Compile test.c
>      root@qemux86-64:~# gcc test.c -o test
>
>    3, Execute test
>    $ root@qemux86-64:~# ./test
>      Incorrect equal 0.0
>
>    Expected:
>      Expected not equal 0.0
>
> 3, It's about x86-64's FPU: the SSE MXCSR register.
>    If you invoke 'feenableexcept(FE_INEXACT);' or
>    'feclearexcept(FE_INEXACT);' in the above C test,
>    the issue will be fixed. In these two functions,
>    the SSE MXCSR register has been handled.
vim eglibc-2.18/libc/sysdeps/x86_64/fpu/feenablxcpt.c
...
#include <fenv.h>

int
feenableexcept (int excepts)
{
   unsigned short int new_exc, old_exc;
   unsigned int new;

   excepts &= FE_ALL_EXCEPT;

   /* Get the current control word of the x87 FPU.  */
   __asm__ ("fstcw %0" : "=m" (*&new_exc));

   old_exc = (~new_exc) & FE_ALL_EXCEPT;

   new_exc &= ~excepts;
   __asm__ ("fldcw %0" : : "m" (*&new_exc));

   /* And now the same for the SSE MXCSR register.  */
   __asm__ ("stmxcsr %0" : "=m" (*&new));

   /* The SSE exception masks are shifted by 7 bits.  */
   new &= ~(excepts << 7);
   __asm__ ("ldmxcsr %0" : : "m" (*&new));

   return old_exc;
}
...

//Hongxu

> *Solution
> Is it necessary to invoke 'feenableexcept(FE_INEXACT);' or
> 'feclearexcept(FE_INEXACT);' to handle SSE MXCSR register?
>
> Or any good idea about this issue.
>
> Thanks,
> Hongxu
>
>
>
>


