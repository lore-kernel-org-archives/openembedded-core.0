Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw4z-0008IC-Vp
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:14:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0MSR008430
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:22 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:22 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:42 -0600
Message-ID: <d9cb3d054dacf0dabe8c699a458bdcd14f021f43.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 10/22] createrepo: implement support for recommends
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
X-List-Received-Date: Tue, 04 Dec 2012 17:14:49 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Adds a flag into the output metadata to note recommends relationships
in a way that should not break compatibility with clients that don't
understand this flag.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../createrepo/createrepo/recommends.patch         |   71 ++++++++++++++++++++
 .../createrepo/createrepo_0.4.11.bb                |    3 +-
 2 files changed, 73 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/createrepo/createrepo/recommends.patch

diff --git a/meta/recipes-support/createrepo/createrepo/recommends.patch b/meta/recipes-support/createrepo/createrepo/recommends.patch
new file mode 100644
index 0000000..dc5de2b
--- /dev/null
+++ b/meta/recipes-support/createrepo/createrepo/recommends.patch
@@ -0,0 +1,71 @@
+createrepo: implement recommends support
+
+Record against the corresponding requires entry in the output metadata
+if a dependency relationship is marked with the RPMSENSE_MISSINGOK flag
+(indicating it is a recommendation, rather than a hard dependency).
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/dumpMetadata.py b/dumpMetadata.py
+index 70bb2d8..e40e8ac 100644
+--- a/dumpMetadata.py
++++ b/dumpMetadata.py
+@@ -319,6 +319,23 @@ class RpmMetaData:
+                     reqs.append(0)
+         return reqs
+ 
++    def _checkMissingOk(self, flags):
++        reqs=[]
++        if flags is None:
++            return reqs
++
++        if type(flags) is not types.ListType:
++            flags = [flags]
++        for flag in flags:
++            newflag = flag
++            if flag is not None:
++                newflag = flag & rpm.RPMSENSE_MISSINGOK
++                if newflag:
++                    reqs.append(1)
++                else:
++                    reqs.append(0)
++        return reqs
++
+ 
+     def _correctVersion(self, vers):
+         returnvers = []
+@@ -537,9 +554,10 @@ class RpmMetaData:
+         tmpflags = self.hdr[rpm.RPMTAG_REQUIREFLAGS]
+         flags = self._correctFlags(tmpflags)
+         prereq = self._checkPreReq(tmpflags)
++        missingok = self._checkMissingOk(tmpflags)
+         ver = self._correctVersion(self.hdr[rpm.RPMTAG_REQUIREVERSION])
+         if names is not None:
+-            lst = zip(names, flags, ver, prereq)
++            lst = zip(names, flags, ver, prereq, missingok)
+         return self._uniq(lst)
+         
+     def obsoletesList(self):
+@@ -692,7 +710,7 @@ def generateXML(doc, node, formatns, rpmObj, sumtype):
+     depsList = rpmObj.depsList()
+     if len(depsList) > 0:
+         rpconode = format.newChild(formatns, 'requires', None)    
+-        for (name, flags, (e,v,r), prereq) in depsList:
++        for (name, flags, (e,v,r), prereq, missingok) in depsList:
+             entry = rpconode.newChild(formatns, 'entry', None)
+             entry.newProp('name', name)
+             if flags != 0:
+@@ -711,6 +729,8 @@ def generateXML(doc, node, formatns, rpmObj, sumtype):
+                     entry.newProp('rel', str(r))
+             if prereq == 1:
+                 entry.newProp('pre', str(prereq))
++            if missingok:
++                entry.newProp('missingok', '1')
+         
+     for file in rpmObj.usefulFiles():
+         files = format.newChild(None, 'file', None)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
index 8d2dcdf..227ebcb 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
@@ -6,12 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
 RDEPENDS_${PN}_class-native += "libxml2-native rpm-native"
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI= "http://createrepo.baseurl.org/download/${BP}.tar.gz \
           file://fix-native-install.patch \
           file://python-scripts-should-use-interpreter-from-env.patch \
 	  file://createrepo-rpm549.patch \
+	  file://recommends.patch \
 	  file://rpm-createsolvedb.py \
          "
 
-- 
1.7.3.4



