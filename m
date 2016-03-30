Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id F063062132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 01:54:13 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id n5so29038272pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 18:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vwvI9a/0xqgJ5Kul44lbd31f5uvLIbM8MC/7FSp07s8=;
	b=Vu60U31r9aVC5Rjsh/DNuqJIs/phBuRgoWVzQVkaB/Kh6fVyno7O5D87WKPKPw/7iA
	N2XYB6inHjNjxeNFm2FnFjxAJZeBgs6wQMmtmMlUB3WyZQzmnbqIbpzeHfX7KniZZ8pu
	s5dw0rktPYv4jj/r46Pm+G5c4k7F378yM85tcNhpsIOJNoPi9ub+mRHcjCPTcyezvWXj
	JOdbyltrwWrypuIriJFOa57xJOqUwBe7occgtqjk1l1Khyr9tZvDcY7vmL5JQgPL9yJ2
	a1k3UGGJrTd40SN7TFLmlIaizcDd+OMyeToe9wgfQwsuxLCfixl/ZvhhYg9GvM4RKrIe
	cw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vwvI9a/0xqgJ5Kul44lbd31f5uvLIbM8MC/7FSp07s8=;
	b=hZsxaxXZccxYlZP9MyKHc5BI8Rtmgi9mBR7js1QUfLOqTfSoiuS9Tw++jofG+15IEA
	2SY52gP2CWcmHiBdULXWUXAyUxCPdDDc/ALF5itZOeULQYIDZbv1yuSENKb6OZCup9db
	C20VdY1kbF5zT2jOrq2I1fG4Jj4fKnEBg8Gl+IYGAVoSuyWL3eNYbxGoWCXCqY8ATHWb
	tPth+ZAjENmFr0qIu5+RmiTqvF/g7df89R5G459NKBw/ehPPnFPu4wnWMCFDQOJ4BK1L
	UfLp8vyKOQilAG918Xxmp3ymIZQ9hywST9fHfBDjNq0Av5BqtVpGbpCdnYNhH3tMy0oW
	4lVg==
X-Gm-Message-State: AD7BkJJnmuOQkkkqOV7MvlAg5/EHNN1zPSXhqmTx4RO8mDMLtZylCAnlBoNWrooAO6yQLQ==
X-Received: by 10.98.31.79 with SMTP id f76mr8656243pff.92.1459302854230;
	Tue, 29 Mar 2016 18:54:14 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id h2sm1176357pfd.91.2016.03.29.18.54.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Mar 2016 18:54:13 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Mar 2016 18:54:08 -0700
Message-Id: <1459302848-11181-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] base.bbclass: include PV in 'incompatible license but whitelisted' debug
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
X-List-Received-Date: Wed, 30 Mar 2016 01:54:14 -0000

Referencing PN only is ambiguous if multiple versions of a recipe are
present.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/base.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e066dc9..b624dde 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -544,10 +544,11 @@ python () {
                     bb.debug(1, "SKIPPING recipe %s because it's %s" % (pn, recipe_license))
                     raise bb.parse.SkipPackage("incompatible with license %s" % recipe_license)
             elif pn in whitelist:
+                p = d.getVar('P', True)
                 if pn in incompatwl:
-                    bb.note("INCLUDING " + pn + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted")
+                    bb.note("INCLUDING " + p + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted")
                 elif pn in htincompatwl:
-                    bb.note("INCLUDING " + pn + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted for HOSTTOOLS")
+                    bb.note("INCLUDING " + p + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted for HOSTTOOLS")
 
     needsrcrev = False
     srcuri = d.getVar('SRC_URI', True)
-- 
1.9.1


