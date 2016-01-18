Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 76BDF605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0IEQ4mJ019208 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:26:04 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CzVBrrb0A2dg
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:26:04 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0IEPxtL019204
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:26:00 GMT
Message-ID: <1453127159.27999.62.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 14:25:59 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] image: Always run do_rootfs_wicenv
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
X-List-Received-Date: Mon, 18 Jan 2016 14:26:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The wic command can be used externally but for this to work, the wic
environment file needs to be present. Therefore write this out
universally, it runs in parallel with other image construction so
any performance implications are negligible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index e81edb2..3870516 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -277,7 +277,7 @@ python do_rootfs_wicenv () {
             if value:
                 envf.write('%s="%s"\n' % (var, value.strip()))
 }
-addtask do_rootfs_wicenv after do_rootfs before do_image_wic
+addtask do_rootfs_wicenv after do_rootfs before do_image_wic do_image_complete
 do_rootfs_wicenv[vardeps] += "${WICVARS}"
 do_rootfs_wicenv[prefuncs] = 'set_image_size'
 



