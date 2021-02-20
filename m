Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by mx.groups.io with SMTP id smtpd.web12.9443.1613842201187318314
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 09:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=b1od/7CE;
 spf=pass (domain: gmx.de, ip: 212.227.15.15, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1613842199;
	bh=XXxpAM+xG//GsIIjiZRC+90v23GlhAU801FbTJoQOjs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b1od/7CEtfCdjJm2g1kyP7qtYTHkOYXxC6VVd9RPMzTHF2rclj41VjirmlwaFJH20
	 b+wGCwcvi+FrcTJ3iJCunj2mT1E0oVGb+Cmr310ZUbcicE/kSxm02rFsi+a8dKcnEl
	 XQmTdzT8FidhWncW/iEBvyaAVEkCFqQUQkiOf5x0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gmx.de ([95.88.58.204]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzf6-1lMpV70lJC-00R01f; Sat, 20
 Feb 2021 18:29:59 +0100
From: =?UTF-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <dl9pf@gmx.de>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <jsmoeller@linuxfoundation.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] oe-selftests: add rpm to reproducible build selftest
Date: Sat, 20 Feb 2021 18:29:34 +0100
Message-Id: <20210220172934.6428-3-dl9pf@gmx.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220172934.6428-1-dl9pf@gmx.de>
References: <20210220172934.6428-1-dl9pf@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:sgheuxCogk4vkU0cMAx8HDD+ReFuoWxwJlbTE8F2D90gJ/cZmQG
 YRhGcaJiXKNcdul3uauSkyEi4HDX/NUjou4MkXivLfbwK/D/eIixTWrbsQDFNKp/uNOc5a9
 7LoMwTc0qY/kyo6YOp69MdqRB1X6hyA08w0Y0drkEphLfK7ILngKALFo6cVf63VFc/IsUIC
 gR9EYa3Ke7a5IrJIctIGw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q3YgTbjymMA=:oBWINhkR6H61NHwj8lE0bs
 py3tSM63rs4wmotzFRhKD0nXOiU0erBQ9xuzq79qGgfRnufqvHft5rlMmtxtx+wdfvySy84kk
 8FDMMsaJ2qi47DVeEOtGImn6jJ7GcDw1A/K4o5JoqTOgbhmvM/4c2PKG+T5Rw5UTLx+dLxV+v
 +qREfEkxsJQKB0+3Lwv+PwSICZrzMRUJj/Z6CQzed+6NdqVV2a1xv3UzqkF7W1zY/PW0nxx0x
 aXcRKSec3SpD2KYIcxU0aHDaWaxUK4kU0auv9SFHaNYRJUrIFwitkCwfWinIYIJEsdW8J9JNP
 qlhEGbJPLW0sTWpy/q2GLSehSWbW8g3bSt4KVO0w4Q/dd/ubKwPDr865R96/j99q0tMPnCOIi
 lXjFFthDNIqmDrM0AQBL6czf/MxbmTJDxK94fnF9ehdGn0S/msat2lXRs06zyn6FD8q4s2QBy
 yc2OWlAx/GzYUP6QfSsxIfSgheSjQFCAjbCzXBoXCGZyzpzTRYkvdiBAGr9lJ9sUXm4q9PSs9
 uCt+zqyTDGDV9l9IaLlN6/oN4BVsDAqMyy2tUHoyeYf191H5n2luKgLCmycdWO67+2PbFMc4w
 pDA8My2Rfk/4Wk2sy1goUIFqkKwA+oST7t6MSzL3VHEzCIFrW5U/cjh1wJEhWzPSPwt5NuQGG
 cEIUSybVoQLSykbz2+W6YfMxsJ/HoxfaBESgPqAR2mxssm7eJcz4MdbSDMNA0vmn3S/e5rhhj
 XwOC4L3AelyBt/PH8wOatW6AltnaEBU452LmYSqxvMqafMNBrfrWdMzfzt86utwNUGGsNeMNS
 aHhbo3vzGu+020BJ2AbDGPjb/jPUxjm/HB8vnrgtn/u+V2iydfh6gZJGhbRXR2FGuNCT9FhvF
 izuS7UQN6tRaXH37xIYA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Jan-Simon M=C3=B6ller <jsmoeller@linuxfoundation.org>

rpm packaging has shown good numbers wrt reproducible builds as well
when testing core-image-minimal locally:

 Reproducibility summary for rpm: same=3D4671 different=3D0 missing=3D0 to=
tal=3D4671

Thus enable it in the autobuilder to be more widely tested.

(From OE-Core rev: 84d3a90557444d8cd83d780b1c3f2b278ab07af2)

Signed-off-by: Jan-Simon M=C3=B6ller <jsmoeller@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
=2D--
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/=
selftest/cases/reproducible.py
index 0963c2f11a..9785c5ffac 100644
=2D-- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -173,7 +173,7 @@ class DiffoscopeTests(OESelftestTestCase):
             self.assertTrue(os.path.exists(os.path.join(tmpdir, 'index.ht=
ml')), "HTML index not found!")

 class ReproducibleTests(OESelftestTestCase):
-    package_classes =3D ['deb', 'ipk']
+    package_classes =3D ['deb', 'ipk', 'rpm']
     images =3D ['core-image-minimal', 'core-image-sato', 'core-image-full=
-cmdline', 'world']
     save_results =3D False
     if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
=2D-
2.26.2

