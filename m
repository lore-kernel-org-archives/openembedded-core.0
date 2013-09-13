Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E8C8660135
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 17:40:29 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Sep 2013 10:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,899,1371106800"; d="scan'208";a="360124026"
Received: from unknown (HELO [10.255.15.78]) ([10.255.15.78])
	by azsmga001.ch.intel.com with ESMTP; 13 Sep 2013 10:40:27 -0700
Message-ID: <52334E09.4030905@linux.intel.com>
Date: Fri, 13 Sep 2013 10:40:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>
References: <cover.1379073449.git.hongxu.jia@windriver.com>
	<a8596b9162366df23d07ad8206ddb0ce8863b699.1379073449.git.hongxu.jia@windriver.com>
In-Reply-To: <a8596b9162366df23d07ad8206ddb0ce8863b699.1379073449.git.hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] LSB 4.1 Library Check: fix unable to find library libqt-mt.so.3
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
X-List-Received-Date: Fri, 13 Sep 2013 17:40:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2013 05:02 AM, Hongxu Jia wrote:
> The libqt-mt is tested by lsb-dist-checker and lsb-test-desktop,
> and it locates in meta-qt3 layer.
> So if meta-qt3 is not added, there should be a warning to call
> attention; if added, it will add libqt-mt to RDEPENDS.
>
> [YOCTO #5153]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> index 1c1a8d1..f83c5d7 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> @@ -193,6 +193,15 @@ RDEPENDS_packagegroup-core-lsb-python = "\
>       python-misc \
>   "
>
> +def get_libqt3(d):
> +    if 'qt3' in d.getVar('BBFILE_COLLECTIONS') or "":
> +        return 'libqt-mt3'
> +
I think this should have a check for linuxstdbase so it does not print 
out at other times.

Sau!

> +    bb.warn('The meta-qt3 layer should be added, this layer provides Qt 3.x')
> +    bb.warn('libraries. Its intended use is for passing LSB tests as Qt3 is')
> +    bb.warn('a requirement for LSB')
> +    return ''
> +
>   SUMMARY_packagegroup-core-lsb-desktop = "LSB Desktop"
>   DESCRIPTION_packagegroup-core-lsb-desktop = "Packages required to support libraries \
>       specified in the LSB Desktop specification"
> @@ -221,6 +230,7 @@ RDEPENDS_packagegroup-core-lsb-desktop = "\
>       atk \
>       libasound \
>       ${@base_contains("DISTRO_FEATURES", "opengl", "libqtopengl4", "", d)} \
> +    ${@get_libqt3(d)} \
>   "
>
>   RDEPENDS_packagegroup-core-lsb-runtime-add = "\
>

