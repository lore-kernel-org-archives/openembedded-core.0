Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A9346FE64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 06:32:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8P6W16Y027743
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Sep 2014 23:32:02 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 24 Sep 2014 23:32:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>
Date: Thu, 25 Sep 2014 14:31:55 +0800
Message-ID: <cover.1411626154.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V4 0/4] man/info: fix not support xz/bz2 compression
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
X-List-Received-Date: Thu, 25 Sep 2014 06:32:11 -0000
Content-Type: text/plain

Changed in V4:
- In info's postinst/prerm, check the existance of ${infodir}

- Remove x permission for scripts/postinst-intercepts/update_info_dir
  'new file mode 100755'-->'new file mode 100644', rootfs.py
  use the x permission to decide whether the scripts in
  postinst-intercepts be invoked or not. Sounds weird, but
  it is the reason of Ross's build failure.

Changed in V3:
- Remove Debian-specific code
- split() the INHERIT variable

Changed in V2:
- Conditionally add 'gzip/bzip2/xz' to man/info's RDEPENDS
  rather than modify busybox's defconfig.

- Refer Ubuntu to add a script to postinst_intercept to
  run it after all packages have been installed at build time.

Test Case:

vim local.conf
..
IMAGE_INSTALL_append = " man man-doc texinfo texinfo-doc info info-doc"
INHERIT += "compress_doc"
DOC_COMPRESS = "xz" or DOC_COMPRESS = "bz2"
..

bitbake core-image-minimal

runqemu qemux86

On target,
...
root@qemux86:~# man man

root@qemux86:~# info info
...

//Hongxu

The following changes since commit 8ac8eca2e3bd8c78e2b31ea974930ed0243258a3:

  build-appliance-image: Update to dizzy head revision (2014-09-23 22:10:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-doc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-doc

Hongxu Jia (4):
  scripts/postinst-intercepts: add update_info_dir
  texinfo: fix QA Error while doc compress enabled
  texinfo: fix info not work
  man/texinfo: conditionally add gzip/bzip2/xz to RDEPENDS

 meta/recipes-extended/man/man_1.6g.bb        | 13 +++++
 meta/recipes-extended/texinfo/texinfo_5.2.bb | 76 ++++++++++++++++++++++++++-
 scripts/postinst-intercepts/update_info_dir  | 77 ++++++++++++++++++++++++++++
 3 files changed, 165 insertions(+), 1 deletion(-)
 create mode 100644 scripts/postinst-intercepts/update_info_dir

-- 
1.9.1


