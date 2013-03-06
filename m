Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UD2r7-0001Gd-Mm
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 02:09:26 +0100
Received: by mail-pb0-f49.google.com with SMTP id xa12so5154886pbc.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2013 16:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=x/TdclxcMhRMW0RXA7wMMxE9WJrKFrHlAzEus+IdWJE=;
	b=F85qZaUUSJMfT8Q1DGjOEmv7WDoSKX4xPwYHXsQbtLbAzi7uArfajNj6sBayXVt8kL
	803o0K0cBspwJlw6/i4VfpT2ZdHxO1mGNAz2Ysk9w6IOhUx/RLF2CpZ/8HXS1Ef7yxxc
	YXGAiCSN8jE1sHzi6B4FrD4ctCa6mqNt0HHSCDNaxTq2Hl2ErClYcziE283c8whE2E07
	KudFluoAnw+JW397HtTkmi8WfxNFgcOt7RfaZOCWTRL00JuVMPyNLMhpAq+dtt4GObEP
	h1t0QJYuG5pCXeG/eOVCZV1uAGuo9L6/B3+/q0qktOKsUCCyNEj4PlZQQ6iYBfZc9L50
	1Opw==
X-Received: by 10.68.75.109 with SMTP id b13mr41805528pbw.25.1362531166814;
	Tue, 05 Mar 2013 16:52:46 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id xr3sm28831108pbc.46.2013.03.05.16.52.43
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 05 Mar 2013 16:52:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2013 01:52:31 +0100
Message-Id: <1362531151-1094-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] kernel-module-split: append space to RDEPENDS
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
X-List-Received-Date: Wed, 06 Mar 2013 01:09:28 -0000

* it was generating invalid RDEPENDS when KERNEL_MODULES_META_PACKAGE had
  RDEPENDS set already without trailing space

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-module-split.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index aa0c499..45639c6 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -173,7 +173,7 @@ python split_kernel_module_packages () {
     modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
     if modules:
         metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE', True)
-        d.appendVar('RDEPENDS_' + metapkg, ' '.join(modules))
+        d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
 
     # If modules-load.d and modprobe.d are empty at this point, remove them to
     # avoid warnings. removedirs only raises an OSError if an empty
-- 
1.8.1.5



