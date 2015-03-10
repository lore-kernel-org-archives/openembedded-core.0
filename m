Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C5B33739BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 03:34:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2A3YqiM006083
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Mar 2015 20:34:52 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 9 Mar 2015 20:34:52 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Mar 2015 11:26:42 +0800
Message-ID: <cover.1425957496.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/3] V2: Some fixes for LSB tests
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
X-List-Received-Date: Tue, 10 Mar 2015 03:34:55 -0000
Content-Type: text/plain

V2 doesn't use alternative to handle /usr/lib/sendmail either. Because the link target is alway
${sbindir}/sendmail, update-alternative can't handle this kind of case.

So check whether /usr/lib/sendmail exists and is a link file, otherwise create it during pkg_postinst
of packages such as msmtp postfix and esmtp which provide ${sbindir}/sendmail.

Only one flaw is when all these packages are removed, broken link file /usr/lib/sendmail left.


The following changes since commit 8ce2f2c3549248b2aa1259ceb28ed03be166ac6f:

  maintainers.inc: Became maintainer of python2 and python3 (2015-03-09 16:01:08 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/lsb-20150310
  http://git.yoctoproject.org/cgit.cgi//log/?h=kangkai/lsb-20150310

Kai Kang (3):
  systemd: correct permission mode of /var/volatile/tmp
  lsb: update init-functions and remove sendmail
  msmtp: add link file /usr/lib/sendmail

 .../recipes-core/systemd/systemd/00-create-volatile.conf |  2 +-
 meta/recipes-extended/lsb/lsb_4.1.bb                     | 16 +++-------------
 meta/recipes-extended/msmtp/msmtp_1.6.1.bb               |  5 +++++
 3 files changed, 9 insertions(+), 14 deletions(-)

-- 
1.9.1


