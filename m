Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id B112372DEC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:04 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id bj1so10914840pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=G4x5D57+KgX+Nsq82TMjMPVvP2MIYBRei0rxu+YCkvs=;
	b=X3zBxgP/3CQy808hbr9wTwUUEHlezmiDdsVcb5hsW8wmLHyYtCGGX1f1NhSKMaiy5s
	APhFxAC9oXmOe66UMk1lXf15RS1V0Ccj8V150oI5lxqz5mdU3xdU0Rh49cs2bX1hoHqd
	8oArhHo5DbgSRbGklIa3/4My+4GbXOZtSMU9W55tlGtg5ErQ3NvX2rN9gJKkHYYWW6Jo
	5RML1hh8fT5tW80wAGbHi0dL/HTfcCuXLJvXMxDuM7u0tbD4fi+OZNvmroIJC00wr1Ug
	M3MTc8fsRN0xjKF/l1fhcC7jybL5Q9u2WG1pyMdRo2NCdHSEvn0X+j4A5YVA1HV2yt2N
	P97w==
X-Received: by 10.66.234.2 with SMTP id ua2mr5298591pac.4.1423152306027;
	Thu, 05 Feb 2015 08:05:06 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:34 -0800
Message-Id: <5b50868ead41aed7b7e563c70229633c958e26e5.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 26/61] perf: Add libdw unwind support to perf-libunwind feature
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:04 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

perf can use either libdw or libunwind dwarf unwinders, or neither.
The perf-libunwind feature implies that if disabled, neither should be
used, so have it disable both libdw and libunwind DWARF unwinders if
disabled.

This fixes [YOCTO #7129].

(From OE-Core rev: 868dd446fa2732858813e96dd8f3f64b2a9ec339)

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 3771cdb..2a47f52 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -64,7 +64,7 @@ B = "${WORKDIR}/${BPN}-${PV}"
 
 SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
 TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
-LIBUNWIND_DEFINES = "${@perf_feature_enabled('perf-libunwind', '', 'NO_LIBUNWIND=1',d)}"
+LIBUNWIND_DEFINES = "${@perf_feature_enabled('perf-libunwind', '', 'NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1',d)}"
 
 # The LDFLAGS is required or some old kernels fails due missing
 # symbols and this is preferred than requiring patches to every old
-- 
1.9.1


