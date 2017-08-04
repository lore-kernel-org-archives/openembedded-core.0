Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDC6B71984
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 08:18:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v748IlCj014447
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Aug 2017 01:18:48 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 4 Aug 2017 01:18:47 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 4 Aug 2017 04:18:44 -0400
Message-ID: <cover.1501834468.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] python2/python3: fix multiprocessing.BoundedSemaphore not work on qemux86/qemuarm
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
X-List-Received-Date: Fri, 04 Aug 2017 08:18:47 -0000
Content-Type: text/plain

Test steps:

1. Build qemux86 with python3 installed
vim local.conf
...
MACHINE = "qemux86"
IMAGE_INSTALL_append = " python3 python python-modules"
...

$ bitbake core-image-minimal

2. Run qemu
runqemu core-image-minimal slirp nographic

3. Invoke python/python3 statements
root@qemux86:~# python2
Python 2.7.13 (default, Aug  4 2017, 07:39:04) 
[GCC 7.1.0] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import multiprocessing
>>> pool_sema = multiprocessing.BoundedSemaphore(value=1)
>>> pool_sema.acquire()
True
>>> pool_sema.release()
>>> 
root@qemux86:~# python3
Python 3.5.3 (default, Aug  4 2017, 07:38:14) 
[GCC 7.1.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import multiprocessing
>>> pool_sema = multiprocessing.BoundedSemaphore(value=1)
>>> pool_sema.acquire()
True
>>> pool_sema.release()
>>> 

//Hongxu

The following changes since commit 15901164ee71dec0906dadaff08f3365a66feb05:

  dev-manual, ref-manual: Eliminated pre-built section (2017-07-22 09:19:25 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-python
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/fix-python

Hongxu Jia (1):
  python2/python3: fix multiprocessing.BoundedSemaphore not work on
    qemux86/qemuarm

 ...ss-missing-libraries-to-Extension-for-mul.patch | 82 ++++++++++++++++++++++
 ...ss-missing-libraries-to-Extension-for-mul.patch | 82 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.3.bb      |  1 +
 meta/recipes-devtools/python/python_2.7.13.bb      |  1 +
 4 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/pass-missing-libraries-to-Extension-for-mul.patch
 create mode 100644 meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch

-- 
2.8.1


