Return-Path: <ross.burton@intel.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 239C3719F8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 15:37:59 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id l131so188299927lfl.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2016 08:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=leNUKpC5a2jifRgpmkaX2KQdErz8wPVyjppNqoLtyik=;
	b=OFYH/ECWVFqWrynaUB1K5/rrFSztGQcxxIj7Hv6nWQSO3JKZ9vA17B6VuqzoQD9xYU
	cY0CKzOb/DcUJEEf408AHxUd8B9sMGN8zeiGaYsqfLmRdWOVZl73PFuFA+RhHlC3rrZy
	b4OI99IQFzWWqqPcaCcnBZX3L7kQ4+KKA4ERS0mE6lfK9PLRghyl9kXYfGinOcjXUZ6j
	vg24cOU86z6lAKIqeLfBEIZpT66dtwtjgCUmpCa46f3Aexw9gmXwyEO5rxwRq2hqvswN
	1/nZsFJV6ridPjjUcRIo4J3mvRAVT87sajb8iHyCvPF2szfdBM3k01HW+98OCNn1dMIr
	z1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=leNUKpC5a2jifRgpmkaX2KQdErz8wPVyjppNqoLtyik=;
	b=gPjoBGSKh+Crolnzw5JRdwnlmyeZlvUyx6K6d1hgZtcZqcsHQP6S0MDn4D6A8K398w
	Kd9FLZi7QqfpOigCRu48AMTnDh4Z+1fCH5kZ+sDzp7h3pc2yf0FW6s9elv6JRk543ecQ
	JRGb5j1H0RwJiBSy81gcKN/9DmbieUw8ttC8gO2RTmmtcJ2so/yGXOHVDEuuuZeGV9Uc
	9ZerxjWRiq5uwcLEJhFARvK7u/1Zb7biDvO9LyLca/a9qqQINcsZsutbLmNjdOuHEBnH
	DqB6bYj90JtD7Vbet0efUCG4UaTIWOIEcZWIJBZDxLP/lyzRW4ZT4PMEP4VMPrWDumb5
	r7pw==
X-Gm-Message-State: AA6/9Rku+KKl7pcBtW+g8FNL5Gc85oP3ww1wLyxI2rKGHzk5NbB4GkGmxUu9WKuSQ8G1yeDd
X-Received: by 10.194.123.228 with SMTP id md4mr4118705wjb.78.1475595479725;
	Tue, 04 Oct 2016 08:37:59 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	us3sm4114485wjb.32.2016.10.04.08.37.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Oct 2016 08:37:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 16:37:53 +0100
Message-Id: <1475595473-19221-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1475595473-19221-1-git-send-email-ross.burton@intel.com>
References: <1475595473-19221-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] systemtap: rationalise dependencies
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
X-List-Received-Date: Tue, 04 Oct 2016 15:38:00 -0000

Boost is an optional dependency but avoid build non-determinism by adding it as
DEPENDS.  It is only for the shared pointer types so can be disabled explicitly
if required.

Turn sqlite into a PACKAGECONFIG.

Add a patch for the "monitor" feature to control the optional dependencies on
ncurses and json-c. Previously this was enabled for target only but enable it
everwhere now that json-c is available for native/nativesdk.

Of course all of this was predicated about systemtap needing systemtap-native to
be built, but it turns out that this dependency is due to oe-core 507bd2 which
adds systemtap-native as DEPENDS for convenience.  Remove this dependency, if
the user wants systemtap-native then they can build it explicitly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../systemtap/systemtap/monitor-option.patch       | 28 ++++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |  8 +++----
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  1 +
 3 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/monitor-option.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch b/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch
new file mode 100644
index 0000000..7d43a79
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch
@@ -0,0 +1,28 @@
+Add an option to explicitly disable the monitor (and therefore the dependency on
+json-c and ncurses).
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index cd781a2..e56079a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -570,13 +574,16 @@ dnl See if we have enough libraries and tools to build the virt server
+ fi
+ AM_CONDITIONAL([BUILD_VIRT], [test "${have_libvirt}" == "yes" -a "${have_libxml2}" == "yes" -a "$enable_virt" != "no"])
+
++AC_ARG_ENABLE([monitor], AS_HELP_STRING([--disable-monitor],[Disable monitor]))
++if test "$enable_monitor" != "no"; then
+ dnl Check for presence of json-c and ncurses for use in monitor mode
+ PKG_CHECK_MODULES([jsonc], [json-c], [have_jsonc=yes], [have_jsonc=no])
+ PKG_CHECK_MODULES([ncurses], [ncurses], [have_ncurses=yes], [have_ncurses=no])
+-AM_CONDITIONAL([HAVE_MONITOR_LIBS], [test "${have_jsonc}" == "yes" -a "${have_ncurses}" == "yes"])
+ if test "${have_jsonc}" == "yes" -a "${have_ncurses}" == yes; then
+   AC_DEFINE([HAVE_MONITOR_LIBS],[1],[Define to 1 if json-c and ncurses libraries are installed])
+ fi
++fi
++AM_CONDITIONAL([HAVE_MONITOR_LIBS], [test "${have_jsonc}" == "yes" -a "${have_ncurses}" == "yes" -a "$enable_monitor" != "no"])
+
+ AC_CACHE_CHECK([for assembler .section "?" flags support], stap_cv_sectionq, [
+ old_CFLAGS="$CFLAGS"
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index da30fa5..43bf69e 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -2,9 +2,7 @@ SUMMARY = "Script-directed dynamic tracing and performance analysis tool for Lin
 
 require systemtap_git.inc
 
-DEPENDS = "elfutils sqlite3 systemtap-native ncurses json-c"
-DEPENDS_class-native = "elfutils-native sqlite3-native gettext-native"
-DEPENDS_class-nativesdk = "nativesdk-elfutils nativesdk-sqlite3 nativesdk-gettext"
+DEPENDS = "boost elfutils"
 
 RDEPENDS_${PN} += "python3-core bash"
 
@@ -19,8 +17,10 @@ STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"
 
 EXTRA_OECONF += "${STAP_DOCS} "
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "sqlite monitor"
 PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
+PACKAGECONFIG[sqlite] = "--enable-sqlite,--disable-sqlite,sqlite3"
+PACKAGECONFIG[monitor] = "--enable-monitor,--disable-monitor,ncurses json-c"
 
 inherit autotools gettext pkgconfig
 
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index ce976ed..304eb99 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -8,6 +8,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://system_map_location.patch \
            file://configure-allow-to-disable-libvirt.patch \
            file://x32_abi_time.patch \
+           file://monitor-option.patch \
           "
 
 # systemtap doesn't support mips
-- 
2.8.1


