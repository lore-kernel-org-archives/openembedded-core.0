Return-Path: <tobias.henkel@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8056D433
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 08:34:02 +0000 (UTC)
Received: from duffman.bmw-carit.intra (duffman.bmw-carit.intra
	[192.168.101.67])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tobias.henkel)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id CB630400AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 08:05:21 +0100 (CET)
From: Tobias Henkel <tobias.henkel@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2013 09:33:55 +0100
Message-Id: <1384245243-20247-2-git-send-email-tobias.henkel@oss.bmw-carit.de>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1384245243-20247-1-git-send-email-tobias.henkel@oss.bmw-carit.de>
References: <1384245243-20247-1-git-send-email-tobias.henkel@oss.bmw-carit.de>
Subject: [PATCH 1/9] icecc: Log reason in error cases
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
X-List-Received-Date: Tue, 12 Nov 2013 08:34:03 -0000

From: Tobias Henkel <tobias.henkel@bmw-carit.de>

The current implementation doesn't give a hint about the cause in case
something went wrong in set_icecc_env. This makes it harder to find
out why a package is not being built using icecc. Therefore warnings
are inserted in the various error cases.

Signed-off-by: Tobias Henkel <tobias.henkel@bmw-carit.de>
---
 meta/classes/icecc.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index cf3f23d..71c556f 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -196,12 +196,14 @@ set_icecc_env() {
     ICECC_VERSION="${@icc_version(bb, d)}"
     if [ "x${ICECC_VERSION}" = "x" ]
     then
+        bbwarn "Cannot use icecc: could not get ICECC_VERSION"
         return
     fi
 
     ICE_PATH="${@icc_path(bb, d)}"
     if [ "x${ICE_PATH}" = "x" ]
     then
+        bbwarn "Cannot use icecc: could not get ICE_PATH"
         return
     fi
 
@@ -209,6 +211,7 @@ set_icecc_env() {
     ICECC_CXX="${@icc_get_and_check_tool(bb, d, "g++")}"
     if [ ! -x "${ICECC_CC}" -o ! -x "${ICECC_CXX}" ]
     then
+        bbwarn "Cannot use icecc: could not get ICECC_CC or ICECC_CXX"
         return
     fi
 
@@ -216,6 +219,7 @@ set_icecc_env() {
     ICECC_VERSION=`echo ${ICECC_VERSION} | sed -e "s/@VERSION@/$ICE_VERSION/g"`
     if [ ! -x "${ICECC_ENV_EXEC}" ]
     then
+        bbwarn "Cannot use icecc: invalid ICECC_ENV_EXEC"
         return
     fi
 
-- 
1.8.3.1


