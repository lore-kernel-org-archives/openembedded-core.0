Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 62B516B009
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 20:51:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Aug 2013 13:49:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,962,1367996400"; d="scan'208";a="393700153"
Received: from unknown (HELO [10.255.14.139]) ([10.255.14.139])
	by orsmga002.jf.intel.com with ESMTP; 26 Aug 2013 13:51:46 -0700
Message-ID: <521BBFDB.9030401@linux.intel.com>
Date: Mon, 26 Aug 2013 13:51:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Joe Slater <jslater@windriver.com>
References: <1377550010-14358-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1377550010-14358-1-git-send-email-jslater@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] dpkg: fix configuration issure for mips64
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
X-List-Received-Date: Mon, 26 Aug 2013 20:51:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/26/2013 01:46 PM, Joe Slater wrote:
> CQID: 431771
>
> configure cannot determine the proper cpu, os, or
> architeture for mips64, and possibly other arch's
> because of faulty code added to Arch.pm in the latest
> release from upstream.  We remove that code.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>   meta/recipes-devtools/dpkg/dpkg/arch_pm.patch |   19 +++++++++++++++++++
>   meta/recipes-devtools/dpkg/dpkg_1.17.1.bb     |    1 +
>   2 files changed, 20 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
>
> diff --git a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
> new file mode 100644
> index 0000000..2ce5ef3
> --- /dev/null
> +++ b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
> @@ -0,0 +1,19 @@
> +configure cannot determine the proper cpu, os, or
> +architeture for mips64, and possibly other arch's
> +because of faulty code added to Arch.pm in the latest
> +release from upstream.  We remove that code.
> +
> +Upstream status: pending
> +
Should be Upstream-Status: Pending

and no Signed-off-by:

Sau!

> +--- a/scripts/Dpkg/Arch.pm
> ++++ b/scripts/Dpkg/Arch.pm
> +@@ -233,9 +233,6 @@ sub read_triplettable()
> + 		    (my $dt = $debtriplet) =~ s/<cpu>/$_cpu/;
> + 		    (my $da = $debarch) =~ s/<cpu>/$_cpu/;
> +
> +-		    next if exists $debarch_to_debtriplet{$da}
> +-		         or exists $debtriplet_to_debarch{$dt};
> +-
> + 		    $debarch_to_debtriplet{$da} = $dt;
> + 		    $debtriplet_to_debarch{$dt} = $da;
> + 		}
> diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb
> index 9ac2aa7..e436f4e 100644
> --- a/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb
> +++ b/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb
> @@ -7,6 +7,7 @@ SRC_URI += "file://noman.patch \
>               file://preinst.patch \
>               file://fix-timestamps.patch \
>               file://remove-tar-no-timestamp.patch \
> +            file://arch_pm.patch \
>              "
>
>   SRC_URI[md5sum] = "ece3ae87a099158c17bde95c0036c575"
>

