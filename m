Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liang.Li@windriver.com>) id 1SwAMV-0000wE-4I
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 13:11:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6V8QUIR025563
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 01:26:30 -0700 (PDT)
Received: from localhost (128.224.163.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 31 Jul 2012 01:26:29 -0700
Resent-From: Liang Li <Liang.Li@windriver.com>
Resent-Date: Tue, 31 Jul 2012 16:26:25 +0800
Resent-Message-ID: <20120731082625.GA670@localhost>
Resent-To: <openembedded-core@lists.openembedded.org>
Received: from mail1.windriver.com ([147.11.146.13])	by linuxtogo.org with
	esmtp (Exim 4.72)	(envelope-from <Liang.Li@windriver.com>)	id
	1Sw2rz-00042c-EJ	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 05:11:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])	by
	mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6V1P2fQ004466
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Jul 2012 18:25:02 -0700 (PDT)
Received: from ll-wrs-990.corp.ad.wrs.com (128.224.163.138) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 30 Jul 2012 18:25:01 -0700
From: Liang Li <liang.li@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 31 Jul 2012 09:24:59 +0800
Message-ID: <1343697899-20776-1-git-send-email-liang.li@windriver.com>
X-Mailer: git-send-email 1.7.12.rc0.22.gcdd159b
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] trace-cmd: Update for python-native changes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 11:11:39 -0000
Content-Type: text/plain

Add pythonnative to the inherits list, otherwise we'll end up with
compiling error like:

| swig -Wall -python -noproxy ctracecmd.i
| trace-cmd.h:65: Error: Syntax error in input(1).
| trace-cmd.h:221: Warning(322): Redundant redeclaration of
| 'trace_util_ftrace_options',
| trace-cmd.h:196: Warning(322): previous declaration of
| 'trace_util_ftrace_options'.
| parse-events.h:275: Warning(312): Nested union not currently
| supported (ignored).
| parse-events.h:707: Warning(312): Nested union not currently
| supported (ignored).
| parse-events.h:746: Warning(312): Nested union not currently
| supported (ignored).
| make: *** [ctracecmd.so] Segmentation fault

Signed-off-by: Liang Li <liang.li@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
Hi all,

Due to recent change to python, we've done pythonnative related change to
various recipes like perf, xcb etc. Now this one is for trace-cmd. :)

Thanks.

 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
index 7f6f6cf..65e0378 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
@@ -9,7 +9,7 @@ SRCREV = "7055ffd37beeb44714e86a4abc703f7e175a0db5"
 PR = "r2"
 PV = "1.2+git${SRCPV}"
 
-inherit pkgconfig
+inherit pkgconfig pythonnative
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;protocol=git \
            file://addldflags.patch \
-- 
1.7.12.rc0.22.gcdd159b




