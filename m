Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB0097E42E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 09:16:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4N9Gtjt006681
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 May 2019 02:16:55 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 23 May 2019 02:16:54 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 23 May 2019 16:25:56 +0800
Message-ID: <20190523082558.3805-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 0/2] Make systemd as default init manager and configure wired network
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
X-List-Received-Date: Thu, 23 May 2019 09:16:56 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v3:
* add the patch to make systemd as default init manager
* rename the .network with wired.network
* call to bb.utils.contains('OVERRIDES', ...) is not right. Install
  wired.network unconditionally and remove in in do_install_append_qemuall()
  BTW, bb.utils.contains('IMAGE_CLASSES', 'qemuboot', ...) from layer
  meta-yoe doesn't work for genericx86 that why I didn't use it.

Testededed on genericx86-64.

Run testimage with qemux86-64:
  MACHINE ?= "qemux86-64"
  IMAGE_CLASSES += "testimage"
  QEMU_USE_SLIRP = "1"
  TEST_SERVER_IP = "xxx"

$ bitbake  core-image-sato -c testimage
SUMMARY:
core-image-sato () - Ran 60 tests in 1042.949s
core-image-sato - OK - All required tests passed (successes=42, skipped=18, failures=0, errors=0)
NOTE: Tasks Summary: Attempted 723 tasks of which 722 didn't need to be rerun and all succeeded.


Kai Kang (2):
  local.conf.sample: make systemd as default init manager
  systemd-conf: configure wired network with dhcp

 meta-poky/conf/local.conf.sample                     | 9 +++++++++
 meta-poky/conf/local.conf.sample.extended            | 9 ---------
 meta/recipes-core/systemd/systemd-conf/wired.network | 9 +++++++++
 meta/recipes-core/systemd/systemd-conf_242.bb        | 6 ++++++
 4 files changed, 24 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd-conf/wired.network

--
2.18.0


