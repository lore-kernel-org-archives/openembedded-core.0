Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BFA56601B8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 22:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0HMPNeQ010614 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 22:25:23 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wUObEsVbCEEE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 22:25:23 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0HMPKLU010611
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 22:25:21 GMT
Message-ID: <1453069520.27999.28.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jan 2016 22:25:20 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] image: Handle image types containing '-' correctly
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
X-List-Received-Date: Sun, 17 Jan 2016 22:25:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Shell function names can't contain '-' characters, which means our image
task names also can't. Add some mapping to use '_' instead of the '-' so
images like "rpi-sdimg" work again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 58b75da..e81edb2 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -393,6 +393,12 @@ python () {
         else:
             subimages.append(realt)
 
+        after = 'do_image'
+        for dep in typedeps[t]:
+            after += ' do_image_%s' % dep.replace("-", "_")
+
+        t = t.replace("-", "_")
+
         d.setVar('do_image_%s' % t, '\n'.join(cmds))
         d.setVarFlag('do_image_%s' % t, 'func', '1')
         d.setVarFlag('do_image_%s' % t, 'fakeroot', '1')
@@ -402,10 +408,6 @@ python () {
         d.appendVarFlag('do_image_%s' % t, 'vardeps', ' '.join(vardeps))
         d.appendVarFlag('do_image_%s' % t, 'vardepsexclude', 'DATETIME')
 
-        after = 'do_image'
-        for dep in typedeps[t]:
-            after += ' do_image_%s' % dep
-
         bb.debug(2, "Adding type %s before %s, after %s" % (t, 'do_image_complete', after))
         bb.build.addtask('do_image_%s' % t, 'do_image_complete', after, d)
 }



