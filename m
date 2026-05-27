Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3096BCD4F54
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:39:51 +0000 (UTC)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16677.1779874785718965105
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 02:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p59E3hwA;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: rybczynska@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1363e78746eso7108070c88.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 02:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779874785; cv=none;
        d=google.com; s=arc-20240605;
        b=Xa/0SWvy2lUrWo5TNEqPSfjPCHB8OYBgwp5IUZTaFSDBLvvVHtslS7DfPXnfiFFods
         5MIRfQ9cbTqYumEn+mwUDTpsKSIcURizZZ1c/BqyH/EhCv5vVPb5jEOdd8QbwVub7Yxl
         OtepugwalT7ZQMuYGY3E99sYULiqE62YdjL3+CUjmi0zQvcSeLixMT/NJQMspapAuO7a
         UbJNbCDTBpQaS4QWcdDAlm3qBbIovsjS+KlZupqN77RYj/bYrrjcZz/q3hlZNzaYVsqD
         /bzAJfN1GWcpv1E/zn1M6mrFGB8fmee5IC1eh5TACQ0qkTV3C22tPBkd8z4XN+f2Z1fY
         EZiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nSSpQD1AvQIsj2zSfWtr0bQ3uffPuCrPYWNxr9dFksI=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=XMTsOQmQdx8rqhxrC9EDpw0gYMZcPZc3A5ZYn2F8A2RSRFgj8WXmueAfWgXB8yC1a2
         /m6dKvel2HnAS1LXwXZODR+y4nrNeJsbA0qDHSJESQe8BwSPLEUg8Z8Bm6g8e0QgxvZQ
         EDBLUyKeG+wKWQox588ijKlxQu/CKy2BGSIrMN6HzxjSsHb/1OzZsSXLUaf5ocRxBCg3
         ON+SHFy6xwC7wwOMTGA/ZnwiPORDyE8AkBsf2CHLMzpJojNXfA24RFMXdXnpSvl7nIer
         RsXs3oeF4XrsvwGiuvLfpSgQy2neUyf1qjrAYANPvjg1zmUy4kvZC/0VXyHuWckYINii
         0LAg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779874785; x=1780479585; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nSSpQD1AvQIsj2zSfWtr0bQ3uffPuCrPYWNxr9dFksI=;
        b=p59E3hwAWuJv4dtnmxDQCevEDNLIdecCWMP8w0XLjNguwmCnr5mvF3DPaNime9Ww9c
         6BU2IK/P5R1n+oP+9g5zaHY+Dd8LjN1pVkWjbzf/wdyeqKXp68QKsf8hvTAxrGkIz6Pg
         3JO+pT9935DkgCOl+z+rk7Xdf+mvm+CD+R7ze8h/ll+6ED2vcgL3TcIig+3bPB5A5gCv
         jf6JgsLQ9suszCgjOZJ6yKTum23/Aup9OgNSxq7uhTareoIU9id0qstsmGGok8a1I1+N
         8Iy+eNSuihu+brsBo/OeHNJrR/874y4coaRMhvCD6wBbjeCkRZbtGRHoUd45mA6QHTaj
         hpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779874785; x=1780479585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSSpQD1AvQIsj2zSfWtr0bQ3uffPuCrPYWNxr9dFksI=;
        b=Pt97h3I/3grKw65bs9Q9pdIZpGslDo9WeQo8ncdHdGo5WescbjPZEARqCSh47MJSOd
         XYJhDUyqOk5kADq6cj16eP8Sk7HChFU7eNUjoPiCJFdx6c6G4hHWjztjjdLrzadGl6qH
         7bmUF74OS+jt71L+hji5w3q/8wRfdCPAeDRjB8c/a02Qo589Vo7ZRz2macz3dipSdhMc
         axrQbqqbshJehR1uL4rK7u1NuETJ5SHmYBDqF/HJXb4ENYyz+YyKzdNTvWLiehHX7F1c
         YvzofPoC9BrIsgjiOW2YPnZ34lUw2CHlYXofLsm9PHnFST9fw/qQXEOCwiiiqh+ZKv8f
         BeLQ==
X-Gm-Message-State: AOJu0YwgD5khfRenMAjUt2rEIELsuOiHEIEr2tG9zNuIj5Il/QmkWDbL
	CHw1pnonJW0AxKXpd+hsvJ7jfDy6b4qlu6D9KRI3dyQ0Vw4uI9iYpAaowtOydSaNUv8W7UTDl1J
	uKj0HdC49vk2A1rTc/YzM3L/fQFxqDms=
X-Gm-Gg: Acq92OEiOrGb5nJ0j0GLerzrcPg0+ms0XPJFDRJVuzmItY+xK+B6YoLb4PlWJbK6zUb
	l1cz3f0LdKQRnUGIyDXR9Ft5MSRbqGZuGHriZfnDxP0cw4essQsXeLju5Yf5tcvKjc6I1uC+HG2
	TjBQVEScjNHtyNe2wdAI/KzDDfQexV/9zm1CBWHRABV42pU8R76t8Nr0ygqplV7652ylX/pb/tc
	SHDLYVbVuNWCqtPnktl4O2L+tWHMeLOwe3msJ99DWa1mnAIWmnBiMU6fD9z/LiGSF0uo04GoPbS
	ipWtDc4OVafj3fhn5XhNI6aWJpImQBAt5JhMSF04
X-Received: by 2002:a05:7022:6ba4:b0:137:567:14c4 with SMTP id
 a92af1059eb24-137056719d4mr3645515c88.29.1779874784564; Wed, 27 May 2026
 02:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260526094042.54135-1-marta.rybczynska@ygreky.com> <DIT9IRDXGA86.1L3TDJD2YLDWY@bootlin.com>
In-Reply-To: <DIT9IRDXGA86.1L3TDJD2YLDWY@bootlin.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 27 May 2026 11:39:32 +0200
X-Gm-Features: AVHnY4Ko_0c5urRMlqbp8_VRxNRmP-Aum2YfekZk2ijuCp_X8uabwv2TCQtXtlQ
Message-ID: <CAApg2=TC4fuYR_3iPxTyA4osYq-t1VYannaid=Pa=wj3bTGQdQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] uboot-sign: sign SPL FIT configurations
 instead of images
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004758580652c96464"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 09:39:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237634

--0000000000004758580652c96464
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 8:58=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Tue May 26, 2026 at 11:40 AM CEST, Marta Rybczynska via
> lists.openembedded.org wrote:
> > From: Marta Rybczynska <rybczynska@gmail.com>
> >
> > The SPL FIT signing path was signing individual images, but not the
> configuration.
> >
> > Introduce signing of configuration with images under a separate option
> SPL_SIGN_CONF,
> > enabled by default. It implies changes in the DTB content.
> >
> > The old behaviour is possible with SPL_SIGN_INDIVIDUAL, but should be
> removed in
> > a subsequent patch.
> >
> > Signed-off-by: Marta Rybczynska <rybczynska@gmail.com>
>
> Hi Marta,
>
> Thanks for the new version. I believe we still have two selftest
> failures because of it:
>
> 2026-05-26 16:34:33,908 - oe-selftest - INFO -
> fitimage.UBootFitImageTests.test_sign_standalone_uboot_atf_tee_fit_image
> (subunit.RemotedTestCase)
> 2026-05-26 16:34:33,909 - oe-selftest - INFO -  ... FAIL
> ...
> ERROR: u-boot-1_2026.04-r0 do_uboot_assemble_fitimage: Execution of
> '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-2700759/t=
mp/work/qemuarm-poky-linux-gnueabi/u-boot/2026.04/temp/run.do_uboot_assembl=
e_fitimage.3572291'
> failed with exit code 1
> ...
> | Signature written to 'u-boot-fitImage', node
> '/configurations/conf/signature'
> | Public key written to 'spl/u-boot-spl.dtb', node
> '/signature/key-spl-oe-selftest'
> | Signature check bad (error 1)
> | Verifying Hash Integrity for node 'conf'...
> sha256,rsa2048:spl-oe-selftest+
> | sha256,rsa2048:spl-oe-selftest-
> |  error!
> | Verification failed for '(null)' hash node in 'conf' config node
> | Failed to verify required signature 'key-spl-cascaded-oe-selftest'
> | WARNING: exit code 1 from a shell command.
> ...
> 2026-05-26 16:35:33,469 - oe-selftest - INFO -
> fitimage.UBootFitImageTests.test_sign_standalone_uboot_fit_image
> (subunit.RemotedTestCase)
> 2026-05-26 16:35:33,469 - oe-selftest - INFO -  ... FAIL
> ...
> ERROR: u-boot-1_2026.04-r0 do_uboot_assemble_fitimage: Execution of
> '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-2700759/t=
mp/work/qemuarm-poky-linux-gnueabi/u-boot/2026.04/temp/run.do_uboot_assembl=
e_fitimage.3689059'
> failed with exit code 1
> ...
> | Signature written to 'u-boot-fitImage', node
> '/configurations/conf/signature'
> | Public key written to 'spl/u-boot-spl.dtb', node
> '/signature/key-spl-oe-selftest'
> | Signature check bad (error 1)
> | Verifying Hash Integrity for node 'conf'...
> sha256,rsa2048:spl-oe-selftest+
> | sha256,rsa2048:spl-oe-selftest-
> |  error!
> | Verification failed for '(null)' hash node in 'conf' config node
> | Failed to verify required signature 'key-spl-cascaded-oe-selftest'
> | WARNING: exit code 1 from a shell command.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3999
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3905
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3770
>
> Can you have a look at the issue?


Looking into it. Those tests work in my setup. To be continued.

Regards,
Marta

--0000000000004758580652c96464
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 27,=
 2026 at 8:58=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathie=
u.dubois-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue May 26=
, 2026 at 11:40 AM CEST, Marta Rybczynska via <a href=3D"http://lists.opene=
mbedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a=
> wrote:<br>
&gt; From: Marta Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com" tar=
get=3D"_blank">rybczynska@gmail.com</a>&gt;<br>
&gt;<br>
&gt; The SPL FIT signing path was signing individual images, but not the co=
nfiguration.<br>
&gt;<br>
&gt; Introduce signing of configuration with images under a separate option=
 SPL_SIGN_CONF,<br>
&gt; enabled by default. It implies changes in the DTB content.<br>
&gt;<br>
&gt; The old behaviour is possible with SPL_SIGN_INDIVIDUAL, but should be =
removed in<br>
&gt; a subsequent patch.<br>
&gt;<br>
&gt; Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail=
.com" target=3D"_blank">rybczynska@gmail.com</a>&gt;<br>
<br>
Hi Marta,<br>
<br>
Thanks for the new version. I believe we still have two selftest<br>
failures because of it:<br>
<br>
2026-05-26 16:34:33,908 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_standalone_uboot_atf_tee_fit_image (subunit.RemotedTestCase)<br>
2026-05-26 16:34:33,909 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
...<br>
ERROR: u-boot-1_2026.04-r0 do_uboot_assemble_fitimage: Execution of &#39;/s=
rv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-2700759/tmp/wo=
rk/qemuarm-poky-linux-gnueabi/u-boot/2026.04/temp/run.do_uboot_assemble_fit=
image.3572291&#39; failed with exit code 1<br>
...<br>
| Signature written to &#39;u-boot-fitImage&#39;, node &#39;/configurations=
/conf/signature&#39;<br>
| Public key written to &#39;spl/u-boot-spl.dtb&#39;, node &#39;/signature/=
key-spl-oe-selftest&#39;<br>
| Signature check bad (error 1)<br>
| Verifying Hash Integrity for node &#39;conf&#39;... sha256,rsa2048:spl-oe=
-selftest+<br>
| sha256,rsa2048:spl-oe-selftest-<br>
|=C2=A0 error!<br>
| Verification failed for &#39;(null)&#39; hash node in &#39;conf&#39; conf=
ig node<br>
| Failed to verify required signature &#39;key-spl-cascaded-oe-selftest&#39=
;<br>
| WARNING: exit code 1 from a shell command.<br>
...<br>
2026-05-26 16:35:33,469 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_standalone_uboot_fit_image (subunit.RemotedTestCase)<br>
2026-05-26 16:35:33,469 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
...<br>
ERROR: u-boot-1_2026.04-r0 do_uboot_assemble_fitimage: Execution of &#39;/s=
rv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-2700759/tmp/wo=
rk/qemuarm-poky-linux-gnueabi/u-boot/2026.04/temp/run.do_uboot_assemble_fit=
image.3689059&#39; failed with exit code 1<br>
...<br>
| Signature written to &#39;u-boot-fitImage&#39;, node &#39;/configurations=
/conf/signature&#39;<br>
| Public key written to &#39;spl/u-boot-spl.dtb&#39;, node &#39;/signature/=
key-spl-oe-selftest&#39;<br>
| Signature check bad (error 1)<br>
| Verifying Hash Integrity for node &#39;conf&#39;... sha256,rsa2048:spl-oe=
-selftest+<br>
| sha256,rsa2048:spl-oe-selftest-<br>
|=C2=A0 error!<br>
| Verification failed for &#39;(null)&#39; hash node in &#39;conf&#39; conf=
ig node<br>
| Failed to verify required signature &#39;key-spl-cascaded-oe-selftest&#39=
;<br>
| WARNING: exit code 1 from a shell command.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/buil=
ds/3999" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/23/builds/3999</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/buil=
ds/3905" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/35/builds/3905</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/buil=
ds/3770" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/48/builds/3770</a><br>
<br>
Can you have a look at the issue?</blockquote><div><br></div><div>Looking i=
nto it. Those tests work in my setup. To be continued.</div><div><br></div>=
<div>Regards,</div><div>Marta=C2=A0</div></div></div>

--0000000000004758580652c96464--

