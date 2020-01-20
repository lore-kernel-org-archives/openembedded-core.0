Return-Path: <Matthew.Zeng@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED8227FC47
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 16:08:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 00KG8LuO019613
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 08:08:21 -0800 (PST)
Received: from mzeng (128.224.141.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 20 Jan 2020 08:08:21 -0800
User-agent: mu4e 1.3.6; emacs 28.0.50
From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2020 11:08:13 -0500
Message-ID: <875zh6f6vm.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.141.67]
Subject: [PATCH] openssh: skip unit tests to avoid Makefile errors
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
X-List-Received-Date: Mon, 20 Jan 2020 16:08:21 -0000
Content-Type: text/plain


As per do_compile_ptest first appeared in commit 1f7aaf76f4aa7875f05f4b838a5ec4594a4c35dc,
regress/unittests/ binaries are already skipped.

This will trigger a Makefile error when running ptest:
```sh
/bin/sh: line 4: /usr/lib/openssh/ptest/regress/unittests/sshbuf/test_sshbuf: No such file or directory
make: *** [Makefile:243: unit] Error 127
make: Target 'tests' not remade because of errors.
```

openssh/regress/Makefile:
```
tests:		prep file-tests t-exec unit
```

Therefore we do not `make tests` as it consists of unit tests, we
`make prep file-tests t-exec` instead.

Signed-off-by: Matthew Zeng<Matthew.Zeng@windriver.com>

---
 meta/recipes-connectivity/openssh/openssh/run-ptest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/meta/recipes-connectivity/openssh/openssh/run-ptest
index daf62cca5b..e5270ceade 100755
--- a/meta/recipes-connectivity/openssh/openssh/run-ptest
+++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
@@ -4,7 +4,8 @@ export TEST_SHELL=sh

 cd regress
 sed -i "/\t\tagent-ptrace /d" Makefile
-make -k .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" tests \
+
+make -k .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" prep file-tests t-exec \
         | sed -u -e 's/^skipped/SKIP: /g' -e 's/^ok /PASS: /g' -e 's/^failed/FAIL: /g'

 SSHAGENT=`which ssh-agent`
@@ -41,4 +42,3 @@ EOF
 	${SSHAGENT} -k > /dev/null
 fi
 userdel openssh-test
-
--
2.24.0

