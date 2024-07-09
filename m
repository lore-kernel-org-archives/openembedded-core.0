Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B0C4C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 07:22:08 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.7361.1720509717706450967
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 00:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jgy9bnru;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ee920b0781so45610441fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 00:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720509716; x=1721114516; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Br1+ByZ67BBymos/8sL9RaG8WsGiwoeox7e3CMrcWI=;
        b=jgy9bnruqeTHEW5Z1u6mmY9M3Uw64zrD4kUCVfblVto5D1+8IBXDxeC17nFVaF9I9Q
         SNXWgSq1o23YT39o4N5OkwTJzQUguwK19uTZNdqe1PotYHKowiwwZVuGDA7VejaOPxD7
         Yzw3ffCfhuRnkmGDDRa2gproU72owvLxW6CtonzXeq8T8zr4uH3txmzM5gkE5gAc40Qy
         2iZEAcB6GrZRNsBVmV/jL3ezSVNwSftyF/WfT9OLOUzvqBNiRBW4NcNvKPFvo5+G83LQ
         yw3Ys8C0UlO9l1TIuAgPy6XjUy8LyNkAp83dbl4unYs0QYS2xYu/P0ZaWkZRuqi7OIia
         l35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720509716; x=1721114516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Br1+ByZ67BBymos/8sL9RaG8WsGiwoeox7e3CMrcWI=;
        b=dOPsTIJDmZ2nOKV0SKT3UoWUyJw3zhKTm/UTiSjyPZfBhc5Jve0hUpWFDAxBBF3bvI
         aAGgtU/vHlGV0VkC4pk1uII3fDI4BK4SGY7NG2sEzixuk5plEh70S2/0BYCyqkW08HbX
         mIbt6EtVqWncFJN+8u0oD3nomkowcIS9JcXm5P+mocUdjo2xGunnc+h9EimkfXAO+eDT
         wPqEAycRcVCvHVr0DnDOuf+DAlPcu+non9yvE50HsBn+8o8QP80e4jPfgemiZ4J73NyP
         nHYsetLajPzmln3y3JU5AV2R9l8Uf+EsYtl9ptJ+7SRJ1eHiS0n36UtGki1QaCL13arR
         JNIg==
X-Gm-Message-State: AOJu0YwnTnryMowK0Vw1xx5QJA5Y0+Hgh3usrhOHgvDaCz/d4Pp+bKNz
	1vL6WsDzx1l3b1itvNK4lY/FkvUsgOoxDAUhqENoee8YFRxZs9GhJP+mlWRnmRrYWrfuoBZApTs
	fY9m6V7gJDMCqaRn/Tmj13zzl/YI=
X-Google-Smtp-Source: AGHT+IEGTExuXng3KmoF9b3oEiFECsImU4/rJ6IU44cf78r+bsamUxNiYvPfz+qN2QBC2UDFZ2ef2Ana60c8bEgCNJw=
X-Received: by 2002:a2e:9482:0:b0:2ec:56b9:259f with SMTP id
 38308e7fff4ca-2eeb319134dmr10311221fa.48.1720509715534; Tue, 09 Jul 2024
 00:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <PA4PR01MB935650793B965CC1A54FB63AD5DB2@PA4PR01MB9356.eurprd01.prod.exchangelabs.com>
In-Reply-To: <PA4PR01MB935650793B965CC1A54FB63AD5DB2@PA4PR01MB9356.eurprd01.prod.exchangelabs.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Jul 2024 09:21:44 +0200
Message-ID: <CANNYZj_jN2C23zpc29EYGtY0kK3Q1n35i0t3dPH+hDOrMMAUBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] execute pkg_postinst_ontarget task for read
 only rootfs when read-only-rootfs-delayed-postinsts is set
To: Tobias.Gassner.ext@karlstorz.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006d5998061ccb6269"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 07:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201644

--0000000000006d5998061ccb6269
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You need to use =E2=80=98git send-email=E2=80=99.

Alex

On Tue 9. Jul 2024 at 9.03, Gassner, Tobias.ext via lists.openembedded.org
<Tobias.Gassner.ext=3Dkarlstorz.com@lists.openembedded.org> wrote:

> Hi,
>
> this patch will ensure that pkg_postinst_ontarget task is executed for
> read only rootfs when read-only-rootfs-delayed-postinsts is set as
> IMAGE_FEATURES. In addition to the fix, a test in
> meta/lib/oeqa/selftest/cases/overlayfs.py testing the fix has been
> implemented.
>
> See https://lists.yoctoproject.org/g/poky/topic/106869018#msg13391 for
> the discussion of this patch; this patch consits of patches
> 608050984c5be67f506a0877fadbbe0b61575e54 and
> da51462765e24b186c55431b53856eebd5f6e8da in that discussion.
>
> Greetings
> -Tobias
>
>
> From ecf1d8c47ecb72c2f27464f01e932091374f4e6c Mon Sep 17 00:00:00 2001
> From: "Gassner, Tobias.ext" <tobias.gassner.ext@karlstorz.com>
> Date: Tue, 9 Jul 2024 08:34:30 +0200
> Subject: [PATCH] execute pkg_postinst_ontarget task for read only rootfs
> when
>  read-only-rootfs-delayed-postinsts is set
>
> Signed-off-by: Gassner, Tobias.ext <tobias.gassner.ext@karlstorz.com>
> ---
>  meta/lib/oe/rootfs.py                     |  4 +++
>  meta/lib/oeqa/selftest/cases/overlayfs.py | 41 ++++++++++++++++++++++-
>  2 files changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 8cd48f9450..5abce4ad7d 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -269,7 +269,11 @@ class Rootfs(object, metaclass=3DABCMeta):
>                  self.pm.remove(["run-postinsts"])
>
>          image_rorfs =3D bb.utils.contains("IMAGE_FEATURES",
> "read-only-rootfs",
> +                                        True, False, self.d) and \
> +                      not bb.utils.contains("IMAGE_FEATURES",
> +
>  "read-only-rootfs-delayed-postinsts",
>                                          True, False, self.d)
> +
>          image_rorfs_force =3D self.d.getVar('FORCE_RO_REMOVE')
>
>          if image_rorfs or image_rorfs_force =3D=3D "1":
> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py
> b/meta/lib/oeqa/selftest/cases/overlayfs.py
> index e31063567b..580fbdcb9c 100644
> --- a/meta/lib/oeqa/selftest/cases/overlayfs.py
> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
> @@ -5,7 +5,7 @@
>  #
>
>  from oeqa.selftest.case import OESelftestTestCase
> -from oeqa.utils.commands import bitbake, runqemu
> +from oeqa.utils.commands import bitbake, runqemu, get_bb_vars
>  from oeqa.core.decorator import OETestTag
>  from oeqa.core.decorator.data import skipIfNotMachine
>
> @@ -466,6 +466,45 @@ IMAGE_INSTALL:append =3D " overlayfs-user"
>              line =3D getline_qemu(output, "Read-only file system")
>              self.assertTrue(line, msg=3Doutput)
>
> +    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific
> currently")
> +    def test_postinst_on_target_for_read_only_rootfs(self):
> +        """
> +        Summary:  The purpose of this test case is to verify that
> post-installation
> +                  on target scripts are executed even if using read-only
> rootfs when
> +                  read-only-rootfs-delayed-postinsts is set
> +        Expected: The test files are created on first boot
> +        """
> +
> +        import oe.path
> +
> +        vars =3D get_bb_vars(("IMAGE_ROOTFS", "sysconfdir"),
> "core-image-minimal")
> +        sysconfdir =3D vars["sysconfdir"]
> +        self.assertIsNotNone(sysconfdir)
> +        # Need to use oe.path here as sysconfdir starts with /
> +        targettestdir =3D os.path.join(sysconfdir, "postinst-test")
> +
> +        config =3D self.get_working_config()
> +
> +        args =3D {
> +            'OVERLAYFS_INIT_OPTION': "",
> +            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': 1,
> +            'OVERLAYFS_ROOTFS_TYPE': "ext4",
> +            'OVERLAYFS_ETC_CREATE_MOUNT_DIRS': 1
> +        }
> +
> +        # read-only-rootfs is already set in get_working_config()
> +        config +=3D 'EXTRA_IMAGE_FEATURES +=3D
> "read-only-rootfs-delayed-postinsts"\n'
> +        config +=3D 'CORE_IMAGE_EXTRA_INSTALL =3D "postinst-delayed-b"\n=
'
> +
> +        self.write_config(config.format(**args))
> +
> +        res =3D bitbake('core-image-minimal')
> +
> +        with runqemu('core-image-minimal', image_fstype=3D'wic') as qemu=
:
> +            for filename in ("rootfs", "delayed-a", "delayed-b"):
> +                status, output =3D qemu.run_serial("test -f %s && echo
> found" % os.path.join(targettestdir, filename))
> +                self.assertIn("found", output, "%s was not present on
> boot" % filename)
> +
>      def get_working_config(self):
>          return """
>  # Use systemd as init manager
> --
> 2.45.2
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201643):
> https://lists.openembedded.org/g/openembedded-core/message/201643
> Mute This Topic: https://lists.openembedded.org/mt/107118664/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006d5998061ccb6269
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">You need to use =E2=80=98git send-email=E2=80=99.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 9. Jul 2024 a=
t 9.03, Gassner, Tobias.ext via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;Tobias.Gassner.ext=3D<a href=3D"mailto:karlst=
orz.com@lists.openembedded.org">karlstorz.com@lists.openembedded.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;b=
order-left-color:rgb(204,204,204)">




<div dir=3D"ltr">
<div style=3D"margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontS=
ervice,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi,</div>
<div style=3D"margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontS=
ervice,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontS=
ervice,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
this patch will ensure that pkg_postinst_ontarget task is executed for read=
 only rootfs when=C2=A0read-only-rootfs-delayed-postinsts=C2=A0is set as IM=
AGE_FEATURES. In addition to the fix, a test in meta/lib/oeqa/selftest/case=
s/overlayfs.py testing the fix has been implemented.</div>
<div style=3D"margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontS=
ervice,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontS=
ervice,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
See <a href=3D"https://lists.yoctoproject.org/g/poky/topic/106869018#msg133=
91" id=3D"m_-4407703402222500851OWA41ee8ac4-b1a6-2ca4-c0e5-84c94f841eab" re=
l=3D"noopener noreferrer" style=3D"margin:0px;font-family:Aptos,Aptos_Embed=
dedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif" target=3D"_blank"=
>
https://lists.yoctoproject.org/g/poky/topic/106869018#msg13391</a>=C2=A0for=
 the discussion of this patch; this patch consits of patches 608050984c5be6=
7f506a0877fadbbe0b61575e54 and da51462765e24b186c55431b53856eebd5f6e8da in =
that discussion.</div>
<div style=3D"margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontS=
ervice,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontS=
ervice,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Greetings</div>
<div style=3D"margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontS=
ervice,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
-Tobias</div>
<div style=3D"margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontS=
ervice,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontS=
ervice,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
From ecf1d8c47ecb72c2f27464f01e932091374f4e6c Mon Sep 17 00:00:00 2001</div=
>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
From: &quot;Gassner, Tobias.ext&quot; &lt;<a href=3D"mailto:tobias.gassner.=
ext@karlstorz.com" target=3D"_blank" style=3D"font-family:Consolas,Courier,=
monospace">tobias.gassner.ext@karlstorz.com</a>&gt;</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
Date: Tue, 9 Jul 2024 08:34:30 +0200</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
Subject: [PATCH] execute pkg_postinst_ontarget task for read only rootfs wh=
en</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0read-only-rootfs-delayed-postinsts is set</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
Signed-off-by: Gassner, Tobias.ext &lt;<a href=3D"mailto:tobias.gassner.ext=
@karlstorz.com" target=3D"_blank" style=3D"font-family:Consolas,Courier,mon=
ospace">tobias.gassner.ext@karlstorz.com</a>&gt;</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
---</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0meta/lib/oe/rootfs.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A04 +++</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0meta/lib/oeqa/selftest/cases/overlayfs.py | 41 ++++++++++++++++++++++=
-</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A02 files changed, 44 insertions(+), 1 deletion(-)</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
index 8cd48f9450..5abce4ad7d 100644</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
--- a/meta/lib/oe/rootfs.py</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+++ b/meta/lib/oe/rootfs.py</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
@@ -269,7 +269,11 @@=C2=A0class Rootfs(object, metaclass=3DABCMeta):</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.pm.remov=
e([&quot;run-postinsts&quot;])</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image_rorfs =3D bb.utils.contains(&quot;I=
MAGE_FEATURES&quot;, &quot;read-only-rootfs&quot;,</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0True, Fal=
se, self.d) and \</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0not bb.utils.contains(&quot;IMAGE_FEATURES&quot;,</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;rea=
d-only-rootfs-delayed-postinsts&quot;,</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Tr=
ue, False, self.d)</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image_rorfs_force =3D self.d.getVar(&#39;=
FORCE_RO_REMOVE&#39;)</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if image_rorfs or image_rorfs_force =3D=
=3D &quot;1&quot;:</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/self=
test/cases/overlayfs.py</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
index e31063567b..580fbdcb9c 100644</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
@@ -5,7 +5,7 @@</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0#</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0from oeqa.selftest.case import OESelftestTestCase</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
-from oeqa.utils.commands import bitbake, runqemu</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+from oeqa.utils.commands import bitbake, runqemu, get_bb_vars</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0from oeqa.core.decorator import OETestTag</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0from oeqa.core.decorator.data import skipIfNotMachine</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
@@ -466,6 +466,45 @@ IMAGE_INSTALL:append =3D &quot; overlayfs-user&quot;</=
div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0line =3D getline_qemu(outpu=
t, &quot;Read-only file system&quot;)</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(line, msg=
=3Doutput)</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0@skipIfNotMachine(&quot;qemux86-64&quot;, &quot;tests are qe=
mux86-64 specific currently&quot;)</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0def test_postinst_on_target_for_read_only_rootfs(self):</div=
>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0Summary: =C2=A0The purpose of this test case i=
s to verify that post-installation</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on target s=
cripts are executed even if using read-only rootfs when</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read-only-r=
ootfs-delayed-postinsts is set</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0Expected: The test files are created on first =
boot</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0import oe.path</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0vars =3D get_bb_vars((&quot;IMAGE_ROOTFS&quot;=
, &quot;sysconfdir&quot;), &quot;core-image-minimal&quot;)</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0sysconfdir =3D vars[&quot;sysconfdir&quot;]</d=
iv>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertIsNotNone(sysconfdir)</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0# Need to use oe.path here as sysconfdir start=
s with /</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0targettestdir =3D os.path.join(sysconfdir, &qu=
ot;postinst-test&quot;)</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0config =3D self.get_working_config()</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0args =3D {</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;OVERLAYFS_INIT_OPTION&#39;:=
 &quot;&quot;,</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;OVERLAYFS_ETC_USE_ORIG_INIT=
_NAME&#39;: 1,</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;OVERLAYFS_ROOTFS_TYPE&#39;:=
 &quot;ext4&quot;,</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;OVERLAYFS_ETC_CREATE_MOUNT_=
DIRS&#39;: 1</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0# read-only-rootfs is already set in get_worki=
ng_config()</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0config +=3D &#39;EXTRA_IMAGE_FEATURES +=3D &qu=
ot;read-only-rootfs-delayed-postinsts&quot;\n&#39;</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0config +=3D &#39;CORE_IMAGE_EXTRA_INSTALL =3D =
&quot;postinst-delayed-b&quot;\n&#39;</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0self.write_config(config.format(**args))</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D bitbake(&#39;core-image-minimal&#39;)<=
/div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0with runqemu(&#39;core-image-minimal&#39;, ima=
ge_fstype=3D&#39;wic&#39;) as qemu:</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for filename in (&quot;rootfs&qu=
ot;, &quot;delayed-a&quot;, &quot;delayed-b&quot;):</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status, output =3D=
 qemu.run_serial(&quot;test -f %s &amp;&amp; echo found&quot; % os.path.joi=
n(targettestdir, filename))</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertIn(&quo=
t;found&quot;, output, &quot;%s was not present on boot&quot; % filename)</=
div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
+</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0def get_working_config(self):</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;&quot;&quot;</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
=C2=A0# Use systemd as init manager</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
--=C2=A0</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
2.45.2</div>
<div style=3D"margin:0px;font-family:Consolas,Courier,monospace;font-size:1=
2pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontS=
ervice,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<span style=3D"font-family:Consolas,Courier,monospace"><br>
</span><br>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#201643): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/201643" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/201643</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107118664/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107118664/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000006d5998061ccb6269--

