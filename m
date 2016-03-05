Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3C72073195
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 09:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u259Zp8w003897 for <openembedded-core@lists.openembedded.org>;
	Sat, 5 Mar 2016 09:35:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ya3DEZMOxed2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 09:35:51 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u259ZlCZ003893
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 5 Mar 2016 09:35:49 GMT
Message-ID: <1457170547.2804.68.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 05 Mar 2016 09:35:47 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] createrepo: Fix stat floating timestamps
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
X-List-Received-Date: Sat, 05 Mar 2016 09:35:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When reading the mtime from disk, the system can get a floating point
value. Convert this to an int for comparision purposes, else some
packages always get reindexed as the value in the index is an int.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-support/createrepo/createrepo/fixstat.patch b/meta/recipes-support/createrepo/createrepo/fixstat.patch
new file mode 100644
index 0000000..d34eb56
--- /dev/null
+++ b/meta/recipes-support/createrepo/createrepo/fixstat.patch
@@ -0,0 +1,19 @@
+When reading the mtime from disk, the system can get a floating point 
+value. Convert this to an int for comparision purposes, else some
+packages always get reindexed as the value in the index is an int.
+RP 2016/3/2
+Upstream-Status: Pending
+
+Index: createrepo-0.4.11/readMetadata.py
+===================================================================
+--- createrepo-0.4.11.orig/readMetadata.py
++++ createrepo-0.4.11/readMetadata.py
+@@ -126,7 +126,7 @@ class MetadataIndex(object):
+             if self.opts.get('verbose'):
+                 print _("Size (%i -> %i) changed for file %s") % (size,st.st_size,filepath)
+             return
+-        if st.st_mtime != mtime:
++        if int(st.st_mtime) != mtime:
+             if self.opts.get('verbose'):
+                 print _("Modification time changed for %s") % filepath
+             return
diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
index 5f9ecf6..2a3231b 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://createrepo.baseurl.org/download/${BP}.tar.gz \
            file://createrepo-dbpath.patch \
            file://dumpMetadata-disable-signature-validation.patch \
            file://rpm-createsolvedb.py \
+           file://fixstat.patch \
            "
 
 SRC_URI[md5sum] = "3e9ccf4abcffe3f49af078c83611eda2"



