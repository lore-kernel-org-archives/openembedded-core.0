Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB577D19C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 08:22:07 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id v12so6188851pgq.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 01:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=cJIqyybd6eAdoENDZ2DqGLxhJJK4uYO25pS8cruhgSk=;
	b=EMcPFryemqer0tQ45gv3GkB1kjF37c/DrsSCmagP4fvpKX88+FVvvkruPE7cY+NFex
	+Kn26qWSlIr6vu4j/iafZpVoOLAvOYU2C5NpcoG1uELvL3at70vjbwwEvzhPUVPqJU1W
	Fg1htEJuNRMZb6ZZEoSFrscJAKvCOFGQ3iMOJW5uACgkMgb3u2Xtpmv9RiHHu55Ih/25
	6jSwb3ZxIS1g/Lzdri4nLGN5YavS6B9B1Q9rZ2pbsNA8SUktC3zvKjpVk8GYWnWXDREA
	WjC3nB/+WpX+6Zmx4kzCPhQU3C0s1OxY20XP8fB8Ti3Z3aor+luLJ3D9/nad7sWgmB2l
	xXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=cJIqyybd6eAdoENDZ2DqGLxhJJK4uYO25pS8cruhgSk=;
	b=eNLidObbyMtQ0PN9tkNEgbBwLI6tBycLL4kbpjZlCfo/46detkVuxC4VfuSJMCqTrW
	OGUgQXTcW8xceWJbSzsfEkT3A2cEVA/xsZg36I1A7MsD/4MZWjEvWXZ+cVGpD3WBVL9h
	gb4OiQBAu2f6lrDex9w8DpzeHeteL7S0EnjF9gsbUSbDGlGWhShAdn3eMMGw6ZZEZDPz
	tT0NTUCLn3ZlzvG6jO0DR+CrKZUj4Q9mlERNieaEdbOHIxIY1d677Fm9UT1NZClex19y
	tYmOHTb3cE9AVE48wP1xi/Dmqifu8HodfTYqeQO1DLH7MIp4Ul52SpPsg+0oq5wSC/Ca
	io8A==
X-Gm-Message-State: APjAAAVJPcjALd2U57RM5G1lBAOL8FM9xlDUKjVdEN3nM1XiVjja8n9Y
	GBZEirD/ahJGXgK1Gc1rV7Gp80rb9Ds=
X-Google-Smtp-Source: APXvYqxe36PLo/mFdrAGOTbI8Sou1qav7IZ3YWvjv34DTg7StzCB0S6pd0JY/lGZyMwgzihUG67YUg==
X-Received: by 2002:a63:cc0a:: with SMTP id x10mr52823597pgf.179.1554193328403;
	Tue, 02 Apr 2019 01:22:08 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.73.181])
	by smtp.gmail.com with UTF8SMTPSA id
	g73sm24981968pfd.185.2019.04.02.01.22.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Apr 2019 01:22:07 -0700 (PDT)
Date: Tue, 02 Apr 2019 08:21:53 +0000
Message-Id: <20190402082153.3630-3-nathan@nathanrossi.com>
In-Reply-To: <20190402082153.3630-1-nathan@nathanrossi.com>
References: <20190402082153.3630-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 3/3] devtool: standard: Handle exporting generated config fragments
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
X-List-Received-Date: Tue, 02 Apr 2019 08:22:07 -0000
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

