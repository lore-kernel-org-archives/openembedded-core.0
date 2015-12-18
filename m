Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0256273166
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 01:09:28 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id 68so39592263pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 17:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E8M82gZEjAjky3LYsQn89V8JvOtBz5s90He1gXe/+GQ=;
	b=G0MkESbl47koHZJzMAQOVaZTsCy9w/dGiQ+1kp78unsMH2YQhMmO1Lf255+oAI5kba
	EFnE1xDOcZ79XVLcuhDsZRO0DMeow0C+rE5kVcvAYAyDxt7/Bkl/TmLjF9734YqWtOHb
	wVflsq++4wjIHSsEFPnRMvAA3UosdI3frOZKCVnZ0mQ6sJ6zcHuOr8K83vFewQcjnsKE
	4Fgau6L0oAMeQaMHS4c9LG3/9oJiM+ZpeX/auLJDIyE+YgIo+W/wbk0rg3ulTfJmwfSV
	Dz6u3a5x0+k1zN2VTBOTLJbBMkVlNQLUF8GEdgctjENWawHwzbI0YGpEP2WWWSIJeXcf
	SCcg==
X-Received: by 10.98.42.205 with SMTP id q196mr1218956pfq.74.1450400969333;
	Thu, 17 Dec 2015 17:09:29 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ah10sm18207114pad.23.2015.12.17.17.09.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Dec 2015 17:09:28 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:09:02 -0800
Message-Id: <1450400944-10350-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450400944-10350-1-git-send-email-armccurdy@gmail.com>
References: <1450400944-10350-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/4] security_flags.inc: disable -fstack-protector-XXX for valgrind
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
X-List-Received-Date: Fri, 18 Dec 2015 01:09:29 -0000

Valgrind (v3.11.0) expects to build with stack protection disabled
and includes -fno-stack-protector in its default CFLAGS. However, the
CFLAGS provided by OE are included on the compiler command line after
the defaults so any -fstack-protector-all / -fstack-protector-strong
option provided by security_flags.inc will cause problems.

 | .../build-bcm97425vms/tmp/work/mips32el-rdk-linux/valgrind/3.11.0-r0/valgrind-3.11.0/coregrind/m_mallocfree.c:892: undefined reference to `__stack_chk_guard'
 | .../build-bcm97425vms/tmp/work/mips32el-rdk-linux/valgrind/3.11.0-r0/valgrind-3.11.0/coregrind/m_mallocfree.c:947: undefined reference to `__stack_chk_fail'

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 14ac0bf..1795750 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -84,7 +84,7 @@ SECURITY_CFLAGS_pn-python-numpy = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python3 = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tcl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tiff = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-valgrind = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-valgrind = ""
 SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
 
 # These 2 have text relco errors with the pie options enabled
-- 
1.9.1


