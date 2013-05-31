Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9933860991
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 11:08:56 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x50so1112090wes.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 04:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=mm1zcVmT37jA9aQIchyoBw+YpbsnsamhQyXTwnB4QQA=;
	b=Ht+7ItLS8AXMbO2VrA8rrwNBTZZOjgcR2xX7BSV4u+DhhEWTuQ6PAbvM+JuNHL2vPW
	LNxnfaWye4Qt+Yt0rYub0AcKc2jp4n+7SVHkjZvu8Ebh/e75si2Lx7BVKQAlkr6bME6X
	4lBox+m5z7YuJpRCsXcCTDWS/6Ab8/YF0M0v9dbN0hSFMu8GBatKKio+3aqTWQkbfMMJ
	GRFNJnjXnHX1Z2ASePVM56IJBVdcovDN5ket8saKzAksrAQ8Due8ShooLH6ewGZYLpDz
	lYvjxPWmqnuFJkzH6UJMGkXFNbDZkYPPpqpcEctuSWIewbNDz3ly7lsAmEhJIJtZEX1+
	4K5w==
X-Received: by 10.180.183.211 with SMTP id eo19mr2777578wic.37.1369998536509; 
	Fri, 31 May 2013 04:08:56 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fp16sm3171952wic.6.2013.05.31.04.08.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 04:08:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 12:05:39 +0100
Message-Id: <1369998339-30120-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmi+3AFJceMG85OO4PjvstwXraVABEw95wON4Gx7Frev5SEfthYeK8B15jfO8XlKSab1B0M
Subject: [PATCH] rpm: remove .real hacks in argument parsing
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
X-List-Received-Date: Fri, 31 May 2013 11:08:57 -0000

The argument parser in RPM was patched to look for <binary>.real, but since the
wrapper now fakes the right argv[0] rpm wasn't able to parse any options.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 2dbdca6..25ec23e 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -478,10 +478,6 @@ do_install_append_class-native() {
 			RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
 			RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 	done
-
-	# Adjust popt macros to match...
-	cat ${D}/${libdir}/rpm/rpmpopt | sed -e "s,^\(rpm[^ 	]*\)\([ 	]\),\1.real\2," > ${D}/${libdir}/rpm/rpmpopt.new
-	mv ${D}/${libdir}/rpm/rpmpopt.new ${D}/${libdir}/rpm/rpmpopt
 }
 
 BBCLASSEXTEND = "native"
-- 
1.7.10.4


