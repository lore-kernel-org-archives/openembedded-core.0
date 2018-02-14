Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9251A780BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Feb 2018 20:18:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1EKICMN003512
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 14 Feb 2018 12:18:12 -0800
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 14 Feb 2018 12:17:59 -0800
To: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>,
	<openembedded-core@lists.openembedded.org>
References: <1518205465-32581-1-git-send-email-carlos.rodriguez@ridgerun.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <93cbc693-88e8-fa7e-e755-e6731245e2bb@windriver.com>
Date: Wed, 14 Feb 2018 15:18:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1518205465-32581-1-git-send-email-carlos.rodriguez@ridgerun.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [meta-oe][PATCH v2] gst-shark: Add Gst-Shark recipe
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
X-List-Received-Date: Wed, 14 Feb 2018 20:18:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit


Carlos,

meta-multimedia is part of OpenEmbedded not the oe-core layer. See:

http://cgit.openembedded.org/meta-openembedded/tree/meta-multimedia/recipes-multimedia

Please re-send your email to:
   openembedded-devel@lists.openembedded.org

Thanks for incorporating the changes that Ross suggested.
One more try and hopefully the work will be merged.

Thanks,
../Randy

On 2018-02-09 02:44 PM, Carlos Rodriguez wrote:
> Gst-Shark is a set of tracers used as Benchmarks and
> profiling tools for GStreamer. It includes tracers for
> generating debug information plus some tools to analyze
> the debug information. GstShark provides easy to use and
> useful tracers, paired with analysis tools to enable
> straightforward optimizations.
> 
> Signed-off-by: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
> ---
>   .../recipes-multimedia/gstreamer-1.0/gst-shark.inc | 36 ++++++++++++++++++++++
>   .../gstreamer-1.0/gst-shark_0.2.1.bb               |  3 ++
>   2 files changed, 39 insertions(+)
>   create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark.inc
>   create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb
> 
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark.inc b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark.inc
> new file mode 100644
> index 0000000..1841d30
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark.inc
> @@ -0,0 +1,36 @@
> +DESCRIPTION = "RidgeRun Gst-Shark Tracers"
> +SUMMARY = "Benchmarks and profiling tools for GStreamer"
> +HOMEPAGE = "https://developer.ridgerun.com/wiki/index.php?title=GstShark"
> +SECTION = "multimedia"
> +LICENSE = "GPLv2+"
> +
> +DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad "
> +
> +SRCBRANCH ?= "master"
> +
> +SRCREV_base = "a60b3996fe3376d42334fc89014e9d6f6af62899"
> +SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
> +
> +SRC_URI = " \
> +    git://git@github.com/RidgeRun/gst-shark.git;protocol=https;branch=${SRCBRANCH};name=base \
> +    git://anongit.freedesktop.org/git/gstreamer/common.git;protocol=https;destsuffix=git/common;name=common; \
> +    "
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG_CONFARGS = " \
> +	--disable-graphviz \
> +	--enable-gtk-doc=no \
> +"
> +
> +FILES_${PN} += "\
> +	${libdir}/gstreamer-1.0/libgstsharktracers.so  \
> +	${libdir}/gstreamer-1.0/libgstsharktracers.la \
> +"
> +
> +inherit autotools gettext
> +
> +do_configure() {
> +${S}/autogen.sh --noconfigure
> +oe_runconf
> +}
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb
> new file mode 100644
> index 0000000..637bd0e
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb
> @@ -0,0 +1,3 @@
> +require gst-shark.inc
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e1caa368743492879002ad032445fa97"
> \ No newline at end of file
> 


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

