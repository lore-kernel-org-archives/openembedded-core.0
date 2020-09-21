Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.43058.1600697797098716393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 07:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=JvRVL4JC;
 spf=pass (domain: blade-group.com, ip: 209.85.221.66, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f66.google.com with SMTP id x14so12932114wrl.12
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 07:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MwsR8ZhR+/rUklkhw6TCrg5uDYFWhXHauoDOzXX4s8U=;
        b=JvRVL4JCvoHkSq+m/STjAtLQfDHxzLYEpidmo3cAeehiPNt4uu6kQ0PIuX9ODElgMe
         tT8JkHhz97XDyXzEj0PsItvBDsaD+sb+DRKW4HSrj/GM2bFEGJjDZvr3x2TjytM3BMVK
         zD1XaecNXIliZ62/MxkK002+lXvMEAd3Q/uF+nVk3SBDPo4y8uWYC4eSqwvSV3cvio+6
         4diUnEsnCSg65l0qCQ3aXPrE9P4axVYQiEWfvYH9onrFyZOxOt4aEKgInZ3ZaLJUQf/+
         nkQ5vK6ApOy/ui0ip+76I0klZ3vv//I149wXhCh8WqoXXC7iHBchTH3C7D4KtSmn5sIN
         I1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MwsR8ZhR+/rUklkhw6TCrg5uDYFWhXHauoDOzXX4s8U=;
        b=EUvpK1j1XKRKJYXtucvVVj6BZruz/OKOQ7XwXNB/Wr91GG5KvCULZgnYzZX/D03idn
         PQYRZXIVDG0kcMO7Rk8ifFmTAdIJW4axvIy3JrrxXk3BDTW5rBZaAcZLfMHRjclwMExH
         VZfOjDZzpM3LI9MTKtaEUuS+M5fpi42nKQZ90/T/JPORay7FXPFncuS5f8v6z3EJEsIF
         YMH9XcSlSga6s2e7WFpsP98MZq1TBV5d8GpwtuqCSgHnPCxP6JdcEv3FDyWEbLWytBDQ
         PyoxjnMeg1aqi5uUAy+V4hijfPuluRus/ZIVo7Pa7ou0wTf8ho8tmayy31i82s84eB+O
         H22Q==
X-Gm-Message-State: AOAM533/R2MRVS8f9b7dPAMnFP0q/NgtE8a2yuHC/YCuA0DZ41pX4iy9
	gPq6gHz2w6/PTCVvkHvUfzhSfrwAEoHJu+9n
X-Google-Smtp-Source: ABdhPJynm9Am3jauoyjntQHREnss5PAlo+6y+wrEKfjs2Voi/i6BtVcBT2+OZwWALR1ybW5T7ZWp7Q==
X-Received: by 2002:a5d:4a48:: with SMTP id v8mr52664138wrs.304.1600697795163;
        Mon, 21 Sep 2020 07:16:35 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id f14sm22524804wrt.53.2020.09.21.07.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:16:34 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH 8/8] New systemtap.bb class, and systemtap-demo.bb to illustrate it.
Date: Mon, 21 Sep 2020 16:15:44 +0200
Message-Id: <20200921141544.3145189-9-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921141544.3145189-1-yann@blade-group.com>
References: <20200921141544.3145189-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

---
 meta/classes/systemtap.bbclass                | 74 +++++++++++++++++++
 .../systemtap/systemtap-demo_git.bb           | 71 ++++++++++++++++++
 2 files changed, 145 insertions(+)
 create mode 100644 meta/classes/systemtap.bbclass
 create mode 100644 meta/recipes-kernel/systemtap/systemtap-demo_git.bb

diff --git a/meta/classes/systemtap.bbclass b/meta/classes/systemtap.bbclass
new file mode 100644
index 0000000000..928202c1ff
--- /dev/null
+++ b/meta/classes/systemtap.bbclass
@@ -0,0 +1,74 @@
+# A bbclass to cross-build systemtap (.stp) scripts and install them
+# suitably for on-target usage with staprun.  All compiled .ko files
+# are installed directly in /lib/modules/${KERNEL_VERSION}/systemtap/
+# so their names must be unique.
+
+# FIXME:
+# - cannot handle building a probe several times with different args
+
+# verbosity flags easy to override and amend
+STAP_FLAGS = "-v"
+#STAP_FLAGS += "-B V=1"
+
+# set to "1" to avoid failing on first error
+STAP_WARNONLY = "0"
+
+# Should be absolute (use ${S}, ${WORKDIR}, etc)
+# .stp scripts to be compiled and installed.
+STAP_SCRIPTS ??= ""
+# subset of STAP_SCRIPTS not to compile (exclusion from glob pattern)
+STAP_EXCLUDE_SCRIPTS ??= ""
+
+STAP_OUT ??= "${B}/systemtap"
+
+inherit module-base
+
+DEPENDS += "systemtap-native"
+
+STAPCMD = "stap -p4 ${STAP_FLAGS}"
+STAPCMD += "-a '${ARCH}' -B CROSS_COMPILE='${CROSS_COMPILE}'"
+STAPCMD += "-r '${STAGING_KERNEL_BUILDDIR}'"
+
+# FIXME: most of those should be in the scope of systemtap-native
+STAPCMD += "--sysroot='${RECIPE_SYSROOT}'"
+STAPCMD += "-R '${RECIPE_SYSROOT_NATIVE}${datadir}/systemtap/runtime'"
+STAPCMD += "-I '${RECIPE_SYSROOT_NATIVE}${datadir}/systemtap/tapset'"
+
+## FIXME workaround LDFLAGS not being made for ld
+TARGET_LDFLAGS="-O1 --hash-style=gnu --as-needed"
+
+do_compile_append() {
+    rm -rf ${STAP_OUT}
+    mkdir -p ${STAP_OUT}
+    # expand glob patterns
+    stap_scripts=$(echo ${STAP_SCRIPTS})
+    stap_exclude_scripts=$(echo ${STAP_EXCLUDE_SCRIPTS})
+    for s in ${stap_scripts}; do
+        m=$(basename ${s%.stp})
+        m=$(printf $m | tr -c '[:alnum:]' _)
+        case " ${stap_exclude_scripts} " in
+          *\ $s\ *) continue ;;
+        esac
+        eval extraflags=\${STAP_EXTRAFLAGS_$m}
+        (
+            cd ${STAP_OUT}
+            [ ! -e "$m.ko" ] || bbwarn "compiling $s: $m.ko already exists"
+            if ! ${STAPCMD} ${extraflags} -m "$m" "$s"; then
+                if [ "${STAP_WARNONLY}" = 1 ]; then
+                    bbwarn "build failure for $s"
+                else
+                    bbfatal "build failure for $s"
+                fi
+            fi
+        )
+    done
+}
+
+do_install_append() {
+    DST=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/systemtap
+    install -d -m755 ${DST}
+    install -m644 ${STAP_OUT}/*.ko ${DST}/
+}
+
+FILES_${PN} += "${nonarch_base_libdir}/modules"
+RRECOMMENDS_${PN} += "systemtap-runtime"
diff --git a/meta/recipes-kernel/systemtap/systemtap-demo_git.bb b/meta/recipes-kernel/systemtap/systemtap-demo_git.bb
new file mode 100644
index 0000000000..f6b6c40cc1
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap-demo_git.bb
@@ -0,0 +1,71 @@
+require systemtap_git.inc
+
+# FIXME just to avoid looking for patches we don't care about
+SRC_URI = "git://sourceware.org/git/systemtap.git"
+
+inherit systemtap
+
+STAP_SCRIPTS = "\
+ ${S}/testsuite/systemtap.examples/*/*.stp \
+"
+
+# Many scripts have specific needs, so we don't really care if they don't build,
+# and there are too many of them to exclude them manually, so we just tell the build
+# to issue warnings on build failures:
+# - specific kernel symbols, depending on specific kernel config options
+# - files on disk for userspace instrumentation
+# - FIXME but also plain oversights of this packaging (kernel.trace ?)
+STAP_WARNONLY = "1"
+
+export STAP_EXTRAFLAGS_badname = "-g"
+export STAP_EXTRAFLAGS_keyhack = "-g"
+export STAP_EXTRAFLAGS_eatmydata = "-g"
+export STAP_EXTRAFLAGS_ttyspy = "-g"
+
+# those require parameters
+STAP_EXCLUDE_SCRIPTS = "\
+ ${S}/testsuite/systemtap.examples/general/callgraph.stp \
+ ${S}/testsuite/systemtap.examples/general/eventcount.stp \
+ ${S}/testsuite/systemtap.examples/general/func_time_stats.stp \
+ ${S}/testsuite/systemtap.examples/general/para-callgraph-verbose.stp \
+ ${S}/testsuite/systemtap.examples/general/para-callgraph.stp \
+ ${S}/testsuite/systemtap.examples/general/py2example.stp \
+ ${S}/testsuite/systemtap.examples/general/py3example.stp \
+ ${S}/testsuite/systemtap.examples/general/regex.stp \
+ ${S}/testsuite/systemtap.examples/general/sizeof.stp \
+ ${S}/testsuite/systemtap.examples/general/sizeof_interactive.stp \
+ ${S}/testsuite/systemtap.examples/general/varwatch.stp \
+ ${S}/testsuite/systemtap.examples/general/watchdog.stp \
+ ${S}/testsuite/systemtap.examples/general/whythefail.stp \
+ ${S}/testsuite/systemtap.examples/io/deviceseeks.stp \
+ ${S}/testsuite/systemtap.examples/io/inodewatch.stp \
+ ${S}/testsuite/systemtap.examples/io/inodewatch2.stp \
+ ${S}/testsuite/systemtap.examples/io/iostat-scsi.stp \
+ ${S}/testsuite/systemtap.examples/io/traceio2.stp \
+ ${S}/testsuite/systemtap.examples/locks/bkl.stp \
+ ${S}/testsuite/systemtap.examples/memory/hw_watch_addr.stp \
+ ${S}/testsuite/systemtap.examples/memory/hw_watch_sym.stp \
+ ${S}/testsuite/systemtap.examples/network/connect_stat.stp \
+ ${S}/testsuite/systemtap.examples/network/netfilter_drop.stp \
+ ${S}/testsuite/systemtap.examples/process/chng_cpu.stp \
+ ${S}/testsuite/systemtap.examples/process/errsnoop.stp \
+ ${S}/testsuite/systemtap.examples/process/migrate.stp \
+ ${S}/testsuite/systemtap.examples/process/pfiles.stp \
+ ${S}/testsuite/systemtap.examples/process/plimit.stp \
+ ${S}/testsuite/systemtap.examples/process/psig.stp \
+ ${S}/testsuite/systemtap.examples/process/pstrace_exec.stp \
+ ${S}/testsuite/systemtap.examples/process/sigmon.stp \
+ ${S}/testsuite/systemtap.examples/profiling/fntimes.stp \
+ ${S}/testsuite/systemtap.examples/profiling/functioncallcount.stp \
+ ${S}/testsuite/systemtap.examples/profiling/graphcall.stp \
+ ${S}/testsuite/systemtap.examples/profiling/linetimes.stp \
+ ${S}/testsuite/systemtap.examples/profiling/periodic.stp \
+ ${S}/testsuite/systemtap.examples/profiling/sched_switch.stp \
+"
+
+# FIXME what's the problem with those ?
+STAP_EXCLUDE_SCRIPTS += "\
+ ${S}/testsuite/systemtap.examples/interrupt/interrupts-by-dev.stp \
+"
+
+B = "${WORKDIR}/build"
-- 
2.28.0

