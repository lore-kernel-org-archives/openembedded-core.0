Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 930237F281
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 12:21:19 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p7so6368367wmp.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 05:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WikUtWBprnICfbT0ttizCUqbrpvKvbs2SONXb55MiIE=;
	b=J02M/1r4S5zMHcrwGR6arlfxOb267CqKvrQIo8n30ADYRRxfBw8jVHzoqfLL9yAur2
	2O5Vorc1jmYOfz/QOwmLa7ngDAQM9SrjwBffOWBYyf+Fon9ud2iCtWGLteKA6YIm6MFj
	XEhHxvqrS96VIs66pj03w5bTfe9M6Tz0m03kQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WikUtWBprnICfbT0ttizCUqbrpvKvbs2SONXb55MiIE=;
	b=gST5kBhRfJToVMDI5Y65hmpmspejMFei7y/0rQglI7mVMLdZwPCI6uVnVjCf+D3GAK
	NNa5OD1U+XzwUxGD5Iduxoe1TuOGdI2Eh1aL71mMEmTt0zbxOH4uKXZAUk5IbSeUd3JL
	oxqR56U5utnzk7svFg6ryHqiwHY/x8m4CxhYtxhbDe1mWFwlx7qwCaVOoWwJNSrEbR1u
	p94QukghKuirnZrduNzP33JCfSRQrc5Bw2e/F1udMIpnBnFEOhsKZGaRlAQ6ogVMRO7l
	vzmBTsmfPscenE3cfb+TEg0bCrv2wbA8c5eysP+uILp0M7UHJ9FCOxmOWDdD2Cp32as5
	fYZA==
X-Gm-Message-State: APjAAAWajdO8uA04d5DKH73TAmk1AWKvYiRlXVFkjxe8cOdQRho8SgsO
	PIoNgmUyrcdF7DlH15M0YS74wmFTtQw=
X-Google-Smtp-Source: APXvYqzcaWTILg+1IEUOXglAs2AGVoPEU0gsRtxD+hHPoJr9gsOAjsDdlwSH5Rsm42ZGTmVUj4FRPA==
X-Received: by 2002:a05:600c:2153:: with SMTP id
	v19mr7153337wml.146.1569586879863; 
	Fri, 27 Sep 2019 05:21:19 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d9sm3973609wrf.62.2019.09.27.05.21.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 05:21:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2019 13:21:14 +0100
Message-Id: <20190927122117.19023-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/4] sstatesig: Fix hash equivlanency locked signature issues
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
X-List-Received-Date: Fri, 27 Sep 2019 12:21:19 -0000
Content-Transfer-Encoding: 8bit

Using locked signatures with the hash equivalency server ran into
problems. We need to:

a) Ensure the lockedhashes data object is passed from the core to
   any individual tasks using the get/set_taskdata methods

b) Return a locked singature instead of a unihash

c) Write the unihash being used to locked signature lists rather than
   the calculated taskhash

d) Skip warnings of hash mismatch if the hash is a unihash

These changes fix esdk builds (which use locked sigs) when a hash equivalence
server is in use.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 50d80bf51a1..43eb6034e6a 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -130,10 +130,10 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
 
     def get_taskdata(self):
         data = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskdata()
-        return (data, self.lockedpnmap, self.lockedhashfn)
+        return (data, self.lockedpnmap, self.lockedhashfn, self.lockedhashes)
 
     def set_taskdata(self, data):
-        coredata, self.lockedpnmap, self.lockedhashfn = data
+        coredata, self.lockedpnmap, self.lockedhashfn, self.lockedhashes = data
         super(bb.siggen.SignatureGeneratorBasicHash, self).set_taskdata(coredata)
 
     def dump_sigs(self, dataCache, options):
@@ -171,10 +171,11 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
                 h_locked = self.lockedsigs[recipename][task][0]
                 var = self.lockedsigs[recipename][task][1]
                 self.lockedhashes[tid] = h_locked
+                unihash = super().get_unihash(tid)
                 self.taskhash[tid] = h_locked
                 #bb.warn("Using %s %s %s" % (recipename, task, h))
 
-                if h != h_locked:
+                if h != h_locked and h_locked != unihash:
                     self.mismatch_msgs.append('The %s:%s sig is computed to be %s, but the sig is locked to %s in %s'
                                           % (recipename, task, h, h_locked, var))
 
@@ -182,6 +183,11 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         #bb.warn("%s %s %s" % (recipename, task, h))
         return h
 
+    def get_unihash(self, tid):
+        if tid in self.lockedhashes:
+            return self.lockedhashes[tid]
+        return super().get_unihash(tid)
+
     def dump_sigtask(self, fn, task, stampbase, runtime):
         tid = fn + ":" + task
         if tid in self.lockedhashes:
@@ -211,7 +217,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
                     (_, _, task, fn) = bb.runqueue.split_tid_mcfn(tid)
                     if tid not in self.taskhash:
                         continue
-                    f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.taskhash[tid] + " \\\n")
+                    f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.get_unihash(tid) + " \\\n")
                 f.write('    "\n')
             f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(l)))
 
-- 
2.20.1


