Return-Path: <ulfalizer@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id BB99A6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 09:07:17 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id t129so60682261vkg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 02:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc;
	bh=KhBPQh+2p/py5r/8dWM2x3BQ3eMBWXHJmmeJ+AoG90I=;
	b=ta+rN9GHpsR5Y3l4CCiDHxrzCbByq10RCjVs3GtglVk/bdfGebYLe4xHk8ZAQ0rvev
	FVOHfGdk8TuynfMjmZ6UqZQmFqOg5ihN7xRt1NZ69yzvIj4JNGx8SOvXytoesd8Ortll
	k3pzAmSTsDwmrf0U7kwkVeD33Q3PeTtx9RoTzC3cMlU+bJ3uazGIVUwC2avi/svUM84k
	bSiNibwc/lQ+jKG9pSBS3OTvzZLVu03bPw2yneGE5REuTYDzYb7tGzI15VQOkL6pcfy+
	o4DaCvXXlEZAx84C8H9aNj9QeGK8ZLDjaA9W5HrhJ/90+tXCynpCRlGWMJdcdYPOsac/
	ms+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc;
	bh=KhBPQh+2p/py5r/8dWM2x3BQ3eMBWXHJmmeJ+AoG90I=;
	b=O0//+yNNZR0pBVjV6D108Ef8fKMHBaSczuYME8oY24WdnDwoslmfhaiy+1FLOVCN3U
	cIq72D10XImHQbXOFfup7PhzH5vDwtpUzep/s/3k6nTGGzSS1y6BY/Vj1gHvo9M+HTbI
	/cD+afNIfmEjhuSH94qEgS/yxXV/XMVDgkeIPTPAuLkGTkHJwPScEdiTqsaVjXXYzeSs
	GbIu3w+mWvUoqILafcU00MocEV1lVdQFdIVXG/9uhFB/PpJcDr52huFfJBKZKniYlQTq
	Q3Sb6YMcJV961aX3tFhAZXJl9dFD6j8FkNyZjPZ5r/4eyYrobIZ46MaDDI1OCJ83G1Zs
	pCQw==
X-Gm-Message-State: AOPr4FVp0+ndMH7i4kBqmSb/KeU+Rvv9SDe8VR7aPc1XeHYuY/KtknPHMM1BnmkCY/3SlfoJivpV6cGt5QVq3A==
MIME-Version: 1.0
X-Received: by 10.159.38.114 with SMTP id 105mr4277214uag.27.1460538437606;
	Wed, 13 Apr 2016 02:07:17 -0700 (PDT)
Received: by 10.103.102.6 with HTTP; Wed, 13 Apr 2016 02:07:17 -0700 (PDT)
Date: Wed, 13 Apr 2016 11:07:17 +0200
Message-ID: <CAFkk2KSu80ndUE=KDJeVmU4_CLZTOpJXN7g9=-W=DEkn7Khs2g@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Build failures due to libtdb racing with libbsd
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
X-List-Received-Date: Wed, 13 Apr 2016 09:07:22 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I get libtdb build failures like the following. The failing file
varies between runs.

ERROR: oe_runmake failed
ERROR: Function failed: do_compile
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -e MAKEFLAGS=
| WAF_MAKE=1 PATH=buildtools/bin:../../buildtools/bin:$PATH waf build
| Checking project rules ...
| Project rules pass
| [  1/100] Generating tdb.vscript
| [  2/100] Compiling lib/replace/replace.c
| [  3/100] Compiling lib/replace/cwrap.c
| [  4/100] Generating PKGCONFIG_tdb.pc
| [  5/100] Compiling lib/replace/replace.c
| [  6/100] Compiling lib/replace/test/testsuite.c
| [  7/100] Compiling lib/replace/test/strptime.c
| [  8/100] Compiling lib/replace/test/os2_delete.c
| [  9/100] Compiling lib/replace/test/getifaddrs.c
| [ 10/100] Compiling common/check.c
| [ 11/100] Compiling common/error.c
| [ 12/100] Compiling common/tdb.c
| [ 13/100] Compiling common/traverse.c
| [ 14/100] Compiling common/freelistcheck.c
| [ 15/100] Compiling common/lock.c
| [ 16/100] Compiling common/dump.c
| [ 17/100] Compiling common/freelist.c
| [ 18/100] Compiling common/io.c
| [ 19/100] Compiling common/open.c
| [ 20/100] Compiling common/transaction.c
| [ 21/100] Compiling common/hash.c
| [ 22/100] Compiling common/summary.c
| [ 23/100] Compiling common/rescue.c
| [ 24/100] Compiling common/mutex.c
| [ 25/100] Compiling tools/tdbtorture.c
| In file included from ../tools/tdbtorture.c:5:0:
| ../lib/replace/replace.h:151:24: fatal error: bsd/string.h: No such
file or directory
|  #include <bsd/string.h>
|                         ^
| compilation terminated.
| Build failed:  -> task failed (err #1):
|     {task: cc tdbtorture.c -> tdbtorture_5.o}
| make: *** [all] Error 1
| WARNING: exit code 1 from a shell command.
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile
NOTE: recipe libtdb-1.3.0-r0: task do_compile: Failed

The problem seems to be a race with building libbsd (and unlucky
timing in my build). Adding libbsd to DEPENDS fixes the problem.

For some added context, libtdb uses a nonstandard ./configure from the
Samba project based on a configuration utility called Waf that I'm a
complete noob on. Perhaps there is some way to disable libbsd support
instead.

Cheers,
Ulf

