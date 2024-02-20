Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20430C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 19:59:28 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.23105.1708459166987790362
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 11:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CybPQWtc;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d109e7bed2so77473361fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 11:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708459165; x=1709063965; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0cQhKOwgDhbXJBY98h6qARBYS3RrFx6wJYqNH4wpu88=;
        b=CybPQWtcP9TQO2t4ptsCV62tVKk0EGBCzdVwe1E9iGPC55tYCQKm2i+PhfXg5twFzT
         BjSWC+jA8qWd9J8o9QNibNeZJVK2ALWfj25xnOFqgutUSIpTZYLusjBGM1lR4VgbfTwc
         UTXfMMFvUtJgiOZDzsKYpv8eltqALDrIeNHNzOaSroBGaIUyjDcFaKGdu/1L5hXxVlRd
         NC8rCC4BvG+PMU4NZyv8zHeWWWYhI8JE6/O+rfWzMQ9lQW7A03Oo43gDIoZ790aZ8ltr
         71prkqSMHkUPC1DIHG3jj3e7iIVadJSiNKJ+lhzJvLfPqehzgtYF9AHmKlfshBt0uj4u
         sYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708459165; x=1709063965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cQhKOwgDhbXJBY98h6qARBYS3RrFx6wJYqNH4wpu88=;
        b=ZneIbV3mLY7lRlTOLSmVmM3aUP12JmqSxl/pTiH5yPVYN6fsyc423AbvUBCT3MDm9W
         fP44LBt91cTakMdA58Hq17ph8GGGozfVttnlEoVx4JgkkKef2oY4kGf9EKOLv5+j7gQI
         drKN6VVzjfUl9B6gzIte5dbQcovGSj1jEHtAeafpPGcnNFpPLn8LmRbhwAPjIbZbF2Xg
         o7OIAt+eCOQyu2+iw4ZhYBO138nT8r+uz0CREvIs6hPLmRFqSA/oJeTitui2JudEzd4a
         FOZBM13w68QDlf6CtB4ECMx3v016FaD1aF50bDh5Xy5ukpIRIpyo3e93HNIiP5O359la
         4+Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUVMQOo84WMXrF+K0xFRJl+U+PxkbyggCrt1vcAMg13FC42AYqnxXeJMuT5CwBAuffZVNRS+IGrfW3sjerVD6NUtSLjF8Q851ln51lhELC+Mz72CpxZ2kVa
X-Gm-Message-State: AOJu0Yw1hOcx8xHHdTx5CWM4V4adHXunaXH1RGITrH1qwNJeelZEqNpl
	DVOl5luo/RCrAPpqJK5jpVmq+pfSoIcfhKm/xYMjyFchqC/SEIcaSR7VSxzsLSo0joeq18riHUH
	AVDU+4sUCWzpy70vZeQ9Y0kg/y3iP7U8S
X-Google-Smtp-Source: AGHT+IHicW5C+TmucliBlCgx2tDwymA9S79MHfMA5WW/WmHErkSM+v4orFbCgQlN1J5lFpL/5g1QtV66duK4wzmzR/Y=
X-Received: by 2002:a05:651c:104c:b0:2d2:2cff:fc49 with SMTP id
 x12-20020a05651c104c00b002d22cfffc49mr5919958ljm.18.1708459164910; Tue, 20
 Feb 2024 11:59:24 -0800 (PST)
MIME-Version: 1.0
References: <PsPw.1708432537487658267.ZIry@lists.openembedded.org> <17B59473B9744748.436@lists.openembedded.org>
In-Reply-To: <17B59473B9744748.436@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 Feb 2024 20:59:13 +0100
Message-ID: <CANNYZj_xuMw0h1H5qEm=63xGrGcXtmGTOkV7FuTZXjCMLnTQPw@mail.gmail.com>
Subject: Re: [OE-core] Dbus EXTRA_OECONF
To: alex.kanavin@gmail.com
Cc: Steffen Olsen <steffen.olsen@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 19:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195924

On Tue, 20 Feb 2024 at 14:14, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:

> As far as I understand it's only those embedded tests that are
> problematic, and other kinds of tests (e.g. modular tests) don't
> affect how the library is built. So perhaps you can make a patch that
> passes in (or removes) the respective autoconf options, so that the
> above conditions no longer are true?

I have now sent this patch.

Alex

