Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2339BD2B944
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 15:54:03 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.23242.1730822034936434202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 07:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EGZl0txj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so5593892e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 07:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730822033; x=1731426833; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPYV7LzXFKDoCrKZH+g44/oG9aYqK7WxFjcyRv82D4s=;
        b=EGZl0txjRwudyfnIYlRxH45fxEWRBhEj2W6htkRwJ0iGpX21Nl/X+wHYkTCJKNXN/B
         1x5X/QtlctWtT66Km8O5g5rC+Bv7bs0vVc5V1fGqZtwaVTOfjSikRzfUq/QFMlZN1EtH
         lWRi0FpKQAhVeVb7ObSlt8PV2ATcwMFSXD0eA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730822033; x=1731426833;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DPYV7LzXFKDoCrKZH+g44/oG9aYqK7WxFjcyRv82D4s=;
        b=VZrvsbPKmldoQKdtPamT389BtMKRriKJvflZgfJkSlrJKXMrMMaDxkdPtvJUvmycFI
         x4qdXb1Si2DIOZeI85Q6baXonOROGsL9lPaMjvCuy0NRbvM5PPVEMTqp8hqGEjI5PxSj
         YfUEpRQBdoYMsSXnTVF6Z18++5ATqDDH24+tjitnP0JD72/oLBt+4yBtC2qjqU/U73Y/
         o9UyJH7IyhozKAGTKUGv3RTUh3tfnsJluicZWQZa2+X62LrjTw18/NwyXoaq4ioBWCid
         ybas4dJO2XfoFUIHD3JiQxD0wnWEJ9gMFHWqAFoywESA9SA5PiRO0CKiCeBFByFQSCEz
         2fFw==
X-Forwarded-Encrypted: i=1; AJvYcCWk1R5Q0QqMjdJs6EuxaNffiSz7X/fN95X3c6/5GtmQFqrxUUuWtK0vuJPoyr32Fy94BgB67rNPkal60f0UDzDfxw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyY+iZFCFeJUEQvKuIW+0NqJ3mguwbtRyYHpG6TVvUF3CofUgKh
	cU9AEg80eZXFftzAEjpxyaCQtz7MRhlsSlv5I5pb6SGDzFHFi8cQp91+phF3Ai8=
X-Google-Smtp-Source: AGHT+IEdCJxO5Nm2RCKsPpuPDo21N8b5rwh1NR8HycdIcy+BuhvedprieV4Fn9ueY+ut+ACX+5k69g==
X-Received: by 2002:a05:6512:2354:b0:539:e232:e436 with SMTP id 2adb3069b0e04-53b7ecdf8camr14011453e87.24.1730822032780;
        Tue, 05 Nov 2024 07:53:52 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7614:7622:3cf4:a240? ([2001:8b0:aba:5f3c:7614:7622:3cf4:a240])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce430sm2171698e87.131.2024.11.05.07.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 07:53:52 -0800 (PST)
Message-ID: <553b223a0d437044e587b0ddaf0519803ff57f2f.camel@linuxfoundation.org>
Subject: Re: [OE-core] wic builds an empty rootfs on second image build with
 rm_work enabled
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Tue, 05 Nov 2024 15:53:49 +0000
In-Reply-To: <Zyjj-0oflBsZfj1C@nuoska>
References: <Zyjj-0oflBsZfj1C@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 15:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206717

On Mon, 2024-11-04 at 17:10 +0200, Mikko Rapeli via lists.openembedded.org =
wrote:
> Hi,
>=20
> After image build completes, rootfs directory is wiped by rm_work_rootfs.
>=20
> If the image recipe is built again without clean, for example when
> TESTIMAGE_AUTO is enabled to run tests, then rootfs task will not
> run and thus wic uses an empty rootfs directory to populate the rootfs wh=
ich
> of course then fails at runtime.
>=20
> How to fix this?
>=20
> I know RP doesn't like rm_work, but I really need it. I can't leave all
> builds laying around and bitbake IPC setup fails if a lot of IO is wiping
> build/tpm's while recipe parsing is happening (the famous 30 second timeo=
ut).
>=20
> wic image related tasks could possible depend on do_rootfs instead of
> do_image_complete but seems to break the whole do_image_complete design.
>=20
> Should rm_work_rootfs be moved from after do_image_complete to after do_i=
mage_wic
> if wic images are used?
>=20
> Or should users just remember to "bitbake -c clean image && bitbake image=
" if things
> fail?
>=20
> There are some other issues with testimage.bbclass and leaking cooker pro=
cesses
> which confused me for a long time but I'll try to send patches for those.

Does changing:

image_types_wic.bbclass:
        bb.build.addtask('do_image_wic', 'do_image_complete', None, d)
to
        bb.build.addtask('do_image_wic', 'do_image_complete', 'do_rootfs', =
d)

help?

Cheers,

Richard

