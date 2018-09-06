Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E0C95795CF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 11:15:27 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j26-v6so10979179wre.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zmCy05G6bh9EjY4CzZGNN8rwPN/nTN+kZ5rmBpaiJoM=;
	b=OIIfEDjWZyar+sOACsadX34HOtq0Dxx4UxG3bUte265/UekwfhW6K5qrqoe4yGhqer
	ii0ulvDXAHbrNGElp9oAVM42redt0e9wJIwkacq0T7qsbiF6JAHqBAdB2I8wJOGkKN19
	96+g4FmQgzbNmBRqm9lXyFdD6+6QlOvIRXLc5XLlMG8D9QfTz6ZScP/DkaQhH0gaVBzx
	PaxVRQsU+sOAuJISe+LXtJ9RJcgVn2IQcMvJQ2n0tfy4Ea4h68lIYWDDeXYv9myP4b+8
	NlAquCrUhWHRETHt/iFWKLhx4fJ7MxjmbtA55Y9jFGPCYPQiEXA9LBn+3Q4Jy8kmzXyA
	RViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zmCy05G6bh9EjY4CzZGNN8rwPN/nTN+kZ5rmBpaiJoM=;
	b=A3zdcMzM044Jfxu9zJMjLvclVHdZ20q/m9uTTPdurR4aSQyXoKEDF8wH0QMoK6IEiC
	YejThGx1O5F9cqh/svZTURAUkPZKE7JfUeHRUIaHbvID0jODTVbo9q2Zj3BHHj90vkJo
	J9UCbqeaFxGNbQGHms0ifToOfnXcfhjWAolRsXf5cImIjBIXLv0HImk5IjJCHyf7A89Y
	EQmaiHbCOjbYYrEeLTHtEvX3HucYbVTgh+YpLjehJ77vaQmlEsPEMyLc4UVV7UTz1ik/
	j/EatVbkQbE0RJA0it2fjDELzZkO9RcE90OVxBTcTbpNNh/BvGneNxULRRPyUDozlK7L
	E/Tw==
X-Gm-Message-State: APzg51CpVnFSE1Q8c8Xo1E4wpA0tkNY6r3QBN+TpCmHBOG/pnVIEAlPD
	z/IBjrtrBx4XNKmN4WmhIw4JA8yuVP8=
X-Google-Smtp-Source: ANB0VdbVWLjS0x2MhXhuA6yb10ptZ/uApo2B3GaSTdmEJnqohDSi/OhoKmEnJupQ9QrFdzSdFjhyHA==
X-Received: by 2002:adf:9051:: with SMTP id
	h75-v6mr2067206wrh.65.1536232528156; 
	Thu, 06 Sep 2018 04:15:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f6-v6sm5519173wrr.68.2018.09.06.04.15.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 04:15:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:15:19 +0100
Message-Id: <20180906111521.20997-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180906111521.20997-1-ross.burton@intel.com>
References: <20180906111521.20997-1-ross.burton@intel.com>
Subject: [PATCH 3/5] python3: trim PGO patch
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
X-List-Received-Date: Thu, 06 Sep 2018 11:15:28 -0000

There's no need to delete the line that removes the profile data, as we're not
using it after the build.  This reduces the size of the patch, making it easier
to maintain.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0002-Makefile-add-target-to-split-profile-generation.patch        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch b/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
index bb01c5bcb46..2b4ba316e45 100644
--- a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
+++ b/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 84bc3ff..017a2c4 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -469,13 +469,11 @@ profile-opt:
+@@ -469,13 +469,12 @@ profile-opt:
  	$(MAKE) profile-removal
  	$(MAKE) build_all_generate_profile
  	$(MAKE) profile-removal
@@ -31,7 +31,7 @@ index 84bc3ff..017a2c4 100644
  	@echo "Rebuilding with profile guided optimizations:"
  	$(MAKE) clean
  	$(MAKE) build_all_use_profile
--	$(MAKE) profile-removal
+ 	$(MAKE) profile-removal
  
  build_all_generate_profile:
  	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
-- 
2.11.0


