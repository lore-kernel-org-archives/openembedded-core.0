Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA4AC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:55:02 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.10173.1672833295409090110
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:54:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wq2XoDON;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id i19so22247656ljg.8
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMvSo+2IyBV2fXcY5ckRSg7Hebf9+3sljYAkjuQ6FYw=;
        b=Wq2XoDON742HXjj4WmfMP6FbX868EZTIesR2YhDl78TzPpy2xZbRT1xHXvp3HI/rJB
         tFzPFS5bngSiIDldQzrkZR9iT1mmRCwFFQKkYn87M5xPt7sqKjY/8j0hG4qnKw9Yj8cJ
         huA7nPN8ISkTrDLGgyhuVhNMvgYFkIu779hKiift4NBYIXCWyGqoXWXLm/GX/yHYs2Zv
         MQeUkP08c5DqBETP8U8KdXazAcnqW7FY9L1zx9jEvPcmUxEE0doNgF5YJ9CFRLu+21hu
         7s2BYDliPocpXYZczww8M0y8dCoTF5tZGzH5hStTGZU3dFbSZije2+UxjdQ5tLyMjAHC
         mY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMvSo+2IyBV2fXcY5ckRSg7Hebf9+3sljYAkjuQ6FYw=;
        b=YswJt6fe9NZBIvH3/AIxVqfHovmcinll9+etDX/XewoYOKNz6N7QVBEG54pCT52ZOI
         uOmNzhWQmaAu5QNokEHWWWTR9aV81AOfWukRIjID9X/kSgg0ZXQkvvc8eVuv7j0zjmUt
         w+SzAnmULTDqW66oN7tWWWWifLRRTDantmkidr9K8yWmMMYnCJnFLdypTWEwYJxFpEtQ
         83rJbLQnYAcqiOa2t9illUcoYf/GOa9vEXsa2A1LVxFdey8zj629yIZ3xBnUvtTKf/RB
         iTr40VgncLSHbDADoSSyPDiObWKE3EkuylTpTzt9WlgR0djU2gvX9PbX5g3ziRULrhLw
         5MyQ==
X-Gm-Message-State: AFqh2ko47oGbQqm5VHvc9/C5PFxN4b73HnHD956DoaoQMK+jmW+PBZkV
	/QXEUM6vz1peCDRPVqixpvCB/O2gvkYlHHfEadQ=
X-Google-Smtp-Source: AMrXdXu30vtwCNy9JSn9pBjnk2Zw3Tgoc7LT6DhoruQ6SQpF8QJudefFu5NmR5sDGyN4yv/y/aFuub7nLcgSgaLj0Fg=
X-Received: by 2002:a2e:a813:0:b0:277:8759:bf65 with SMTP id
 l19-20020a2ea813000000b002778759bf65mr2072943ljq.108.1672833293416; Wed, 04
 Jan 2023 03:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20230104114555.575278-1-kubiznak@2n.com>
In-Reply-To: <20230104114555.575278-1-kubiznak@2n.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Jan 2023 12:54:41 +0100
Message-ID: <CANNYZj921f6LqBp4YwJxgg-zy2JdTuJkvwESCAix5hmqN=sSxw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DATA_ENABLED
To: =?UTF-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:55:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175467

On Wed, 4 Jan 2023 at 12:46, Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com> wrot=
e:
> When GI_DATA_ENABLED is 'False' (e.g. because
> 'gobject-introspection-data' is not in DISTRO_FEATURES),
> gobject-introspection should not be added to DEPENDS.

Why?

Alex

