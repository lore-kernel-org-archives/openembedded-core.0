Return-Path: <sujith.h@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1946465CB2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 13:58:24 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so5162739wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 06:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3HWGNbeOaVtt+/cpFXBJeuFE1EEV7Xvwm+PCXtRG7Fk=;
	b=XF/HdL55z80nt2jkKMLmwq/skv1OawIy/U9svZ4nh+REb8SdTpyUYNqRQWbMOaXY+a
	uFt8WaAz5kQ9uizcB2MQltXGfS8y4Qne8QuB6/7C9Ql8ZF0p2Lexqdgffu7TpcIUeuVw
	Kh7xcdIZnchZHAeBuM9ESoZG7y/i8+G3eW1aLdXXE0F5O7FmKlfwG1SezxDTDbZIYLYy
	eSFGapzYX4oTqyYmITFhP9jd+xyTX+aUjvTGlCDdJdsKwE/sd98Ylj9II5Zbqw0EF+gK
	g6nuUsh1g/9Tu5ldt5txv30EkpxZO4CbkO2llHq7QDUmwnJmRwJ2Z4GVsf6w9NmeFPUm
	agGA==
X-Received: by 10.194.222.197 with SMTP id qo5mr32861168wjc.78.1407160704626; 
	Mon, 04 Aug 2014 06:58:24 -0700 (PDT)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id r9sm41061896wia.17.2014.08.04.06.58.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Aug 2014 06:58:23 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Aug 2014 19:24:49 +0530
Message-Id: <1407160489-30708-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: [PATCH 1/2] netbase: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Mon, 04 Aug 2014 13:58:25 -0000

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

Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
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


