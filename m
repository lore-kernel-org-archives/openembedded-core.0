Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 8AC357BDD2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 22:59:59 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 57DC522061B;
	Thu, 20 Dec 2018 11:59:58 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 11:59:46 +1300
Message-Id: <20181219225948.30700-4-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181219225948.30700-1-douglas.royds@taitradio.com>
References: <20181219225948.30700-1-douglas.royds@taitradio.com>
Subject: [PATCH 3/5] icecc: Syntax error meant that we weren't waiting for tarball generation
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
X-List-Received-Date: Wed, 19 Dec 2018 23:00:00 -0000

If two bitbake processes try to generate the ICECC_VERSION tarball at the same
time, the thread that fails to get the lock will wait 30 sec for the first to
finish. A syntax error meant that this was not happening, and in particular, if
tarball generation failed (eg. for lack of patchelf), it did so silently.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index d8a7894887..2171e11db0 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -387,7 +387,7 @@ set_icecc_env() {
             ${ICECC_ENV_EXEC} ${ICECC_ENV_DEBUG} "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"
         then
             touch "${ICECC_VERSION}.done"
-        elif [ ! wait_for_file "${ICECC_VERSION}.done" 30 ]
+        elif ! wait_for_file "${ICECC_VERSION}.done" 30 
         then
             # locking failed so wait for ${ICECC_VERSION}.done to appear
             bbwarn "Timeout waiting for ${ICECC_VERSION}.done"
-- 
2.17.1


