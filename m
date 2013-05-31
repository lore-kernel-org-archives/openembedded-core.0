Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 70DA060959
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 11:22:32 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u59so1143181wes.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 04:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=JQV5lY7RXCIHgkottBWvis7kQU37j0INrREu1alKZ0c=;
	b=XjJooFUdSCSbACWTwI6HLD0qpB42fKjl++4ApC0tGI/GxGO5RGiidUwv27cvYPW8Dh
	3RVNRfZ0WNyodncdaVVNT0y6V55IBgjnr2OjVxB4QSnzLFigEGcjawdBx0Cm/K21aoHb
	nb+R9ofDwVfFIasWzeM+jJEvGn9Xesp8MfdTcPXYwVd3ddrtxfl50Jf11QKVEFxqeBlp
	suAm5i6BJJ32rn08z/Zsh3baQ+aBU2CdrOucqGU+J4pfFeEOuznBOWWvxXq0J6OVANLX
	dzWVgOtLjKsrV2th9CSnedziN1konwEJZ1tTQ6vzPFNWWa/PrcXBvnU89Onf26oM1GPz
	9lFg==
X-Received: by 10.194.47.240 with SMTP id g16mr8983287wjn.43.1369999352960;
	Fri, 31 May 2013 04:22:32 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id eq15sm3268310wic.4.2013.05.31.04.22.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 04:22:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 12:19:16 +0100
Message-Id: <1369999156-28749-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnQOpp2iPLbodqxToHl4HHhffC60ks4YvBoIzOq6D4tHxcy2QmdgSH1ii/23RdtrJ00MGzB
Subject: [PATCH][V2] rpm: remove .real hacks in argument parsing
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
X-List-Received-Date: Fri, 31 May 2013 11:22:32 -0000

The argument parser in RPM was patched to look for <binary>.real, but since the
wrapper now fakes the right argv[0] rpm wasn't able to parse any options.

[YOCTO #4581]

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


