Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web11.802.1621988879835474356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 17:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 3B444E07D6;
	Wed, 26 May 2021 12:27:47 +1200 (NZST)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH 1/3] Revert "icecc: Don't use icecc when INHIBIT_DEFAULT_DEPS is set"
Date: Wed, 26 May 2021 12:27:42 +1200
Message-Id: <20210526002744.3683697-2-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526002744.3683697-1-douglas.royds@taitradio.com>
References: <20210526002744.3683697-1-douglas.royds@taitradio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Although this silenced the warnings, it also turned off icecc for
gcc-cross and friends, binutils-cross, and importantly, the linux
kernel.

This reverts commit 0315aabeff8e6483b737d0e23d6841f1394ad3c8.

[YOCTO #13863]

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/icecc.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index d095305ed8..0dde960e7a 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -138,10 +138,6 @@ def use_icecc(bb,d):
     if icecc_is_cross_canadian(bb, d):
         return "no"
=20
-    if d.getVar('INHIBIT_DEFAULT_DEPS', False):
-        # We don't have a compiler, so no icecc
-        return "no"
-
     pn =3D d.getVar('PN')
     bpn =3D d.getVar('BPN')
=20
--=20
2.25.1

