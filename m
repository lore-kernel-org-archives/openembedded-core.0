Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id B63337FACA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jan 2020 11:05:46 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w15so24196624wru.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jan 2020 03:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8n1lcF9Iq3jCE8Y5tT0Ylkq08zAJZX19qWu8QMyrh5k=;
	b=X6Jbb8WQ0Xa1zr61IWbqkJtNlRYSphncvuoE7Yrt4YnQlwFbOwejPaFe4Dk85ak344
	SKGMHR2H27rzoLEoL6Cq226RdaEiE6Zxfvgx0rxBltwzSiuiCL9ixspedjTz8aj9P0tY
	zJVI6o73wwUHMSDJHD5MjDbrvcl+qcllWQxfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8n1lcF9Iq3jCE8Y5tT0Ylkq08zAJZX19qWu8QMyrh5k=;
	b=trRrz0OafPttidJSvKVbL4cZW/hyoGXouw+jVQB9POlrbV29Bv9R4szf8U1xDf8T/x
	Nz0lPljQP1f7w3HZsxuTLo2bwiPiVGkiZj6AvxN5VHUyXjIEHXkcfEURqEL79TnKkD+S
	+qyYw8OM4mlpBtWufAvY06DtF5CJjt6loGMJ3ynql/7PPXGEcA7hFVyR1Cydbh1C/WGq
	uShNt27tmnbg97JGSvvTFR0oln5R1NRSe0wJpW6g5uFNH7HVhraw5KFHI+X1SRuBw0Vd
	UmPh7cPgqxEOiUtMBNQoTrzmg2hi/5b6+20SxlZWoU/qXbg662xyD9bWtIvABlWKyjQK
	mkWA==
X-Gm-Message-State: APjAAAWHXEYJ53BbRsASb/IaZjvNQqhD6zQsL/iwPgpwmOZ12isbL825
	7a5top1vJgtV4dClJyFL8/vyfucaEpU=
X-Google-Smtp-Source: APXvYqw4cz+KiQ5Dh8np2kB6QJSNq2V58o+RRExv9ggEo+nOjs4lijsnrzMElShjreNBujkqWNRZFw==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr33741879wru.235.1577876747243; 
	Wed, 01 Jan 2020 03:05:47 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o129sm5245534wmb.1.2020.01.01.03.05.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 01 Jan 2020 03:05:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jan 2020 11:05:44 +0000
Message-Id: <20200101110545.12635-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] sstatesig: Test cross/native hashserv method extension
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
X-List-Received-Date: Wed, 01 Jan 2020 11:05:47 -0000
Content-Transfer-Encoding: 8bit

We can have one taskhash which represents multiple native/cross sstate objects
since they're stored by BUILD_ARCH or possibly host distro (or host gcc version).
We need to put these into separate namespaces on hashserv since their outhashes
will never match and we need deterministic lookups for the different namespaces.

Use this extramethod option to handle this. This fixes several problematic
failures on the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 7cecb59d8e8..ca3c6dfeaa1 100644
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
         if tid in self.lockedhashes:
             if self.lockedhashes[tid]:
-- 
2.20.1


