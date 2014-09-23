Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3E52571552
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NJ14H9006841 for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:01:04 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id c9fAC0TgycVL
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:01:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NJ0wIt006837
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:00:59 +0100
Message-ID: <1411498861.15825.57.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Sep 2014 20:01:01 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] layer.conf: Mark opkg-utils as ABISAFE for update-alternatives usage
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
X-List-Received-Date: Tue, 23 Sep 2014 19:01:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently linux-firmware rebuilds for each machine due to its usage of
update-alternatives which in turn means a dependency on opkg-utils.
Marking opkg-utils as ABISAFE is the only option we have right now
to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 4deee89..de96548 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -14,6 +14,7 @@ LAYERVERSION_core = "4"
 # Set a variable to get to the top of the metadata location
 COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'
 
+# opkg-utils is for update-altnernatives :(
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   sysvinit-inittab \
   shadow-securetty \
@@ -34,6 +35,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   shadow \
   shadow-sysroot \
   base-passwd \
+  opkg-utils \
 "
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \



