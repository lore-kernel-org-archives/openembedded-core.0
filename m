Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 112AE712AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 06:32:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8P6W8TG008225
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Sep 2014 23:32:08 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 24 Sep 2014 23:32:07 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>
Date: Thu, 25 Sep 2014 14:31:58 +0800
Message-ID: <9a4f13d5343d2ee47a4c74498045466b61493dad.1411626154.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411626154.git.hongxu.jia@windriver.com>
References: <cover.1411626154.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] texinfo: fix info not work
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
X-List-Received-Date: Thu, 25 Sep 2014 06:32:11 -0000
Content-Type: text/plain

In texinfo, we didn't have info/dir entries, which caused
info not work.
...
root@qemux86:~# info info
info: dir: No such file or directory
...

Refer ubuntu/debian to invoke install-info to create info/dir
entries in pkg_postinst_info.

[YOCTO #6751]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/texinfo/texinfo_5.2.bb | 61 ++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/meta/recipes-extended/texinfo/texinfo_5.2.bb b/meta/recipes-extended/texinfo/texinfo_5.2.bb
index 7b5a11a..11c11aa 100644
--- a/meta/recipes-extended/texinfo/texinfo_5.2.bb
+++ b/meta/recipes-extended/texinfo/texinfo_5.2.bb
@@ -61,4 +61,65 @@ FILES_${PN}-doc = "${infodir}/texinfo* \
                    ${datadir}/${tex_texinfo} \
                    ${mandir}/man1 ${mandir}/man5"
 
+pkg_postinst_info () {
+if [ "x$D" != "x" ]; then
+    $INTERCEPT_DIR/postinst_intercept update_info_dir ${PKG} \
+        mlprefix=${MLPREFIX} infodir=${infodir} STAGING_BINDIR_NATIVE=${STAGING_BINDIR_NATIVE}
+else
+    if [ ! -d "${infodir}" ]; then
+        exit 0
+    fi
+
+    errors=0
+    find "${infodir}" -type f | while read file ; do
+        case $file in
+        */dir| */dir.old| \
+        *-[0-9]|*-[0-9].gz|*-[0-9].xz|*-[0-9].bz2| \
+        *-[1-9][0-9]|*-[1-9][0-9].gz|*-[1-9][0-9].xz|*-[1-9][0-9].bz2| \
+        *.png)
+            # these files are ignored
+            continue
+            ;;
+        *)
+            install-info "$file" "${infodir}/dir" || {
+                errors=$[errors+1]
+            }
+            ;;
+        esac
+    done
+    if [ $errors -gt 0 ] ; then
+        echo "Updating the index of info documentation produced $errors errors."
+        exit 1
+    fi
+fi
+}
+
+pkg_prerm_info () {
+if [ ! -d "$D${infodir}" ]; then
+    exit 0
+fi
+
+errors=0
+find "$D${infodir}" -type f | while read file ; do
+    case $file in
+    */dir|*/dir.old| \
+    *-[0-9]|*-[0-9].gz|*-[0-9].xz|*-[0-9].bz2| \
+    *-[1-9][0-9]|*-[1-9][0-9].gz|*-[1-9][0-9].xz|*-[1-9][0-9].bz2| \
+    *.png)
+        # these files are ignored
+        continue
+        ;;
+    *)
+        install-info --delete "$file" "$D${infodir}/dir" || {
+            errors=$[errors+1]
+        }
+        ;;
+    esac
+done
+
+if [ $errors -gt 0 ] ; then
+    echo "Cleaning the index of info documentation produced $errors errors."
+fi
+}
+
 BBCLASSEXTEND = "native"
-- 
1.9.1


