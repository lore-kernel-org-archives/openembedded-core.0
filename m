Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <amy.fong@windriver.com>) id 1Te6s0-00006B-TH
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 17:22:31 +0100
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qATEO46P019134
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 06:24:04 -0800 (PST)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>) id 1Te523-0007WW-PF
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 09:24:03 -0500
Date: Thu, 29 Nov 2012 09:24:03 -0500
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20121129142403.GA28905@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] rsync doesn't create hardlinks for certain files
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
X-List-Received-Date: Thu, 29 Nov 2012 16:23:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

commit 4205a4c5d959643cf6c186e0939e202fb6006b82
Author: Amy Fong <Amy.Fong@windriver.com>
Date:   Thu Nov 29 09:21:49 2012 -0500

    rsync cannot create hardlink for node file when use option
    --link-dest=DIR.
    
    By default, rsync's configure file disables certain capabilities when
    crosscompiling.
    
    Signed-off-by: Amy Fong <Amy.Fong@windriver.com>
---
 rsync_3.0.9.bb |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/rsync/rsync_3.0.9.bb b/meta/recipes-devtools/rsync/rsync_3.0.9.bb
index 8fb0140..74eacc9 100644
--- a/meta/recipes-devtools/rsync/rsync_3.0.9.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.0.9.bb
@@ -14,6 +14,12 @@ EXTRA_OECONF += "--disable-xattr-support --disable-acl-support"
 do_configure_prepend () {
 	rm -f configure configure.sh
 	cp -f ${WORKDIR}/acinclude.m4 ${S}/
+
+	# by default, if crosscompiling, rsync                                                           
+	# disables a number of capabilities, hardlinking                                                 
+	# symlinks and special files (ie devices)
+	export rsync_cv_can_hardlink_special=yes
+	export rsync_cv_can_hardlink_symlink=yes 
 }
 
 do_configure_append () {


