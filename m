Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U5QMR-0001zK-2o for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 01:38:10 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1D0S1tn008046 for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 00:28:01 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kM-adxvvqrcP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 00:28:01 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1D0RsOO008043
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 00:27:58 GMT
Message-ID: <1360714913.11225.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Feb 2013 00:21:53 +0000
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Subject: [PATCH] multilib: Fix an OVERRIDES expansion order issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2013 00:38:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There were problems where a SRC_URI with:

SRC_URI_append_powerpc = " xxx"
SRC_URI_append_powerpc64 = " xxx2"

would end up with *both* xxx and xxx2 being added when using a multilib
which is clearly incorrect and undesirable.

The issue is that OVERRIDES has virtclass-multilib-xxxx added to it,
this eventually changed DEFAULTTUNE which then changes
TRANSLATED_TARGET_ARCH which is in OVERRIDES meaning we then need to
re-evaluate the overides and the TRANSLATED_TARGET_ARCH gets applied
twice since once you apply an override, it doesn't get undone.

Expanding DEFAULTTUNE to the correct value in advance avoids the issue
and means only the correct overrides get applied.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 5454b4c..d52f721 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -51,6 +51,11 @@ python multilib_virtclass_handler () {
     e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
     e.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant ,e.data.getVar("SHL
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
+
+    # DEFAULTTUNE can change TARGET_ARCH override so expand this now before update_data
+    newtune = e.data.getVar("DEFAULTTUNE_" + "virtclass-multilib-" + variant)
+    if newtune:
+        e.data.setVar("DEFAULTTUNE", newtune)
 }
 
 addhandler multilib_virtclass_handler



