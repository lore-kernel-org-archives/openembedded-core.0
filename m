Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3FDC86F905
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 13:32:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2IDW4OH027768 for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 13:32:04 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rT0I_LySzUVH
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 13:32:04 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2IDW10j027764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 13:32:03 GMT
Message-ID: <1395149516.3808.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Mar 2014 13:31:56 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] autotools: Exclude variables from autotools_copy_aclocals
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
X-List-Received-Date: Tue, 18 Mar 2014 13:32:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The autotools aclocal copy function should not depend on various variables, these
are accounted for in other parts of the system. Therefore exclude them.

This was causing differences in sstate checksums between different systems and meaning
the sstate cache wasn't being reused as much as it should.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 15fcfc6..f8c9b1e 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -175,7 +175,7 @@ python autotools_copy_aclocals () {
         if not os.path.exists(t):
             os.symlink(c, t)
 }
-autotools_copy_aclocals[vardepsexclude] += "MACHINE"
+autotools_copy_aclocals[vardepsexclude] += "MACHINE SDK_ARCH BUILD_ARCH BB_TASKDEPDATA"
 
 autotools_do_configure() {
 	# WARNING: gross hack follows:



