Return-Path: <nitin.a.kamble@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DBEE060167
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 17:32:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Sep 2014 10:26:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,604,1406617200"; d="scan'208";a="609220700"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by orsmga002.jf.intel.com with ESMTP; 26 Sep 2014 10:32:26 -0700
Received: from orsmsx112.amr.corp.intel.com (10.22.240.13) by
	ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Fri, 26 Sep 2014 10:32:26 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.106]) by
	ORSMSX112.amr.corp.intel.com ([169.254.12.175]) with mapi id
	14.03.0195.001; Fri, 26 Sep 2014 10:32:26 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"Wold, Saul" <saul.wold@intel.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>, "Ashfield, Bruce (Wind River)"
	<bruce.ashfield@windriver.com>, "Zanussi, Tom" <tom.zanussi@intel.com>, 
	"dvhart@linux.intel.com" <dvhart@linux.intel.com>
Thread-Topic: [PATCH 1/1] lttng-modules: fix build issues with the v3.17 kernel
Thread-Index: AQHP2S2nhoEBs3BHlEWX9hNUu92RuJwTrVCA
Date: Fri, 26 Sep 2014 17:32:25 +0000
Message-ID: <D04AF0F4.5A7B%nitin.a.kamble@intel.com>
References: <cover.1411695722.git.nitin.a.kamble@intel.com>
	<2ec710f4e16c92f21c8d5dd001c744e177e5e2ea.1411695722.git.nitin.a.kamble@intel.com>
In-Reply-To: <2ec710f4e16c92f21c8d5dd001c744e177e5e2ea.1411695722.git.nitin.a.kamble@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.4.4.140807
x-originating-ip: [10.254.119.57]
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 26 Sep 2014 17:33:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <943ED494D320614BAD59C74EC3A55BE5@intel.com>
Content-Transfer-Encoding: quoted-printable

RP, Saul,
  FYI, The fix for lttng-modules has gone upstream now. I have updated the
patch accordingly on the contrib branch.

Thanks,
Nitin


On 9/25/14, 7:00 PM, "Kamble, Nitin A" <nitin.a.kamble@intel.com> wrote:

>From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
>The lttng-modules recipe was failing for meta-intel BSPs with the v3.17
>kernel.
>These BSP kernels were enabling some of the audio codec drivers, whose
>structures are changed recently, causing mismatch with lttng-modules code
>expectations. The qemu machines did not see this issue as they were not
>enabling these sound codec kernel configuration.
>  Fix the build issue, by changing the lttng-modules code to match with
>the structures used by the v3.17 kernel. The code is conditional on the
>kernel version, that way it keeps working with the older kernel versions.
>
>Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>---
> .../fix_build_with_v3.17_kernel.patch              | 111
>+++++++++++++++++++++
> meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb   |   1 +
> 2 files changed, 112 insertions(+)
> create mode 100644
>meta/recipes-kernel/lttng/lttng-modules/fix_build_with_v3.17_kernel.patch
>
>diff --git=20
>a/meta/recipes-kernel/lttng/lttng-modules/fix_build_with_v3.17_kernel.patc
>h=20
>b/meta/recipes-kernel/lttng/lttng-modules/fix_build_with_v3.17_kernel.patc
>h
>new file mode 100644
>index 0000000..86dfa69
>--- /dev/null
>+++=20
>b/meta/recipes-kernel/lttng/lttng-modules/fix_build_with_v3.17_kernel.patc
>h
>@@ -0,0 +1,111 @@
>+Upstream-Status: Pending
>+
>+commit 91ec0897b50c9d3f215ce6790b30bc319a136a4e
>+Author: Nitin A Kamble <nitin.a.kamble@intel.com>
>+Date:   Thu Sep 25 16:51:24 2014 -0700
>+
>+    asoc.h: fix build with v3.17 kernel
>+   =20
>+    The snd_soc_codec structure has changed in the v3.17 kernel. Some
>+    of the redundant fields have been removed. To be specific this commit
>+    from the v3.17 kernel causes the build failure for lttng-modules.
>+   =20
>+    |commit f4333203ec933f9272c90c7add01774ec2cf94d3
>+    |Author: Lars-Peter Clausen <lars@metafoo.de>
>+    |Date:   Mon Jun 16 18:13:02 2014 +0200
>+    |
>+    |    ASoC: Move name and id from CODEC/platform to component
>+    |
>+    |    The component struct already has a name and id field which are
>initialized to
>+    |    the same values as the same fields in the CODEC and platform
>structs. So remove
>+    |    them from the CODEC and platform structs and used the ones from
>the component
>+    |    struct instead.
>+    |
>+    |    Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>+    |    Signed-off-by: Mark Brown <broonie@linaro.org>
>+   =20
>+    The asoc.h is changed according to the change in the above kernel
>commit
>+    to fix the lttng-modules build. The change in the lttng-modules code
>is
>+    conditional on the kernel version, so that it does not break builds
>with
>+    previous kernel versions.
>+   =20
>+    Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>+
>+diff --git a/instrumentation/events/lttng-module/asoc.h
>b/instrumentation/events/lttng-module/asoc.h
>+index 672bea4..bf9cf86 100644
>+--- a/instrumentation/events/lttng-module/asoc.h
>++++ b/instrumentation/events/lttng-module/asoc.h
>+@@ -21,6 +21,14 @@ struct snd_soc_card;
>+ struct snd_soc_dapm_widget;
>+ #endif
>+=20
>++#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,16,0))
>++#define CODEC_NAME_FIELD component.name
>++#define CODEC_ID_FIELD component.id
>++#else
>++#define CODEC_NAME_FIELD name
>++#define CODEC_ID_FIELD id
>++#endif
>++
>+ /*
>+  * Log register events
>+  */
>+@@ -32,15 +40,15 @@ DECLARE_EVENT_CLASS(snd_soc_reg,
>+ 	TP_ARGS(codec, reg, val),
>+=20
>+ 	TP_STRUCT__entry(
>+-		__string(	name,		codec->name	)
>++		__string(	name,		codec->CODEC_NAME_FIELD	)
>+ 		__field(	int,		id		)
>+ 		__field(	unsigned int,	reg		)
>+ 		__field(	unsigned int,	val		)
>+ 	),
>+=20
>+ 	TP_fast_assign(
>+-		tp_strcpy(name, codec->name)
>+-		tp_assign(id, codec->id)
>++		tp_strcpy(name, codec->CODEC_NAME_FIELD)
>++		tp_assign(id, codec->CODEC_ID_FIELD)
>+ 		tp_assign(reg, reg)
>+ 		tp_assign(val, val)
>+ 	),
>+@@ -77,15 +85,15 @@ DECLARE_EVENT_CLASS(snd_soc_preg,
>+ 	TP_ARGS(platform, reg, val),
>+=20
>+ 	TP_STRUCT__entry(
>+-		__string(	name,		platform->name	)
>++		__string(	name,		platform->CODEC_NAME_FIELD	)
>+ 		__field(	int,		id		)
>+ 		__field(	unsigned int,	reg		)
>+ 		__field(	unsigned int,	val		)
>+ 	),
>+=20
>+ 	TP_fast_assign(
>+-		tp_strcpy(name, platform->name)
>+-		tp_assign(id, platform->id)
>++		tp_strcpy(name, platform->CODEC_NAME_FIELD)
>++		tp_assign(id, platform->CODEC_ID_FIELD)
>+ 		tp_assign(reg, reg)
>+ 		tp_assign(val, val)
>+ 	),
>+@@ -399,17 +407,17 @@ TRACE_EVENT(snd_soc_cache_sync,
>+ 	TP_ARGS(codec, type, status),
>+=20
>+ 	TP_STRUCT__entry(
>+-		__string(	name,		codec->name	)
>++		__string(	name,		codec->CODEC_NAME_FIELD	)
>+ 		__string(	status,		status		)
>+ 		__string(	type,		type		)
>+ 		__field(	int,		id		)
>+ 	),
>+=20
>+ 	TP_fast_assign(
>+-		tp_strcpy(name, codec->name)
>++		tp_strcpy(name, codec->CODEC_NAME_FIELD)
>+ 		tp_strcpy(status, status)
>+ 		tp_strcpy(type, type)
>+-		tp_assign(id, codec->id)
>++		tp_assign(id, codec->CODEC_ID_FIELD)
>+ 	),
>+=20
>+ 	TP_printk("codec=3D%s.%d type=3D%s status=3D%s", __get_str(name),
>diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
>b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
>index 04e2b0c..6ff961a 100644
>--- a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
>+++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
>@@ -21,6 +21,7 @@ SRC_URI =3D
>"git://git.lttng.org/lttng-modules.git;branch=3Dstable-2.5 \
>           =20
>file://Fix-noargs-probes-should-calculate-alignment-and-eve.patch \
>            file://Update-statedump-to-3.17-nsproxy-locking.patch \
>            file://Update-kvm-instrumentation-compile-on-3.17-rc1.patch \
>+           file://fix_build_with_v3.17_kernel.patch \
>            "
>=20
> export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
>--=20
>1.8.1.4
>


