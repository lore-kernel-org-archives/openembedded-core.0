Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3A9CCFA15
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 09:51:35 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.38985.1727344294658906424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 02:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ayxPNVjM;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f75b13c2a8so8569651fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 02:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727344293; x=1727949093; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DeWL48NRsaFlgVwS8FEbsp+iGjnaMWBQv7JYyZ6U/fw=;
        b=ayxPNVjM2g71ibLGq+4bNMqKMCVHPkk23vCoYGCRJQcaXk04uDRX8W9VYvxfTkKgtk
         mG16MaxRZ+oJ5fJeM3M9xzrhE2EONbcGkEhXRckPWuPN6a6KiqqFfDVdMumhk7V2VtjY
         3vBTZjwFjrDqrrayyM/kpNZhfaLhlFTSDNedKbRHKwK2Th6Xr6hrfT9wl4zdaRurION6
         WShRpXhz+35M9gJcHnDbQWh0QxKsBCGcUjM+P/4LtdSwldWWwF7ezUtTdMR3eU8IbRTW
         7jHO6n4Ba/qhX03O5sIbb/LR32UGCXeV7ful6nU3t21WJUEHqQ9f+EkvG34PujOZOK8r
         qJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727344293; x=1727949093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DeWL48NRsaFlgVwS8FEbsp+iGjnaMWBQv7JYyZ6U/fw=;
        b=Lf03hgeHmfBem5guNpldGV/xWpEzZnUPNKubRDtwjTFVfDYqQ/cYq7q/HKMaOfANIH
         tl0nLMoM/eCF2SG6NvviqA5U6BMnD52tirLySyJxyVlUms714JBt/iMp+gYozluhdwTY
         nqDK4CqNzyv+p8rv2akaqJoIlBXMigDSakBfoE2wfubrI4GCCFEP9sMsbQKYy/DUb+Ix
         Bb8YFGB9a70G5wkZKjaLZEVHHc/LHhfYPbtNloAIlxXMome1T/9c5ROTQ14wNHGN7Xqm
         6xzQLkl4c5aGWysTDhxrdAfGgov9RDi+A/UI+Uojak+DqQkEISroQysz0f08Tao+Eo6I
         RPDg==
X-Gm-Message-State: AOJu0YyMhByGMF1q+QWfu0jiAMCemdh+H4C+9jab+TONciQmfnhpcxnR
	Zrd+i5OB/RLDuN85ynonGklXV36Yc9ltjpW2A3sRW7Xn/bdFMBM3qfo9eMWxo0r+cO65iEGdZ45
	26eVucleT89dpGueRmUWBSy6mMMc=
X-Google-Smtp-Source: AGHT+IEUMr9LONY19tMlDEiyL3Er2jg5NpVJ11GFi1fARR8KA7zmRQFVm3CTIX+k78ENG8moN9Jm6AIQYUrRE0H/NsA=
X-Received: by 2002:a05:651c:1a0b:b0:2f7:4c9d:7a92 with SMTP id
 38308e7fff4ca-2f9ca50703emr6807981fa.43.1727344292617; Thu, 26 Sep 2024
 02:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240926091731.2008047-1-claus.stovgaard@gmail.com>
In-Reply-To: <20240926091731.2008047-1-claus.stovgaard@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Sep 2024 11:51:21 +0200
Message-ID: <CANNYZj-sjrT+a0aWfraw0OZDx-J5wTznYTnZwS9=hAPW_ZLoxQ@mail.gmail.com>
Subject: Re: [OE-core] [master][scarthgap][PATCH] lib/oe/package-manager:
 optimize install_complementary
To: claus.stovgaard@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 09:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204971

'optimize install_complementary' really doesn't match what the commit
contains, please be more specific.

Alex

On Thu, 26 Sept 2024 at 11:17, Claus Stovgaard via
lists.openembedded.org
<claus.stovgaard=gmail.com@lists.openembedded.org> wrote:
>
> We are rewriting the globs variable, so it can't be None, but rather a
> string. E.g. the lines above.
>
> if globs is None:
>     globs = self.d.getVar('IMAGE_INSTALL_COMPLEMENTARY')
>
> As globs is now a string, we need to test for empty string instead of
> compare with None.
>
> Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
> ---
>  meta/lib/oe/package_manager/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
> index d3b2317894..1d923c436e 100644
> --- a/meta/lib/oe/package_manager/__init__.py
> +++ b/meta/lib/oe/package_manager/__init__.py
> @@ -365,7 +365,7 @@ class PackageManager(object, metaclass=ABCMeta):
>                  for complementary_linguas in (self.d.getVar('IMAGE_LINGUAS_COMPLEMENTARY') or "").split():
>                      globs += (" " + complementary_linguas) % lang
>
> -        if globs is None:
> +        if not globs:
>              return
>
>          # we need to write the list of installed packages to a file because the
> --
> 2.45.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204970): https://lists.openembedded.org/g/openembedded-core/message/204970
> Mute This Topic: https://lists.openembedded.org/mt/108664320/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

