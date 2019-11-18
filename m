Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 054767F8BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 17:17:31 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id xAIHHUOY014981;
	Mon, 18 Nov 2019 11:17:31 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 11:17:29 -0600
Message-Id: <20191118171730.153048-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/1] Add PREFIX and EXEC_PREFIX to gccrelocprefix section
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
X-List-Received-Date: Mon, 18 Nov 2019 17:17:32 -0000

I have an unusual use-case that requires me to move the location of gcc.
As part of this, I noticed that the built-in include paths were not being
runtime relocated, while other paths were.  It turns out this was becaue
PREFIX/EXEC_PREFIX were being used as defined at build time, but the other
prefixes were being used as relocated at SDK install time.

The patch set corrects this and adds PREFIX/EXEC_PREFIX to the list.  There
is no test case for this, as I'm not sure how we could ever test this with
the standard OE SDKs.

The way I tested this code change was:

bitbake meta-toolchain

install the SDK

wrap all of the executables in the HOST sysroot with:

exec <LDSO> --library-path <LIBPATH>:<LIBBASEPATH> <executable> $@

mv the 'installed' version else where and then build a simple hellow world
application.

Doing this before the change resulted in 'unable to find <stddef.h>', after
the change it works as expected.  Use the '-v' to inspect what it was doing
it was clear that runtime relocation was NOT relocating the system include
paths before the change.

Mark Hatle (1):
  gcc-9.2: Update the relocation patch to add PREFIX/EXEC_PREFIX

 ...le-sysroot-support-for-nativesdk-gcc.patch | 185 +++++++++++++++---
 1 file changed, 159 insertions(+), 26 deletions(-)

-- 
2.17.1


