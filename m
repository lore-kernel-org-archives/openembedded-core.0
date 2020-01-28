Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id BD1567D39B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 01:02:31 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id t204so10892649qke.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 17:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=K6XAO4h1AblfWUIfAkB33YaRhh9KaqeQBa8zGAD1s5s=;
	b=s1wcBSjyDUvxjot/yLtvgWCOaJihD+bReHJYb8I2fk3KW49NikeOZibtAkpLCA7mzV
	kx7MJkcZ8mVYixWYggOOMvTL5y4xPsIPLWpGK4eRqoXlhWOTRrBLOz8UJ2AdxHvsdiob
	kSL1sR2kWajV56fYeavDDWW7Jnuf4v4HfJVko/ZlvzrUryLUs+ZNjjoggWWvpMhXBQ6R
	YhsTmZ44XE/WkalJuUM1CXjcgmarXIO768SON6eGwXTV//GcTIeeov+UnWYoVEn97oxN
	5kWjRkJxsrhe9KnmP+W0ggWNJ0CtKeJ2YweYFt/UoE/pfiRv4UNs/tWAlHrQ603V4Fnm
	cvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=K6XAO4h1AblfWUIfAkB33YaRhh9KaqeQBa8zGAD1s5s=;
	b=WyN41+cM2koEojxHeFm9CQLx9mSbTU2VmSL6WLTAl5Bo2LeuU4Z2ebhSQD2gSlYYrG
	Q8cGp9idT5EfJ43RhF61CbqutbQ4B2oQ/rTEvSuDr63wh0sa0f87ASu0rEXCEwa+ED0s
	yWz3tSLfuyPSHxue1r9NkhnFq2rBA+9NyOKKeq4Qg+1FqopEZ7rIC35J1ar2T5Z3rQfu
	IDDy+4FkB5bZaCWr7r4Rj8XsvVEDjrdTF0CzGW/tekBm6VCgAwPDvPG0QLFpn+OVfPAp
	/5pqT0zgm21C7k4KYHLXzoyKHJwF7gt4as2b7qsFg5QXT+kpQmWO6ip70IIasN6kkRMY
	pJVA==
X-Gm-Message-State: APjAAAV6jO+OEntrhP6YUCzkyVkd+9J3711BR2yCEEjxC2euOzx4rhdL
	DX0sDXNrgKCqbJmvQJYhB7B8sp37kOLt/Vtps7g=
X-Google-Smtp-Source: APXvYqwXKBvUdWuvqVNJ6QMyLEQ4bnTg6/ubSEGcxqbHOzTuL345s5MKIRJc2lzMMBq+rZDVKB6atGs+xX+5Bq4NoGE=
X-Received: by 2002:a05:620a:6b8:: with SMTP id
	i24mr20272087qkh.9.1580173352053; 
	Mon, 27 Jan 2020 17:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20200127141908.84922-1-alex.kanavin@gmail.com>
	<20200127141908.84922-8-alex.kanavin@gmail.com>
In-Reply-To: <20200127141908.84922-8-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jan 2020 17:02:04 -0800
Message-ID: <CAMKF1srn1GN2QVnUbYHBNE7fZbDNr0njXpnoMOazWOS_bz2SqA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] valgrind: fix the remaining ptest failures
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
X-List-Received-Date: Tue, 28 Jan 2020 01:02:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 6:20 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Particularly, one test is disabled as it is failing everywhere,
> two patches that actually cause failures are dropped and
> some binaries are prevented from being stripped where that is
> expected.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch | 34 +++++++++++++++++++
>  ...rind-adjust-std_list-expected-output.patch | 32 -----------------
>  ...Dereference-pthread_t-before-adding-.patch | 32 -----------------
>  .../valgrind/valgrind_3.15.0.bb               | 23 +++++++++++--
>  4 files changed, 55 insertions(+), 66 deletions(-)
>  create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
>  delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std_list-expected-output.patch
>  delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
> new file mode 100644
> index 00000000000..d641998d721
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
> @@ -0,0 +1,34 @@
> +From f405297d3382cd98391d02f397e2387da1f42879 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 24 Jan 2020 17:55:39 +0100
> +Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths
> +
> +In oe-core, /tmp is linked to /var/volatile/tmp and
> +valgrind output changes accordingly
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + none/tests/fdleak_cmsg.stderr.exp | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/none/tests/fdleak_cmsg.stderr.exp b/none/tests/fdleak_cmsg.stderr.exp
> +index 6e5a797b9..0ede1ab18 100644
> +--- a/none/tests/fdleak_cmsg.stderr.exp
> ++++ b/none/tests/fdleak_cmsg.stderr.exp
> +@@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null
> +
> +
> + FILE DESCRIPTORS: 6 open at exit.
> +-Open file descriptor ...: /tmp/data2
> ++Open file descriptor ...: ...
> +    ...
> +
> +-Open file descriptor ...: /tmp/data1
> ++Open file descriptor ...: ...
> +    ...
> +
> + Open AF_UNIX socket ...: <unknown>
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std_list-expected-output.patch b/meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std_list-expected-output.patch
> deleted file mode 100644
> index a82972ec1b6..00000000000
> --- a/meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std_list-expected-output.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 6e1e9265b03cf51d09c028d657fe826d7156a783 Mon Sep 17 00:00:00 2001
> -From: Randy MacLeod <Randy.MacLeod@windriver.com>
> -Date: Mon, 13 May 2019 17:26:26 -0400
> -Subject: [PATCH 2/2] valgrind: adjust std_list expected output
> -
> -The run-ptest script uses a custom --yocto-ptest option
> -to change the summary statistics that valgrind issues
> -to a format that matches what ptest-runner expects.
> -
> -Only this std_list test which checks that strcpy() works
> -properly on Ubuntu-12.04 and later is affected by this change.
> -It's normal output when called with --yocto-ptest is a blank
> -line so adjust the expected output.
> -
> -Upstream-Status: Inappropriate [Yocto specific]
> -
> -Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ----
> - drd/tests/std_list.stderr.exp | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/drd/tests/std_list.stderr.exp b/drd/tests/std_list.stderr.exp
> -index d18786f80..8b1378917 100644
> ---- a/drd/tests/std_list.stderr.exp
> -+++ b/drd/tests/std_list.stderr.exp
> -@@ -1,3 +1 @@
> -
> --
> --ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
> ---
> -2.17.0
> -
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch b/meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch
> deleted file mode 100644
> index 05886c743dc..00000000000
> --- a/meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From a6547fc17c120dbd95b852f50b0c4bdee4fedb9a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 10 Jun 2017 01:20:32 -0700
> -Subject: [PATCH 6/6] pth_detached3.c: Dereference pthread_t before adding
> - offset to it
> -
> -Fixes
> -error: invalid use of undefined type 'struct __pthread'
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - drd/tests/pth_detached3.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/drd/tests/pth_detached3.c b/drd/tests/pth_detached3.c
> -index c02eef1..35d43a6 100644
> ---- a/drd/tests/pth_detached3.c
> -+++ b/drd/tests/pth_detached3.c
> -@@ -21,7 +21,7 @@ int main(int argc, char** argv)
> -   pthread_detach(thread);
> -
> -   /* Invoke pthread_detach() with an invalid thread ID. */
> --  pthread_detach(thread + 8);
> -+  pthread_detach((pthread_t*)(&thread + 8));

Lets not drop this patch since it will fail musl builds again a
portable and working fix is to replace this pthread_detach
call with

pthread_detach((pthread_t)((long)thread + 8));

this will ensure this works portably across musl and glibc.

> -
> -   fprintf(stderr, "Finished.\n");
> -
> ---
> -2.13.1
> -
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
> index 6a3834cfdc6..0f86aa44ca6 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
> @@ -29,7 +29,6 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
>             file://0003-correct-include-directive-path-for-config.h.patch \
>             file://0004-pth_atfork1.c-Define-error-API-for-musl.patch \
>             file://0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch \
> -           file://0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch \
>             file://0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch \
>             file://0002-memcheck-x86-Define-__THROW-if-not-defined.patch \
>             file://0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch \
> @@ -38,9 +37,9 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
>             file://0001-Make-local-functions-static-to-avoid-assembler-error.patch \
>             file://0001-Return-a-valid-exit_code-from-vg_regtest.patch \
>             file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch \
> -           file://0002-valgrind-adjust-std_list-expected-output.patch \
>             file://0001-adjust-path-filter-for-2-memcheck-tests.patch \
>             file://s390x_vec_op_t.patch \
> +           file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
>             "
>  SRC_URI[md5sum] = "46e5fbdcbc3502a5976a317a0860a975"
>  SRC_URI[sha256sum] = "417c7a9da8f60dd05698b3a7bc6002e4ef996f14c13f0ff96679a16873e78ab1"
> @@ -205,4 +204,24 @@ do_install_ptest() {
>      # handle multilib
>      sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
>      sed -i s:@bindir@:${bindir}:g ${D}${PTEST_PATH}/run-ptest
> +
> +    # This test fails on the host as well, using both 3.15 and git master (as of Jan 24 2020)
> +    # https://bugs.kde.org/show_bug.cgi?id=402833
> +    rm ${D}${PTEST_PATH}/memcheck/tests/overlap.vgtest
> +
> +    # As the binary isn't stripped or debug-splitted, the source file isn't fetched
> +    # via dwarfsrcfiles either, so it needs to be installed manually.
> +    mkdir -p ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/${BP}/none/tests/
> +    install ${S}/none/tests/tls.c ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/${BP}/none/tests/
>  }
> +
> +# avoid stripping some generated binaries otherwise some of the tests will fail
> +# run-strip-reloc.sh, run-strip-strmerge.sh and so on will fail
> +INHIBIT_PACKAGE_STRIP_FILES = "\
> +    ${PKGD}${PTEST_PATH}/none/tests/tls \
> +    ${PKGD}${PTEST_PATH}/none/tests/tls.so \
> +    ${PKGD}${PTEST_PATH}/none/tests/tls2.so \
> +    ${PKGD}${PTEST_PATH}/helgrind/tests/tc09_bad_unlock \
> +    ${PKGD}${PTEST_PATH}/memcheck/tests/manuel1 \
> +    ${PKGD}${PTEST_PATH}/drd/tests/pth_detached3 \
> +"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

