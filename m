Return-Path: <Sakib.Sajal@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C25C7E5EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 20:26:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4VKQkYt004152
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 13:26:46 -0700 (PDT)
Received: from ssajal-HP-EliteBook-850-G3.wrs.com (128.224.140.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Fri, 31 May 2019 13:26:45 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 May 2019 16:25:52 -0400
Message-ID: <20190531202552.21421-3-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531202552.21421-1-sakib.sajal@windriver.com>
References: <20190531202552.21421-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] bash: run bash ptest as non-root user
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
X-List-Received-Date: Fri, 31 May 2019 20:26:45 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

new-exp ptest fails as it expects non-root user.

From the failed ptest log:
   < new-exp.tests: the test suite should not be run as root
   628c627
   < argv[1] = <host(2)[5.0]# >
   ---
   > argv[1] = <host(2)[5.0]$ >
   FAIL: run-new-exp

Many of the ptests declare that they should not be run as root
and a few fail since the expected result strings are for a
user shell.

When ptests are run as bash_user (non-root) the glob test
fails with error:
    run-glob-test
    59,60d58
    < touch: cannot touch 'a?': Permission denied
    < touch: cannot touch 'aa': Permission denied

So ensure that the bash/ptest/tests directory is owned by the
bash_user while the tests are being run and return it to root
owner afterwards.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
---
 meta/recipes-extended/bash/bash/run-ptest | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash/run-ptest b/meta/recipes-extended/bash/bash/run-ptest
index c61fabd020..c0cf27b6c2 100644
--- a/meta/recipes-extended/bash/bash/run-ptest
+++ b/meta/recipes-extended/bash/bash/run-ptest
@@ -19,4 +19,8 @@ then
         echo "Warning: The de_DE* locales is needed to run the intl.tests, please add it."
 fi
 
-make -k THIS_SH=/bin/bash BUILD_DIR=`pwd` srcdir=`pwd`  runtest
+useradd bash_user
+chown -R bash_user:bash_user ./tests
+su bash_user -c "make -k THIS_SH=/bin/bash BUILD_DIR=`pwd` srcdir=`pwd` runtest"
+chown -R root:root ./tests
+userdel bash_user
-- 
2.20.1


