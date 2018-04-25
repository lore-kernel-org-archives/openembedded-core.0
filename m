Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 953C071C70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 13:58:23 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o78so7025994wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 06:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=yCO87R3UArfGqKNmF7NgAJ0C1ngYRtvKmErRBh2mwpg=;
	b=GyGOZSceV9f4ePyevp+CHnk6Gf0fXauuyc9r4tTA+BRauIYG3QRe4BBlT8C+lhoPjv
	2Cez+gSpsHm7i30fncAtXp97O32NfmravCoKdd511eIvf74UyMLShBVOU+Mz21EGHmdf
	VRnHqBsK4tekowjcXjyiHCKbCBIXuvHytlOlxbYzJE20CZJMRwhGJYEPAV0fzY3cESlu
	GPHQ0/zf0wfYrzIjQ+qT+qEah1Z/Io3RI/8m0p/s1HdRNreJuZiGG1dw+kNXiQrJ4RNZ
	4YpDy/YfzaDiuaAcCU0zNUM39xnmRHlzWZN4bOW+1ObHg1eXEz06J/aTxj2SMnWNeBYE
	cAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yCO87R3UArfGqKNmF7NgAJ0C1ngYRtvKmErRBh2mwpg=;
	b=ssVqpXYuL5C2DRC9FgaxmnD6+QqGrXOIMgVb9UKi4WVT/d5HWmkxMFL8i23q1jgtBf
	Hf7YzHpYp73bSgVbUlr4wWwFJhB7J63Wqh9o13+L8WL8+haqcSivQcaXCtedjEbLRlCH
	SFSmPpnv39lI39fD4EgD3U5Y2ivOZvomDluhlCR6sZHFrGBdfXiDu8//zNWtB5Afqpbr
	kftszZG4kobDr/VbcDjDdYQfAoF//eMW9cgYbkdEc9oTiyMhfSniWekWK/DFUYtR2VXv
	Bi1KK+/SNOW1A25Y4XeNhDwU8Fo5jX/BKFfLDollu9aUxXqfdJYZe6pRH1qiv8w1QcBQ
	cEvw==
X-Gm-Message-State: ALQs6tAuzu70uYcf7avjWWN0k91+LoI6oH627c+uC5lYVt7bAnxAmEd9
	CuNiGQ7G9C5yXzbki3VCsgU3RoqR
X-Google-Smtp-Source: AIpwx4+gpX3Ccdva6mSHbbfOBIX3k4VYSFVRX0N7m5qm0LwBd9FITCebchc6eqN5q4FhmP02LwFTlA==
X-Received: by 10.80.182.226 with SMTP id f31mr38677101ede.23.1524664703719;
	Wed, 25 Apr 2018 06:58:23 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l91sm10603543ede.50.2018.04.25.06.58.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Apr 2018 06:58:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 14:58:18 +0100
Message-Id: <20180425135818.23345-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] base: improve do_unpack[cleandirs] logic
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
X-List-Received-Date: Wed, 25 Apr 2018 13:58:23 -0000

If a recipe sets S to ${WORKDIR}/ then the S != WORKDIR test doesn't work as
expected.  Use os.path.samefile() instead of string comparisons to do the right
thing.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index bb1f4b75336..7ddf70414a1 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -152,7 +152,7 @@ python base_do_fetch() {
 addtask unpack after do_fetch
 do_unpack[dirs] = "${WORKDIR}"
 
-do_unpack[cleandirs] = "${@d.getVar('S') if d.getVar('S') != d.getVar('WORKDIR') else os.path.join('${S}', 'patches')}"
+do_unpack[cleandirs] = "${@os.path.join('${S}', 'patches') if os.path.samefile(d.getVar('S'), d.getVar('WORKDIR')) else d.getVar('S')}"
 
 python base_do_unpack() {
     src_uri = (d.getVar('SRC_URI') or "").split()
-- 
2.11.0


