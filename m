Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1S2bOk-0007d1-Qt
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 05:44:18 +0100
Received: by obqv19 with SMTP id v19so1891802obq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 20:35:49 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.60.7.102 as permitted sender) client-ip=10.60.7.102; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.60.7.102 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.60.7.102])
	by 10.60.7.102 with SMTP id i6mr8023794oea.9.1330490149721 (num_hops =
	1); Tue, 28 Feb 2012 20:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=fUrMnC38nnw6A0f3IL3aS1nolzsMcn5yi8oUvS8YPwE=;
	b=cRNmbtvR4eGWN96X6cSOreHntUKY2jDIKavVKUlgY8prc9qJbNK2kAu2Kky6xmk616
	WOCXYG5ik7p0BFJ02Dch41CDV3CBxDMbrLXpZfTkPRtoYUhQb3fJ0vrqdu66UPtmGQoK
	E2LSSXAWR6F7XcuFaazp1ku2tXPYdhiq6e6vo=
MIME-Version: 1.0
Received: by 10.60.7.102 with SMTP id i6mr7115181oea.9.1330490149647; Tue, 28
	Feb 2012 20:35:49 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Tue, 28 Feb 2012 20:35:49 -0800 (PST)
Date: Tue, 28 Feb 2012 20:35:49 -0800
Message-ID: <CAGDS+nmNeyC3P+x+mk0g-qOKhkJ5pMNhX-ckBXr4F273poq2yw@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: psuedo-native strangeness on 64 bit build machine
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Feb 2012 04:44:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

I did a clean build on an Ubuntu 64 bit build machine a couple of days
ago with no issues.

After a pull of today I did an image build for an OMAP3 machine and
encountered an issue with psuedo-native.

First I got this familiar message:

Pseudo is not present but is required, building this first before the main build

which seemed a bit strange since pseudo was built in the previous
clean build.  The build proceeded until task 75 and then failed with
the following error:

NOTE: Running task 75 of 77 (ID: 6,
virtual:native:/home/steve/source/yocto/poky/meta/recipes-devtools/pseudo/pseudo_1.2.bb,
do_compile)
NOTE: package pseudo-native-1.2-r5: task do_compile: Started
ERROR: Function failed: do_compile (see
/media/data/yocto/tmp/work/x86_64-linux/pseudo-native-1.2-r5/temp/log.do_compile.32657
for further information)
ERROR: Logfile of failure stored in:
/media/data/yocto/tmp/work/x86_64-linux/pseudo-native-1.2-r5/temp/log.do_compile.32657
Log data follows:
| ERROR: Function failed: do_compile (see
/media/data/yocto/tmp/work/x86_64-linux/pseudo-native-1.2-r5/temp/log.do_compile.32657
for further information)
| SQLite header for version 3007010 found.
| NOTE: make -j 4 -e MAKEFLAGS= libpseudo
| ccache gcc -isystem/media/data/yocto/tmp/sysroots/x86_64-linux/usr/include
-O2 -pipe -pipe -std=gnu99 -Wall -W -Wextra -fPIC
-D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE -m32
-DPSEUDO_PREFIX='"/media/data/yocto/tmp/sysroots/x86_64-linux/usr"'
-DPSEUDO_SUFFIX='""' -DPSEUDO_BINDIR='"bin"'
-DPSEUDO_LIBDIR='"lib/pseudo/lib"'
-DPSEUDO_LOCALSTATEDIR='"var/pseudo"' -DPSEUDO_VERSION='"1.2"' -O2 -g
-L/media/data/yocto/tmp/sysroots/x86_64-linux/usr/lib
-I/media/data/yocto/tmp/sysroots/x86_64-linux/usr/include
-Wl,-R/media/data/yocto/tmp/sysroots/x86_64-linux/usr/lib -shared -o
lib/pseudo/lib/libpseudo.so \
| 		pseudo_client.o pseudo_ipc.o \
| 		pseudo_wrappers.o pseudo_tables.o pseudo_util.o -ldl -lpthread
| /usr/bin/ld: i386:x86-64 architecture of input file
`pseudo_client.o' is incompatible with i386 output
| /usr/bin/ld: i386:x86-64 architecture of input file `pseudo_ipc.o'
is incompatible with i386 output
| /usr/bin/ld: i386:x86-64 architecture of input file
`pseudo_wrappers.o' is incompatible with i386 output
| /usr/bin/ld: i386:x86-64 architecture of input file
`pseudo_tables.o' is incompatible with i386 output
| /usr/bin/ld: i386:x86-64 architecture of input file `pseudo_util.o'
is incompatible with i386 output
| /usr/bin/ld: final link failed: Invalid operation
| collect2: ld returned 1 exit status
| make: *** [lib/pseudo/lib/libpseudo.so] Error 1
| ERROR: oe_runmake failed
NOTE: package pseudo-native-1.2-r5: task do_compile: Failed
ERROR: Task 6 (virtual:native:/home/steve/source/yocto/poky/meta/recipes-devtools/pseudo/pseudo_1.2.bb,
do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 75 tasks of which 74 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:
  virtual:native:/home/steve/source/yocto/poky/meta/recipes-devtools/pseudo/pseudo_1.2.bb,
do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Has anyone else been successful building on 64 bit machines?

I see no issues on my 32 bit build machines.

Forcing a clean build of pseudo (by hand, since -c cleansstate
obviously won't work with pseudo-native!) resulted in a good build,
both of psuedo-native and the image.

Any ideas?

Steve


