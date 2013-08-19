Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 9F35361037
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 15:13:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 19 Aug 2013 08:13:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,913,1367996400"; d="scan'208";a="383135515"
Received: from unknown (HELO [10.255.14.105]) ([10.255.14.105])
	by fmsmga001.fm.intel.com with ESMTP; 19 Aug 2013 08:13:07 -0700
Message-ID: <52123603.8090406@linux.intel.com>
Date: Mon, 19 Aug 2013 08:13:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Lauren Post <lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1376920938-31121-1-git-send-email-lauren.post@freescale.com>
	<1376920938-31121-2-git-send-email-lauren.post@freescale.com>
In-Reply-To: <1376920938-31121-2-git-send-email-lauren.post@freescale.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] directfb: add fusion patch to fix hangs
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
X-List-Received-Date: Mon, 19 Aug 2013 15:13:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2013 07:02 AM, Lauren Post wrote:
> Fixes test cases in 1.6.3 that had incomplete rendering
> caused by hangs
>
> Upstream-Status: Pending
>
> Signed-off-by: Lauren Post <lauren.post@freescale.com>
> ---
>   meta/recipes-graphics/directfb/directfb.inc        |    3 +-
>   .../directfb/directfb/fusion.patch                 |   31 ++++++++++++++++++++
>   2 files changed, 33 insertions(+), 1 deletion(-)
>   create mode 100755 meta/recipes-graphics/directfb/directfb/fusion.patch
>
> diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
> index 60b12f7..a23209f 100644
> --- a/meta/recipes-graphics/directfb/directfb.inc
> +++ b/meta/recipes-graphics/directfb/directfb.inc
> @@ -14,7 +14,8 @@ DEPENDS = "jpeg libpng freetype zlib tslib"
>   INC_PR = "r0"
>
>   SRC_URI = "http://directfb.org/downloads/Core/DirectFB-1.6/DirectFB-${PV}.tar.gz \
> -           file://configurefix.patch"
> +           file://configurefix.patch \
> +           file://fusion.patch"
>
>   S = "${WORKDIR}/DirectFB-${PV}"
>
> diff --git a/meta/recipes-graphics/directfb/directfb/fusion.patch b/meta/recipes-graphics/directfb/directfb/fusion.patch
> new file mode 100755
> index 0000000..f2a095a
> --- /dev/null
> +++ b/meta/recipes-graphics/directfb/directfb/fusion.patch

The Upstream-Status: tag goes here along with a patch sign-off, the 
commit itself also needs a signoff.

Thanks
	Sau!

> @@ -0,0 +1,31 @@
> +--- a/lib/fusion/fusion.c	2013-01-18 22:57:11.000000000 +0800
> ++++ b/lib/fusion/fusion.c	2013-07-04 10:42:56.502699119 +0800
> +@@ -2853,9 +2853,14 @@
> +           direct_mutex_lock( &world->event_dispatcher_mutex );
> +
> +           while (1) {
> +-               if (!world->event_dispatcher_buffers)
> ++               if (!world->event_dispatcher_buffers){
> +                     direct_waitqueue_wait( &world->event_dispatcher_cond, &world->event_dispatcher_mutex );
> +-
> ++                    if (world->dispatch_stop) {
> ++                         D_DEBUG_AT( Fusion_Main_Dispatch, "  -> IGNORING (dispatch_stop!)\n" );
> ++                         direct_mutex_unlock( &world->event_dispatcher_mutex );
> ++                         return NULL;
> ++                    }
> ++               }
> +                buf = (FusionEventDispatcherBuffer *)world->event_dispatcher_buffers;
> +                D_MAGIC_ASSERT( buf, FusionEventDispatcherBuffer );
> +
> +@@ -2872,6 +2877,11 @@
> + //D_INFO("waiting...\n");
> +                     D_ASSERT( buf->read_pos == buf->write_pos );
> +                     direct_waitqueue_wait( &world->event_dispatcher_cond, &world->event_dispatcher_mutex );
> ++		      if (world->dispatch_stop) {
> ++                         D_DEBUG_AT( Fusion_Main_Dispatch, "  -> IGNORING (dispatch_stop!)\n" );
> ++                         direct_mutex_unlock( &world->event_dispatcher_mutex );
> ++                         return NULL;
> ++                    }
> +                }
> +
> +                buf = (FusionEventDispatcherBuffer *)world->event_dispatcher_buffers;
>

