Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 89BA16E7E2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 14:40:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0REdv2V002032 for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 14:39:58 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5X5q_w-RBDSZ
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 14:39:57 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0REdsRk002005
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 14:39:55 GMT
Message-ID: <1390833588.17424.254.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jan 2014 14:39:48 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Mon, 27 Jan 2014 14:40:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Its rather sad that people don't appear to read local.conf and then complain
about slow builds when they're just using a single thread. Most systems have
more than one core now so we might as well use a more automatic default
for these values. This may lead to better experiences for new users.

[YOCTO #2528]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 71856b8..36d33e1 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -18,12 +18,18 @@
 # option determines how many tasks bitbake should run in parallel:
 #
 #BB_NUMBER_THREADS ?= "4"
+#
+# Default to setting automatically based on cpu count
+BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
 # 
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
 #PARALLEL_MAKE ?= "-j 4"
 #
+# Default to setting automatically based on cpu count
+PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
+#
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example.
 



