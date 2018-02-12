Return-Path: <prvs=574c3b7e0=Sean.Nyekjaer@prevas.dk>
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id 141B46B6EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 09:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=1150; q=dns/txt;
	s=ironport2; t=1518428492; x=1549964492;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=+sc8K+FOam9tVElFNdG4XFVCZliqaRAgl9E+Pl8J2cM=;
	b=yKGT/E+wBEsAPdRKhnG/RUiBjdfXoTpwJ8Eqw6LRatNUgZZtcN93fFJy
	8n2bloN+HSqkJ31fwbDVeJHdQ5t04Z2YGC21HJ6BLXK0KzKQMyfbIpr5N
	Hnys1IghiVjfvP+TAJprYK1sCfwkZwf7xxKgxdxU4hNCwpTIps+wWzo7n w=;
X-IronPort-AV: E=Sophos;i="5.46,501,1511823600"; 
   d="scan'208";a="3046151"
Received: from vmprevas3.prevas.se (HELO smtp.prevas.se) ([172.16.8.103])
	by ironport2.prevas.se with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 10:41:30 +0100
Received: from skn.prevas.se (172.16.8.31) by smtp.prevas.se (172.16.8.103)
	with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 12 Feb 2018 10:41:29 +0100
From: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:41:17 +0100
Message-ID: <20180212094117.4534-1-sean.nyekjaer@prevas.dk>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
X-Originating-IP: [172.16.8.31]
Subject: [PATCH] site/common-linux: coreutils: get the uptime program to work
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
X-List-Received-Date: Mon, 12 Feb 2018 09:41:30 -0000
Content-Type: text/plain

coreutils configure script needs to know whether /proc/uptime is
available, but this is not possible in a cross-compilation
context. This leads to an uptime program that fails to work on the
target, as it has been compiled without /proc/uptime reading support.

This commit fixes that by telling coreutils at configure time that
/proc/uptime will be available on the target (which seems to be a
reasonable assumption on Linux systems).

This commit is made with great inspiration from Thomas Petazzoni's
patch to buildroot to fix the same issue.

Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
---
 meta/site/common-linux | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/site/common-linux b/meta/site/common-linux
index 2958716..71ec961 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -48,6 +48,7 @@ hw_cv_func_vsnprintf_c99=${hw_cv_func_vsnprintf_c99=yes}
 
 # coreutils
 gl_cv_func_fstatat_zero_flag=${gl_cv_func_fstatat_zero_flag=yes}
+gl_cv_have_proc_uptime=${gl_cv_have_proc_uptime=yes}
 
 # mysql
 ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
-- 
2.7.4


