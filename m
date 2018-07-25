Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19FE7744C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 17:16:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6PHGTnh005145
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Jul 2018 10:16:30 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 25 Jul 2018 10:16:29 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <mark.hatle@windriver.com>
Date: Thu, 26 Jul 2018 00:41:05 +0800
Message-ID: <20180725164107.8891-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 0/2] Install rdependent of allarch package with same multilib variant of image
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
X-List-Received-Date: Wed, 25 Jul 2018 17:16:30 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Hi Richard and Mark,

The series rfc patch is trying to install 64bits packages which is
required by allarch package to 32 bits image. Work for rpm and need
little more work and test for dpkg and opkg.

Take ca-certificates as example. It requires openssl. So it intalls
openssl for both core-image-sato and lib32-core-image-sato. But
lib32-openssl is expected to be installed to lib32-core-image-sato.

So extend rdpendent of allarch package with all multilib variants and
'noarch-' as well.

Extend
ca-certificates -> openssl

to

ca-certificates -> openssl, lib32-openssl, noarch-openssl

Rdepends on openssl and lib32-openssl make both of them exist in
oe-core-repo when do rootfs. And then make both openssl and
lib32-openssl provide noarch-openssl. And only keep noarch-openssl in
RDEPENDS when write package for ca-certificates. When do image rootfs
for lib32-core-image-sato, remove openssl if installed already and
install lib32-openssl to provide noarch-openssl for allarch pacakge
ca-certificates.

And extend rprovides of allarch package with prefix 'noarch-' too that
it may be required by other allarch packages. Put all dependent packages
of all allarch recipes in oe-core to a new ariable 'ALLARCH_RDEP_PKGS'.

Any comment for this method is welcomed. Thanks a lot.

--Kai

Kai Kang (2):
  make allarch packages don't dependent specific multilib package
  WIP: install rdependent packages of allarch packages according to
    image rootfs

 meta/classes/allarch.bbclass         |  3 --
 meta/classes/multilib.bbclass        |  3 +-
 meta/classes/multilib_global.bbclass | 31 ++++++++++++++++-
 meta/classes/nativesdk.bbclass       |  8 +++++
 meta/classes/package_deb.bbclass     |  7 +++-
 meta/classes/package_ipk.bbclass     |  7 +++-
 meta/classes/package_rpm.bbclass     |  8 ++++-
 meta/conf/multilib.conf              | 16 +++++++++
 meta/lib/oe/package_manager.py       | 51 ++++++++++++++++++++++++++--
 meta/lib/oe/rootfs.py                | 28 +++++++++++++++
 10 files changed, 152 insertions(+), 10 deletions(-)

-- 
2.17.1


