Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D976573D7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 09:30:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3L9Ujvx028923
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 02:30:45 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 21 Apr 2015 02:30:44 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Apr 2015 17:30:47 +0800
Message-ID: <fb6ace7c72d1026cae4af1417822f424f991563f.1429608585.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1429608585.git.Qi.Chen@windriver.com>
References: <cover.1429608585.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] bash: explicitly define NON_INTERACTIVE_LOGIN_SHELLS in CFLAGS
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
X-List-Received-Date: Tue, 21 Apr 2015 09:30:44 -0000
Content-Type: text/plain

If NON_INTERACTIVE_LOGIN_SHELLS is defined, all login shells read the
startup files, even if they are not interactive.

This is the behaviour of other major distros like Ubuntu and Fedora.
We also need to set it so that when executing `su -l xxx -c env' command,
/etc/profile is parsed.

[YOCTO #5359]
[YOCTO #7137]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/bash/bash.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index d7b28cf..c06f157 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -9,6 +9,11 @@ inherit autotools gettext texinfo update-alternatives ptest
 EXTRA_AUTORECONF += "--exclude=autoheader"
 EXTRA_OECONF = "--enable-job-control"
 
+# If NON_INTERACTIVE_LOGIN_SHELLS is defined, all login shells read the
+# startup files, even if they are not interactive.
+# This is what other major distros do. And this is what we wanted. See bug#5359 and bug#7137.
+CFLAGS += "-DNON_INTERACTIVE_LOGIN_SHELLS"
+
 ALTERNATIVE_${PN} = "sh"
 ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
 ALTERNATIVE_TARGET[sh] = "${base_bindir}/bash"
-- 
1.9.1


