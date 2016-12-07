Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 17E6071B91
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 01:57:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB71viWm024898
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2016 17:57:44 -0800 (PST)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 6 Dec 2016 17:57:43 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Dec 2016 09:57:40 +0800
Message-ID: <0b5f26f5b17cda3f6b18b6ee54c35eac03642bdf.1481075716.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1481075716.git.dengke.du@windriver.com>
References: <cover.1481075716.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] archiver.bbclass: fix do_ar_original error for matchbox-desktop
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
X-List-Received-Date: Wed, 07 Dec 2016 01:57:43 -0000
Content-Type: text/plain

Error:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ERROR: matchbox-desktop-2.1-r0 do_ar_original: Can not determine archive names
for original source because 'name' URL parameter is unset in more than one URL.
Add it to at least one of these: git://git.yoctoproject.org/matchbox-desktop-2
file://vfolders/%2A

ERROR: matchbox-desktop-2.1-r0 do_ar_original: Function failed: do_ar_original
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In function do_ar_original, when recipes have more than one source, it added the
"name" URL parameter as suffix to identify the created tarball.

But the URL type "file://" that we always used to represent a series of patches,
it didn't have "name" parameter, so it failed.

So set "name" to the folder name to identify the created tarball, for example:

In matchbox-desktop bb file, the SRC_URI contains:

	file://vfloders/*

We set "name" to "vfolders" to identify the created tarball.

In connman-gnome bb file, the SRC_URI contains:

	file://images/*

We set "name" to "images" to identify the created tarball.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/classes/archiver.bbclass | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 9239983..fe8877b 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -166,12 +166,18 @@ python do_ar_original() {
             # to be set when using the git fetcher, otherwise SRCREV cannot
             # be set separately for each URL.
             params = bb.fetch2.decodeurl(url)[5]
+            type = bb.fetch2.decodeurl(url)[0]
+            location = bb.fetch2.decodeurl(url)[2]
             name = params.get('name', '')
-            if name in tarball_suffix:
-                if not name:
-                    bb.fatal("Cannot determine archive names for original source because 'name' URL parameter is unset in more than one URL. Add it to at least one of these: %s %s" % (tarball_suffix[name], url))
-                else:
-                    bb.fatal("Cannot determine archive names for original source because 'name=' URL parameter '%s' is used twice. Make it unique in: %s %s" % (tarball_suffix[name], url))
+            if type.lower() == 'file':
+                name_tmp = location.rstrip("*").rstrip("/")
+                name = os.path.basename(name_tmp)
+            else:
+                if name in tarball_suffix:
+                    if not name:
+                        bb.fatal("Cannot determine archive names for original source because 'name' URL parameter is unset in more than one URL. Add it to at least one of these: %s %s" % (tarball_suffix[name], url))
+                    else:
+                        bb.fatal("Cannot determine archive names for original source because 'name=' URL parameter '%s' is used twice. Make it unique in: %s %s" % (tarball_suffix[name], url))
             tarball_suffix[name] = url
             create_tarball(d, tmpdir + '/.', name, ar_outdir)
 
-- 
2.7.4


