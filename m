Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 14AB578876
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 04:32:10 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m136so6254857pga.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 20:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/yYvsC6Whnpl7R22i0kevzLm/jSpbFihMl5QToeUQEM=;
	b=kQ0FiGPcT5jwQABe7S35UF2kWNZSzmsKK58pjaiJtpZNlkBHbDj4q9YKZj2salyOoA
	knZP/thazmTiCh0XbHKZPMLzLMLlOxyBpkBO92jP9l3oS019fflUGWwEob2/F/DMe5FD
	J2qVDS7jHGWXY4SOptaKU8xGnn95NChmcig4YlHSKvKjd/bBDU4Iy+GjFs+kJpIylbPP
	xDJGYkqzgcYoLa0K0iScj3mhXBZwhfM+v5cZdmBStG3U47SGBfNGe3hBDW8TvFic3pf+
	+YIRAk6NcgJlT+n7pDNnF+JKnJYLOqoM+rAD388pN5L0xNnm2efEYrjaAqft7fKtjaWt
	mauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/yYvsC6Whnpl7R22i0kevzLm/jSpbFihMl5QToeUQEM=;
	b=RE9gCI6tnbezBsgaBOrihTTFzUt65y58L1RTrfDDTFAMSrzz8mZbLP5bXfq1iJOXR+
	9ekJcQTc9+/VWXD1QyDPsUIi/XgNuCvlz9a0u3kSMkrJt2VT8shI1xV3FatfTvYxZy8O
	YQE0t4FPkwafLG9UeydjnSt8zp3IA+Z0xtrHrlt7BTysFUS7lKXqv4ZVi6t/GUhJXGJM
	z39r4FCzIr64W+Y6OepH+r4mV9xI5cMhu6KXqroOyb5Uezkw4cehbH/APwoY9h3SYMHd
	TavOdJqnnLPicJSVT/orzOn697x/4x4FDoTwpkjy/ashny/Vftk7905HulA6SZFC9A0q
	L+Ug==
X-Gm-Message-State: AKwxytf+GkfC8NClyAJ8rwWSkxddFVthMpfyPjaTuAEir5Ve4H6G/ylz
	d+jrJ+Tp9vZNHaHN4QuAsLrQYA==
X-Google-Smtp-Source: AH8x226fTW7mAoOIRgasTazvTJ+aHkZARIqrDz41dO0i+yvBbIKrqVboYO8cquHI8W3kJj/CwazhjQ==
X-Received: by 10.98.231.11 with SMTP id s11mr28997641pfh.174.1517286731898;
	Mon, 29 Jan 2018 20:32:11 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	u67sm1134233pfd.169.2018.01.29.20.32.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 20:32:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 20:31:54 -0800
Message-Id: <9860454b2d2d1b82cd0d9ee2855af05808f36ffb.1517286478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <cover.1517286478.git.raj.khem@gmail.com>
References: <cover.1517286478.git.raj.khem@gmail.com>
Subject: [PATCH V2 6/8] pulseaudio: Fix build with glibc 2.27
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
X-List-Received-Date: Tue, 30 Jan 2018 04:32:11 -0000

memfd_create is now available in glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ers-only-define-memfd_create-if-not-alrea.patch | 66 ++++++++++++++++++++++
 .../pulseaudio/pulseaudio_11.1.bb                  |  3 +-
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch
new file mode 100644
index 0000000000..0391f3785b
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch
@@ -0,0 +1,66 @@
+From 0cb66c0c5aafd48b63a755860746e70afb332c8d Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanuk@iki.fi>
+Date: Wed, 24 Jan 2018 03:51:49 +0200
+Subject: [PATCH] memfd-wrappers: only define memfd_create() if not already
+ defined
+
+glibc 2.27 is to be released soon, and it will provide memfd_create().
+If glibc provides the function, we must not define it ourselves,
+otherwise building fails due to conflict between the two implementations
+of the same function.
+
+BugLink: https://bugs.freedesktop.org/show_bug.cgi?id=104733
+---
+Upstream-Status: Submitted [https://bugs.freedesktop.org/attachment.cgi?id=136927]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ configure.ac                   | 3 +++
+ src/pulsecore/memfd-wrappers.h | 7 ++++---
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 77b5ff5..3a71fd8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -607,6 +607,9 @@ AS_IF([test "x$enable_memfd" = "xyes" && test "x$HAVE_MEMFD" = "x0"],
+     [AC_MSG_ERROR([*** Your Linux kernel does not support memfd shared memory.
+                   *** Use linux v3.17 or higher for such a feature.])])
+ 
++AS_IF([test "x$HAVE_MEMFD" = "x1"],
++    AC_CHECK_FUNCS([memfd_create]))
++
+ AC_SUBST(HAVE_MEMFD)
+ AM_CONDITIONAL([HAVE_MEMFD], [test "x$HAVE_MEMFD" = x1])
+ AS_IF([test "x$HAVE_MEMFD" = "x1"], AC_DEFINE([HAVE_MEMFD], 1, [Have memfd shared memory.]))
+diff --git a/src/pulsecore/memfd-wrappers.h b/src/pulsecore/memfd-wrappers.h
+index 3bed9b2..c7aadfd 100644
+--- a/src/pulsecore/memfd-wrappers.h
++++ b/src/pulsecore/memfd-wrappers.h
+@@ -20,13 +20,14 @@
+   License along with PulseAudio; if not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
+-#ifdef HAVE_MEMFD
++#if defined(HAVE_MEMFD) && !defined(HAVE_MEMFD_CREATE)
+ 
+ #include <sys/syscall.h>
+ #include <fcntl.h>
+ 
+ /*
+- * No glibc wrappers exist for memfd_create(2), so provide our own.
++ * Before glibc version 2.27 there was no wrapper for memfd_create(2),
++ * so we have to provide our own.
+  *
+  * Also define memfd fcntl sealing macros. While they are already
+  * defined in the kernel header file <linux/fcntl.h>, that file as
+@@ -63,6 +64,6 @@ static inline int memfd_create(const char *name, unsigned int flags) {
+ #define F_SEAL_WRITE    0x0008  /* prevent writes */
+ #endif
+ 
+-#endif /* HAVE_MEMFD */
++#endif /* HAVE_MEMFD && !HAVE_MEMFD_CREATE */
+ 
+ #endif
+-- 
+2.16.1
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb
index a50b5a08ae..245302d2bc 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb
@@ -4,7 +4,8 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-padsp-Make-it-compile-on-musl.patch \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://volatiles.04_pulse \
-"
+           file://0001-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch \
+           "
 SRC_URI[md5sum] = "390de38231d5cdd6b43ada8939eb74f1"
 SRC_URI[sha256sum] = "f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e"
 
-- 
2.16.1


