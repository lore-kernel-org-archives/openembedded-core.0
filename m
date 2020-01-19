Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6D5337FBEB
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 21:37:29 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id x8so14481492pgk.8
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 13:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=j86AAg2lwO05erH5r2iU/MpndcQ6k+aDJ9M/vj3jxv0=;
	b=XySuQsAgiuCQfIIzA2VlE9emOt8s8/gt9vNLkHoYkVH1wHn5QWjoaBqKZuh1TPzGhe
	vdXsFy4RAejRXcoz0cvcRJYHo7iH5toXozZF6bbsQv86INddSblPTF3t7hji7zDFiYWV
	NfscHUZj925N75HI/ns0HVRpMecGV7ztCVf+Uw9xT3tktOU2e7CVHwZNkhWG3eXG/WOs
	IXbJkKlFOl7q1trwX5L5JgpmmcFhnojFugHIxIuKV8xt9ElVWtYR4aLdXITByBS3g0mn
	C2St1KnQLm6jwtE/ZWLBvoxnPUgvqW2mqRzyaWsKdTrKVfAyB3T17DEQrx17XYtIANpx
	UnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=j86AAg2lwO05erH5r2iU/MpndcQ6k+aDJ9M/vj3jxv0=;
	b=FAMCiEHQ4Ev2MXKV5lMyviuPduCsmpUzqi58PZdGwStrGYf+pW9xfpUcryRQ+GivOg
	GtZKTWclSeWNfsl2/FQLD3jqu6wFHRipLYzqaMb/UcBRoTBx1XrUV4YlmRgrWV3Fz4T7
	lLwc153mOObkRFyGO7Rv1UAnlg+cwfwYgASggPWzY7pV17TI/tv/vfX0fzdPaUPM2PeA
	qiQ0zRsHRGiD8wRuWBdjikMHf3BUyjPypHPsNJz8gM+ZZ2DEF1hMLn4PVWsP803sHnOc
	7w3+ABe3lU6kBu05VwJRrPMD4NaX6r6oPH/K0Rdo8xgV7lBWIryyHFDl417/oIPaVot5
	pTfQ==
X-Gm-Message-State: APjAAAWwf463OfJZS6BScKtMdeqYuJpGWPmTzea29KC3fjPbQT5lfKtv
	Q9W5zSrq4iiSJbynu+ilowjOw9zi
X-Google-Smtp-Source: APXvYqw3kcvUPlkeUeeTr6gDv34F87bEX6Cktk+c/AWiU2m7tlhjMrZqKPWNxsHHhaT0RTyGqHHwXw==
X-Received: by 2002:a65:66d7:: with SMTP id c23mr58595797pgw.40.1579469850435; 
	Sun, 19 Jan 2020 13:37:30 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:450d:e003:9142:f492])
	by smtp.gmail.com with ESMTPSA id
	q15sm34912518pgi.55.2020.01.19.13.37.29
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 13:37:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 19 Jan 2020 13:37:22 -0800
Message-Id: <766b57a1f9030429b546276a537fbce3a175cc25.1579469619.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579469619.git.akuster808@gmail.com>
References: <cover.1579469619.git.akuster808@gmail.com>
Subject: [zeus 4/6] sstatesig: Test cross/native hashserv method extension
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
X-List-Received-Date: Sun, 19 Jan 2020 21:37:29 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We can have one taskhash which represents multiple native/cross sstate objects
since they're stored by BUILD_ARCH or possibly host distro (or host gcc version).
We need to put these into separate namespaces on hashserv since their outhashes
will never match and we need deterministic lookups for the different namespaces.

Use this extramethod option to handle this. This fixes several problematic
failures on the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2a76082363d189880613765ad339718e3614049d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/sstatesig.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index c566ce5a0c..24a221eb1a 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -103,6 +103,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         self.unlockedrecipes = (data.getVar("SIGGEN_UNLOCKED_RECIPES") or
                                 "").split()
         self.unlockedrecipes = { k: "" for k in self.unlockedrecipes }
+        self.buildarch = data.getVar('BUILD_ARCH')
         pass
 
     def tasks_resolved(self, virtmap, virtpnmap, dataCache):
@@ -140,6 +141,14 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         self.dump_lockedsigs(sigfile)
         return super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigs(dataCache, options)
 
+    def prep_taskhash(self, tid, deps, dataCache):
+        super().prep_taskhash(tid, deps, dataCache)
+        if hasattr(self, "extramethod"):
+            (_, _, _, fn) = bb.runqueue.split_tid_mcfn(tid)
+            inherits = " ".join(dataCache.inherits[fn])    
+            if inherits.find("/native.bbclass") != -1 or inherits.find("/cross.bbclass") != -1:
+                self.extramethod[tid] = ":" + self.buildarch
+
     def get_taskhash(self, tid, deps, dataCache):
         h = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskhash(tid, deps, dataCache)
 
-- 
2.17.1


