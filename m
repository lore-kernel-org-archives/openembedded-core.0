Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CCBE77183
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 07:35:13 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.100763.1734507311271302417
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 23:35:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GiSg1Uiu;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6d8edad9932so47697876d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 23:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734507310; x=1735112110; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R+Yh+/1iu9ULYqhl1t3CPhPDqHDlH8Y3dtCWlnnfWTs=;
        b=GiSg1UiuiD71mRT+86C7FerxLkpVRTTFuXdQgUHU0Z0LYzvwYGBIF6W9DN5xCUzycQ
         t+anEqsu2H0/GTCWPnHE7I7U8oQepcPHDCvZoqZMqBfYANqZH+PAsJf/3d6i/zkcOWTy
         /7lGKngw1NBXTR+2yvxLcj6ZzI8jMKhyWQJHITb9I86KiGTSpEpY1GnwAh2s/SBwpKjC
         pJGaR2Zj906lQE2jeT+ig3CRXy4ulDvMzAgH4JZHFn8DBmZbn7/YN43vgrnqaSXaVOQ6
         7Zw1kWPlqSc7OKXV7ncmHqJ4iZSRY8Uo+D9DgpeT4yCn2Kt35QLwtz1Rgt8C0e+SBHp7
         27mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734507310; x=1735112110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+Yh+/1iu9ULYqhl1t3CPhPDqHDlH8Y3dtCWlnnfWTs=;
        b=tlknc+6HVK9TAl/uIbIlMDSkSp0IuM9buxzBOF4FP7+c5SfJyAWUAWz9MKttJYO+yk
         Izh0GsHEJlhmpY0bVNrP9bZ//hLglX4PYBDjFOyiZU4RtNZjfauB2aBCSBKdckKAigkC
         XtHqAJThCcWYAZkNNZnDm0rHlsgMAMMy1lFqphPVZ9AJVnCGZWQG8ml8WwRznAh1b6za
         4ZfFrEMlfpdjM5FwVs8PecAHSgpWLH92eVAyuXKKxLpLEGCRo6WBKoNz/DirXWVkdaEp
         T6tYMercxjIa5F2/zDhDE6fGjzT1hcixJgm1ZsheOJgzHF3YHU61ZbikmnKiiSPqr+Ej
         eYPQ==
X-Gm-Message-State: AOJu0YxN7eUrVH2zZb4HsPto6FonaiSMdKz/mY59kaPc/MmqOp2dHoTH
	z/gmglwZY0uvsD9iRXymeiGptU00S7eOxm+D9J3ZIBkA7fX9j0InG4ax1C0nehCiTBvVTQ7u/yC
	W0OzsLHPN7hgb8aVYJKNX76iXV3o=
X-Gm-Gg: ASbGnctjAruVRRTHjsRFb2HZgpuZQSFtikmmb7R8ECSGKSJ5WaCKSIfSUBRdOGgtyZ8
	/YpfAHoSVxYavYK5hXYRAHmKrDfpZk9uFo9Mm49jj5yGyknw/2VJHWB1/lFnraxJGiWptUplx
X-Google-Smtp-Source: AGHT+IHfjB5t7WXQEM0P85hX5Jo3OOK5etO2wotL7TU9jejt9oN2rbQdQKPoyCEjUB3Fo82gc68/v+LOuUWXiU17Ryk=
X-Received: by 2002:ad4:5f8f:0:b0:6d4:2910:7f13 with SMTP id
 6a1803df08f44-6dd09239f79mr30960336d6.32.1734507310205; Tue, 17 Dec 2024
 23:35:10 -0800 (PST)
MIME-Version: 1.0
References: <20241217231202.3384873-1-derek@asterius.io>
In-Reply-To: <20241217231202.3384873-1-derek@asterius.io>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Dec 2024 08:34:59 +0100
Message-ID: <CANNYZj_bCGNrXZq=y+qGg9UUW8DTBdPFx29nrVSzLg1f2PC9cg@mail.gmail.com>
Subject: Re: [OE-core][PATCHv2 1/2] classes/ptest-python-pytest: add a new
 class to consolidate pytest ptest functionality
To: derek@asterius.io
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 07:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208868

On Wed, 18 Dec 2024 at 00:12, Derek Straka via lists.openembedded.org
<derek=asterius.io@lists.openembedded.org> wrote:
> +addtask install_ptest_python_pytest after do_install_ptest_base before do_package
> +
> +python () {
> +    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
> +        d.setVarFlag('do_install_ptest_python_pytest', 'fakeroot', '1')
> +        d.setVarFlag('do_install_ptest_python_pytest', 'umask', '022')
> +
> +    # Remove all '*ptest_python_pytest' tasks when ptest is not enabled
> +    if not(d.getVar('PTEST_ENABLED') == "1"):
> +        for i in ['do_install_ptest_python_pytest']:
> +            bb.build.deltask(i, d)
> +}

I know other ptest extension classes do this, but I really do not
think adding another task and copy-pasting special handling in
anonymous python is necessary. Just define do_install_ptest().

Alex

