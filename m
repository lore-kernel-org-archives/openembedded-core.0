Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 146736FF60
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 05:53:33 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b184so908804wma.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 22:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oXQSK3GZzGsV0LchXBRqXcSTcAI12HI2QVz4EvzMqwA=;
	b=h8wdl3Mus5dw3qBtb0/TKDHjJ4NoYB9CVuZM/RMbqkGXsE//xC0UH+yVhaIOEpORIS
	G4XMpRk6vIPxGNDXk5f40Bmco9+ca2B2IUXBFCqcbqLwdFFkslkADMJsY/Nt5X7d0cxo
	hlAmfK7RxkLyoj1hVCL/hNw5UENeecIkhhO+AFitvycB01X9CQgOw2B73gtM/+sk8sHA
	kxIQ1cfkwc6F2s1rsjcOv+tLIU3A7JMJ2jtgc3Dih/X3sbha6XQFBC1qwuiGTLNlB3t2
	bAPOHYj27sb1d18+iRMSfgNZSZmbqotvdVhBxsuQJ0pNWGJXMUz/dXwA0hvmRSXQS73V
	b7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oXQSK3GZzGsV0LchXBRqXcSTcAI12HI2QVz4EvzMqwA=;
	b=aRzJ+oFxoeey91MpWyvZk8OjRFtlKtTxLzK5fGy5il0KKxyrKrRbbm9IsyJsNQCuiD
	r/BnATlE/jnwCoCa6HIlwVNZLp+I4h8yxhSyZq93paJtxgOtcS64sc8KAZdut0EjdgKr
	quC5ZFl02NdqMTd5m3bYy/aL/zGjP3cQKtbih7zvSu10QDH7/2d4XmDIXHf1wzAKZFfF
	x3U0FQSrJwJTXMJHb8BRGlFKAB7FJgr6dsPNAsdC8kcZmUyioQcYwWkDj9H9eXJ+9ayH
	M2JhaEk3iNs1Ro546TtCFLzts8KmngKLr0KzKqDBnwjNcTNUdEPkLKtQpzF2qZ9pJcPX
	oLsQ==
X-Gm-Message-State: AA6/9Rm08Qu1ad8X+4jU/fqTRAu7gUpMK5g5SAZapPeSK3ineBxlMQul5Z8x6Ijtj2Dw9Q==
X-Received: by 10.28.135.206 with SMTP id j197mr885256wmd.31.1474610014163;
	Thu, 22 Sep 2016 22:53:34 -0700 (PDT)
Received: from localhost.localdomain (p4FDF041C.dip0.t-ipconnect.de.
	[79.223.4.28]) by smtp.googlemail.com with ESMTPSA id
	ab9sm5428084wjc.7.2016.09.22.22.53.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Sep 2016 22:53:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 07:52:18 +0200
Message-Id: <1474609938-1316-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] scons.bbclass: rework parameters for install task
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
X-List-Received-Date: Fri, 23 Sep 2016 05:53:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes:

* During install all files were recompiled -> redurced build time
* For some recipes we found lot of links to build host image path

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/scons.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index 1579b05..b9ae19d 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -10,7 +10,7 @@ scons_do_compile() {
 }
 
 scons_do_install() {
-        ${STAGING_BINDIR_NATIVE}/scons PREFIX=${D}${prefix} prefix=${D}${prefix} install ${EXTRA_OESCONS}|| \
+        ${STAGING_BINDIR_NATIVE}/scons install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} install || \
         die "scons install execution failed."
 }
 
-- 
2.5.5


