Return-Path: <ulfalizer@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 86AF66011C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 09:28:52 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id e185so61305745vkb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=GnAaWFVISBU+hdYSZNtFqg3lb7pgZE+qKOd9jIWx2AI=;
	b=jz93z93DPcyv6zLNhW9mI+roUOwVSFXJ0OG5WY1TM1ECUzXdBjMxLNetXw4x0N1Z08
	97Jy7koOjO7Bw1ZgpqzmLw3VYfML93MyDXRkSqOerLL3ybOyTDb4mkjA9TbMafpWKiQ5
	xsL6Yx2CpSIseRWIynxVfoeo8V27DCRAgE6tWfBTfQvL2j9qwlSxRPzd99YbfBnzaB30
	Gmw8k+GR2h5zDcsOCz2c0SKm5757/sOaESrZnQ1bKijqJ93RE/ND7Zv9pjfKnWeMOWgD
	qAJkGwL3lSDIaHOO0vAF8xh4Ix1jGS5qEhfKgarwdYiG64A3SfAKhYyJNHSChNX93KNo
	kE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=GnAaWFVISBU+hdYSZNtFqg3lb7pgZE+qKOd9jIWx2AI=;
	b=OM4f1GohCB4hZ7A0VPH8ORbNOjFT8T3zjaz5o3S8sGL1omkLIYOMC+7Vps8HLhaXjS
	GCazl5Cj6EUkgY6mKyT7TvFqjLFZpQIZf0fPcdRQEsr7GqjqLRZs+ckozhmsnvBf/Dmq
	FTepUZp9Jw59yYWQ43EtyOR00yTN0xCJXkNaNcTRlW9VyiGoU0ZTUppJwtfxMojshrgM
	hkEvnmcA1lPYFvoHFapqX8cwOtMgGxhlKgd7MqIXqHKm9kBTdlfuPJyaA73Jekz8x35n
	Zzi0Ixo5eLzTcg4CfYn5RWQN06gqci/D942KvquEUeb7lHEP+mDA66vySgk/XaFwcvbx
	dWyw==
X-Gm-Message-State: AOPr4FW4jmOaYRM9fZYnCrcMjDBhsqfIemQcd4c1nPO39NbSTJjh00V+/iK7AW+omcVfCq/M0X42Fz2w17KH2Q==
MIME-Version: 1.0
X-Received: by 10.31.58.139 with SMTP id h133mr4133117vka.158.1460539733292;
	Wed, 13 Apr 2016 02:28:53 -0700 (PDT)
Received: by 10.103.102.6 with HTTP; Wed, 13 Apr 2016 02:28:53 -0700 (PDT)
In-Reply-To: <CAFkk2KSu80ndUE=KDJeVmU4_CLZTOpJXN7g9=-W=DEkn7Khs2g@mail.gmail.com>
References: <CAFkk2KSu80ndUE=KDJeVmU4_CLZTOpJXN7g9=-W=DEkn7Khs2g@mail.gmail.com>
Date: Wed, 13 Apr 2016 11:28:53 +0200
Message-ID: <CAFkk2KRFsRXmh9rX+mhJpKXT1pqHoSkezF7ALrEsDy_v0Wy+MA@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: Build failures due to libtdb racing with libbsd
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
X-List-Received-Date: Wed, 13 Apr 2016 09:28:53 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 13, 2016 at 11:07 AM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
> Hello,
>
> I get libtdb build failures like the following. The failing file
> varies between runs.
>
> ERROR: oe_runmake failed
> ERROR: Function failed: do_compile
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 16 -e MAKEFLAGS=
> | WAF_MAKE=1 PATH=buildtools/bin:../../buildtools/bin:$PATH waf build
> | Checking project rules ...
> | Project rules pass
> | [  1/100] Generating tdb.vscript
> | [  2/100] Compiling lib/replace/replace.c
> | [  3/100] Compiling lib/replace/cwrap.c
> | [  4/100] Generating PKGCONFIG_tdb.pc
> | [  5/100] Compiling lib/replace/replace.c
> | [  6/100] Compiling lib/replace/test/testsuite.c
> | [  7/100] Compiling lib/replace/test/strptime.c
> | [  8/100] Compiling lib/replace/test/os2_delete.c
> | [  9/100] Compiling lib/replace/test/getifaddrs.c
> | [ 10/100] Compiling common/check.c
> | [ 11/100] Compiling common/error.c
> | [ 12/100] Compiling common/tdb.c
> | [ 13/100] Compiling common/traverse.c
> | [ 14/100] Compiling common/freelistcheck.c
> | [ 15/100] Compiling common/lock.c
> | [ 16/100] Compiling common/dump.c
> | [ 17/100] Compiling common/freelist.c
> | [ 18/100] Compiling common/io.c
> | [ 19/100] Compiling common/open.c
> | [ 20/100] Compiling common/transaction.c
> | [ 21/100] Compiling common/hash.c
> | [ 22/100] Compiling common/summary.c
> | [ 23/100] Compiling common/rescue.c
> | [ 24/100] Compiling common/mutex.c
> | [ 25/100] Compiling tools/tdbtorture.c
> | In file included from ../tools/tdbtorture.c:5:0:
> | ../lib/replace/replace.h:151:24: fatal error: bsd/string.h: No such
> file or directory
> |  #include <bsd/string.h>
> |                         ^
> | compilation terminated.
> | Build failed:  -> task failed (err #1):
> |     {task: cc tdbtorture.c -> tdbtorture_5.o}
> | make: *** [all] Error 1
> | WARNING: exit code 1 from a shell command.
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile
> NOTE: recipe libtdb-1.3.0-r0: task do_compile: Failed
>
> The problem seems to be a race with building libbsd (and unlucky
> timing in my build). Adding libbsd to DEPENDS fixes the problem.
>
> For some added context, libtdb uses a nonstandard ./configure from the
> Samba project based on a configuration utility called Waf that I'm a
> complete noob on. Perhaps there is some way to disable libbsd support
> instead.
>
> Cheers,
> Ulf

I also found this fix which doesn't seem to have been merged - seems to
be a similar issue, though for a different dependency:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-November/104623.html


Cheers,
Ulf

