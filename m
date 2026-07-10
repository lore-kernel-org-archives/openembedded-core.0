Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18EFC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 10:35:38 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9802.1783679736525277193
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 03:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PwPO9CCF;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7eb787dec99so491388a34.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 03:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783679735; cv=none;
        d=google.com; s=arc-20260327;
        b=OYA5mdeB3VC1fA35YGlksT4y4JVp9YLmZfWvbIFypnzzyZpVvRWRyr96bZeqzY+6z0
         0akPeArUjRXO1b78wvxqP6UxF+IncU+dxxC9QZVpQhg30dL+i2F32YIVGi1JFJO1yTTJ
         0zbvWbFCDWI1FBKhX7y2nVGh3bs0OIqcpMiTPFZfaKS9tzYSf57CjpA9FnC1NjCd5M1J
         3kMpyrZgAVzp2n5LYkJ5iF8OtIQrPpuXi7qwPlgSXNMABSRhzjCEYldgp2ypk74vehaz
         SjKJBYsKyJWIp6GfrmCAVBto+sys4CdNZZlKYXY7iXTpKb/fpqqN4jBrw8TDmkX1X7vG
         fa2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QhqavlCWvSaN2P6fYURMh5E1/07GKCly4G3741025VM=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=ll5udRPZ52U2pXSTWetZFTKxXzigqiI2ewaNnz3hPMDzDJMSLSZz14nbu+tHPAsHeW
         1SUehmVj1K8lExnB1P7mOOgj3vQgpCu2M7ykexaCzNPH1IiLrI+bck2lsNq7YDY76j0U
         08be/XtUIprYajDCSUPfiQv4uIm2bXNZo0GqSZibLswvHYd6XbIJEXQ9BywlsKZf30rH
         4b7GE6XBoq0+hjszk578m+T7dwfgzMdpuWtAGxoYMg4AFjvnDNS9iSlZ2c0a3QX99VwM
         0hrTVe4dienS2dxUcciEGhtuNlFAPj7WVF+3JRLK5KAY/YBcLsuGIUjxXOq4WJN+qMfu
         4Izw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783679735; x=1784284535; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhqavlCWvSaN2P6fYURMh5E1/07GKCly4G3741025VM=;
        b=PwPO9CCF0Jx6mnNGtQZGeA9goywdPTMgryzs9YSfSdZc70PWjkI1BauzgeR/SAmkk/
         HTWxmlGCQz27y4jxP4zwGXDt94F1AUhAx5WKA0PJ4lISZW9xQU9BMZbVfXob4TkQZ4Us
         ydFwqJGVyrzpMTYf65J64hSLSJ2JQtT5wabEttBmY4tMkSlRnA1rbTJ2SARxAPFmDEDt
         OAn8ApgmARRvajMFHNz/CFHpIG6krtGFVHD4tur7aID5And+fvwhI2IhDDa7pWvD5NLP
         Ep2AwqvwNRGu+XVJ5ZJx3N3hoNlrWszWohZVbRoNIWbrTDUmZi6ROEktDCF0sQ4Sg9aT
         HjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783679735; x=1784284535;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QhqavlCWvSaN2P6fYURMh5E1/07GKCly4G3741025VM=;
        b=OMtKnD9lVTmFgF5xdjYx7cCxKRPGbKvmvq9HkQRa+Q57/PLAZRfLjGWDb5xQgBiImS
         y7RQAtgSVmd8qwOpioG085hUqvdWjsr3oeC5dRRSyBM3IUg2umKzCkUUDR5/iAFzyvFg
         axxm4z1XSjHtyvWyBiLzjna7lwz/zMU3WWkDcvgRdrm3Ds5HTV2Zyf8V+iJOmG0UhO99
         ASF+AuKiOJqFd56BP4nJ57h/51y6LjMuwDs7gcW6E4VRFkSRJCRMH9SocdewABmFgkTG
         5oMYhacLO8xpA8NLtX1jwAl0Iv2eHgTyIMFYCiOL408InubW3MUNPhfjXAQSoStoDzdg
         Zv5A==
X-Gm-Message-State: AOJu0YwSmh5xt27PNFTyMccB0ttUjpKZTttCrxvjYklJOsV9Zf9OhZWi
	4gRoVjZ4kezGtX1EgLw3TaK2SQrc8zYCr8VkgL83y+juWPUYXELcMN6oNbdB3jJ5xe9DIEKH3Et
	PeWCY90WcKB05QrKwAKuNAyVz/dDm+kc=
X-Gm-Gg: AfdE7clTc0HaLGAfcbGqOEdofvhWXumMZQ4mcoSzBt652x5JqGAEtBXx0Q8hA0j+hTH
	49s080x9FL4cwYUD67JqPL6E4VFalb5fVgWO7EhFqNxVS/UnU9O3J6BWrJH2Bic9v2r6Cg9A8Gy
	/nAdtpRED9cJ2ZNaaqs4FnP2cIpI9IYI33adhkD4E6BmhFJTfSIjTDke7PNWJwifAG1k38JBfPb
	sE05Sp+ZR4BXcHOOc8Hx+6aXJtG0AgV9UUh44xAypjz5IFHCVGsTpd0GEQNXNda8K3IP8GuwcGq
	N8Jba0aR
X-Received: by 2002:a05:6808:4f23:b0:485:48da:133d with SMTP id
 5614622812f47-4a2034bfdbcmr10729028b6e.10.1783679735276; Fri, 10 Jul 2026
 03:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
 <18BFB944C29B5CD2.114350@lists.openembedded.org> <801aa151527e456bc8ced89d11bc2e4fd6f8fcce.camel@linuxfoundation.org>
In-Reply-To: <801aa151527e456bc8ced89d11bc2e4fd6f8fcce.camel@linuxfoundation.org>
From: Adam Blank <adam.blank.g@gmail.com>
Date: Fri, 10 Jul 2026 12:35:23 +0200
X-Gm-Features: AUfX_mwfIrTjv_Bf3NupvB8CPw8EVFezVClIG7hWU3OzfEabiV8Co5myC_SQTaA
Message-ID: <CAFAffzwdEoeVGR4KDJrRvOzNqCkRS6yHYMLE35sBBnaUk0bD3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] Remove 'extend_recipe_sysroot' from 'BB_HASHEXCLUDE_COMMON'
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000003a94b06563f4d29"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 10:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240629

--00000000000003a94b06563f4d29
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 at 12:52, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2026-07-06 at 15:21 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Sat, 2026-04-18 at 20:34 +0200, Adam Blank via lists.openembedded.org
> wrote:
> > > It has lain there for a while, obscuring certain aspects of
> > > how task signatures are calculated.
> > >
> > > This changeset does not change the current status quo, but
> > > rather changes the way in which it is implemented. It can be
> > > followed by changes which further refine what is excluded and
> > > how, from those tasks which refer to 'extend_recipe_sysroot'.
> > >
> > > Related discussion:
> > >
> https://lore.kernel.org/openembedded-core/aa893eb861bf4dd18e3e84e6bbebdee3b0367d1b.camel@linuxfoundation.org/
> > >
> > > Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
> > > ---
> > > Adam Blank (7):
> > >       package_pkgdata: fix typo to stop calling undefined function
> > >       staging: add 'vardepsexclude' to 'staging_populate_sysroot_dir'
> > >       staging: add 'extend_recipe_sysroot' to 'vardepsexclude'
> > >       cross: add 'extend_recipe_sysroot' to 'vardepsexclude'
> > >       native: add 'extend_recipe_sysroot' to 'vardepsexclude'
> > >       wic-tool: add 'extend_recipe_sysroot' to 'vardepsexclude'
> > >       bitbake.conf: remove 'extend_recipe_sysroot' from
> BB_HASHEXCLUDE_COMMON
> > >
> > >  meta/classes-global/package_pkgdata.bbclass | 4 +++-
> > >  meta/classes-global/staging.bbclass         | 5 ++++-
> > >  meta/classes-recipe/cross.bbclass           | 1 +
> > >  meta/classes-recipe/native.bbclass          | 1 +
> > >  meta/conf/bitbake.conf                      | 2 +-
> > >  meta/recipes-core/meta/wic-tools.bb         | 1 +
> > >  6 files changed, 11 insertions(+), 3 deletions(-)
> >
> > I finally found a bit of time to look at this. I took some of it, I
> > ended up reworking some of the patches as they needed rewording to
> > justify them and explain the changes being made.
> >
> > I didn't take the extend_recipe_sysroot removal from bitbake.conf as
> > I'm still not convinced we have all the issues that might cause
> > identified. The function name typo and the incorrect vardepsexclude are
> > fixed though (or will be once a couple of patches pass testing/review
> > and merge).
>
> I still wasn't 100% happy with this so I did go a little further and
> hacked up the attached script. It does have one hardcoded path but you
> can get the idea of what I'm trying to do.
>
> You can start with a clean TMPDIR and run "bitbake world -S none". You
> can then edit bitbake.conf and remove extend_recipe_sysroot from
> BB_HASHEXCLUDE_COMMON and run that command a second time.
>
> If you them run the attached script in tmp/stamps, after a bit of
> processing, you will see:
>
> Added {'staging_processfixme[func]', 'staging_copydir', 'BB_RUNTASK',
> 'oe.utils.get_multilib_datastore', 'sstate_clean_manifest',
> 'extend_recipe_sysroot', 'DEFAULTTUNE', 'RECIPE_SYSROOT',
> 'oe.sstatesig.find_sstate_manifest', 'TUNE_PKGARCH:tune-x86-64-v3',
> 'STAGING_DIR', 'extend_recipe_sysroot[func]', 'RECIPE_SYSROOT_NATIVE',
> 'COMPONENTS_DIR', 'staging_copydir[func]', 'staging_copyfile[func]',
> 'sstate_clean_manifest[func]', 'staging_populate_sysroot_dir',
> 'setscene_depvalid', 'PN', 'oe.path.remove', 'TUNE_PKGARCH',
> 'RECIPE_SYSROOT_MANIFEST_SUBDIR', 'TARGET_ARCH',
> 'staging_populate_sysroot_dir[func]', 'staging_processfixme',
> 'setscene_depvalid[func]', 'staging_copyfile'}
> Removed set()
>
> That means those variables were added as dependencies somewhere in the
> build for at least one task. This was basically my worry with the
> patch. We need to work out where/why those are being added and triage
> them in order to be able to remove extend_recipe_sysroot from the hash
> exclusion. Some of them may be acceptable, some of them may not, a lot
> depends on context.
>
> I'm still not sure it is worth the work in changing that, but we do now
> at least have a way of checking the effect of such a change.
>

I've allowed myself to have an AI agent run this and one other analysis of
this subject (hopefully this is not prohibited or frowned upon) and I think
there might be an attractive compromise.
What could be done is the following set of changes, which would assure,
that:
- the 'extend_recipe_sysroot' exclusion from the signature calculation
would remain active
- this exclusion would be closer to the code which it logically complements
(staging.bbclass) - this would improve the comprehensibility of this design
choice
- other cases (native.bbclass, cross.bbclass, et al) would be more
transparent about their relation with 'extend_recipe_sysroot'

---
 meta/classes-global/staging.bbclass       | 2 ++
 meta/classes-recipe/cross.bbclass         | 1 +
 meta/classes-recipe/native.bbclass        | 1 +
 meta/conf/bitbake.conf                    | 2 +-
 meta/recipes-core/meta/wic-tools.bb       | 1 +
 meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
 6 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/staging.bbclass
b/meta/classes-global/staging.bbclass
index f0b3c6eedc..5547980ee4 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -647,6 +647,7 @@ python extend_recipe_sysroot() {
 extend_recipe_sysroot[vardepsexclude] += "BB_TASKDEPDATA SSTATETASKS"

 do_prepare_recipe_sysroot[deptask] = "do_populate_sysroot"
+do_prepare_recipe_sysroot[vardepsexclude] += "extend_recipe_sysroot"
 python do_prepare_recipe_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
 }
@@ -665,6 +666,7 @@ python staging_taskhandler() {
         deps = d.getVarFlag(task, "depends")
         if task == "do_configure" or (deps and "populate_sysroot" in deps):
             d.prependVarFlag(task, "prefuncs", "extend_recipe_sysroot ")
+            d.appendVarFlag(task, "vardepsexclude", "
extend_recipe_sysroot")
 }
 staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
 addhandler staging_taskhandler
diff --git a/meta/classes-recipe/cross.bbclass
b/meta/classes-recipe/cross.bbclass
index 82a49dc8f5..bceee5d6e6 100644
--- a/meta/classes-recipe/cross.bbclass
+++ b/meta/classes-recipe/cross.bbclass
@@ -98,6 +98,7 @@ python do_addto_recipe_sysroot () {
 }
 addtask addto_recipe_sysroot after do_populate_sysroot
 do_addto_recipe_sysroot[deptask] = "do_populate_sysroot"
+do_addto_recipe_sysroot[vardepsexclude] += "extend_recipe_sysroot"

 PATH:prepend = "${COREBASE}/scripts/cross-intercept:"

diff --git a/meta/classes-recipe/native.bbclass
b/meta/classes-recipe/native.bbclass
index 8aa86f9cb6..b357b2da7b 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -170,6 +170,7 @@ python do_addto_recipe_sysroot () {
 }
 addtask addto_recipe_sysroot after do_populate_sysroot
 do_addto_recipe_sysroot[deptask] = "do_populate_sysroot"
+do_addto_recipe_sysroot[vardepsexclude] += "extend_recipe_sysroot"

 inherit nopackages

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdf37d0da2..1830cab753 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -964,7 +964,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD
BB_TASKHASH BBPATH BBSERVER DL_DI
     STAMPS_DIR PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN
PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_NOHASHDIR LICENSE_PATH
SDKPKGSUFFIX \
     WARN_QA WORKDIR STAMPCLEAN PKGDATA_DIR BUILD_ARCH SSTATE_PKGARCH \
-    BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot
DEPLOY_DIR \
+    BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH DEPLOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE
GIT_CEILING_DIRECTORIES \
     OMP_NUM_THREADS BB_CURRENTTASK"
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/
wic-tools.bb
index 823dbe6db6..9a3cf8f371 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -28,4 +28,5 @@ RM_WORK_EXCLUDE += "${PN}"
 python do_build_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
 }
+do_build_sysroot[vardepsexclude] += "extend_recipe_sysroot"
 addtask do_build_sysroot after do_prepare_recipe_sysroot before do_build
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
b/meta/recipes-devtools/gcc/gcc-runtime.inc
index e305180c64..15ae9c337f 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -309,6 +309,7 @@ do_check[depends] += "virtual/libc:do_populate_sysroot"
 do_check[depends] += "${@'qemu-native:do_populate_sysroot' if "user" in
d.getVar('TOOLCHAIN_TEST_TARGET') else ''}"
 # extend the recipe sysroot to include the built libraries (for qemu
usermode)
 do_check[prefuncs] += "extend_recipe_sysroot"
+do_check[vardepsexclude] += "extend_recipe_sysroot"
 do_check[prefuncs] += "check_prepare"
 do_check[dirs] = "${WORKDIR}/dejagnu ${B}"
 do_check[nostamp] = "1"
--
2.34.1

Thanks,
Adam


>
> Cheers,
>
> Richard
>

--00000000000003a94b06563f4d29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 7 Jul 2026 at 12:52, =
Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mon, 2026-07-06 at 15:21 +0100, Richard=
 Purdie via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" ta=
rget=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; On Sat, 2026-04-18 at 20:34 +0200, Adam Blank via <a href=3D"http://li=
sts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedd=
ed.org</a> wrote:<br>
&gt; &gt; It has lain there for a while, obscuring certain aspects of<br>
&gt; &gt; how task signatures are calculated.<br>
&gt; &gt; <br>
&gt; &gt; This changeset does not change the current status quo, but<br>
&gt; &gt; rather changes the way in which it is implemented. It can be<br>
&gt; &gt; followed by changes which further refine what is excluded and<br>
&gt; &gt; how, from those tasks which refer to &#39;extend_recipe_sysroot&#=
39;.<br>
&gt; &gt; <br>
&gt; &gt; Related discussion:<br>
&gt; &gt; <a href=3D"https://lore.kernel.org/openembedded-core/aa893eb861bf=
4dd18e3e84e6bbebdee3b0367d1b.camel@linuxfoundation.org/" rel=3D"noreferrer"=
 target=3D"_blank">https://lore.kernel.org/openembedded-core/aa893eb861bf4d=
d18e3e84e6bbebdee3b0367d1b.camel@linuxfoundation.org/</a><br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Adam Blank &lt;<a href=3D"mailto:adam.blank.g@gmai=
l.com" target=3D"_blank">adam.blank.g@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; Adam Blank (7):<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 package_pkgdata: fix typo to stop =
calling undefined function<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 staging: add &#39;vardepsexclude&#=
39; to &#39;staging_populate_sysroot_dir&#39;<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 staging: add &#39;extend_recipe_sy=
sroot&#39; to &#39;vardepsexclude&#39;<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cross: add &#39;extend_recipe_sysr=
oot&#39; to &#39;vardepsexclude&#39;<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 native: add &#39;extend_recipe_sys=
root&#39; to &#39;vardepsexclude&#39;<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wic-tool: add &#39;extend_recipe_s=
ysroot&#39; to &#39;vardepsexclude&#39;<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake.conf: remove &#39;extend_r=
ecipe_sysroot&#39; from BB_HASHEXCLUDE_COMMON<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0meta/classes-global/package_pkgdata.bbclass | 4 +++-<br>
&gt; &gt; =C2=A0meta/classes-global/staging.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 5 ++++-<br>
&gt; &gt; =C2=A0meta/classes-recipe/cross.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +<br>
&gt; &gt; =C2=A0meta/classes-recipe/native.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +<br>
&gt; &gt; =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 2 +-<br>
&gt; &gt; =C2=A0meta/recipes-core/meta/<a href=3D"http://wic-tools.bb" rel=
=3D"noreferrer" target=3D"_blank">wic-tools.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +<br>
&gt; &gt; =C2=A06 files changed, 11 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; I finally found a bit of time to look at this. I took some of it, I<br=
>
&gt; ended up reworking some of the patches as they needed rewording to<br>
&gt; justify them and explain the changes being made.<br>
&gt; <br>
&gt; I didn&#39;t take the extend_recipe_sysroot removal from bitbake.conf =
as<br>
&gt; I&#39;m still not convinced we have all the issues that might cause<br=
>
&gt; identified. The function name typo and the incorrect vardepsexclude ar=
e<br>
&gt; fixed though (or will be once a couple of patches pass testing/review<=
br>
&gt; and merge).<br>
<br>
I still wasn&#39;t 100% happy with this so I did go a little further and<br=
>
hacked up the attached script. It does have one hardcoded path but you<br>
can get the idea of what I&#39;m trying to do.<br>
<br>
You can start with a clean TMPDIR and run &quot;bitbake world -S none&quot;=
. You<br>
can then edit bitbake.conf and remove extend_recipe_sysroot from<br>
BB_HASHEXCLUDE_COMMON and run that command a second time.<br>
<br>
If you them run the attached script in tmp/stamps, after a bit of<br>
processing, you will see:<br>
<br>
Added {&#39;staging_processfixme[func]&#39;, &#39;staging_copydir&#39;, &#3=
9;BB_RUNTASK&#39;, &#39;oe.utils.get_multilib_datastore&#39;, &#39;sstate_c=
lean_manifest&#39;, &#39;extend_recipe_sysroot&#39;, &#39;DEFAULTTUNE&#39;,=
 &#39;RECIPE_SYSROOT&#39;, &#39;oe.sstatesig.find_sstate_manifest&#39;, &#3=
9;TUNE_PKGARCH:tune-x86-64-v3&#39;, &#39;STAGING_DIR&#39;, &#39;extend_reci=
pe_sysroot[func]&#39;, &#39;RECIPE_SYSROOT_NATIVE&#39;, &#39;COMPONENTS_DIR=
&#39;, &#39;staging_copydir[func]&#39;, &#39;staging_copyfile[func]&#39;, &=
#39;sstate_clean_manifest[func]&#39;, &#39;staging_populate_sysroot_dir&#39=
;, &#39;setscene_depvalid&#39;, &#39;PN&#39;, &#39;oe.path.remove&#39;, &#3=
9;TUNE_PKGARCH&#39;, &#39;RECIPE_SYSROOT_MANIFEST_SUBDIR&#39;, &#39;TARGET_=
ARCH&#39;, &#39;staging_populate_sysroot_dir[func]&#39;, &#39;staging_proce=
ssfixme&#39;, &#39;setscene_depvalid[func]&#39;, &#39;staging_copyfile&#39;=
}<br>
Removed set()<br>
<br>
That means those variables were added as dependencies somewhere in the<br>
build for at least one task. This was basically my worry with the<br>
patch. We need to work out where/why those are being added and triage<br>
them in order to be able to remove extend_recipe_sysroot from the hash<br>
exclusion. Some of them may be acceptable, some of them may not, a lot<br>
depends on context.<br>
<br>
I&#39;m still not sure it is worth the work in changing that, but we do now=
<br>
at least have a way of checking the effect of such a change.<br></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">I&#39;ve allowed myself to have an AI agent run this and one other analys=
is of this subject (hopefully this is not prohibited or frowned upon) and I=
 think there might be an attractive compromise.</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">What could be done is the following set of=
 changes, which would assure, that:</div><div class=3D"gmail_default" style=
=3D"font-size:small">- the &#39;extend_recipe_sysroot&#39; exclusion from t=
he signature calculation would remain active</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">- this exclusion would be closer to the code =
which it logically complements (staging.bbclass) - this would improve the c=
omprehensibility of this design choice</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">- other cases (native.bbclass, cross.bbclass, et al=
) would be more transparent about their relation with &#39;extend_recipe_sy=
sroot&#39;</div><br></div><div><div class=3D"gmail_default" style=3D"font-s=
ize:small">---</div></div><div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><span style=3D"background-color:transparent">=C2=A0meta/classes-=
global/staging.bbclass =C2=A0 =C2=A0 =C2=A0 | 2 ++</span></div>=C2=A0meta/c=
lasses-recipe/cross.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>=C2=A0meta=
/classes-recipe/native.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>=C2=A0me=
ta/conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>=C2=A0meta/recipes-core/meta/<a href=3D"http://w=
ic-tools.bb">wic-tools.bb</a> =C2=A0 =C2=A0 =C2=A0 | 1 +<br>=C2=A0meta/reci=
pes-devtools/gcc/gcc-runtime.inc | 1 +<br>=C2=A06 files changed, 7 insertio=
ns(+), 1 deletion(-)<br><br>diff --git a/meta/classes-global/staging.bbclas=
s b/meta/classes-global/staging.bbclass<br>index f0b3c6eedc..5547980ee4 100=
644<br>--- a/meta/classes-global/staging.bbclass<br>+++ b/meta/classes-glob=
al/staging.bbclass<br>@@ -647,6 +647,7 @@ python extend_recipe_sysroot() {<=
br>=C2=A0extend_recipe_sysroot[vardepsexclude] +=3D &quot;BB_TASKDEPDATA SS=
TATETASKS&quot;<br><br>=C2=A0do_prepare_recipe_sysroot[deptask] =3D &quot;d=
o_populate_sysroot&quot;<br>+do_prepare_recipe_sysroot[vardepsexclude] +=3D=
 &quot;extend_recipe_sysroot&quot;<br>=C2=A0python do_prepare_recipe_sysroo=
t () {<br>=C2=A0 =C2=A0 =C2=A0bb.build.exec_func(&quot;extend_recipe_sysroo=
t&quot;, d)<br>=C2=A0}<br>@@ -665,6 +666,7 @@ python staging_taskhandler() =
{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps =3D d.getVarFlag(task, &quot;de=
pends&quot;)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if task =3D=3D &quot;do_c=
onfigure&quot; or (deps and &quot;populate_sysroot&quot; in deps):<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.prependVarFlag(task, &quot;p=
refuncs&quot;, &quot;extend_recipe_sysroot &quot;)<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(task, &quot;vardepsexclude&quot;, &=
quot; extend_recipe_sysroot&quot;)<br>=C2=A0}<br>=C2=A0staging_taskhandler[=
eventmask] =3D &quot;bb.event.RecipeTaskPreProcess&quot;<br>=C2=A0addhandle=
r staging_taskhandler<br>diff --git a/meta/classes-recipe/cross.bbclass b/m=
eta/classes-recipe/cross.bbclass<br>index 82a49dc8f5..bceee5d6e6 100644<br>=
--- a/meta/classes-recipe/cross.bbclass<br>+++ b/meta/classes-recipe/cross.=
bbclass<br>@@ -98,6 +98,7 @@ python do_addto_recipe_sysroot () {<br>=C2=A0}=
<br>=C2=A0addtask addto_recipe_sysroot after do_populate_sysroot<br>=C2=A0d=
o_addto_recipe_sysroot[deptask] =3D &quot;do_populate_sysroot&quot;<br>+do_=
addto_recipe_sysroot[vardepsexclude] +=3D &quot;extend_recipe_sysroot&quot;=
<br><br>=C2=A0PATH:prepend =3D &quot;${COREBASE}/scripts/cross-intercept:&q=
uot;<br><br>diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-=
recipe/native.bbclass<br>index 8aa86f9cb6..b357b2da7b 100644<br>--- a/meta/=
classes-recipe/native.bbclass<br>+++ b/meta/classes-recipe/native.bbclass<b=
r>@@ -170,6 +170,7 @@ python do_addto_recipe_sysroot () {<br>=C2=A0}<br>=C2=
=A0addtask addto_recipe_sysroot after do_populate_sysroot<br>=C2=A0do_addto=
_recipe_sysroot[deptask] =3D &quot;do_populate_sysroot&quot;<br>+do_addto_r=
ecipe_sysroot[vardepsexclude] +=3D &quot;extend_recipe_sysroot&quot;<br><br=
>=C2=A0inherit nopackages<br><br>diff --git a/meta/conf/bitbake.conf b/meta=
/conf/bitbake.conf<br>index bdf37d0da2..1830cab753 100644<br>--- a/meta/con=
f/bitbake.conf<br>+++ b/meta/conf/bitbake.conf<br>@@ -964,7 +964,7 @@ BB_HA=
SHEXCLUDE_COMMON ?=3D &quot;TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVE=
R DL_DI<br>=C2=A0 =C2=A0 =C2=A0STAMPS_DIR PRSERV_DUMPDIR PRSERV_DUMPFILE PR=
SERV_LOCKDOWN PARALLEL_MAKE \<br>=C2=A0 =C2=A0 =C2=A0CCACHE_DIR EXTERNAL_TO=
OLCHAIN CCACHE CCACHE_NOHASHDIR LICENSE_PATH SDKPKGSUFFIX \<br>=C2=A0 =C2=
=A0 =C2=A0WARN_QA WORKDIR STAMPCLEAN PKGDATA_DIR BUILD_ARCH SSTATE_PKGARCH =
\<br>- =C2=A0 =C2=A0BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recip=
e_sysroot DEPLOY_DIR \<br>+ =C2=A0 =C2=A0BB_WORKERCONTEXT BB_LIMITEDDEPS BB=
_UNIHASH DEPLOY_DIR \<br>=C2=A0 =C2=A0 =C2=A0SSTATE_HASHEQUIV_METHOD SSTATE=
_HASHEQUIV_REPORT_TASKDATA \<br>=C2=A0 =C2=A0 =C2=A0SSTATE_HASHEQUIV_OWNER =
CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \<br>=C2=A0 =C2=A0 =C2=
=A0OMP_NUM_THREADS BB_CURRENTTASK&quot;<br>diff --git a/meta/recipes-core/m=
eta/<a href=3D"http://wic-tools.bb">wic-tools.bb</a> b/meta/recipes-core/me=
ta/<a href=3D"http://wic-tools.bb">wic-tools.bb</a><br>index 823dbe6db6..9a=
3cf8f371 100644<br>--- a/meta/recipes-core/meta/<a href=3D"http://wic-tools=
.bb">wic-tools.bb</a><br>+++ b/meta/recipes-core/meta/<a href=3D"http://wic=
-tools.bb">wic-tools.bb</a><br>@@ -28,4 +28,5 @@ RM_WORK_EXCLUDE +=3D &quot=
;${PN}&quot;<br>=C2=A0python do_build_sysroot () {<br>=C2=A0 =C2=A0 =C2=A0b=
b.build.exec_func(&quot;extend_recipe_sysroot&quot;, d)<br>=C2=A0}<br>+do_b=
uild_sysroot[vardepsexclude] +=3D &quot;extend_recipe_sysroot&quot;<br>=C2=
=A0addtask do_build_sysroot after do_prepare_recipe_sysroot before do_build=
<br>diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-d=
evtools/gcc/gcc-runtime.inc<br>index e305180c64..15ae9c337f 100644<br>--- a=
/meta/recipes-devtools/gcc/gcc-runtime.inc<br>+++ b/meta/recipes-devtools/g=
cc/gcc-runtime.inc<br>@@ -309,6 +309,7 @@ do_check[depends] +=3D &quot;virt=
ual/libc:do_populate_sysroot&quot;<br>=C2=A0do_check[depends] +=3D &quot;${=
@&#39;qemu-native:do_populate_sysroot&#39; if &quot;user&quot; in d.getVar(=
&#39;TOOLCHAIN_TEST_TARGET&#39;) else &#39;&#39;}&quot;<br>=C2=A0# extend t=
he recipe sysroot to include the built libraries (for qemu usermode)<br>=C2=
=A0do_check[prefuncs] +=3D &quot;extend_recipe_sysroot&quot;<br>+do_check[v=
ardepsexclude] +=3D &quot;extend_recipe_sysroot&quot;<br>=C2=A0do_check[pre=
funcs] +=3D &quot;check_prepare&quot;<br>=C2=A0do_check[dirs] =3D &quot;${W=
ORKDIR}/dejagnu ${B}&quot;<br>=C2=A0do_check[nostamp] =3D &quot;1&quot;<br>=
--<br>2.34.1<br></div><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Thanks,</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Adam</div></div><div><span style=3D"background-color:transpa=
rent">=C2=A0</span></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--00000000000003a94b06563f4d29--

