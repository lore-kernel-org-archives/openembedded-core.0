Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TyLux-0001Bf-MR
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 13:28:31 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r0OCCrXS018390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 24 Jan 2013 13:12:55 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TyLg1-0007Hp-2z; Thu, 24 Jan 2013 13:13:05 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1358634922.git.raj.khem@gmail.com>
	<613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
	<lyobghp6nh.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<50FEBF6A.40305@gmail.com>
Date: Thu, 24 Jan 2013 13:13:05 +0100
Message-ID: <lyham6g4oe.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Changing between gold and bfd linker (was: [PATCH 1/4] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC)
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
X-List-Received-Date: Thu, 24 Jan 2013 12:28:31 -0000
Content-Type: text/plain

Khem Raj <raj.khem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

>>> +KERNEL_LD = "${LD} ${HOST_LD_KERNEL_ARCH}"
>>> ...
>>> -KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
>>
>> that's bad... gold linker has serious problems to compile stuff like
>> kernel or bootloaders and setting 'KERNEL_LDSUFFIX = .bfd' was a good
>> way to workaround these problems.
>>
>
> This was not the intended use of KERNEL_LD IMO.

ok; then I abused it for this purpose and stuff failed more or less
silently with recent oe ;)

Me wonders whether we should implement a more generic way to select
between .bfd and .gold linker.  Overriding LD works well when LD is used
by the build system, but when it is called through gcc -> collect there
is no way to select the linker.

For grub2 I use

------
PATH_prepend = "${S}/.bin:"
CC_prepend = "env COMPILER_PATH=${S}/.bin/gcc "

do_configure_prepend() {
    mkdir -p .bin/gcc
    { echo "#!/bin/sh"
      echo 'exec ${TARGET_PREFIX}ld.bfd "$@"'
    } > .bin/${TARGET_PREFIX}ld
    chmod +x .bin/${TARGET_PREFIX}ld
    ln -s ../${TARGET_PREFIX}ld .bin/gcc/ld
}
------

which might go into a more general .bbclass.

Modifying binutils or gcc to select the wanted linker is probably the
2nd best solution (after fixing gold linker). E.g. for binutils, the
'arm-linux-gnueabi-ld' binary (or however it is called) which is a copy
of .bfd or .gold atm can be replaced by a oe specific program which
calls the corresponding linker depending on an environment variable.

Changing gcc seems to be more difficultly because name of ld is determined
at multiple locations.

So we have to following options:

1. keep things as is; when problems with gold arise[1], people have to turn
   it of globally

2. create a 'custom-ld.bbclass' which is inherited on demand

3. create custom 'ld' program evaluating '${OE_LDSUFFIX}' which is set
   on demand

4. patch gcc/collect to call a linker specified by environment


I favor 3; what do you think?



Enrico

Footnotes: 
[1]  I am aware of
     * kernel (--> '--march=all' object file mismatch)
     * barebox (--> optimizing away constructors with '--gc-shared')
     * grub2 (--> disfunctional with gold; no further details)

-- 
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz


