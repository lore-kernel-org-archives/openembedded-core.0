Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id DE8CE6AD1A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 09:00:36 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Jun 2013 02:00:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,957,1363158000"; d="scan'208";a="261322350"
Received: from unknown (HELO helios.localnet) ([10.252.122.97])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jun 2013 02:00:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Kai Kang <kai.kang@windriver.com>
Date: Fri, 28 Jun 2013 10:00:21 +0100
Message-ID: <2137104.dM5Hszjkko@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <0b6b3178a957a5f1719d6e7d3de74ef10e997266.1372403777.git.kai.kang@windriver.com>
References: <cover.1372403777.git.kai.kang@windriver.com>
	<0b6b3178a957a5f1719d6e7d3de74ef10e997266.1372403777.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] Disable build qt related packagegroups on mips64 with 64 bits userspace
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
X-List-Received-Date: Fri, 28 Jun 2013 09:00:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Kai,

On Friday 28 June 2013 15:48:47 Kai Kang wrote:
> Because qt could not be built on mips64 with 64 bits userspace, set
> COMPATIBLE_HOST for qt related packagegroups to disable them on mips64
> with 64 bit userspace too.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../packagegroups/packagegroup-core-qt.bb          |    3 +++
>  .../packagegroups/packagegroup-core-qt4e.bb        |    3 +++
>  .../packagegroup-qt-toolchain-target.inc           |    3 +++
>  3 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
> b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb index
> 315df33..c993242 100644
> --- a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
> +++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
> @@ -6,6 +6,9 @@ DESCRIPTION = "Qt package groups"
>  LICENSE = "MIT"
>  PR = "r4"
> 
> +# Qt4 could NOT be built on MIPS64 with 64 bits userspace
> +COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
> +
>  inherit packagegroup
> 
>  PACKAGES = "${PN}-demoapps"
> diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
> b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb index
> 9263828..6ef844f 100644
> --- a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
> +++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
> @@ -2,6 +2,9 @@ SUMMARY = "Qt for Embedded Linux (Qt without X11)"
>  PR = "r2"
>  LICENSE = "MIT"
> 
> +# Qt4 could NOT be built on MIPS64 with 64 bits userspace
> +COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
> +
>  inherit packagegroup
> 
>  # For backwards compatibility after rename
> diff --git
> a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
> b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc index
> 8413eec..fc1ccba 100644
> --- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
> +++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
> @@ -1,5 +1,8 @@
>  LICENSE = "MIT"
> 
> +# Qt4 could NOT be built on MIPS64 with 64 bits userspace
> +COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
> +
>  inherit packagegroup
> 
>  PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"

I'm fine with the other change; the question is is this one needed in addition? 
Since the packagegroup-*qt* recipes reference packages from Qt which itself 
inherits qt4x11/qt4e bbclasses, surely trying to build these will immediately 
fail for mips64 anyway?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

