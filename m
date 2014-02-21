Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6D8F6E8E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 15:41:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1LFfbjD000425
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 07:41:37 -0800 (PST)
Received: from yow-kscherer-d1.wrs.com (128.224.146.215) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Fri, 21 Feb 2014 07:41:37 -0800
From: Konrad Scherer <konrad.scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Feb 2014 10:41:35 -0500
Message-ID: <1392997296-30273-1-git-send-email-konrad.scherer@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [RFC] Delete populate-lic task for native packages
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
X-List-Received-Date: Fri, 21 Feb 2014 15:41:38 -0000
Content-Type: text/plain

From: Konrad Scherer <Konrad.Scherer@windriver.com>

Hello,

I am working on distributing native sstate files to our customers and
have ran into a few issues. Here is my workflow

    cd <buildarea>
    mkdir downloads
    git clone git://git.yoctoproject.org/poky
    source poky/oe-init-build-env mybuild
    echo 'DL_DIR ?= "<buildarea>/downloads"' >> conf/local.conf
    bitbake -c fetchall core-image-minimal
    bitbake core-image-minimal

    cd <buildarea>
    source poky/oe-init-build-env mybuild2
    cp <buildarea>/mybuild/conf/local.conf conf/local.conf
    mkdir sstate-cache
    cp -r <buildarea>/mybuild/sstate-cache/Ubuntu-12.04 sstate-cache
    bitbake core-image-minimal
    
The populate-sysroot sstate packages are used but the fetch, unpack,
patch and populate-lic tasks are still run for all the native
packages. I would like to avoid this unnecessary work. Since oe-core
commit 3d59d0bed756f64d0092caa3892239c779c4a341 the populate-lic task
is arch invariant and the sstate files for populate-lic are no longer
stored with the native populate-sysroot sstate files. This makes
distribution a little more complicated.

I also noticed that after a full build the sstate-cache contains 2
populate-lic sstate files; one for the native package and the other
for the package with only the checksum different. Since a full build
will contain the license tarball for all the packages, it is necessary
to have both?

To me the solution is to remove the populate-lic task from all native
packages and the attached patch does that. But I understand that any
change involving licensing must be considered carefully. If that is
not possible, then distributing the native sstate will also require
distributing the populate-lic sstate files. Does anyone have a better
solution?

Thanks

-- 
Konrad Scherer, MTS, Linux Products Group, Wind River

