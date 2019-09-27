Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 677447F281
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 12:21:21 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i18so2466691wru.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4YEfMERerbQy+8vdf/HPVSWzm40Sy0rsdf/rEFyaG38=;
	b=KmGNU2mAV2JNXstFKrD56pb2iVxUMNfC3yeXfxuJB/EilPBiqfWbPflJR2/RL714J6
	CH6ou4+Z6HRgP+lyOAyCfqHUwM1FhSVth2290g+DXOXKfGnQvqidikNOqq10YsJeOr2A
	XnmtsQomQ4UzYH2b5wjm9cCUamfdg3lXAceTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4YEfMERerbQy+8vdf/HPVSWzm40Sy0rsdf/rEFyaG38=;
	b=KEg80GJ/x3rjcI9ebrkMFWkL5GPTmU7qDDF1feUNKL6XO1H+v0X4p1M6p/SeKplNLL
	3ZzJHzy0N3wpD5ZwXxOcXqURxIsa8Cp9bjirTQMPN9ikCYmi7PPN9npQxhoIAre5x6by
	AISRXjMhkzgCWA86xbIbpIYzqU/TzCEkSb/KeBNlSw+TRnUwawjnuNd/jkjS3e9MGwbH
	OG5hM6lPfF2W0YGwd4WKu3UXhFEspzLTADoBNEoAU2hUS/amy4j7W3auAfdNE/6vgrMl
	N2E8nHnN5PAldZJyqSNgg4rstD/7OUXhdVi9mGxJBzgx6CDoDW19JzfwaKiHB425hfcP
	YaeQ==
X-Gm-Message-State: APjAAAXlC3HkOkPf+n3xULD/VDU12fOK6ft8HEIs9hEcisyuYewzzdQH
	RwOGJI5l2/HIPYpfpNXc/pxVIiOzpHw=
X-Google-Smtp-Source: APXvYqxfY8hSHvVdsvDKU/9E0SoKVUWXSxAAXTnDPvnhwUruqe7IzERFuRjHqBZJ1inR2gDxbzsFrw==
X-Received: by 2002:adf:e546:: with SMTP id z6mr2736095wrm.113.1569586881864; 
	Fri, 27 Sep 2019 05:21:21 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d9sm3973609wrf.62.2019.09.27.05.21.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 05:21:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2019 13:21:16 +0100
Message-Id: <20190927122117.19023-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927122117.19023-1-richard.purdie@linuxfoundation.org>
References: <20190927122117.19023-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/4] lib/sstatesig: Fix class inheritance problems
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
X-List-Received-Date: Fri, 27 Sep 2019 12:21:21 -0000
Content-Transfer-Encoding: 8bit

The locked sigs class needs to be inherited after the hashequiv mixin so
that get_unihash can correctly wrap the underlying hashequiv function.

To do this turn the locked sigs class into a second mixin, then the order
can be correctly handled. Tweak the get/set_taskdata to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 43eb6034e6a..c566ce5a0cb 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -90,8 +90,7 @@ class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
     def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
         return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
 
-class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
-    name = "OEBasicHash"
+class SignatureGeneratorOEBasicHashMixIn(object):
     def init_rundepcheck(self, data):
         self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE") or "").split()
         self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS") or "").split()
@@ -129,12 +128,11 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
 
     def get_taskdata(self):
-        data = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskdata()
-        return (data, self.lockedpnmap, self.lockedhashfn, self.lockedhashes)
+        return (self.lockedpnmap, self.lockedhashfn, self.lockedhashes) + super().get_taskdata()
 
     def set_taskdata(self, data):
-        coredata, self.lockedpnmap, self.lockedhashfn, self.lockedhashes = data
-        super(bb.siggen.SignatureGeneratorBasicHash, self).set_taskdata(coredata)
+        self.lockedpnmap, self.lockedhashfn, self.lockedhashes = data[:3]
+        super().set_taskdata(data[3:])
 
     def dump_sigs(self, dataCache, options):
         sigfile = os.getcwd() + "/locked-sigs.inc"
@@ -263,7 +261,10 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         if error_msgs:
             bb.fatal("\n".join(error_msgs))
 
-class SignatureGeneratorOEEquivHash(bb.siggen.SignatureGeneratorUniHashMixIn, SignatureGeneratorOEBasicHash):
+class SignatureGeneratorOEBasicHash(SignatureGeneratorOEBasicHashMixIn, bb.siggen.SignatureGeneratorBasicHash):
+    name = "OEBasicHash"
+
+class SignatureGeneratorOEEquivHash(SignatureGeneratorOEBasicHashMixIn, bb.siggen.SignatureGeneratorUniHashMixIn, bb.siggen.SignatureGeneratorBasicHash):
     name = "OEEquivHash"
 
     def init_rundepcheck(self, data):
-- 
2.20.1


