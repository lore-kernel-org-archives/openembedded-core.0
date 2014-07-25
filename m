Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ECD5065E03
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 20:07:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jul 2014 13:07:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,733,1400050800"; d="scan'208";a="575540459"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO [10.255.13.3])
	([10.255.13.3])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2014 13:07:22 -0700
Message-ID: <53D2B8F9.60809@linux.intel.com>
Date: Fri, 25 Jul 2014 13:07:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Zidan Wang <b50113@freescale.com>, 
	openembedded-core@lists.openembedded.org
References: <1406181217-15706-1-git-send-email-b50113@freescale.com>
In-Reply-To: <1406181217-15706-1-git-send-email-b50113@freescale.com>
Subject: Re: [PATCH] gstreamer1.0-plugins-base: get caps from src pad when query caps in gsttagdemux
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
X-List-Received-Date: Fri, 25 Jul 2014 20:07:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/23/2014 10:53 PM, Zidan Wang wrote:
> From: Wang Zidan <b50113@freescale.com>
>
This and your other patch need to be rebased against master please.

Sau!

> Signed-off-by: Wang Zidan <b50113@freescale.com>
> ---
>   .../get-caps-from-src-pad-when-query-caps.patch    |   44 ++++++++++++++++++++
>   .../gstreamer/gstreamer1.0-plugins-base_1.2.4.bb   |    1 +
>   2 files changed, 45 insertions(+)
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
> new file mode 100644
> index 0000000..0fc561c
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
> @@ -0,0 +1,44 @@
> +From af0dac26f62aaceb4bf266720911953793e0fc5d Mon Sep 17 00:00:00 2001
> +From: zhouming <b42586@freescale.com>
> +Date: Wed, 14 May 2014 10:16:20 +0800
> +Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=728312
> +
> +Upstream Status: Submitted
> +
> +Signed-off-by: zhouming <b42586@freescale.com>
> +---
> + gst-libs/gst/tag/gsttagdemux.c |   13 +++++++++++++
> + 1 file changed, 13 insertions(+)
> + mode change 100644 => 100755 gst-libs/gst/tag/gsttagdemux.c
> +
> +diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttagdemux.c
> +old mode 100644
> +new mode 100755
> +index 9b6c478..ae2294a
> +--- a/gst-libs/gst/tag/gsttagdemux.c
> ++++ b/gst-libs/gst/tag/gsttagdemux.c
> +@@ -1708,6 +1708,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
> +       }
> +       break;
> +     }
> ++    case GST_QUERY_CAPS:
> ++    {
> ++
> ++      /* We can hijack caps query if we typefind already */
> ++      if (demux->priv->src_caps) {
> ++        gst_query_set_caps_result (query, demux->priv->src_caps);
> ++        res = TRUE;
> ++      } else {
> ++        res = gst_pad_query_default (pad, parent, query);
> ++      }
> ++      break;
> ++    }
> ++
> +     default:
> +       res = gst_pad_query_default (pad, parent, query);
> +       break;
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb
> index 6e3d8f9..dee0894 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
>                      "
>
>   SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
> +            file://get-caps-from-src-pad-when-query-caps.patch \
>   "
>
>   SRC_URI[md5sum] = "278e0a1872ecb981e91830b2cb7f3e98"
>

