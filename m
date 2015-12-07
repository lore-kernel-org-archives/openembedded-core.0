Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3EE2260124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 18:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tB7IRjJv021380 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Dec 2015 18:27:45 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JY1VPl6ulDwZ
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 18:27:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tB7IRTTt021376
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Dec 2015 18:27:40 GMT
Message-ID: <1449512849.19730.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 07 Dec 2015 18:27:29 +0000
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] site/common-linux: Add some macros to avoid sleeps during configure
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
X-List-Received-Date: Mon, 07 Dec 2015 18:27:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If you profile gettext do_configure you notice it has some "sleep 1"
type events occurring. This patch ensures we cache the right values to
avoid those pointless delays there and in any other configure scripts
using the same macros.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/site/common-linux b/meta/site/common-linux
index 8b5be68..448758b 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -1,3 +1,7 @@
+# gettext - these add sleep delays otherwise
+gl_cv_func_sleep_works=${gl_cv_func_sleep_works=yes}
+gl_cv_header_working_fcntl_h=${gl_cv_header_working_fcntl_h=yes}
+
 # apr
 ac_cv_file__dev_zero=${ac_cv_file__dev_zero=yes}
 ac_cv_sizeof_pid_t=${ac_cv_sizeof_pid_t=4}



