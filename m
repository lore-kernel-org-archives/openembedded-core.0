Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id CE9D86013D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 06:07:16 +0000 (UTC)
Received: by igbue6 with SMTP id ue6so34685993igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 23:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=erCn9FnsEB3QxLoafD6C5UnivT48fNWz2D4EzmZpBp4=;
	b=DmLki5RdDL0mbv3LaQTapzoqU6Mzl1I9ddMaQjC/UVBnKADJWJmAUVGf/QSPmdZ+72
	d70/MYxYuHeES4EoYwNR9LNoHE4YWCx4CV9EmgTTU/Xs87ALf8YsX+twBUYwItGaz2kD
	Dd2P2DL/99O/sVcrg1beKIj29sqEZBUemUiPDd1RdXt7GzJZ1/Mj09earVVhEFD592Tv
	MMCPw3RwE4YYdvqwikYM1LJovWk9wPRrEDrd6ImsFhJJXMLoDz2U+5kDO78beQ5OH4Rn
	5o4YRrSCogBBsugsn0TwiRNcmph6q6GpcOAA4lv0bShN/nkrK5W7pgi09Q1H8r82VrQV
	esIg==
X-Received: by 10.107.14.141 with SMTP id 135mr57295423ioo.15.1426658837750;
	Tue, 17 Mar 2015 23:07:17 -0700 (PDT)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id v13sm1032804igd.14.2015.03.17.23.07.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Mar 2015 23:07:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 06:06:58 +0000
Message-Id: <1426658818-8179-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] glibc: Fix kconfig to work in non interactive mode
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
X-List-Received-Date: Wed, 18 Mar 2015 06:07:16 -0000

For glibc kconfig patch that we have we have three options implemented
defconfig, config and menuconfig
config is what we use and it calls conf program with --oldaskconfig
option which is suppose to behave as expected waiting for inputs from
line oriented program

[YOCTO #6614]

Change-Id: Icb74b0343d57dcbfae5122b0c772d260481ee125
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.21.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index d2e69c4..f57e3f9 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -111,7 +111,7 @@ do_configure () {
         fi
         (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
         find ${S} -name "configure" | xargs touch
-        CPPFLAGS="" oe_runconf
+        yes '' | CPPFLAGS="" oe_runconf
 }
 
 rpcsvc = "bootparam_prot.x nlm_prot.x rstat.x \
-- 
2.1.4


