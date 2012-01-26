Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RqVnC-0003in-N5 for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 21:19:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QKBjf1027731
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 20:11:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26041-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 20:11:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QKBcRd027725
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 20:11:39 GMT
Message-ID: <1327608701.19643.398.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jan 2012 20:11:41 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] useradd.bbclass: Add explict setscene dependencies to ensure correct ordering of setscene tasks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2012 20:19:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is the final piece of fixing the races in the useradd class by
ensuring base-passwd, shadow-native and shadow-sysroot are installed
before sstate packages which use useradd.

[YOCTO #1721]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

NB: This patch depends on a change in bitbake to work but is harmless
without that change, just won't fix the race.

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 6ee575e..9677fe2 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -111,6 +111,8 @@ SYSROOTPOSTFUNC = "useradd_sysroot_sstate"
 SYSROOTPOSTFUNC_virtclass-native = ""
 SYSROOTPOSTFUNC_virtclass-nativesdk = ""
 
+do_package_setscene[depends] = "base-passwd:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene shadow-sysroot:do_populate_sysroot_setscene"
+
 # Recipe parse-time sanity checks
 def update_useradd_after_parse(d):
 	useradd_packages = d.getVar('USERADD_PACKAGES', True)




