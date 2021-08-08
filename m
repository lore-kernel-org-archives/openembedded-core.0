Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by mx.groups.io with SMTP id smtpd.web09.6520.1628398290522218397
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Aug 2021 21:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ozlabs.org header.s=201707 header.b=AeWVemBq;
 spf=pass (domain: ozlabs.org, ip: 203.11.71.1, mailfrom: anton@ozlabs.org)
Received: by ozlabs.org (Postfix, from userid 1010)
	id 4Gj6Hg4tJbz9sWq; Sun,  8 Aug 2021 14:51:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1628398287;
	bh=gnSi7Os6jst+a6kjLOW1ftJWPBQhW/gge4YJqjR+j9s=;
	h=From:To:Subject:Date:From;
	b=AeWVemBqDgOaare5n+AC8uBr/6vkUDgixZ2ZidzLuw+JrBZTq8yzjZpSwVeEbHsAO
	 PUeNI2LzbrvNLuga15jpWcWpKwZdCd5/qGriybZ4rx31HeRO70d69dy0lTDSRZvaJe
	 qXhX7swcV1FAU9SbtVPdh79UijahesjpJeujq4mEhJjuIAaSArVqA7AViLAmsW+8PF
	 5/d9Uf8FvfBQAudnYhCwnmbjjvLZnnDR+U60s2MjpA+tciGp8t4/7vLBsWwAlmHZPh
	 2YKBe3QxfbCYwlH91WCL+KbnLgEods7Fdq8Jb8DnA7qkO4NUjfa2hq1aSBZkzlvIIg
	 Zdmv7nu2z1Yvg==
From: "Anton Blanchard" <anton@ozlabs.org>
To: openembedded-core@lists.openembedded.org,
	anuj.mittal@intel.com
Subject: [PATCH] pixman: Handle PowerPC without Altivec
Date: Sun,  8 Aug 2021 14:51:21 +1000
Message-Id: <20210808045121.2498393-1-anton@ozlabs.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Configure with -Dvmx=3Denabled/disabled based on the Altivec feature.

Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recip=
es-graphics/xorg-lib/pixman_0.40.0.bb
index 5a3bb22ec3..723af72796 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
@@ -32,4 +32,8 @@ EXTRA_OEMESON =3D "-Dgtk=3Ddisabled -Dlibpng=3Ddisabled=
"
 # linking mips:loongson_2f module with previous mips:isa64 modules=20
 EXTRA_OEMESON +=3D "-Dloongson-mmi=3Ddisabled"
=20
+EXTRA_OEMESON:append:class-target:powerpc =3D " ${@bb.utils.contains("TU=
NE_FEATURES", "altivec", "-Dvmx=3Denabled", "-Dvmx=3Ddisabled", d)}"
+EXTRA_OEMESON:append:class-target:powerpc64 =3D " ${@bb.utils.contains("=
TUNE_FEATURES", "altivec", "-Dvmx=3Denabled", "-Dvmx=3Ddisabled", d)}"
+EXTRA_OEMESON:append:class-target:powerpc64le =3D " ${@bb.utils.contains=
("TUNE_FEATURES", "altivec", "-Dvmx=3Denabled", "-Dvmx=3Ddisabled", d)}"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.31.1

