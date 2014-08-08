Return-Path: <sujith.h@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6D45765C68
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 09:40:43 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id b13so5321044wgh.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 02:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=h7NaEks3K8rSli455VqN25PPoRM7d5qY8KeogsJKD6U=;
	b=rvWMFDnfYbjxeFMDe7tFAYWEQy4kXf/AS+9kuSHGcoCXUPVUjPhqXk2yeW5ydfmNNX
	0B+rwTTmyL4jkqp92OoukuP+HnEYFO7wcW4vA7LuK+GHnT2Lig0z+CJ6/ABopMI93YU6
	LE0ooaEJ1tHdB0KYhXMwyaenVCfKtSoJrxfktEAV8wtJSjBqptwoKBoF9Wf33nciwCNp
	oiuqJR8XMSSwwyNhyNOwN4nUbsiHal+tuIy1u8jBeGo0ljqu7OpCpq6t9UFoPIRUxt49
	joxcCGZqbZcPvITjg5yur/AxuDzRqexrxbgdumlpI/LgPg7rlielJ8bhG6tnzDEHD5J6
	yAsg==
X-Received: by 10.194.121.65 with SMTP id li1mr31098320wjb.10.1407490844236;
	Fri, 08 Aug 2014 02:40:44 -0700 (PDT)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	ex2sm16093122wjd.30.2014.08.08.02.40.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 02:40:43 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 15:07:25 +0530
Message-Id: <1407490645-15678-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: [PATCH] opkg-utils: allow disabling update-alternatives
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
X-List-Received-Date: Fri, 08 Aug 2014 09:40:46 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

This is needed to deal with the situation where we're using ipk packaging, so
opkg-utils must be built regardless of what update-alternatives provider we
prefer. The downside to the current implementation is the need to adjust
PACKAGECONFIG as well as PREFERRED_PROVIDER, but it is more explicit that way.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 693c216..287bf53 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -19,11 +19,15 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 PYTHONRDEPS = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
 PYTHONRDEPS_class-native = ""
 
-PACKAGECONFIG = "python"
+PACKAGECONFIG = "python update-alternatives"
 PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
+PACKAGECONFIG[update-alternatives] = ",,,"
 
 do_install() {
 	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+        if ${@'true' if 'update-alternatives' not in PACKAGECONFIG.split() else 'false'}; then
+            rm -f "${D}${bindir}/update-alternatives"
+        fi
 }
 
 PACKAGES =+ "update-alternatives-opkg"
-- 
1.8.4


