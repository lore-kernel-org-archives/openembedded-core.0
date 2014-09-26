Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 975E770EBE
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 02:23:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8Q2N6c7026993
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Sep 2014 19:23:06 -0700 (PDT)
Received: from server.local (147.11.116.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 25 Sep 2014 19:23:06 -0700
Message-ID: <5424CE09.1010108@windriver.com>
Date: Thu, 25 Sep 2014 22:23:05 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <nitin.a.kamble@intel.com>, <richard.purdie@linuxfoundation.org>,
	<saul.wold@intel.com>, <Openembedded-core@lists.openembedded.org>,
	<tom.zanussi@intel.com>, <dvhart@linux.intel.com>
References: <cover.1411695722.git.nitin.a.kamble@intel.com>
	<2ec710f4e16c92f21c8d5dd001c744e177e5e2ea.1411695722.git.nitin.a.kamble@intel.com>
In-Reply-To: <2ec710f4e16c92f21c8d5dd001c744e177e5e2ea.1411695722.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 1/1] lttng-modules: fix build issues with the v3.17 kernel
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
X-List-Received-Date: Fri, 26 Sep 2014 02:23:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-09-25, 10:00 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> The lttng-modules recipe was failing for meta-intel BSPs with the v3.17 kernel.
> These BSP kernels were enabling some of the audio codec drivers, whose
> structures are changed recently, causing mismatch with lttng-modules code
> expectations. The qemu machines did not see this issue as they were not
> enabling these sound codec kernel configuration.
>    Fix the build issue, by changing the lttng-modules code to match with
> the structures used by the v3.17 kernel. The code is conditional on the
> kernel version, that way it keeps working with the older kernel versions.
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>   .../fix_build_with_v3.17_kernel.patch              | 111 +++++++++++++++++++++
>   meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb   |   1 +
>   2 files changed, 112 insertions(+)
>   create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix_build_with_v3.17_kernel.patch
>
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/fix_build_with_v3.17_kernel.patch b/meta/recipes-kernel/lttng/lttng-modules/fix_build_with_v3.17_kernel.patch
> new file mode 100644
> index 0000000..86dfa69
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-modules/fix_build_with_v3.17_kernel.patch
> @@ -0,0 +1,111 @@
> +Upstream-Status: Pending
> +
> +commit 91ec0897b50c9d3f215ce6790b30bc319a136a4e
> +Author: Nitin A Kamble <nitin.a.kamble@intel.com>
> +Date:   Thu Sep 25 16:51:24 2014 -0700
> +
> +    asoc.h: fix build with v3.17 kernel
> +
> +    The snd_soc_codec structure has changed in the v3.17 kernel. Some
> +    of the redundant fields have been removed. To be specific this commit
> +    from the v3.17 kernel causes the build failure for lttng-modules.
> +
> +    |commit f4333203ec933f9272c90c7add01774ec2cf94d3
> +    |Author: Lars-Peter Clausen <lars@metafoo.de>
> +    |Date:   Mon Jun 16 18:13:02 2014 +0200
> +    |
> +    |    ASoC: Move name and id from CODEC/platform to component
> +    |
> +    |    The component struct already has a name and id field which are initialized to
> +    |    the same values as the same fields in the CODEC and platform structs. So remove
> +    |    them from the CODEC and platform structs and used the ones from the component
> +    |    struct instead.
> +    |
> +    |    Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> +    |    Signed-off-by: Mark Brown <broonie@linaro.org>
> +
> +    The asoc.h is changed according to the change in the above kernel commit
> +    to fix the lttng-modules build. The change in the lttng-modules code is
> +    conditional on the kernel version, so that it does not break builds with
> +    previous kernel versions.

Nice fix. To be consistent with other patches for lttng, we should probably
put an upstream-status field in the header.

Are you going to send this to the project ? They'll probably want to
tweak it, but for our purposes, this builds and looks fine.

Bruce

> +
> +    Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> +
> +diff --git a/instrumentation/events/lttng-module/asoc.h b/instrumentation/events/lttng-module/asoc.h
> +index 672bea4..bf9cf86 100644
> +--- a/instrumentation/events/lttng-module/asoc.h
> ++++ b/instrumentation/events/lttng-module/asoc.h
> +@@ -21,6 +21,14 @@ struct snd_soc_card;
> + struct snd_soc_dapm_widget;
> + #endif
> +
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,16,0))
> ++#define CODEC_NAME_FIELD component.name
> ++#define CODEC_ID_FIELD component.id
> ++#else
> ++#define CODEC_NAME_FIELD name
> ++#define CODEC_ID_FIELD id
> ++#endif
> ++
> + /*
> +  * Log register events
> +  */
> +@@ -32,15 +40,15 @@ DECLARE_EVENT_CLASS(snd_soc_reg,
> + 	TP_ARGS(codec, reg, val),
> +
> + 	TP_STRUCT__entry(
> +-		__string(	name,		codec->name	)
> ++		__string(	name,		codec->CODEC_NAME_FIELD	)
> + 		__field(	int,		id		)
> + 		__field(	unsigned int,	reg		)
> + 		__field(	unsigned int,	val		)
> + 	),
> +
> + 	TP_fast_assign(
> +-		tp_strcpy(name, codec->name)
> +-		tp_assign(id, codec->id)
> ++		tp_strcpy(name, codec->CODEC_NAME_FIELD)
> ++		tp_assign(id, codec->CODEC_ID_FIELD)
> + 		tp_assign(reg, reg)
> + 		tp_assign(val, val)
> + 	),
> +@@ -77,15 +85,15 @@ DECLARE_EVENT_CLASS(snd_soc_preg,
> + 	TP_ARGS(platform, reg, val),
> +
> + 	TP_STRUCT__entry(
> +-		__string(	name,		platform->name	)
> ++		__string(	name,		platform->CODEC_NAME_FIELD	)
> + 		__field(	int,		id		)
> + 		__field(	unsigned int,	reg		)
> + 		__field(	unsigned int,	val		)
> + 	),
> +
> + 	TP_fast_assign(
> +-		tp_strcpy(name, platform->name)
> +-		tp_assign(id, platform->id)
> ++		tp_strcpy(name, platform->CODEC_NAME_FIELD)
> ++		tp_assign(id, platform->CODEC_ID_FIELD)
> + 		tp_assign(reg, reg)
> + 		tp_assign(val, val)
> + 	),
> +@@ -399,17 +407,17 @@ TRACE_EVENT(snd_soc_cache_sync,
> + 	TP_ARGS(codec, type, status),
> +
> + 	TP_STRUCT__entry(
> +-		__string(	name,		codec->name	)
> ++		__string(	name,		codec->CODEC_NAME_FIELD	)
> + 		__string(	status,		status		)
> + 		__string(	type,		type		)
> + 		__field(	int,		id		)
> + 	),
> +
> + 	TP_fast_assign(
> +-		tp_strcpy(name, codec->name)
> ++		tp_strcpy(name, codec->CODEC_NAME_FIELD)
> + 		tp_strcpy(status, status)
> + 		tp_strcpy(type, type)
> +-		tp_assign(id, codec->id)
> ++		tp_assign(id, codec->CODEC_ID_FIELD)
> + 	),
> +
> + 	TP_printk("codec=%s.%d type=%s status=%s", __get_str(name),
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> index 04e2b0c..6ff961a 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> @@ -21,6 +21,7 @@ SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.5 \
>              file://Fix-noargs-probes-should-calculate-alignment-and-eve.patch \
>              file://Update-statedump-to-3.17-nsproxy-locking.patch \
>              file://Update-kvm-instrumentation-compile-on-3.17-rc1.patch \
> +           file://fix_build_with_v3.17_kernel.patch \
>              "
>
>   export INSTALL_MOD_DIR="kernel/lttng-modules"
>


