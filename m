Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TgbCa-0008KW-Sf
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 14:09:22 +0100
Received: from mail-we0-f197.google.com ([74.125.82.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 06 Dec 2012 04:54:53 -0800
Received: by mail-we0-f197.google.com with SMTP id t11so5037778wey.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2012 04:54:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=0QaZ61yhrVn7HC4bYPnXaam8f3Hqv+7chchrg03WvMY=;
	b=DMYyFBN/XnlC3AtnwhWbK2NDTIo8hBIHOb4uWh2/A9JIjCzeASmPJhrUZy1rd5mKas
	QuGJktNhWTz5qxw0+Fk9fJi/jPHf2/etzc/IrNQGFNGe9QZ6k0C3yjDL9bp15dDO14Oy
	tPYs0Jn50L9hf0oqJChKRnvmApmK2seuSfCdQYDlLZ9clgpxVbW1kICEyZF3IoqPEt0L
	jUtd3fDK1lBFpHoKzBMu9oHHZW3AAZ6B3qDuByMrDqgawPMQNaLV3ZQeuYbkp8AIceRd
	v4hidLIZJN9RLL9Ki88ZdrL8ZpG83FAVVzTxQvieeMZOSe7j+PIG9XBgOOcTA35FCfFP
	qTXw==
Received: by 10.216.90.73 with SMTP id d51mr600002wef.188.1354798491364;
	Thu, 06 Dec 2012 04:54:51 -0800 (PST)
Received: by 10.216.90.73 with SMTP id d51mr600000wef.188.1354798491293;
	Thu, 06 Dec 2012 04:54:51 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id gz3sm23019923wib.2.2012.12.06.04.54.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 04:54:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 12:53:14 +0000
Message-Id: <1354798394-27513-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnXX3PZUocYbS+orsWoNtSnGQ9PXr0dhmPxKK5qK/1BapRAcSpPYFoGSyhOYtwj6Bqy4lcWmdHKNPZAWpnkGXrbq7BClg8iC2d1d+Nyp14DHcqU3N6IzjNhSdszj/9Cq2TH93Or4lkKYkpkNlZfJP26r8nGkQsRoI2WU1LwzIRTYYN7v1ctDJi/usaAZIe5koKFvPS0
Subject: [PATCH] package.bbclass: make do_split_packages handle non-existent root directories
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
X-List-Received-Date: Thu, 06 Dec 2012 13:09:22 -0000

This function has different behaviour if the split directory doesn't exist
depending on the recursive argument: non-recursive uses os.listdirs which throws
an exception, recursive uses os.walk which doesn't.

do_split_packages should silently handle non-existent directories because it's
mainly used for plugin directories, which may end up being empty though changing
the distro configuration (for example, connman without wifi distro feature).

So, add an early exit if the split root doesn't exist.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package.bbclass |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 993ce98..8a94e30 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -116,6 +116,13 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
 
     """
 
+    dvar = d.getVar('PKGD', True)
+
+    # If the root directory doesn't exist, don't error out later but silently do
+    # no splitting.
+    if not os.path.exists(dvar + root):
+        return
+
     ml = d.getVar("MLPREFIX", True)
     if ml:
         if not output_pattern.startswith(ml):
@@ -130,7 +137,6 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
         if newdeps:
             extra_depends = " ".join(newdeps)
 
-    dvar = d.getVar('PKGD', True)
 
     packages = d.getVar('PACKAGES', True).split()
 
-- 
1.7.10



