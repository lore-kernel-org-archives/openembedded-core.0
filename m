Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8907.1795067991737307804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 21:59:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=kjy9Am30;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: joerg.vehlow@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1795067989;
	bh=+bZ/ysrL654FWM3a4EOf1wy+1DCVVfHBseD3LdzV+dk=;
	h=From:To:Cc:Subject:Date:From;
	b=kjy9Am30Rc+zYYNHlk5LDebfzxuvMV35Z4UnkXFDhtPpA9Vyr5EwgkOUY/rHRBwES
	 Dwxc0Z0dkNqOuJHbs4bwjFOjx0DlMx75uZsFL22TCMN1p/0aBzxBGxTTZ/o+rIs989
	 5v93Jf48IHDrlnZBbCWwUyAm7MU33Lmnq0vKO95rOgdIRGhrlgbVAYTIiIc2z2MWBU
	 2gXcl/Vg+pABEV77USO23uGWkfZz2C+eOPd8e0QUXVzeJE78VDlWqWZVi2FtV2V7xl
	 tvkF6x17y2+50TomkNE834bQ4F8/TaXVqyvS4WKHn3SB+hK2zqGK+a412PDYzUxh5f
	 9HM/fOlGjslaQ==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 0963C5F7E2
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 06:59:49 +0100 (CET)
From: Joerg Vehlow <joerg.vehlow@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: Joerg Vehlow <joerg.vehlow@emlix.com>
Subject: [PATCH] staging: allow special handling of initial-recipes also for native
Date: Thu, 19 Nov 2026 06:59:29 +0100
Message-ID: <20261119055929.3286725-1-joerg.vehlow@emlix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at mx1.emlix.com
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 05:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250641
Content-Type: text/plain; charset="utf-8"

Sometimes a native recipe also needs bootstrapping (e.g. for ada, rust or=
 go)
-inital-native recipes are already handled different in bitbake.conf (bot=
h suffixes are stripped).
During staging for the esdk these packages should also not be staged in t=
he sysroot as they might conflict like libgcc-initial does.

Signed-off-by: Joerg Vehlow <joerg.vehlow@emlix.com>
---
 meta/classes-global/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/st=
aging.bbclass
index 20340a16e1..6438f6bddd 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -453,7 +453,7 @@ python extend_recipe_sysroot() {
     installed =3D []
     for dep in configuredeps:
         c =3D setscenedeps[dep][0]
-        if mytaskname in ["do_sdk_depends", "do_populate_sdk_ext"] and c=
.endswith("-initial"):
+        if mytaskname in ["do_sdk_depends", "do_populate_sdk_ext"] and (=
c.endswith("-initial") or c.endswith("-initial-native")):
             bb.note("Skipping initial setscene dependency %s for install=
ation into the sysroot" % c)
             continue
         installed.append(c)
