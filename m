Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5ABCD65CC6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 02:46:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w442kPJV024219
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2018 19:46:25 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 3 May 2018 19:46:24 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 May 2018 10:47:59 +0800
Message-ID: <4fde4c20433e735c2642a0eeef18a595f9116198.1525401100.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1525401100.git.Qi.Chen@windriver.com>
References: <cover.1525401100.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] testsdk.bbclass: set PREMIRRORS for kernel to speed up test
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
X-List-Received-Date: Fri, 04 May 2018 02:46:25 -0000
Content-Type: text/plain

Currently if we do a testsdkext task for the image, it would take
very long time to finish. The time is mostly spent fetching kernel
source via network.

We have done some configuration in auto.conf, trying to make use
of own-mirrors.bbclass to avoid fetching kernel via network.

However, the solution normally does not work. Below is some log
from log.do_fetch.

  DEBUG: Fetcher failure: Unable to find file \
  file:///path/to/downloads/git2_git.yoctoproject.org.linux-yocto.git.tar.gz \
  anywhere.

The tar.gz file is not available. It is generated only if
BB_GENERATE_MIRROR_TARBALLS is set to "1". The default value of
BB_GENERATE_MIRROR_TARBALLS is "0", and according to the manual, users
need choose to set it to "1" only if they are trying to make a source
mirror. So generally, this var's value is "0".

Anyway, we do need to avoid fetching kernel source from network when
doing testsdkext. So set PREMIRRORS in auto.conf to achieve this.

After this change, the time reduces from 4209.131s to 1399.436s on
my local machine.

[YOCTO #12729]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/testsdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 2e43343..57f8f21 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -157,6 +157,7 @@ def testsdkext_main(d):
             f.write('SSTATE_MIRRORS += " \\n file://.* file://%s/PATH"\n' % test_data.get('SSTATE_DIR'))
             f.write('SOURCE_MIRROR_URL = "file://%s"\n' % test_data.get('DL_DIR'))
             f.write('INHERIT += "own-mirrors"\n')
+            f.write('PREMIRRORS_prepend = " git://git.yoctoproject.org/.* git://%s/git2/git.yoctoproject.org.BASENAME \\n "\n' % test_data.get('DL_DIR'))
 
         # We need to do this in case we have a minimal SDK
         subprocess.check_output(". %s > /dev/null; devtool sdk-install meta-extsdk-toolchain" % \
-- 
1.9.1


