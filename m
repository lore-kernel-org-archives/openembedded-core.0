Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 57983792C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 05:53:16 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7H5rE0r027388
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 17 Aug 2018 06:53:15 +0100
Message-ID: <e8e403ab1cd0a3e4a5754d4d4079508946da0c3f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Aug 2018 06:53:14 +0100
In-Reply-To: <3927163d00059d0559412175c903ba60ce383dcd.camel@linuxfoundation.org>
References: <1534453421-28943-1-git-send-email-bruce.ashfield@windriver.com>
	<CADkTA4OrPcXQEZ+d1HEeNZBrJy_VcyJcv_7DmhnBddmLQPVYZg@mail.gmail.com>
	<3927163d00059d0559412175c903ba60ce383dcd.camel@linuxfoundation.org>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Fri, 17 Aug 2018 05:53:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-08-16 at 22:44 +0100, richard.purdie@linuxfoundation.org
wrote:
> On Thu, 2018-08-16 at 17:08 -0400, Bruce Ashfield wrote:
> > I'm getting a strange install issue with x86 that I've never seen
> > before, and that
> > part is unchanged from v3 to v4.
> > 
> > .. and then I realized that a file has changed in my builds, since
> > I'm
> > working on 4.18.
> > 
> > This is worth testing on the autobuilder, but I will have a v5 that
> > adds a test for some
> > files that may go missing, and hence we'll have issues across
> > versions.
> 
> Thanks, I've added it into a build with a glibc and openssl change
> and
> set it away so its possible other issues may occur, we'll see how it
> works out...

The openssl change caused problems but I did spot qemumips64 failing:

NOTE: ======================================================================
| NOTE: FAIL: test_kernel_module (kernelmodule.KernelModuleTest)
| NOTE: ----------------------------------------------------------------------
| NOTE: Traceback (most recent call last):
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips64/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips64/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips64/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips64/build/meta/lib/oeqa/runtime/cases/kernelmodule.py", line 40, in test_kernel_module
|     self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
| AssertionError: 2 != 0 : cd /usr/src/kernel && make scripts prepare
|   HOSTCC  scripts/basic/fixdep
|   HOSTCC  scripts/basic/bin2c
|   HOSTCC  scripts/kconfig/conf.o
|   SHIPPED scripts/kconfig/zconf.tab.c
|   SHIPPED scripts/kconfig/zconf.lex.c
|   HOSTCC  scripts/kconfig/zconf.tab.o
| In file included from scripts/kconfig/zconf.tab.c:2468:
| scripts/kconfig/confdata.c: In function 'conf_write':
| scripts/kconfig/confdata.c:773:19: warning: '%s' directive writing likely 7 or more bytes into a region of size between 1 and 4097 [-Wformat-overflow=]
|   sprintf(newname, "%s%s", dirname, basename);
|                    ^~~~~~
| scripts/kconfig/confdata.c:773:19: note: assuming directive output of 7 bytes
| scripts/kconfig/confdata.c:773:2: note: 'sprintf' output 1 or more bytes (assuming 4104) into a destination of size 4097
|   sprintf(newname, "%s%s", dirname, basename);
|   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| scripts/kconfig/confdata.c:776:20: warning: '.tmpconfig.' directive writing 11 bytes into a region of size between 1 and 4097 [-Wformat-overflow=]
|    sprintf(tmpname, "%s.tmpconfig.%d", dirname, (int)getpid());
|                     ^~~~~~~~~~~~~~~~~
| scripts/kconfig/confdata.c:776:3: note: 'sprintf' output between 13 and 4119 bytes into a destination of size 4097
|    sprintf(tmpname, "%s.tmpconfig.%d", dirname, (int)getpid());
|    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|   HOSTLD  scripts/kconfig/conf
| scripts/kconfig/conf  --silentoldconfig Kconfig
|   WRAP    arch/mips/include/generated/uapi/asm/ipcbuf.h
|   WRAP    arch/mips/include/generated/asm/clkdev.h
|   WRAP    arch/mips/include/generated/asm/current.h
|   WRAP    arch/mips/include/generated/asm/dma-contiguous.h
|   WRAP    arch/mips/include/generated/asm/emergency-restart.h
|   WRAP    arch/mips/include/generated/asm/export.h
|   WRAP    arch/mips/include/generated/asm/irq_work.h
|   WRAP    arch/mips/include/generated/asm/local64.h
|   WRAP    arch/mips/include/generated/asm/mcs_spinlock.h
|   WRAP    arch/mips/include/generated/asm/mm-arch-hooks.h
|   WRAP    arch/mips/include/generated/asm/parport.h
|   WRAP    arch/mips/include/generated/asm/percpu.h
|   WRAP    arch/mips/include/generated/asm/preempt.h
|   WRAP    arch/mips/include/generated/asm/qrwlock.h
|   WRAP    arch/mips/include/generated/asm/qspinlock.h
|   WRAP    arch/mips/include/generated/asm/sections.h
|   WRAP    arch/mips/include/generated/asm/segment.h
|   WRAP    arch/mips/include/generated/asm/trace_clock.h
|   WRAP    arch/mips/include/generated/asm/unaligned.h
|   WRAP    arch/mips/include/generated/asm/user.h
|   WRAP    arch/mips/include/generated/asm/word-at-a-time.h
|   WRAP    arch/mips/include/generated/asm/xor.h
|   HOSTCC  scripts/dtc/dtc.o
|   HOSTCC  scripts/dtc/flattree.o
|   HOSTCC  scripts/dtc/fstree.o
|   HOSTCC  scripts/dtc/data.o
|   HOSTCC  scripts/dtc/livetree.o
|   HOSTCC  scripts/dtc/treesource.o
|   HOSTCC  scripts/dtc/srcpos.o
|   HOSTCC  scripts/dtc/checks.o
|   HOSTCC  scripts/dtc/util.o
|   SHIPPED scripts/dtc/dtc-lexer.lex.c
|   SHIPPED scripts/dtc/dtc-parser.tab.h
|   HOSTCC  scripts/dtc/dtc-lexer.lex.o
|   SHIPPED scripts/dtc/dtc-parser.tab.c
|   HOSTCC  scripts/dtc/dtc-parser.tab.o
|   HOSTLD  scripts/dtc/dtc
|   CC      scripts/mod/empty.o
|   HOSTCC  scripts/mod/mk_elfconfig
|   MKELF   scripts/mod/elfconfig.h
|   HOSTCC  scripts/mod/modpost.o
|   CC      scripts/mod/devicetable-offsets.s
|   CHK     scripts/mod/devicetable-offsets.h
|   UPD     scripts/mod/devicetable-offsets.h
|   HOSTCC  scripts/mod/file2alias.o
|   HOSTCC  scripts/mod/sumversion.o
|   HOSTLD  scripts/mod/modpost
|   HOSTCC  scripts/kallsyms
|   HOSTCC  scripts/conmakehash
|   HOSTCC  scripts/sortextable
|   HOSTCC  arch/mips/boot/tools/relocs_32.o
|   HOSTCC  arch/mips/boot/tools/relocs_64.o
|   HOSTCC  arch/mips/boot/tools/relocs_main.o
|   HOSTLD  arch/mips/boot/tools/relocs
|   CHK     include/config/kernel.release
|   CHK     include/generated/uapi/linux/version.h
|   CHK     include/generated/utsrelease.h
|   Checking missing-syscalls for N32
| make[1]: *** No rule to make target 'missing-syscalls'.  Stop.
| make: *** [arch/mips/Makefile:422: archprepare] Error 2

https://autobuilder.yocto.io/builders/nightly-mips64/builds/1209/steps/Running%20Sanity%20Tests/logs/stdio

I think the kernel piece was otherwise good.

Cheers,

Richard

