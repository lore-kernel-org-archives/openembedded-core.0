Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F33CD13DE
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 12:54:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19568.1777552734425189950
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 05:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=bX67wHRQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: tdarote@qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UAImrO3730092
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HGTRq9JyIvBuq5+beKLXfl7sjT+Cjte7tOn
	Je/rp7Oo=; b=bX67wHRQFN+ynxaL7SQtqr4kGF2FgOtA2ajWEdxSJ/aLDPfsHnJ
	G+pnVvKEL8TocDnGK+HRrjSgmWeaputBapnlNI8vO6GxY172U+LfLaLJl/YfoK3V
	AXPA/CUJr/N11bRe+J1Dh4PXrqa9Mrpniz4L/xPezBQEd7gRYXKLu60+EJiS10DB
	ZWYcBYAewfeYQxBfy47dYqd89PSYkO2yFaCNEbedxBIbeOYuAR+0T3HjCWdihplr
	yJ5mJWTIa1qKRlg1wxYzGQk4sg0kUkJJn/y3UmbwVMRhcaHSQFnJ7Wa/1a2lk0QU
	lC9sHhlDTMPQ1Zzim0YweLDws8LlU1qc0MQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duy1w9wya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:41 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63UBlcaA000620;
	Thu, 30 Apr 2026 11:47:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4ds64uk8bu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:38 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63UBlcK2000615
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:38 GMT
Received: from hyd-lnxbld389.qualcomm.com (hyd-lnxbld389.qualcomm.com [10.142.195.70])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63UBlbt8000608
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 11:47:38 +0000 (GMT)
Received: by hyd-lnxbld389.qualcomm.com (Postfix, from userid 4146169)
	id A25DE225CF; Thu, 30 Apr 2026 17:17:34 +0530 (IST)
From: Tushar Darote <tdarote@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Tushar Darote <tdarote@qti.qualcomm.com>
Subject: [PATCH] gstreamer1.0-plugins-bad: handle padded buffers in wl_shm buffer creation
Date: Thu, 30 Apr 2026 17:17:14 +0530
Message-Id: <20260430114715.990400-1-tdarote@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: TzzH6ikFS2uLqjyfTWRvlsvYMwXra0p6
X-Proofpoint-ORIG-GUID: TzzH6ikFS2uLqjyfTWRvlsvYMwXra0p6
X-Authority-Analysis: v=2.4 cv=DPy/JSNb c=1 sm=1 tr=0 ts=69f3415e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=KcXFmDjPo46N4eE_IPUA:9 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfXx/xS9JQ6N46G
 D+0bnne/11fVJcks61g+OjlG4pNpa0xeW+RQMw4neKI7b8sTm6T2pPJud9PbKYrcUOsw2ZOOffz
 vfaF8ZP7pIQ9H4CpsaX7rAeaVqyuflnI5+JHdOcQjQj2dMdq6fSgEcAvwTVwfKrskUnjdoveEpt
 AMMaI6ADoPcZbpI+3X3ypgfA3mjVB+U+IJ2FBbmrco5v/00K2IEAZZQERS2c1i/ZT253YSSUcT2
 U3CXWtqDK7R/Cd9Wy3Bh9FBybO0SHtuxBgWolb+66iFKA9aLYGjZVVbYSfATBf4c7R/ZyzBKEWU
 59YMjf+nb96tWcqqI7W29AiBoRqB/Q90t+sBFcPoPgJ2o765mZ2WswYR9KtP6FlsmUBTupbpaaE
 rKeCn7G2voNxt7ItvIJn5EX9tVtrF6UpmQy0NBD6X6YRXSGYeVP6N6EjpjQ9V+O4444FgQhVI23
 XuRWp+YV5/CS9NTUG/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300120
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 12:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236166

Use GstBuffer metadata when constructing wl_shm buffers so stride and size reflect the actual buffer layout.
This fixes incorrect rendering with DMA-backed buffers that include padding or custom strides.

Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
---
 ...added-buffers-in-wl_shm-buffer-creat.patch | 178 ++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.28.2.bb        |   1 +
 2 files changed, 179 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
new file mode 100644
index 0000000000..949da1b7e4
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
@@ -0,0 +1,178 @@
+From f8bc21dae1056be483645594ea79131888d8b1ae Mon Sep 17 00:00:00 2001
+From: Tushar Darote <tdarote@qti.qualcomm.com>
+Date: Thu, 30 Apr 2026 16:49:57 +0530
+Subject: [PATCH] wayland: handle padded buffers in wl_shm buffer creation
+
+Use GstBuffer metadata when constructing wl_shm buffers so stride and size reflect the actual buffer layout.
+This fixes incorrect rendering with DMA-backed buffers that include padding or custom strides.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/11370]
+---
+ ext/gtk/gstgtkwaylandsink.c              |  4 +-
+ ext/wayland/gstwaylandsink.c             |  4 +-
+ gst-libs/gst/wayland/gstwlshmallocator.c | 57 +++++++++++++++++-------
+ gst-libs/gst/wayland/gstwlshmallocator.h |  2 +-
+ gst-libs/gst/wayland/gstwlwindow.c       |  2 +-
+ 5 files changed, 48 insertions(+), 21 deletions(-)
+
+diff --git a/ext/gtk/gstgtkwaylandsink.c b/ext/gtk/gstgtkwaylandsink.c
+index 0660b30..6d1adce 100644
+--- a/ext/gtk/gstgtkwaylandsink.c
++++ b/ext/gtk/gstgtkwaylandsink.c
+@@ -1302,7 +1302,7 @@ handle_shm:
+   if (!wbuf && gst_wl_display_check_format_for_shm (priv->display,
+           &priv->render_info)) {
+     if (gst_buffer_n_memory (buffer) == 1 && gst_is_fd_memory (mem))
+-      wbuf = gst_wl_shm_memory_construct_wl_buffer (mem, priv->display,
++      wbuf = gst_wl_shm_memory_construct_wl_buffer (buffer, priv->display,
+           &priv->render_info);
+ 
+     /* If nothing worked, copy into our internal pool */
+@@ -1329,7 +1329,7 @@ handle_shm:
+       /* attach a wl_buffer if there isn't one yet */
+       if (G_UNLIKELY (!wlbuffer)) {
+         mem = gst_buffer_peek_memory (to_render, 0);
+-        wbuf = gst_wl_shm_memory_construct_wl_buffer (mem, priv->display,
++        wbuf = gst_wl_shm_memory_construct_wl_buffer (to_render, priv->display,
+             &priv->render_info);
+ 
+         if (G_UNLIKELY (!wbuf))
+diff --git a/ext/wayland/gstwaylandsink.c b/ext/wayland/gstwaylandsink.c
+index 443db24..2490b6e 100644
+--- a/ext/wayland/gstwaylandsink.c
++++ b/ext/wayland/gstwaylandsink.c
+@@ -1148,7 +1148,7 @@ handle_shm:
+   if (!wbuf && gst_wl_display_check_format_for_shm (self->display,
+           &self->render_info)) {
+     if (gst_buffer_n_memory (buffer) == 1 && gst_is_fd_memory (mem))
+-      wbuf = gst_wl_shm_memory_construct_wl_buffer (mem, self->display,
++      wbuf = gst_wl_shm_memory_construct_wl_buffer (buffer, self->display,
+           &self->video_info);
+ 
+     /* If nothing worked, copy into our internal pool */
+@@ -1174,7 +1174,7 @@ handle_shm:
+       /* attach a wl_buffer if there isn't one yet */
+       if (G_UNLIKELY (!wlbuffer)) {
+         mem = gst_buffer_peek_memory (to_render, 0);
+-        wbuf = gst_wl_shm_memory_construct_wl_buffer (mem, self->display,
++        wbuf = gst_wl_shm_memory_construct_wl_buffer (to_render, self->display,
+             &self->video_info);
+ 
+         if (G_UNLIKELY (!wbuf))
+diff --git a/gst-libs/gst/wayland/gstwlshmallocator.c b/gst-libs/gst/wayland/gstwlshmallocator.c
+index 671f2b7..4452b96 100644
+--- a/gst-libs/gst/wayland/gstwlshmallocator.c
++++ b/gst-libs/gst/wayland/gstwlshmallocator.c
+@@ -76,32 +76,58 @@ gst_wl_shm_validate_video_info (const GstVideoInfo * vinfo)
+ }
+ 
+ struct wl_buffer *
+-gst_wl_shm_memory_construct_wl_buffer (GstMemory * mem, GstWlDisplay * display,
++gst_wl_shm_memory_construct_wl_buffer (GstBuffer * buf, GstWlDisplay * display,
+     const GstVideoInfo * info)
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
+-    GST_DEBUG_OBJECT (display, "Unsupported strides and offsets.");
++  /* Ensure the buffer has exactly one memory block */
++  if (gst_buffer_n_memory (buf) != 1)
++    return NULL;
++
++  /* Retrieve the memory and ensure it is FD backed */
++  mem = gst_buffer_peek_memory (buf, 0);
++  if (!gst_is_fd_memory (mem))
+     return NULL;
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
+   }
+ 
+-  width = GST_VIDEO_INFO_WIDTH (info);
+-  height = GST_VIDEO_INFO_HEIGHT (info);
+-  stride = GST_VIDEO_INFO_PLANE_STRIDE (info, 0);
+-  size = GST_VIDEO_INFO_SIZE (info);
+-  format = gst_video_format_to_wl_shm_format (GST_VIDEO_INFO_FORMAT (info));
++  /* Validate the final video layout */
++  if (!gst_wl_shm_validate_video_info (&vinfo)) {
++    GST_DEBUG_OBJECT (display, "Unsupported strides and offsets.");
++    return NULL;
++  }
+ 
+-  memsize = gst_memory_get_sizes (mem, &offset, &maxsize);
+-  offset += GST_VIDEO_INFO_PLANE_OFFSET (info, 0);
++  width = GST_VIDEO_INFO_WIDTH (&vinfo);
++  height = GST_VIDEO_INFO_HEIGHT (&vinfo);
++  stride = GST_VIDEO_INFO_PLANE_STRIDE (&vinfo, 0);
++  plane_offset = GST_VIDEO_INFO_PLANE_OFFSET (&vinfo, 0);
+ 
+-  g_return_val_if_fail (gst_is_fd_memory (mem), NULL);
++  /* wl_shm requires the actual memory footprint of the buffer */
++  size = plane_offset + (stride * height);
++  format = gst_video_format_to_wl_shm_format (GST_VIDEO_INFO_FORMAT (&vinfo));
++  memsize = gst_memory_get_sizes (mem, &mem_offset, &maxsize);
+   g_return_val_if_fail (size <= memsize, NULL);
+-  g_return_val_if_fail (gst_wl_display_check_format_for_shm (display, info),
++  g_return_val_if_fail (gst_wl_display_check_format_for_shm (display, &vinfo),
+       NULL);
+ 
+   GST_DEBUG_OBJECT (display, "Creating wl_buffer from SHM of size %"
+@@ -110,8 +136,9 @@ gst_wl_shm_memory_construct_wl_buffer (GstMemory * mem, GstWlDisplay * display,
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
+index 3c5c3cc..b055755 100644
+--- a/gst-libs/gst/wayland/gstwlwindow.c
++++ b/gst-libs/gst/wayland/gstwlwindow.c
+@@ -986,7 +986,7 @@ gst_wl_window_update_borders (GstWlWindow * self)
+     gst_buffer_memset (buf, 0, 0, info.size);
+ 
+     wlbuf =
+-        gst_wl_shm_memory_construct_wl_buffer (gst_buffer_peek_memory (buf, 0),
++        gst_wl_shm_memory_construct_wl_buffer (buf,
+         priv->display, &info);
+ 
+     g_object_unref (alloc);
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


