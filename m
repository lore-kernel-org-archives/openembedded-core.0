Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 10AC16B8B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 13:08:35 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id eh20so314379lab.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 06:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8OPd8kZeCHo2anA0/ld5//FVgdpYdPrCOjXJK7o0zsQ=;
	b=T7OZy/yHZIEpcJsROgSC2iwYDsbWM+C2RdG6QMdzLyvqnQt5l7ROJd/BYyob/7tsYp
	6IM2vVaCAMpR1y9rucmbkBB6Hhr5QxVavwD1TkcPzQVCbwHn5he6fihLi8XNSkVdA6ad
	xl+Oa+sGge4mkvn8TatItKsRiQdZwzXC5T4iiVteWfjxnHde2vPKoe8mHqWe1Ibj/5y+
	RcVDCI8GFOk7BlyZjCDeBXPZzA1Kwh33qAWgd6PGBL2z0JMAHPzjhXKzcwB6++XPPz3M
	CNIlrS45Gn3FB61EfJgC/AScSnHaD99j0eY4GdeFEJED2TezZ1iDoTBC9x26tyciiYph
	dUqg==
X-Received: by 10.152.120.37 with SMTP id kz5mr5998862lab.21.1377090516288;
	Wed, 21 Aug 2013 06:08:36 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id k9sm3149097lbe.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 21 Aug 2013 06:08:35 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VC89J-00062x-SZ; Wed, 21 Aug 2013 16:08:33 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2013 16:08:32 +0300
Message-Id: <7dddce57f33686ce5c2903e8a91f94cefd75c043.1377090438.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1377090438.git.cazfi74@gmail.com>
References: <cover.1377090438.git.cazfi74@gmail.com>
Subject: [PATCH 1/1] boost: fix build when PARALLEL_MAKE is not set
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
X-List-Received-Date: Wed, 21 Aug 2013 13:08:36 -0000

It was passing "None" to bjam, which then parsed it as unknown build target.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-support/boost/boost.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 87bac23..5d20b11 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -115,6 +115,8 @@ def get_boost_parallel_make(bb, d):
             bb.error("Unable to analyse format of PARALLEL_MAKE variable: %s" % pm)
         pm_nval = min(64, int(pm_val.group(0)))
         return pm_prefix.group(0) + str(pm_nval) + pm[pm_val.end():]
+    else:
+        return ""
 
 BOOST_PARALLEL_MAKE = "${@get_boost_parallel_make(bb, d)}"
 BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} \
-- 
1.7.10.4


