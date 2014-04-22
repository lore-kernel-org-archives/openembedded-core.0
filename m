Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D52D065CF8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 03:18:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3M3I3Se021062
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Apr 2014 20:18:03 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 21 Apr 2014 20:18:02 -0700
Message-ID: <5355DF66.7010100@windriver.com>
Date: Tue, 22 Apr 2014 11:17:58 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, Robert Yang
	<liezhi.yang@windriver.com>, "Yang, Zhangle (Eric)"
	<Zhangle.Yang@windriver.com>,
	Ming Liu <ming.liu@windriver.com>, <Randy.MacLeod@windriver.com>,
	kane <jian.kang@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] About rpm multilib packagegroup QA Warning: install files into a shared area when those files already exist
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
X-List-Received-Date: Tue, 22 Apr 2014 03:18:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

This issue could be reproduced only by building multilib packagegroup
package in the first time. [YOCTO #5532]

*Step:
1) bitbake packagegroup-core-nfs-server

2) bitbake lib32-packagegroup-core-nfs-server
     Only the first time to do the build has this issue:
     ...
    WARNING: The recipe lib32-packagegroup-core-nfs is trying to install 
files into a shared area when those files already exist. Those files  
and their manifest location are:
/home/jiahongxu/yocto/build-20131120-yocto-qemux86-64/tmp/deploy/rpm/all/packagegroup-core-nfs-server-1.0-r2.all.rpm 

       Matched in manifest-allarch-packagegroup-core-nfs.deploy-rpm

*Analysis:

- The following commit message is the background which come
from oe-core d08e64a98316d7659b0fb56812667c534f66a1a8
[YOCTO #4532] Mark Hatle
     In deb/ipk on a multilib package, the package name has specific 
multilib
     references in it.  I.e. the alternative libraries start with something
     like lib32-...  This was done primarily because deb/ipk do not 
allow two
     packages with the same name (but different architectures) to be
     installed at the same time.  So the name has to be unique.

     In RPM however, the names of the packages and matches with the
     architectures and if they are not the same we can do these multilib
     installs.

- For this rpm multilib packagegroup issue, the multilib and non-multilib
packages have the same name 'packagegroup-core-nfs-server', and
the same architectures 'all'.

*Solution

- One possible fix is as Mark Hatle suggested simply to follow the 
deb/ipk package
naming, but this causes a design advantage of rpm.  When a package has a
dependency on 'bash', we really don't care what bash is installed, only 
that -a-
bash is installed.  In the deb/ipk case, the lib32- packages would end 
up with a
lib32-bash dependency and you could potentially end up with two 'bash' 
packages
being installed.

- Tweak oe-core commit 1674541ed83fa4645f2e078f65fe0f878527ee6e
'multilib: fix allarch/kernel/module-base multilib issues', skip the 
packagegroup
allarch recipes in multilib_virtclass_handler and  extend PROVIDES/RPROVIDES
for packagegroup allarch recipes. It will not build the multilib 
packagegroup allarch
recipes if the same packagegroup allarch recipes has already been built.
But I think it's a bad idea, the previous packagegroup allarch check is 
reasonable.

- We could simply add PACKAGE_ARCH = "${MACHINE_ARCH}" in each
packagegroup allarch recipe to avoid the QA Warning, but it actually 
doesn't work
at the image do_rootfs time, the smart could not correctly find the RDEPENDS
between multilib and non-multilib packagegroup packages.

- Is it necessary to fix the multilib packagegroup issue, it seems the 
warning
occurs on the world building, we rarely build both of the multilib and 
non-multilib
for one package at the same time , we could simple tweak the sanity check
to ignore the warning.

Any suggestion is welcomed.

//Hongxu

//Hongxu


