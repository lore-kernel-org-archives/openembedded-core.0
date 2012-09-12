Received: from giant.haxx.se ([80.67.6.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bjst@giant.haxx.se>) id 1TBjsq-0005JZ-C5
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 12:09:24 +0200
Received: from giant.haxx.se (localhost.localdomain [127.0.0.1])
	by giant.haxx.se (8.14.4/8.14.4/Debian-2) with ESMTP id q8C9urSj014647
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 11:56:53 +0200
Received: (from bjst@localhost)
	by giant.haxx.se (8.14.4/8.14.4/Submit) id q8C9uq4t014646
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 11:56:52 +0200
Date: Wed, 12 Sep 2012 11:56:52 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120912095652.GA696@giant>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIME-Autoconverted: from 8bit to quoted-printable by giant.haxx.se id
	q8C9urSj014647
Subject: Bug: LDFLAGS is not cleared for kernel devshell
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 10:09:24 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi.

I couldn't figure out where to properly patch this, so I'll just raise th=
e issue:

LDFLAGS is configured in bitbake.conf as linker flags to be passed to gcc=
, not to ld. Hence it uses the -Wl prefix.

The linux kernel build system inherits LDFLAGS from the environment and p=
asses it directly to 'ld', in conflict with the bitbake view. This proble=
m is avoided by clearing LDFLAGS and some other enviroment variables in k=
ernel.bbclass:kernel_do_compile().

However this clearing is not done for do_devshell, resulting in errors wh=
en trying to compile the kernel in devshell:

-----
sestofb10:linux>make
scripts/kconfig/conf --silentoldconfig Kconfig
  WRAP    arch/arm/include/generated/asm/auxvec.h
  WRAP    arch/arm/include/generated/asm/bitsperlong.h
  WRAP    arch/arm/include/generated/asm/cputime.h
  WRAP    arch/arm/include/generated/asm/emergency-restart.h
  WRAP    arch/arm/include/generated/asm/errno.h
  WRAP    arch/arm/include/generated/asm/ioctl.h
  WRAP    arch/arm/include/generated/asm/irq_regs.h
  WRAP    arch/arm/include/generated/asm/kdebug.h
  WRAP    arch/arm/include/generated/asm/local.h
  WRAP    arch/arm/include/generated/asm/local64.h
  WRAP    arch/arm/include/generated/asm/percpu.h
  WRAP    arch/arm/include/generated/asm/poll.h
  WRAP    arch/arm/include/generated/asm/resource.h
  WRAP    arch/arm/include/generated/asm/sections.h
  WRAP    arch/arm/include/generated/asm/siginfo.h
  WRAP    arch/arm/include/generated/asm/sizes.h
  CHK     include/linux/version.h
  UPD     include/linux/version.h
  CHK     include/generated/utsrelease.h
  UPD     include/generated/utsrelease.h
  Generating include/generated/mach-types.h
  CC      kernel/bounds.s
  GEN     include/generated/bounds.h
  CC      arch/arm/kernel/asm-offsets.s
  GEN     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTLD  scripts/mod/modpost
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/conmakehash
  CC      init/main.o
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  CC      init/do_mounts.o
  LD      init/mounts.o
arm-oe-linux-gnueabi-ld: unrecognized option '-Wl,-O1'
arm-oe-linux-gnueabi-ld: use the --help option for usage information
make[1]: *** [init/mounts.o] Error 1
make: *** [init] Error 2
sestofb10:linux>
-----

--=20
Bj=F6rn


