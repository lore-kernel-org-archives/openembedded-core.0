Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 9D32473C63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 15:07:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id DF41660003E
Message-ID: <1435676852.3178.6.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 16:07:32 +0100
In-Reply-To: <1435644409-6631-1-git-send-email-armccurdy@gmail.com>
References: <1435644409-6631-1-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.16.3 (3.16.3-2.fc22) 
Mime-Version: 1.0
Subject: Re: [fido][PATCH] gst-plugins-bad: fix CVE-2015-0797
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
X-List-Received-Date: Tue, 30 Jun 2015 15:07:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-06-29 at 23:06 -0700, Andre McCurdy wrote:
> From: Kang Kai <kai.kang@windriver.com>
> 
> Backport patch from debian to fix CVE-2015-0797.
> 
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=784220
> https://sources.debian.net/data/main/g/gst-plugins-bad0.10/0.10.23
> -7.1+deb7u2/debian/patches/buffer-overflow-mp4.patch
> 
> Backported to oe-core fido from meta-oe/meta-multimedia:
> 
> http://git.openembedded.org/meta
> -openembedded/commit/?id=6cb3b63559bf33946f1c5d43626413d9a651e83f
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>

Queued in my fido-next branch[1] - thanks!

Regards,

Joshua

1. http://cgit.openembedded.org/openembedded-core
-contrib/log/?h=joshuagl/fido-next

> ---
>  .../gst-plugins-bad/buffer-overflow-mp4.patch      | 36 
> ++++++++++++++++++++++
>  .../gstreamer/gst-plugins-bad_0.10.23.bb           |  2 ++
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins
> -bad/buffer-overflow-mp4.patch
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad/buffer
> -overflow-mp4.patch b/meta/recipes-multimedia/gstreamer/gst-plugins
> -bad/buffer-overflow-mp4.patch
> new file mode 100644
> index 0000000..235acda
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad/buffer
> -overflow-mp4.patch
> @@ -0,0 +1,36 @@
> +Description: Fix buffer overflow in mp4 parsing
> +Author: Ralph Giles <giles@mozilla.com>
> +---
> +Backport patch from debian to fix CVE-2015-0797.
> +https://sources.debian.net/data/main/g/gst-plugins-bad0.10/0.10.23
> -7.1+deb7u2/debian/patches/buffer-overflow-mp4.patch
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> +--- gst-plugins-bad0.10-0.10.23.orig/gst/videoparsers/gsth264parse.c
> ++++ gst-plugins-bad0.10-0.10.23/gst/videoparsers/gsth264parse.c
> +@@ -384,6 +384,11 @@ gst_h264_parse_wrap_nal (GstH264Parse *
> + 
> +   GST_DEBUG_OBJECT (h264parse, "nal length %d", size);
> + 
> ++  if (size > G_MAXUINT32 - nl) {
> ++    GST_ELEMENT_ERROR (h264parse, STREAM, FAILED, (NULL),
> ++        ("overflow in nal size"));
> ++    return NULL;
> ++  }
> +   buf = gst_buffer_new_and_alloc (size + nl + 4);
> +   if (format == GST_H264_PARSE_FORMAT_AVC) {
> +     GST_WRITE_UINT32_BE (GST_BUFFER_DATA (buf), size << (32 - 8 * 
> nl));
> +@@ -452,6 +457,11 @@ gst_h264_parse_process_nal (GstH264Parse
> +     GST_DEBUG_OBJECT (h264parse, "not processing nal size %u", nalu
> ->size);
> +     return;
> +   }
> ++  if (G_UNLIKELY (nalu->size > 20 * 1024 * 1024)) {
> ++    GST_DEBUG_OBJECT (h264parse, "not processing nal size %u (too 
> big)",
> ++        nalu->size);
> ++    return;
> ++  }
> + 
> +   /* we have a peek as well */
> +   nal_type = nalu->type;
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins
> -bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins
> -bad_0.10.23.bb
> index 0f64871..4d94483 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
> @@ -10,6 +10,8 @@ DEPENDS += "gst-plugins-base"
>  
>  PR = "r4"
>  
> +SRC_URI += "file://buffer-overflow-mp4.patch"
> +
>  inherit gettext gsettings
>  
>  EXTRA_OECONF += "--disable-experimental \
> -- 
> 1.9.1
> 

