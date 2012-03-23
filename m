Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB4BV-0002FE-BH
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 14:05:37 +0100
Received: by mail-wi0-f171.google.com with SMTP id hj13so1769043wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 05:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=hH8wUgHPJwf7wiTTJdHyGn4+tU+jU5HAxkjuyC9nFBo=;
	b=DA62Th42rNASVY7Z4nuF/EmvE12ibMlaIjL9A4BT5dhytm1tZnsVsHGBIywpFIJGb1
	oYQlFvDRkFko2c+HPGZ7UKYumNJ8DtCCYfcSZF6NNH4Rm/6UZy15/sRnlcsryeT2+3pf
	9Kdk2C/KZiD96utLRnRojuLoemjWIigeonUqnkLIwrkTUo59AElnQ+7girFt1C/RPYdV
	DFf4dZiXqndznhayJOFwh7zM3nVuNp3//rm1tFtZYXAFZ3e5QxA8yvmiKhN8Zha+AbuF
	WJNdxl5dERuX9LAvnGxYcJd4vsNL0I4JSfpvnLL/jy91jdoKObs0QxEaeuN26lcE7md2
	J9rg==
Received: by 10.180.88.199 with SMTP id bi7mr6360940wib.12.1332507403584;
	Fri, 23 Mar 2012 05:56:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e6sm13641017wix.8.2012.03.23.05.56.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 05:56:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 13:56:27 +0100
Message-Id: <4e31dfddbb238cd5e3c2ce19a49996e113419212.1332507302.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
References: <dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332507302.git.Martin.Jansa@gmail.com>
References: <cover.1332507302.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/6] kernel.bbclass: use symlinks for modutils files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 13:05:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 975ae13..54ed7f7 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -407,16 +407,14 @@ python populate_packages_prepend () {
 		# appropriate modprobe commands to the postinst
 		autoload = d.getVar('module_autoload_%s' % basename, True)
 		if autoload:
-			name = '%s/etc/modutils/%s' % (dvar, basename)
-			f = open(name, 'w')
-			for m in autoload.split():
-				f.write('%s\n' % m)
-			f.close()
 			name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
 			f = open(name, 'w')
 			for m in autoload.split():
 				f.write('%s\n' % m)
 			f.close()
+			modutils_name = '%s/etc/modutils/%s' % (dvar, basename)
+			modutils_target = '../modules-load.d/%s.conf' % (basename)
+			os.symlink(modutils_target, modutils_name)
 			postinst = d.getVar('pkg_postinst_%s' % pkg, True)
 			if not postinst:
 				bb.fatal("pkg_postinst_%s not defined" % pkg)
-- 
1.7.8.5



