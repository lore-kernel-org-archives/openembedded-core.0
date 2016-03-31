Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f194.google.com (mail-ig0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id 939906FF64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 18:13:27 +0000 (UTC)
Received: by mail-ig0-f194.google.com with SMTP id nt3so14190017igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/rBQur9o1L68lfiEdtUL77pdw3pT/08+xPRjsCjHhFA=;
	b=rDvbKkhkGEmOhJaxdFG3w0l6CMnyz0subfMCv5OoF9RHNIvGXB5U1Jo4w6I1LhzRhU
	mG/OqD8caFzwHjfkVXFwcez788t0A2+v28ltyHjja7LYoSJd3Eq1vqhq5Q+35U17uy2E
	dgVLTD+rL564YB2QetC048y3D9PJEX9yHIqbcnINkWSUBPFCdMYkdUZgI1cvt1EZGBZ9
	a/eSgOgTcvCFb8IwP8dZs5hzKYMXmt3/T9H8VaiSioRRErNMg5Gqw8bN4elAFlMM6LtJ
	mobdkQBPtwlY3ZQsX59l60GNKxcTF5unIdnP/5zE1aeaOmYPspUWzVtdLNQP0pbqqTLW
	XkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/rBQur9o1L68lfiEdtUL77pdw3pT/08+xPRjsCjHhFA=;
	b=Da2Dk9cv8HtoUMzNwxkUvqw8UjiLc5II76bAkQeu/z4K+9UsU1MUX02S7WSBm8TGqt
	SAcUm6cY4SOpHpaz0M2lfrialnhmFKscxDHKOat6FYKnYGruYVAC/4CZXudn2IkMlZO7
	h6K5nvOP0A3DDMo9ROKKIp+vAMAddY9rthA9ud1AUOl3IQzXv4smr9+DneA9DhRUm/oy
	tYACsIKAoE08d9ROOx5F3gdsOO79OS3b1RiLEQnVGqch+FClRuDeHsM99xCRWFRpK0ja
	24elVHTMErX9+/bH/2wVpmOcq8+7ZFC02+PzQJ+nu1FabmHLJn4Q08xzUVuPh8FhSFFR
	757w==
X-Gm-Message-State: AD7BkJIeGuJLe8a6V4JswnSFMNZ4ejcf9KeVNlKHUE69UM+GrNGSa2GEbigXrJ8EoAiMvw==
X-Received: by 10.50.155.36 with SMTP id vt4mr5691363igb.0.1459448008048;
	Thu, 31 Mar 2016 11:13:28 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p1sm4252058iop.12.2016.03.31.11.13.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 11:13:27 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 11:13:09 -0700
Message-Id: <1459447989-25263-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459447989-25263-1-git-send-email-armccurdy@gmail.com>
References: <1459447989-25263-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/4] base.bbclass: minor logic simplification
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
X-List-Received-Date: Thu, 31 Mar 2016 18:13:27 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/base.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index d91e059..a1e1044 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -515,7 +515,11 @@ python () {
                     if spdx_license:
                         incompatwl.extend((d.getVar(w + spdx_license, True) or "").split())
 
-            if not pn in whitelist:
+            if pn in whitelist:
+                if pn in incompatwl:
+                    p = d.getVar('P', True)
+                    bb.note("INCLUDING " + p + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted")
+            else:
                 pkgs = d.getVar('PACKAGES', True).split()
                 skipped_pkgs = []
                 unskipped_pkgs = []
@@ -535,10 +539,6 @@ python () {
                 elif all_skipped or incompatible_license(d, bad_licenses):
                     bb.debug(1, "SKIPPING recipe %s because it's %s" % (pn, license))
                     raise bb.parse.SkipPackage("incompatible with license %s" % license)
-            elif pn in whitelist:
-                if pn in incompatwl:
-                    p = d.getVar('P', True)
-                    bb.note("INCLUDING " + p + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted")
 
     needsrcrev = False
     srcuri = d.getVar('SRC_URI', True)
-- 
1.9.1


