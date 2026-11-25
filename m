Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46865.1795627426415153813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 09:23:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jG1Xrxep;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E19144E4177F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 17:23:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B651960480;
	Wed, 25 Nov 2026 17:23:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3247111E6A078;
	Wed, 25 Nov 2026 18:23:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795627423; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ioxWuqD/Pe9OmgaBg6b3jYL9L0upiBK8Scrwg5Afv60=;
	b=jG1XrxepYMzDAP0elCFYGkYr01iAY+Yo3zR8ae/u/lC504WO5IcWC8BotBiB8fQl56EvMx
	oq3a5HJ4unpAqfZew/khnWD+3RDMttnyGpUw3/ATwaLcExkeoD77HO03Xbn1XeeZdPqdx5
	4YOzw4Jgu+SKWMzPcTle02JmP39o8so4PmhAQr7EnWT7Z/3+oUU9/KPjo0+7iE1B792f32
	JafNh8Yxg/RUEqDi0MVH8TLvnZ8/fGn/Edh0vfHp0QiOWjkFNcrfHVLbd24cYN20yfducF
	8TazRDi5JqoXJDpIw5zKcj3/QQpwaKk9FdiRQV5nWSE4nibj5/7v6/SZoB+kqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 18:23:41 +0100
Message-Id: <DN4GSPC8PC44.2P1HUAAJ5VIH7@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mark.hatle@amd.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] pseudo: Update to 1.99.2 version
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261124233615.95452-1-mark.hatle@amd.com>
In-Reply-To: <20261124233615.95452-1-mark.hatle@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 17:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251233

On Wed Nov 25, 2026 at 12:36 AM CET, Mark Hatle via openembedded-core wrote=
:
> Changelog from last version:
>
>     Makefile.in: call this 1.99.2
>     Replace FASTOP with requests that don't wait for a reply
>     Send client requests over one shared datagram socket
>     pseudo_server: Log when running in a confined SELinux domain
>     ports/linux: Report SELinux as disabled under pseudo
>     README.security: Describe io_uring refusal and the host fallback
>     ports/linux: Refuse io_uring in the kernel rather than be bypassed by=
 it
>     ports/linux/pseudo_wrappers: Report io_uring as unsupported in syscal=
l()
>     openat2: Look at dirfd for an empty path
>     ports/linux: Pass an empty openat() path to the kernel
>     ports/linux: Wrap name_to_handle_at() and open_by_handle_at()
>     pseudo_client: Fail when the local state directory isn't writable
>     ports/linux/pseudo_wrappers: Fake seccomp strict mode in syscall()
>     ports/linux/pseudo_wrappers: Fake seccomp filters set by prctl()
>     test-seccomp: Check that seccomp is never really enabled
>     ports/linux/pseudo_wrappers: Report Landlock as unsupported
>     pseudo_client: Connect to the server without changing directory
>     test-landlock: Add a Landlock sandbox test
>     Wrap execvpe(), fexecve() and execveat()
>     wrappers: Don't re-block signals in nested wrapper calls
>     pseudo_util: Skip unneeded lstat calls when canonicalizing paths
>     configure: Fix the --enable-profiling default
>     doc: Update README and doc/ to match the code
>     configure: Require GCC 5 or later
>     ports/linux: Don't require <linux/mount.h>
>     pseudo.1: Update to match the current code
>     pseudo_util: Write the event log to PSEUDO_EVLOG_FILE
>     pseudo: List -p in the usage message
>     pseudo_util: Fix the date format in the event log dump
>     AGENTS.md: Add to assist future developers
>     pseudo_util: Make -v and numeric PSEUDO_DEBUG add debug flags
>     pseudo: Fix the -k severity option
>     pseudo_util: Store PSEUDO_SEVERITY as severity names
>     pseudo_server: Set highest_client to the new client when growing
>     pseudo_server: Lower highest_client when the highest client closes
>     configure: Fix --disable-* options
>     pseudo_server: Always use epoll
>     pseudo_server: Drop an idle client when out of file descriptors
>     pseudo_server: Skip events for clients closed earlier in the batch
>     ports/linux: Drop redundant PSEUDO_LINK_SYMLINK_BEHAVIOR override
>     ports/common/subports: Show the unknown OS name in the error
>     pseudo_util: Remove stale with_libpseudo() comment
>     Replace #if 0 strerror() debug messages with a comment
>     Remove unused #if 0 debug code
>     patches/yocto-older-glibc-symbols.patch: Update to latest YP version
>     ports: Let the port define how pseudo stats files
>     ports/unix: Remove guts overridden by the Linux port
>     ports: Remove PSEUDO_NO_REAL_AT_FUNCTIONS
>     test-parallel-ops: Add a parallel create/rename/link/chmod test
>     ports: check created files under the path lock before recording them
>     ports: hold the path lock in create and metadata wrappers
>     pseudo_client: serialize path changes across clients
>     Makefile.in: Declare 1.99.1
>     README.security: Add information specific to file/process security
>     test-chroot-proc-dev: Add /proc and /dev within a chroot test
>     test-proc-fd: Add a stale directory descriptor case
>     pseudo_client.h: remove dangling pseudo_client_fdpath declaration
>     pseudo_client: resolve /proc/<pid>/fd/<n> to the descriptor
>     makewrappers: Allow the wrapper architecture to be set for cross buil=
ds
>     makewrappers: Change 'Warning' to 'Info'
>     makewrappers: Don't generate unused _int paths with noignore_path
>     ports: Remove Darwin (macOS) support
>     test: Skip open_tree tests when the function or syscall is unavailabl=
e
>     ports/linux/guts: Fix uninitialized pseudo_path in open_tree wrappers
>
> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> ---

Hi Mark,

Thanks for the upgrade. I believe we also need to drop or brease some
patches:

ERROR: pseudo-native-1.99.2+git-r0 do_patch: Applying patch '/srv/pokybuild=
/yocto-worker/qemux86-tc/build/layers/openembedded-core/meta/recipes-devtoo=
ls/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.p=
atch' on target directory '/srv/pokybuild/yocto-worker/qemux86-tc/build/bui=
ld-st-184298/tmp/work/x86_64-linux/pseudo-native/1.99.2+git/sources/pseudo-=
1.99.2+git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/qemux86-tc/build/buil=
d-st-184298/tmp/work/x86_64-linux/pseudo-native/1.99.2+git/recipe-sysroot-n=
ative/etc/quiltrc push', 1, 'stdout: Applying patch 0001-makewrappers-Allow=
-the-wrapper-architecture-to-be-se.patch
patching file Makefile.in
Hunk #1 FAILED at 34.
...
Patch 0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch does =
not apply (enforce with -f)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/5051

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

