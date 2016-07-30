Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7142E60746
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2016 00:58:21 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id cf3so5941337pad.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 17:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n6VDfEcOR8CZ56QSB0a/UH5q5roS2corm8Ff5sisBGc=;
	b=a9eWDCftl1aav2VS5mzQ95Lrc7PELCdvksnzw8ogaZ/bV579AmMMVoq6oWLtywYHe5
	jF6cb/jWxNhmVrdx9W/o9kmHf6UuCiRpkueLcQxYFtZlBmTOrmJ/u4AaAGJYpGFQhQ1X
	SVNC0RRzfpqtalyaCZK6qcLs/cnlbTZdr79NQO7ZT9hf8UEd0ncSeRkNB8fk89usXABq
	cRXbMeDIP1ApnoaS6aavIXghwRoBPeux/88rFY+iAhY5Bjzgmf+jPrdVIRmJA4kazuS1
	dcwhkb4SzuL3V7vDaDdpCYKmrM6b8FKHyibm3WzUa157lBQwLn7RaELFrOA1xdK/TwtV
	35Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n6VDfEcOR8CZ56QSB0a/UH5q5roS2corm8Ff5sisBGc=;
	b=IBDBGl6cTHvFbBIn9bdtPug7sXkKpTwr4gVp1IlhL6Zza6Z05igit2z3t1mAByYk4T
	V8AqkgbcB3FQ3IsGEoGtdBy3hfR1IhLksSh6JhCdeiNcxGt59bL+qVcyxQYXmPrMDO83
	n32V2B+2ZtG3t8Y5bvL3KLtI/M/eOL5vAeprzQ/6IXHW/eJ8dS63kZ2aDN/+MH5OryYB
	KuI2WJQry/H5839deFpfRtriKcNvQJOKJ2MF+RMf/YIyVMCHN//DsdG02CpVlohV0xOa
	m1MXvBQclPeuKcNQkJwriIjXsIAJOUXrJtZuE+yQTrzD6CXMW6VkW3vD2HHKd/gErogr
	1Tlw==
X-Gm-Message-State: AEkoouvhH4wGAyU9gWgfVB1wZXvSU9i6WZt9P1nwXU47DYvPUVErsZfDW1j+/kpmTPFYHA==
X-Received: by 10.66.147.234 with SMTP id tn10mr49056995pab.144.1469840302513; 
	Fri, 29 Jul 2016 17:58:22 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	zk7sm27603113pac.41.2016.07.29.17.58.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jul 2016 17:58:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2016 17:58:16 -0700
Message-Id: <20160730005816.29431-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0-plugins-bad: Backport GstGLMemoryEGL implementation
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
X-List-Received-Date: Sat, 30 Jul 2016 00:58:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backports fix for
https://bugzilla.gnome.org/show_bug.cgi?id=760916

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0008-gl-implement-GstGLMemoryEGL.patch         | 495 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb    |   1 +
 2 files changed, 496 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0008-gl-implement-GstGLMemoryEGL.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0008-gl-implement-GstGLMemoryEGL.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0008-gl-implement-GstGLMemoryEGL.patch
new file mode 100644
index 0000000..a67381c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0008-gl-implement-GstGLMemoryEGL.patch
@@ -0,0 +1,495 @@
+From 806bbe75b0b6947f589bce3960c28fee51b5c6c2 Mon Sep 17 00:00:00 2001
+From: Gwang Yoon Hwang <yoon@igalia.com>
+Date: Thu, 21 Jan 2016 22:18:17 +0900
+Subject: [PATCH] gl: implement GstGLMemoryEGL
+
+Because current GstEGLImageMemory does not inherit GstGLMemory, GLUpload
+allocates additional GLMemory and upload the decoded contents from the decoder
+which uses EGLImage (e.g. gst-omx in RPi).
+
+This work adds GstGLMemoryEGL to avoid this overhead. Decoders allocate
+GstGLMemoryEGL and decode its contents to the EGLImage of GstGLMemoryEGL.  And
+GLUpload uses this memory without allocation of additional textures and blit
+operations.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=760916
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ gst-libs/gst/gl/egl/Makefile.am        |   2 +
+ gst-libs/gst/gl/egl/gstgldisplay_egl.c |   2 +
+ gst-libs/gst/gl/egl/gstglmemoryegl.c   | 241 +++++++++++++++++++++++++++++++++
+ gst-libs/gst/gl/egl/gstglmemoryegl.h   | 108 +++++++++++++++
+ gst-libs/gst/gl/gstgl_fwd.h            |   4 +
+ gst-libs/gst/gl/gstgldisplay.c         |   2 +
+ gst-libs/gst/gl/gstglupload.c          |   8 ++
+ 7 files changed, 367 insertions(+)
+ create mode 100644 gst-libs/gst/gl/egl/gstglmemoryegl.c
+ create mode 100644 gst-libs/gst/gl/egl/gstglmemoryegl.h
+
+diff --git a/gst-libs/gst/gl/egl/Makefile.am b/gst-libs/gst/gl/egl/Makefile.am
+index b808178..878f16c 100644
+--- a/gst-libs/gst/gl/egl/Makefile.am
++++ b/gst-libs/gst/gl/egl/Makefile.am
+@@ -5,6 +5,7 @@ noinst_LTLIBRARIES = libgstgl-egl.la
+ libgstgl_egl_la_SOURCES = \
+ 	gstgldisplay_egl.c \
+ 	gstglcontext_egl.c \
++	gstglmemoryegl.c \
+ 	gsteglimagememory.c
+ 
+ noinst_HEADERS =
+@@ -13,6 +14,7 @@ libgstgl_eglincludedir = $(includedir)/gstreamer-@GST_API_VERSION@/gst/gl/egl
+ libgstgl_eglinclude_HEADERS = \
+ 	gstgldisplay_egl.h \
+ 	gstglcontext_egl.h \
++	gstglmemoryegl.h \
+ 	gsteglimagememory.h \
+ 	gstegl.h
+ 
+diff --git a/gst-libs/gst/gl/egl/gstgldisplay_egl.c b/gst-libs/gst/gl/egl/gstgldisplay_egl.c
+index 9acf4f0..20816c2 100644
+--- a/gst-libs/gst/gl/egl/gstgldisplay_egl.c
++++ b/gst-libs/gst/gl/egl/gstgldisplay_egl.c
+@@ -24,6 +24,7 @@
+ 
+ #include <gst/gl/egl/gstgldisplay_egl.h>
+ #include <gst/gl/egl/gsteglimagememory.h>
++#include <gst/gl/egl/gstglmemoryegl.h>
+ 
+ GST_DEBUG_CATEGORY_STATIC (gst_gl_display_debug);
+ #define GST_CAT_DEFAULT gst_gl_display_debug
+@@ -51,6 +52,7 @@ gst_gl_display_egl_init (GstGLDisplayEGL * display_egl)
+   display_egl->foreign_display = FALSE;
+ 
+   gst_egl_image_memory_init ();
++  gst_gl_memory_egl_init_once ();
+ }
+ 
+ static void
+diff --git a/gst-libs/gst/gl/egl/gstglmemoryegl.c b/gst-libs/gst/gl/egl/gstglmemoryegl.c
+new file mode 100644
+index 0000000..03cf432
+--- /dev/null
++++ b/gst-libs/gst/gl/egl/gstglmemoryegl.c
+@@ -0,0 +1,241 @@
++/*
++ * GStreamer
++ * Copyright (C) 2012 Collabora Ltd.
++ *   @author: Sebastian Dröge <sebastian.droege@collabora.co.uk>
++ * Copyright (C) 2014 Julien Isorce <julien.isorce@gmail.com>
++ * Copyright (C) 2015 Igalia
++ *    Author: Gwang Yoon Hwang <yoon@igalia.com>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Library General Public
++ * License as published by the Free Software Foundation; either
++ * version 2 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Library General Public License for more details.
++ *
++ * You should have received a copy of the GNU Library General Public
++ * License along with this library; if not, write to the
++ * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
++ * Boston, MA 02110-1301, USA.
++ */
++
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
++
++#include <string.h>
++
++#include <gst/gl/egl/gstglmemoryegl.h>
++
++static GstAllocator *_gl_memory_egl_allocator;
++
++GST_DEBUG_CATEGORY_STATIC (GST_CAT_GL_MEMORY);
++#define GST_CAT_DEFAULT GST_CAT_GL_MEMORY
++
++#define parent_class gst_gl_memory_egl_allocator_parent_class
++G_DEFINE_TYPE (GstGLMemoryEGLAllocator, gst_gl_memory_egl_allocator,
++    GST_TYPE_GL_MEMORY_ALLOCATOR);
++
++gboolean
++gst_is_gl_memory_egl (GstMemory * mem)
++{
++  return mem != NULL && mem->allocator != NULL
++      && g_type_is_a (G_OBJECT_TYPE (mem->allocator),
++      GST_TYPE_GL_MEMORY_EGL_ALLOCATOR);
++}
++
++static GstGLMemoryEGL *
++_gl_mem_get_parent (GstGLMemoryEGL * gl_mem)
++{
++  GstGLMemoryEGL *parent = (GstGLMemoryEGL *)gl_mem->mem.mem.mem.parent;
++  return parent ? parent : gl_mem;
++}
++
++EGLImageKHR
++gst_gl_memory_egl_get_image (GstGLMemoryEGL * mem)
++{
++  g_return_val_if_fail (gst_is_gl_memory_egl (GST_MEMORY_CAST (mem)),
++                        EGL_NO_IMAGE_KHR);
++  return _gl_mem_get_parent(mem)->image;
++}
++
++EGLDisplay
++gst_gl_memory_egl_get_display (GstGLMemoryEGL * mem)
++{
++  g_return_val_if_fail (gst_is_gl_memory_egl (GST_MEMORY_CAST (mem)), NULL);
++  return GST_GL_CONTEXT_EGL(_gl_mem_get_parent(mem))->egl_display;
++}
++
++GstVideoGLTextureOrientation
++gst_gl_memory_egl_get_orientation (GstGLMemoryEGL * mem)
++{
++  g_return_val_if_fail (gst_is_gl_memory_egl (GST_MEMORY_CAST (mem)),
++      GST_VIDEO_GL_TEXTURE_ORIENTATION_X_NORMAL_Y_NORMAL);
++
++  return _gl_mem_get_parent(mem)->orientation;
++}
++
++void
++gst_gl_memory_egl_set_orientation (GstGLMemoryEGL * mem,
++    GstVideoGLTextureOrientation orientation)
++{
++  g_return_if_fail (gst_is_gl_memory_egl (GST_MEMORY_CAST (mem)));
++
++  _gl_mem_get_parent(mem)->orientation = orientation;
++}
++
++static GstMemory *
++_gl_mem_alloc (GstAllocator * allocator, gsize size,
++               GstAllocationParams * params)
++{
++  g_warning ("Use gst_gl_base_memory_allocator_alloc() to allocate from this "
++      "GstGLMemoryEGL allocator");
++
++  return NULL;
++}
++
++static void
++_gl_mem_destroy (GstGLMemoryEGL * mem)
++{
++  /* Shared memory should not destroy all the data */
++  if (!mem->mem.mem.mem.parent) {
++    GstGLContextEGL *context = GST_GL_CONTEXT_EGL(mem->mem.mem.context);
++    context->eglDestroyImage (context->egl_display, mem->image);
++  }
++
++  GST_GL_BASE_MEMORY_ALLOCATOR_CLASS (parent_class)->destroy ((GstGLBaseMemory
++          *) mem);
++}
++
++static void
++_gl_mem_init (GstGLMemoryEGL * mem, GstAllocator * allocator,
++    GstMemory * parent, GstGLContext * context, GstGLTextureTarget target,
++    GstAllocationParams * params, GstVideoInfo * info,
++    guint plane, GstVideoAlignment * valign, gpointer user_data,
++    GDestroyNotify notify)
++{
++  gst_gl_memory_init ((GstGLMemory *) mem, allocator, parent,
++      context, target, params, info, plane, valign, user_data, notify);
++}
++
++static GstGLMemoryEGL *
++_gl_mem_egl_alloc (GstGLBaseMemoryAllocator * allocator,
++    GstGLVideoAllocationParams * params)
++{
++  guint alloc_flags = params->parent.alloc_flags;
++  GstGLMemoryEGL *mem;
++
++  g_return_val_if_fail (alloc_flags & GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_VIDEO,
++      NULL);
++  g_return_val_if_fail ((alloc_flags &
++      GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_WRAP_GPU_HANDLE) == 0, NULL);
++  g_return_val_if_fail ((alloc_flags &
++      GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_WRAP_SYSMEM) == 0, NULL);
++
++  mem = g_new0 (GstGLMemoryEGL, 1);
++  mem->image = EGL_NO_IMAGE_KHR;
++
++  _gl_mem_init (mem, GST_ALLOCATOR_CAST (allocator), NULL,
++      params->parent.context, params->target, params->parent.alloc_params,
++      params->v_info, params->plane, params->valign, params->parent.user_data,
++      params->parent.notify);
++
++  return mem;
++}
++
++static gboolean
++_gl_mem_create (GstGLMemoryEGL * gl_mem, GError ** error)
++{
++  GstGLContextEGL *context = GST_GL_CONTEXT_EGL (gl_mem->mem.mem.context);
++  GstGLBaseMemoryAllocatorClass *alloc_class;
++
++  if (!gst_gl_context_check_feature (GST_GL_CONTEXT (context),
++                                     "EGL_KHR_image_base")) {
++    g_set_error (error, GST_GL_CONTEXT_ERROR, GST_GL_CONTEXT_ERROR_WRONG_API,
++                 "EGL_KHR_image_base is not supported");
++    return FALSE;
++  }
++
++  alloc_class = GST_GL_BASE_MEMORY_ALLOCATOR_CLASS (parent_class);
++  if (!alloc_class->create ((GstGLBaseMemory *) gl_mem, error))
++    return FALSE;
++
++  gl_mem->image = context->eglCreateImage (context->egl_display,
++      context->egl_context, EGL_GL_TEXTURE_2D_KHR,
++      (EGLClientBuffer) GSIZE_TO_POINTER (gl_mem->mem.tex_id), NULL);
++
++  GST_TRACE ("Generating EGLImage handle:%p from a texture:%u",
++              gl_mem->image, gl_mem->mem.tex_id);
++
++  if (eglGetError () != EGL_SUCCESS) {
++    g_set_error (error, GST_GL_CONTEXT_ERROR, GST_GL_CONTEXT_ERROR_FAILED,
++                 "Failed to create EGLImage");
++    return FALSE;
++  }
++
++  return TRUE;
++}
++
++static GstMemory *
++_gl_mem_copy (GstGLMemoryEGL * src, gssize offset, gssize size)
++{
++  GST_CAT_ERROR (GST_CAT_GL_MEMORY, "GstGLMemoryEGL does not support copy");
++  return NULL;
++}
++
++static void
++gst_gl_memory_egl_allocator_class_init (GstGLMemoryEGLAllocatorClass * klass)
++{
++  GstGLBaseMemoryAllocatorClass *gl_base;
++  GstGLMemoryAllocatorClass *gl_tex;
++  GstAllocatorClass *allocator_class;
++
++  gl_tex = (GstGLMemoryAllocatorClass *) klass;
++  gl_base = (GstGLBaseMemoryAllocatorClass *) klass;
++  allocator_class = (GstAllocatorClass *) klass;
++
++  gl_base->alloc = (GstGLBaseMemoryAllocatorAllocFunction) _gl_mem_egl_alloc;
++  gl_base->create = (GstGLBaseMemoryAllocatorCreateFunction) _gl_mem_create;
++  gl_base->destroy = (GstGLBaseMemoryAllocatorDestroyFunction) _gl_mem_destroy;
++  gl_tex->copy = (GstGLBaseMemoryAllocatorCopyFunction) _gl_mem_copy;
++
++  allocator_class->alloc = _gl_mem_alloc;
++}
++
++static void
++gst_gl_memory_egl_allocator_init (GstGLMemoryEGLAllocator * allocator)
++{
++  GstAllocator *alloc = GST_ALLOCATOR_CAST (allocator);
++
++  alloc->mem_type = GST_GL_MEMORY_EGL_ALLOCATOR_NAME;
++
++  GST_OBJECT_FLAG_SET (allocator, GST_ALLOCATOR_FLAG_CUSTOM_ALLOC);
++}
++
++/**
++ * gst_gl_memory_egl_init_once:
++ *
++ * Initializes the GL Memory allocator. It is safe to call this function
++ * multiple times.  This must be called before any other GstGLMemoryEGL operation.
++ */
++void
++gst_gl_memory_egl_init_once (void)
++{
++  static volatile gsize _init = 0;
++
++  if (g_once_init_enter (&_init)) {
++    gst_gl_memory_init_once ();
++
++    GST_DEBUG_CATEGORY_INIT (GST_CAT_GL_MEMORY, "glmemory", 0,
++        "OpenGL Texture with EGLImage memory");
++
++    _gl_memory_egl_allocator = g_object_new (GST_TYPE_GL_MEMORY_EGL_ALLOCATOR, NULL);
++
++    gst_allocator_register (GST_GL_MEMORY_EGL_ALLOCATOR_NAME,
++        gst_object_ref (_gl_memory_egl_allocator));
++    g_once_init_leave (&_init, 1);
++  }
++}
+diff --git a/gst-libs/gst/gl/egl/gstglmemoryegl.h b/gst-libs/gst/gl/egl/gstglmemoryegl.h
+new file mode 100644
+index 0000000..7256d33
+--- /dev/null
++++ b/gst-libs/gst/gl/egl/gstglmemoryegl.h
+@@ -0,0 +1,108 @@
++/*
++ * GStreamer
++ * Copyright (C) 2012 Collabora Ltd.
++ *   @author: Sebastian Dröge <sebastian.droege@collabora.co.uk>
++ * Copyright (C) 2014 Julien Isorce <julien.isorce@gmail.com>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Library General Public
++ * License as published by the Free Software Foundation; either
++ * version 2 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Library General Public License for more details.
++ *
++ * You should have received a copy of the GNU Library General Public
++ * License along with this library; if not, write to the
++ * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
++ * Boston, MA 02110-1301, USA.
++ */
++
++#ifndef _GST_GL_MEMORY_EGL_H_
++#define _GST_GL_MEMORY_EGL_H_
++
++#include <gst/gst.h>
++#include <gst/gstallocator.h>
++#include <gst/gstmemory.h>
++#include <gst/video/video.h>
++
++#include <gst/gl/gl.h>
++#include "gstglcontext_egl.h"
++
++#include <gst/gl/gstglmemory.h>
++
++G_BEGIN_DECLS
++
++#define GST_TYPE_GL_MEMORY_EGL_ALLOCATOR (gst_gl_memory_egl_allocator_get_type())
++GType gst_gl_memory_egl_allocator_get_type(void);
++
++#define GST_IS_GL_MEMORY_EGL_ALLOCATOR(obj)              (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GST_TYPE_GL_MEMORY_EGL_ALLOCATOR))
++#define GST_IS_GL_MEMORY_EGL_ALLOCATOR_CLASS(klass)      (G_TYPE_CHECK_CLASS_TYPE ((klass), GST_TYPE_GL_MEMORY_EGL_ALLOCATOR))
++#define GST_GL_MEMORY_EGL_ALLOCATOR_GET_CLASS(obj)       (G_TYPE_INSTANCE_GET_CLASS ((obj), GST_TYPE_GL_MEMORY_EGL_ALLOCATOR, GstGLMemoryEGLAllocatorClass))
++#define GST_GL_MEMORY_EGL_ALLOCATOR(obj)                 (G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_TYPE_GL_MEMORY_EGL_ALLOCATOR, GstGLMemoryEGLAllocator))
++#define GST_GL_MEMORY_EGL_ALLOCATOR_CLASS(klass)         (G_TYPE_CHECK_CLASS_CAST ((klass), GST_TYPE_GL_MEMORY_EGL_ALLOCATOR, GstGLAllocatorClass))
++#define GST_GL_MEMORY_EGL_ALLOCATOR_CAST(obj)            ((GstGLMemoryEGLAllocator *)(obj))
++
++typedef void (*GstEGLImageDestroyNotify) (GstGLContextEGL * context,
++    gpointer data);
++
++typedef struct _GstEGLImageMemory GstEGLImageMemory;
++
++
++/**
++ * GstGLMemoryEGL:
++ *
++ * Private instance
++ */
++struct _GstGLMemoryEGL
++{
++  GstGLMemory mem;
++
++  EGLImageKHR image;
++  GstVideoGLTextureOrientation orientation;
++};
++
++/**
++ * GST_GL_MEMORY_EGL_ALLOCATOR:
++ *
++ * The name of the GL Memory EGL allocator
++ */
++#define GST_GL_MEMORY_EGL_ALLOCATOR_NAME "GLMemoryEGL"
++
++void          gst_gl_memory_egl_init_once               (void);
++gboolean      gst_is_gl_memory_egl                      (GstMemory * mem);
++
++EGLImageKHR   gst_gl_memory_egl_get_image               (GstGLMemoryEGL * mem);
++EGLDisplay    gst_gl_memory_egl_get_display             (GstGLMemoryEGL * mem);
++
++GstVideoGLTextureOrientation gst_gl_memory_egl_get_orientation
++                                                        (GstGLMemoryEGL * mem);
++
++void          gst_gl_memory_egl_set_orientation         (GstGLMemoryEGL * mem,
++                                      GstVideoGLTextureOrientation orientation);
++
++/**
++ * GstGLAllocator
++ *
++ * Opaque #GstGLAllocator struct
++ */
++struct _GstGLMemoryEGLAllocator
++{
++  GstGLMemoryAllocator parent;
++};
++
++/**
++ * GstGLAllocatorClass:
++ *
++ * The #GstGLAllocatorClass only contains private data
++ */
++struct _GstGLMemoryEGLAllocatorClass
++{
++  GstGLMemoryAllocatorClass parent_class;
++};
++
++G_END_DECLS
++
++#endif /* _GST_GL_MEMORY_EGL_H_ */
+diff --git a/gst-libs/gst/gl/gstgl_fwd.h b/gst-libs/gst/gl/gstgl_fwd.h
+index fb64ff6..73e17bd 100644
+--- a/gst-libs/gst/gl/gstgl_fwd.h
++++ b/gst-libs/gst/gl/gstgl_fwd.h
+@@ -55,6 +55,10 @@ typedef struct _GstGLMemoryPBO GstGLMemoryPBO;
+ typedef struct _GstGLMemoryPBOAllocator GstGLMemoryPBOAllocator;
+ typedef struct _GstGLMemoryPBOAllocatorClass GstGLMemoryPBOAllocatorClass;
+ 
++typedef struct _GstGLMemoryEGL GstGLMemoryEGL;
++typedef struct _GstGLMemoryEGLAllocator GstGLMemoryEGLAllocator;
++typedef struct _GstGLMemoryEGLAllocatorClass GstGLMemoryEGLAllocatorClass;
++
+ typedef struct _GstGLSLStage        GstGLSLStage;
+ typedef struct _GstGLSLStagePrivate GstGLSLStagePrivate;
+ typedef struct _GstGLSLStageClass   GstGLSLStageClass;
+diff --git a/gst-libs/gst/gl/gstgldisplay.c b/gst-libs/gst/gl/gstgldisplay.c
+index 60dec6a..34770d0 100644
+--- a/gst-libs/gst/gl/gstgldisplay.c
++++ b/gst-libs/gst/gl/gstgldisplay.c
+@@ -68,6 +68,7 @@
+ #if GST_GL_HAVE_PLATFORM_EGL
+ #include <gst/gl/egl/gstgldisplay_egl.h>
+ #include <gst/gl/egl/gsteglimagememory.h>
++#include <gst/gl/egl/gstglmemoryegl.h>
+ #endif
+ 
+ GST_DEBUG_CATEGORY_STATIC (gst_context);
+@@ -144,6 +145,7 @@ gst_gl_display_init (GstGLDisplay * display)
+ 
+ #if GST_GL_HAVE_PLATFORM_EGL
+   gst_egl_image_memory_init ();
++  gst_gl_memory_egl_init_once ();
+ #endif
+ }
+ 
+diff --git a/gst-libs/gst/gl/gstglupload.c b/gst-libs/gst/gl/gstglupload.c
+index 16ed5ea..73a9029 100644
+--- a/gst-libs/gst/gl/gstglupload.c
++++ b/gst-libs/gst/gl/gstglupload.c
+@@ -29,6 +29,7 @@
+ 
+ #if GST_GL_HAVE_PLATFORM_EGL
+ #include "egl/gsteglimagememory.h"
++#include "egl/gstglmemoryegl.h"
+ #endif
+ 
+ #if GST_GL_HAVE_DMABUF
+@@ -301,6 +302,13 @@ _gl_memory_upload_propose_allocation (gpointer impl, GstQuery * decide_query,
+             context));
+     gst_query_add_allocation_param (query, allocator, &params);
+     gst_object_unref (allocator);
++
++#if GST_GL_HAVE_PLATFORM_EGL
++    allocator =
++        GST_ALLOCATOR (gst_allocator_find (GST_GL_MEMORY_EGL_ALLOCATOR_NAME));
++    gst_query_add_allocation_param (query, allocator, &params);
++    gst_object_unref (allocator);
++#endif
+   }
+ 
+   n_pools = gst_query_get_n_allocation_pools (query);
+-- 
+2.5.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
index d0912b2..fb974a5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://0005-glshader-add-glBindFragDataLocation.patch \
     file://0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch \
     file://0007-glplugin-gleffects-fix-little-rectangel-appears-at-t.patch \
+    file://0008-gl-implement-GstGLMemoryEGL.patch \
 "
 SRC_URI[md5sum] = "83abc2e70684e7b195f18ca2992ef6e8"
 SRC_URI[sha256sum] = "d7995317530c8773ec088f94d9320909d41da61996b801ebacce9a56af493f97"
-- 
2.9.0


