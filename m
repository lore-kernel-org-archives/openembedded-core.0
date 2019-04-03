Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6980C7D2EE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 05:37:23 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g12so7445533pll.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 22:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=RJmSv4NbQ6QkVqN8LzxpjaYFp6SBW3U3awhU2uhJgGU=;
	b=DpE5LEmvW8FiZHY4GzsjX4UQc2cjZkmOYXPl1KFVhu87xzub6y6Y9gPRoZ9w30E1C/
	nFRk16AJWo0qX7neSAigXcVcx9NkDP0bAZ//N+suiWEC7rW0bBZztOvjXBRw78Ju9U6n
	/UgHYESgJL79rtWre8puaOn+JFtbQIWnLgn/ASk8/WxGPGTQD4GWhfaPehYQ6IWWtO0u
	AzqeDuM6frzGbFbn2vg2lZY82g0uS3li5nwGxHqJHxNZU+Sr9XxYoZOta/dIMUB/yNte
	Do52q2kscFZIe4YbEuJsYKzSKbawZjXhks3PK6bzbyhLDzfSxCoT7409SNpLLzAaRrjb
	6/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=RJmSv4NbQ6QkVqN8LzxpjaYFp6SBW3U3awhU2uhJgGU=;
	b=QiagNWSktqE9Ux9Apkr1sYqutJX1TmO6DvR7DrQA44gU0zd8aMSSFwdYdCg9pOG3YZ
	XuIDPUlvJo969MNzleYCuLuC32ufO6ItjBUX+BtKt8qnWT+SYz6AO8MR/XZkNbozOioW
	BURm0Tfzvew9abkcLOC0GXljHSmY9mLvKvMVZyLLC9JOhSMhuL3Vdoh9D4k5m2bpyeYH
	Dh6ZtS82zvOeOqOp+pXOme3ZAN3YnMIQA/Cb0xGU2Zvj30WLpc1aDqMJAmmkKf0iH5yz
	4qtzUFpfNBBspjxbeR8VrMRVXtXurHS0pD9i4K4SxVtOH9gwFxY9blIaAqh4HxNhs1iI
	g/Tg==
X-Gm-Message-State: APjAAAVE/wN2oaTFpF1A4CrV8VMlm7mBiSCHe+KtW7lS1LG1BCboNyd1
	zxYd5dvE67hoDAVtqDOA8skUNHcijco=
X-Google-Smtp-Source: APXvYqy6SGQ3fTSMuDZ6iXguFa9KPp88jhYMP4P90oGe3y3u3n230Tmr4WMxuTYsvWxzVLODy+qTkg==
X-Received: by 2002:a17:902:2a2a:: with SMTP id
	i39mr33709665plb.211.1554269844009; 
	Tue, 02 Apr 2019 22:37:24 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.73.181])
	by smtp.gmail.com with UTF8SMTPSA id
	b63sm39825958pfj.54.2019.04.02.22.37.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Apr 2019 22:37:23 -0700 (PDT)
Date: Wed, 03 Apr 2019 05:37:02 +0000
Message-Id: <20190403053702.10672-3-nathan@nathanrossi.com>
In-Reply-To: <20190403053702.10672-1-nathan@nathanrossi.com>
References: <20190403053702.10672-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 3/3] devtool: standard: Handle exporting generated config fragments
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
X-List-Received-Date: Wed, 03 Apr 2019 05:37:23 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The cml1 and ccmake bbclasses generate configuration fragment source
files that must be exported from the WORKDIR as a source file to be
preserved across builds. This change adds detection of the current
recipes inherited classes and for cml1 and ccmake classes checks for the
specific generated configuration fragment files. These files are then
exported by devtool and included as SRC_URI files from within the target
layer.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
- None
---
 scripts/lib/devtool/standard.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ea09bbff31..0a1e329e61 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1328,6 +1328,20 @@ def _export_local_files(srctree, rd, destdir, srctreebase):
                 if os.path.exists(os.path.join(local_files_dir, fragment_fn)):
                     os.unlink(os.path.join(local_files_dir, fragment_fn))
 
+    # Special handling for cml1, ccmake, etc bbclasses that generated
+    # configuration fragment files that are consumed as source files
+    for frag_class, frag_name in [("cml1", "fragment.cfg"), ("ccmake", "site-file.cmake")]:
+        if bb.data.inherits_class(frag_class, rd):
+            srcpath = os.path.join(rd.getVar('WORKDIR'), frag_name)
+            if os.path.exists(srcpath):
+                if frag_name not in new_set:
+                    new_set.append(frag_name)
+                # copy fragment into destdir
+                shutil.copy2(srcpath, destdir)
+                # copy fragment into local files if exists
+                if os.path.isdir(local_files_dir):
+                    shutil.copy2(srcpath, local_files_dir)
+
     if new_set is not None:
         for fname in new_set:
             if fname in existing_files:
---
2.20.1

