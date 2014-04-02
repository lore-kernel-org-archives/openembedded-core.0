Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6C26F9FC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 12:26:04 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id t60so134471wes.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Apr 2014 05:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K5VoojVCDwhqSaxyYy9MghH4bmuJJaacWM24imvMsDA=;
	b=w1d+oHksHsAX/dDZ3MJfBIDKsLu5/2NaOmg/9H+UhcFwJ3nk+qlcBaqcZvl78KOipY
	8qQ8HWkyQtSxW3uaQlrcDbJgYM24KmXIMadCmQiheDQlErgy6KhiiKIFCwyG75jaF8rG
	f03xrg/f5O4lUbL6gCD36vlS84lBjrrpj/IAiAk0vfJQdvjPH2j0KEGwo7M9Fna5hohZ
	V7/JeEIfGUj8UmQpMkqTUDcJYkuXBx0Nr12dOdvbT/5yqXN8S7PwbfKiK/bnTmzLL4cU
	5S8V80Krio6lf5n4F6YSqUniyfWF5QzVADphsS/eWogZyQkXkhB5bPHoBEBhSm+bHk4n
	mu5Q==
X-Received: by 10.194.2.145 with SMTP id 17mr430807wju.60.1396441562653;
	Wed, 02 Apr 2014 05:26:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z48sm4191619eel.27.2014.04.02.05.26.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Apr 2014 05:26:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Apr 2014 14:25:35 +0200
Message-Id: <1396441537-2911-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396441537-2911-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396441537-2911-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/5] gcc-target: remove infodir
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
X-List-Received-Date: Wed, 02 Apr 2014 12:26:05 -0000

* it uses autotools but doesn't call autotools_do_install
* fixes QA warning:
  gcc-4.8.2: The /usr/share/info/dir file is not meant to be shipped in a particular package.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index e1179ac..3412aa8 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -104,6 +104,10 @@ FILES_${PN}-doc = "\
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install-host
+	# Info dir listing isn't interesting at this point so remove it if it exists.
+	if [ -e "${D}${infodir}/dir" ]; then
+		rm -f ${D}${infodir}/dir
+	fi
 
 	# Cleanup some of the ${libdir}{,exec}/gcc stuff ...
 	rm -r ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
-- 
1.9.1


