Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id B254E731A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 02:47:59 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id e195so28724119oig.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 18:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UGT3MZQpPQoDc6Tgeh0X3AMdEJVPBxFyyoeCuVxDHhE=;
	b=EcT/2kRUXYQH/RIDQ/lWnv/hGyh+eMDrQJsT4dZiwwGFqhAJ3Q6OqNivvDq2Mc7yRj
	BCCKD2X4pq0eLGyJmjJbt96Kzx+mn5ofaAaKiOOVNpjHrj6EwoloPsPAOiDkEItA0ko2
	hmeObbmHZxU9s+Go0m2b4yXUTF1WkuYYW1T3VwLfkiQqRR1prI5GjYQu8fCIL734ce4V
	NsZm7nJvsp3pxaDaEVnovH82PA/AB/ugbR5cWH9OKsK2TTSqZaM72ozVDKqfSDSh0ecH
	sysm3Uir+fRpcEZ+4suI8ZAcEB2BIZ5okvtblMBXM0WpPphdDuokduCAZigwb/6dhCkw
	LErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UGT3MZQpPQoDc6Tgeh0X3AMdEJVPBxFyyoeCuVxDHhE=;
	b=FiMePgkx2IKkRG4yQjuH+m/tiJQnLCxBPf0ubcjkr/PBYnhNqmXBYkN3j5HspBrzAo
	UPR5jRmI6vopSnjJWFTqa4ZmVlDgllxP9naXNpfAgKiJU1C8nkAd0HtRvZs48zH3QBPm
	/FuCxIx4EdzvJLcqD4CdR4IQBgrUhFbExQWz3imFGWDeg9FQ+xuV9XQ3ZfqI3A2SEa85
	dQElEhclS41DY8nyVaOR+3JgH/6HCdOeJeHrnnMVhcHXMrfqk3n1X782fx9BoY0r4wd5
	Ig8jzL3erdZ7WjAfVjjIjKcHSLR/MIWtSlB/RCrd7t+8X30YlUA5botVKflPmvGGlWtg
	3lFg==
X-Gm-Message-State: ALoCoQllVYw88z3fRu8l194CJpY0rTMB/VJu/vqHf8yi2zN0G7hZjvAnEy2Borbl0Z18top+Xxhu2e9JO1k63BuI5mXlGmYY/Q==
X-Received: by 10.202.60.135 with SMTP id j129mr24821347oia.70.1453258079914; 
	Tue, 19 Jan 2016 18:47:59 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	v142sm17042620oie.28.2016.01.19.18.47.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jan 2016 18:47:58 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 18:47:49 -0800
Message-Id: <1453258071-22847-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453258071-22847-1-git-send-email-armccurdy@gmail.com>
References: <1453258071-22847-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 1/3] valgrind: let valgrind determine its own optimisation flags
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
X-List-Received-Date: Wed, 20 Jan 2016 02:48:00 -0000

Valgrind likes to control its own optimisation flags. It generally
defaults to -O2 but uses -O0 for some specific test apps etc. Passing
our own flags (via CFLAGS) means we interfere with that.

Giving valgrind control of optimisation is hopefully an even better
solution than the previous one of forcing -O0 for all tests.

  http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=98c4a3ffb8dca10739be600e8d6df7fb6aa4958f

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index 70d84fe..8e9b72c 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -44,6 +44,11 @@ EXTRA_OECONF_append_arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
 
 EXTRA_OEMAKE = "-w"
 
+# valgrind likes to control its own optimisation flags. It generally defaults
+# to -O2 but uses -O0 for some specific test apps etc. Passing our own flags
+# (via CFLAGS) means we interfere with that.
+SELECTED_OPTIMIZATION = ""
+
 CFLAGS_append_libc-uclibc = " -D__UCLIBC__ "
 
 do_install_append () {
@@ -63,10 +68,9 @@ RDEPENDS_${PN}-ptest += " sed perl glibc-utils perl-module-file-glob"
 INSANE_SKIP_${PN}-ptest += "file-rdeps"
 
 do_compile_ptest() {
-    oe_runmake check CFLAGS="${CFLAGS} -O0" CXXFLAGS="${CXXFLAGS} -O0"
+    oe_runmake check
 }
 
-
 do_install_ptest() {
     chmod +x ${B}/tests/vg_regtest
 
@@ -107,4 +111,3 @@ do_install_ptest() {
     # handle multilib
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
-
-- 
1.9.1


