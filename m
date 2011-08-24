Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Qw77w-0004Jd-Hg
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 08:39:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7O6Z5pC025930
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Aug 2011 23:35:05 -0700 (PDT)
Received: from [128.224.162.219] (128.224.162.219) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 23 Aug 2011 23:35:05 -0700
Message-ID: <4E549B97.5060801@windriver.com>
Date: Wed, 24 Aug 2011 14:35:03 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Purdie, Richard" <richard.purdie@intel.com>
Subject: bug 1169 eglibc doesn't depend on gcc version correctly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Aug 2011 06:39:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi experts,

There is a bug 1169: eglibc doesn't depend on gcc version correctly,

The produce steps are:

1) In the first build dir(e.g, build_1), edit conf/local.conf:
    SSTATE_DIR = /path/to/share_sstate

    $ bitbake meta-toolchain

2) In the second build dir(e.g, build_2), edit local.conf:
    SSTATE_DIR = /path/to/share_sstate
    SDKGCCVERSION="4.5.1"
    GCCVERSION="4.5.1"

    $ bitbake meta-toolchain

Then we will notice the error:
| error: Failed dependencies:
|       libgcc1 >= 4.6.0 is needed by eglibc-utils-2.13-r1+svnr14157.armv5te

The reason is a little complicated:
As we can see that eglibc's RDPENDS should have 'libgcc', but eglibc's
DEPENDS(not RDEPENDS) can't have libgcc, otherwise there would be loop
dependencies(since libgcc already DEPENDS on eglibc), this causes
eglibc.do_package can't detect that the version of libgcc or gcc
has been changed from 4.6 to 4.5.1, so it would mirror the
sstate-eglibc-xxx_package.tgz(which is stored by gcc 4.6) from the
SSTATE_DIR, and then it would do_package_write_rpm from the data
of sstate-eglibc-xxx_package.tgz, but the objdump can find that the
binary file depends on the special version of libgcc, and it would
write the data( libgcc1 >= 4.6.0) to eglibc.spec, but the current
version of libgcc is 4.5.1, so there would be dependencies error when
do_rootfs.

I don't know how to fix this, maybe we should not mirror the tarball of
sstate-xxx_package.tgz(which is mirrored according to the DEPENDS) from the
SSTATE_DIR, but only mirror the tarball of sstate-xxx_deploy-rpm.tgz(which
is mirrored according to the RDEPENDS, the RDEPENDS is what the binary
rpm package really cares), the similar to ipk and deb.

-- 
Thanks

Robert


