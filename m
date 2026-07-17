Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A04C4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 14:37:36 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15135.1784299053596916177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 07:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DMXoIbSc;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493f25d47dcso29278885e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784299052; x=1784903852; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gntGFLtNjvkJUPjx05kFSHddfK5ZNmbu6ezibqWpjYM=;
        b=DMXoIbSc08f4murN9HHWh1fRYbZ9SryqjsxXaft1BjzSaxV6VpVOzDfOI3RCAuLgJQ
         +Wi0jG1gPj43wl5tYUEc+ywZeWrVqw1Ms0VUpzZPls7J72pXlugC92oAk+VKwOh+UBm9
         IZYNFy9J/7XoWyo/XloqrblWQVrBkniDGkZ+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299052; x=1784903852;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gntGFLtNjvkJUPjx05kFSHddfK5ZNmbu6ezibqWpjYM=;
        b=Bp616J0WphgOhKW2MvGz95295wLwS1z4OfS7n0FN6Ov1+z1itD7bQ8jH4Wy4PFqYHM
         Nj+v6y3gpFzuCACB36vT55Rc7+Xaph0VP1YhKKvl0mgCKROp4NPj2KN7QH23b3Zm2dwv
         CjIC8LMIs17NuWDb6aHtFA7ZSxlcPf7o+pIeMvk6C7n4+sCC0Q4I4q/KPf1/jYlW1Dh8
         nNIgSrQ4Ptb70CZIgmCHURcdejP5jdXeL2ZGPKlVaRgQcdpwulz4QNcypdv7ragFnrdZ
         svia1mqDe396lXqcchviZ1CRisea+PiYYb8I36Sfud1hMrojcORrn2c6xhahxC5bP+qm
         b0xA==
X-Forwarded-Encrypted: i=1; AHgh+Rpdvsv1NIdgAY5h8px7Qx/cWC9dCp/V/lqTYIwviZyTaHog7+iOchZB5pMSLwHHh8dXAW2DdnSmJYKEMBaT5Qkrug==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxHdlsg038WbD+Z/91xzUwjlbi46jxUh9K6NWWn2lu55Pbju415
	hAU9mD+R259ggtbPfvlYfJ88fvaDMp4ElXw4DQB8ypIDZwOnwnaoKbwwxtYI090ghmc=
X-Gm-Gg: AfdE7clrFbvF4L9Hk0+eo/ZQpKsivaNw2TFlSM0GPbCCEb46cUqVMv8nHQ7KOTEaftR
	i9MHCyyRvGGpYtN0R2MXhAsG9xRQ14bfgKfkiQgkmvWen640hf2yVqp0Wlo8SjynK5fkwAHnb04
	+p5O5UsT/ja0E72hF/e91GKVVv9pj3PwezxhqojTfdd6D0OGGdt4MUO42yMsq23rDBpzpSw7vNx
	xkI4KL+RwUbQ7JJsBjCVFs9lNir/3D9qHlWLwksckV2S5U5cy4LQpZqZyT6jrWK/U5jeBQ+/uZB
	JIAtrhnaPcC1+5tOmZD5SEUp6HCM0srq5KZAXV7MEO15QDItSJ982Pg2ZGvn+6zY0SthVP+IYZr
	dXTMkp7hWjIJL8nm6Pzfn5ufJqeubRnjJjVZMOdaqi6vzgwnvQd4bzFnUjql2LrLtmW4Imdb8Ol
	+2myOeQ/qRNncz8iUiZo4QUAv8cs9cRQsvnHWE9v2W+gp1CdsNIZv9gp5g17OdQs+gYUBPJmach
	5OPuA==
X-Received: by 2002:a05:600c:3153:b0:493:e97c:216e with SMTP id 5b1f17b1804b1-4954a41382fmr40816395e9.39.1784299051646;
        Fri, 17 Jul 2026 07:37:31 -0700 (PDT)
Received: from localhost (2a01cb001331aa0093f4151e9fe9f4b8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:93f4:151e:9fe9:f4b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b074csm54766455e9.6.2026.07.17.07.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 07:37:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 16:37:30 +0200
Message-Id: <DK0X83RP88XU.1TF6MFXVOZMYZ@smile.fr>
To: <sudumbha@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 2/2] gnutls: Fix CVE-2026-42009
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260710095422.3042774-1-sudumbha@cisco.com>
In-Reply-To: <20260710095422.3042774-1-sudumbha@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241201

On Fri Jul 10, 2026 at 11:54 AM CEST, Sudhir Dumbhare via lists.openembedde=
d.org wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>
>
> This patch applies the upstream fix [1] and [2], as referenced in [3],
> to address a DTLS packet reordering flaw where duplicate sequence numbers
> could lead to unstable ordering or undefined behavior.
>
> [1] https://gitlab.com/gnutls/gnutls/-/commit/f01e21441e29052a6f096384079=
4c41d3b3ee66d
> [2] https://gitlab.com/gnutls/gnutls/-/commit/f341441fad91142897d83b44a17=
5ffc8f925b76f
> [3] https://security-tracker.debian.org/tracker/CVE-2026-42009
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2026-42009
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>

Hello,

I guess a recent gnutls patch broke this series:
ERROR: gnutls-3.8.12-r0 do_patch: Applying patch '.../wrynose/bitbake-build=
s/poky-wrynose/layers/openembedded-core/meta/recipes-support/gnutls/gnutls/=
CVE-2026-42009_p1.patch' on target directory '.../wrynose/bitbake-builds/po=
ky-wrynose/build/tmp/work/x86-64-v3-poky-linux/gnutls/3.8.12/sources/gnutls=
-3.8.12'
CmdError('quilt --quiltrc .../wrynose/bitbake-builds/poky-wrynose/build/tmp=
/work/x86-64-v3-poky-linux/gnutls/3.8.12/recipe-sysroot-native/etc/quiltrc =
push', 0, 'stdout: Applying patch CVE-2026-42009_p1.patch
patching file lib/buffers.c
Hunk #1 FAILED at 968.
1 out of 1 hunk FAILED -- rejects in file lib/buffers.c
Patch CVE-2026-42009_p1.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: .../wrynose/bitbake-builds/poky-wrynos=
e/build/tmp/work/x86-64-v3-poky-linux/gnutls/3.8.12/temp/log.do_patch.25292=
06
ERROR: Task (.../wrynose/bitbake-builds/poky-wrynose/layers/openembedded-co=
re/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_patch) failed with exit =
code '1'

Can you rebase on the recently merged wrynose and resend?

Thanks!
--=20
Yoann Congal
Smile ECS


