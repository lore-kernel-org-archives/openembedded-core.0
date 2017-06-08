Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 53CCB78286
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 21:06:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 14:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="97265262"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga002.jf.intel.com with ESMTP; 08 Jun 2017 14:06:30 -0700
Message-ID: <1496956519.26945.171.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Thu, 08 Jun 2017 16:15:19 -0500
In-Reply-To: <cover.1496932793.git.alexander.kanavin@linux.intel.com>
References: <cover.1496932793.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 0/2] Multi-threaded RPM support
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
X-List-Received-Date: Thu, 08 Jun 2017 21:06:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-08 at 17:42 +0300, Alexander Kanavin wrote:
> Changes in version 2: use openmp for multi-processing instead of NSPR library, as
> requested by upstream. Add a link to the upstream submission to patches.
> 
> These two patches add multi-threaded features to RPM to speed up the do_package_write_rpm task.
> 
> Specifically:
> 
> 1) Multi-threaded xz compressor is used instead of default single-threaded gz. This has the most
> dramatic effect when a recipe produces a smaller number of large-sized packages.
> 
> 2) Packages creation is run in multiple threads via thread pools. This is most beneficial when
> a recipe produces a large amount of small packages.
> 
> Some not very scientific benchmarks for time and .rpm sizes
> (time is measured for do_package_write_rpm tasks only):
> 

Tried v2 again and I am getting this problem (segmentation faults):

http://errors.yoctoproject.org/Errors/Build/38812/


The idea I have is to get some numbers from buildstats and have better
insight of the impact of this series. BTW, I tried core-image-sato.



> webkitgtk
> before: 9m12s 1550M
> after: 1m40s 858M
> 
> glibc-locale
> before: 2m52s 125M
> after: 30s 56M
> 
> glibc
> before: 46s 54M
> after: 13s 38M
> 
> perl
> before: 1m09s 63M
> after: 45s 42M
> 
> python3
> before: 30s 38M
> after: 18s 24M
> 
> The following changes since commit 576821ea0a7558b626ccc87e9ae0e9ee40864956:
> 
>   bitbake: bitbake-layers: check layer dependencies before adding (2017-06-06 19:52:51 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib akanavin/parallel-rpm
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/parallel-rpm
> 
> Alexander Kanavin (2):
>   package_rpm.bbclass: use multithreaded xz compression
>   rpm: run binary package generation via thread pools
> 
>  meta/classes/package_rpm.bbclass                   |   2 +
>  ...y-package-building-into-a-separate-functi.patch |  83 ++++++++
>  ...-binary-package-creation-via-thread-pools.patch | 125 ++++++++++++
>  ...c-make-operations-over-string-pools-threa.patch | 207 ++++++++++++++++++++
>  ...c-remove-static-local-variables-from-buil.patch | 216 +++++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_git.bb               |   4 +
>  6 files changed, 637 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
> 
> -- 
> 2.11.0
> 



