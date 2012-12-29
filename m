Received: from mail-pa0-f46.google.com ([209.85.220.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Top46-00076P-Gk
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Dec 2012 06:34:38 +0100
Received: by mail-pa0-f46.google.com with SMTP id bh2so6333386pad.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2012 21:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=PUo2dEjH6NGEckA7orP++/HmHkPEZOnYg4uqFem6GD4=;
	b=uX2LoEYAcNe1dUhL2jawdT1yHUbTMJFoWPZc5iDAwGdch1L4dMfKYRVxdICloX67h8
	E2XSeXdfk2dfSH8RIRYaRNhpipDC0HHB8g212729O9fp/hI86ZLkKga+4tPyl7GnrYmT
	f8PzWE1hzfeQLZUenGOi24/a2jylvsb+DLyAQNmWrp8w+xu1FpvXPB3i4uVu6l9k0Bpl
	pgY9CFLUas1KZSjuaVBiG/SxmupOSSvDS4BxbjwurMeQVAZasdld6py5mIiG6xqiQQS0
	lRPj+zwnLVz5JrlMDtV7pa+I5RpQEjgaT7U8f01VmSAgnZLmmkp5JS/t2sIgvZltCW3Y
	Iztg==
X-Received: by 10.68.130.226 with SMTP id oh2mr67995900pbb.157.1356758377512; 
	Fri, 28 Dec 2012 21:19:37 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id vs3sm20848581pbc.61.2012.12.28.21.19.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Dec 2012 21:19:36 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 22:19:23 -0700
Message-Id: <3f926cfa57debf042253c7c0db7be5b63de98209.1356758000.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1356758000.git.chris_larson@mentor.com>
References: <cover.1356758000.git.chris_larson@mentor.com>
In-Reply-To: <cover.1356758000.git.chris_larson@mentor.com>
References: <cover.1356758000.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/6] update-alternatives.bbclass: use absolute paths for link targets
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Dec 2012 05:34:39 -0000

From: Christopher Larson <chris_larson@mentor.com>

This improves compatibility, as both the debian update-alternatives and the
chkconfig alternatives require absolute paths.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/update-alternatives.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index a3631ec..556ee7c 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -298,7 +298,7 @@ python populate_packages_prepend () {
                 continue
 
             # Default to generate shell script.. eventually we may want to change this...
-            alt_target = os.path.relpath(alt_target, os.path.dirname(alt_link))
+            alt_target = os.path.normpath(alt_target)
 
             alt_setup_links  += '\tupdate-alternatives --install %s %s %s %s\n' % (alt_link, alt_name, alt_target, alt_priority)
             alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)
-- 
1.8.0



