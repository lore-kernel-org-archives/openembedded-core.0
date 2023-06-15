Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE547EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 22:34:24 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.31863.1686868462701567865
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 15:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QLUZFf2G;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686868460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DkqwdNWNJSz7+xniGrQu1d+vAxU/QB1JRuGiKJmDrsg=;
	b=QLUZFf2GPpMjiLI7gHGKHf6CxmosWfvrspFqR8f12Nv7AJIxRSDKr7NEJQFJtFRXLjzQ/i
	KjLxCCm9KgJJEkwxX8mvevYni2bbZowAKCHAlDix83ybGS/LFlqolw7hFmVTQS3dp5TaIA
	zbqbNt0w/kWtyhjd7Z4WHS41sviJsOKyrMLD5qPasqpXNaTVkFXj3jSUNZu58pTThYwWpt
	xwVEuszMFSKjwABaTY9HTrl+KpLgHUzdvGTv9j3GiV4lNdNrWUxfV/ARld8hppE61Gz/4X
	gnQt9TPcVs5DPPpL+UtRl6TdG+sJiXyHImaA7GS33rEeA/ld7VAAZXLHRJV4JA==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A92CE0006;
	Thu, 15 Jun 2023 22:34:19 +0000 (UTC)
Date: Fri, 16 Jun 2023 00:34:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 13/55] glib-2.0: backport a patch to address
 ptest fails caused by coreutils 9.2+
Message-ID: <20230615223419da9b0a46@mail.local>
References: <20230614092918.4065570-1-alex@linutronix.de>
 <20230614092918.4065570-13-alex@linutronix.de>
 <20230615222659f26b3e59@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615222659f26b3e59@mail.local>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 22:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182888

On 16/06/2023 00:27:00+0200, Alexandre Belloni wrote:
> Hello,
> 
> Which ptest are you trying to fix?
> 
> I got:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5023/steps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5207/steps/12/logs/stdio
> {'glib-2.0': ['glib/file.test']}
> 

This is probably because I didn't take the coreutils patch following
Ross' comment.

> On 14/06/2023 11:28:36+0200, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  ...pparent-size-only-for-files-and-syml.patch | 105 ++++++++++++++++++
> >  meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb |   1 +
> >  2 files changed, 106 insertions(+)
> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch
> > 
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch
> > new file mode 100644
> > index 00000000000..a881b25ef3e
> > --- /dev/null
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch
> > @@ -0,0 +1,105 @@
> > +From d1a2117dc18dbcf87685891de7e2898108b66fc9 Mon Sep 17 00:00:00 2001
> > +From: Joan Bruguera <joanbrugueram@gmail.com>
> > +Date: Thu, 23 Mar 2023 02:24:30 +0000
> > +Subject: [PATCH] glocalfile: Sum apparent size only for files and symlinks
> > +
> > +Since GNU Coreutils 9.2 (commit 110bcd28386b1f47a4cd876098acb708fdcbbb25),
> > +`du --apparent-size` (including `du --bytes`) no longer counts all kinds of
> > +files (directories, FIFOs, etc.), but only those for which `st_size` in
> > +`struct stat` is defined by POSIX, namely regular files and symlinks
> > +(and also rarely supported memory objects).
> > +
> > +This aligns the behaviour of GLib's `G_FILE_MEASURE_APPARENT_SIZE` flag
> > +with the new GNU Coreutils `du` and correct POSIX use.
> > +
> > +Note that this may be a breaking change for some uses.
> > +
> > +Link: https://lists.gnu.org/archive/html/bug-coreutils/2023-03/msg00007.html
> > +Fixes: https://gitlab.gnome.org/GNOME/glib/-/issues/2965
> > +
> > +Upstream-Status: Backport
> > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > +---
> > + gio/gioenums.h   |  3 +++
> > + gio/glocalfile.c | 37 +++++++++++++++++++++++++++++++++++++
> > + 2 files changed, 40 insertions(+)
> > +
> > +diff --git a/gio/gioenums.h b/gio/gioenums.h
> > +index 7fd74a43e..c820cd36d 100644
> > +--- a/gio/gioenums.h
> > ++++ b/gio/gioenums.h
> > +@@ -224,6 +224,9 @@ typedef enum {
> > +  *   sizes.  Normally, the block-size is used, if available, as this is a
> > +  *   more accurate representation of disk space used.
> > +  *   Compare with `du --apparent-size`.
> > ++ *   Since GLib 2.78. and similarly to `du` since GNU Coreutils 9.2, this will
> > ++ *   ignore the sizes of file types other than regular files and links, as the
> > ++ *   sizes of other file types are not specified in a standard way.
> > +  * @G_FILE_MEASURE_NO_XDEV: Do not cross mount point boundaries.
> > +  *   Compare with `du -x`.
> > +  *
> > +diff --git a/gio/glocalfile.c b/gio/glocalfile.c
> > +index 67d4b99fb..dbb56902d 100644
> > +--- a/gio/glocalfile.c
> > ++++ b/gio/glocalfile.c
> > +@@ -86,6 +86,9 @@
> > + #define FILE_READ_ONLY_VOLUME           0x00080000
> > + #endif
> > + 
> > ++#ifndef S_ISREG
> > ++#define S_ISREG(m) (((m) & _S_IFMT) == _S_IFREG)
> > ++#endif
> > + #ifndef S_ISDIR
> > + #define S_ISDIR(m) (((m) & _S_IFMT) == _S_IFDIR)
> > + #endif
> > +@@ -2777,6 +2780,39 @@ g_local_file_measure_size_of_contents (gint           fd,
> > +                                        MeasureState  *state,
> > +                                        GError       **error);
> > + 
> > ++/*
> > ++ * _g_stat_is_size_usable:
> > ++ * @buf: a #GLocalFileStat.
> > ++ *
> > ++ * Checks if the file type is such that the `st_size` field of `struct stat` is
> > ++ * well-defined by POSIX.
> > ++ * (see https://pubs.opengroup.org/onlinepubs/009696799/basedefs/sys/stat.h.html)
> > ++ *
> > ++ * This behaviour is aligned with `du` from GNU Coreutils 9.2+
> > ++ * (see https://lists.gnu.org/archive/html/bug-coreutils/2023-03/msg00007.html)
> > ++ * and makes apparent size sums well-defined; formerly, they depended on the
> > ++ * implementation, and could differ across filesystems.
> > ++ *
> > ++ * Returns: %TRUE if the size field is well-defined, %FALSE otherwise.
> > ++ **/
> > ++inline static gboolean
> > ++_g_stat_is_size_usable (const GLocalFileStat *buf)
> > ++{
> > ++#ifndef HAVE_STATX
> > ++  /* Memory objects are defined by POSIX, but are not supported by statx nor Windows */
> > ++#ifdef S_TYPEISSHM
> > ++  if (S_TYPEISSHM (buf))
> > ++    return TRUE;
> > ++#endif
> > ++#ifdef S_TYPEISTMO
> > ++  if (S_TYPEISTMO (buf))
> > ++    return TRUE;
> > ++#endif
> > ++#endif
> > ++
> > ++  return S_ISREG (_g_stat_mode (buf)) || S_ISLNK (_g_stat_mode (buf));
> > ++}
> > ++
> > + static gboolean
> > + g_local_file_measure_size_of_file (gint           parent_fd,
> > +                                    GSList        *name,
> > +@@ -2836,6 +2872,7 @@ g_local_file_measure_size_of_file (gint           parent_fd,
> > +     state->disk_usage += _g_stat_blocks (&buf) * G_GUINT64_CONSTANT (512);
> > +   else
> > + #endif
> > ++  if (_g_stat_is_size_usable (&buf))
> > +     state->disk_usage += _g_stat_size (&buf);
> > + 
> > +   if (S_ISDIR (_g_stat_mode (&buf)))
> > +-- 
> > +2.39.2
> > +
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb
> > index a60e7688367..4327a133450 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb
> > @@ -15,6 +15,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
> >             file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
> >             file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
> >             file://0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch \
> > +           file://0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch \
> >             "
> >  SRC_URI:append:class-native = " file://relocate-modules.patch"
> >  
> > -- 
> > 2.30.2
> > 
> 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#182758): https://lists.openembedded.org/g/openembedded-core/message/182758
> > Mute This Topic: https://lists.openembedded.org/mt/99524149/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

