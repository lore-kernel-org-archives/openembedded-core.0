Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1USUR5-0000rM-K0 for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 17:38:17 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3HFL9bT026477 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 16:21:09 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8aZxN1XxDlo9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 16:21:09 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3HFL6Md026474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 16:21:08 +0100
Message-ID: <1366212033.25282.35.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2013 16:20:33 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] package.bbclass: Fix populate_packages for glob expansion issues
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
X-List-Received-Date: Wed, 17 Apr 2013 15:38:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If we put a valid glob like "*/foo/*" into FILES, populate_packages
breaks with a "file exists" message. This is because the glob expansion
does not have "./" prefix however there may already be an entry in
the seen list which does have such a prefix. The easiest/simplest fix
right now is to add the prefix if it doesn't exist which only happens
for certain globs.

(From OE-Core rev: 3c6b1730412e3c5b6f628a70b854c0631e7bd9dc)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4e9b79e..5765e12 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -946,6 +946,8 @@ python populate_packages () {
         for file in files:
             if os.path.isabs(file):
                 file = '.' + file
+            if not file.startswith("./"):
+                file = './' + file
             if not cpath.islink(file):
                 if cpath.isdir(file):
                     newfiles =  [ os.path.join(file,x) for x in os.listdir(file) ]




