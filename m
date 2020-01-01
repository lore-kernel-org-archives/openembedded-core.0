Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8A98E7FACA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jan 2020 11:05:47 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w15so24196655wru.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jan 2020 03:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=TPFGBJL9UVyQUeZnAmv+qFseyQw63sBICZeV4sjLpuU=;
	b=M52qjZDYhUDutKUphjIhvsNiyCererw55fn6fmuJJLDyo/hcuD3OSRACzOf4d8fESb
	soXS0KzmtxD+SlayTHh0BIRxtbUqYnSwLEl54Eu4mEkL68ufKlCbZ1WHa48pg0tx/8nR
	xOC28UptN+JoTxlAY30hA839TUamNqaR2u+1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TPFGBJL9UVyQUeZnAmv+qFseyQw63sBICZeV4sjLpuU=;
	b=S5mANbArkVaxSF8jSlX5ju3BWxF/jzLf5vnqqFN5u7Ou3h9Mepctw9wfWVFAWwlUf1
	vHFky45RtdEAPnyDnwbSt66+HSeH+BCG3h0kMDcJQIfwlPDGyKMOxa6blhoyBkdy6gI/
	A5z2j6sUUUXa4VVaZOrAnr5MSZYO4/RdQed2+3XR/YfV+jQpNAj392CZB7yI1NgHEpQL
	5e39nPA1QUi0hr2OZh89ZOorar3QdOZYOOpRcyck61fqXXE22NBg8OjsM+KkXIUL/YHm
	c45zqxCJlCpoYsMRI/et5lU74sCgR/aaVxwk1bUw/JyaSMlzl/6sZzxi7YiZWVxEQdbF
	/nUg==
X-Gm-Message-State: APjAAAUDzWPFU6UkbjHcCg5OU/BKVpXAc5AkSxPXQCZ835TZu4Sp02PZ
	onEyTeXwpfAvBnNYpXiPuGNal0m2CuE=
X-Google-Smtp-Source: APXvYqzQCaPUnVU8M8v90rb4zZad9UDTa3L/1OEO1CgFgbgpsVqAFDqG9RP3xVd6zyxDDM68/+x+Xg==
X-Received: by 2002:adf:f6c1:: with SMTP id y1mr82606881wrp.17.1577876748077; 
	Wed, 01 Jan 2020 03:05:48 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o129sm5245534wmb.1.2020.01.01.03.05.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 01 Jan 2020 03:05:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jan 2020 11:05:45 +0000
Message-Id: <20200101110545.12635-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200101110545.12635-1-richard.purdie@linuxfoundation.org>
References: <20200101110545.12635-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] sstatesig: Fix locked signature handling with unihashes
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

get_taskhash will call get_unihash internally in the parent class. We
need to disable our filter of it whilst this runs else incorrect hashes
can be calculated.

This is believed to be causing the locked signatures test to fail under
some circumstances (depending on whether earlier hashes are being
remapped).

[YOCTO #13605]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index ca3c6dfeaa1..acccf9377fb 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -104,6 +104,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
                                 "").split()
         self.unlockedrecipes = { k: "" for k in self.unlockedrecipes }
         self.buildarch = data.getVar('BUILD_ARCH')
+        self._internal = False
         pass
 
     def tasks_resolved(self, virtmap, virtpnmap, dataCache):
@@ -156,7 +157,12 @@ class SignatureGeneratorOEBasicHashMixIn(object):
             else:
                 return super().get_taskhash(tid, deps, dataCache)
 
+        # get_taskhash will call get_unihash internally in the parent class, we 
+        # need to disable our filter of it whilst this runs else
+        # incorrect hashes can be calculated.
+        self._internal = True
         h = super().get_taskhash(tid, deps, dataCache)
+        self._internal = False
 
         (mc, _, task, fn) = bb.runqueue.split_tid_mcfn(tid)
 
@@ -199,7 +205,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         return h
 
     def get_unihash(self, tid):
-        if tid in self.lockedhashes and self.lockedhashes[tid]:
+        if tid in self.lockedhashes and self.lockedhashes[tid] and not self._internal:
             return self.lockedhashes[tid]
         return super().get_unihash(tid)
 
-- 
2.20.1


