Return-Path: <kergoth@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7B6057852C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:08:35 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id s24-v6so2317464plq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YDIw8j0tANsvJMWgQKYzek2qaSv5xGzW3vxrCGZTQeI=;
	b=iCP735EFbzvVk0gCYclpu1qv4eEaijKZhtWQxn7vbMR52MUE7ferGpZAnsp/Pyhp5A
	2OL8+FZm8Slhjv2hnHl7xjRAU+ovzjTOpwfavysDJI/wGCyzlLLGPAXZOYL0537/1Epj
	zCC0Jcq0IeYZ/I628KuSli9Dle8cVnc4zOyJ2bY9v5jgUkd+4ZQwczV7fEOsFEEBGzCt
	/1ANol4YoBGcE07UymDscR6etDHzFc/C81On7zRJPY6SDdFOiQCdp5knrpFVvA0SPlvR
	PLSbRMdAV8dl/Ji+ivG1zR4TbAsvq6S2wehWG/RTnHjqJJkKzMzXBOw3/dfD5HSlIyTp
	SU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YDIw8j0tANsvJMWgQKYzek2qaSv5xGzW3vxrCGZTQeI=;
	b=j2UQNflXIt0hPa6jtZzhXS3JqpmDRaXObhsMHiE2u62R6bTQDEihyLzeCA/+YxzmLI
	M2KBtMfAhGyJlnAMIE/6pAN1fLZx3dgae+XoGOi0rNdcgrEapEVcMJrzsaaEG01szqyB
	oj2oOCXYRui6bWYFJv/H/hDjQmRSlAJFB67is/vdQSr78xSkaAaCnUOd4lQ0QF6Dw3KU
	q69GYxAxeuKCb5ntjypzMWBWv/f0BE9M0jJVeiJc+aOlidz+s01isemVVf5wAJxSxyR2
	6nAI17Nin1kd01+7Pgl9rs1vfOi1+fpROLXj4/z9/VIwg/XYmTht9Ft0XQxYRZwKA+Bn
	lttQ==
X-Gm-Message-State: APt69E3f3Q4SkRMhj6Bh/JlYTXeJH9myYkumE67WVchLZNq3YTpwuViL
	pClddLymDqsLwOjp04JyLnEf8eEI
X-Google-Smtp-Source: ADUXVKLwnpQ5VN7+EYucCELDb6p6RmTakdlqnv+IWlcKotZzJe+0Xn3xBzWcbBNQ2qNrS+xESyEZ5A==
X-Received: by 2002:a17:902:ba97:: with SMTP id
	k23-v6mr30374481pls.259.1529615316284; 
	Thu, 21 Jun 2018 14:08:36 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	8-v6sm10513508pfk.132.2018.06.21.14.08.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:08:35 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:08:19 +0500
Message-Id: <8841def28aeb1532fc6f50ae4144b2be92a0f7b4.1529603271.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1529603271.git.chris_larson@mentor.com>
References: <cover.1529603271.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/5] oe.path: add which_wild function
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
X-List-Received-Date: Thu, 21 Jun 2018 21:08:35 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is a function much like shutil.which or bb.utils.which, retaining
shutil.which-like function semantics, bb.utils.which's support for
returning available candidates for signatures, and most importantly,
supports wildcards, returning only the first occurrance of each found
pathname in the search path.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/lib/oe/path.py | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 76c58fa7601..be02218c31d 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -259,3 +259,37 @@ def is_path_parent(possible_parent, *paths):
         if not path_abs.startswith(possible_parent_abs):
             return False
     return True
+
+def which_wild(pathname, path=None, mode=os.F_OK, *, reverse=False, candidates=False):
+    """Search a search path for pathname, supporting wildcards.
+
+    Return all paths in the specific search path matching the wildcard pattern
+    in pathname, returning only the first encountered for each file. If
+    candidates is True, information on all potential candidate paths are
+    included.
+    """
+    paths = (path or os.environ.get('PATH', os.defpath)).split(':')
+    if reverse:
+        paths.reverse()
+
+    seen, files = set(), []
+    for index, element in enumerate(paths):
+        if not os.path.isabs(element):
+            element = os.path.abspath(element)
+
+        candidate = os.path.join(element, pathname)
+        globbed = glob.glob(candidate)
+        if globbed:
+            for found_path in sorted(globbed):
+                if not os.access(found_path, mode):
+                    continue
+                rel = os.path.relpath(found_path, element)
+                if rel not in seen:
+                    seen.add(rel)
+                    if candidates:
+                        files.append((found_path, [os.path.join(p, rel) for p in paths[:index+1]]))
+                    else:
+                        files.append(found_path)
+
+    return files
+
-- 
2.11.1


