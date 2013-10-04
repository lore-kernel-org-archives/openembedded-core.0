Return-Path: <rpurdie@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 2FFE660FA6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 11:27:01 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r94BQwMh004403 for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Oct 2013 12:26:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Xz51q0sGLVyp
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 12:26:58 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r94BQtsW004400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Oct 2013 12:26:57 +0100
Message-ID: <1380886011.18603.594.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Oct 2013 12:26:51 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] pixman: Fix nativesdk rebuilds for armv7a
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
X-List-Received-Date: Fri, 04 Oct 2013 11:27:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

MACHINE=X bitbake nativesdk-pixman; MACHINE=Y bitbake nativesdk-pixman

where X is an armv7a machine and Y is not results in pixman rebuilding
due to the neon option. This is incorrect. The ultimate fix will be
not to apply target system overrides in the nativesdk case. Until
we do that we can at least work around the issue as done by this patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.30.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.30.2.bb
index 742a066..36d9b2d 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.30.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.30.2.bb
@@ -20,6 +20,7 @@ PE = "1"
 IWMMXT = "--disable-arm-iwmmxt"
 LOONGSON_MMI = "--disable-loongson-mmi"
 NEON = " --disable-arm-neon "
+NEON_class-nativesdk = " --disable-arm-neon "
 NEON_armv7a = " "
 NEON_armv7a-vfp-neon = " "
 



