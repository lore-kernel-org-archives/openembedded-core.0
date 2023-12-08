Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA7CC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:21:32 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.17272.1702030887237261689
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 02:21:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KoNMFvpw;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c9f9db9567so21113771fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702030885; x=1702635685; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RCGHDFk+o4ahPrru/vN+5ehsD/vnbygw2/R5jE0INiY=;
        b=KoNMFvpwyv0r1aqtBHVrt3k+8kJdsk9XLTlVK3BptMKIBFBAOfTOCKBEDbv8445rPh
         6im8Upm459PWVuuUp1gBx55YBV860TUeVAIpVHH3ChzGeRl+saOzHN25uOcOfT870oZu
         FBGvZ7UiMKxXMRh2xfSAjcTwDeJAHoX5/p7yezb1c6QMX3Sb40h3TLYtAtkrhLwBSigK
         7LgJIpEY0n6we9OWWoge1FpJX+4ALbfObrvgONCOrgpJ3tjhBZLsJ17KiMUTtheGVwNA
         mfDJYnCqhkgOsixHDOtcBV80Ek3xHquIW+9IGJhFs6c4MBiqLlais0B6ylwjKKtryztR
         zFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030885; x=1702635685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCGHDFk+o4ahPrru/vN+5ehsD/vnbygw2/R5jE0INiY=;
        b=b7E6y2+6ISIA+9/MN9vlpW7eeA5iqzly635qwOjFonEJE0tsgIoDw2Le0OxLzY5sZ8
         otAizv+eT5MXaj1vBcaki/gsiSYf+qxuQAG56x5zFk+jJTvvmcMybGXyJI+x58rd+J+E
         MJKXYTaBWg8ItrdpxH8efx5aI//9A+r+gWgBVdar/WgK2+3m9dY2Yt7T+GDZ4X8h9On9
         1pTCHBLty6v5Cu+/YG/Q0vWHIRi25lR3vuHxfTUz/adJncdeNgfOZ1ptRZUkF0N47FEv
         VBLsqkA16sT/NsrkSS/02atPA19Kn6Saq6TAkDfnE+EEv3fpRETSQDe60g2xWlGK8iXl
         BB9A==
X-Gm-Message-State: AOJu0YwdCmoUqPbGDx8EeDubdi7zqjX+NWxL+FX0SIejqNq0CB1qc2W0
	HsnH87DrovAFygkYp8hQgAOFuR9VROV+cN7IOOQ=
X-Google-Smtp-Source: AGHT+IGjYxZ/Q4Uq7lW9oHjFR3xZruJeuzKpuSrw3OylagDFwqoFX36XZ9ng6zqhiWFoCZgqrIjtFDnYzJ+rhdEI5hs=
X-Received: by 2002:a05:651c:19a2:b0:2ca:34cd:77e4 with SMTP id
 bx34-20020a05651c19a200b002ca34cd77e4mr1264722ljb.103.1702030884940; Fri, 08
 Dec 2023 02:21:24 -0800 (PST)
MIME-Version: 1.0
References: <20231208101253.4042712-1-changqing.li@windriver.com> <20231208101253.4042712-3-changqing.li@windriver.com>
In-Reply-To: <20231208101253.4042712-3-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Dec 2023 11:21:13 +0100
Message-ID: <CANNYZj-OuHemaODiLGi+KpUyGCwGF1GvyEjzekRxYjUEOJOzRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rpm: workaround to remove dnf lock file
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192034

On Fri, 8 Dec 2023 at 11:13, Changqing Li
<changqing.li@eng.windriver.com> wrote:
> dnf has a bug, refer [1], it cause that log_lock.pid may not removed
> after dnf exit. And for native dnf, since we change the lock file path
> to /, it will never be removed, and make the rootfs not clean,refer
> [2][3].  This patch is a workaround to fix above issue.

> @@ -420,3 +422,7 @@ class RpmPM(PackageManager):
>          os.chdir(current_dir)
>
>          return tmp_dir
> +
> +    def _remove_dnf_lock_file(self):
> +       if os.path.exists(self.rootfs_dir + "/log_lock.pid")
> +            os.remove(self.rootfs_dir + "/log_lock.pid")

Both the description and the code in the patch seem to imply that
sometimes dnf leaves the lock file behind and sometimes it does not.
If that is the case, we need to dig deeper into the reasons why.

If that is not the case, please change the removal to be deterministic
(remove the existence check), so that it produces an error if the lock
file is not actually left behind by dnf. That way we'll also know when
upstream resolved the issue, if ever.

Alex

