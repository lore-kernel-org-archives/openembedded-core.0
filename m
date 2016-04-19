Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0947360722
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 12:57:27 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id n3so28263066wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 05:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=erdSNe9cRO/MtxCNZ80gszkbi1GAsZ9pFt6B9v+s+BI=;
	b=awgo76OgjhFPlAfDA4kmJhRqiCel5qI05xMF/DME4PRvTKol/rYGThpXpCtdGSpvvj
	0PoiaJ0k7GiE2MG+B+igvS8BSxVwlAJDPpGqj7h7KHho6BSAuYVMDZT0gwCIWkQoFFfF
	u62lL5uQmBn02pfVQ5KlhmadXHVCWfY/uyEcgPSdG0LNWbZKxeGFhOy+e4U1NgJqZnrw
	mNhNxeOgsyyo87pHxqQe5HSkqiwOnsSOaMoZ9k54t101wQCD3GWez8MFaRQ5SXFlm/u9
	DBjDKlXH14i4eUc6H/VO0hrhdPHind7hIVSLoCSV2i+6NJ36euVsHWYBmR7612RuAijG
	a9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=erdSNe9cRO/MtxCNZ80gszkbi1GAsZ9pFt6B9v+s+BI=;
	b=Wl4f/g6fuKwQQ6p2Yqx9Hv0EvOumQ5NiukWU4ujCYsCCxMMbNBtt2pBuy2hpsu1S/1
	FS+vLRpdNXLzkGOoZy5Nj4DuqjxnQaAtwNbiX9fsPHdz9WPVZu4lQ1MY3kr2oq2mpZqJ
	Cilqsm5qhwSNpjnUmKQ5tqQzL3yx5/TY6/1qhT0qoe/UcwZClEo4XvqNu0c32TTIGqGn
	VPZj0JJhieymIJm7DQ+oVnJo4QOg0CAbupDAiPHUVBigWigiJBGTH4FSogeGK94uO0jW
	uYn/f3NedB7LQg0F1Gj6F5g9duetTi7ONKrU9QH0L8lybQt2BFcFpeSltNRynUmVsHPP
	mbnA==
X-Gm-Message-State: AOPr4FXEe6o8TGs87Fo52l+/dRfbQOJjuEUv1JkkiMRpj/6GRloWN03wKiTzBGMd7Qyvyhk7
X-Received: by 10.28.173.15 with SMTP id w15mr3689497wme.32.1461070647832;
	Tue, 19 Apr 2016 05:57:27 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id o1sm166017wjm.11.2016.04.19.05.57.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Apr 2016 05:57:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2016 13:57:25 +0100
Message-Id: <1461070645-22857-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] perf: pass DESTDIR in EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 19 Apr 2016 12:57:29 -0000

Instead of passing DESTDIR just in the make install invocation, pass it in
EXTRA_OEMAKE.  This appears to stop perf from rebuilding at instal time for me,
which appears to be the trigger for the random build failure.

[ YOCTO #9182 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index c43f39c..3d6ffb3 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -88,6 +88,7 @@ EXTRA_OEMAKE = '\
 '
 
 EXTRA_OEMAKE += "\
+    'DESTDIR=${D}' \
     'prefix=${prefix}' \
     'bindir=${bindir}' \
     'sharedir=${datadir}' \
@@ -110,7 +111,7 @@ do_compile() {
 do_install() {
 	# Linux kernel build system is expected to do the right thing
 	unset CFLAGS
-	oe_runmake DESTDIR=${D} install
+	oe_runmake install
 	# we are checking for this make target to be compatible with older perf versions
 	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" ] && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
 		oe_runmake DESTDIR=${D} install-python_ext
-- 
2.8.0.rc3


