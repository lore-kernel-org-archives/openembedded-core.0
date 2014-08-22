Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2458D70E61
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 08:31:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7M8VSUI010297
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 01:31:28 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 22 Aug 2014 01:31:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Aug 2014 01:31:27 -0700
Message-ID: <2df065ff7652c0c8247a3a073e75a33bb6b6a2f7.1408695516.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408695516.git.liezhi.yang@windriver.com>
References: <cover.1408695516.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sanity.bbclass: check the format of MIRRORS
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
X-List-Received-Date: Fri, 22 Aug 2014 08:31:30 -0000
Content-Type: text/plain

Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS:
* Each mirror shoudl contain two memebers.
* The local "file://" url must use absolute path (file:///).
* The protocol must in protocols list.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sanity.bbclass |   33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b5fab6a..5b019b1 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -754,6 +754,39 @@ def check_sanity_everybuild(status, d):
     if oeroot.find(' ') != -1:
         status.addresult("Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space since autotools doesn't support this.")
 
+    # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
+    mir_types = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
+    protocols = ['http://', 'ftp://', 'file://', 'https://', 'https?$://', \
+        'git://', 'gitsm://', 'hg://', 'osc://', 'p4://', 'svk://', 'svn://', \
+        'bzr://', 'cvs://']
+    for mir_type in mir_types:
+        mirros = (d.getVar(mir_type, True) or '').split('\\n')
+        for mir in mirros:
+            mir_list = mir.split()
+            # Should be two members.
+            if len(mir_list) not in [0, 2]:
+                bb.warn('Invalid %s: %s, should be 2 members, but found %s.' \
+                    % (mir_type, mir.strip(), len(mir_list)))
+            elif len(mir_list) == 2:
+                # Each member should start with protocols
+                valid_protocol_0 = False
+                valid_protocol_1 = False
+                file_absolute = True
+                for protocol in protocols:
+                    if not valid_protocol_0 and mir_list[0].startswith(protocol):
+                        valid_protocol_0 = True
+                    if not valid_protocol_1 and mir_list[1].startswith(protocol):
+                        valid_protocol_1 = True
+                        # The file:// must be an absolute path.
+                        if protocol == 'file://' and not mir_list[1].startswith('file:///'):
+                            file_absolute = False
+                    if valid_protocol_0 and valid_protocol_1:
+                        break
+                if not (valid_protocol_0 and valid_protocol_1):
+                    bb.warn('Invalid protocol in %s: %s' % (mir_type, mir.strip()))
+                if not file_absolute:
+                    bb.warn('Invalid file url in %s: %s, must be absolute path (file:///)' % (mir_type, mir.strip()))
+
     # Check that TMPDIR hasn't changed location since the last time we were run
     tmpdir = d.getVar('TMPDIR', True)
     checkfile = os.path.join(tmpdir, "saved_tmpdir")
-- 
1.7.9.5


