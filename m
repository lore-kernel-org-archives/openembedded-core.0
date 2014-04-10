Return-Path: <jatedev@gmail.com>
Received: from mail-qa0-f68.google.com (mail-qa0-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6015465E83
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 17:43:04 +0000 (UTC)
Received: by mail-qa0-f68.google.com with SMTP id cm18so1206791qab.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 10:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=9Irey+dX47vwEFYtiuNR8+u82tIQlJlxygoQ4U8ZVYw=;
	b=GNEeHzFXYLUG4vEk0l36bYrTNZQY8Gjw5csoosEOZa20QvXPTZfF7Tw0SvaKh9eRnw
	SWdwCZ7RA0ol9VylUPenJtyLIVecG34OpIK11zS5wHx1gWdewOPNsK6Potio7KRZ+GqW
	pSUrLJY3L90+bbyYjo2L5/LIfRmDNLtW8JjGEH2ZjZkur8M+NIaFX/XSkaZXoXRS7aG3
	i+UmT8ALVz5XQqRgYVRcw9NKPlHcJId19cyodr4LDfXAglEKd3EHd8/w5Jho9w/yK8AU
	Sc8fZaBD+kv+4vYD84620FpkerOQKFcTNVL6XB0Y4ZWyVLKmQ83Egsyazm2T8jGF/ob2
	ykqA==
MIME-Version: 1.0
X-Received: by 10.140.46.10 with SMTP id j10mr21387293qga.71.1397151785539;
	Thu, 10 Apr 2014 10:43:05 -0700 (PDT)
Received: by 10.140.101.138 with HTTP; Thu, 10 Apr 2014 10:43:05 -0700 (PDT)
Date: Thu, 10 Apr 2014 13:43:05 -0400
Message-ID: <CAPphmganA8fjSKRuY8MGu3DQM=K88yxEXHW8LbudoVqEMUVK5A@mail.gmail.com>
From: Jate S <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] useradd: Add dependency on pseudo for setscene task
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
X-List-Received-Date: Thu, 10 Apr 2014 17:43:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

useradd: Add dependency on pseudo for setscene task

Recipes inheriting useradd depend on pseudo-native when running
task do_populate_sysroot_setscene. This fix allows
the sstate-cache result to be used and prevents a rebuild.

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index a850e9d..d40fc71 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -119,6 +119,7 @@ SYSROOTPOSTFUNC_class-native = ""
 SYSROOTPOSTFUNC_class-nativesdk = ""

 USERADDSETSCENEDEPS = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene shad
+USERADDSETSCENEDEPS += "pseudo-native:do_populate_sysroot_setscene"
 USERADDSETSCENEDEPS_virtclass-cross = ""
 USERADDSETSCENEDEPS_class-native = ""
 USERADDSETSCENEDEPS_class-nativesdk = ""

