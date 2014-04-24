Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E680265D26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 09:17:33 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3O9HSBx005344 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 10:17:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WJr0RsEu_1_g
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 10:17:28 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3O9HNiR005330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 10:17:24 +0100
Message-ID: <1398331038.16672.171.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Apr 2014 10:17:18 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] utils: Add hardlinkdir shell function
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
X-List-Received-Date: Thu, 24 Apr 2014 09:17:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In a number of places it would be helpful to be able to copy trees of
files using hardlinks. This turns out to be harder than you'd expect
since there is no good single command that does this well and handles
all file types correctly.

Abstracting this into a function therefore makes sense, cpio seems
as good an option as any other. We do require two passes due to the
way cpio handles symbolic links.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 0a533af..91895ec 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -292,6 +292,17 @@ END
 	chmod +x $cmd
 }
 
+# Copy files/directories from $1 to $2 but using hardlinks
+# Have to do this in two passes to handle symbolic links correctly due to
+# the way cpio handles this combination of options.
+hardlinkdir () {
+	from=$1
+	to=$2
+	(cd $from; find . -print0 | cpio --null -pdlu $to)
+	(cd $from; find . -type l -print0 | cpio -pd0mLu --no-preserve-owner $to)
+}
+
+
 def check_app_exists(app, d):
     app = d.expand(app)
     path = d.getVar('PATH', d, True)



