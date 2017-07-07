Return-Path: <haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id D602371C75
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 19:36:27 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v67JaCbA000928; Fri, 7 Jul 2017 14:36:28 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2be7rvn9ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 07 Jul 2017 14:36:28 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v67JaRoK030959
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 7 Jul 2017 14:36:27 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 7 Jul 2017 14:36:27 -0500
Received: from harisdt.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Fri, 7 Jul 2017 14:36:27 -0500
From: Haris Okanovic <haris.okanovic@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Jul 2017 14:36:23 -0500
Message-ID: <20170707193623.7679-1-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.13.2
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-07-07_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1707070326
Cc: haris.okanovic@ni.com, ken.sharp@ni.com
Subject: [PATCH] [RFC] image.bbclass & image.py: Add check_image_file_ownership()
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
X-List-Received-Date: Fri, 07 Jul 2017 19:36:28 -0000
Content-Type: text/plain

An IMAGE_POSTPROCESS_COMMAND verifying image tarballs have symbolic and
numeric ownership attributes which match the enclosed shadow database:
 * uid and uname of each file is present in /etc/passwd
 * gid and gname of each file is present in /etc/group
 * ids and names are consistent between tar metadata and shadow database

In other words, this test ensure there aren't any ownership surprises
when a filesystem created from tarball is booted. It's particularly
useful in cases where artifacts built outside of OE are included in
images -- E.g. packages from an external feed.

Testing: Verified core-image-base still builds

Patch: https://github.com/harisokanovic/openembedded-core/commits/dev/hokanovi/image-ownership-sanity-check

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 meta/classes/image.bbclass |  25 +++++++++-
 meta/lib/oe/image.py       | 114 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oe/image.py

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 6e30b96745..7b11291a82 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -192,7 +192,30 @@ python () {
 IMAGE_CLASSES += "image_types"
 inherit ${IMAGE_CLASSES}
 
-IMAGE_POSTPROCESS_COMMAND ?= ""
+python check_image_file_ownership () {
+    import sys, os, oe.image
+
+    imgTypes = d.getVar("IMAGE_FSTYPES", True).split()
+    tarImgTypes = [ x for x in imgTypes if "tar" in x ]
+
+    # bail if there isn't a tar image in this build
+    # TODO: Maybe add other image types
+    if len(tarImgTypes) == 0:
+        bb.debug(1, "Skipping check, no 'tar' image specified")
+        return
+
+    imgDeployDir = d.getVar("IMGDEPLOYDIR", True)
+    imgName = d.getVar("IMAGE_NAME", True)
+    imgNameSuffix = d.getVar("IMAGE_NAME_SUFFIX", True)
+
+    for tarFileExt in tarImgTypes:
+        archiveFilename = (imgName + imgNameSuffix + "." + tarFileExt)
+        archiveFilePath = os.path.join(imgDeployDir, archiveFilename)
+
+        oe.image.check_file_ownership_tar(d, archiveFilePath)
+}
+
+IMAGE_POSTPROCESS_COMMAND ?= " check_image_file_ownership "
 
 # some default locales
 IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
new file mode 100644
index 0000000000..f1ba6f2613
--- /dev/null
+++ b/meta/lib/oe/image.py
@@ -0,0 +1,114 @@
+# Helper function for image building
+
+def check_file_ownership_tar(d, archiveFilePath):
+    """
+    Verifies file ownership meta-data in image tarball matches users
+    and groups in shadow database (/etc/passwd and /etc/group files).
+    """
+    import sys, os, tarfile
+    bb.debug(1, "Running check_file_ownership() on image '{0!s}'".format(archiveFilePath))
+
+    try:
+        archiveName = os.path.basename(archiveFilePath)
+        if not archiveName:
+            archiveName = archiveFilePath
+
+        # maps
+        unameMap = {}  # username -> passwd file entry array
+        gnameMap = {}  # groupname -> group file entry array
+        uidMap = {}  # uid -> passwd file entry array
+        gidMap   = {}  # gid -> group file entry array
+        fileMap = {}  # filepath -> TarInfo object
+
+        def read_shadow_file(fdName, fd, colCount, mapsList):
+            """ Reads a colon (:) delimited shadow database file into mapsList """
+            for mapObj,_ in mapsList:
+                if len(mapObj) != 0:
+                    raise Exception("Already read '{0!s}' file.".format(fdName))
+
+            for line in fd:
+                line = line.decode("utf-8").strip()
+                words = line.split(":")
+
+                if len(words) != colCount:
+                    raise Exception("Malformed '{0!s}' file. Expected {1!s} cols.".format(fdName, colCount))
+
+                for mapObj,mapKeyCol in mapsList:
+                    mapKey = words[mapKeyCol]
+                    if len(mapKey) < 1:
+                        raise Exception("Map key in '{0!s}' must be at least one char long.".format(fdName))
+
+                    if mapKey in mapObj:
+                        raise Exception("Malformed '{0!s}' file. Did not expect to find '{0!s}' in map.".format(fdName, mapKey))
+
+                    mapObj[mapKey] = words
+
+            for mapObj,_ in mapsList:
+                if len(mapObj) == 0:
+                    raise Exception("'{0!s}' is empty.".format(fdName))
+
+        bb.debug(1, "Read the archive and populate maps")
+        with tarfile.open(name=archiveFilePath, mode='r:*') as tar:
+            for info in tar:
+                if info.name in fileMap:
+                    raise Exception("Duplicate entry for '{0!s}' found.".format(info.name))
+
+                fileMap[info.name] = info
+
+                # populate shadow db maps
+                if    info.name == './etc/passwd':  read_shadow_file(fdName=info.name, fd=tar.extractfile(info), colCount=7, mapsList=[(unameMap, 0), (uidMap, 2), ])
+                elif  info.name == './etc/group':   read_shadow_file(fdName=info.name, fd=tar.extractfile(info), colCount=4, mapsList=[(gnameMap, 0), (gidMap, 2), ])
+
+        bb.debug(1, "Check for no shadow db")
+        shadowItemCount = 0
+        for mapObj in [unameMap, gnameMap, uidMap, gidMap]:
+            shadowItemCount = shadowItemCount + len(mapObj)
+        if shadowItemCount == 0:
+            bb.warn(1, "check_file_ownership(): Skip; no shadow database in image '{0!s}'".format(archiveName))
+            return
+
+        bb.debug(1, "Map sanity check")
+        for mapObj in [unameMap, gnameMap, uidMap, gidMap, fileMap]:
+            if len(mapObj) < 1:
+                raise Exception("Uh oh. Empty map found.")
+
+        def badFileError(errorMessage, info, shadowEntry=None):
+            linkname = ""
+            if info.linkname:
+                linkname = " -> {0!s}".format(info.linkname)
+
+            bb.error("BAD FILE '{0!s}': {1!s}".format(info.name, errorMessage))
+            bb.error("## {info.uid!s}:{info.gid!s} ({info.uname!s}:{info.gname!s}) 0{info.mode:o} {info.name!s}{linkname!s}".format(info=info, linkname=linkname))
+            if shadowEntry:
+                bb.error("## {0!s}".format(shadowEntry))
+
+        bb.debug(1, "Check for bad files")
+        for filepath,info in fileMap.items():
+            if not info.uname in unameMap:
+                badFileError("uname not in unameMap", info)
+                continue
+
+            if not info.gname in gnameMap:
+                badFileError("gname not in gnameMap", info)
+                continue
+
+            if not str(info.uid) in uidMap:
+                badFileError("Uid '{0!s}' not found".format(info.uid), info)
+
+            if not str(info.gid) in gidMap:
+                badFileError("Gid '{0!s}' not found".format(info.gid), info)
+
+            unameEntry = unameMap[info.uname]
+            gnameEntry = gnameMap[info.gname]
+
+            if str(info.uid) != unameEntry[2]:
+                badFileError("uid mismatch, expecting '{0!s}' for uname '{1!s}'".format(unameEntry[2], info.uname), info, unameEntry)
+
+            if str(info.gid) != gnameEntry[2]:
+                badFileError("gid mismatch, expecting '{0!s}' for gname '{1!s}'".format(gnameEntry[2], info.gname), info, gnameEntry)
+
+        bb.debug(1, "Successfully verified image '{0!s}'".format(archiveName))
+
+    # Error on any exceptions
+    except Exception as e:
+        bb.error("check_file_ownership() exception: {0!s}".format(e))
-- 
2.13.2


