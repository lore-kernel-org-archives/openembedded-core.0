Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id ED00E74520
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 14:35:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 69-v6so6625783wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2018 07:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=sbke/XsrFVt8OehKVohKeR28CZDlFv/ruN9t/qADj00=;
	b=qQX57mzSezH46Gf8HWnkxNWPoQz6o6tRR086QE4Pu+9XpEcmLKYC1lFzz0mc+hvae9
	dZvrYQ5nfKrOWygD0yQE/VB5pUbbeL7fltfqX8vEhbRrdrnCYco7gMdikeh31ubSEkYo
	jWrUyuk7ophGGcMheDQBvvh88sU9esJW0jRav95PzQoiAvq/m/H386Rxx1oLlgtUulXD
	X9RTWygSZAQnxyV7AVF9WMwxqtx4WHB9UR3LkThch22vH+p6oApyoS2WiL+5heHXiKEN
	6pxfuELyo5pGifpCE0pNAtUuLAwRuv+B9/2gOOVxH8T7LI90+nDUqqX2od7uTqU5moQS
	ED5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sbke/XsrFVt8OehKVohKeR28CZDlFv/ruN9t/qADj00=;
	b=g4qvgUX6+ypqXbMfRo+iZh4t4+ktENi4N6I6pWp39aB36M9Xkwh47xxxLBKJPb4fbG
	8aZLV2qpbPekfgJoki2c5OwZ+lxjqB7IdqxH1diMrA6ADAB9QeqiDfjH32PwgSylr6E8
	q9hMmvgu9WlMDP6wV6pnsi851eXiWe3q6uIDFuaTKosFS3jfLnX0tpQAeseXGdzSItxW
	VqtzBuuk/2wL6zcmctLLHm4Gm+RfGhMcYZxDi6798H8sh9tVZHdVrF/Hc6BaDuZZj9oT
	zWZSdnnxoHz5w82qOdo8LkaIqOKZUyMPPScQPe7P7iRrhKRPi/brGtrjGULYICDldJR0
	FK/w==
X-Gm-Message-State: APt69E3RAcqkPp7+v8RF6C8lw3ShsJNK6+T4GiLnVOBaHwphlcY1oId/
	P6jszgV6iAP5/lxnwmCX9ccUygVF
X-Google-Smtp-Source: ADUXVKLymCmKUsQtPGmbzZJUHhHLF6yh6Jlud6+cl9rQEuY1PjQCZGpNfEjKJw6Ej2Th5R9oCKrtJQ==
X-Received: by 2002:a1c:8a4b:: with SMTP id m72-v6mr1958376wmd.2.1528382121441;
	Thu, 07 Jun 2018 07:35:21 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t1-v6sm2021475wmt.40.2018.06.07.07.35.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 07:35:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2018 15:35:18 +0100
Message-Id: <20180607143518.12158-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] attr/acl: disable make clean
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
X-List-Received-Date: Thu, 07 Jun 2018 14:35:21 -0000

These packages use hand-grown makefiles which don't handle cleans as they can
invoke /usr/bin/gmake directly which may not exist.  Until new upstream releases
are made (which have ported to automake) set CLEANBROKEN to work around this.

[ YOCTO #12775 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/attr/ea-acl.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 1339eccdbd1..9336ffc9389 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -7,6 +7,9 @@ SRC_URI_append = " file://0001-Added-configure-option-to-enable-disable-static-l
 
 inherit autotools-brokensep gettext
 
+# When upstream is using automake properly, this can be removed
+CLEANBROKEN = "1"
+
 # the package comes with a custom config.h.in, it cannot be
 # overwritten by autoheader
 EXTRA_AUTORECONF += "--exclude=autoheader"
-- 
2.11.0


