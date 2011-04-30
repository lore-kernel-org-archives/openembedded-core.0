Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QGIM7-00024n-8u
	for openembedded-core@lists.openembedded.org;
	Sun, 01 May 2011 00:09:39 +0200
Received: by pvc30 with SMTP id 30so2816378pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Apr 2011 15:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=HxW8uY59GXMlX2FQ+ppFtZxBAQ7OgVtHtFVCGjY3XR4=;
	b=dyXwnTpj0/Fgefm9YxZcMysOOlmyPIEL/Do9uOGDHcGg3+qdfswerBcxvn4NUyqvIi
	fpLtq+YIIsODXnJXutf3RDT6p3liLQCivx5WyAJNr5EuYHJyo1DPFrNtvuBRIpqYFGFq
	FFG4k2AXfUvrQz6qAC/jVEr8ohXLb/zajgd6c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TtmVzSVcfEiFkSy5NrZWyk4tDvBwiyksKAkyhHwwH1lrR2bUunN+c27CGZy8/jKpsb
	aWEyXTEEcik8zbuzj502sXCV42fV0ZuVdvyTZKdzha+rBdFZZjKrcBuoPRY75fdwiQo4
	4nA0RW6Yx4kvy3uFzVWcSgS/+zhvsnBF5oHV4=
Received: by 10.68.64.225 with SMTP id r1mr7422363pbs.250.1304201224236;
	Sat, 30 Apr 2011 15:07:04 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m5sm2786580pbh.70.2011.04.30.15.07.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 30 Apr 2011 15:07:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Apr 2011 15:06:54 -0700
Message-Id: <fd0c9b724a268371eb1d9fb656f2862d79f5a750.1304200899.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1304200899.git.raj.khem@gmail.com>
References: <cover.1304200899.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] insane.bbclass: Checking for NLS too when checking gettext dependency
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
X-List-Received-Date: Sat, 30 Apr 2011 22:09:39 -0000

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



