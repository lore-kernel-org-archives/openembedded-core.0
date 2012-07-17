Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <amy.fong@windriver.com>) id 1Sr8h3-0007Iy-KI
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 16:24:05 +0200
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6HECiSX013759
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 07:12:44 -0700 (PDT)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>) id 1Sr8W1-0005cn-I0
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 10:12:41 -0400
Date: Tue, 17 Jul 2012 10:12:41 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120717141241.GA21603@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] busybox: busybox wget -P option ignored
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: amy.fong@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2012 14:24:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

busybox wget -P option ignored
    
In cases where busybox wget is invoked with -P <...> and the url ends
in "/", the download directory is ignored (ie the file index.html is
implied), this change enables the -P option for those urls.
    
Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 busybox-1.19.4/wget_dl_dir_fix.patch |   24 ++++++++++++++++++++++++
 busybox_1.19.4.bb                    |    3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox-1.19.4/wget_dl_dir_fix.patch b/meta/recipes-core/busybox/busybox-1.19.4/wget_dl_dir_fix.patch
new file mode 100644
index 0000000..5f46fed
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.19.4/wget_dl_dir_fix.patch
@@ -0,0 +1,24 @@
+---
+ networking/wget.c |   10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+--- a/networking/wget.c
++++ b/networking/wget.c
+@@ -589,10 +589,14 @@
+ 	if (!(option_mask32 & WGET_OPT_OUTNAME)) {
+ 		G.fname_out = bb_get_last_path_component_nostrip(target.path);
+ 		/* handle "wget http://kernel.org//" */
+-		if (G.fname_out[0] == '/' || !G.fname_out[0])
+-			G.fname_out = (char*)"index.html";
++		if (G.fname_out[0] == '/' || !G.fname_out[0]) {
++			/* bug: if we provide a default name, we should still look at -P option */
++			if (G.dir_prefix)
++				G.fname_out = fname_out_alloc = concat_path_file(G.dir_prefix, "index.html");
++			else
++				G.fname_out = (char*)"index.html";
+ 		/* -P DIR is considered only if there was no -O FILE */
+-		else {
++		} else {
+ 			if (G.dir_prefix)
+ 				G.fname_out = fname_out_alloc = concat_path_file(G.dir_prefix, G.fname_out);
+ 			else {
diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index 5b3f356..8a06497 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
@@ -8,6 +8,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://run-parts.in.usr-bin.patch \
            file://watch.in.usr-bin.patch \
            file://busybox-udhcpc-no_deconfig.patch \
+           file://wget_dl_dir_fix.patch \
            file://find-touchscreen.sh \
            file://busybox-cron \
            file://busybox-httpd \


