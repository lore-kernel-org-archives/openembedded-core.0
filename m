Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6351AD20680
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 22:42:02 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.10027.1729032113923657976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 15:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IHUO6RXE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43115887867so2053695e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 15:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729032112; x=1729636912; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JA6x2RZmbt8mxlFywczCTrdbJGd0jdMe4qzmD9he9tI=;
        b=IHUO6RXEm4gic8lAYlRrsdVF/PcMEnZyc07o9grrCe5dPcMpATlk33KcrZJy8AJTal
         lbm85WJxYQkT1Wgiq4mkZ1Yb8Y9y9ug6yVdYwHWoH+zPj81qitkf8r2hQs725OnhVYlj
         H9StTB+aUL+zsFDAtZ7sy1FDJMk0vEF+R2Gd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729032112; x=1729636912;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JA6x2RZmbt8mxlFywczCTrdbJGd0jdMe4qzmD9he9tI=;
        b=wuYGJvOhkFtbJrjJ8+Id4caOSL8gJfLDpOTFwW+nv4OOdALh5UtZqvdIaATury9bQv
         f6fyw/ixFOdpWRAkuotoac15ihcLxF2n9QjOBK1mFYIJwlos1oghiM60hMx+62Fxpkvb
         +c168RLN/xoysQ1ZslD1QA2/NYZK1Wy3MGqp+Z2MPVj3Z+0Mn8ALBjcLLRxRz3gunx+6
         /W9x4t9OY1brDIZcbn0B4NGgJAoFYi3TLQFoQCPkhs8W/eww741RceMESB/NrVLskWzJ
         4ukfBET3IDfV2wTWxTCI/hgzPxtogI7HPCPopp/9dIS/y6EQ1v1NVHa4afhknHjC7C0l
         k2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx9ln5tH3GSEFd8sti1dtcelCLLkomFvG2J10pv64AktblT9SKO3Yt4GBb2X+/Pn/k51WD9Z+fsxF+G5+JhO8tjg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxbzzFhZxjVbl7Wjg4DGnJFTQq3sEN7+94B2AZTPzg61RkmhmXK
	w4PcoEfMiGAZ+rIhJP3Si2B53M/wHanFr+L7VmrLM8sPz0bjRoIPsT2uuIY/fqw=
X-Google-Smtp-Source: AGHT+IGi/c3iCQgXaL3cZt7xmc4ZFw+oPzYNT1/a1hp7z1EyeRyYNpkzydsA9UMpWUoNMnh2XdIjaA==
X-Received: by 2002:a05:600c:4f83:b0:428:b4a:7001 with SMTP id 5b1f17b1804b1-4314a3abf3bmr16597645e9.15.1729032112066;
        Tue, 15 Oct 2024 15:41:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ca4b:46df:459f:fe11? ([2001:8b0:aba:5f3c:ca4b:46df:459f:fe11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f6c63c2sm30436005e9.47.2024.10.15.15.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 15:41:51 -0700 (PDT)
Message-ID: <a8af25be04be39c3f91344858ed95a6ebc936f48.camel@linuxfoundation.org>
Subject: Re: [OE-core][scarthgap 17/18] image_qa: fix error handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2024 23:41:50 +0100
In-Reply-To: <8fe7aef17eefa70e3f7c07077b8c695e5c00ed5e.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
	 <8fe7aef17eefa70e3f7c07077b8c695e5c00ed5e.1729018153.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 22:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205951

On Tue, 2024-10-15 at 11:50 -0700, Steve Sakoman via lists.openembedded.org=
 wrote:
> From: Louis Rannou <louis.rannou@non.se.com>
>=20
> Make ImageQAFailed inherit BBHandledException so exceptions raised in tes=
ts are
> catched when the actual test function is executed by bb.utils.better_exec=
.
>=20
> Change the do_image_qa tasks so errors are handled with oe.qa.handle_erro=
r. Add
> some comment to explain this requires to list the test in ERROR_QA or WAR=
N_QA.
>=20
> [YOCTO #14807]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14807
>=20
> Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 905e224849fbbed1719e0add231b00e2d570b3b4)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
> =C2=A0meta/classes-recipe/image.bbclass | 11 ++++++-----
> =C2=A0meta/lib/oe/utils.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A02 files changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/imag=
e.bbclass
> index 28be6c6362..a682b5f3b2 100644
> --- a/meta/classes-recipe/image.bbclass
> +++ b/meta/classes-recipe/image.bbclass
> @@ -308,23 +308,24 @@ addtask do_image_complete_setscene
> =C2=A0#
> =C2=A0# The functions should use ${IMAGE_ROOTFS} to find the unpacked roo=
tfs
> =C2=A0# directory, which if QA passes will be the basis for the images.
> +#
> +# The functions should use oe.utils.ImageQAFailed(description, name) to =
raise
> +# errors. The name must be listed in ERROR_QA or WARN_QA to prompt.
> =C2=A0fakeroot python do_image_qa () {
> =C2=A0=C2=A0=C2=A0=C2=A0 from oe.utils import ImageQAFailed
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 qa_cmds =3D (d.getVar('IMAGE_QA_COMMANDS') or ''=
).split()
> -=C2=A0=C2=A0=C2=A0 qamsg =3D ""
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 for cmd in qa_cmds:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
bb.build.exec_func(cmd, d)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except oe.utils.ImageQAF=
ailed as e:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qamsg=
 =3D qamsg + '\tImage QA function %s failed: %s\n' % (e.name, e.description=
)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qamsg=
 =3D 'Image QA function %s failed: %s\n' % (e.name, e.description)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe.qa=
.handle_error(e.name, qamsg, d)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except Exception as e:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
qamsg =3D qamsg + '\tImage QA function %s failed: %s\n' % (cmd, e)
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 if qamsg:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imgname =3D d.getVar('IMAGE_N=
AME')
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal("QA errors found whi=
lst validating image: %s\n%s" % (imgname, qamsg))
> +=C2=A0=C2=A0=C2=A0 oe.qa.exit_if_errors(d)
> =C2=A0}
> =C2=A0addtask do_image_qa after do_rootfs before do_image
> =C2=A0
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 14a7d07ef0..83f1440887 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -482,7 +482,7 @@ def get_multilib_datastore(variant, d):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 localdata.setVar("MLPREF=
IX", "")
> =C2=A0=C2=A0=C2=A0=C2=A0 return localdata
> =C2=A0
> -class ImageQAFailed(Exception):
> +class ImageQAFailed(bb.BBHandledException):
> =C2=A0=C2=A0=C2=A0=C2=A0 def __init__(self, description, name=3DNone, log=
file=3DNone):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.description =3D des=
cription
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.name =3D name
>=20

This caused further issues if I remember correctly.

https://git.yoctoproject.org/poky/commit/?id=3Db0eb2b9b3660dfda1c4c43cfcca6=
a2c4a84d6dc8

for example.

Cheers,

Richard



