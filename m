Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 81EBA72144
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 16:18:59 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id fp1so6275931pdb.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 08:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=S7y345h26k7nOSpJKqzHHwdCinXsBhTfARqoJoQ1s+E=;
	b=ZtUJwiWdu0+WQSkjxHk3LkKmvAHwlKhFR3+3MaMzzcMOvXhFo/DcKSPozVvOu9jahk
	w5kIw3ig4gM9B8gzlWZQt/0EZeI1IuONWzpPGBVO2SbPmZ/IetOC8urqzP7MYDjWFMu8
	xWzmnI3tH48UHqnr4h/y1SdVQojz2GkST4s75ddVYtQJbvu3RFaCYvQMLbMiLvTtV3ze
	4hMYCrqzUfftfiDylLpZpgrhEvvgMp/X/9aTkFCA46uAUJ+ouVxU2Hmk5LeHi7TXi+6/
	oQgRQC66n/j8pAc0Gy+uaFZV94dkQBftLnaY+mF+D5VBbw+ZGvAuraeTs7G3kZrgj+sg
	GcpQ==
X-Received: by 10.70.43.78 with SMTP id u14mr2896183pdl.166.1416327539893;
	Tue, 18 Nov 2014 08:18:59 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	ex4sm38470695pdb.17.2014.11.18.08.18.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Nov 2014 08:18:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Nov 2014 08:18:26 -0800
Message-Id: <e8e39d81a3e28f45867afccd48963a0289a346b6.1416241492.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416241492.git.akuster808@gmail.com>
References: <cover.1416241492.git.akuster808@gmail.com>
In-Reply-To: <cover.1416241492.git.akuster808@gmail.com>
References: <cover.1416241492.git.akuster808@gmail.com>
Subject: [PATCH 1/6] subversion: Security Advisory - subversion - CVE-2014-3528
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
X-List-Received-Date: Tue, 18 Nov 2014 16:18:59 -0000

From: Yue Tao <Yue.Tao@windriver.com>

Apache Subversion 1.0.0 through 1.7.x before 1.7.17 and 1.8.x before
1.8.10 uses an MD5 hash of the URL and authentication realm to store
cached credentials, which makes it easier for remote servers to obtain
the credentials via a crafted authentication realm.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3528

(From OE-Core rev: e0dc0432b13f38d16f642bdadf8ebc78b7a74806)

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../subversion/subversion-CVE-2014-3528.patch      | 29 ++++++++++++++++++++++
 .../subversion/subversion_1.6.15.bb                |  1 +
 .../subversion/subversion_1.8.9.bb                 |  1 +
 3 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch

diff --git a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch
new file mode 100644
index 0000000..23e738e
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Backport
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+
+diff --git a/subversion/libsvn_subr/config_auth.c.old b/subversion/libsvn_subr/config_auth.c
+index ff50270..c511d04 100644
+--- a/subversion/libsvn_subr/config_auth.c.old
++++ b/subversion/libsvn_subr/config_auth.c
+@@ -85,6 +85,7 @@ svn_config_read_auth_data(apr_hash_t **hash,
+   if (kind == svn_node_file)
+     {
+       svn_stream_t *stream;
++      svn_string_t *stored_realm;
+ 
+       SVN_ERR_W(svn_stream_open_readonly(&stream, auth_path, pool, pool),
+                 _("Unable to open auth file for reading"));
+@@ -95,6 +96,12 @@ svn_config_read_auth_data(apr_hash_t **hash,
+                 apr_psprintf(pool, _("Error parsing '%s'"),
+                              svn_path_local_style(auth_path, pool)));
+ 
++      stored_realm = apr_hash_get(*hash, SVN_CONFIG_REALMSTRING_KEY,
++                                  APR_HASH_KEY_STRING);
++
++      if (!stored_realm || strcmp(stored_realm->data, realmstring) != 0)
++        *hash = NULL; /* Hash collision, or somebody tampering with storage */
++
+       SVN_ERR(svn_stream_close(stream));
+     }
+ 
diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index 6680ab6..b135bb7 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://subversion-CVE-2013-1847-CVE-2013-1846.patch \
            file://subversion-CVE-2013-4277.patch \
            file://subversion-CVE-2014-3522.patch \
+           file://subversion-CVE-2014-3528.patch \
 "
 
 SRC_URI[md5sum] = "113fca1d9e4aa389d7dc2b210010fa69"
diff --git a/meta/recipes-devtools/subversion/subversion_1.8.9.bb b/meta/recipes-devtools/subversion/subversion_1.8.9.bb
index e1ab945..1ef59a0 100644
--- a/meta/recipes-devtools/subversion/subversion_1.8.9.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.8.9.bb
@@ -13,6 +13,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://disable_macos.patch \
            file://subversion-CVE-2014-3522.patch;striplevel=0 \
+           file://subversion-CVE-2014-3528.patch \
 "
 SRC_URI[md5sum] = "bd495517a760ddd764ce449a891971db"
 SRC_URI[sha256sum] = "45d708a5c3ffbef4b2a1044c4716a053e680763743d1f7ba99d0369f6da49e33"
-- 
1.9.1


