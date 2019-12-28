Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id DCFA0603FE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2019 07:56:16 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id k197so15524774pga.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2019 23:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pLtJIx/NXnjmii9g/ty8czlKc3qLXQ/cWRTQ5kL8QNE=;
	b=pAW7FgU1t9n/6UU8sYRebV61Qnf0mzu3qSgQAvg2LqTOHFpQD4NoUSdaqIfb7zKZj2
	MgVC7sEv22yuOAcXP7lvJTTAMlHgIyt56WUwnOk4gfP4IxUcxHj18MmLhfzXfoUDrgAK
	vSTPzVNeVBRg0ci0VC5O6F6GUFbjVvb86yIT/QjtFYUqSU8uu4XSFABssfhqUy3vFHQs
	3QuEGHH4o05RNnacmgPg/XgVuGReD/s0ufHB7UxtMliPNA2H044qlhO0sfaXoNfutgqg
	St9UikIbzPCYMXSfOnyj6MyLUIuZ9B8Wu1hv218T1lP+F1GvZJAoKhxGKewoUziypRcY
	SAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pLtJIx/NXnjmii9g/ty8czlKc3qLXQ/cWRTQ5kL8QNE=;
	b=lAZR9esYzEmaDWegEE9FKUmgqKV6p2x1BeMVWM0SUQqJAtQWoT0VUvYbRS7JX2w6Qt
	apiSMG+ub9qbTucGfZZ6YbcsFy5onH3YrHSd3pNSZ86tXkbzHhlN6nUiy1kHpb+XfRqk
	C5CczIGA5rar95/0C6PHklK5956wbzuzGomjHLNFcWEirDnvG+DUNVMX8gnz4HcnmZ5E
	7MvgxdN+4uGbYb6dL8a624kEmxMnvRe5VN7rZ3YOFGZQs5hD/J/yifjdfT4ACFEoOXXd
	UYtYe8YXXaqMN8HKYi3b4Je4l9Z4cnSer2ykWp/PMqCpbo+XjDtjEhd94bkN7kp5/zb1
	kSEg==
X-Gm-Message-State: APjAAAU90hv+kB12vDAdHZlr2oy56MUGggscFSPD3qgokVYTQ/KO+Db6
	rpUY0pzLk4xIWdyLbT9bLy40tG7zQF8=
X-Google-Smtp-Source: APXvYqykCsRUpAGIM9diHueZokfewDX75wvkhUApmHesyXB/Ckd8DW0UHDRYKb81MsohmFy+xVnZ0g==
X-Received: by 2002:a63:b141:: with SMTP id g1mr61391830pgp.168.1577519777059; 
	Fri, 27 Dec 2019 23:56:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id j7sm43752635pgn.0.2019.12.27.23.56.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 23:56:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Dec 2019 23:56:08 -0800
Message-Id: <20191228075608.47905-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH V3] cmake: Add a knob for cmake VERBOSE settings
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
X-List-Received-Date: Sat, 28 Dec 2019 07:56:17 -0000
Content-Transfer-Encoding: 8bit

Setting VERBOSE always, while is fine on one hand for debugging, its
coming at an expense of creating lots and lots of logs, e.g. qtwebkit
compile logs alone with VERBOSE is 163MB, there are many other large
packages which use cmake e.g. WPE, webkitgtk etc which are in same range
with out this option on, the logs reduce to 861K and also speeds up
build a notch

If user needs to disable these logs for a recipe or globally

CMAKE_VERBOSE = ""

in recipe or in global metadata e.g. local.conf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Andre McCurdy <armccurdy@gmail.com>
---
v2: Make a knob for verbose option and keep the defaults as such
v3: Use environment variable instead of using -v option, it does not
    work for all recipes e.g. fluentbit

 meta/classes/cmake.bbclass | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 8ccb1eefc7..11ffb0d33f 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -181,9 +181,18 @@ cmake_do_configure() {
 	  -Wno-dev
 }
 
+# To disable verbose cmake logs for a given recipe or globally config metadata e.g. local.conf
+# add following
+#
+# CMAKE_VERBOSE = ""
+#
+
+CMAKE_VERBOSE ??= "VERBOSE=1"
+
+# Then run do_compile again
 cmake_runcmake_build() {
-	bbnote ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
-	eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
+	bbnote ${DESTDIR:+DESTDIR=${DESTDIR} }${CMAKE_VERBOSE} cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
+	eval ${DESTDIR:+DESTDIR=${DESTDIR} }${CMAKE_VERBOSE} cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
 }
 
 cmake_do_compile()  {
-- 
2.24.1


