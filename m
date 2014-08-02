Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DCACC6FE5B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 08:47:37 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s728lcJW003056 for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Aug 2014 09:47:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0_w2j6W8Gd5y
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 09:47:38 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s728lXKC002841
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Aug 2014 09:47:35 +0100
Message-ID: <1406969253.6981.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 02 Aug 2014 09:47:33 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] autotools: Fix warning for odctools-crosssdk
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
X-List-Received-Date: Sat, 02 Aug 2014 08:47:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

odcctools-crosssdk doesn't use the suffixed naming the rest of crosssdk does
and this results in a annoying build warning. Avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 2136504..569b2e5 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -187,7 +187,7 @@ python autotools_copy_aclocals () {
             manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}-%s.populate_sysroot" % c)
         elif c.startswith("nativesdk-"):
             manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${SDK_ARCH}_${SDK_OS}-%s.populate_sysroot" % c)
-        elif "-cross-" in c or "-crosssdk-" in c:
+        elif "-cross-" in c or "-crosssdk" in c:
             continue
         else:
             manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${MACHINE}-%s.populate_sysroot" % c)



