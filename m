Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UMeSs-0002ZO-MO
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 15:07:58 +0200
Received: by mail-pa0-f43.google.com with SMTP id hz11so1306160pad.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2013 05:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=OU5WLmlVFBqMOrQYQl5JWLe9+z0WI5xEhre2NwP1ScM=;
	b=0+Tik24BKBLdfSs6YyA0JI3FTDaRR1eQI9r66bK0IS4b8RwoN7nVbzmfR6m1PcNQxf
	sPYAI/ve2vb42g02ayL+LikcokkdQMU+bucZj0gnuUD8gUz/slwbjW6QU523/aCfSIp5
	R4I4fsZeXT7YAXOQL8NNihFEARt2EUVAgWCCadjHglCdSrosHf/sybvN6+1lUaKLNfou
	qJ0D0FeInYFP94iq1vUho9RuDJ5gsNOPY09LL/sAGkX0tV9aB1eyvS4D4CnwLbBSYgAY
	wPMFGyitHAxRpX1/efwRW2CW/++qGUJBN5v8KWHRzzUW/ienQUvYn9vV9YejzNsYrfb2
	kECw==
X-Received: by 10.66.197.197 with SMTP id iw5mr18738069pac.89.1364820649670;
	Mon, 01 Apr 2013 05:50:49 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	hw16sm15212842pab.19.2013.04.01.05.50.46
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 05:50:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2013 14:50:44 +0200
Message-Id: <1364820644-9373-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] buildhistory: record tag names and show warning when the same tag corresponds to different revision
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
X-List-Received-Date: Mon, 01 Apr 2013 13:07:58 -0000

* persistent cache records tag-srcrev mappings, but is not shared between builders
* when tag is moved in remote repo, all builders should rebuild the component to
  use the same source, show warning when revision is different than what was used
  in last build

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/buildhistory.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 82d0bf8..760075f 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -546,6 +546,10 @@ def _get_srcrev_values(d):
             if rev.startswith(autoinc_templ):
                 rev = rev[len(autoinc_templ):]
             dict[name] = rev
+            if 'tag' in ud.parm:
+                tag = ud.parm['tag'];
+                key = 'tag_'+name+'_'+tag
+                dict[key] = rev
     return dict
 
 python do_write_srcrev() {
@@ -556,8 +560,18 @@ python do_write_srcrev() {
     if srcrevs:
         if not os.path.exists(pkghistdir):
             os.makedirs(pkghistdir)
+        data = {}
+        if os.path.exists(srcrevfile):
+            with open(srcrevfile) as f:
+                for line in f:
+                    if line.startswith('# tag_'):
+                        key, value = line.split("=", 1)
+                        key = key.replace('# ', '').strip()
+                        value = value.replace('"', '').strip()
+                        data[key] = value
         with open(srcrevfile, 'w') as f:
             orig_srcrev = d.getVar('SRCREV', False) or 'INVALID'
+            pkg = d.getVar('PN', True)
             if orig_srcrev != 'INVALID':
                 f.write('# SRCREV = "%s"\n' % orig_srcrev)
             if len(srcrevs) > 1:
@@ -565,6 +579,12 @@ python do_write_srcrev() {
                     orig_srcrev = d.getVar('SRCREV_%s' % name, False)
                     if orig_srcrev:
                         f.write('# SRCREV_%s = "%s"\n' % (name, orig_srcrev))
+                    if name.startswith('tag_'):
+                        f.write('# %s = "%s"\n' % (name, srcrev))
+                        if name in data and data[name] != srcrev:
+                            bb.warn("Revision for tag %s in package %s was changed since last build (from %s to %s)" % (name, pkg, data[name], srcrev))
+                        continue
+
                     f.write('SRCREV_%s = "%s"\n' % (name, srcrev))
             else:
                 f.write('SRCREV = "%s"\n' % srcrevs.itervalues().next())
-- 
1.8.1.5



