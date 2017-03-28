Return-Path: <spopovyc@cisco.com>
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
	by mail.openembedded.org (Postfix) with ESMTP id EC29A73068
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 18:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2048; q=dns/txt; s=iport;
	t=1490727108; x=1491936708;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=4wwy1vqyo8RTXrTgYEiqYAvC8Bc9hIUbRknNWrkazUA=;
	b=BTPUAXPfslCXEzmj15IjMDXpk71PJ0BhvhSWuD0QUAhqc9c93T2hOcwg
	t/gRjqn+/J+j+d+FFCvPsWYdjZDEBHk6lTx8wGqcLxIbxQ7we9S1TAFc2
	L5ZVPxxms4Vr6EYbYPdZNv252hMkGzoPtr16YpDudLDjS/wlRtkaTKM59 g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AmAQA2sNpY/40NJK1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBg1SBbI1xkTGTXIIPgg6GIgKDIz8YAQIBAQEBAQEBayiFFgZ5EFF?=
	=?us-ascii?q?XGYl6Da9pikwBAQEBAQUCASUThjuCDYgChRkFnGCST5Ezk2ofOIEEOh8VhxlAN?=
	=?us-ascii?q?YlSAQEB?=
X-IronPort-AV: E=Sophos;i="5.36,237,1486425600"; d="scan'208";a="404288285"
Received: from alln-core-8.cisco.com ([173.36.13.141])
	by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	28 Mar 2017 18:51:48 +0000
Received: from sjc-ads-6963.cisco.com (sjc-ads-6963.cisco.com [10.30.218.83])
	by alln-core-8.cisco.com (8.14.5/8.14.5) with ESMTP id v2SIpk7B010524
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Tue, 28 Mar 2017 18:51:48 GMT
From: Serhii Popovych <spopovyc@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 18:51:41 +0000
Message-Id: <ef3ab1cc825f0b5985a9e7e2f7dcec859e950e80.1490726618.git.spopovyc@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1490726618.git.spopovyc@cisco.com>
References: <cover.1490726618.git.spopovyc@cisco.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: [PATCH 1/2] distutils.bbclass: Fix path to python for scripts
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
X-List-Received-Date: Tue, 28 Mar 2017 18:51:48 -0000

Commit 11229de (distutils: Replacing path to native python by path
to python in the image to support python packages with
console-script setup) replaces path to python-native with path
to the python interpreter in the target image.

However on nativesdk builds ${bindir} expanded to the
${SDKPATHNATIVE}${prefix_nativesdk} making shebang line
pointing to the absolute path to env(1) in SDKPATHNATIVE
which may not be present if coreutils isn't part of nativesdk.

On the other hand commit cf63d90 (bitbake.conf: Define USRBINPATH
globally instead of individually) introduces USRBINPATH variable
which has correct value regarding build class and intended for
this use case.

Cc: XE-Linux <xe-linux-external@cisco.com>
Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
---
 meta/classes/distutils.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 857572d..4637c23 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -44,7 +44,7 @@ distutils_do_install() {
         if test -e ${D}${bindir} ; then	
             for i in ${D}${bindir}/* ; do \
                 if [ ${PN} != "${BPN}-native" ]; then
-                	sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/env\ python:g $i
+			sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ python:g $i
 		fi
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
@@ -53,7 +53,7 @@ distutils_do_install() {
         if test -e ${D}${sbindir}; then
             for i in ${D}${sbindir}/* ; do \
                 if [ ${PN} != "${BPN}-native" ]; then
-                	sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/env\ python:g $i
+			sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ python:g $i
 		fi
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
-- 
2.7.4


