Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7863691478
	for <openembedded-core@openembedded.org>;
	Wed, 22 Jan 2020 05:48:25 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id b22so2447441pls.12
	for <openembedded-core@openembedded.org>;
	Tue, 21 Jan 2020 21:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=j86AAg2lwO05erH5r2iU/MpndcQ6k+aDJ9M/vj3jxv0=;
	b=uHaxoMsnXxUfcuPr3vDeMBT2n6fyYOd1oSCGWLyX0Pk9TokCS85FnJrYTzQm10NIPl
	s4LXrqCYzKMCbyU+zSShH+pHLLALUWgqIXnGpt1Esk3qqvFcooLS1NXHFuI4DgHHPTxO
	NJlPBCardE1mBMlrxhlIk1gXj7w8rXvWXavPXmVg2w3+S8Wiyz67kWqn0LLje3xxR9Xd
	OLYz/Hd8dPp/DfqAa1Db9//Pxy5syveizhbiBrcJCIk4z5YtFgecpBEYWbTpYlDpoOG2
	hcvajiUvG59JzuU9UC5xjYnJ29sCVdkro6C/SpHjqQXyaIwVG78IVmX9Pdn6VhQQevCd
	9LKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=j86AAg2lwO05erH5r2iU/MpndcQ6k+aDJ9M/vj3jxv0=;
	b=nVwvGhIzT5FMaSeFq0OgwnxdZrrxL90jZ/wa5Q7Ee/WetqAZmcdhZKPX2AggMT9kwS
	k6uAXfet4R1YhpOsY7DVhk7ZAByc31wqQtFKoWf3WCDGVzI6SqR5q0N+2DLHFqYdW4+N
	SU7RDgS4RQdAoNc3nkANb6LzIkcDhf4P9N4ThPW1EZ/ME59w3W81cHJ0HBW5SVi0ojA7
	Z4tSQoVGF8NCWQRLrj/8uuiXvOWCUpS2RGa9Xp4mxhokCCoxrsBx8XGAP0ESnEMqvNci
	UFFJiVL6X/mwPAi3xHUkUvRnvnmzzU5ZN/Ss2nfHD8dFTNiwQxb+wMw6nFd98zxaPWFb
	Sv0g==
X-Gm-Message-State: APjAAAVqLWi/jT69fpyY83X8czvA/Z479A8+CeoGskkeaON89hdgDQDt
	udSZjEsV1TL0CfDF1FpYu1wllDCg
X-Google-Smtp-Source: APXvYqxSo1dEPgtCK6SUcLzwpJCAhnUK/zqIcDsMsAuHGEMjTZ5dcTuxuC2sjl0pj+u2j55uzVcrjg==
X-Received: by 2002:a17:902:45:: with SMTP id 63mr9323928pla.109.1579672106505;
	Tue, 21 Jan 2020 21:48:26 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:682c:76b9:6d8a:bbd2])
	by smtp.gmail.com with ESMTPSA id p18sm1413247pjo.3.2020.01.21.21.48.25
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 21:48:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 21 Jan 2020 21:48:14 -0800
Message-Id: <766b57a1f9030429b546276a537fbce3a175cc25.1579672034.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579672034.git.akuster808@gmail.com>
References: <cover.1579672034.git.akuster808@gmail.com>
Subject: [zeus 09/11] sstatesig: Test cross/native hashserv method extension
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
X-List-Received-Date: Wed, 22 Jan 2020 05:48:25 -0000

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


