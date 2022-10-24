Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB036C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 09:40:46 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.17513.1666604438880300276
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 02:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hlWAZ0y9;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id be13so15768896lfb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19ZlaiaCbnCqhEFslTglTK6p3xD5AIHUjC0nAMi8oSA=;
        b=hlWAZ0y9vD//oR+gBU2AvBgRHUXcAVW97u5tR4nMzbrCf5Hw9Xj82kVitS8xXDx5fo
         NfltybTXJZCM8jANxlw8IiOnsXpoty8YOS2x+/ftpWivRm0eOy2S5LzfmkTCvpr4EEQG
         IKfFWy0WxBnjEfqYuCg0rV9VBYUTmdwbOMqOKVdjODiICkGWKtrWUBODZ12CHtD+HmG0
         P4gJnWJnW1JH2cWnvnbMzH7hptUsEY3DBhAfsskEBpnJouvgPl7LPOmmqxofj1x5BFtU
         WYkxA0hYScNVrKGjQ4gOvHejuZTY8hWAY9D0Y7QomvTe4S0d6oQtHx/352AVrSa2ZPgU
         tNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19ZlaiaCbnCqhEFslTglTK6p3xD5AIHUjC0nAMi8oSA=;
        b=vKgkuqF4YfQSJeljuQIX2CoS3Lb8jnmZbQ8t5va+1carp8ThU0hooK62kkDLlioaS0
         UykZ/HW5sZUHqRjTid9Au5HwJpQZ4ee8XCTUsZgYKpYOi/R7SFEth6KnJTs7Au1D9U+A
         gNRXYZcC1jb2ebVaH9KqelkKZGzJMFKlEOetBQMVrpbQofNNBLzfrDIq6ym3RoZZePVD
         6Okgb+D0FIqIS7Er9mZ0kW71U98z+WVVk28fPXhJxa7SrFn9XkeSN2yvHMw7GPY8OZPq
         gPu5RQl7hQFq0QsmGoxXOl5UZQLgiI/iWUQmgJfK+yzq3/jPLgBxq4y3PsRD7J29Crp5
         E7bw==
X-Gm-Message-State: ACrzQf3h6EqbbGzEGoYYmRUCdz5YSk2yXRR3jZ2RJIa791oPffdmJ6S5
	b1pMVJzQbAOK7gKGww7PNKl+lgTmQzGfc55G840=
X-Google-Smtp-Source: AMsMyM79+2c0FQHFo7CV+QjVoRuKLOr3iDfxSp4fDyCom9fjKbO8z70pTHERUMrc+gTNz73rLVlZsK2aETGdWEBQ8pU=
X-Received: by 2002:a05:6512:4016:b0:4a4:6edb:8d6e with SMTP id
 br22-20020a056512401600b004a46edb8d6emr12268441lfb.393.1666604436995; Mon, 24
 Oct 2022 02:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9UMf4FRYzLCN9M+rW-mpL0-JRxROq4zpNd7ABJe5E+Dw@mail.gmail.com>
 <1878.1666601926722962715@lists.openembedded.org>
In-Reply-To: <1878.1666601926722962715@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Oct 2022 11:40:25 +0200
Message-ID: <CANNYZj-p9vce2nRGHjKJ0-VqGEaF0Ed2X-YMgFkfos4zJDiEWA@mail.gmail.com>
Subject: Re: [OE-core] license manifest files effectively disappear when
 do_rootfs is not rerun
To: christian.thiessen@airbus.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 09:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172082

If I run the same build again, no tasks will be executed, and
accordingly nothing in tmp/deploy will change:

alex@Zen2:/srv/work/alex/poky/build-64$ bitbake core-image-minimal
...
NOTE: Tasks Summary: Attempted 2862 tasks of which 2862 didn't need to
be rerun and all succeeded.

alex@Zen2:/srv/work/alex/poky/build-64$ ls -l
tmp/deploy/licenses/core-image-minimal-qemux86-64/
total 16
-rw-r--r-- 1 alex alex  256 Oct 24 11:33 image_license.manifest
-rw-r--r-- 1 alex alex 6451 Oct 24 11:32 license.manifest
-rw-r--r-- 1 alex alex  958 Oct 24 11:32 package.manifest


So something happens between builds on your side, and there should be
a reproducer for it.

Alex


On Mon, 24 Oct 2022 at 10:58, Christian Thie=C3=9Fen via
lists.openembedded.org
<christian.thiessen=3Dairbus.com@lists.openembedded.org> wrote:
>
> I'm not deleting anything.
> Steps to reproduce would be:
> Build just about any image for any machine, as long as it uses the standa=
rd classes like license_image.bbclass.
> You'll get a build/tmp/deploy/licenses/${IMAGE}-${MACHINE} symlink pointi=
ng to build/tmp/deploy/licenses/${IMAGE}-${MACHINE}-<datetime> containing a=
ll the expected manifests.
> Run the same build again. Bitbake will rerun do_populate_lic_deploy, but =
not do_rootfs.
> build/tmp/deploy/licenses/${IMAGE}-${MACHINE} now points to a new directo=
ry that contains only image_license.manifest.
>
> Christian
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172079): https://lists.openembedded.org/g/openembedde=
d-core/message/172079
> Mute This Topic: https://lists.openembedded.org/mt/94530086/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

