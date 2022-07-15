Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A06AC43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 11:55:35 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web11.5591.1657886126975703513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com
 header.s=first header.b=GuCTgwKs;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from zen.. (unknown [185.17.218.86])
	by first.geanix.com (Postfix) with ESMTPSA id D584BE949D;
	Fri, 15 Jul 2022 11:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1657886123; bh=STkuUBNwMOZpucOvvfiAQouUv+pyjkM4SyJxU41fVzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GuCTgwKsFQWe9ISHOa9C2Wbfbjl19fHFu03k4uGlpeXLpKX0bxpSgGn34aRlk7u0W
	 kk4BvHM+DTsa3PxPngtucFUZRSTt8wdNAQVX/HLMp9li6Dza5O8xZAK5pwbSLz77I3
	 gAZ0DSoHa0fagiIawSods2BM0IF1Ku/URU8x8dXDHqn4HY6kg5e97g7ezfrCVCkQXu
	 8kL4Gl04ULm3Y5LKonWq1HPRSge+GXozzLn6Hk3OY6YMXmuTmYzbVsz+8KPcAcryR5
	 XJOxg/OR+qLM68kF2POo3mwtBkS+RHOiRbCGNOSRVFiPUCExzzXFcEECTcMXAlpi5X
	 /5Jwm+I1PWXPw==
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org,
	denis@denix.org,
	richard.purdie@linuxfoundation.org,
	raj.khem@gmail.com
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [OE-core] [PATCH v2 2/2] zlib: minizip: add recipe
Date: Fri, 15 Jul 2022 13:55:15 +0200
Message-Id: <20220715115515.4012984-2-sean@geanix.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220715115515.4012984-1-sean@geanix.com>
References: <20220715115515.4012984-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 11:55:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168060

Add the minizip library for use as a dependency.
zlib doesn't support vanilla autotools, but atleast this minizip does.
minizip does depend on zlib, so combining these recipes turns out to be
a quite hacky approach.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
Should we keep Denys Dmytriyenko <denis@denix.org> as maintainer here?
It's after all the same artifact that is used for both recipes?

 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-core/zlib/minizip_1.2.12.bb | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-core/zlib/minizip_1.2.12.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index a69af3d780..1db5cadbcf 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -506,6 +506,7 @@ RECIPE_MAINTAINER:pn-meta-world-pkgdata =3D "Richard =
Purdie <richard.purdie@linuxf
 RECIPE_MAINTAINER:pn-mingetty =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-mini-x-session =3D "Unassigned <unassigned@yoctopro=
ject.org>"
 RECIPE_MAINTAINER:pn-minicom =3D "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-minizip =3D "Sean Nyekjaer <sean@geanix.com>"
 RECIPE_MAINTAINER:pn-mkfontscale =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
 RECIPE_MAINTAINER:pn-mmc-utils =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-mobile-broadband-provider-info =3D "Alexander Kanav=
in <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-core/zlib/minizip_1.2.12.bb b/meta/recipes-core=
/zlib/minizip_1.2.12.bb
new file mode 100644
index 0000000000..548bb8c62b
--- /dev/null
+++ b/meta/recipes-core/zlib/minizip_1.2.12.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "Minimal zip library using deflate from zlib"
+HOMEPAGE =3D "http://zlib.net/"
+SECTION =3D "libs"
+LICENSE =3D "Zlib"
+LIC_FILES_CHKSUM =3D "file://MiniZip64_info.txt;beginline=3D53;endline=3D=
73;md5=3D02090b3a3511ed8a910b77dae6906cea"
+
+include zlib.inc
+
+inherit autotools
+
+DEPENDS =3D "zlib"
+
+S =3D "${WORKDIR}/zlib-${PV}/contrib/minizip"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.37.0


