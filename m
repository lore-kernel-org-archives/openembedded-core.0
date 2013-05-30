Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2788160897
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:53:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 May 2013 06:51:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,770,1363158000"; d="scan'208";a="345715202"
Received: from unknown (HELO helios.localnet) ([10.252.121.217])
	by orsmga002.jf.intel.com with ESMTP; 30 May 2013 06:52:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
Date: Thu, 30 May 2013 14:52:50 +0100
Message-ID: <1956799.LN9zTEVmsc@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-22-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1369834810-18927-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1369834810-18927-1-git-send-email-bogdan.a.marinescu@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] guile: added runtime dependency on glibc-gconv-iso8859-1
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
X-List-Received-Date: Thu, 30 May 2013 13:53:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 29 May 2013 16:40:10 Bogdan Marinescu wrote:
> guile needs to be able to convert strings from ISO-8859-1 in order
> to work properly. This patch adds a runtime dependency to the required
> convert package, but only when glibc is used. The fix for uClibc depends
> on another bug (#4530).
> 
> [YOCTO #4019]
> 
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>  meta/recipes-devtools/guile/guile_2.0.9.bb |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/guile/guile_2.0.9.bb
> b/meta/recipes-devtools/guile/guile_2.0.9.bb index 617f7ce..8ba7afc 100644
> --- a/meta/recipes-devtools/guile/guile_2.0.9.bb
> +++ b/meta/recipes-devtools/guile/guile_2.0.9.bb
> @@ -27,7 +27,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
>  SRC_URI[md5sum] = "a69b575d4a633bdd9118f3a4a1e97766"
>  SRC_URI[sha256sum] =
> "f70a38c8d9751f442679bfe61852bba8545af4d4355d037630997c2f37f2895b"
> 
> -PR = "r0"
> +PR = "r1"
> 
>  inherit autotools gettext
>  BBCLASSEXTEND = "native"
> @@ -36,6 +36,9 @@ DEPENDS = "libunistring bdwgc gmp libtool libffi"
>  # add guile-native only to the target recipe's DEPENDS
>  DEPENDS += "${@['guile-native libatomics-ops', ''][d.getVar('PN', True) !=
> 'guile']}"
> 
> +RDEPENDS_${PN}_append_libc-glibc_class-target = "glibc-gconv-iso8859-1"
> +RDEPENDS_${PN}_class-native = ""

The second line is erroneous, surely we only need the first to solve this 
issue?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

