Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 86DFB610DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 08:55:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8N8tAN4003681
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 01:55:10 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 23 Sep 2013 01:55:10 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Sep 2013 16:55:06 +0800
Message-ID: <cover.1379488760.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [RFC YOCTO #5248] core-image-lsb: Why FPU doesn't work correctly on qemux86-64
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
X-List-Received-Date: Mon, 23 Sep 2013 08:55:09 -0000
Content-Type: text/plain

*Preparation
1, vim local.conf
...
DISTRO ?= "poky-lsb"
MACHINE ?= "qemux86-64"
...

*Problem
1, Build core-image-lsb
..
bitbake core-image-lsb
..

2, Start qemux86-64, there are 21 LSB tcl test failures on
qemux86-64, you could reproduce it by tcl interpreter:
  1, On qemux86-64's terminal, start tcl interpreter
  root@qemux86-64:~# $ tclsh
  %

  2, Run 'binary scan' to assign ieeeValues(-Subnormal)
  % binary scan \x00\x00\x00\x00\x00\x00\x08\x80 d ieeeValues(-Subnormal) 
  1

  3, Run 'puts' to output ieeeValues(-Subnormal), the result is '0.0'
  % puts $ieeeValues(-Subnormal)
  -0.0

  Expected:
  -1.1125369292536007e-308

*Analysis
1, On the previous environment, add IMAGE_INSTALL_append = " tcl" to
local.conf and build core-image-sato, the result is expected.

2, Trace tcl's source code, you could also reproduce the issue by
compiling and executing the following C codes on core-image-lsb-sdk.

  1) Build core-image-lsb-sdk, and Run qemux86-64.
  2) On target's terminal, create a C source file:
     root@qemux86-64:~# cat >> test.c << EOF
#include <stdio.h>

int main(int argc, char *argv[])
{
  double dd = 0;
  char *p = (char*)&dd;
  p[0] = 0x00;
  p[1] = 0x00;
  p[2] = 0x00;
  p[3] = 0x00;
  p[4] = 0x00;
  p[5] = 0x00;
  p[6] = 0x08;
  p[7] = 0x00;

  if (dd == 0.0)
    printf("Incorrect equal 0.0\n");
  else
    printf("Expected not equal 0.0\n");

  return 0;
}
EOF

  2) Compile test.c
    root@qemux86-64:~# gcc test.c -o test

  3, Execute test
  $ root@qemux86-64:~# ./test
    Incorrect equal 0.0

  Expected:
    Expected not equal 0.0

3, It's about x86-64's FPU: the SSE MXCSR register.
  If you invoke 'feenableexcept(FE_INEXACT);' or
  'feclearexcept(FE_INEXACT);' in the above C test,
  the issue will be fixed. In these two functions,
  the SSE MXCSR register has been handled.

*Solution
Is it necessary to invoke 'feenableexcept(FE_INEXACT);' or
'feclearexcept(FE_INEXACT);' to handle SSE MXCSR register?

Or any good idea about this issue.

Thanks,
Hongxu




-- 
1.8.1.2


