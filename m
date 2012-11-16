Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ive.found@gmail.com>) id 1TZQtg-0001Ek-NQ
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 19:44:13 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so2216595lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 10:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=/KdUlihCI8OlE45mFsWR9TBUsOUvqr3Emr0UNiT03lA=;
	b=MHtEDwxFBsNR5aC+tZKDt+5SUFRdhPjkLXIq5nJkVj0LmCy0ohZuX7VP5WYSmoA7vP
	G+759GAfXSzC7IBTt47N1SSrZ3z2BYhmZfUWM9hiRwXwrBqTT6040f2msJ96sn4r07og
	pXuJL4As/tPTxyZyEvlJoV9hTGrHf6cTLNdc6MAqDesSgzNRlQLSPDdjSyQnp1OVzhdR
	t2w7QG7gVTfJkvvUU5vg0jjstvA+OpxsPxuQ6bXSearNDHM9V6kq+Y6/cTJzyo3k42HU
	xG3Ur9tcFueqBVgWkQFXMxbp+2VIEAXHMzPr0nnMa/30P6bGqBRpt0/WoyTWcrRdolZH
	dk9g==
Received: by 10.112.86.232 with SMTP id s8mr2297135lbz.86.1353090614128;
	Fri, 16 Nov 2012 10:30:14 -0800 (PST)
Received: from blackbox.local ([178.123.142.146])
	by mx.google.com with ESMTPS id sx3sm860948lab.9.2012.11.16.10.30.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 10:30:13 -0800 (PST)
From: Leonid Borisenko <ive.found@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2012 21:29:25 +0300
Message-Id: <1353090566-16318-2-git-send-email-ive.found@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1353090566-16318-1-git-send-email-ive.found@gmail.com>
References: <CAP9ODKo1mQFcR6+HM3A4cE6-vB5RpjyXe1eNiq+-RCKzS71DNw@mail.gmail.com>
	<1353090566-16318-1-git-send-email-ive.found@gmail.com>
Subject: [PATCH v2 1/2] package.bbclass: add getter of additional metadata
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
X-List-Received-Date: Fri, 16 Nov 2012 18:44:13 -0000

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
index 15e505d..6398edf 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -372,6 +372,17 @@ def get_package_mapping (pkg, d):
 
     return pkg
 
+def get_package_additional_metadata (pkg_type, d):
+    base_key = "PACKAGE_ADD_METADATA"
+    for key in ("%s_%s" % (base_key, pkg_type.upper()), base_key):
+        if d.getVar(key) is None:
+            continue
+        d.setVarFlag(key, "type", "list")
+        if d.getVarFlag(key, "separator") is None:
+            d.setVarFlag(key, "separator", "\\n")
+        metadata_fields = [field.strip() for field in oe.data.typed_value(key, d)]
+        return "\n".join(metadata_fields).strip()
+
 def runtime_mapping_rename (varname, d):
     #bb.note("%s before: %s" % (varname, d.getVar(varname, True)))
 
-- 
1.7.10.4



