Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 558507810C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 11:09:24 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id y192so6148739pgd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Aug 2017 04:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=cOqZ9uqHYI1GLaleSLp3UG7kBMNbqn6kiaagkaPqf7g=;
	b=fDYZys7ChlO1fpYbb5HtCLYI3c3SvqgFiuccqyDhpYpKRgz66OakzGmfVEM/EE8mQI
	HI7H4s80wzeef0vn/6PSm5pb6ODzBhOMTNe3vnLAYW4tZBPhfAYH5vi2/2c8vgyKLW6I
	HrwYtWLvlKXI++Uy3k8tToZOw8RqMS8/QnnYAfCiibO8r+yiaU7yvG8w5x0aAJC/nMeM
	KP95aF4yOokWij7Y0+rKxdjzTrafsjrYQ8qkJEPP5jOctoioH+POI0n9iMH9IJQ1nxaN
	wtxQPLu27T9NNvcKQ1DxxgK+om58fAqCk5CG5z9FmgZmUOAULLEqHKmivEFuHSOv6TON
	+Ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=cOqZ9uqHYI1GLaleSLp3UG7kBMNbqn6kiaagkaPqf7g=;
	b=nD67jg5+OL2hJmpdfxzqym5AD7khDip0JfnWgepfIF6cy9Tc7q9GDajd5j3F9lim9d
	UX5Ylslrn6Mz0+OGAgYlWAcYr3mYSX0aL+aBFI3eIJsx4bPBvwKNrLyG2s63uEouQ0QT
	SLdSGY9lGuyyfNPyqFlKu6pfQ9kjYwFQwe7gNP0W69sFdNYf/ek/MHnjYVnzcYw7X2EB
	PYtzWf3Mz54emezDjLKOdcVlkcS0gMs/HtHdYZA/BwjS+/Qd6sEU+xl6Sv/RMzLHjKIt
	g6n0sFK2IVyVLttWHoWW3zVtWsMsRGXkvo2rTq+cHL30SzPQgkjqZLFCyjSyhuMxPvjy
	YOgg==
X-Gm-Message-State: AIVw11096XmnhqrG7pwG/b73eStM/MpjFLeDKnYmImZoXd2pRMOshf45
	qt3gT2wxdsLxjUA8YkcfMg==
X-Received: by 10.98.77.6 with SMTP id a6mr22183198pfb.221.1501672165942;
	Wed, 02 Aug 2017 04:09:25 -0700 (PDT)
Received: from [127.0.1.1] (CPE-121-223-2-142.lnse2.cha.bigpond.net.au.
	[121.223.2.142]) by smtp.gmail.com with ESMTPSA id
	r9sm20412777pgf.83.2017.08.02.04.09.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Aug 2017 04:09:25 -0700 (PDT)
Date: Wed, 02 Aug 2017 21:09:16 +1000
Message-Id: <20170802110916.22886-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] llvm: Raise SkipRecipe exception for unsupported architectures
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
X-List-Received-Date: Wed, 02 Aug 2017 11:09:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

When parsing this recipe on an unsupported or non-mappable architecture
an error is generated despite no dependencies on the recipe. E.g.

  ERROR: .../llvm_git.bb: cannot map 'microblazeel' to a supported llvm architecture

Instead of generating an error which might confuse users, raise a
SkipRecipe exception similar to other arch-style mapping functions (e.g.
go_map_arch). This avoids showing the error during parse, and prevents
the use of the recipe on unsupported targets. Resulting in an error like
so when trying to build llvm:

  ERROR: Nothing PROVIDES 'llvm'
  llvm was skipped: Cannot map 'microblazeel' to a supported LLVM architecture

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 5dcb508c23..5db728bf44 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -42,8 +42,7 @@ def get_llvm_arch(bb, d, arch_var):
     elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
     elif re.match('p(pc|owerpc)(|64)', a):             return 'PowerPC'
     else:
-        bb.error("cannot map '%s' to a supported llvm architecture" % a)
-    return ""
+        raise bb.parse.SkipRecipe("Cannot map '%s' to a supported LLVM architecture" % a)
 
 def get_llvm_target_arch(bb, d):
     return get_llvm_arch(bb, d, 'TARGET_ARCH')
-- 
2.13.2


