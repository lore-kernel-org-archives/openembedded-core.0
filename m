Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 50C9F75681
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 21:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t51LDZNo007282 for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jun 2015 22:13:35 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FYGaodOC77K0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 22:13:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t51LDNST007277
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jun 2015 22:13:35 +0100
Message-ID: <1433193203.404.176.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 01 Jun 2015 22:13:23 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] base: Fix license checksum rebuild problems
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
X-List-Received-Date: Mon, 01 Jun 2015 21:13:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

"MACHINE=qemux86-64 bitbake init-ifupdown; MACHINE=genericx86-64 bitbake init-ifupdown"
shows a rebuild when it would be expected. The reason is a LIC_FILES_CHKSUM which
contains file://${WORKDIR}, an absolute path which doesn't exist in the first build
but does in the second, causing a signature change and a rebuild.

Fix the problem by ignoring any file:// url which resolves since TMPDIR for
license file dependency purposes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 99b512b..7093a19 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -97,6 +97,7 @@ PATH_prepend = "${@extra_path_elements(d)}"
 def get_lic_checksum_file_list(d):
     filelist = []
     lic_files = d.getVar("LIC_FILES_CHKSUM", True) or ''
+    tmpdir = d.getVar("TMPDIR", True)
 
     urls = lic_files.split()
     for url in urls:
@@ -105,6 +106,8 @@ def get_lic_checksum_file_list(d):
         try:
             path = bb.fetch.decodeurl(url)[2]
             if path[0] == '/':
+                if path.startswith(tmpdir):
+                    continue
                 filelist.append(path + ":" + str(os.path.exists(path)))
         except bb.fetch.MalformedUrl:
             raise bb.build.FuncFailed(d.getVar('PN', True) + ": LIC_FILES_CHKSUM contains an invalid URL: " + url)



