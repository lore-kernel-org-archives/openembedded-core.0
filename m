Received: from mail-pd0-f174.google.com ([209.85.192.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNJee-0001y8-CZ
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 11:06:52 +0200
Received: by mail-pd0-f174.google.com with SMTP id p12so730473pdj.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=KfvD0cUJaRoVtZkKhLL9mkD1Q7q2fKuSpU8tlTg217Q=;
	b=BUoD+6qc/BqlbcX0Iiygt6wN1E5sCCN3o4kkajcdHWJ5wA/2FaKqPQyeqoCf1MQs4l
	uirNbJSr5I1IojHGUWTuvkK6aW9BrHipV6hN0UNIxMQoFPdt/YZVIzXusimgvZwWN1re
	3LkI61afhleb35GxjcjDgOsb5cEXjkfH823We8N8cDemXtBth1BZsh7iyQuNa3aY+wKM
	UffvIRpQU/lF7XrZAzPjyy18M5AsGeVw5C9ZrF+dYzcbdD8zauWRZWEQvFvCk4uzSyJy
	XrMbqk6rxcu9VA5c+z3ljbChM2HViWwo0PdigiClaJPbJlWgjyJVvbHqvNOQyjGg8RaH
	lYXg==
X-Received: by 10.66.16.194 with SMTP id i2mr1864413pad.112.1364978980666;
	Wed, 03 Apr 2013 01:49:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pg7sm5217142pbc.5.2013.04.03.01.49.37
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 01:49:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 10:49:36 +0200
Message-Id: <1364978976-18388-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <20130403082450.GE10679@jama.dyndns-home.com>
References: <20130403082450.GE10679@jama.dyndns-home.com>
Subject: [PATCHv2] buildhistory: record tag names and show warning when the same tag corresponds to different revision
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
X-List-Received-Date: Wed, 03 Apr 2013 09:06:52 -0000

* persistent cache records tag-srcrev mappings, but is not shared between builders
* when tag is moved in remote repo, all builders should rebuild the component to
  use the same source, show warning when revision is different than what was used
  in last build

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/buildhistory.bbclass | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 82d0bf8..8c9f794 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -538,24 +538,38 @@ def _get_srcrev_values(d):
             scms.append(u)
 
     autoinc_templ = 'AUTOINC+'
-    dict = {}
+    dict_srcrevs = {}
+    dict_tag_srcrevs = {}
     for scm in scms:
         ud = urldata[scm]
         for name in ud.names:
             rev = ud.method.sortable_revision(scm, ud, d, name)
             if rev.startswith(autoinc_templ):
                 rev = rev[len(autoinc_templ):]
-            dict[name] = rev
-    return dict
+            dict_srcrevs[name] = rev
+            if 'tag' in ud.parm:
+                tag = ud.parm['tag'];
+                key = name+'_'+tag
+                dict_tag_srcrevs[key] = rev
+    return (dict_srcrevs, dict_tag_srcrevs)
 
 python do_write_srcrev() {
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
     srcrevfile = os.path.join(pkghistdir, 'latest_srcrev')
 
-    srcrevs = _get_srcrev_values(d)
+    srcrevs, tag_srcrevs = _get_srcrev_values(d)
     if srcrevs:
         if not os.path.exists(pkghistdir):
             os.makedirs(pkghistdir)
+        old_tag_srcrevs = {}
+        if os.path.exists(srcrevfile):
+            with open(srcrevfile) as f:
+                for line in f:
+                    if line.startswith('# tag_'):
+                        key, value = line.split("=", 1)
+                        key = key.replace('# tag_', '').strip()
+                        value = value.replace('"', '').strip()
+                        old_tag_srcrevs[key] = value
         with open(srcrevfile, 'w') as f:
             orig_srcrev = d.getVar('SRCREV', False) or 'INVALID'
             if orig_srcrev != 'INVALID':
@@ -568,6 +582,13 @@ python do_write_srcrev() {
                     f.write('SRCREV_%s = "%s"\n' % (name, srcrev))
             else:
                 f.write('SRCREV = "%s"\n' % srcrevs.itervalues().next())
+            if len(tag_srcrevs) > 0:
+                for name, srcrev in tag_srcrevs.items():
+                    f.write('# tag_%s = "%s"\n' % (name, srcrev))
+                    if name in old_tag_srcrevs and old_tag_srcrevs[name] != srcrev:
+                        pkg = d.getVar('PN', True)
+                        bb.warn("Revision for tag %s in package %s was changed since last build (from %s to %s)" % (name, pkg, old_tag_srcrevs[name], srcrev))
+
     else:
         if os.path.exists(srcrevfile):
             os.remove(srcrevfile)
-- 
1.8.1.5



