Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B6C7B60684
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 07:46:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA17k4Kt020082
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2016 00:46:05 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 1 Nov 2016 00:46:04 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Nov 2016 15:39:41 +0800
Message-ID: <cover.1477985510.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Fixes for python3 and dbus-ptest
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
X-List-Received-Date: Tue, 01 Nov 2016 07:46:04 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

1
when multilib is enabled, python3 fails to start:
root@qemux86-64:~# python3 
Could not find platform independent libraries <prefix>
Could not find platform dependent libraries <exec_prefix>
Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
Fatal Python error: Py_Initialize: Unable to get the locale encoding
ImportError: No module named 'encodings'

Current thread 0x00007f4d9b268700 (most recent call first):
Aborted

It is library path issue, and fix it. Then check sys.path are right:

root@qemux86-64:~# python3
Python 3.5.2 (default, Nov  1 2016, 15:32:42) 
[GCC 6.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import sys
>>> sys.path
['', '/usr/lib64/python35.zip', '/usr/lib64/python3.5', '/usr/lib64/python3.5/plat-linux', '/usr/lib64/python3.5/lib-dynload']
>>>


2
Only 4 cases PASS of dbus-ptest. With the fixes, all ptests cases PASS on qemux86-64.
And for qemuarm, only one case fails:

./run-ptest: line 10:   283 Aborted                 ./$i ./test/data DBUS_TEST_HOMEDIR=./test > /dev/null
FAIL: test/test-refs


It is a multi-threads issue, and need more work to fix it.


---
The following changes since commit 003b053498aea91fdb8c5418d0d8bbda7b23dbc0:

  boost: fix the SRC_URI to point to an actual release, and not a master snapshot (2016-10-31 14:23:12 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/python3_and_dbus
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/python3_and_dbus

Kai Kang (3):
  dbus-test: correct paths in service and conf files
  dbus: update build options when enable ptest
  python3: fix library search path

 meta/recipes-core/dbus/dbus-test_1.10.10.bb        |  3 ++
 meta/recipes-core/dbus/dbus_1.10.10.bb             |  4 +-
 ...t-python3-lib-pathes-for-multilib-support.patch | 49 ++++++++++++++++++++++
 .../python/python3/python-3.3-multilib.patch       | 13 +++---
 meta/recipes-devtools/python/python3_3.5.2.bb      |  1 +
 5 files changed, 61 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/correct-python3-lib-pathes-for-multilib-support.patch

-- 
2.10.1


