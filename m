Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DFF316DF9D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 22:58:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB5MwIkE013998
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 14:58:19 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 5 Dec 2013 14:58:19 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 16:57:40 -0600
Message-ID: <94b095e724fc929043ab63786686062d27264473.1386283669.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1386283669.git.mark.hatle@windriver.com>
References: <cover.1386283669.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 1/7][dora] native-python: bad interpreter error message
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
X-List-Received-Date: Thu, 05 Dec 2013 22:58:20 -0000
Content-Type: text/plain

From: Amy Fong <Amy.Fong@windriver.com>

-- Sent for YP compliance --

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
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/distutils.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 8c3a979..b2895b3 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -49,7 +49,13 @@ distutils_do_install() {
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
@@ -58,6 +64,12 @@ distutils_do_install() {
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
1.8.1.2.545.g2f19ada


