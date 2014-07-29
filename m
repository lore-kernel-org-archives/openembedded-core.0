Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 761F970181
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 21:03:45 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id D840D33129
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 23:03:46 +0200 (CEST)
Message-ID: <53D80C32.7020101@pseudoterminal.org>
Date: Tue, 29 Jul 2014 23:03:46 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1406667203-14914-1-git-send-email-dv@pseudoterminal.org>
In-Reply-To: <1406667203-14914-1-git-send-email-dv@pseudoterminal.org>
Subject: Re: [PATCH 1/7] gstreamer1.0: upgrade to 1.4.0
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
X-List-Received-Date: Tue, 29 Jul 2014 21:03:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Disregard this version - I just noticed the paths do not contain the 
meta/ directory. I'll resend a v2.



On 07/29/2014 10:53 PM, Carlos Rafael Giani wrote:
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>   ...s-rate-of-input-segment-to-output-segment.patch | 32 ----------------------
>   ...gstreamer1.0_1.2.4.bb => gstreamer1.0_1.4.0.bb} |  5 ++--
>   2 files changed, 2 insertions(+), 35 deletions(-)
>   delete mode 100644 recipes-multimedia/gstreamer/gstreamer1.0/0001-pass-rate-of-input-segment-to-output-segment.patch
>   rename recipes-multimedia/gstreamer/{gstreamer1.0_1.2.4.bb => gstreamer1.0_1.4.0.bb} (64%)
>
> diff --git a/recipes-multimedia/gstreamer/gstreamer1.0/0001-pass-rate-of-input-segment-to-output-segment.patch b/recipes-multimedia/gstreamer/gstreamer1.0/0001-pass-rate-of-input-segment-to-output-segment.patch
> deleted file mode 100644
> index be6c834..0000000
> --- a/recipes-multimedia/gstreamer/gstreamer1.0/0001-pass-rate-of-input-segment-to-output-segment.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From e70334442ba3bb046a6389bb3d8549323dc1e7f0 Mon Sep 17 00:00:00 2001
> -From: zhouming <zmafox@gmail.com>
> -Date: Wed, 7 May 2014 18:26:38 +0800
> -Subject: [PATCH] pass rate of input segment to output segment.
> -
> -https://bugzilla.gnome.org/show_bug.cgi?id=729701
> -
> -Commit - 2793f808ee7fbebc7de2c7b733c6e94dac6a099f  in master branch
> -
> -Upstream Status: Backported
> -
> -Signed-off-by: <zmafox@gmail.com>
> ----
> - libs/gst/base/gstbaseparse.c |    2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/libs/gst/base/gstbaseparse.c b/libs/gst/base/gstbaseparse.c
> -index 4378cad..7579b5e 100644
> ---- a/libs/gst/base/gstbaseparse.c
> -+++ b/libs/gst/base/gstbaseparse.c
> -@@ -1012,6 +1012,8 @@ gst_base_parse_sink_event_default (GstBaseParse * parse, GstEvent * event)
> -
> -       gst_event_parse_segment (event, &in_segment);
> -       gst_segment_init (&out_segment, GST_FORMAT_TIME);
> -+      out_segment.rate = in_segment->rate;
> -+      out_segment.applied_rate = in_segment->applied_rate;
> -
> -       GST_DEBUG_OBJECT (parse, "segment %" GST_SEGMENT_FORMAT, in_segment);
> -
> ---
> -1.7.9.5
> -
> diff --git a/recipes-multimedia/gstreamer/gstreamer1.0_1.2.4.bb b/recipes-multimedia/gstreamer/gstreamer1.0_1.4.0.bb
> similarity index 64%
> rename from recipes-multimedia/gstreamer/gstreamer1.0_1.2.4.bb
> rename to recipes-multimedia/gstreamer/gstreamer1.0_1.4.0.bb
> index 535b681..a958064 100644
> --- a/recipes-multimedia/gstreamer/gstreamer1.0_1.2.4.bb
> +++ b/recipes-multimedia/gstreamer/gstreamer1.0_1.4.0.bb
> @@ -6,10 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
>   SRC_URI = " \
>       http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
>       file://0001-Fix-crash-with-gst-inspect.patch \
> -    file://0001-pass-rate-of-input-segment-to-output-segment.patch \
>   "
>   
> -SRC_URI[md5sum] = "74d8f674187a5f0ddf38da594c3998c3"
> -SRC_URI[sha256sum] = "1e7ca67a7870a82c9ed51d51d0008cdbc550c41d64cc3ff3f9a1c2fc311b4929"
> +SRC_URI[md5sum] = "594c0c06eaace9b9d3bad010de1bdfae"
> +SRC_URI[sha256sum] = "23c39fdc2b24f889b07cab0449825384fef7592a121e180729fd9025ec45c695"
>   S = "${WORKDIR}/gstreamer-${PV}"
>   


