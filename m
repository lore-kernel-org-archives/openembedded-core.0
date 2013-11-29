Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id AAD426C73E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 14:36:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rATEaqnP010620 for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 14:36:52 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fmVUtoo-iRcM
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 14:36:52 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rATEajn0010605
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 14:36:47 GMT
Message-ID: <1385735802.11222.62.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Nov 2013 14:36:42 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] image.bbclass: Depend on virtual/kernel:do_deploy
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
X-List-Received-Date: Fri, 29 Nov 2013 14:36:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Now that none of the packagegroups depend on virtual/kernel, we have the problem
that MACHINE=qemumips bitbake core-image-minimal doesn't put a kernel
into the deploy directory. This breaks many common usecases and
user expectations.

To avoid this, add a dependency on the kernel deploy to image do_build tasks.
This should avoid any circular dependency issues but equally ensure users
have their expectations met.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 8217fb3..cc65e35 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -90,6 +90,8 @@ do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-nati
 do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_packagedata"
 
+do_build[depends] += "virtual/kernel:do_deploy"
+
 def build_live(d):
     if base_contains("IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
         d.setVar('NOISO', base_contains('IMAGE_FSTYPES', "iso", "0", "1", d))



