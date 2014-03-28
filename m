Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6406EAFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:43:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9hU94024537
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:43:30 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:43:29 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:43:06 +0800
Message-ID: <03f8bc4ad8c4bf496e831b883fbccd1309acdf46.1395996194.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395996194.git.hongxu.jia@windriver.com>
References: <cover.1395996194.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 4/7] native-python: bad interpreter error message
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
X-List-Received-Date: Fri, 28 Mar 2014 09:43:29 -0000
Content-Type: text/plain

From: Amy Fong <Amy.Fong@windriver.com>

On some builds with really long paths, we can end up exceeding the maximum
length line for an interpreter (man execve: A maximum line length of
127 characters is allowed for the first line in a #!  executable shell
script.)

To avoid this limit, we use env to execute python, with this, we will
be using python that's first found in our PATH.

The former ${bindir}/env is not a good idea for apps requiring native-python
since coreutil*-native may not have been built (${bindir}/env may not exist)
and with long paths, we can end up running into the same issue, hence we
use /usr/bin/env from the host.

Signed-off-by: Amy Fong <Amy.Fong@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/distutils.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index f3da023..1a53ebd 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -50,7 +50,13 @@ distutils_do_install() {
             for i in ${D}${bindir}/* ; do \
                 if [ ${PN} != "${BPN}-native" ]; then
                 	sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/env\ python:g $i
-		fi
+                else
+                	# The former ${bindir}/env is not a good idea for apps requiring native-python
+                	# since coreutil*-native may not have been built (${bindir}/env may not exist)
+                	# and with long paths, we can end up running into an issue where the
+                	# interpreter line is too long, hence we use /usr/bin/env from the host.
+                	sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:/usr/bin/env\ python:g $i
+                fi
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
@@ -59,6 +65,12 @@ distutils_do_install() {
             for i in ${D}${sbindir}/* ; do \
                 if [ ${PN} != "${BPN}-native" ]; then
                 	sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/env\ python:g $i
+                else
+                	# The former ${bindir}/env is not a good idea for apps requiring native-python
+                	# since coreutil*-native may not have been built (${bindir}/env may not exist)
+                	# and with long paths, we can end up running into an issue where the
+                	# interpreter line is too long, hence we use /usr/bin/env from the host.
+                	sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:/usr/bin/env\ python:g $i
 		fi
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
-- 
1.8.1.2


