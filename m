Return-Path: <sujith.h@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2565B701D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 15:02:55 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so9581088wib.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 08:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=22Cv8rvB08HRe+SrkvcZDf0sTMN/ByHjhMANRMNGoCM=;
	b=oAmk7ur28KXvu7CLfsCAHOBcR2vdcdWTSsD9wKosY5B0UZnTODxexCm/o3gS6bV9/E
	lod0UD8BGrIloE4rScXSsx+lc/dVfQcJUbUBbqt/B+BXlMK8Qumna5g44QnmvwVlwdF3
	yJfA70DgN3JGbUJNPmM2UMTS5byQNMloKCgz4aD8szClUVIKkZGCB0l4m5vZl33+7lZ6
	/tIVrMpJ05yZxHlM/tm55moi6H9HVq04HOQ1HP+BmwreqVEzbtj4grrysebhnOLCLUoa
	dTq5IEJpdWsXVfOBiU0NSm4sOcXZSEgwQ9jb57QX7/IPI5DT02nkpu+bkOYQyvi+NV6O
	f1Yg==
X-Received: by 10.194.179.4 with SMTP id dc4mr17622235wjc.32.1406818973113;
	Thu, 31 Jul 2014 08:02:53 -0700 (PDT)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	fb8sm67075019wib.15.2014.07.31.08.02.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jul 2014 08:02:52 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jul 2014 20:29:00 +0530
Message-Id: <1406818740-17681-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: [PATCH] netbase: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Thu, 31 Jul 2014 15:02:59 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

If hostname is not added to /etc/hosts file then rpcinfo
command fails when hostname is passed as argument. This was
observed when rpcinfo command was tested on freescale target.
Below was the output observed without this change.

root@mx6q:~# rpcinfo -s mx6q
rpcinfo: can't contact rpcbind: RPC: (unknown error code)

Below is the output after this change:
root@mx6q:~# rpcinfo -s mx6q
   program version(s) netid(s)                         service     owner
    100000  2,3,4     local,udp,tcp,udp6,tcp6          portmapper  superuser
root@mx6q:~#

Signed-off-by: Sujith H <sujith.h@gmail.com>
---
 meta/recipes-core/netbase/netbase_5.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/netbase/netbase_5.2.bb b/meta/recipes-core/netbase/netbase_5.2.bb
index ab7ae65..a6fb010 100644
--- a/meta/recipes-core/netbase/netbase_5.2.bb
+++ b/meta/recipes-core/netbase/netbase_5.2.bb
@@ -18,6 +18,7 @@ do_install () {
 	install -m 0644 etc-rpc ${D}${sysconfdir}/rpc
 	install -m 0644 etc-protocols ${D}${sysconfdir}/protocols
 	install -m 0644 etc-services ${D}${sysconfdir}/services
+	echo 127.0.1.1 "             "${MACHINE} >> ${D}${sysconfdir}/hosts
 }
 
 CONFFILES_${PN} = "${sysconfdir}/hosts"
-- 
1.8.4


