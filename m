Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQy0-0003kf-HW
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:57:04 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so1379643pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=HxW8uY59GXMlX2FQ+ppFtZxBAQ7OgVtHtFVCGjY3XR4=;
	b=VbK5FNtMHNNMGZ7K8f4VgIII4SvKql68+RZiCt1Hwd3alF2Hbd0LXS5YBvCF3HIPys
	ykWYaBoc9e6kJxQ91TxIdL0iHUpbkVOFaZRlUb0v4myCI2C/ghQJlZRvsySh5/xPBHqo
	MqA+1Lra7GofZqoHTCm1skpgfrQD0hh8wr9h0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nF/GRnQk+0sJOd1guEI57vY7sAsTkN/V+rS95mJGx0ABDdThJDzWv19W6/76MxJNFI
	T78gF+8/Gv24J2b669cn8xqPTlJjd8lbMJ3rxI9CVy7+V4mX355sB+A5JX9BDJLT2Fzo
	Y7ndkNyakl8m+zSFAOykEXL8TZEeqq492ZENw=
Received: by 10.68.49.66 with SMTP id s2mr5658597pbn.139.1303757677372;
	Mon, 25 Apr 2011 11:54:37 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id a6sm945671pbt.36.2011.04.25.11.54.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:54:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:54:32 -0700
Message-Id: <6fb58e21a9764ca2528ed3c83379cb81eb2c7344.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 03/17] insane.bbclass: Checking for NLS too when checking gettext dependency
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
X-List-Received-Date: Mon, 25 Apr 2011 18:57:04 -0000

Checking for gettext is not needed when --disable-nls is used

Let user know what variant of gettext is missing e.g. gettext-native,
gettext-nativesdk etc, reveals a bit more for user

Check for virtual/gettext

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/insane.bbclass |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 98acf7f..742be5e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -578,20 +578,21 @@ Rerun configure task after fixing this. The path was '%s'""" % root)
         if "configure.in" in files:
             configs.append(os.path.join(root, "configure.in"))
 
-    if "gettext" not in bb.data.getVar('P', d, True) and "gcc-runtime" not in bb.data.getVar('P', d, True):
+    cnf = bb.data.getVar('EXTRA_OECONF', d, True) or ""
+    if "gettext" not in bb.data.getVar('P', d, True) and "gcc-runtime" not in bb.data.getVar('P', d, True) and "--disable-nls" not in cnf:
        if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('nativesdk', d):
           gt = "gettext-native"
        elif bb.data.inherits_class('cross-canadian', d):
           gt = "gettext-nativesdk"
        else:
-          gt = "gettext"
+          gt = "virtual/gettext"
        deps = bb.utils.explode_deps(bb.data.getVar('DEPENDS', d, True) or "")
        if gt not in deps:
           for config in configs:
               gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
               if os.system(gnu) == 0:
-                 bb.fatal("""Gettext required but not in DEPENDS for file %s.
-Missing inherit gettext?""" % config)
+                 bb.fatal("""%s required but not in DEPENDS for file %s.
+Missing inherit gettext?""" % (gt, config))
 
     if not package_qa_check_license(workdir, d):
         bb.fatal("Licensing Error: LIC_FILES_CHKSUM does not match, please fix")
-- 
1.7.4.1



