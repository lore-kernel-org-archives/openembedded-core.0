Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 550F760234
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 07:49:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBB7nEbp015918
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Dec 2018 23:49:14 -0800 (PST)
Received: from [128.224.162.162] (128.224.162.162) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 10 Dec 2018 23:49:13 -0800
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1542809165-118869-1-git-send-email-zhe.he@windriver.com>
	<CADkTA4NenFJOSNuNz_YRPaGSqoaqRjFUBVwo4s=-dA4jmnUJ_A@mail.gmail.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <eb1e9d93-0f16-36c0-f4f1-07e06df8456f@windriver.com>
Date: Tue, 11 Dec 2018 15:49:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4NenFJOSNuNz_YRPaGSqoaqRjFUBVwo4s=-dA4jmnUJ_A@mail.gmail.com>
X-Originating-IP: [128.224.162.162]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] linux-libc-headers: Fix build failure by using fixed temporary file instead of pipe
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
X-List-Received-Date: Tue, 11 Dec 2018 07:49:14 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2018/12/11 00:58, Bruce Ashfield wrote:
>
>
> On Wed, Nov 21, 2018 at 9:06 AM <zhe.he@windriver.com <mailto:zhe.he@windriver.com>> wrote:
>
>     From: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
>
>     This is a workaround for the following possible build failure.
>
>     *** Compiler lacks asm-goto support.. Stop.
>
>     When building linux-libc-headers we need to use binutils on build machine.
>     binutils v2.31 introduces a bug that could cause scripts/gcc-goto.sh to fail
>     when running in an environment where /tmp is rarely used, e.g. in docker.
>
>     Signed-off-by: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
>     ---
>     v2: Improve commit log
>     v3: Shorten long lines as patchwork suggested
>     v4: Shorten subject line...
>
>      ...-fixed-temporary-file-instead-of-pipe-for.patch | 70 ++++++++++++++++++++++
>      .../linux-libc-headers/linux-libc-headers_4.18.bb <http://linux-libc-headers_4.18.bb>  |  4 ++
>      2 files changed, 74 insertions(+)
>      create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
>
>     diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
>     new file mode 100644
>     index 0000000..0d8fa80
>     --- /dev/null
>     +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
>     @@ -0,0 +1,70 @@
>     +From 3bbea65e11918f8753e8006a2198b999cdb0af58 Mon Sep 17 00:00:00 2001
>     +From: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
>     +Date: Wed, 21 Nov 2018 15:12:43 +0800
>     +Subject: [PATCH] scripts: Use fixed temporary file instead of pipe for
>     + here-doc
>     +
>     +There was a bug of "as" in binutils that when it checks if the input file and
>     +output file are the same one, it would not check if they are on the same block
>     +device. The check is introduced by the following commit in v2.31.
>     +
>     +https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=
>     +67f846b59b32f3d704c601669409c2584383fea9 <https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=+67f846b59b32f3d704c601669409c2584383fea9>
>
>
> Can you double check the links to the upstream changes ? They didn't work
> for me.

I guess that's due to the leading "+" prepended to the second line of the link.
It's part of the patch, not of the link.

>
>  
>
>     +
>     +The here-doc usage in this script creates temporary file in /tmp. When we run in
>     +an environment where /tmp has rarely been used, the newly created temporary file
>     +may have a very low inode number. If the inode number was 6 which is the same as
>     +/dev/null, the as would wrongly think the input file and the output file are the
>     +same and report the following error.
>     +
>     +*** Compiler lacks asm-goto support.. Stop.
>     +
>     +One observed case happened in docker where the /tmp could be so rarely used that
>     +very low number inode may be allocated and triggers the error.
>     +
>     +The fix below for the bug only exists on the master branch of binutils so far
>     +and has not been released from upstream. As the convict is introduced since
>     +v2.31, only v2.31 is affected.
>     +
>     +https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=
>     +2a50366ded329bfb39d387253450c9d5302c3503 <https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=+2a50366ded329bfb39d387253450c9d5302c3503>
>     +
>     +When building linux-libc-headers we need to use "as" in binutils which does not
>     +contain the fix for the moment. To work around the error, we create a fixed
>     +temporary file to contain the program being tested.
>     +
>     +This patch also removes ">/dev/null 2>&1" so we will have more direct error
>     +information in case something else wrong happened.
>     +
>     +Upstream-Status: Inappropriate [A work around for binutils v2.31]
>
>
> It would be nice to have a way to test for the host binutils version, since without it
> we have no way to know when we can stop carrying this change. 
>
> Not that the change is all that complex or should cause any problems, it is just
> very open ended without a check.
>
> Did you look into any conditional way to test the binutils in the recipe and only
> patch if required ?

I have not tried but we can prepend the do_patch of linux-libc-headers to
check the host binutils' version and modify the SRCURI there depending on
the result.

But the users may never want to upgrade their host binutils and thus need this
workaround forever. So even we know what the version is on the host and
warn them to upgrade, it seems we still don't know when we can drop the
workaround. I'm not sure the policy. Can we drop it when all supported
distributions have included the fix?

Thanks,
Zhe

>
> Bruce
>
>  
>
>     +
>     +Signed-off-by: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
>     +---
>     + scripts/gcc-goto.sh | 7 ++++++-
>     + 1 file changed, 6 insertions(+), 1 deletion(-)
>     +
>     +diff --git a/scripts/gcc-goto.sh b/scripts/gcc-goto.sh
>     +index 083c526..0aaf1b4 100755
>     +--- a/scripts/gcc-goto.sh
>     ++++ b/scripts/gcc-goto.sh
>     +@@ -3,7 +3,9 @@
>     + # Test for gcc 'asm goto' support
>     + # Copyright (C) 2010, Jason Baron <jbaron@redhat.com <mailto:jbaron@redhat.com>>
>     +
>     +-cat << "END" | $@ -x c - -c -o /dev/null >/dev/null 2>&1 && echo "y"
>     ++TMPFILE=`mktemp -p .`
>     ++
>     ++cat << "END" > ${TMPFILE}
>     + int main(void)
>     + {
>     + #if defined(__arm__) || defined(__aarch64__)
>     +@@ -20,3 +22,6 @@ entry:
>     +       return 0;
>     + }
>     + END
>     ++
>     ++$@ -x c ${TMPFILE} -c -o /dev/null && echo "y"
>     ++rm ${TMPFILE}
>     +--
>     +2.7.4
>     +
>     diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb <http://linux-libc-headers_4.18.bb> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb <http://linux-libc-headers_4.18.bb>
>     index eb7bee7..00420aa 100644
>     --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb <http://linux-libc-headers_4.18.bb>
>     +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb <http://linux-libc-headers_4.18.bb>
>     @@ -9,5 +9,9 @@ SRC_URI_append_libc-musl = "\
>          file://0001-include-linux-stddef.h-in-swab.h-uapi-header.patch \
>         "
>
>     +SRC_URI_append = "\
>     +    file://0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch \
>     +"
>     +
>      SRC_URI[md5sum] = "bee5fe53ee1c3142b8f0c12c0d3348f9"
>      SRC_URI[sha256sum] = "19d8bcf49ef530cd4e364a45b4a22fa70714b70349c8100e7308488e26f1eaf1"
>     -- 
>     2.7.4
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


