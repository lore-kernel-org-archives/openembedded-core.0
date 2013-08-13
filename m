Return-Path: <ross.burton@intel.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5ADC96B5D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 10:11:08 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so4059995eek.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 03:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=qxMxT6NSCqnZ6y2urVdwLUZQz7BwxPGuSdAnmXfgML0=;
	b=Hg+Hg588aTi++bzbRhAnVfmUeTR9vwxxH+PEbRrzRNfLDvXGWejg35Mw3BFdRdAXb8
	O168trFrjHpTlYQLzbNFvA27nbYgLvnflhd+/GhWsSNY0nFcGJ1txAk8mXfa4urU+IZY
	LiCzJRRtr2cwhvxRlkE63jJwI+MBQvnByMw1KMQ3YIGz9FxCtDlFpUJB3iwd4f/YxWtN
	ctjJPd2Z6DacNn7629QevinbcN42YnHa0LfFZmKZPWAUdBPr+MlBRp+Y18VmQTFrUj+Q
	zkQWPaVCQZYfW4nb0RjaDzWz95NJv6RJ2+MRW6e7IkSz0E4PHW9CH3efpoKOE6uOirkn
	RuaA==
X-Gm-Message-State: ALoCoQmaEX2/dPursXsaUUgVF/DSO4N1scqFMnrSRpcislsGhIZmD5u9J2PWX7e07W1zeQk4pM8o
X-Received: by 10.15.65.76 with SMTP id p52mr2768eex.145.1376388668635;
	Tue, 13 Aug 2013 03:11:08 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id t6sm65098119eel.12.2013.08.13.03.11.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 Aug 2013 03:11:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2013 11:11:00 +0100
Message-Id: <e91cbd17131101d1c470669acce66682ae06960a.1376388241.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1376388241.git.ross.burton@intel.com>
References: <cover.1376388241.git.ross.burton@intel.com>
In-Reply-To: <cover.1376388241.git.ross.burton@intel.com>
References: <cover.1376388241.git.ross.burton@intel.com>
Subject: [PATCH 2/2] insane: don't abort if workdir is not TMPDIR/work
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
X-List-Received-Date: Tue, 13 Aug 2013 10:11:08 -0000

The BASE_WORKDIR variable can be used instead of enforcing WORKDIR being
TMPDIR/work (and aborting the build if it isn't).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index aa02985..865db5e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -175,10 +175,7 @@ def package_qa_check_rpath(file,name, d, elf, messages):
     if os.path.islink(file):
         return
 
-    bad_dirs = [d.getVar('TMPDIR', True) + "/work", d.getVar('STAGING_DIR_TARGET', True)]
-
-    if not bad_dirs[0] in d.getVar('WORKDIR', True):
-        bb.fatal("This class assumed that WORKDIR is ${TMPDIR}/work... Not doing any check")
+    bad_dirs = [d.getVar('BASE_WORKDIR', True), d.getVar('STAGING_DIR_TARGET', True)]
 
     phdrs = elf.run_objdump("-p", d)
 
-- 
1.7.10.4


