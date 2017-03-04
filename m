Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id AD2C47769B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Mar 2017 05:11:17 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 77so1765669pgc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 21:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TbF/QljRe41tts+s4x33JPdT3hySC4bk1Xo8Vaim0xU=;
	b=TtbHWqDMZL91nCxEHdA+bBV/Xu0xFhFNF4bt6edR2PiFle1D7iUKxyh483ItwWNRse
	aOUS5DU7enohe8Q/cWL/OjJ+Mnv4SsEro4AapVC2o30Oov9Men6EtB7suuJWvn2fXg0M
	/o9cojR09LqBlcYYkTV4OiQQU0AVpKZ+HqWDcwHViErxf6us6502RL6capqXHiyAPKU6
	/1x97DBuVltvHnZNj0ltEiIK4XnGlmaBITqlIQ1XvQxFeK9deBd5V07Qt2Ng7bMWQE9T
	Qr3G762GQdy0EgEuevBC/GtMUpsu470CVEpnxY0SxBQDfxNMN8Zt7ENrVgCfYaWT6R6s
	OJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TbF/QljRe41tts+s4x33JPdT3hySC4bk1Xo8Vaim0xU=;
	b=A2j7frp0bxzk3OcIXTb9TS2ACLxVn+QPxB4vxmcFqCObO3nxUffuJEH3YaTfMd0Smb
	/lCRGmbzIREJk43TCarVtVQ2N6Po1A9D+prDDr9qN5XWhZhsxZtt5pxENHZmah6zBrko
	8EW3HypCoLDiV02d1oY5lZXjec/h+0UH5MP990Ua5lqcHVSjYCLSvNrNqWOoxd8uSSyY
	kClBQ6C7Lx1CFisJ+01FHaqizijmxLI1560pBeA1TbUdidJHiQTi0iQ+xOdygnOdOl35
	WrcJ62fa8rYsverM4CA76qkyVPIs1Q0NHC/kQYnJK8XoO4nOdBGQ2aveHvaonTolCles
	Q22g==
X-Gm-Message-State: AMke39kBL+JgBRylSarBDO7EjCjZn61BYD+rgkXtbc7x07BHBqpg3HLK2xOe6Cof3qNckg==
X-Received: by 10.99.66.193 with SMTP id p184mr7484555pga.213.1488604278757;
	Fri, 03 Mar 2017 21:11:18 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	y187sm26294925pfy.123.2017.03.03.21.11.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Mar 2017 21:11:16 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 21:11:12 -0800
Message-Id: <1488604272-13683-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] base.bbclass: improve wording when skipping recipes with incompatible licenses
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
X-List-Received-Date: Sat, 04 Mar 2017 05:11:19 -0000

The previous wording, e.g.

  ERROR: wget was skipped: incompatible with license GPLv3

isn't very clear and could be taken to imply that the recipe is
incompatible with its own license.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index edac18b..14293f8 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -533,7 +533,7 @@ python () {
                         bb.debug(1, "INCLUDING the package " + pkg)
                 elif all_skipped or incompatible_license(d, bad_licenses):
                     bb.debug(1, "SKIPPING recipe %s because it's %s" % (pn, license))
-                    raise bb.parse.SkipPackage("incompatible with license %s" % license)
+                    raise bb.parse.SkipPackage("it has an incompatible license: %s" % license)
             elif pn in whitelist:
                 if pn in incompatwl:
                     bb.note("INCLUDING " + pn + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted")
-- 
1.9.1


