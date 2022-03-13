Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <ad0bfaa3e9c8700ce92ffa524196a1a0d4aa09c9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCHv2] mesa: update to 22.0.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Sun, 13 Mar 2022 12:40:23 +0000
In-Reply-To: <7RWL8R.KIOTTKEBL4AT2@t-online.de>
References: <20220311172010.2490948-1-f_l_k@t-online.de>
	 <0abd18c8268323c953e66ac12185de8641a37ac0.camel@linuxfoundation.org>
	 <7RWL8R.KIOTTKEBL4AT2@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org

On Sat, 2022-03-12 at 01:45 +0100, f_l_k@t-online.de wrote:
> Before I left for work, I started a core-image-weston build and ran into some
> problems. One of them was that librsvg was missing 'inherit vala', but that
> doesn't seem to be related. The main problem seems to be that mesa-22.0.0
> dropped dri api and drivers. These are no longer buildable:
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics/mesa/mesa_21.3.7.bb?h=master-next#n3
> 
> My build did not have the problem because I did not include the dri drivers in
> my image.
> There was also an error because gtk+3 tried to add libgl instead of
> virtual/libgl, but that whole line is deprecated, gtk no longer has an --enable-
> glx option.
>  https://git.yoctoproject.org/poky/tree/meta/recipes-gnome/gtk+/gtk+3.inc?h=master-next#n59
> 
> 
> I'll see if i can fix it when i'm home again

The autobuilder ran into similar issues. The problem was the loss of "dri" from
the PACKAGECONFIG which triggers the RPROVIDES of libgl. I was able to fix it
with the addition of:

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 503a7efba5..2a89b8e8f0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -227,7 +227,7 @@ python __anonymous() {
     if "-native" in d.getVar("PN"):
         suffix = "-native"
     for p in (("egl", "libegl", "libegl1"),
-              ("dri", "libgl", "libgl1"),
+              ("opengl", "libgl", "libgl1"),
               ("gles", "libgles1", "libglesv1-cm1"),
               ("gles", "libgles2", "libglesv2-2"),
               ("gles", "libgles3",)):


Cheers,

Richard


