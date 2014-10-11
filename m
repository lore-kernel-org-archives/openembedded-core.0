Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 629EE7169F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 02:51:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9B2owZH020186
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 10 Oct 2014 19:50:58 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 10 Oct 2014 19:50:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Sat, 11 Oct 2014 10:50:52 +0800
Message-ID: <cover.1412995462.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V5 0/2] info: fix invoking info failed
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
X-List-Received-Date: Sat, 11 Oct 2014 02:51:06 -0000
Content-Type: text/plain

Changed in V5:
- Remove bashism

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
IMAGE_INSTALL_append = " texinfo texinfo-doc info info-doc"
INHERIT += "compress_doc"
DOC_COMPRESS = "xz" or DOC_COMPRESS = "bz2"
..

bitbake core-image-minimal

runqemu qemux86

On target,
...

root@qemux86:~# info info
...

//Hongxu

The following changes since commit 0172cded27d73437784fe1578110937aede563eb:

  build-appliance-image: Update to dizzy head revision (2014-10-10 22:40:57 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-info
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-info

Hongxu Jia (2):
  scripts/postinst-intercepts: add update_info_dir
  texinfo: fix info not work

 meta/recipes-extended/texinfo/texinfo_5.2.bb | 61 ++++++++++++++++++++++
 scripts/postinst-intercepts/update_info_dir  | 77 ++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 scripts/postinst-intercepts/update_info_dir

-- 
1.9.1


