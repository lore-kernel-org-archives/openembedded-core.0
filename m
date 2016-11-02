Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD7671AD7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 15:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uA2F48Vx017318 for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2016 15:04:15 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0jylBU1GI1UR
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 15:04:15 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uA2F49Jq017333
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2016 15:04:10 GMT
Message-ID: <1478099048.23123.59.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 02 Nov 2016 15:04:08 +0000
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] sstate: Ensure we don't remove sigbasedata files
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
X-List-Received-Date: Wed, 02 Nov 2016 15:04:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit


We don't remove sigdata files, we also shouldn't remove sigbasedata files
as this hinders debugging.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 172384b..8643f3d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -457,7 +457,7 @@ def sstate_clean(ss, d):
     rm_nohash = ".do_%s" % ss['task']
     for stfile in glob.glob(wildcard_stfile):
         # Keep the sigdata
-        if ".sigdata." in stfile:
+        if ".sigdata." in stfile or ".sigbasedata." in stfile:
             continue
         # Preserve taint files in the stamps directory
         if stfile.endswith('.taint'):



