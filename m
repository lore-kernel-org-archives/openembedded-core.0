Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF20BC77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:39:08 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.44831.1684312742422234482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=CxUFcGut;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ac7462d9f1so3922781fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684312740; x=1686904740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nqtPBFFn0mKF66EptIXAq/wfRXhFVauKiNhY/cvAwXs=;
        b=CxUFcGut5GrLUgwIrFm4kEQ9HqAHXI5ti1hpziO7PNQiIF2ppni5Re7Z8Zdl9x/Jnq
         zpTB96qVPyscRY3AGY4n8m4mTottRjaaM1NXLzXmhK1MM6PmdJz5x2glqBSfxq0zLZ8w
         YaeZc0k1Jzb9mkA8W+Ja0TpF2r4XConvyw+DCq0qn1pRJAUbvmC5f/IX6uuywkG7VNS8
         ATKIMepWVawK7fLuEm9+DQnQdlq3THSVLh/l1HRQQfX1wJWzybeorWgqZ7hhJ+7Ac37X
         EUxRjKjmZlMi1rjjvHHyjget6q6DXyWBlbDuJh3UUkAydrDc8CQ1n6QZL2m3cOGXPEA/
         cG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684312740; x=1686904740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqtPBFFn0mKF66EptIXAq/wfRXhFVauKiNhY/cvAwXs=;
        b=WTW4MCzqQCf9W6YGbNK0W6Tkq5wHEuXfwLDs+uMZTKJqIxUkSAq5v/Sla0MP42uy1/
         XC6nvbDY2nqXmb44TSlIKYrLU6cHa4uWka6rsYv34BXbUvBGZv1a+8oouf1uDo7HDs1l
         mL2rpjQl7jwsdKQMrnIDFEVALmTKOAKmZW7eNlEtBur6twnl0pOzNh93vkZutpVA4udW
         z1SK+Pg+qEQXeEsakqKts/tuwyNgfN5AScxlsyxlF4O4RIvMJkNppZm29rNNtCUKwUXS
         z+Jgh3hfuJ9ZNdAgTvF4I77ubPceOzegKYAcZn3ggMcm49ze9B2VMZzPHMif/rcx8FxZ
         LGnA==
X-Gm-Message-State: AC+VfDz4hhbrN/4jxQdY/3MjSowbRWIfgfCJErD2ZeK3smuhASsHlccu
	3TD/C1vo1jeWXArvWdLRxCoJ5e3js5jC0BN7GzU=
X-Google-Smtp-Source: ACHHUZ6MR3ix1EWDy8Im28hoCS+gCok3yxZ2M6SC/FHjqWVS12/l+i4evfUG5qzUhMgRlKJfz2T36NBwcCNyHXOCOss=
X-Received: by 2002:ac2:55a1:0:b0:4f3:7ad1:29f3 with SMTP id
 y1-20020ac255a1000000b004f37ad129f3mr2737lfg.21.1684312740366; Wed, 17 May
 2023 01:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230517080639.9336-1-brgl@bgdev.pl>
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 May 2023 10:38:48 +0200
Message-ID: <CANNYZj94a42E=_X-JkZqHHBO7c4TOWKmgp_MrLxhuLUzkdYK1w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 00/20] python3: fix run-time dependencies
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181479

Thanks for this work. Perhaps we could catch this easier if there are
runtime tests for those items, maybe in the shape of ptest.

Sometimes recipes have no longer needed dependencies too, and trimming
those down is harder, but also appreciated.

Alex

On Wed, 17 May 2023 at 10:06, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> I noticed that every now and then I import some python package into an
> image only to find out the recipe didn't pull in all required run-time
> dependencies. I would fix it whenever I noticed it but figured that I
> could right a script that would go over all python packages, build a
> minimal image and see that all its modules can be imported.
>
> The patches in this series are the result of that. Most simply add
> missing RDEPENDS, some are additional tweaks to recipes and the last
> three add new standard library packages to the manifest. These are the
> ones for which simply adding python3-misc would still be insufficient in
> terms of run-time dependencies.
>
> I plan to do the same for meta-python but this will take more time and I
> need to think of some automated way of updating the recipes first.
>
> Bartosz Golaszewski (20):
>   python3-async: add missing run-time dependencies
>   python3-attrs: unify RDEPENDS
>   python3-attrs: don't use PYTHON_PN
>   python3-attrs: add missing run-time dependencies
>   python3-certifi: add missing run-time dependencies
>   python3-libfdt: new package
>   python3-dtschema: add missing run-time dependencies
>   python3-hypothesis: fix run-time dependencies
>   python3-tomli: add missing run-time dependencies
>   python3-pathspec: add missing run-time dependencies
>   python3-installer: add missing run-time dependencies
>   python3-sphinx-rtd-theme: add missing run-time dependencies
>   python3-setuptools-rust: fix RDEPENDS and allow target build
>   python3-pyproject-hooks: add missing run-time dependencies
>   python3-pycryptodome: don't use PYTHON_PN
>   python3-pycryptodome: add missing run-time dependencies
>   python3-pygobject: add missing run-time dependencies
>   python3-manifest: cgitb: new package
>   python3-manifest: zipapp: new package
>   python3-manifest: turtle: new package
>
>  meta/recipes-devtools/python/python-async.inc |  5 ++-
>  .../python/python-pycryptodome.inc            |  8 ++--
>  .../python/python3-attrs_23.1.0.bb            | 15 +++----
>  .../python/python3-certifi_2022.12.7.bb       |  2 +
>  .../python/python3-dtschema_2023.4.bb         |  7 +++-
>  .../python/python3-hypothesis_6.71.0.bb       |  2 +-
>  .../python/python3-installer_0.7.0.bb         |  6 +++
>  .../python/python3-libfdt_1.7.0.post1.bb      | 20 +++++++++
>  .../python/python3-pathspec_0.11.1.bb         |  2 +
>  .../python/python3-pygobject_3.44.1.bb        |  5 ++-
>  .../python/python3-pyproject-hooks_1.0.0.bb   |  5 ++-
>  .../python/python3-setuptools-rust_1.5.2.bb   | 17 ++++----
>  .../python/python3-sphinx-rtd-theme_1.2.0.bb  |  5 ++-
>  .../python/python3-tomli_2.0.1.bb             |  5 +++
>  .../python/python3/python3-manifest.json      | 42 +++++++++++++++++++
>  15 files changed, 121 insertions(+), 25 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb
>
> --
> 2.39.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181449): https://lists.openembedded.org/g/openembedded-core/message/181449
> Mute This Topic: https://lists.openembedded.org/mt/98943996/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

