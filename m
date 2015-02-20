Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 384C573651
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 17:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1KHfqkQ028493 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 17:41:52 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id q2r6V_gU7sfY
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 17:41:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1KHffOx028485
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 17:41:52 GMT
Message-ID: <1424454101.11836.52.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Feb 2015 17:41:41 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] lib/oe/package_manager: Performance tweak in regex usage
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
X-List-Received-Date: Fri, 20 Feb 2015 17:41:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Profiling a core-image-sato-sdk rootfs, we're spending over 40s
compiling the same regex over and over again, roughly around 5 million
times.

This is suboptimal, fix for a 40s improvement on a 18.5minute task execution
time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f801333..69bef1d 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -679,10 +679,10 @@ class RpmPM(PackageManager):
     def _search_pkg_name_in_feeds(self, pkg, feed_archs):
         for arch in feed_archs:
             arch = arch.replace('-', '_')
+            regex_match = re.compile(r"^%s-[^-]*-[^-]*@%s$" % \
+                (re.escape(pkg), re.escape(arch)))
             for p in self.fullpkglist:
-                regex_match = r"^%s-[^-]*-[^-]*@%s$" % \
-                    (re.escape(pkg), re.escape(arch))
-                if re.match(regex_match, p) is not None:
+                if regex_match.match(p) is not None:
                     # First found is best match
                     # bb.note('%s -> %s' % (pkg, pkg + '@' + arch))
                     return pkg + '@' + arch




