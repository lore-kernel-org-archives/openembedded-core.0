Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SHye5-0004ca-Qo
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 16:35:41 +0200
Received: by wibhj13 with SMTP id hj13so828215wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 07:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=jT30zdzWP2z86bRHgXPBACooYOmaIGc7bWW/CrrgMuI=;
	b=TvQJXGlYKvuytBcwVhj5X2t2sXP8xM7M+hN0v84TBZ7CfK4aL0pOgMmg4bjD/omXeC
	n2J60gIIHZh//4LqQpq6+Qd6PkUXksy1ILbIqmAhpJMGPR+G/lRlOU4zclcX76PlXKwk
	/9qzTowYqbBGdZp22FIRICDahuN8xPJBQMqkaD60re2xNVMu5amC3w1N1DDJB0s2YOrS
	4DZZMCN6TJ+8qd+WSTJk1xNd1+RkhWThxYBtyK1hUnZ0kNCDvtyPR77uAme8dwUYaOXk
	S3UdjsV32yOTQ5abyhgiMSZq+t2+Eh5ZSXSV3aqlOTnG0fNY2ZeqO6x3LjNmuF9XK4mK
	BWdw==
Received: by 10.180.83.72 with SMTP id o8mr16786114wiy.5.1334154383056;
	Wed, 11 Apr 2012 07:26:23 -0700 (PDT)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id l5sm45283288wia.11.2012.04.11.07.26.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 07:26:22 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 17:26:15 +0300
Message-Id: <46a62192da80f228b08dc5412f61143f15dcff57.1334154247.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334154247.git.andrei@gherzan.ro>
References: <cover.1334154247.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQl+5wW4bh0MLr5FvV06xVGPa0woq7vT31ga9Hj6cIxtD3gAMVMdsYvWQiv/YrXfj+dsg+yW
Subject: [PATCH 1/3] createrepo: Python scripts should use the python interpreter from env
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
X-List-Received-Date: Wed, 11 Apr 2012 14:35:41 -0000

Added path to modify the hardcoded path of python interpreter from python
scripts.
The python interpreter should be the one from native sysroot and not the
one from host machine.

[YOCTO #2134]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 ...n-scripts-should-use-interpreter-from-env.patch |   47 ++++++++++++++++++++
 .../createrepo/createrepo_0.4.11.bb                |    3 +-
 2 files changed, 49 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch

diff --git a/meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch b/meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch
new file mode 100644
index 0000000..80205a1
--- /dev/null
+++ b/meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch
@@ -0,0 +1,47 @@
+Author: Andrei Gherzan <andrei@gherzan.ro>
+
+Python interpreter should be use from PATH - native python - and not the one from
+host.
+
+Upstream-Status: Inappropriate [configuration]
+
+Index: createrepo-0.4.11/genpkgmetadata.py
+===================================================================
+--- createrepo-0.4.11.orig/genpkgmetadata.py	2012-04-10 17:14:05.278649384 +0300
++++ createrepo-0.4.11/genpkgmetadata.py	2012-04-10 17:14:22.290648886 +0300
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python -t
++#! /usr/bin/env python
+ # primary functions and glue for generating the repository metadata
+ #
+ 
+Index: createrepo-0.4.11/modifyrepo.py
+===================================================================
+--- createrepo-0.4.11.orig/modifyrepo.py	2012-04-10 17:14:09.106649272 +0300
++++ createrepo-0.4.11/modifyrepo.py	2012-04-10 17:14:27.818648725 +0300
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#! /usr/bin/env python
+ # $Id$
+ #
+ # This tools is used to insert arbitrary metadata into an RPM repository.
+Index: createrepo-0.4.11/dumpMetadata.py
+===================================================================
+--- createrepo-0.4.11.orig/dumpMetadata.py	2012-04-10 17:19:23.874640068 +0300
++++ createrepo-0.4.11/dumpMetadata.py	2012-04-10 17:19:34.502639756 +0300
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python -t
++#! /usr/bin/env python
+ # base classes and functions for dumping out package Metadata
+ #
+ # This program is free software; you can redistribute it and/or modify
+Index: createrepo-0.4.11/readMetadata.py
+===================================================================
+--- createrepo-0.4.11.orig/readMetadata.py	2012-04-10 17:19:19.626640193 +0300
++++ createrepo-0.4.11/readMetadata.py	2012-04-10 17:19:40.198639590 +0300
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python -t
++#! /usr/bin/env python
+ 
+ # This program is free software; you can redistribute it and/or modify
+ # it under the terms of the GNU General Public License as published by
diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
index ba1d04b..989a745 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
@@ -4,10 +4,11 @@ HOMEPAGE = "http://createrepo.baseurl.org/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI= "http://createrepo.baseurl.org/download/${BP}.tar.gz \
           file://fix-native-install.patch \
+          file://python-scripts-should-use-interpreter-from-env.patch \
          "
 
 SRC_URI[md5sum] = "3e9ccf4abcffe3f49af078c83611eda2"
-- 
1.7.5.4



