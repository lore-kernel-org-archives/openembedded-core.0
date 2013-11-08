Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BE7136D614
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 15:19:26 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA8FJFeR025016; Fri, 8 Nov 2013 15:19:15 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JC7TAey4A5qZ; Fri,  8 Nov 2013 15:19:15 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA8FJ9YW025012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 8 Nov 2013 15:19:10 GMT
Message-ID: <1383923945.2345.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 08 Nov 2013 15:19:05 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: [PATCH] lib/oe/path: Fix performance issue got copyhardlinktree()
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
X-List-Received-Date: Fri, 08 Nov 2013 15:19:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

With the directory copy was added to avoid race issues, it wasn't noticed that
tar was recursing the directories and copying files too. This is completely
crazy when we hardlink those files in the next command.

Resolve the issue by telling tar not to recurse. This gives a significant
performance boost to various parts of the system (do_package for linux-yocto
256s -> 178s for example).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 1310e38..d0588ba 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -93,7 +93,7 @@ def copyhardlinktree(src, dst):
     if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
         # Need to copy directories only with tar first since cp will error if two 
         # writers try and create a directory at the same time
-        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --files-from - | tar -xf - -C %s' % (src, src, dst)
+        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --files-from - --no-recursion | tar -xf - -C %s' % (src, src, dst)
         check_output(cmd, shell=True, stderr=subprocess.STDOUT)
         if os.path.isdir(src):
             src = src + "/*"



