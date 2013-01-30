Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U0Ybo-0002FG-5i
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 15:25:59 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE662s007211; Wed, 30 Jan 2013 14:06:09 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lJI7wrZWj57Q; Wed, 30 Jan 2013 14:06:09 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE63Eo007179
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Jan 2013 14:06:04 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U0YDz-00083O-Dj; Wed, 30 Jan 2013 14:01:15 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 14:01:02 +0000
Message-Id: <2c520fa8255380e266428f9a6775dd9317d13183.1359554291.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
References: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 09/17] package.bbclass: Avoid copying the datastore for FILES handling
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
X-List-Received-Date: Wed, 30 Jan 2013 14:26:08 -0000

There is no real point in adjusting overrides and creating a copy of the datastore,
just to access a single variable. We can do this just as easily with a slightly
more complicated getVar call. This improves performance.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |   11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 51ab009..4e7db9a 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -949,18 +949,10 @@ python populate_packages () {
     seen = []
 
     for pkg in package_list:
-        localdata = bb.data.createCopy(d)
         root = os.path.join(pkgdest, pkg)
         bb.mkdirhier(root)
 
-        localdata.setVar('PKG', pkg)
-        overrides = localdata.getVar('OVERRIDES', True)
-        if not overrides:
-            raise bb.build.FuncFailed('OVERRIDES not defined')
-        localdata.setVar('OVERRIDES', overrides + ':' + pkg)
-        bb.data.update_data(localdata)
-
-        filesvar = localdata.getVar('FILES', True) or ""
+        filesvar = d.getVar('FILES_%s' % pkg, True) or d.getVar('FILES', True) or ""
         if "//" in filesvar:
             bb.warn("FILES variable for package %s contains '//' which is invalid. Attempting to fix this but you should correct the metadata.\n" % pkg)
             filesvar.replace("//", "/")
@@ -1023,7 +1015,6 @@ python populate_packages () {
             if ret is False or ret == 0:
                 raise bb.build.FuncFailed("File population failed")
 
-        del localdata
     os.chdir(workdir)
 
     unshipped = []
-- 
1.7.10.4



