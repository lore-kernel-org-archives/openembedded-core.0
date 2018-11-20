Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f178.google.com (mail-it1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8BF6B1F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 20:04:23 +0000 (UTC)
Received: by mail-it1-f178.google.com with SMTP id o19so5284842itg.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 12:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Swpd3HE4evNRPNBvUtAdyMojZZiNgbB2KgJ/WjgA1yg=;
	b=aQGyjaP6oyExhWDwAP4PHMW+/xtp0YJybo1rVeS7r0q0JGGD+7Qx3s4jJLxkVxDhyD
	lYH9bNjUHIrbndTtU9eUQ/8sNox8jHRCMJ1DPQtFFkFgbFAXsjkcHe0SX32qVzxESAUi
	paFEg+3D9Tk0STE1oFVQ5JhH7+hUcUEJlkP/P8P2mfgt9uRzt01Yhqkog9JUQ7Xf8g49
	YVWACx8SQokw54v8fZ9y9EgLJSygkZRN6hF/gFhs6r+kn4RQzC/2IfXAPi4ECbilmppA
	/RhJ68OkPfQJZ7U+IQdsWLBmDJbu5ThLjpwdwlEFxbHUk9MMmU4SMkUwuL48LvGKjtnE
	cv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Swpd3HE4evNRPNBvUtAdyMojZZiNgbB2KgJ/WjgA1yg=;
	b=lNhesBIFsfuFzcGKNO/f9NM4B+nj1vA8o8X4UUPSsoh7pn2KUmk7MRsTDRRKYe1IHS
	BTfGc9HSGcJxnpeMghCC7q5pwPIzgtwymsdUfZt/4L63u09I/kr/Bjsx5FpeEU3HCtd8
	iQoOCae7uR5rD6Tq+hKbrhkYkTdRoMWjlzbn40Z7AnkNFnsfGWihbKwN6JKoS4+249tq
	MmJMNOK87+TVrZP9bNOXTs2o82jgnD7xib1Dz3Sj3AtOXi5WpDEkntfq8BoiP9C28i4A
	nZABn+VJqgjkA8VC1R8ZEbNtA60T2M9bJGnHwyfQxY9Wc6pEXGF7T9svN5kuGKBKTBeR
	NFGw==
X-Gm-Message-State: AGRZ1gKQYuJAca4E6/s+zHL95rp5aXT1mimD7G6teAlvOwBoJhqX+0Gq
	lbgbY4UcGiYED5sxF27px55iZo0e400=
X-Google-Smtp-Source: AFSGD/UevufegD2I5F+dgsB4nyk9q8vYslg/Mp+/Xy9YfDNz5K1pO5CGI0tWljmO0x0I8WzLexn4vA==
X-Received: by 2002:a24:3213:: with SMTP id
	j19-v6mr2724786ita.88.1542744264615; 
	Tue, 20 Nov 2018 12:04:24 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	k133-v6sm16414194itb.16.2018.11.20.12.04.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Nov 2018 12:04:23 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 14:04:15 -0600
Message-Id: <20181120200416.15895-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181120200416.15895-1-JPEWhacker@gmail.com>
References: <20181120200416.15895-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] meta/icecc.bbclass: Move system blacklist to variables
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
X-List-Received-Date: Tue, 20 Nov 2018 20:04:24 -0000
Content-Transfer-Encoding: 8bit

The system blacklists are moved to variables which are ignore when
hashing. This prevents changes to the blacklists from causing all
taskhashes to change (and thus rebuild).

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 7597e4c0c93..037cce1e964 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -33,7 +33,7 @@ BB_HASHBASE_WHITELIST += "ICECC_PARALLEL_MAKE ICECC_DISABLED ICECC_USER_PACKAGE_
     ICECC_CARET_WORKAROUND ICECC_CFLAGS ICECC_ENV_VERSION \
     ICECC_DEBUG ICECC_LOGFILE ICECC_REPEAT_RATE ICECC_PREFERRED_HOST \
     ICECC_CLANG_REMOTE_CPP ICECC_IGNORE_UNVERIFIED ICECC_TEST_SOCKET \
-    ICECC_ENV_DEBUG \
+    ICECC_ENV_DEBUG ICECC_SYSTEM_PACKAGE_BL ICECC_SYSTEM_CLASS_BL \
     "
 
 ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
@@ -61,6 +61,23 @@ CXXFLAGS += "${ICECC_CFLAGS}"
 # Debug flags when generating environments
 ICECC_ENV_DEBUG ??= ""
 
+# "system" recipe blacklist contains a list of packages that can not distribute
+# compile tasks for one reason or the other. When adding new entry, please
+# document why (how it failed) so that we can re-evaluate it later e.g. when
+# there is new version
+#
+# libgcc-initial - fails with CPP sanity check error if host sysroot contains
+#                  cross gcc built for another target tune/variant
+ICECC_SYSTEM_PACKAGE_BL += "\
+    libgcc-initial \
+    "
+
+# "system" classes that should be blacklisted. When adding new entry, please
+# document why (how it failed) so that we can re-evaluate it later
+#
+ICECC_SYSTEM_CLASS_BL += "\
+    "
+
 def icecc_dep_prepend(d):
     # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
     # we need that built is the responsibility of the patch function / class, not
@@ -134,7 +151,7 @@ def use_icecc(bb,d):
 
     pn = d.getVar('PN')
 
-    system_class_blacklist = []
+    system_class_blacklist = (d.getVar('ICECC_SYSTEM_CLASS_BL') or "").split()
     user_class_blacklist = (d.getVar('ICECC_USER_CLASS_BL') or "none").split()
     package_class_blacklist = system_class_blacklist + user_class_blacklist
 
@@ -143,15 +160,7 @@ def use_icecc(bb,d):
             bb.debug(1, "%s: class %s found in blacklist, disable icecc" % (pn, black))
             return "no"
 
-    # "system" recipe blacklist contains a list of packages that can not distribute compile tasks
-    # for one reason or the other
-    # this is the old list (which doesn't seem to be valid anymore, because I was able to build
-    # all these with icecc enabled)
-    # system_package_blacklist = [ "glibc", "gcc", "bind", "u-boot", "dhcp-forwarder", "enchant", "connman", "orbit2" ]
-    # when adding new entry, please document why (how it failed) so that we can re-evaluate it later
-    # e.g. when there is new version
-    # building libgcc-initial with icecc fails with CPP sanity check error if host sysroot contains cross gcc built for another target tune/variant
-    system_package_blacklist = ["libgcc-initial"]
+    system_package_blacklist = (d.getVar('ICECC_SYSTEM_PACKAGE_BL') or "").split()
     user_package_blacklist = (d.getVar('ICECC_USER_PACKAGE_BL') or "").split()
     user_package_whitelist = (d.getVar('ICECC_USER_PACKAGE_WL') or "").split()
     package_blacklist = system_package_blacklist + user_package_blacklist
-- 
2.19.1


