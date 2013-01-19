Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TwiMv-0001D6-MA for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 01:02:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0JNlBO9004709
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 23:47:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05490-10 for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 23:47:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0JNl3FW004703
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 23:47:05 GMT
Message-ID: <1358639222.14265.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 19 Jan 2013 23:47:02 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: package.bbclass: Fix shlibs cross package-arch contamination
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
X-List-Received-Date: Sun, 20 Jan 2013 00:02:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I found that if I had two packages architectures built (say core2 and i586),
that the shlibs data from i586 was being used in the core2 build. This
lead to odd dependency issues if the i586 build was out of date and core2
was being targetted.

When loading shlibs files, the last loaded wins so we need to iterate the
lists from least to strongest weighting, not the other way around. With this
patch applied, the contamination issue is resolved.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index b06cca5..66bf4ba 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1521,7 +1521,8 @@ python package_do_shlibs() {
             d.setVar('pkg_postinst_%s' % pkg, postinst)
 
     list_re = re.compile('^(.*)\.list$')
-    for dir in shlibs_dirs:
+    # Go from least to most specific since the last one found wins
+    for dir in reversed(shlibs_dirs):
         if not os.path.exists(dir):
             continue
         for file in os.listdir(dir):
@@ -1643,7 +1644,8 @@ python package_do_pkgconfig () {
                 f.write('%s\n' % p)
             f.close()
 
-    for dir in shlibs_dirs:
+    # Go from least to most specific since the last one found wins
+    for dir in reversed(shlibs_dirs):
         if not os.path.exists(dir):
             continue
         for file in os.listdir(dir):




