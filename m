Return-Path: <>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.openembedded.org (Postfix) with ESMTP id DDB027E27B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 19:36:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DJaREY031644
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 14:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568403387;
	bh=qiU73pXQpz/qAUbSLTwonBya4jIQcdEwB+UIm3AyjF4=;
	h=From:To:CC:Subject:Date;
	b=f5rCoSMpUzxzO9CnlGXk20rwTzYv66WMai0ioqD/EM+vMceUK4tfxk6Of4hwl7uZH
	Qo3CDMnCgNc3jTpF93oaHG0xczrrzpp4z6dVdPOKE9mBfW74o0/+gYR58AShmBUwpk
	nlZJeagQMkGYdKNY3Zum99my6VAsRbIAsSLSWD9c=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DJaRsc065911
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 14:36:27 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 13 Sep 2019 14:36:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 13 Sep 2019 14:36:26 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DJaRjY033699;
	Fri, 13 Sep 2019 14:36:27 -0500
Received: from localhost ([10.250.95.88])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8DJaMZ27525; Fri, 13 Sep 2019 14:36:22 -0500 (CDT)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Gowtham Tammana <g-tammana@ti.com>, Eric
	Ruei <e-ruei1@ti.com>
Date: Fri, 13 Sep 2019 15:36:11 -0400
Message-ID: <20190913193614.4882-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] libepoxy: Disable x11 when not building for x11
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
X-List-Received-Date: Fri, 13 Sep 2019 19:36:27 -0000
Content-Type: text/plain

Although glx support is turned off, the build still tries to pull in some
x11 components, disable x11 explicitly.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
index c8d1650c63..825453ab28 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
@@ -18,7 +18,7 @@ REQUIRED_DISTRO_FEATURES_class-native = ""
 REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
 
 PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
-PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no, virtual/libx11 virtual/libgl"
+PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no -Dx11=false, virtual/libx11 virtual/libgl"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
 
 EXTRA_OEMESON += "-Dtests=false"
-- 
2.17.1


