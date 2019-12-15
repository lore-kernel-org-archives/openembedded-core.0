Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id F20B16B06C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 09:07:12 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id p9so3329311wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 01:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QeKQADxINRnkgVZ5Mhk8sAoFdFvKae+4kV5VsvaE6h4=;
	b=ak9qUIaouqHHNzICwE8atTfJrSK1pH+x2UEYdsmK19/MccyOZcGlqzcnq4ZLQC4xQU
	203q4KdN634A/mYS658glCsJX4uk3gdaAPiTExo8xjg+QyuOdJfvI+DK1Bq4Im2h55B6
	6NotN5ZZDbWNf32OYhGeHh8H4+DDcqJYSPmRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QeKQADxINRnkgVZ5Mhk8sAoFdFvKae+4kV5VsvaE6h4=;
	b=C/OXm8OPw5uj9tGCbhPivDjy45UbBBDdpebfmJDWbmj5TE8Bj5ShZ1aYXGELQY2S8L
	YS9YcVku3KYjCgmXgAPZzY21ROKEOJLmuKmcHhuE3FbU4FuG+IuwluNC/+WGA/pS3FXJ
	t2fn5aS7575iNk3CsThr/rq1PKCNIWF/MPHXGVVJwysFS3T8VtfVgbrNMdari//okhgn
	R3P5iNri97owYZjfbMTcLmIkxkdPKV/TpXjBKYQq1bX3xB4psQQ8LcgB5qUXejmSjXca
	maa8VWwAu9kN35MV91WX9vFEPabJhZCWV1UWNF3Yq/Sj2/Sp+LhF56VZBXnnB7381/yh
	5uKw==
X-Gm-Message-State: APjAAAVKwM1pJ9Vg1YIWXgsb+pK6zNcHy6HlzciFROgk6ZTHJtG8vZSy
	9gdRJBf3cBXuNjX5gjYwYZHnWVbnrDk=
X-Google-Smtp-Source: APXvYqynSgcQIREzd/fULcP8IHM6fEL/t+sErY+jjxE66tzfCC9TJ+TOjtaudrKEnj1tYOXXgj4daA==
X-Received: by 2002:a05:600c:2050:: with SMTP id
	p16mr20053450wmg.176.1576400833128; 
	Sun, 15 Dec 2019 01:07:13 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u8sm16684434wmm.15.2019.12.15.01.07.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 01:07:12 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Dec 2019 09:07:10 +0000
Message-Id: <20191215090711.25182-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] sstatesig: Optimise get_taskhash for hashequiv
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
X-List-Received-Date: Sun, 15 Dec 2019 09:07:13 -0000
Content-Transfer-Encoding: 8bit

With hashequiv the get_taskhash function is called much more regularly
and contains expensive operations. This these don't change based upon
hash in a given build, improve the caching within the function to
reduce overhead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index c566ce5a0cb..8d009bfdc6e 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -142,6 +142,13 @@ class SignatureGeneratorOEBasicHashMixIn(object):
 
     def get_taskhash(self, tid, deps, dataCache):
         h = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskhash(tid, deps, dataCache)
+        if tid in self.lockedhashes:
+            if self.lockedhashes[tid]:
+                return self.lockedhashes[tid]
+            else:
+                return h
+
+        h = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskhash(tid, deps, dataCache)
 
         (mc, _, task, fn) = bb.runqueue.split_tid_mcfn(tid)
 
@@ -178,17 +185,19 @@ class SignatureGeneratorOEBasicHashMixIn(object):
                                           % (recipename, task, h, h_locked, var))
 
                 return h_locked
+
+        self.lockedhashes[tid] = False
         #bb.warn("%s %s %s" % (recipename, task, h))
         return h
 
     def get_unihash(self, tid):
-        if tid in self.lockedhashes:
+        if tid in self.lockedhashes and self.lockedhashes[tid]:
             return self.lockedhashes[tid]
         return super().get_unihash(tid)
 
     def dump_sigtask(self, fn, task, stampbase, runtime):
         tid = fn + ":" + task
-        if tid in self.lockedhashes:
+        if tid in self.lockedhashes and self.lockedhashes[tid]:
             return
         super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigtask(fn, task, stampbase, runtime)
 
-- 
2.20.1


