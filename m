Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f196.google.com (mail-ig0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 019F760796
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 18:13:24 +0000 (UTC)
Received: by mail-ig0-f196.google.com with SMTP id nt3so14189856igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DjbeLFd9987yDC1fIGmSROGXlOuUuHs0NfKz8RS/lg8=;
	b=LMo4ffP8iqNT2Uht9Ijvzsb5I1DbDCgE+bUdT9WR8UgVZMIo8goTrXplBLZzP6bPTW
	vcgHoBY2xdtN6nrzaloKJErzS5YgAUUNTGyNdnQygdpt1f99g4+9XYlytQQTlmBsimek
	jqwnDf08gLEqgm03MKNc19M99Q4ryAyRQZwdg7Hq0iy7J1deEGnZR7/wss1KZXXkLKGT
	RhZC9UNU3ZJlTFBAL8T+dEI0+rB0I8tvofAka/fFBLAT91MLoafWdlwKKdGPq/8QOxFd
	jBs8ObdJN8SuI8bFUeKzGNEPodOGr2Nf7oua3HktswOG7yLcgIIkYxZ375XelXCkj9fU
	dLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DjbeLFd9987yDC1fIGmSROGXlOuUuHs0NfKz8RS/lg8=;
	b=I9VQHu+Ry0801l0Il5hiZd/MfOiCBdWVEhvJdEcqhVqJL/THaVfxuXCADOGym6iEo8
	50LMrW5aYRm7DW5Tmz6SKc56wekJCCB68G4+RS9esCLafk2yW/yyOzhozLYpgnFkRn50
	DqQISsFX0KnptyIfc0INo+RrXAwc37Iee1hfReFUySBEg6w9Gj7zwTMpVJxZjdjmyChf
	o22GoMFKKbA66K717/eIqS/2HT4Vx6naPytjs8wKW834ToFvajsVde9gdhdvBJrffIUa
	8TJilakwfS5paWp/RXgHLGq4iN6LnumLj/xghKRSTkr/042Q6o5o85TPiSG+q2WZ7TQ0
	gtow==
X-Gm-Message-State: AD7BkJLORTf9F/zIa82mVvWLgUQjaD02kYVOQ4KbKzS1wWaSZbR4NO28xqNBSn2iMpv60w==
X-Received: by 10.50.112.42 with SMTP id in10mr353856igb.1.1459448005714;
	Thu, 31 Mar 2016 11:13:25 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p1sm4252058iop.12.2016.03.31.11.13.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 11:13:24 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 11:13:08 -0700
Message-Id: <1459447989-25263-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459447989-25263-1-git-send-email-armccurdy@gmail.com>
References: <1459447989-25263-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/4] base.bbclass: include PV in 'incompatible license but whitelisted' debug
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

Referencing PN only is ambiguous if multiple versions of a recipe are
present.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 67b3370..d91e059 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -537,7 +537,8 @@ python () {
                     raise bb.parse.SkipPackage("incompatible with license %s" % license)
             elif pn in whitelist:
                 if pn in incompatwl:
-                    bb.note("INCLUDING " + pn + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted")
+                    p = d.getVar('P', True)
+                    bb.note("INCLUDING " + p + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted")
 
     needsrcrev = False
     srcuri = d.getVar('SRC_URI', True)
-- 
1.9.1


