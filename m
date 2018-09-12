Return-Path: <3Nk2ZWwgJABkz0G3HI71LzNBD.1DB@flex--abrestic.bounces.google.com>
Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com
	[209.85.222.201])
	by mail.openembedded.org (Postfix) with ESMTP id 6C47B746F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 17:30:29 +0000 (UTC)
Received: by mail-qk1-f201.google.com with SMTP id u129-v6so2265495qkf.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 10:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=V9HiHenboURw21GmvnO3SNysA3IGWXccTppmaO+yHYY=;
	b=O1s5fXduCrUTnTBW55phXjukNX0d2DKqCybNX2fEobMUbnb9uvKxzNFXLspGAefO+u
	3pfmBBet2844foMFEHHTQfDZ/EFxZ9oBT89iTXCr+9Pc4wdbFrmhrq10ufbAN2sbZvYj
	lzIoaOdJ1KP121mRqT8N1K+oha3nILbsmlfDj9gZYdkQxHCC+cuP0PJHLUMQgEHtkFKi
	EccWQNWi8Bnf03fGT0D+iMRq4ufndn0mvv//nh3KCEVhhp6scB0RUhVbge+uubF1wEMY
	REJdPTr3ECczZyQ4DM/wiWiJL31kwypMwJgsTinKL2ySGpDhIHqkHoa0+mGDl2S33KQx
	aN3Q==
X-Gm-Message-State: APzg51DwfINNV031YaiZUW8yD71Xjm2wgj1ENHVPe75uu4WNZiHddhVr
	5X9M571DExKE3YPL+vj+JfzPIyuBt4wofSjwz4o3SEs69suwXJtfLpJGXqubRL95Yx6Lqc2kRUR
	E+aHVUy0NBkR0eDkefGiYhciXL2Dds7H0zO6H69iMyXMN9Oo8EJSCfuEBOimoNnFTRuBDE/8RsZ
	cRaF/8k75FwbpD
X-Google-Smtp-Source: ANB0VdZkJBgzUc+9+sbRqs9wUsLweZ8R8tAhhulhLDTptuABiaitEjjtAuAdf0AADFl1M56JK7ZJMPbbeILasw==
X-Received: by 2002:ac8:1c2e:: with SMTP id a43-v6mr993732qtk.49.1536773430215;
	Wed, 12 Sep 2018 10:30:30 -0700 (PDT)
Date: Wed, 12 Sep 2018 10:30:25 -0700
Message-Id: <20180912173025.67852-1-abrestic@waymo.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.0.rc2.392.g5ba43deb5a-goog
From: Andrew Bresticker <abrestic@waymo.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: do not pull in any perl dependencies unless scripting is requested
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
X-List-Received-Date: Wed, 12 Sep 2018 17:30:29 -0000
Content-Type: text/plain; charset="UTF-8"

From: Dima Zavin <dmitriyz@waymo.com>

Signed-off-by: Dima Zavin <dmitriyz@waymo.com>
Signed-off-by: Andrew Bresticker <abrestic@waymo.com>
---
 meta/recipes-kernel/perf/perf-perl.inc | 7 +++++++
 meta/recipes-kernel/perf/perf.bb       | 8 +-------
 2 files changed, 8 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-kernel/perf/perf-perl.inc

diff --git a/meta/recipes-kernel/perf/perf-perl.inc b/meta/recipes-kernel/perf/perf-perl.inc
new file mode 100644
index 0000000000..ae77319b20
--- /dev/null
+++ b/meta/recipes-kernel/perf/perf-perl.inc
@@ -0,0 +1,7 @@
+inherit perlnative cpan-base
+
+# Env var which tells perl if it should use host (no) or target (yes) settings
+export PERLCONFIGTARGET = "${@is_target(d)}"
+export PERL_INC = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}/CORE"
+export PERL_LIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
+export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index e9db6c66c4..514c87835d 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -52,13 +52,7 @@ export WERROR = "0"
 do_populate_lic[depends] += "virtual/kernel:do_patch"
 
 # needed for building the tools/perf Perl binding
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'perlnative', '', d)}
-inherit cpan-base
-# Env var which tells perl if it should use host (no) or target (yes) settings
-export PERLCONFIGTARGET = "${@is_target(d)}"
-export PERL_INC = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}/CORE"
-export PERL_LIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
-export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
+include ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'perf-perl.inc', '', d)}
 
 inherit kernelsrc
 
-- 
2.19.0.rc2.392.g5ba43deb5a-goog


