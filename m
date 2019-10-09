Return-Path: <andrei@gherzan.ro>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 317317F2B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 17:06:33 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id o18so3883633wrv.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2019 10:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SGNPyIcaaSZ5O2yMJxPQjfDwQ5XYuIGT4gsRdk11e94=;
	b=cCLDcHZ2/6aJFSWjsl03+HGSm6z6D1g4dAYJPiiZu/V9hE6MBe0he48rCCTr7JNcAu
	Qv8UuKaoUyTl5FtMctySuseiIre/GcT3GCyBc0ioI51xfQ4rYGBlLUs2Gbh11Ob5h1DM
	Y/uGGBMS8fuJbw/NeUEqZcajdJpEY8KO6KhzR6l6emT6uKbG363KFTUJxk/GoNgsEHax
	9Ck2DvXgVGdJutUrWHuiOFUtWE4S4dWQBxdw2dqtP2aaEL6YzY4sMrWUKdVsS2fFuO1y
	RNeSKCoSPzGIEOJzEQd8eNqAZLkDBGYRO5EZEnAMvUyDkXvLR9t2DScZ4D82M8Upxso1
	Kt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SGNPyIcaaSZ5O2yMJxPQjfDwQ5XYuIGT4gsRdk11e94=;
	b=uR8YZRlRQ+UwZPdScC9G8z+TsLzOMNpjcUat5d5kk0spUrVZFZd2WFBwzRr8xz16q9
	kG9pIb6oDd/lLaPDeeQWOrXQnX2vrDoH/l2NdwwxBXY9T5pI0r4DAKoeZGGyo1Fn7P2A
	v306qzpN2XHQUUOjo7LevkZfMcC3VRudQTPS66ygUWPNytM//1AHJlykjhOXsd7FwaWs
	7LawWkKFxdmx/0kraflSi37HnBbG7eXnWw4u57fj6UQhwqPAWuI299C0V84uZTaBJQ2c
	4UGKJeQRecCPs2t4tP8CF512q3+NUx2Buhc7ezQh1xspV4dSYXCpnugAH1t+DIS64dMA
	Kp+g==
X-Gm-Message-State: APjAAAWXS3XTd+lsVjEJk1SQEmJbodEwwwCAo+coIU1i/1gqLQJFxVkC
	F2XOi5dRkoAsHS9+SZ3PYb2mcwR/boE=
X-Google-Smtp-Source: APXvYqwwrzJyr93GDOwluhMwOmF83/c9ro79oPWraAMHgKTg4X5GB3KnybgXKEu9r4PY2bqj5YzAQg==
X-Received: by 2002:a05:6000:12cd:: with SMTP id
	l13mr3781708wrx.344.1570640794300; 
	Wed, 09 Oct 2019 10:06:34 -0700 (PDT)
Received: from beast.hanover.local ([81.145.148.228])
	by smtp.gmail.com with ESMTPSA id
	j18sm2885835wrs.85.2019.10.09.10.06.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 10:06:33 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Oct 2019 18:05:42 +0100
Message-Id: <20191009170543.74807-1-andrei@gherzan.ro>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/2] metadata_scm.bbclass: Add git human readable ref function
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
X-List-Received-Date: Wed, 09 Oct 2019 17:06:34 -0000
Content-Transfer-Encoding: 8bit

This function finds the most recent tag reachable from the current
commit and computes a nice reference. In order to avoid code
duplication, I generalized the branch and revision functions as well
(base_get_metadata_git_branch, base_get_metadata_git_revision).

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/metadata_scm.bbclass | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 58bb4c555a..1fe4b55dca 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -23,20 +23,19 @@ def base_get_metadata_svn_revision(path, d):
         pass
     return revision
 
-def base_get_metadata_git_branch(path, d):
+def base_get_metadata_git(path, cmd, d):
     import bb.process
-
     try:
-        rev, _ = bb.process.run('git rev-parse --abbrev-ref HEAD', cwd=path)
+        rev, _ = bb.process.run(cmd, cwd=path)
     except bb.process.ExecutionError:
         rev = '<unknown>'
     return rev.strip()
 
+def base_get_metadata_git_branch(path, d):
+    return base_get_metadata_git(path, 'git rev-parse --abbrev-ref HEAD', d)
+
 def base_get_metadata_git_revision(path, d):
-    import bb.process
+    return base_get_metadata_git(path, 'git rev-parse HEAD', d)
 
-    try:
-        rev, _ = bb.process.run('git rev-parse HEAD', cwd=path)
-    except bb.process.ExecutionError:
-        rev = '<unknown>'
-    return rev.strip()
+def base_get_metadata_git_describe(path, d):
+    return base_get_metadata_git(path, 'git describe --tags', d)
-- 
2.23.0


