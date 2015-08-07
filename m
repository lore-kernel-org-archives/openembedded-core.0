Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5A25C76784
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 11:31:29 +0000 (UTC)
Received: by wicgj17 with SMTP id gj17so57777030wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 04:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=avAG8SwZwkIANhWCSfhtCe4Tzsh3ZVj6fROW6810q5A=;
	b=XB/YOBr2pJqRw4xOFnDVJDf0geAO+G/Q3Zm1MFfKVuy7xWQhhH/vvaipcpkz4ExlLv
	Z8XFzGzB1BfVLZAfbl9sdHB5yEM8UrQ1nxaK30cADz7wNW93YXstI0FBFN6IfisKwnEl
	QvMJm8o9jCsA0svBfXU2s7W4g9nixhMGy7H9wvhYSPeCDbM6MeCBA0FL7/up6GolKAJk
	T6qwfglSgKH7pdtC6GtVrWFaorYjwD7+FwwPDbSLoYkcwbqBKCjgXvACYA3bLOSBAMPl
	nOxfqxMiRLRCF0oJ4FcOUVO0f4uBqc2Wm+ZPTVZRHbWSZVMDY+QltKTw47AGiYKWepj9
	pnpw==
X-Gm-Message-State: ALoCoQn1xan58y/fnSfFiFXjujxrRN6kr2GVC5CTZMfzCmotFHS9tGVFMvF4000bS8egTvuy+G2E
X-Received: by 10.194.122.132 with SMTP id ls4mr13338073wjb.130.1438947089740; 
	Fri, 07 Aug 2015 04:31:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.175.160 with HTTP; Fri, 7 Aug 2015 04:31:00 -0700 (PDT)
In-Reply-To: <1438928203-12256-8-git-send-email-b54851@freescale.com>
References: <1438928203-12256-1-git-send-email-b54851@freescale.com>
	<1438928203-12256-8-git-send-email-b54851@freescale.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 7 Aug 2015 14:31:00 +0300
Message-ID: <CAHiDW_GKEkm8Trc2TqDaEydr1xFKJv1+afU6wUPUv_6BHO6bmw@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v7 07/11] gstreamer1.0-plugins-base: Add basetextoverlay related patch
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
X-List-Received-Date: Fri, 07 Aug 2015 11:31:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7 August 2015 at 09:16, Yuqing Zhu <b54851@freescale.com> wrote:
> Make memory copy when video buffer's memory is read only
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>
> ---
>  ...rlay-make-memory-copy-when-video-buffer-s.patch | 129 +++++++++++++++=
++++++
>  .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |   1 +
>  2 files changed, 130 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-base/0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/=
0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch b/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-basetextoverlay-mak=
e-memory-copy-when-video-buffer-s.patch
> new file mode 100644
> index 0000000..03dca95
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ba=
setextoverlay-make-memory-copy-when-video-buffer-s.patch
> @@ -0,0 +1,129 @@
> +From 3781d40940d46d7e6a502092d24aac7997f6da5b Mon Sep 17 00:00:00 2001
> +From: Mingke Wang <mingke.wang@freescale.com>
> +Date: Thu, 5 Mar 2015 12:06:23 +0800
> +Subject: [PATCH 1/4] basetextoverlay: make memory copy when video buffer=
's
> + memory is ready only
> +
> +1. since gst_buffer_make_writable just lookup the refcount to determine =
if
> +   a buffer is writable, and it will use _gst_buffer_copy() which don't
> +   perform a deep memory copy even if the flag of a memory is set to
> +   GST_MEMORY_FLAG_READONLY. So, we detect the memory flag and use
> +   gst_buffer_copy_region with GST_BUFFER_COPY_DEEP parameter to perform
> +   deep memory copy. if the allocator of a memory don't support mem_copy
> +   interface, the it will return NULL, if this case, we can use
> +   gst_buffer_make_writable() to get a shared memory buffer or the orign=
al
> +   buffer if the buffer's refcount is 1.
> +2.  new feature is no added if caps has no feature during caps negotiati=
on
> +
> +Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=
=3D747495]

I'd like to thank you for providing good upstream links: they're very helpf=
ul.

In this particular case it shows that gstreamer developers have doubts
about the patch and it seems likely the patch will not be accepted as
is, or possibly at all: Tim and Nicolas don't seem convinced yet that
this is fixing an actual bug.

- Jussi

> +
> +Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
> +
> +diff --git a/ext/pango/gstbasetextoverlay.c b/ext/pango/gstbasetextoverl=
ay.c
> +index c919861..3c0a1d7 100755
> +--- a/ext/pango/gstbasetextoverlay.c
> ++++ b/ext/pango/gstbasetextoverlay.c
> +@@ -747,6 +747,7 @@ gst_base_text_overlay_negotiate (GstBaseTextOverlay =
* overlay, GstCaps * caps)
> +     if (f =3D=3D NULL) {
> +       f =3D gst_caps_features_new
> +           (GST_CAPS_FEATURE_META_GST_VIDEO_OVERLAY_COMPOSITION, NULL);
> ++      gst_caps_set_features(overlay_caps, 0, f);
> +     } else {
> +       gst_caps_features_add (f,
> +           GST_CAPS_FEATURE_META_GST_VIDEO_OVERLAY_COMPOSITION);
> +@@ -1890,16 +1891,71 @@ gst_base_text_overlay_push_frame (GstBaseTextOve=
rlay * overlay,
> +   if (gst_pad_check_reconfigure (overlay->srcpad))
> +     gst_base_text_overlay_negotiate (overlay, NULL);
> +
> +-  video_frame =3D gst_buffer_make_writable (video_frame);
> +-
> +   if (overlay->attach_compo_to_buffer) {
> +     GST_DEBUG_OBJECT (overlay, "Attaching text overlay image to video b=
uffer");
> ++    video_frame =3D gst_buffer_make_writable (video_frame);
> +     gst_buffer_add_video_overlay_composition_meta (video_frame,
> +         overlay->composition);
> +     /* FIXME: emulate shaded background box if want_shading=3Dtrue */
> +     goto done;
> +   }
> +
> ++  gint m =3D gst_buffer_n_memory(video_frame);
> ++  gboolean mem_rdonly =3D FALSE;
> ++  GstMemory *mem;
> ++  GstBuffer *orig =3D video_frame;
> ++
> ++  while (--m>=3D0) {
> ++    mem =3D gst_buffer_get_memory(video_frame, m);
> ++    if (GST_MEMORY_IS_READONLY(mem)) {
> ++      mem_rdonly =3D TRUE;
> ++      gst_memory_unref (mem);
> ++      break;
> ++    }
> ++    gst_memory_unref (mem);
> ++  }
> ++
> ++  if (mem_rdonly) {
> ++    // since gst_buffer_make_writable just lookup the refcount to deter=
mine if
> ++    // a buffer is writable, and it will use _gst_buffer_copy() which d=
on't
> ++    // perform a deep memory copy even if the flag of a memory is set t=
o
> ++    // GST_MEMORY_FLAG_READONLY. So, we detect the memory flag and use
> ++    // gst_buffer_copy_region with GST_BUFFER_COPY_DEEP parameter to pe=
rform
> ++    // deep memory copy. if the allocator of a memory don't support mem=
_copy
> ++    // interface, the it will return NULL, if this case, we can use
> ++    // gst_buffer_make_writable() to get a shared memory buffer or the =
orignal
> ++    // buffer if the buffer's refcount is 1.
> ++    GstBuffer *new_buf =3D gst_buffer_copy_region (video_frame,
> ++        GST_BUFFER_COPY_ALL | GST_BUFFER_COPY_DEEP, 0, -1);
> ++
> ++    GST_DEBUG_OBJECT (overlay, "copy %s video frame buffer %p -> %p",
> ++        g_type_name (GST_MINI_OBJECT_TYPE (video_frame)), video_frame, =
new_buf);
> ++
> ++    if (!new_buf) {
> ++      //maybe the allocator don't support mem_copy interface, the we ju=
st use
> ++      //gst_buffer_make_writable() to get a writable buffer.
> ++      video_frame =3D gst_buffer_make_writable (video_frame);
> ++    } else {
> ++      gst_mini_object_unref (video_frame);
> ++      GST_BUFFER_FLAG_UNSET (new_buf, GST_BUFFER_FLAG_TAG_MEMORY);
> ++      video_frame =3D new_buf;
> ++    }
> ++
> ++    if (!video_frame) {
> ++      GST_WARNING_OBJECT (overlay, "make writable buffer failed");
> ++      return GST_FLOW_OK;
> ++    }
> ++
> ++    m =3D gst_buffer_n_memory(video_frame);
> ++    while (--m>=3D0) {
> ++      mem =3D gst_buffer_get_memory(video_frame, m);
> ++      GST_MEMORY_FLAG_UNSET (mem, GST_MEMORY_FLAG_READONLY);
> ++      gst_memory_unref (mem);
> ++    }
> ++  } else {
> ++    video_frame =3D gst_buffer_make_writable (video_frame);
> ++  }
> ++
> +   if (!gst_video_frame_map (&frame, &overlay->info, video_frame,
> +           GST_MAP_READWRITE))
> +     goto invalid_frame;
> +@@ -1918,6 +1974,18 @@ gst_base_text_overlay_push_frame (GstBaseTextOver=
lay * overlay,
> +
> +   gst_video_frame_unmap (&frame);
> +
> ++  if (mem_rdonly && orig =3D=3D video_frame) {
> ++    //if we used the original buffer and it's mem is set to read only,
> ++    //recover the memory ready only flag since we unset it before
> ++    // gst_video_frame_map ()
> ++    m =3D gst_buffer_n_memory(video_frame);
> ++    while (--m>=3D0) {
> ++      mem =3D gst_buffer_get_memory(video_frame, m);
> ++      GST_MEMORY_FLAGS(mem) |=3D (GST_MEMORY_FLAG_READONLY);
> ++      gst_memory_unref (mem);
> ++    }
> ++  }
> ++
> + done:
> +
> +   return gst_pad_push (overlay->srcpad, video_frame);
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_=
1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.=
5.bb
> index 37bef6d..7aba40d 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.b=
b
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.b=
b
> @@ -17,6 +17,7 @@ SRC_URI +=3D "file://do-not-change-eos-event-to-gap-eve=
nt-if.patch \
>              file://videoencoder-Keep-sticky-events-around-when-doing-a-s=
oft-.patch \
>              file://do-not-change-eos-event-to-gap-event2.patch \
>              file://do-not-change-eos-event-to-gap-event3.patch \
> +            file://0001-basetextoverlay-make-memory-copy-when-video-buff=
er-s.patch \
>  "
>
>  SRC_URI[md5sum] =3D "357165af625c0ca353ab47c5d843920e"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

