Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE3B16093A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 15:59:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8SFxAcv017271
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Sep 2017 08:59:11 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 28 Sep 2017 08:59:09 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 28 Sep 2017 11:59:09 -0400
Message-ID: <1506614349-23562-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] cml1: remove diffconfig return code checking
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
X-List-Received-Date: Thu, 28 Sep 2017 15:59:12 -0000
Content-Type: text/plain

The following commit:

[
  commit 578c8205fd14c48c6d30ef2889d86f1b4aee060a
  Author: Mikko Rapeli <mikko.rapeli@bmw.de>
  Date:   Thu Jun 22 16:23:14 2017 +0300

      meta: Fix return value checks from subprocess.call()'s

      Python function subprocess.call() returns the return value of the
      executed process. If return values are not checked, errors may
      go unnoticed and bad things can happen.

      Change all callers of subprocess.call() which do not check for
      the return value to use subprocess.check_call() which raises
      CalledProcessError if the subprocess returns with non-zero value.

      https://docs.python.org/2/library/subprocess.html#using-the-subprocess-module

      All users of the function were found with:

      $ git grep "subprocess\.call" | \
            egrep -v 'if.*subprocess\.call|=\
            +subprocess\.call|return.*subprocess\.call'

      Tested similar patch on top of yocto jethro. Only compile tested
      core-image-minimal on poky master branch.

      Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
      Signed-off-by: Ross Burton <ross.burton@intel.com>
      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
]

Added return code checking to do_diffconfig. Although the change is
well intentioned, it isn't correct in this instance since 'diff' returns
'1' to indicate that there are differences in the files .. and not as
an error code.

subprocess.check_call() flags this as an error and the routine aborts.

We are already checking the inputs, and in fact already know there's a
diff in the files before we even make the call, so there's no need to
look for an error in this case.

Putting back subprocess.call() restores the routine to working order.

[YOCTO #12132]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/cml1.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index eb8e7907f602..38e6613c486d 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -63,7 +63,7 @@ python do_diffconfig() {
 
     if isdiff:
         statement = 'diff --unchanged-line-format= --old-line-format= --new-line-format="%L" ' + configorig + ' ' + config + '>' + fragment
-        subprocess.check_call(statement, shell=True)
+        subprocess.call(statement, shell=True)
 
         shutil.copy(configorig, config)
 
-- 
2.5.0


