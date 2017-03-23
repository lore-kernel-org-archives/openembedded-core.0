Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3ECB477B4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 17:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2NHBCSf015485; Thu, 23 Mar 2017 17:11:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rZE3xGGsJpE6; Thu, 23 Mar 2017 17:11:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2NHBAaQ015471
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Mar 2017 17:11:11 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cr6GU-00029B-9x; Thu, 23 Mar 2017 17:11:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 17:11:04 +0000
Message-Id: <1490289067-8206-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490289067-8206-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1490289067-8206-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/5] staging: Drop do_configure clean prefunc
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
X-List-Received-Date: Thu, 23 Mar 2017 17:11:12 -0000

With recipe specific sysroots its now pointless to do this, may as well
save the cpu cycles.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index df77408..93d39c3 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -173,14 +173,6 @@ addtask populate_sysroot after do_install
 SYSROOT_PREPROCESS_FUNCS ?= ""
 SYSROOT_DESTDIR = "${WORKDIR}/sysroot-destdir"
 
-# We clean out any existing sstate from the sysroot if we rerun configure
-python sysroot_cleansstate () {
-    ss = sstate_state_fromvars(d, "populate_sysroot")
-    sstate_clean(ss, d)
-}
-do_configure[prefuncs] += "sysroot_cleansstate"
-
-
 BB_SETSCENE_VERIFY_FUNCTION2 = "sysroot_checkhashes2"
 
 def sysroot_checkhashes2(covered, tasknames, fns, d, invalidtasks):
-- 
2.7.4


