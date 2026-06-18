Return-Path: <tdarote@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A790CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 07:01:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13813.1781766068374834769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 00:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SFTUaXAH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: tdarote@qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I3WghN2976605;
	Thu, 18 Jun 2026 07:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tsB3/zsdi/V7dGQ2fQinfQRR90VL0SZ3mMM
	/5yYvJJU=; b=SFTUaXAHPyEJqK56rmATUZI7kwqYgH05OSQBJeW0FwvaBn/d8CY
	qPlqTBV9QVf/5xa36Z4FVCtaunFrNBgzjwwUS1oqov1rMgvJfcWJx8KGL8KH8nMi
	KuewRY6VuDq4ycrfLSiT5k9GGbjVsH4rAfHBNkJashM1HtgEo7Hxwrac6wPBtMfq
	NRhPdydKu5Urhh8RN5vfA1gkXgu22Lef35Dpw+vvaZewTFNWVrgNrjsr+3+/0uZX
	//FwPLFKLf5DaLmgm1Qbws7vwZp33XWeNjYpWWvjdmBU7grvrdIE7vBXyJ8u5gIQ
	2pxgXX9J5zteUB4EmtYq8uhZ6QZW38X7scw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2cbaq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 07:01:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65I710Uc018873;
	Thu, 18 Jun 2026 07:01:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4es09knade-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 07:01:00 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65I710BW018864;
	Thu, 18 Jun 2026 07:01:00 GMT
Received: from hyd-lnxbld389.qualcomm.com (hyd-lnxbld389.qualcomm.com [10.142.195.70])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65I70xse018857
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 07:01:00 +0000 (GMT)
Received: by hyd-lnxbld389.qualcomm.com (Postfix, from userid 4146169)
	id BC401225F2; Thu, 18 Jun 2026 12:30:58 +0530 (IST)
From: Tushar Darote <tdarote@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Tushar Darote <tdarote@qti.qualcomm.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] gstreamer1.0-plugins-bad: handle padded buffers in wl_shm buffer creation
Date: Thu, 18 Jun 2026 12:30:54 +0530
Message-Id: <20260618070054.543418-1-tdarote@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA2MiBTYWx0ZWRfX+AjR1siNzBia
 A0BdooSX7qeTgN5XdI5nQHOjVNAYg53D8iYxWe2JDJkxTNTJExEkeCsyilS0S78/znh3QwHApSd
 dYT5Zirp/seEWGGk8qcNznNY40141CllGXzT91MEofHoxw1oJd+59pnR/y/M5KNlnt/NDXL34kI
 wXTTuUoyy9ElMIhiiiK6EuKeMz9jOTKjG6vSDOFndPlm/0M7aPlFJ5Cb32bTEfVwToj2GbI+19Q
 gRfMJg/GlZFjPNsz1gesTvtUjDEKQEjf4xjzqsOe0C8mtBO/woTteTKNCt3lD7ohQi/P2XPIY2f
 0j0MQgO3fE7DPqI0qQ1tIic4r7Vl6lNTFkho8/1ohVnIFWB560ddAP3beMwZB9J18o/yDzETC0j
 dxY4dHlKwqEqpcJujQlS2VAE95zfF8UdGzex0oAkLZp0STPFi2Dp00HuGnWVSkP3Ka3kxu1ZuWv
 0fyqk195nFG3ceTaQLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA2MiBTYWx0ZWRfXwY9Vza0yaApR
 cjyB6bLMyiTgsAjq+Cgt1fg9JFGbMrPIED/ZAMRjo3SIbL6QAvAv9p5gCSEs8kw1VxGEA53MUhC
 0FzIc+WUuvOI2DVen9I4JZ6MXLzfB+w=
X-Proofpoint-GUID: CXcraLXZOKWeYhcvwZRaYugFbUi51p8G
X-Proofpoint-ORIG-GUID: CXcraLXZOKWeYhcvwZRaYugFbUi51p8G
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a3397b0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8
 a=ag1SF4gXAAAA:8 a=Uc49ZF9OE0rpvxTMQ1MA:9 a=Vxmtnl_E_bksehYqCbjh:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 07:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239054

Use GstBuffer metadata when constructing wl_shm buffers so stride and size reflect the actual buffer layout.
This fixes incorrect rendering with DMA-backed buffers that include padding or custom strides.
(cherry picked from commit 866915fa7bcbe563849aa1100033c684a805fc24)

Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...added-buffers-in-wl_shm-buffer-creat.patch | 238 ++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.28.2.bb        |   1 +
 2 files changed, 239 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
new file mode 100644
index 0000000000..2bb00e2b1d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
@@ -0,0 +1,238 @@
+From 2af4bc8562f970207e3b1f6fc0b377ecf116a69c Mon Sep 17 00:00:00 2001
+From: Tushar Darote <tdarote@qti.qualcomm.com>
+Date: Mon, 8 Jun 2026 18:05:51 +0530
+Subject: [PATCH] wayland: handle padded buffers in wl_shm buffer creation
+
+Use GstBuffer metadata when constructing wl_shm buffers so stride and
+size reflect the actual buffer layout. This fixes incorrect rendering
+with DMA-backed buffers that include padding or custom strides.
+
+gst_wl_shm_memory_construct_wl_buffer() now takes a GstBuffer instead of
+a GstMemory. It derives the video layout from the buffer's GstVideoMeta
+when present (width, height, stride and offset), falling back to the
+caps-derived GstVideoInfo otherwise, and computes the real memory
+footprint (plane_offset + stride * height) rather than the unpadded
+GstVideoInfo size. The single-memory and fd-memory checks that used to
+live in the callers are now performed inside the function.
+
+All callers in gstwlwindow, waylandsink and gtkwaylandsink are updated
+accordingly.
+
+Upstream-Status: Backport [adapted from https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/11370 due to API differences]
+
+Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
+---
+ ext/gtk/gstgtkwaylandsink.c              | 11 ++---
+ ext/wayland/gstwaylandsink.c             | 11 ++---
+ gst-libs/gst/wayland/gstwlshmallocator.c | 59 ++++++++++++++++++------
+ gst-libs/gst/wayland/gstwlshmallocator.h |  2 +-
+ gst-libs/gst/wayland/gstwlwindow.c       |  4 +-
+ 5 files changed, 52 insertions(+), 35 deletions(-)
+
+diff --git a/ext/gtk/gstgtkwaylandsink.c b/ext/gtk/gstgtkwaylandsink.c
+index 0660b30..81bcd7f 100644
+--- a/ext/gtk/gstgtkwaylandsink.c
++++ b/ext/gtk/gstgtkwaylandsink.c
+@@ -1179,7 +1179,6 @@ gst_gtk_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+       gst_gtk_wayland_sink_get_instance_private (self);
+   GstBuffer *to_render;
+   GstWlBuffer *wlbuffer;
+-  GstMemory *mem;
+   struct wl_buffer *wbuf = NULL;
+ 
+   GstFlowReturn ret = GST_FLOW_OK;
+@@ -1240,8 +1239,6 @@ gst_gtk_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+   }
+ 
+   /* update video info from video meta */
+-  mem = gst_buffer_peek_memory (buffer, 0);
+-
+   GST_LOG_OBJECT (self,
+       "buffer %" GST_PTR_FORMAT " does not have a wl_buffer from our "
+       "display, creating it", buffer);
+@@ -1301,9 +1298,8 @@ gst_gtk_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+ handle_shm:
+   if (!wbuf && gst_wl_display_check_format_for_shm (priv->display,
+           &priv->render_info)) {
+-    if (gst_buffer_n_memory (buffer) == 1 && gst_is_fd_memory (mem))
+-      wbuf = gst_wl_shm_memory_construct_wl_buffer (mem, priv->display,
+-          &priv->render_info);
++    wbuf = gst_wl_shm_memory_construct_wl_buffer (buffer, priv->display,
++        &priv->render_info);
+ 
+     /* If nothing worked, copy into our internal pool */
+     if (!wbuf) {
+@@ -1328,8 +1324,7 @@ handle_shm:
+ 
+       /* attach a wl_buffer if there isn't one yet */
+       if (G_UNLIKELY (!wlbuffer)) {
+-        mem = gst_buffer_peek_memory (to_render, 0);
+-        wbuf = gst_wl_shm_memory_construct_wl_buffer (mem, priv->display,
++        wbuf = gst_wl_shm_memory_construct_wl_buffer (to_render, priv->display,
+             &priv->render_info);
+ 
+         if (G_UNLIKELY (!wbuf))
+diff --git a/ext/wayland/gstwaylandsink.c b/ext/wayland/gstwaylandsink.c
+index 443db24..60aa11d 100644
+--- a/ext/wayland/gstwaylandsink.c
++++ b/ext/wayland/gstwaylandsink.c
+@@ -1011,7 +1011,6 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+   GstWaylandSink *self = GST_WAYLAND_SINK (vsink);
+   GstBuffer *to_render;
+   GstWlBuffer *wlbuffer;
+-  GstMemory *mem;
+   struct wl_buffer *wbuf = NULL;
+ 
+   GstFlowReturn ret = GST_FLOW_OK;
+@@ -1086,8 +1085,6 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+   }
+ 
+   /* update video info from video meta */
+-  mem = gst_buffer_peek_memory (buffer, 0);
+-
+   GST_LOG_OBJECT (self,
+       "buffer %" GST_PTR_FORMAT " does not have a wl_buffer from our "
+       "display, creating it", buffer);
+@@ -1147,9 +1144,8 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+ handle_shm:
+   if (!wbuf && gst_wl_display_check_format_for_shm (self->display,
+           &self->render_info)) {
+-    if (gst_buffer_n_memory (buffer) == 1 && gst_is_fd_memory (mem))
+-      wbuf = gst_wl_shm_memory_construct_wl_buffer (mem, self->display,
+-          &self->video_info);
++    wbuf = gst_wl_shm_memory_construct_wl_buffer (buffer, self->display,
++        &self->video_info);
+ 
+     /* If nothing worked, copy into our internal pool */
+     if (!wbuf) {
+@@ -1173,8 +1169,7 @@ handle_shm:
+ 
+       /* attach a wl_buffer if there isn't one yet */
+       if (G_UNLIKELY (!wlbuffer)) {
+-        mem = gst_buffer_peek_memory (to_render, 0);
+-        wbuf = gst_wl_shm_memory_construct_wl_buffer (mem, self->display,
++        wbuf = gst_wl_shm_memory_construct_wl_buffer (to_render, self->display,
+             &self->video_info);
+ 
+         if (G_UNLIKELY (!wbuf))
+diff --git a/gst-libs/gst/wayland/gstwlshmallocator.c b/gst-libs/gst/wayland/gstwlshmallocator.c
+index 671f2b7..11fb22c 100644
+--- a/gst-libs/gst/wayland/gstwlshmallocator.c
++++ b/gst-libs/gst/wayland/gstwlshmallocator.c
+@@ -76,32 +76,60 @@ gst_wl_shm_validate_video_info (const GstVideoInfo * vinfo)
+ }
+ 
+ struct wl_buffer *
+-gst_wl_shm_memory_construct_wl_buffer (GstMemory * mem, GstWlDisplay * display,
+-    const GstVideoInfo * info)
++gst_wl_shm_memory_construct_wl_buffer (GstBuffer * buf,
++    GstWlDisplay * display, const GstVideoInfo * info)
+ {
++  GstMemory *mem;
++  GstVideoMeta *vmeta;
++  GstVideoInfo vinfo;
+   gint width, height, stride;
+-  gsize offset, size, memsize, maxsize;
++  gsize plane_offset = 0;
++  gsize mem_offset = 0;
++  gsize size, memsize, maxsize;
+   enum wl_shm_format format;
+   struct wl_shm_pool *wl_pool;
+   struct wl_buffer *wbuffer;
+ 
+-  if (!gst_wl_shm_validate_video_info (info)) {
++  /* Ensure the buffer has exactly one memory block */
++  if (gst_buffer_n_memory (buf) != 1)
++    return NULL;
++
++  /* Retrieve the memory and ensure it is FD backed */
++  mem = gst_buffer_peek_memory (buf, 0);
++  if (!gst_is_fd_memory (mem))
++    return NULL;
++
++  /* Start from caps-derived video info */
++  vinfo = *info;
++
++  /* Override layout using GstVideoMeta if present */
++  vmeta = gst_buffer_get_video_meta (buf);
++  if (vmeta) {
++    vinfo.width = vmeta->width;
++    vinfo.height = vmeta->height;
++    vinfo.stride[0] = vmeta->stride[0];
++    vinfo.offset[0] = vmeta->offset[0];
++  }
++
++  /* Validate the final video layout */
++  if (!gst_wl_shm_validate_video_info (&vinfo)) {
+     GST_DEBUG_OBJECT (display, "Unsupported strides and offsets.");
+     return NULL;
+   }
+ 
+-  width = GST_VIDEO_INFO_WIDTH (info);
+-  height = GST_VIDEO_INFO_HEIGHT (info);
+-  stride = GST_VIDEO_INFO_PLANE_STRIDE (info, 0);
+-  size = GST_VIDEO_INFO_SIZE (info);
+-  format = gst_video_format_to_wl_shm_format (GST_VIDEO_INFO_FORMAT (info));
++  width = GST_VIDEO_INFO_WIDTH (&vinfo);
++  height = GST_VIDEO_INFO_HEIGHT (&vinfo);
++  stride = GST_VIDEO_INFO_PLANE_STRIDE (&vinfo, 0);
++  plane_offset = GST_VIDEO_INFO_PLANE_OFFSET (&vinfo, 0);
++
++  /* wl_shm requires the actual memory footprint of the buffer */
++  size = plane_offset + (stride * height);
++  format = gst_video_format_to_wl_shm_format (GST_VIDEO_INFO_FORMAT (&vinfo));
+ 
+-  memsize = gst_memory_get_sizes (mem, &offset, &maxsize);
+-  offset += GST_VIDEO_INFO_PLANE_OFFSET (info, 0);
++  memsize = gst_memory_get_sizes (mem, &mem_offset, &maxsize);
+ 
+-  g_return_val_if_fail (gst_is_fd_memory (mem), NULL);
+   g_return_val_if_fail (size <= memsize, NULL);
+-  g_return_val_if_fail (gst_wl_display_check_format_for_shm (display, info),
++  g_return_val_if_fail (gst_wl_display_check_format_for_shm (display, &vinfo),
+       NULL);
+ 
+   GST_DEBUG_OBJECT (display, "Creating wl_buffer from SHM of size %"
+@@ -110,8 +138,9 @@ gst_wl_shm_memory_construct_wl_buffer (GstMemory * mem, GstWlDisplay * display,
+ 
+   wl_pool = wl_shm_create_pool (gst_wl_display_get_shm (display),
+       gst_fd_memory_get_fd (mem), memsize);
+-  wbuffer = wl_shm_pool_create_buffer (wl_pool, offset, width, height, stride,
+-      format);
++  wbuffer =
++      wl_shm_pool_create_buffer (wl_pool, mem_offset + plane_offset, width,
++      height, stride, format);
+   wl_shm_pool_destroy (wl_pool);
+ 
+   return wbuffer;
+diff --git a/gst-libs/gst/wayland/gstwlshmallocator.h b/gst-libs/gst/wayland/gstwlshmallocator.h
+index 4309bd7..38f3ba5 100644
+--- a/gst-libs/gst/wayland/gstwlshmallocator.h
++++ b/gst-libs/gst/wayland/gstwlshmallocator.h
+@@ -33,7 +33,7 @@ GST_WL_API
+ void gst_wl_shm_init_once (void);
+ 
+ GST_WL_API
+-struct wl_buffer * gst_wl_shm_memory_construct_wl_buffer (GstMemory * mem,
++struct wl_buffer * gst_wl_shm_memory_construct_wl_buffer (GstBuffer * buf,
+     GstWlDisplay * display, const GstVideoInfo * info);
+ 
+ G_END_DECLS
+diff --git a/gst-libs/gst/wayland/gstwlwindow.c b/gst-libs/gst/wayland/gstwlwindow.c
+index 3c5c3cc..cd9c964 100644
+--- a/gst-libs/gst/wayland/gstwlwindow.c
++++ b/gst-libs/gst/wayland/gstwlwindow.c
+@@ -985,9 +985,7 @@ gst_wl_window_update_borders (GstWlWindow * self)
+     buf = gst_buffer_new_allocate (alloc, info.size, NULL);
+     gst_buffer_memset (buf, 0, 0, info.size);
+ 
+-    wlbuf =
+-        gst_wl_shm_memory_construct_wl_buffer (gst_buffer_peek_memory (buf, 0),
+-        priv->display, &info);
++    wlbuf = gst_wl_shm_memory_construct_wl_buffer (buf, priv->display, &info);
+ 
+     g_object_unref (alloc);
+   }
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
index cdf3a20dff..72f2cc7342 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch \
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
+           file://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch \
            "
 SRC_URI[sha256sum] = "6467e3964828f4d7d08bfe1fbb4d76287a1c8fa76674e59e101a149c020fefd7"
 
-- 
2.34.1


