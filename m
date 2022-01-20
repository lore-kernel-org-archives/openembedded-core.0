Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB85C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 08:43:12 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web08.9238.1642668191655687827
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 00:43:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=blVTN/S1;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id w21so9468105uan.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 00:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dRPQr+M1hAOKMJQcN7UFptphSgP64Fx7M6+nSvCrQ7Q=;
        b=blVTN/S1+sMEBaQuHVsnlHA+l7kmMywLxv8+Fn1/Bmt9C9cwLAScCPTQsAOqaYY5FY
         vNPCPYp+v21a7fOTL4lP+IcWWqSTzlHkla/1/IxtQHsoEqW7llCW8kupL7z1xdU4Inux
         YySMXXlLHrrk62sA+iWufP0rdWQeBFw4lVFcTlFJanbqlz1xEUdAUSLd5g/wscPefAvD
         a7CDa+mM+bgQhrudfTv0jpZ7KuOAm62/+IMqw57vE6Krujr524rVWUvMScmuQJWx7Xv5
         5Jt2hD/lSBYF0BJ9qwzncHjMqgBTVmEmHzhQaMK3DqwAK1arPafJzCxQCrWf8RMMN5pk
         MkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dRPQr+M1hAOKMJQcN7UFptphSgP64Fx7M6+nSvCrQ7Q=;
        b=OisZ3cIGii6Sd7tNJG2UdC5cYVvlnp4OgqTCBInnQs9LXv283tJDj/SbMLAgnWnhjD
         rQST8UdwnTyojGxiLaGc9hOx0rT17O6kJflwCHrvQOqvikq1zUfn0wpu5r0bvx/MMQxI
         YYsjkL9W4NkqX4H4K3kBTXbscr0lMyCqySf4XVlkCcM0eSr8v6VaRydBNAJ8yH2hIllv
         rarXyA9bj1eA7oSSvpM8E1KT1KGJdJXSnnZxqypPoSVjS3ov/kYnrWJOvm2n45IdSa5g
         qHgt6xqjce+16A6btug+tpVAHEcMwaXdFnWpT/mW/LWH4SFwcp4gegRRgc9wyyAQCYG3
         sp+w==
X-Gm-Message-State: AOAM530bJQd9mrDQFDTri2IBWm6Lm++Y86vZgWFXjQ3q+VZCifw9zRqg
	5KxmOoK64f6I/WxBKPGSTxkExdTl0oxHoUu3yqI=
X-Google-Smtp-Source: 
 ABdhPJwrswGhUb9HkvZvagMz8z5FFLj1KGqk7IewP92AYI6rnE/rLeYmZIAZURHPe1EGzigBJcn8Z9k4ouZj7vxFK3I=
X-Received: by 2002:a67:e11c:: with SMTP id d28mr215247vsl.73.1642668190757;
 Thu, 20 Jan 2022 00:43:10 -0800 (PST)
MIME-Version: 1.0
References: <20220119030655.3484026-1-hongxu.jia@windriver.com>
 <CANNYZj_07b452gHNi_PhSZPGxQUWqcAZeCejTDzkMzfj4Bo+xA@mail.gmail.com>
 <MW3PR11MB463344722993C35052B97B86945A9@MW3PR11MB4633.namprd11.prod.outlook.com>
 <GV0P278MB02417BC1BD1E1FBBB8CB1239885A9@GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM>
 <c1bb2cec-2d94-dad4-1f68-1a84294ce0cc@windriver.com>
In-Reply-To: <c1bb2cec-2d94-dad4-1f68-1a84294ce0cc@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Jan 2022 09:42:59 +0100
Message-ID: 
 <CANNYZj9C+cVO82UssbdkGW=gn8H-eT6bvT5qP3DhHtEv3Ae7bA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_manager/rpm: conditional remove package
 manager database
To: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	"Yang, Liezhi" <Liezhi.Yang@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000fe78a505d5ff7d91"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 08:43:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160755

--000000000000fe78a505d5ff7d91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think we could address this properly by adding a 'package-database' image
feature?

Alex

On Thu, 20 Jan 2022 at 09:39, Jia, Hongxu <Hongxu.Jia@windriver.com> wrote:

> On 1/20/22 14:34, Diego Santa Cruz wrote:
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Hi,
>
>
>
> We do exactly that in our images, keep rpm but avoid dnf. We do it by
> adding this to the image recipes (via in inc file).
>
>
>
> ROOTFS_PKGMANAGE_remove =3D "dnf"
>
> ROOTFS_POSTUNINSTALL_COMMAND +=3D "spx_wipe_dnf_data ; "
>
>
>
> spx_wipe_dnf_data() {
>
>     bbnote "Removing all dnf runtime data"
>
>     for d in /var/lib/dnf /var/cache/dnf; do
>
>         [ -d ${IMAGE_ROOTFS}$d ] || continue
>
>         dirsize=3D`du -ks ${IMAGE_ROOTFS}/$d  | awk '{ print $1 }'`
>
>         bbnote "Removing $d with $dirsize KiB"
>
>         rm -rf ${IMAGE_ROOTFS}$d/*
>
>     done
>
> }
>
>
>
>
>
> Yes, it helps, thank you very much
>
> //Hongxu
>
> I hope this helps
>
>
>
> --
>
> *Diego Santa Cruz, PhD *Technology Architect
> spinetix.com
> <https://urldefense.com/v3/__http://spinetix.com__;!!AjveYdw8EvQ!P_Qo8UNa=
9oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxd2SHbwc$>
>
>
>
> *From:* openembedded-core@lists.openembedded.org
> <openembedded-core@lists.openembedded.org>
> <openembedded-core@lists.openembedded.org> *On Behalf Of *hongxu via
> lists.openembedded.org
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8Ev=
Q!P_Qo8UNa9oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8CxZKo62pc$>
> *Sent:* 20 January 2022 03:54
> *To:* Alexander Kanavin <alex.kanavin@gmail.com> <alex.kanavin@gmail.com>
> *Cc:* OE-core <openembedded-core@lists.openembedded.org>
> <openembedded-core@lists.openembedded.org>; Yang, Liezhi
> <Liezhi.Yang@windriver.com> <Liezhi.Yang@windriver.com>
> *Subject:* Re: [OE-core] [PATCH] package_manager/rpm: conditional remove
> package manager database
>
>
>
> I am afraid doing remove operation in ROOTFS_POSTPROCESS_COMMAND could no=
t
> satisfy this case
>
>
>
> The background is in order to save spaces in embedded device, user do not
> install
>
> package dnf which introduces python3, and use rpm to manage package on
> target
>
>
>
> In oe-core, the dnf, rpm and pkg database are introduced by
> package-management of IMAGE_FEATURES,
>
> if package-management in IMAGE_FEATURES, we could remove unused pkg data =
in
>
> ROOTFS_POSTPROCESS_COMMAND as you suggested, but we could not uninstall
>
> dnf and all related depend(such as python3) gracefully;
>
> if package-management not in IMAGE_FEATURES, the pkg data will be removed
>
> before ROOTFS_POSTPROCESS_COMMAND, that's why this commit are trying to
> resolve
>
>
>
> The root cause maybe dnf is too heavy for disk sensitive device
>
>
>
> //Hongxu
>
>
> ------------------------------
>
> *From:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:* Wednesday, January 19, 2022 6:15 PM
> *To:* Jia, Hongxu <Hongxu.Jia@windriver.com>
> *Cc:* OE-core <openembedded-core@lists.openembedded.org>; Yang, Liezhi <
> Liezhi.Yang@windriver.com>
> *Subject:* Re: [OE-core] [PATCH] package_manager/rpm: conditional remove
> package manager database
>
>
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Apologies, but please no. This adds complexity, isn't possible to disable
> and is difficult to understand. You can simply remove the unneeded files
> from ROOTFS_POSTPROCESS_COMMAND in your image class.
>
>
>
> Alex
>
>
>
> On Wed, 19 Jan 2022 at 04:07, hongxu <hongxu.jia@windriver.com> wrote:
>
> In order to save spaces in target rootfs, the user wants to remove dnf an=
d
> keep rpm, in this situation, we should remove dnf database only
>
> If rpm was installed, keep rpm database, after applying this commit:
>
> Edit conf/local.conf
> ...
> IMAGE_FEATURES:remove =3D "package-management"
> IMAGE_INSTALL:append=3D " rpm"
> ...
>
> Build image and boot, run rpm -qa on target:
> Without this commit
> ...
> root@intel-x86-64:~# rpm -qa | wc -l
> 0
> ...
>
> Apply this commit
> ...
> root@intel-x86-64:~# rpm -qa | wc -l
> 1865
> ...
>
> With this commit, the rpm -qa works as expected.
>
> It does not make sense to keep dnf and remove rpm, so this commit
> does not consider the scenario
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/package_manager/rpm/__init__.py
> <https://urldefense.com/v3/__https://eur02.safelinks.protection.outlook.c=
om/?url=3Dhttps*3A*2F*2Furldefense.com*2Fv3*2F__http*3A*2F*2F__init__.py__*=
3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gID=
Kvdp1Putv*24&data=3D04*7C01*7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e=
4efe23b608d9dbc02521*7C5f4034faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440=
578878242*7CUnknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0*3D*7C3000&sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSM=
HHkNLpa7*2BDSWc*3D&reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!Ajve=
Ydw8EvQ!P_Qo8UNa9oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_U=
X$>
> | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager/rpm/__init__.py
> <https://urldefense.com/v3/__https://eur02.safelinks.protection.outlook.c=
om/?url=3Dhttps*3A*2F*2Furldefense.com*2Fv3*2F__http*3A*2F*2F__init__.py__*=
3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gID=
Kvdp1Putv*24&data=3D04*7C01*7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e=
4efe23b608d9dbc02521*7C5f4034faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440=
578878242*7CUnknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0*3D*7C3000&sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSM=
HHkNLpa7*2BDSWc*3D&reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!Ajve=
Ydw8EvQ!P_Qo8UNa9oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_U=
X$>
> b/meta/lib/oe/package_manager/rpm/__init__.py
> <https://urldefense.com/v3/__https://eur02.safelinks.protection.outlook.c=
om/?url=3Dhttps*3A*2F*2Furldefense.com*2Fv3*2F__http*3A*2F*2F__init__.py__*=
3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gID=
Kvdp1Putv*24&data=3D04*7C01*7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e=
4efe23b608d9dbc02521*7C5f4034faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440=
578878242*7CUnknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0*3D*7C3000&sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSM=
HHkNLpa7*2BDSWc*3D&reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!Ajve=
Ydw8EvQ!P_Qo8UNa9oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_U=
X$>
> index b392581069..dce5912329 100644
> --- a/meta/lib/oe/package_manager/rpm/__init__.py
> <https://urldefense.com/v3/__https://eur02.safelinks.protection.outlook.c=
om/?url=3Dhttps*3A*2F*2Furldefense.com*2Fv3*2F__http*3A*2F*2F__init__.py__*=
3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gID=
Kvdp1Putv*24&data=3D04*7C01*7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e=
4efe23b608d9dbc02521*7C5f4034faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440=
578878242*7CUnknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0*3D*7C3000&sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSM=
HHkNLpa7*2BDSWc*3D&reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!Ajve=
Ydw8EvQ!P_Qo8UNa9oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_U=
X$>
> +++ b/meta/lib/oe/package_manager/rpm/__init__.py
> <https://urldefense.com/v3/__https://eur02.safelinks.protection.outlook.c=
om/?url=3Dhttps*3A*2F*2Furldefense.com*2Fv3*2F__http*3A*2F*2F__init__.py__*=
3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gID=
Kvdp1Putv*24&data=3D04*7C01*7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e=
4efe23b608d9dbc02521*7C5f4034faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440=
578878242*7CUnknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0*3D*7C3000&sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSM=
HHkNLpa7*2BDSWc*3D&reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!Ajve=
Ydw8EvQ!P_Qo8UNa9oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_U=
X$>
> @@ -80,7 +80,9 @@ class RpmPM(PackageManager):
>          self.saved_packaging_data =3D
> self.d.expand('${T}/saved_packaging_data/%s' % self.task_name)
>          if not os.path.exists(self.d.expand('${T}/saved_packaging_data')=
):
>              bb.utils.mkdirhier(self.d.expand('${T}/saved_packaging_data'=
))
> -        self.packaging_data_dirs =3D ['etc/rpm', 'etc/rpmrc', 'etc/dnf',
> 'var/lib/rpm', 'var/lib/dnf', 'var/cache/dnf']
> +        self.packaging_data_rpm_dirs =3D ['etc/rpm', 'etc/rpmrc',
> 'var/lib/rpm']
> +        self.packaging_data_dnf_dirs =3D ['etc/dnf', 'var/lib/dnf',
> 'var/cache/dnf']
> +        self.packaging_data_dirs =3D self.packaging_data_rpm_dirs +
> self.packaging_data_dnf_dirs
>          self.solution_manifest =3D self.d.expand('${T}/saved/%s_solution=
' %
>                                                 self.task_name)
>          if not os.path.exists(self.d.expand('${T}/saved')):
> @@ -237,8 +239,11 @@ class RpmPM(PackageManager):
>          self._invoke_dnf(["autoremove"])
>
>      def remove_packaging_data(self):
> +        remove_packaging_data_dirs =3D self.packaging_data_dnf_dirs
> +        if "rpm" not in self.list_installed():
> +            remove_packaging_data_dirs +=3D self.packaging_data_rpm_dirs
>          self._invoke_dnf(["clean", "all"])
> -        for dir in self.packaging_data_dirs:
> +        for dir in remove_packaging_data_dirs:
>              bb.utils.remove(oe.path.join(self.target_rootfs, dir), True)
>
>      def backup_packaging_data(self):
> --
> 2.27.0
>
>
>
>
>

--000000000000fe78a505d5ff7d91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think we could address this properly by adding a &#=
39;package-database&#39; image feature?</div><div><br></div><div>Alex<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, 20 Jan 2022 at 09:39, Jia, Hongxu &lt;<a href=3D"mailto:Hongxu.=
Jia@windriver.com">Hongxu.Jia@windriver.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div>On 1/20/22 14:34, Diego Santa Cruz wrote:<br>
</div>
<blockquote type=3D"cite">

<div style=3D"border:1pt solid rgb(156,101,0);padding:2pt">
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif;line-height:12pt;background:rgb(255,235,156) none repeat scro=
ll 0% 0%">
<b><span style=3D"font-size:10pt;color:rgb(156,101,0)"></span></b><span sty=
le=3D"font-size:10pt;color:red">[Please note: This e-mail is from an EXTERN=
AL e-mail address]</span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
Hi,</p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
=C2=A0</p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
We do exactly that in our images, keep rpm but avoid dnf. We do it by addin=
g this to the image recipes (via in inc file).</p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
=C2=A0</p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif;line-height:14.25pt;background:rgb(30,30,30) none repeat scro=
ll 0% 0%">
<span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(156,220,254)=
">ROOTFS_PKGMANAGE_remove</span><span style=3D"font-size:10.5pt;font-family=
:Consolas;color:rgb(212,212,212)"> =3D
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(206,1=
45,120)">&quot;dnf&quot;</span><span style=3D"font-size:10.5pt;font-family:=
Consolas;color:rgb(212,212,212)"></span></p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif;line-height:14.25pt;background:rgb(30,30,30) none repeat scro=
ll 0% 0%">
<span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(156,220,254)=
">ROOTFS_POSTUNINSTALL_COMMAND</span><span style=3D"font-size:10.5pt;font-f=
amily:Consolas;color:rgb(212,212,212)"> +=3D
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(206,1=
45,120)">&quot;spx_wipe_dnf_data ; &quot;</span><span style=3D"font-size:10=
.5pt;font-family:Consolas;color:rgb(212,212,212)"></span></p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif;line-height:14.25pt;background:rgb(30,30,30) none repeat scro=
ll 0% 0%">
<span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(212,212,212)=
">=C2=A0</span></p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif;line-height:14.25pt;background:rgb(30,30,30) none repeat scro=
ll 0% 0%">
<span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(220,220,170)=
">spx_wipe_dnf_data</span><span style=3D"font-size:10.5pt;font-family:Conso=
las;color:rgb(212,212,212)">() {</span></p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif;line-height:14.25pt;background:rgb(30,30,30) none repeat scro=
ll 0% 0%">
<span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(212,212,212)=
">=C2=A0 =C2=A0 bbnote </span>
<span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(206,145,120)=
">&quot;Removing all dnf runtime data&quot;</span><span style=3D"font-size:=
10.5pt;font-family:Consolas;color:rgb(212,212,212)"></span></p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif;line-height:14.25pt;background:rgb(30,30,30) none repeat scro=
ll 0% 0%">
<span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(212,212,212)=
">=C2=A0 =C2=A0 </span><span style=3D"font-size:10.5pt;font-family:Consolas=
;color:rgb(197,134,192)">for</span><span style=3D"font-size:10.5pt;font-fam=
ily:Consolas;color:rgb(212,212,212)">
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(156,2=
20,254)">d</span><span style=3D"font-size:10.5pt;font-family:Consolas;color=
:rgb(212,212,212)">
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(197,1=
34,192)">in</span><span style=3D"font-size:10.5pt;font-family:Consolas;colo=
r:rgb(212,212,212)"> /var/lib/dnf /var/cache/dnf;
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(197,1=
34,192)">do</span><span style=3D"font-size:10.5pt;font-family:Consolas;colo=
r:rgb(212,212,212)"></span></p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif;line-height:14.25pt;background:rgb(30,30,30) none repeat scro=
ll 0% 0%">
<span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(212,212,212)=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -d </span>
<span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(156,220,254)=
">${IMAGE_ROOTFS}$d</span><span style=3D"font-size:10.5pt;font-family:Conso=
las;color:rgb(212,212,212)"> ] ||
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(197,1=
34,192)">continue</span><span style=3D"font-size:10.5pt;font-family:Consola=
s;color:rgb(212,212,212)"></span></p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif;line-height:14.25pt;background:rgb(30,30,30) none repeat scro=
ll 0% 0%">
<span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(212,212,212)=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 dirsize=3D</span><span style=3D"font-size:10.=
5pt;font-family:Consolas;color:rgb(206,145,120)">`du -ks
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(156,2=
20,254)">${IMAGE_ROOTFS}</span><span style=3D"font-size:10.5pt;font-family:=
Consolas;color:rgb(206,145,120)">/</span><span style=3D"font-size:10.5pt;fo=
nt-family:Consolas;color:rgb(156,220,254)">$d</span><span style=3D"font-siz=
e:10.5pt;font-family:Consolas;color:rgb(206,145,120)">
 =C2=A0</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:rg=
b(212,212,212)">|</span><span style=3D"font-size:10.5pt;font-family:Consola=
s;color:rgb(206,145,120)"> awk &#39;{ print $1 }&#39;`</span><span style=3D=
"font-size:10.5pt;font-family:Consolas;color:rgb(212,212,212)"></span></p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif;line-height:14.25pt;background:rgb(30,30,30) none repeat scro=
ll 0% 0%">
<span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(212,212,212)=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbnote
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(206,1=
45,120)">&quot;Removing
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(156,2=
20,254)">$d</span><span style=3D"font-size:10.5pt;font-family:Consolas;colo=
r:rgb(206,145,120)"> with
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(156,2=
20,254)">$dirsize</span><span style=3D"font-size:10.5pt;font-family:Consola=
s;color:rgb(206,145,120)"> KiB&quot;</span><span style=3D"font-size:10.5pt;=
font-family:Consolas;color:rgb(212,212,212)"></span></p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif;line-height:14.25pt;background:rgb(30,30,30) none repeat scro=
ll 0% 0%">
<span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(212,212,212)=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(156,2=
20,254)">${IMAGE_ROOTFS}$d</span><span style=3D"font-size:10.5pt;font-famil=
y:Consolas;color:rgb(212,212,212)">/*</span></p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif;line-height:14.25pt;background:rgb(30,30,30) none repeat scro=
ll 0% 0%">
<span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(212,212,212)=
">=C2=A0 =C2=A0 </span><span style=3D"font-size:10.5pt;font-family:Consolas=
;color:rgb(197,134,192)">done</span><span style=3D"font-size:10.5pt;font-fa=
mily:Consolas;color:rgb(212,212,212)"></span></p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif;line-height:14.25pt;background:rgb(30,30,30) none repeat scro=
ll 0% 0%">
<span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(212,212,212)=
">}</span></p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif;line-height:14.25pt;background:rgb(30,30,30) none repeat scro=
ll 0% 0%">
<span style=3D"font-size:10.5pt;font-family:Consolas;color:rgb(212,212,212)=
">=C2=A0</span></p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
=C2=A0</p>
</div>
</div>
</blockquote>
<p>Yes, it helps, thank you very much</p>
<p>//Hongxu<br>
</p>
<blockquote type=3D"cite">
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
I hope this helps</p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
=C2=A0</p>
<div>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
<span style=3D"font-size:9pt;font-family:&quot;Arial&quot;,sans-serif">-- <=
br>
<b>Diego Santa Cruz, PhD<br>
</b><span style=3D"color:gray">Technology Architect<br>
<a href=3D"https://urldefense.com/v3/__http://spinetix.com__;!!AjveYdw8EvQ!=
P_Qo8UNa9oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxd2SHbwc$" targ=
et=3D"_blank">spinetix.com</a></span></span><span></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
=C2=A0</p>
<div style=3D"border-color:currentcolor currentcolor currentcolor blue;bord=
er-style:none none none solid;border-width:medium medium medium 1.5pt;paddi=
ng:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;borde=
r-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm"=
>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
<b>From:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" ta=
rget=3D"_blank">
openembedded-core@lists.openembedded.org</a> <a href=3D"mailto:openembedded=
-core@lists.openembedded.org" target=3D"_blank">
&lt;openembedded-core@lists.openembedded.org&gt;</a> <b>On Behalf Of </b>ho=
ngxu via <a href=3D"https://urldefense.com/v3/__http://lists.openembedded.o=
rg__;!!AjveYdw8EvQ!P_Qo8UNa9oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqC=
Xf8CxZKo62pc$" target=3D"_blank">
lists.openembedded.org</a><br>
<b>Sent:</b> 20 January 2022 03:54<br>
<b>To:</b> Alexander Kanavin <a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">
&lt;alex.kanavin@gmail.com&gt;</a><br>
<b>Cc:</b> OE-core <a href=3D"mailto:openembedded-core@lists.openembedded.o=
rg" target=3D"_blank">
&lt;openembedded-core@lists.openembedded.org&gt;</a>; Yang, Liezhi <a href=
=3D"mailto:Liezhi.Yang@windriver.com" target=3D"_blank">
&lt;Liezhi.Yang@windriver.com&gt;</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH] package_manager/rpm: conditional remo=
ve package manager database</p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
=C2=A0</p>
<div>
<p><span style=3D"font-size:12pt;color:black">I am afraid doing remove oper=
ation in ROOTFS_POSTPROCESS_COMMAND could not satisfy this case</span></p>
<p><span style=3D"font-size:12pt;color:black">=C2=A0</span></p>
<p><span style=3D"font-size:12pt;color:black">The background is in order to=
 save spaces in embedded device, user do not install</span></p>
<p><span style=3D"font-size:12pt;color:black">package dnf which introduces =
python3, and use rpm to manage package on target</span></p>
<p><span style=3D"font-size:12pt;color:black">=C2=A0</span></p>
<p><span style=3D"font-size:12pt;color:black">In oe-core, the dnf, rpm and =
pkg database are introduced by package-management of IMAGE_FEATURES,</span>=
</p>
<p><span style=3D"font-size:12pt;color:black">if package-management in IMAG=
E_FEATURES, we could remove unused pkg data in</span></p>
<p><span style=3D"font-size:12pt;color:black">ROOTFS_POSTPROCESS_COMMAND as=
 you suggested, but we could not uninstall</span></p>
<p><span style=3D"font-size:12pt;color:black">dnf and all related depend(su=
ch as python3) gracefully;</span></p>
<p><span style=3D"font-size:12pt;color:black">if package-management not in =
IMAGE_FEATURES, the pkg data will be removed</span></p>
<p><span style=3D"font-size:12pt;color:black">before ROOTFS_POSTPROCESS_COM=
MAND, that&#39;s why this commit are trying to resolve</span></p>
<p><span style=3D"font-size:12pt;color:black">=C2=A0</span></p>
<p><span style=3D"font-size:12pt;color:black">The root cause maybe dnf is t=
oo heavy for disk sensitive device</span></p>
<p><span style=3D"font-size:12pt;color:black">=C2=A0</span></p>
<p><span style=3D"font-size:12pt;color:black">//Hongxu</span></p>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
<span style=3D"font-size:12pt;color:black">=C2=A0</span></p>
</div>
<div class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Cal=
ibri,sans-serif;text-align:center" align=3D"center">
<hr width=3D"98%" size=3D"2" align=3D"center">
</div>
<div id=3D"gmail-m_-6470820243521286522divRplyFwdMsg">
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
<b><span style=3D"color:black">From:</span></b><span style=3D"color:black">=
 Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"=
_blank">alex.kanavin@gmail.com</a>&gt;<br>
<b>Sent:</b> Wednesday, January 19, 2022 6:15 PM<br>
<b>To:</b> Jia, Hongxu &lt;<a href=3D"mailto:Hongxu.Jia@windriver.com" targ=
et=3D"_blank">Hongxu.Jia@windriver.com</a>&gt;<br>
<b>Cc:</b> OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedd=
ed.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;;=
 Yang, Liezhi &lt;<a href=3D"mailto:Liezhi.Yang@windriver.com" target=3D"_b=
lank">Liezhi.Yang@windriver.com</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] package_manager/rpm: conditional remo=
ve package manager database</span>
</p>
<div>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
=C2=A0</p>
</div>
</div>
<div>
<div style=3D"border:1pt solid rgb(156,101,0);padding:2pt">
<p style=3D"margin:0cm;font-size:11pt;font-family:Calibri,sans-serif;line-h=
eight:12pt;background:rgb(255,235,156) none repeat scroll 0% 0%">
<span style=3D"font-size:10pt;color:red">[Please note: This e-mail is from =
an EXTERNAL e-mail address]</span></p>
</div>
<div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
Apologies, but please no. This adds complexity, isn&#39;t possible to disab=
le and is difficult to understand. You can simply remove the unneeded files=
 from ROOTFS_POSTPROCESS_COMMAND in your image class.</p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
=C2=A0</p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
Alex</p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
=C2=A0</p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin:0cm;font-size:11pt;font-family:Calib=
ri,sans-serif">
On Wed, 19 Jan 2022 at 04:07, hongxu &lt;<a href=3D"mailto:hongxu.jia@windr=
iver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt; wrote:</p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor rg=
b(204,204,204);border-style:none none none solid;border-width:medium medium=
 medium 1pt;padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 12pt;font-size:11pt;font-fam=
ily:Calibri,sans-serif">
In order to save spaces in target rootfs, the user wants to remove dnf and<=
br>
keep rpm, in this situation, we should remove dnf database only<br>
<br>
If rpm was installed, keep rpm database, after applying this commit:<br>
<br>
Edit conf/local.conf<br>
...<br>
IMAGE_FEATURES:remove =3D &quot;package-management&quot;<br>
IMAGE_INSTALL:append=3D &quot; rpm&quot;<br>
...<br>
<br>
Build image and boot, run rpm -qa on target:<br>
Without this commit<br>
...<br>
root@intel-x86-64:~# rpm -qa | wc -l<br>
0<br>
...<br>
<br>
Apply this commit<br>
...<br>
root@intel-x86-64:~# rpm -qa | wc -l<br>
1865<br>
...<br>
<br>
With this commit, the rpm -qa works as expected.<br>
<br>
It does not make sense to keep dnf and remove rpm, so this commit<br>
does not consider the scenario<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/package_manager/rpm/<a href=3D"https://urldefense.com/v3/=
__https://eur02.safelinks.protection.outlook.com/?url=3Dhttps*3A*2F*2Furlde=
fense.com*2Fv3*2F__http*3A*2F*2F__init__.py__*3B!!AjveYdw8EvQ!JHTMzGi0-aiMo=
NjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv*24&amp;data=3D04*7C=
01*7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e4efe23b608d9dbc02521*7C5f=
4034faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440578878242*7CUnknown*7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0*3D=
*7C3000&amp;sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSMHHkNLpa7*2BDSWc*3D&am=
p;reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!AjveYdw8EvQ!P_Qo8UNa9=
oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_UX$" target=3D"_bl=
ank">__init__.py</a>
 | 9 +++++++--<br>
=C2=A01 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/package_manager/rpm/<a href=3D"https://urldefense.=
com/v3/__https://eur02.safelinks.protection.outlook.com/?url=3Dhttps*3A*2F*=
2Furldefense.com*2Fv3*2F__http*3A*2F*2F__init__.py__*3B!!AjveYdw8EvQ!JHTMzG=
i0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv*24&amp;data=
=3D04*7C01*7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e4efe23b608d9dbc02=
521*7C5f4034faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440578878242*7CUnkno=
wn*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0*3D*7C3000&amp;sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSMHHkNLpa7*2BDS=
Wc*3D&amp;reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!AjveYdw8EvQ!P=
_Qo8UNa9oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_UX$" targe=
t=3D"_blank">__init__.py</a>
 b/meta/lib/oe/package_manager/rpm/<a href=3D"https://urldefense.com/v3/__h=
ttps://eur02.safelinks.protection.outlook.com/?url=3Dhttps*3A*2F*2Furldefen=
se.com*2Fv3*2F__http*3A*2F*2F__init__.py__*3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjI=
t7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv*24&amp;data=3D04*7C01*=
7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e4efe23b608d9dbc02521*7C5f403=
4faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440578878242*7CUnknown*7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0*3D*7C=
3000&amp;sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSMHHkNLpa7*2BDSWc*3D&amp;r=
eserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!AjveYdw8EvQ!P_Qo8UNa9oH3=
Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_UX$" target=3D"_blank=
">__init__.py</a><br>
index b392581069..dce5912329 100644<br>
--- a/meta/lib/oe/package_manager/rpm/<a href=3D"https://urldefense.com/v3/=
__https://eur02.safelinks.protection.outlook.com/?url=3Dhttps*3A*2F*2Furlde=
fense.com*2Fv3*2F__http*3A*2F*2F__init__.py__*3B!!AjveYdw8EvQ!JHTMzGi0-aiMo=
NjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv*24&amp;data=3D04*7C=
01*7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e4efe23b608d9dbc02521*7C5f=
4034faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440578878242*7CUnknown*7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0*3D=
*7C3000&amp;sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSMHHkNLpa7*2BDSWc*3D&am=
p;reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!AjveYdw8EvQ!P_Qo8UNa9=
oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_UX$" target=3D"_bl=
ank">__init__.py</a><br>
+++ b/meta/lib/oe/package_manager/rpm/<a href=3D"https://urldefense.com/v3/=
__https://eur02.safelinks.protection.outlook.com/?url=3Dhttps*3A*2F*2Furlde=
fense.com*2Fv3*2F__http*3A*2F*2F__init__.py__*3B!!AjveYdw8EvQ!JHTMzGi0-aiMo=
NjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv*24&amp;data=3D04*7C=
01*7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e4efe23b608d9dbc02521*7C5f=
4034faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440578878242*7CUnknown*7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0*3D=
*7C3000&amp;sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSMHHkNLpa7*2BDSWc*3D&am=
p;reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!AjveYdw8EvQ!P_Qo8UNa9=
oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_UX$" target=3D"_bl=
ank">__init__.py</a><br>
@@ -80,7 +80,9 @@ class RpmPM(PackageManager):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.saved_packaging_data =3D self.d.expa=
nd(&#39;${T}/saved_packaging_data/%s&#39; % self.task_name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.exists(self.d.expand(&#39;=
${T}/saved_packaging_data&#39;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(self.d.e=
xpand(&#39;${T}/saved_packaging_data&#39;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.packaging_data_dirs =3D [&#39;etc/rpm&#39=
;, &#39;etc/rpmrc&#39;, &#39;etc/dnf&#39;, &#39;var/lib/rpm&#39;, &#39;var/=
lib/dnf&#39;, &#39;var/cache/dnf&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.packaging_data_rpm_dirs =3D [&#39;etc/rpm=
&#39;, &#39;etc/rpmrc&#39;, &#39;var/lib/rpm&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.packaging_data_dnf_dirs =3D [&#39;etc/dnf=
&#39;, &#39;var/lib/dnf&#39;, &#39;var/cache/dnf&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.packaging_data_dirs =3D self.packaging_da=
ta_rpm_dirs + self.packaging_data_dnf_dirs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.solution_manifest =3D self.d.expand(=
&#39;${T}/saved/%s_solution&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 self.task_name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.exists(self.d.expand(&#39;=
${T}/saved&#39;)):<br>
@@ -237,8 +239,11 @@ class RpmPM(PackageManager):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._invoke_dnf([&quot;autoremove&quot;]=
)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def remove_packaging_data(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 remove_packaging_data_dirs =3D self.packaging_=
data_dnf_dirs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;rpm&quot; not in self.list_installed(=
):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remove_packaging_data_dirs +=3D =
self.packaging_data_rpm_dirs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._invoke_dnf([&quot;clean&quot;, &quo=
t;all&quot;])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dir in self.packaging_data_dirs:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dir in remove_packaging_data_dirs:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(oe.path.joi=
n(self.target_rootfs, dir), True)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def backup_packaging_data(self):<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
</p>
</blockquote>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
<p><br>
</p>
</div>

</blockquote></div>

--000000000000fe78a505d5ff7d91--

