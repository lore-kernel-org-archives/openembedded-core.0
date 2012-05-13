Received: from mail-wg0-f65.google.com ([74.125.82.65])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ive.found@gmail.com>) id 1STZ1E-0000zt-Kt
	for openembedded-core@lists.openembedded.org;
	Sun, 13 May 2012 15:39:28 +0200
Received: by wgbdt11 with SMTP id dt11so509308wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2012 06:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=A6xNa7EiGg1++uz/TehxRrNsBGICrmhKCqXKiI+7l0A=;
	b=l74NLPe/VxeSt5TcS901sgVxzWIjAzDQs99RvVNkCmHbVyawQhrlhu70EBv+CXmCNZ
	9RMKgk2+2n9f7Wg7/O8raGHXOQFsuHloqxMFxvVr5qZPncWp4T+Rim7L5Fe9Jm+xUK+s
	V6Woe32kLVfuUmdhVYjt48lblsTsAZO2sS2hWdtiDpSqWhV1eeMtglMe9JJDngbhbnCV
	g+D5yhKv+RrqnD23PDaNuMTRdOQze1bR5VjriL2Ry1jkZYAxOcygmrTBHrEo+bOt9l7E
	JjHO7RY1ND9WAj1yLV57N/1xMZMEhz1yoaiGGpYxA/poMot2S8/hzfliyolrBvSSMVZ4
	BKew==
Received: by 10.216.132.94 with SMTP id n72mr2933505wei.60.1336915770948;
	Sun, 13 May 2012 06:29:30 -0700 (PDT)
Received: from blackbox.local ([178.123.196.33])
	by mx.google.com with ESMTPS id b3sm27447282wib.4.2012.05.13.06.29.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 May 2012 06:29:30 -0700 (PDT)
From: Leonid Borisenko <ive.found@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 May 2012 16:28:41 +0300
Message-Id: <1336915722-8155-2-git-send-email-ive.found@gmail.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1336915722-8155-1-git-send-email-ive.found@gmail.com>
References: <1336915722-8155-1-git-send-email-ive.found@gmail.com>
Subject: [PATCH 1/2] package.bbclass: add getter of additional metadata
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
X-List-Received-Date: Sun, 13 May 2012 13:39:28 -0000

Two variables are searched for value of additional package metadata:

  * PACKAGE_ADD_METADATA_<PKGTYPE>
  * PACKAGE_ADD_METADATA

First found variable with defined value wins.

<PKGTYPE> is a parameter of getter and expected to be a distinct name
of specific package type. For example: 'DEB' or 'RPM'.

Variable can contain multiple [one-line] metadata fields, separated by
literal sequence '\n'. Separator can be redefined through variable flag
'separator'. Getter returns found value with separator replaced with
newline character.

As side-effect, searched variables acquired flags 'type' (equals to
'list') and 'separator'.

Signed-off-by: Leonid Borisenko <ive.found@gmail.com>
---
 meta/classes/package.bbclass |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 99836e9..a40476c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -326,6 +326,17 @@ def get_package_mapping (pkg, d):
 
 	return pkg
 
+def get_package_additional_metadata (pkg_type, d):
+	base_key = "PACKAGE_ADD_METADATA"
+	for key in ("%s_%s" % (base_key, pkg_type.upper()), base_key):
+		if d.getVar(key) is None:
+			continue
+		d.setVarFlag(key, "type", "list")
+		if d.getVarFlag(key, "separator") is None:
+			d.setVarFlag(key, "separator", "\\n")
+		metadata_fields = [field.strip() for field in oe.data.typed_value(key, d)]
+		return "\n".join(metadata_fields).strip()
+
 def runtime_mapping_rename (varname, d):
 	#bb.note("%s before: %s" % (varname, d.getVar(varname, True)))	
 
-- 
1.7.10



