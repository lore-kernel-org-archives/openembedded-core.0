Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C06DC3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 12:07:00 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.11956.1673006814600254422
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 04:06:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mg5oM10T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso3372399wms.5
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 04:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjnvpVx6ZaE8n3dunMkMs4j7h60qZH5ItfzfH+rOEpU=;
        b=Mg5oM10TrzQmlDFAQ2puuHO4AmCgtznV9eBcecm2uHhB7hCDU/QvEhx0q9rwYZjJ7K
         SVX3alH/F51HEvwwmixrEpFt+tEYYDaS7VGzzK2Rce8EWDqmlij4CAo5XtmWpHpqxKMz
         c04AKZGwWSI8d3pNLD9eReQZa33loNYK+0Khg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PjnvpVx6ZaE8n3dunMkMs4j7h60qZH5ItfzfH+rOEpU=;
        b=1pLugDS6GLBk4Hv9R6uekYfY/uyBjLe2Zw3X7T91ZHYZe3xDRNLDCM/QppY3BuseTk
         Y0VqfKK1LPpK1+c+FHW+FL/8LdkQPDqoxZbeZw2fLLsz5FmYd9Fl8gheg7Don7bNeUFb
         OIm4TYVbTZkHRwlLVc26w+uhLhWBXLFQ2idZxqySAnN5APsc422P9y1CQl5welB2l3W9
         Qw34r+QKcZMJP9VuT/PFQjBwCI5FMwT92X2HTq8nkL7+NXPyxVKbbUP/n+Bb6RkWHy3W
         Al7LMqkWsWCHHMD116WfQ5Ddx0Bc0eUJ01DXFNHpMBoKKyNQQ2o/LFq1Rt+F4wNcYcoZ
         MAAA==
X-Gm-Message-State: AFqh2korj4X0rJvnsSPc+M7tAPcwdM59VOoPsHpuqB8YWorVyOmIyvIa
	iopEIpE5uluK4rtmHK/AOdmS3BpKxZ7UkwTb
X-Google-Smtp-Source: AMrXdXtoqgcBzdstE67KadbN3CRdEjqi5W9As552l9zm2MyTWd/vdZxyd75Nn9WuPGuzJqP/T5jULA==
X-Received: by 2002:a05:600c:3d91:b0:3d9:103d:9078 with SMTP id bi17-20020a05600c3d9100b003d9103d9078mr38050592wmb.22.1673006813057;
        Fri, 06 Jan 2023 04:06:53 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:49cf:c46d:e32d:e951? ([2001:8b0:aba:5f3c:49cf:c46d:e32d:e951])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c4f5200b003c71358a42dsm8019217wmq.18.2023.01.06.04.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 04:06:52 -0800 (PST)
Message-ID: <08ea029850c0dd7d0a2577c1721e0ef516aadbb3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes: decode output data to text
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 06 Jan 2023 12:06:52 +0000
In-Reply-To: <20221222103829.55230-1-pzalewski@thegoodpenguin.co.uk>
References: <20221222103829.55230-1-pzalewski@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 12:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175579

On Thu, 2022-12-22 at 10:38 +0000, Pawel Zalewski wrote:
> The default return value from subprocess.check_output is an encoded byte.
> The applied fix will decode the value to a string.
>=20
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
>  meta/classes/fs-uuid.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
> index 9b53dfba7a..731ea575bd 100644
> --- a/meta/classes/fs-uuid.bbclass
> +++ b/meta/classes/fs-uuid.bbclass
> @@ -4,7 +4,7 @@
>  def get_rootfs_uuid(d):
>      import subprocess
>      rootfs =3D d.getVar('ROOTFS')
> -    output =3D subprocess.check_output(['tune2fs', '-l', rootfs])
> +    output =3D subprocess.check_output(['tune2fs', '-l', rootfs], text=
=3DTrue)
>      for line in output.split('\n'):
>          if line.startswith('Filesystem UUID:'):
>              uuid =3D line.split()[-1]


That looks reasonable, I just wonder how this has worked until now? Why
aren't we seeing errors due to this?

Does it mean we don't have some test coverage? or was there silent
breakage of some kind this fixes?

Cheers,

Richard

