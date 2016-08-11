Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7B11E76806
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 08:39:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q128so8650wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 01:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Z+H2QsC2jDub4myk55tZY3FSM56H+q+ZT15KBY6kRIg=;
	b=LUv9BcyXYVay9aawKze1kAByJxobI8gbzsgZxpQ1Lb/76FEtmrjyosp2GawBsJ6kGk
	qlx4OYyCy1aPruONlX7hgaBMaGSmUlGfRaEjpKHvSbPG40w0p6C7Lv61o98/KHBl5Xmi
	+wjsR3D210wAHcpfOSL8qPySDogspKG4NBL49GoGv0Cu4bL/4XP0mPFBPD1cMIwJHUdc
	sj67uPZOpFXRFP4H364xEQDCx4kLpNRRLoqpIHZqT+bQ8bt2ISFOOVqCZDbb7aTCkoV2
	PYI1nuG08W4xa+/Zm/pD6K1/sPShfB83Db5qwc43jh567a+4sb6iVXWCY54+cGGuCnHc
	QF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z+H2QsC2jDub4myk55tZY3FSM56H+q+ZT15KBY6kRIg=;
	b=eox57v+IdByRVS1vQA7M/ECyJ02nW9yt3r3MoN+IF9cMZOmkiKL7OMhpfSvH/BAjST
	vuAQzDJ2G1xFdY2sCepFu9WpbyA1/k4LBcCH4zZr2ivLKo+wy6uZXv6o/W4urdN4Bnvk
	tKO9DCRGPLuG9RKduux8upwtaaN3DNnhZ8etKv+WcAsp1xfIWpyInCXsSImU9yBYGQmM
	oPFyWOISjoGY7J0NjN5NoEvf1vTsziV91CnxvtZEfKuxvOSBL+vKhBbE/P8M2UN8dOqH
	zjYKR3ieugDjqaluFwd/OmjCuYMv1OqcDrLLUDBwTf2B/Im7M0LeQAuI42A9OdWBxyzf
	AGIQ==
X-Gm-Message-State: AEkooutFL2zx1FFBd7TslVUXVhLfBjK/TxPJu0QynzUCCdOJ3ZtBsrGF7oEJ7PJPkhNf2g==
X-Received: by 10.194.100.129 with SMTP id ey1mr8069033wjb.60.1470904752305;
	Thu, 11 Aug 2016 01:39:12 -0700 (PDT)
Received: from e6520.adbgroup.pl ([91.230.58.65])
	by smtp.gmail.com with ESMTPSA id
	v203sm2051278wmv.2.2016.08.11.01.39.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Aug 2016 01:39:11 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 01:38:54 -0700
Message-Id: <1470904734-7709-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] ccache.bbclass: don't remove CCACHE_DIR as part of do_clean
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
X-List-Received-Date: Thu, 11 Aug 2016 08:39:13 -0000

Removing the ccache directory as part of do_clean is unnecessarily
conservative and defeats many of the benefits of ccache.

The original justification for this behaviour was to avoid confusion
in the corner case that the ccache directory becomes corrupted.
However the standard approach for dealing with such highly unlikely
corner cases (ie manually removing tmp) would also recover from
corruption of the ccache directories, without the negative impact of
defeating ccache during normal development.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/ccache.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 2cdce46..2e9837c 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -4,5 +4,3 @@ CCACHE_DISABLE[unexport] = "1"
 
 do_configure[dirs] =+ "${CCACHE_DIR}"
 do_kernel_configme[dirs] =+ "${CCACHE_DIR}"
-
-do_clean[cleandirs] += "${CCACHE_DIR}"
-- 
1.9.1


