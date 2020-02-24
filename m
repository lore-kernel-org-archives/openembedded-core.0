Return-Path: <pbarker@konsulko.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 937F960685
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 20:14:42 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a9so681290wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 12:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/hGATcWZvAQmQo03ab64kjbFTuuH8pPUdL1YuHK4CpU=;
	b=rIBBW78krmaUgRCgKcPhI1J8saKpCHd6GMuWKM1UV6iQujhzMYt+MNHttWjtz56wtD
	zmo22rE5Mir3RLxT51JPX5ktaRO5xod+w54YGBUCKdQ8gz+CsF9RBGlaafFw9XMZOaCh
	tl4ByB32h1kNd01MDnfN4L+oppVRE6EFOZvNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/hGATcWZvAQmQo03ab64kjbFTuuH8pPUdL1YuHK4CpU=;
	b=YnST1ewbbf0yvKhIQC0JbwdJxHmdKmi620YOcGgz/Oypa3NdTm2o/vh96jFAbFbrB4
	SPrLXmruMtdks/FaiEJGLipAtFHEilaFute3Z29pKCc3npldg1Rmw3YiIv4Pta9pOUD1
	G5CxDOyF3aHmmrOg0qwzrlD52oM9PzvrmXkHxWIjiBrKwXih8AOdzS7a9qi6Qmr6Vhy0
	aQ1YJwDAkKv3ANrEWMg77T+074+gr0rBZLLNGyKH4+hHSTpO2TArqAJyMQXzVnDYHQr7
	P2w6zm8MXfAYRLZv3NG34kx8lTEgZe/NtghY7RW/3l80JeW8Ncb0gxJdgu/NEkp8+evF
	aLtg==
X-Gm-Message-State: APjAAAWsuCcibpaxH0e+JyYybR1Tch/m9qfxkHrRMpgVG4cNG+K+ZDwF
	jSiU5UwtvEAhNuwkLw5uoJkSgvJ/Wxx3fw==
X-Google-Smtp-Source: APXvYqzL8kVpQER8BIjV/kk78zWQHupsVCAc9exh+WstTFPSUmnb14aJ5z0Ed6rcg9Lda2u0B1Ohwg==
X-Received: by 2002:a7b:cd92:: with SMTP id y18mr714205wmj.133.1582575282940; 
	Mon, 24 Feb 2020 12:14:42 -0800 (PST)
Received: from ub1910.Hitronhub.home ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id
	y6sm19965637wrl.17.2020.02.24.12.14.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 12:14:42 -0800 (PST)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2020 20:14:01 +0000
Message-Id: <20200224201401.13720-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] fetch2/gitsm: Unpack shallow mirror tarballs
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
X-List-Received-Date: Mon, 24 Feb 2020 20:14:42 -0000
Content-Transfer-Encoding: 8bit

When a shallow mirror tarball is used to satisfy a gitsm URI it needs to
be unpacked so that the .gitmodules file can be examined.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 lib/bb/fetch2/gitsm.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/bb/fetch2/gitsm.py b/lib/bb/fetch2/gitsm.py
index aa121cbe..98f5dae5 100644
--- a/lib/bb/fetch2/gitsm.py
+++ b/lib/bb/fetch2/gitsm.py
@@ -169,6 +169,12 @@ class GitSM(Git):
                 raise
 
         Git.download(self, ud, d)
+
+        # If we're using a shallow mirror tarball it needs to be unpacked so
+        # that we can examine the .gitmodules file
+        if ud.shallow and os.path.exists(ud.fullshallow) and Git.need_update(self, ud, d):
+            bb.utils.mkdirhier(ud.clonedir)
+            runfetchcmd("tar -xzf %s" % ud.fullshallow, d, workdir=ud.clonedir)
         self.process_submodules(ud, ud.clonedir, download_submodule, d)
 
     def unpack(self, ud, destdir, d):
-- 
2.20.1


