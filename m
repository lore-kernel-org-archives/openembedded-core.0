Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EA4E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 11:03:18 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.7806.1733828593579865803
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 03:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=btjm6onU;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6e5ee6ac7so16088785a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 03:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733828592; x=1734433392; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JrL9JA/mo1Jk+fEHKF+rwIKCqUxqiw9PsHdTHvXFhKo=;
        b=btjm6onUKRB7e4PKU5K8iAfOIeYYhNNqt70zuJp8I/ORKBuZEkKQeiS9OnxMgX7wZ1
         xoRHP8sFRsDAfcn9vpKoU8CsoMjdAiCUU++7pySgSAJp9975XpJLFXaw/qJ00ANPuLoC
         qjdRxVXwrGm2XoYe5BBpTIUlM+46gMFYrm73pdEmdADuS2Njg4jNFEBWtkHTl1xJOVyA
         rbF/BSe+A5zEC4VEpAbKoaC6Mw56TwYOgeOsXvs0ulWi0BenoJ9Xfh7+bQE0Ed+F04rQ
         pp3wSC6IX5U7+FPpI27pHgJ0qEpp/Z7vPyoVFpahzVircuuX7KuhdL0iOIm8mSrv5oRs
         IGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733828592; x=1734433392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrL9JA/mo1Jk+fEHKF+rwIKCqUxqiw9PsHdTHvXFhKo=;
        b=QPtXRNSp22t9sH03eZbCE2UIiwaoCB8A1A0wQ8z0T7UuOiyQ8NTLFIizgGVHn8E64C
         VbE9skbseOP9KJkaSjqURmxX225kd2tBQK9LBycE+rJGZ5HMncmRnkK/kSAGXXdrb0in
         jzxDlWvI3Yi5q52FWhEUch28CQM8jMwZYyBk9+hdb8EYtQ+hb4smSQ8wR4z1vQODCBGW
         UP9mfxxo37goiollurJy5WPUy/l/0vBz/UIzUDVaYCMfkgAgqv1y5PuAoZgiayNHVeji
         Wh7aVzjoCLpNuwgWz8PkcA61eNPwreOW7uIfsBFGiwWOYz4yhNCOM3QelvGi1OL1Cxoj
         5Omg==
X-Gm-Message-State: AOJu0YwKC9R7Bn3zrpDzbDfcIVzT1gue/FwvDcF7PmHhU5J7den6JIzr
	qSkvM0+EJNCEjlGlcIANoGpMyXsJVXKwiDmHyu51TZjY67w6vZd17E76VQ3nN0JeRAHVpNznQWy
	jgGGk0tman8QyedqfQP9r2IC70m4=
X-Gm-Gg: ASbGncvwgqajccKnMWRg6ew+7quWb2dYA74svF7G4LWukUfNzEvtrTSU56lvMpjkfd3
	B1exneO0+Z9iVUhl+jFCRozdvajUBKCTe39pfd3kUgg9sQHhIfJVHhagu9x87Y4JJVlkdNA==
X-Google-Smtp-Source: AGHT+IHnlyd3LnVSKUBkeNUrSPoGrBaYT4eT/ekVVVVm2DMqtId9Duzrp/81L+e9K03BFi0NZM25YwPr64juVL97TTI=
X-Received: by 2002:a05:620a:6505:b0:7b6:dc1f:b994 with SMTP id
 af79cd13be357-7b6dce8d4eamr621424385a.46.1733828592585; Tue, 10 Dec 2024
 03:03:12 -0800 (PST)
MIME-Version: 1.0
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com> <1733788612-20933-18-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1733788612-20933-18-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Dec 2024 12:03:00 +0100
Message-ID: <CANNYZj_dQvfWW81+VBm2fx4riugZ8F6ZACKD1YA505w5=rZTjw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 18/20] systemd-boot: upgrade 256.8 -> 256.9
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org, 
	Wang Mingyu <wangmy@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 11:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208522

This needs to include systemd recipe as well, otherwise its PV will
not match SRCREV in systemd.inc.

Alex

On Tue, 10 Dec 2024 at 00:57, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@cn.fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...ystemd-boot-native_256.8.bb => systemd-boot-native_256.9.bb} | 0
>  .../systemd/{systemd-boot_256.8.bb => systemd-boot_256.9.bb}    | 0
>  meta/recipes-core/systemd/systemd.inc                           | 2 +-
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/systemd/{systemd-boot-native_256.8.bb => systemd-boot-native_256.9.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd-boot_256.8.bb => systemd-boot_256.9.bb} (100%)
>
> diff --git a/meta/recipes-core/systemd/systemd-boot-native_256.8.bb b/meta/recipes-core/systemd/systemd-boot-native_256.9.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot-native_256.8.bb
> rename to meta/recipes-core/systemd/systemd-boot-native_256.9.bb
> diff --git a/meta/recipes-core/systemd/systemd-boot_256.8.bb b/meta/recipes-core/systemd/systemd-boot_256.9.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot_256.8.bb
> rename to meta/recipes-core/systemd/systemd-boot_256.9.bb
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> index 989ca667b7..b85d5b187d 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>                      file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>
> -SRCREV = "a2240d1cf9f3515728186c2c98a6f4b64a40e4da"
> +SRCREV = "f15fd96efd5ebdfb18746acb0cbb35a4331b4d8b"
>  SRCBRANCH = "v256-stable"
>  SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208513): https://lists.openembedded.org/g/openembedded-core/message/208513
> Mute This Topic: https://lists.openembedded.org/mt/110017090/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

