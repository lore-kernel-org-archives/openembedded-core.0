Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id CFDC97317F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 09:13:50 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id y89so120462911qge.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 02:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mu9O4ZK2+pIJLtktwLecqfD8Yx/hSqa5qqDM0T3ai+A=;
	b=fSGU/AzlaAZaZg4hZgL3n2B+KUV+6qPe1tLbL8Qj2urysu+vbmIuvhRdiL7dhmHAA6
	A2MOk9r+40VOWP3Ixu8InrVZjCISYa+MCi+AC7qpwsAuGnj1Y7XypXguAU0pjID6UAdi
	M+3/jJGZbraNCuBPb3cj2iXAI9al31Ro/bTPs31zMbqOHxjPSjAtQHQeRLqsTbs6QhVV
	FoFhagZgV6YJz543LHRf37QOUplSQ5gm6poKGf/AeetIzdBr5FAa6EnGe9t4G/uj1C8/
	xRbZmFHrH4Wn1vHlh45wgsPCVKDQJkQtI6KxNF2feHLSNBVFjZp2ZuQqZ6HxunEzcpMt
	TIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mu9O4ZK2+pIJLtktwLecqfD8Yx/hSqa5qqDM0T3ai+A=;
	b=PTvZ5+pEA9Zka2fDoOehIKIPxRI2Ve4HErSYMajLRhbY6RwuWIpprFMu/MvrbSdizX
	AWjyAtzcFfII0thoBM1IVELSB8sy+sn+qzg0RsFHAO6lY+CW2YD4Ixg5U11xoi12MFi8
	dIKkh3k9eVp1RcGw3lyro/G9KgcfNukwdS5By6flSPN5xPC10UAUeauTNqwz/u1gtzqw
	OT49mpNlJoePEsXWUyS5sgKCfYXYNNB6gQJ+ZggLS5XZNdW3F32LO5uglPCgeRueQM4b
	muyb/OYNZv3X5fLYa+w6ayuyVmwpZcV7vcNWf5R6QV4x9s61KSEZSnxS/cQMWUhfioGL
	aTRw==
X-Gm-Message-State: AD7BkJIQB3VLRUyQo/CA2F3BUH2QUOARkkjgrsjnXhYoFRZ76gLsKBRgvKXUlj/41CGX4g==
X-Received: by 10.140.164.71 with SMTP id k68mr29643382qhk.97.1458378831171;
	Sat, 19 Mar 2016 02:13:51 -0700 (PDT)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135])
	by smtp.gmail.com with ESMTPSA id d64sm7827750qgd.9.2016.03.19.02.13.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Mar 2016 02:13:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Mar 2016 09:13:41 +0000
Message-Id: <1458378822-24897-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1458378822-24897-1-git-send-email-raj.khem@gmail.com>
References: <1458378822-24897-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH V2 3/4] packagegroup: Disable packages not available on musl
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
X-List-Received-Date: Sat, 19 Mar 2016 09:13:51 -0000

They otherwise get pulled into world builds via dependencies
even when they are excluded from world globally

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 8 +++++++-
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb       | 4 +++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 92db8b2..231efe1 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -17,7 +17,7 @@ PROFILE_TOOLS_X_aarch64 = ""
 PROFILE_TOOLS_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-analyze', '', d)}"
 
 RRECOMMENDS_${PN} = "\
-    perf \
+    ${PERF} \
     trace-cmd \
     blktrace \
     ${PROFILE_TOOLS_X} \
@@ -28,11 +28,14 @@ PROFILETOOLS = "\
     powertop \
     latencytop \
     "
+PERF = "perf"
+PERF_libc-musl = ""
 
 # systemtap needs elfutils which is not fully buildable on uclibc
 # hence we exclude it from uclibc based builds
 SYSTEMTAP = "systemtap"
 SYSTEMTAP_libc-uclibc = ""
+SYSTEMTAP_libc-musl = ""
 SYSTEMTAP_mips = ""
 SYSTEMTAP_mips64 = ""
 SYSTEMTAP_mips64n32 = ""
@@ -46,8 +49,10 @@ SYSTEMTAP_aarch64 = ""
 
 LTTNGUST = "lttng-ust"
 LTTNGUST_libc-uclibc = ""
+LTTNGUST_libc-musl = ""
 
 LTTNGTOOLS = "lttng-tools"
+LTTNGTOOLS_libc-musl = ""
 
 LTTNGMODULES = "lttng-modules"
 
@@ -57,6 +62,7 @@ BABELTRACE = "babeltrace"
 
 VALGRIND = "valgrind"
 VALGRIND_libc-uclibc = ""
+VALGRIND_libc-musl = ""
 VALGRIND_mips = ""
 VALGRIND_mips64 = ""
 VALGRIND_mips64n32 = ""
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 68949b7..225204d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -45,9 +45,11 @@ RDEPENDS_packagegroup-self-hosted-host-tools = "\
     mc-helpers-perl \
     mc-helpers-python \
     parted \
-    pseudo \
+    ${PSEUDO} \
     screen \
     "
+PSEUDO = "pseudo"
+PSEUDO_libc-musl = ""
 
 RRECOMMENDS_packagegroup-self-hosted-host-tools = "\
     kernel-module-tun \
-- 
1.8.3.1


