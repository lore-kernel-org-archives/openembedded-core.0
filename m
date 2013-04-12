Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UQhOU-0000Tg-JN for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 19:04:18 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3CGkisT017097 for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 17:46:44 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lO7OX__t5O2Z
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 17:46:44 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3CGkcDu017093
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 17:46:41 +0100
Message-ID: <1365785190.16702.65.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Apr 2013 17:46:30 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] multilib.conf: Workaround opkg multilib issues
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
X-List-Received-Date: Fri, 12 Apr 2013 17:04:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Multilib with opkg hasn't worked since the --force-overwrite option was dropped in
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=88a9f6db3482623c9cb54fb03db1045051cec9f6

Since we merged the libexecdir changes, we also need the --force-maintainer flag
to avoid conf file conflicts.

Both these changes are suboptimal however the alternative is completely broken and
these changes only affect people who have multilibs enabled and use opkg.

[YOCTO #3453]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 9a129f1..9ff06cc 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -14,3 +14,5 @@ INHERIT += "multilib_global"
 BBCLASSEXTEND_append = " ${MULTILIBS}"
 
 MULTILIB_GLOBAL_VARIANTS  = "lib32 lib64 libx32"
+
+OPKG_ARGS_append = " --force-maintainer --force-overwrite"




