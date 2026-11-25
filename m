Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47290.1795628485927129302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 09:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 6APHfDq71078030;
	Wed, 25 Nov 2026 11:41:14 -0600
Received: from [192.168.2.97] ([192.168.2.97])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 6APHfDjT029361;
	Wed, 25 Nov 2026 11:41:13 -0600
Message-ID: <10a2aa53-261e-4d93-b452-83f842735962@kernel.crashing.org>
Date: Wed, 25 Nov 2026 11:41:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] pseudo: Update to 1.99.2 version
To: mathieu.dubois-briand@bootlin.com, mark.hatle@amd.com,
        openembedded-core@lists.openembedded.org
References: <20261124233615.95452-1-mark.hatle@amd.com>
 <DN4GSPC8PC44.2P1HUAAJ5VIH7@bootlin.com>
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <DN4GSPC8PC44.2P1HUAAJ5VIH7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 17:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251235

I agree.  I made that change locally, but must have not included it into the 
commit version I sent.  I will send up a V2, sorry for wasting your time on this 
it was my mistake.

--Mark

On 11/25/26 11:23 AM, Mathieu Dubois-Briand via openembedded-core wrote:
> On Wed Nov 25, 2026 at 12:36 AM CET, Mark Hatle via openembedded-core wrote:
>> Changelog from last version:
>>
>>      Makefile.in: call this 1.99.2
>>      Replace FASTOP with requests that don't wait for a reply
>>      Send client requests over one shared datagram socket
>>      pseudo_server: Log when running in a confined SELinux domain
>>      ports/linux: Report SELinux as disabled under pseudo
>>      README.security: Describe io_uring refusal and the host fallback
>>      ports/linux: Refuse io_uring in the kernel rather than be bypassed by it
>>      ports/linux/pseudo_wrappers: Report io_uring as unsupported in syscall()
>>      openat2: Look at dirfd for an empty path
>>      ports/linux: Pass an empty openat() path to the kernel
>>      ports/linux: Wrap name_to_handle_at() and open_by_handle_at()
>>      pseudo_client: Fail when the local state directory isn't writable
>>      ports/linux/pseudo_wrappers: Fake seccomp strict mode in syscall()
>>      ports/linux/pseudo_wrappers: Fake seccomp filters set by prctl()
>>      test-seccomp: Check that seccomp is never really enabled
>>      ports/linux/pseudo_wrappers: Report Landlock as unsupported
>>      pseudo_client: Connect to the server without changing directory
>>      test-landlock: Add a Landlock sandbox test
>>      Wrap execvpe(), fexecve() and execveat()
>>      wrappers: Don't re-block signals in nested wrapper calls
>>      pseudo_util: Skip unneeded lstat calls when canonicalizing paths
>>      configure: Fix the --enable-profiling default
>>      doc: Update README and doc/ to match the code
>>      configure: Require GCC 5 or later
>>      ports/linux: Don't require <linux/mount.h>
>>      pseudo.1: Update to match the current code
>>      pseudo_util: Write the event log to PSEUDO_EVLOG_FILE
>>      pseudo: List -p in the usage message
>>      pseudo_util: Fix the date format in the event log dump
>>      AGENTS.md: Add to assist future developers
>>      pseudo_util: Make -v and numeric PSEUDO_DEBUG add debug flags
>>      pseudo: Fix the -k severity option
>>      pseudo_util: Store PSEUDO_SEVERITY as severity names
>>      pseudo_server: Set highest_client to the new client when growing
>>      pseudo_server: Lower highest_client when the highest client closes
>>      configure: Fix --disable-* options
>>      pseudo_server: Always use epoll
>>      pseudo_server: Drop an idle client when out of file descriptors
>>      pseudo_server: Skip events for clients closed earlier in the batch
>>      ports/linux: Drop redundant PSEUDO_LINK_SYMLINK_BEHAVIOR override
>>      ports/common/subports: Show the unknown OS name in the error
>>      pseudo_util: Remove stale with_libpseudo() comment
>>      Replace #if 0 strerror() debug messages with a comment
>>      Remove unused #if 0 debug code
>>      patches/yocto-older-glibc-symbols.patch: Update to latest YP version
>>      ports: Let the port define how pseudo stats files
>>      ports/unix: Remove guts overridden by the Linux port
>>      ports: Remove PSEUDO_NO_REAL_AT_FUNCTIONS
>>      test-parallel-ops: Add a parallel create/rename/link/chmod test
>>      ports: check created files under the path lock before recording them
>>      ports: hold the path lock in create and metadata wrappers
>>      pseudo_client: serialize path changes across clients
>>      Makefile.in: Declare 1.99.1
>>      README.security: Add information specific to file/process security
>>      test-chroot-proc-dev: Add /proc and /dev within a chroot test
>>      test-proc-fd: Add a stale directory descriptor case
>>      pseudo_client.h: remove dangling pseudo_client_fdpath declaration
>>      pseudo_client: resolve /proc/<pid>/fd/<n> to the descriptor
>>      makewrappers: Allow the wrapper architecture to be set for cross builds
>>      makewrappers: Change 'Warning' to 'Info'
>>      makewrappers: Don't generate unused _int paths with noignore_path
>>      ports: Remove Darwin (macOS) support
>>      test: Skip open_tree tests when the function or syscall is unavailable
>>      ports/linux/guts: Fix uninitialized pseudo_path in open_tree wrappers
>>
>> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
>> ---
> 
> Hi Mark,
> 
> Thanks for the upgrade. I believe we also need to drop or brease some
> patches:
> 
> ERROR: pseudo-native-1.99.2+git-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/qemux86-tc/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch' on target directory '/srv/pokybuild/yocto-worker/qemux86-tc/build/build-st-184298/tmp/work/x86_64-linux/pseudo-native/1.99.2+git/sources/pseudo-1.99.2+git'
> CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/qemux86-tc/build/build-st-184298/tmp/work/x86_64-linux/pseudo-native/1.99.2+git/recipe-sysroot-native/etc/quiltrc push', 1, 'stdout: Applying patch 0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch
> patching file Makefile.in
> Hunk #1 FAILED at 34.
> ...
> Patch 0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch does not apply (enforce with -f)
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/5051
> 
> Can you have a look at the issue?
> 
> Thanks,
> Mathieu
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#251233): https://lists.openembedded.org/g/openembedded-core/message/251233
> Mute This Topic: https://lists.openembedded.org/mt/122438041/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
