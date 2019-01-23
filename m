Return-Path: <nick83ola@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id F2B5D6C0EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 12:14:23 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id e12so1701710otl.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 04:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ZxzA1i7i1g+fa9UzXlbOYQzGtRDzYUnvPk7dRvF7pZk=;
	b=ZdivU/xWLIUD9HZgLhxJg8B6rou1wNPhaYIGcOB0WrVeLOQ819e3ZICwkiodA8CmdS
	q+Q96ZjLSpJxYgVpUWH55C8LTEWwEEH9bqQ5tuxOXDoIQYhN9EectHhE3hqZOm+KFp+l
	IDmGZSO++K2ql0UqdWMtYnBTCIeosFjY2wEmZZTwhIGmbQAkkGc00bxvgjntzozrF262
	MxRGZ0c96qHkffVdp8LQr3QpYxSLyj+MJsCdZJ5CwoWrlt4k+QktaZjV6TNcE+ay1L1N
	k45U7ETnF1Dai5GpwlO0OsDRNG7RykKUqjVv0J/n78tCYJ7GltWfJ2qmj9GrKMLGHHDJ
	KARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ZxzA1i7i1g+fa9UzXlbOYQzGtRDzYUnvPk7dRvF7pZk=;
	b=fBXsvslzMcqT4kkSzMcHjCp3sLi20ZV8h8N6EFhgYkFFHoiGajAOd2WygQeaHnUFtO
	PvP7BVEJENq5QgiqHaIaTSWARMBb6NIpz01ZmCTRKdcmc2j9wKY80d1XmV8N9hj/yoWe
	P1odl1FU3who5VfmAb/dHknsulzO0mt0VKqFnxZhN+IVAlYjQsBUNkAQLsnGisii7lhZ
	vPE+ed1tmfUfP8hRZ3SJCuxvzhj6CIuGj0l1hFr1f74QwmbmliE6vaaOv4ULe/xOjZs4
	wJIOTx7xRwBlh+QpPHK/sGdx1kJB0x/4W2BIux0Z+Jt5Z0EESWMAN8zVqi5KEKLtYpW1
	l2FQ==
X-Gm-Message-State: AJcUukfPEOLvG/k5ngo9fiSQKC81IOdzgVMaLeerIaqTH706atG6G0KJ
	bOOswdJ2o8AR+7Oojm3dYCIXY5KT32O1lSY7B0oq/aEqf2k=
X-Google-Smtp-Source: ALg8bN6jy+sfPdoCi/ftoAqzpNKnzVQaKQ27BYdAW2Ye5tRwxjInqefqB4jB6F1CbLDe76j8DyKi9RhBXfhjhTgUmbU=
X-Received: by 2002:a9d:394:: with SMTP id f20mr1225076otf.98.1548245664597;
	Wed, 23 Jan 2019 04:14:24 -0800 (PST)
MIME-Version: 1.0
From: nick83ola <nick83ola@gmail.com>
Date: Wed, 23 Jan 2019 12:14:13 +0000
Message-ID: <CABPh3UMd9LvewWZuiTSiJgW_J74E+kJ7Tfxmq7mXgzGjSekF9Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] image-buildinfo: make the build file shell compatible
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
X-List-Received-Date: Wed, 23 Jan 2019 12:14:24 -0000
Content-Type: text/plain; charset="UTF-8"

this patch permit to simplify extracting build information from
the /etc/build file from a script, f ex shell or python.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta/classes/image-buildinfo.bbclass | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/meta/classes/image-buildinfo.bbclass
b/meta/classes/image-buildinfo.bbclass
index 94c585d4cd..3ef6ad129d 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -23,7 +23,7 @@ def image_buildinfo_outputvars(vars, d):
         value = d.getVar(var) or ""
         if (d.getVarFlag(var, 'type') == "list"):
             value = oe.utils.squashspaces(value)
-        ret += "%s = %s\n" % (var, value)
+        ret += '%s="%s"\n' % (var, value)
     return ret.rstrip('\n')

 # Gets git branch's status (clean or dirty)
@@ -40,12 +40,12 @@ def get_layer_git_status(path):
         # Silently treat errors as "modified", without checking for the
         # (expected) return code 1 in a modified git repo. For example, we get
         # output and a 129 return code when a layer isn't a git repo at all.
-        return "-- modified"
+        return "modified"

 # Returns layer revisions along with their respective status
 def get_layer_revs(d):
     layers = (d.getVar("BBLAYERS") or "").split()
-    medadata_revs = ["%-17s = %s:%s %s" % (os.path.basename(i), \
+    medadata_revs = ['BBLAYERS_%s="%s:%s:%s"' % (os.path.basename(i), \
         base_get_metadata_git_branch(i, None).strip(), \
         base_get_metadata_git_revision(i, None), \
         get_layer_git_status(i)) \
@@ -66,19 +66,16 @@ python buildinfo () {
         return
     with open(d.expand('${IMAGE_ROOTFS}${IMAGE_BUILDINFO_FILE}'),
'w') as build:
         build.writelines((
-            '''-----------------------
-Build Configuration:  |
------------------------
-''',
+            '############################################################\n',
+            '# Build Configuration                                      #\n',
+            '############################################################\n',
             buildinfo_target(d),
-            '''
------------------------
-Layer Revisions:      |
------------------------
-''',
+            '\n\n',
+            '############################################################\n',
+            '# Layer Revisions                                          #\n',
+            '############################################################\n',
             get_layer_revs(d),
-            '''
-'''
+            '\n',
        ))
 }

-- 
2.19.1

