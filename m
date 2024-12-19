Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D886E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 17:57:35 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.135049.1734631045887820722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 09:57:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Zf25WL5E;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6c3629816so45745785a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 09:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734631045; x=1735235845; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ewxr6SLlvQFmsL+Jg3bu40Mo2WV0taw2Gi8fQ9uFGac=;
        b=Zf25WL5EMUsCY/OiGW43SfsOJq3MqlV1snrSkM7IgH1KsMiKzv1g7Qitkf3gd+qyQs
         aIKBiupV2ohxVHXnBp5qoHIvrEcSwSHyfSzaIoCKItRNZEUqjGankkPNN24JrQBOYy3s
         IcrtaHNV0uD1/nURusu/gxYRScV6TQp5StzpSHkHAebQxz2WqMBi4qZwOHuWj4Eeeb0b
         iz+143tALdCD7WmWu6Lhnb9ICC9RtU3YAjfQIawzT9tmqmaK+IXmbi8Nxu27PKY+UkLV
         Q7fmx3xz9Kr3hItCrTYbIi9llk+vNNBb/xXLEnq5XZrOX6vVVfRo9RlKhkdHI01yeKZr
         ezKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734631045; x=1735235845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ewxr6SLlvQFmsL+Jg3bu40Mo2WV0taw2Gi8fQ9uFGac=;
        b=UqSQhuhrG9rxsBIVWP4tIZ3NWROaG1/vl2T3Yiwhynm+SaHPsE7YlODSXftdD1Ss4q
         pV70YXoSq7ga8xmzI8/znBkpe5oO0hkVMYDJSlerjKb1jayVuxO1nzazj6DO3G5rpw3M
         j9mJvrVVE+aq2rKMaJYxLZOVEBx+VNQz0uy3vZBNE9e3NiAypNQVHq3c8qOp6C0UytRj
         GNcfKBXQPSXmvk0vVBNkJxjWxbB33oXagurnfX200ktAeGD5/9sKQBe6ExHn4nPY7a4p
         5N5xuhJfgKn7P4t6LJYQ514yqilTY0m3ERQxM25gsYOosCvjlLhRPtJI4Fdm4DGaXd1h
         Eu0A==
X-Gm-Message-State: AOJu0YxTHb/N0W5adoDkdiTC95QN5KjNw6ZDcYl+XP6chl7B+qJYEFne
	sfJKodS9dZHjSXSi0Xwi2d6QSw7gvueFR8Fg0SphRO6KoIntMQCyJ+HeDHzEyQ4=
X-Gm-Gg: ASbGncsL4CbFhhU99GpAJPPui0q5uwdRA2Nsx4o1HPgbxVZZCDoaxrQB2MFUyKZ8X1U
	op6nBIisphO7jQovHl64VP4tf6piKkuWiRS1H4uw8uyRjRXns6PaBz8JQ0/xyrKel5fKwimz5k8
	n5ed9eiYqK4gkBQ+0bU2mR0Lxn+iURwQhZOzsIYt44MJrY2QHueaBiyRJZXpOs9i6Mb3bhgCSa1
	bJKyS83pIAK7ha37vUXP4ZOjlQmYvs5NibIu8B1flxefsVQGJb7C8NFQS2BfxYBMDcAGU4sGqlO
	rKzbEC7i4DrEvIHv2xTpJbeN
X-Google-Smtp-Source: AGHT+IEzWLhZ3mBmGRv5aqju2aeDRUpWb/4F8VNZPBXDK3fS4asxzTAG+OpMyKjoGJMeVPRpyulGxA==
X-Received: by 2002:a05:620a:1aa0:b0:7b6:e20c:1a0e with SMTP id af79cd13be357-7b9b965cd71mr73718585a.51.1734631044654;
        Thu, 19 Dec 2024 09:57:24 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2bdb14sm68820485a.19.2024.12.19.09.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 09:57:24 -0800 (PST)
Message-ID: <edabfbc7-8c32-4765-b7d8-972b27c38127@baylibre.com>
Date: Thu, 19 Dec 2024 12:57:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3: upgrade 3.13.0 -> 3.13.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20241219144255.3366730-1-tgamblin@baylibre.com>
 <CANNYZj_0CBdCpCxcTfUUjRy+AHfN=gn-dxG-PvoFDpTYdnJSQg@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj_0CBdCpCxcTfUUjRy+AHfN=gn-dxG-PvoFDpTYdnJSQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 17:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208924


On 2024-12-19 11:29, Alexander Kanavin wrote:
> Hello,
>
> with this update on top of master, I'm getting the following when
> building core-image-full-cmdline (core-image-minimal builds fine). Can
> you check please?
>
> ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Could not invoke dnf.
> Command '/srv/storage/alex/yocto/build-64/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0/recipe-sysroot-native/usr/bin/dnf
> -v --rpmverbosity=info -y -c
> /srv/storage/alex/yocto/build-64/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0/rootfs/etc/dnf/dnf.conf
> --setopt=reposdir=/srv/storage/alex/yocto/build-64/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0/rootfs/etc/yum.repos.d
> --installroot=/srv/storage/alex/yocto/build-64/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0/rootfs
> --setopt=logdir=/srv/storage/alex/yocto/build-64/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0/temp
> --repofrompath=oe-repo,/srv/storage/alex/yocto/build-64/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0/oe-rootfs-repo
> repoquery --installed --queryformat Package: %{name} %{arch}
> %{version} %{name}-%{version}-%{release}.%{arch}.rpm
> Dependencies:
> %{requires}
> Recommendations:
> %{recommends}
> DependenciesEndHere:
> ' returned -11:

Hmm, I see it too. Not sure why it's happening. I do see this error in 
the logs:

|NOTE: Executing 
'/home/tgamblin/workspace/yocto/poky/build/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0/recipe-sysroot-native/usr/bin/createrepo_c 
--update -q 
/home/tgamblin/workspace/yocto/poky/build/tmp/work/qemux86_64-poky-linux/core-ima
ge-full-cmdline/1.0/oe-rootfs-repo' ...
|NOTE: error: 
/home/tgamblin/workspace/yocto/poky/build/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0/recipe-sysroot-native/usr/lib/rpm/macros: 
line 1183: Macro %__plugindir has empty body

Unsurprisingly the build finishes OK if I switch to using deb instead of 
rpm... not the first time I've seen such a problem...

>
>
> Alex
>
> On Thu, 19 Dec 2024 at 15:43, Trevor Gamblin via
> lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
> wrote:
>> Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-13-1-final
>>
>> - Patch 'fix-armv5.patch' is in 3.13.1, so no longer needed:
>>
>> |tgamblin@megalith ~/workspace/git/pythonsrc/cpython ((HEAD detached from v3.13.1))$ git tag --contains 18b9079ddbc149d6b99c922630c246812e4d8ae7
>> |v3.13.1
>>
>> - While patch 'crosspythonpath.patch' is listed as 'Inappropriate
>>    [OE-Core integration specific]' specific in the commit message, it is
>>    now breaking the build, while removing it allows python3 to build OK.
>>    It appears that there is a similar change in upstream 3.13.1:
>>
>>    https://github.com/python/cpython/commit/909d5ac2959e
>>
>> - gcc-symlinks had to be added to ptest RDEPENDS so that 'gcc' could be
>>    found on the path for the
>>    test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym test.
>>
>> - Also reformat the DEPENDS and RDEPENDS lists to be alphabetical
>>    and one-per-line, since that's easier to read and modify.
>>
>> - buildall-qemu output:
>>
>> |BUILDALL-QEMU LOG FOR python3
>> |START TIME: 2024-12-18_20:38:01
>> |HOSTNAME: megalith
>> |HOST OS: Debian GNU/Linux 12 (bookworm)
>> |HOST KERNEL: 6.1.0-28-amd64
>> |===============
>> |BUILD RESULTS:
>> |[glibc]
>> |FAIL: qemuloongarch64
>> |PASS: qemuriscv32
>> |PASS: qemuarmv5
>> |PASS: qemuppc
>> |PASS: qemumips64
>> |PASS: qemuriscv64
>> |PASS: qemuarm64
>> |PASS: qemuarm
>> |PASS: qemux86-64
>> |PASS: qemuppc64
>> |PASS: qemux86
>> |PASS: qemumips
>> |[musl]
>> |FAIL: qemuloongarch64
>> |FAIL: qemuriscv32
>> |PASS: qemuarmv5
>> |PASS: qemuppc
>> |PASS: qemumips64
>> |PASS: qemuriscv64
>> |PASS: qemuarm64
>> |PASS: qemuarm
>> |PASS: qemux86-64
>> |PASS: qemuppc64
>> |PASS: qemux86
>> |PASS: qemumips
>> |===============
>> |PASSED: 21
>> |FAILED: 3
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   .../python/python3/crosspythonpath.patch      | 33 ----------
>>   .../python/python3/fix-armv5.patch            | 65 -------------------
>>   .../{python3_3.13.0.bb => python3_3.13.1.bb}  | 58 +++++++++++++----
>>   3 files changed, 45 insertions(+), 111 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/python/python3/crosspythonpath.patch
>>   delete mode 100644 meta/recipes-devtools/python/python3/fix-armv5.patch
>>   rename meta/recipes-devtools/python/{python3_3.13.0.bb => python3_3.13.1.bb} (96%)
>>
>> diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch b/meta/recipes-devtools/python/python3/crosspythonpath.patch
>> deleted file mode 100644
>> index f18898e4c4f..00000000000
>> --- a/meta/recipes-devtools/python/python3/crosspythonpath.patch
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -From 8840438e73e43b99bc9c83896a5f950e4259738f Mon Sep 17 00:00:00 2001
>> -From: Ricardo Ribalda <ricardo@ribalda.com>
>> -Date: Tue, 18 Nov 2014 03:35:33 -0500
>> -Subject: [PATCH] configure.ac: add CROSSPYTHONPATH into PYTHONPATH for
>> - PYTHON_FOR_BUILD
>> -
>> -When building x86->x86 the system will try to execute .so and related items
>> -from the default PYTHONPATH.  This will fail if the target CPU contains
>> -instructions that the host CPU does not have, add CROSSPYTHONPATH
>> -into PYTHONPATH so we can prepend the list to find correct libs.
>> -
>> -Upstream-Status: Inappropriate [OE-Core integration specific]
>> -
>> -Credits-to: Mark Hatle <mark.hatle@windriver.com>
>> -Credits-to: Jackie Huang <jackie.huang@windriver.com>
>> -Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
>> ----
>> - configure.ac | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index 58f5407..5101806 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -164,7 +164,7 @@ AC_ARG_WITH([build-python],
>> -     dnl Build Python interpreter is used for regeneration and freezing.
>> -     ac_cv_prog_PYTHON_FOR_REGEN=$with_build_python
>> -     PYTHON_FOR_FREEZE="$with_build_python"
>> --    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$with_build_python
>> -+    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH):$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$with_build_python
>> -     AC_MSG_RESULT([$with_build_python])
>> -   ], [
>> -     AS_VAR_IF([cross_compiling], [yes],
>> diff --git a/meta/recipes-devtools/python/python3/fix-armv5.patch b/meta/recipes-devtools/python/python3/fix-armv5.patch
>> deleted file mode 100644
>> index 961404b24fc..00000000000
>> --- a/meta/recipes-devtools/python/python3/fix-armv5.patch
>> +++ /dev/null
>> @@ -1,65 +0,0 @@
>> -From 18b9079ddbc149d6b99c922630c246812e4d8ae7 Mon Sep 17 00:00:00 2001
>> -From: "Miss Islington (bot)"
>> - <31488909+miss-islington@users.noreply.github.com>
>> -Date: Wed, 16 Oct 2024 16:48:40 +0200
>> -Subject: [PATCH] [3.13] gh-125444: Fix illegal instruction for older Arm
>> - architectures (GH-125574) (GH-125595)
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=UTF-8
>> -Content-Transfer-Encoding: 8bit
>> -
>> -On Arm v5 it is not possible to get the thread ID via c13 register
>> -hence the illegal instruction. The c13 register started to provide
>> -thread ID since Arm v6K architecture variant. Other variants of
>> -Arm v6 (T2, Z and base) don’t provide the thread ID via c13.
>> -For the sake of simplicity we group v5 and v6 together and
>> -consider that instructions for Arm v7 only.
>> -(cherry picked from commit feda9aa73ab95d17a291db22c416146f8e70edeb)
>> -
>> -Co-authored-by: Diego Russo <diego.russo@arm.com>
>> -
>> -Upstream-Status: Backport [https://github.com/python/cpython/commit/18b9079ddbc149d6b99c922630c246812e4d8ae7]
>> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> ----
>> - Include/internal/mimalloc/mimalloc/prim.h                     | 4 ++--
>> - Include/object.h                                              | 2 +-
>> - .../2024-10-16-12-12-39.gh-issue-125444.9tG2X6.rst            | 1 +
>> - 3 files changed, 4 insertions(+), 3 deletions(-)
>> - create mode 100644 Misc/NEWS.d/next/Core_and_Builtins/2024-10-16-12-12-39.gh-issue-125444.9tG2X6.rst
>> -
>> -diff --git a/Include/internal/mimalloc/mimalloc/prim.h b/Include/internal/mimalloc/mimalloc/prim.h
>> -index 8a60d528458e6c..322ab29e6b41c2 100644
>> ---- a/Include/internal/mimalloc/mimalloc/prim.h
>> -+++ b/Include/internal/mimalloc/mimalloc/prim.h
>> -@@ -151,9 +151,9 @@ static inline mi_threadid_t _mi_prim_thread_id(void) mi_attr_noexcept {
>> - // If you test on another platform and it works please send a PR :-)
>> - // see also https://akkadia.org/drepper/tls.pdf for more info on the TLS register.
>> - #elif defined(__GNUC__) && ( \
>> --           (defined(__GLIBC__)   && (defined(__x86_64__) || defined(__i386__) || defined(__arm__) || defined(__aarch64__))) \
>> -+           (defined(__GLIBC__)   && (defined(__x86_64__) || defined(__i386__) || (defined(__arm__) && __ARM_ARCH >= 7) || defined(__aarch64__))) \
>> -         || (defined(__APPLE__)   && (defined(__x86_64__) || defined(__aarch64__))) \
>> --        || (defined(__BIONIC__)  && (defined(__x86_64__) || defined(__i386__) || defined(__arm__) || defined(__aarch64__))) \
>> -+        || (defined(__BIONIC__)  && (defined(__x86_64__) || defined(__i386__) || (defined(__arm__) && __ARM_ARCH >= 7) || defined(__aarch64__))) \
>> -         || (defined(__FreeBSD__) && (defined(__x86_64__) || defined(__i386__) || defined(__aarch64__))) \
>> -         || (defined(__OpenBSD__) && (defined(__x86_64__) || defined(__i386__) || defined(__aarch64__))) \
>> -       )
>> -diff --git a/Include/object.h b/Include/object.h
>> -index 78aa7ad0f459ff..b53f9acfebdb0c 100644
>> ---- a/Include/object.h
>> -+++ b/Include/object.h
>> -@@ -259,7 +259,7 @@ _Py_ThreadId(void)
>> -     __asm__("movq %%gs:0, %0" : "=r" (tid));  // x86_64 macOSX uses GS
>> - #elif defined(__x86_64__)
>> -    __asm__("movq %%fs:0, %0" : "=r" (tid));  // x86_64 Linux, BSD uses FS
>> --#elif defined(__arm__)
>> -+#elif defined(__arm__) && __ARM_ARCH >= 7
>> -     __asm__ ("mrc p15, 0, %0, c13, c0, 3\nbic %0, %0, #3" : "=r" (tid));
>> - #elif defined(__aarch64__) && defined(__APPLE__)
>> -     __asm__ ("mrs %0, tpidrro_el0" : "=r" (tid));
>> -diff --git a/Misc/NEWS.d/next/Core_and_Builtins/2024-10-16-12-12-39.gh-issue-125444.9tG2X6.rst b/Misc/NEWS.d/next/Core_and_Builtins/2024-10-16-12-12-39.gh-issue-125444.9tG2X6.rst
>> -new file mode 100644
>> -index 00000000000000..13c1e745edf8d5
>> ---- /dev/null
>> -+++ b/Misc/NEWS.d/next/Core_and_Builtins/2024-10-16-12-12-39.gh-issue-125444.9tG2X6.rst
>> -@@ -0,0 +1 @@
>> -+Fix illegal instruction for older Arm architectures. Patch by Diego Russo, testing by Ross Burton.
>> diff --git a/meta/recipes-devtools/python/python3_3.13.0.bb b/meta/recipes-devtools/python/python3_3.13.1.bb
>> similarity index 96%
>> rename from meta/recipes-devtools/python/python3_3.13.0.bb
>> rename to meta/recipes-devtools/python/python3_3.13.1.bb
>> index b3170879b95..b2eaf9f4396 100644
>> --- a/meta/recipes-devtools/python/python3_3.13.0.bb
>> +++ b/meta/recipes-devtools/python/python3_3.13.1.bb
>> @@ -14,7 +14,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>>              file://check_build_completeness.py \
>>              file://reformat_sysconfig.py \
>>              file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
>> -           file://crosspythonpath.patch \
>>              file://0001-test_locale.py-correct-the-test-output-format.patch \
>>              file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch \
>>              file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch \
>> @@ -30,7 +29,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>>              file://0001-test_deadlock-skip-problematic-test.patch \
>>              file://0001-test_active_children-skip-problematic-test.patch \
>>              file://0001-test_readline-skip-limited-history-test.patch \
>> -           file://fix-armv5.patch \
>>              file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch \
>>              file://0001-ssl-Raise-OSError-for-ERR_LIB_SYS.patch \
>>              "
>> @@ -39,7 +37,7 @@ SRC_URI:append:class-native = " \
>>              file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
>>              "
>>
>> -SRC_URI[sha256sum] = "086de5882e3cb310d4dca48457522e2e48018ecd43da9cdf827f6a0759efb07d"
>> +SRC_URI[sha256sum] = "9cf9427bee9e2242e3877dd0f6b641c1853ca461f39d6503ce260a59c80bf0d9"
>>
>>   # exclude pre-releases for both python 2.x and 3.x
>>   UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
>> @@ -69,7 +67,24 @@ ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config
>>   ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
>>
>>
>> -DEPENDS = "bzip2-replacement-native expat libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl2 autoconf-archive-native ncurses"
>> +DEPENDS = "\
>> +    autoconf-archive-native \
>> +    bzip2 \
>> +    bzip2-replacement-native \
>> +    expat \
>> +    libffi \
>> +    libnsl2 \
>> +    libtirpc \
>> +    ncurses \
>> +    openssl \
>> +    sqlite3 \
>> +    util-linux-libuuid \
>> +    virtual/crypt \
>> +    virtual/libintl \
>> +    xz \
>> +    zlib \
>> +"
>> +
>>   DEPENDS:append:class-target = " python3-native"
>>   DEPENDS:append:class-nativesdk = " python3-native"
>>
>> @@ -444,13 +459,13 @@ INSANE_SKIP:${PN}-ptest = "dev-deps"
>>   # catch all the rest (unsorted)
>>   PACKAGES += "${PN}-misc"
>>   RDEPENDS:${PN}-misc += "\
>> -  ${PN}-audio \
>> -  ${PN}-codecs \
>> -  ${PN}-core \
>> -  ${PN}-email \
>> -  ${PN}-numbers \
>> -  ${PN}-pickle \
>> -  ${PN}-pydoc \
>> +    ${PN}-audio \
>> +    ${PN}-codecs \
>> +    ${PN}-core \
>> +    ${PN}-email \
>> +    ${PN}-numbers \
>> +    ${PN}-pickle \
>> +    ${PN}-pydoc \
>>   "
>>   RDEPENDS:${PN}-modules:append:class-target = " ${MLPREFIX}python3-misc"
>>   RDEPENDS:${PN}-modules:append:class-nativesdk = " ${MLPREFIX}python3-misc"
>> @@ -466,8 +481,25 @@ RDEPENDS:libpython3:append:libc-glibc = " libgcc"
>>   RDEPENDS:${PN}-ctypes:append:libc-glibc = "\
>>       ${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)} \
>>   "
>> -RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed gcc g++ binutils \
>> -                        locale-base-fr-fr locale-base-en-us locale-base-de-de"
>> +RDEPENDS:${PN}-ptest = "\
>> +    ${PN}-dev \
>> +    ${PN}-modules \
>> +    ${PN}-tests \
>> +    ${PN}-zipapp \
>> +    binutils \
>> +    bzip2 \
>> +    coreutils \
>> +    gcc \
>> +    gcc-symlinks \
>> +    g++ \
>> +    libgcc \
>> +    locale-base-fr-fr \
>> +    locale-base-en-us \
>> +    locale-base-de-de \
>> +    sed \
>> +    tzdata \
>> +    unzip \
>> +"
>>   RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-tr-tr"
>>   RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
>>   RDEPENDS:${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter ${MLPREFIX}tcl', '', d)}"
>> --
>> 2.39.5
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#208917): https://lists.openembedded.org/g/openembedded-core/message/208917
>> Mute This Topic: https://lists.openembedded.org/mt/110198411/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

