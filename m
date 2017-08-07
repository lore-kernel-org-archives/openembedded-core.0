Return-Path: <richard.rojfors@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7047D6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 06:21:07 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id 65so4765442lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Aug 2017 23:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:mime-version
	:content-transfer-encoding;
	bh=DLzzR2KCvdGuhxZ90P98NEE2jhEPSQ8gTSCxvuqeAH8=;
	b=DsM6eIREEa8Wl3PbTUiBZi2T5R/hm5xY8XD4nzHnyc2HLrltE5jmUxfsTIcIfFpfUM
	EmU10Qhfcj7TnavzxK4RylOEQMj0K62WsxTo9hY+960DgnSg7LjwYOoQLNV3BKastB33
	VyLmEsyq3/4iniNMzpmo+3w/K5qI3N9j7lTOEtSP8uzBNaZFW9IlzKKYgQFtPKq11MxJ
	T7Vzxpo8cuD7LE4cMTy9sMKes0tmE1RPmF88lKmF8HoiGMw2CqiCXG6cp1dixAQHiY6d
	oCwpjl/eYs/uQLV89vMUQurvRZwJ55OP0RPSVHbsRn4KSupWIRZHNRRC6oVBMis6caEM
	9Kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:mime-version
	:content-transfer-encoding;
	bh=DLzzR2KCvdGuhxZ90P98NEE2jhEPSQ8gTSCxvuqeAH8=;
	b=oXz5yOH4K3imsfkcK4RKEMuf/e6DW9dDeKhJwHRpcGVBwvcwA5sqPg5nJ7mX0+LR2w
	t849G6qMtbayLvtYz9IOepWGzULTDcQactPFb0Zf1ukCC2HHs86USjq8+Db0SHpOjhiJ
	KZpZ6sWfa3ilC9+wROxC5JMI/ptGy3stU5SmcmOXwPj/ADrpqp50k80jVHwh+xLrwDaX
	0+yJugYh5arnh8Tq2/s0K+6fd30F03RKL9qmsdQrAXO7Cozv3KpS4p9V/EvJ6v/f86kL
	SBwY/JMaQavZufC0QIWexCIk4ZC+Lb+BgnY1/zf0YeTbe4TfAVIkCid2US3EcejUTFp2
	RS3g==
X-Gm-Message-State: AHYfb5h0Pw+D8bH4cC6jlVFDMLqw8q7JJ/HzeGInZJ1h3zeYcMDV8bCr
	Q1e93wSl9+grZv1ro9Y=
X-Received: by 10.25.33.129 with SMTP id h123mr2622306lfh.68.1502086867818;
	Sun, 06 Aug 2017 23:21:07 -0700 (PDT)
Received: from ellan ([213.115.5.18]) by smtp.googlemail.com with ESMTPSA id
	f78sm2745355lji.45.2017.08.06.23.21.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 06 Aug 2017 23:21:06 -0700 (PDT)
Message-ID: <1502086865.13610.1.camel@gmail.com>
From: Richard =?ISO-8859-1?Q?R=F6jfors?= <richard.rojfors@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 07 Aug 2017 08:21:05 +0200
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
Subject: [pyro][PATCH] package_manager: Fix support for NO_RECOMMENDATONS
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
X-List-Received-Date: Mon, 07 Aug 2017 06:21:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When support for dnf was introduced the check of the
no NO_RECOMMENDATIONS variable got broken.

This fixes the issue by compairing to the string "1"
rather than the number 1.

Signed-off-by: Richard Röjfors <richard@puffinpack.se>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 93d079d73d..28c6b2aec2 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -585,7 +585,7 @@ class RpmPM(PackageManager):
 
         output = self._invoke_dnf((["--skip-broken"] if attempt_only else []) +
                          (["-x", ",".join(exclude_pkgs)] if len(exclude_pkgs) > 0 else []) +
-                         (["--setopt=install_weak_deps=False"] if self.d.getVar('NO_RECOMMENDATIONS') == 1 else []) +
+                         (["--setopt=install_weak_deps=False"] if self.d.getVar('NO_RECOMMENDATIONS') == "1" else []) +
                          (["--nogpgcheck"] if self.d.getVar('RPM_SIGN_PACKAGES') != '1' else ["--setopt=gpgcheck=True"]) +
                          ["install"] +
                          pkgs)
-- 
2.11.0

