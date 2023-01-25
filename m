Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28499C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:02:47 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.45597.1674655360909978547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N4tnBger;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id cf42so29138764lfb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wbfg/LS3qBVWwR8TxvlUnXCpFA3bC8n3uj+LxphDTdU=;
        b=N4tnBger8zom3t5E1a+SAcI65lwlSv0Fmrg09VvGl4ZTpuG1SUtLTfuU+6LlreUoM0
         7vrr7gaQuGCZKqZiCFql+ndvXa61pJ/cK4xyCReihzmyZvxjYm7Tnk5pNrvSzyWqCYNt
         F1ZGYYDmp+UgPXUBciNh3OvXTHlnTMvAG1auHn4WuVSC3lGnjc7nhFwrIaJ21dgDK1Hu
         zz/MJ4LykZk2MjT/BlPPqVoQUAVXJ4EpmhH8qfHsjh9Hmz9yu0LxC2Vu8LeH+K1SHxdX
         qbPl/2ZNdndescHbZ2k+oh6YLFY63I9EIXrFqdsk/s1wpmF4+ZLAiM1GMHmM6zzTsHIH
         UI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wbfg/LS3qBVWwR8TxvlUnXCpFA3bC8n3uj+LxphDTdU=;
        b=HQ+dS2A4Aqi52fGt2uQCcZJ2b62bqxm/HodW2PfIkuFJjVLV3D7piu8aRAG0r3TlZ7
         iT+c0ydDWP4B8w1FqMUfDHQ0RlNQe3SK1kRvtkWbIp3Dik8/UjQS51jNd9EVcQZ2Jbow
         E+BL5I9joAy/NTHjRYoMdOI+4X/VIbzNhig+TG7mO3ci4EHubOj2LoukpXdWsuF8EQON
         PBNyrEdw0A3LB21uYdNO+NmeihscfMuFI/VENLn3zIpHdfNmql/3MQnx9na+NTeO2riF
         ZYiL2SSAtDa5upFj43uMX7l73N7rDSH6FA7YZpyUijfarvZSB1sOPfZCENn9rrqgEbNQ
         pGDA==
X-Gm-Message-State: AFqh2kqZ8fo04CGIAi9ATWTeZVmhwpsRLRCVnHo+d41u7LjCPSfpxUJi
	WJfRRWxvwQmsFEMjfLPtOqJBNw/5NtqJqkm2jh4SRXmD
X-Google-Smtp-Source: AMrXdXuc58H0tK0JvffdffnWPxCbUMgt9pObS5LATTGYQATGzBaNDzEVeqq9PKOOflBLaBwtRzYsIurlUtjeCxXfg+g=
X-Received: by 2002:ac2:5281:0:b0:4cb:2508:f535 with SMTP id
 q1-20020ac25281000000b004cb2508f535mr2591773lfm.131.1674655358821; Wed, 25
 Jan 2023 06:02:38 -0800 (PST)
MIME-Version: 1.0
References: <20230123081621.7517-1-ravineet.a.singh@est.tech>
In-Reply-To: <20230123081621.7517-1-ravineet.a.singh@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Jan 2023 15:02:27 +0100
Message-ID: <CANNYZj8pETWuN8FuyAke2rZ9d2TH6_Ly0goWMnYHuZaYj7xetw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gnutls: add initial ptest support
To: Ravineet Singh <ravineet.a.singh@est.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176348

Thanks! Before this can be added I'd like to clarify two things:
- is execution time of 184 with or without kvm?
- depending on that, you need to add the test to fast or slow list in
ptest-packagelists.inc, so it's actually executed in yocto CI.

Alex

On Wed, 25 Jan 2023 at 14:05, Ravineet Singh <ravineet.a.singh@est.tech> wrote:
>
> Step 1 of adding gnutls unit-tests into ptest. Only self-contained
> test (no external file system dependencies) are included in this step.
>
> Sample output:
> root@qemux86-64:~# ptest-runner gnutls
> START: ptest-runner
> BEGIN: /usr/lib64/gnutls/ptest
> PASS: aead-cipher-vec
> PASS: alerts
> PASS: anti_replay
> ...
> gnutls test summary:
> --------------------
> total: 375
> pass : 364
> fail : 0
> skip : 11
>
> DURATION: 184
> END: /usr/lib64/gnutls/ptest
> 2023-01-13T11:32
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
> ---
>  .../gnutls/gnutls/Add-ptest-support.patch     | 59 ++++++++++++
>  meta/recipes-support/gnutls/gnutls/run-ptest  | 90 +++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.7.8.bb   |  8 +-
>  3 files changed, 156 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/run-ptest
>
> diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> new file mode 100644
> index 0000000000..965568cfd6
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> @@ -0,0 +1,59 @@
> +From 74080376904713a8e6cceefbc25c81512796bf0c Mon Sep 17 00:00:00 2001
> +From: Ravineet Singh <ravineet.a.singh@est.tech>
> +Date: Tue, 10 Jan 2023 16:11:10 +0100
> +Subject: [PATCH] gnutls: add ptest support
> +
> +Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
> +---
> + Makefile.am       | 3 +++
> + configure.ac      | 2 ++
> + tests/Makefile.am | 6 ++++++
> + 3 files changed, 11 insertions(+)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 843193f9f..816b09fec 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -191,6 +191,9 @@ dist-hook:
> +       mv ChangeLog $(distdir)
> +       touch -c $(distdir)/doc/*.html $(distdir)/doc/*.pdf $(distdir)/doc/*.info
> +
> ++install-ptest:
> ++       $(MAKE) -C tests DESTDIR=$(DESTDIR)/tests $@
> ++
> + .PHONY: abi-check abi-dump-versioned abi-dump-latest pic-check symbol-check local-code-coverage-output files-update AUTHORS
> +
> + include $(top_srcdir)/cligen/cligen.mk
> +diff --git a/configure.ac b/configure.ac
> +index baff1c007..f9f596abf 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1150,6 +1150,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
> +
> + AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" = "yes")
> +
> ++AM_EXTRA_RECURSIVE_TARGETS([buildtest-TESTS])
> ++
> + AC_DEFINE([GNUTLS_INTERNAL_BUILD], 1, [We allow temporarily usage of deprecated functions - until they are removed.])
> +
> + hw_features=
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index 573e911a0..e8a26f8b9 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -644,6 +644,12 @@ SH_LOG_COMPILER = $(SHELL)
> + AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
> + LOG_COMPILER = $(LOG_VALGRIND)
> +
> ++install-ptest: $(check_PROGRAMS)
> ++      @$(INSTALL) -d $(DESTDIR)
> ++      @for file in $^; do \
> ++              $(INSTALL_PROGRAM) $$file $(DESTDIR) ; \
> ++      done
> ++
> + distclean-local:
> +       rm -rf softhsm-*.db softhsm-*.config *.tmp tmp-* x509-crt-list-import-url.config.db port.lock.d
> +
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-support/gnutls/gnutls/run-ptest b/meta/recipes-support/gnutls/gnutls/run-ptest
> new file mode 100644
> index 0000000000..84948f487d
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/run-ptest
> @@ -0,0 +1,90 @@
> +#!/bin/sh
> +
> +rjob() {
> +    local job=$1
> +    local log=$2
> +
> +    # TODO: Output will be garbled
> +    ./${job} >> ${log} 2>&1
> +
> +    ret=$?
> +    case $ret in
> +    0)
> +        echo "PASS: $t" >> ${log}
> +        echo "PASS: $t"
> +        ;;
> +    77)
> +        echo "SKIP: $t" >> ${log}
> +        echo "SKIP: $t"
> +        ;;
> +    *)
> +        echo "FAIL: $t" >> ${log}
> +        echo "FAIL: $t"
> +        ;;
> +    esac
> +}
> +
> +is_disallowed() {
> +    local key=$1
> +    $(echo ${test_disallowlist} | grep -w -q ${key})
> +    return $?
> +}
> +
> +# TODO
> +# This list should probably be in a external file
> +# Testcases defined here either take very long time (dtls-stress)
> +# or are dependent on local files (certs, etc) in local file system
> +# currently not exported to target.
> +
> +test_disallowlist=""
> +test_disallowlist="${test_disallowlist} dtls-stress"
> +test_disallowlist="${test_disallowlist} handshake-large-cert"
> +test_disallowlist="${test_disallowlist} id-on-xmppAddr"
> +test_disallowlist="${test_disallowlist} mini-x509-cas"
> +test_disallowlist="${test_disallowlist} pkcs12_simple"
> +test_disallowlist="${test_disallowlist} protocol-set-allowlist"
> +test_disallowlist="${test_disallowlist} psk-file"
> +test_disallowlist="${test_disallowlist} rawpk-api"
> +test_disallowlist="${test_disallowlist} set_pkcs12_cred"
> +test_disallowlist="${test_disallowlist} system-override-curves-allowlist"
> +test_disallowlist="${test_disallowlist} system-override-hash"
> +test_disallowlist="${test_disallowlist} system-override-sig"
> +test_disallowlist="${test_disallowlist} system-override-sig-tls"
> +test_disallowlist="${test_disallowlist} system-prio-file"
> +test_disallowlist="${test_disallowlist} x509cert-tl"
> +
> +LOG=${PWD}/tests.log
> +cd tests
> +max_njobs=$(grep -c ^processor /proc/cpuinfo)
> +njobs=0
> +
> +for t in *; do
> +    [ -x $t ] || continue
> +    [ -f $t ] || continue
> +
> +    is_disallowed ${t}
> +    [ $? -eq 0 ] && continue
> +
> +    rjob ${t} ${LOG} &
> +    one=1
> +    njobs=$(expr ${njobs} + ${one})
> +    if [ ${njobs} -eq ${max_njobs} ]; then
> +        wait
> +        njobs=0
> +    fi
> +done
> +wait
> +
> +skipped=$(grep -c SKIP ${LOG})
> +passed=$(grep -c PASS ${LOG})
> +failed=$(grep -c FAIL ${LOG})
> +total=$(expr ${passed} + ${failed} + ${skipped})
> +
> +echo
> +echo "gnutls test summary:"
> +echo "--------------------"
> +echo "total: ${total}"
> +echo "pass : ${passed}"
> +echo "fail : ${failed}"
> +echo "skip : ${skipped}"
> +echo
> diff --git a/meta/recipes-support/gnutls/gnutls_3.7.8.bb b/meta/recipes-support/gnutls/gnutls_3.7.8.bb
> index 8f979a5b99..fee06393bd 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.7.8.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.7.8.bb
> @@ -22,11 +22,13 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
>  SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
>             file://arm_eabi.patch \
>             file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
> +           file://run-ptest \
> +           file://Add-ptest-support.patch \
>             "
>
>  SRC_URI[sha256sum] = "c58ad39af0670efe6a8aee5e3a8b2331a1200418b64b7c51977fb396d4617114"
>
> -inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
> +inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
>
>  PACKAGECONFIG ??= "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
>
> @@ -68,6 +70,10 @@ do_install:append:class-target() {
>          fi
>  }
>
> +do_compile:append() {
> +        oe_runmake ${PARALLEL_MAKE} -C tests buildtest-TESTS
> +}
> +
>  PACKAGES =+ "${PN}-openssl ${PN}-xx ${PN}-fips"
>
>  FILES:${PN}-dev += "${bindir}/gnutls-cli-debug"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176347): https://lists.openembedded.org/g/openembedded-core/message/176347
> Mute This Topic: https://lists.openembedded.org/mt/96519581/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

