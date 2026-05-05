Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D33CD342F
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 08:19:00 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34486.1777969135311645955
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 01:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hqQjr6qo;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8b8e98fd885so17875296d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 01:18:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777969134; cv=none;
        d=google.com; s=arc-20240605;
        b=HHab2eMHAJC+nZ6BAaC2YayY8tMSAr71ScBRqAoElgoiqtlED4881z9zGhmK8nkFAi
         MaNFCURwS7OYNej8CoPODdIxHsaANkm2L1/SA6mZlbUuhuXKH5jrZLjfVq8rRU2s8MvY
         KwVfddBMOvOI53QPTJXE0sIUfcbbJ23E8AUW497mKnB+XWPVY/QXptGcQr0O+xKIfiql
         nQmxdQrRLeBYiWXAO6USzRTeAZozGBFTJ1Up38RQDNBeOVvZ8w37VOFQnCTuNRH0gYsH
         q7jqmmEKOKdjBAV0tFZ/Fjqq0qzIvT/LFsbdXHfnS3/gq14ojXsAXQf6a7z+uJ4L08ow
         ZLYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VBV0Ts6ofaJqUCM1Qo6rjKlvVEVtyHe07Pux19dTpww=;
        fh=TZ9rdqYtqP8HfIH02YMi0vCc5c0UevQCzts7tkfh2MM=;
        b=We/H41zP9UUun57eZh2iDo7W+4b7k7W89zZ+rxM4InLEhbiOXrtwphFzkSnUmgkGW3
         tEwZd0c48JzLzNivrb39vuc+EI+0usYyEClDL0UrYvIZSF35IcurUnMvoMj13sc3cgy7
         FERWPEW6g9SpbCQO+XqW728ik0MUmkn6ZOEsaYHkdhrdatN7PHgKJ6PlKKwrmkq4hQ6+
         Nt4woDzzZpIU+pnBqCH8ajPIdY4K8DU+6gCu6LIGiHb56Aa3mEPCBl9DIC62OOY33Uzm
         NgPYWqss8Xv0wh8hpkyP3BiX0L73X4YLTUKeBZFBjIv88lTjE4YMNKwdyWjaPBvlFM+u
         s3pg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777969134; x=1778573934; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VBV0Ts6ofaJqUCM1Qo6rjKlvVEVtyHe07Pux19dTpww=;
        b=hqQjr6qopSluQowMv/m9LtXCn0NhQMyqAFX08fWGPsJfCI9S3549K7RcGvkhlcsz3X
         s2XOUcIym9nytWba3Ed8SuXVivWccxr8xHhNNsadnaU6zRntksHB1SfFjpg6TOIqUbX5
         fu/k1Ta0GC0aWKHNY+L4DDo8wFzgxpFy+OLuuc10yUm6zXyMlHu7DN0lIaRfRfYx/sN7
         hvRd/8QqNj31BkYJbvmxvwMBN7ONFfcXvaLYD4v4jWNYHaWwlJRe7NpMvfLPLhsumQT5
         0D/YGWkeKtrRezy7eIM+v+p2tLo5w81qED3la4hnTQt539vWf2uErUQIODsKs3/y0O+m
         2GXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777969134; x=1778573934;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBV0Ts6ofaJqUCM1Qo6rjKlvVEVtyHe07Pux19dTpww=;
        b=EtOWazIwf2aXWOMs96Y2/1gqe9AQ9rK/Dvh3hsZ6Kd+Sah045WyPwQnLLBfNXNbpKW
         zCijIFe0CsVx4FK9IlBsPeFfYUpT2Nr21vM0fetaBARYLreUnXaqGPhqMEM/BmDI4AZX
         2za1nKFN0iLZIz/Co2EdqOkD+rioqLgPFAOth3nqETS4nWHxFaAPTz0DOeS9kNQp29dO
         4YItfH4bqm8T0Vp5VUOgVPRDYZFgDgGPLXFfgN0yV4c78PMrjhqhR1bNb+Im3li9rPGH
         Jb7oCl7xXVbbd70Sxp4x4QXZ8cqdRIVBDMrqTNS0v35mxXLwwlX83OdSDQ1aR3Jl6eo2
         +NwA==
X-Gm-Message-State: AOJu0YyIHrj8T4Mo+V9ucbtxrLdXm3jkHOZf6HQsvRkCbIAS6rZGtb5d
	g9wQUieQ5GXxszitMMKwE+mwaPfAxlL9HiOkgIzHfE/uocL3medoaLxaorEfpik6Prny4koEGgD
	v8BZZWBZSNNNzPzjkfezRxTN1eM+CDkQ=
X-Gm-Gg: AeBDieteksA2PNcbimyznnlaLGLJG//h/x8lLmS+o0O2hINpK9oBGbBIvXzCKpL8yV6
	p52SC848yGtSfNM1Szj/LS7rohlrM+QzjiCSQVq3Q8QiwYCJwZELrAdVsOrfIXPrRgkZdgmccRt
	UIYgiUZtTa5FONrSGgdT3Kn0u9wqX5jmHWNfBTOFc3lElqZrcquc6Txz76a5mg1UWddi9aDphTO
	37sRVZRIoIY6Rw4ii7GUpLj8Xz2JH8aLVTQBfrrWiMRN4iAE5aZSMzOtdplpnv7n1zvggK73KU2
	asN3IVsIfQsiT/EFIHi7vTgz6Xmr2jVqg1MRHTq+TxX8XTO5R3uO
X-Received: by 2002:a05:6214:5b13:b0:8ac:ab13:8f0a with SMTP id
 6a1803df08f44-8b6664011d3mr195108226d6.11.1777969134246; Tue, 05 May 2026
 01:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260430175308.868993-1-dario.binacchi@amarulasolutions.com>
 <CANNYZj97SF0G6X0dBg4C7PnrW6QFCXBpq6e4XJCkWzYECK7RhA@mail.gmail.com> <CABGWkvqz6E5FbweG9u=RAvMddWjc=qj-ZQa2Fn8=U=4tzdqVMw@mail.gmail.com>
In-Reply-To: <CABGWkvqz6E5FbweG9u=RAvMddWjc=qj-ZQa2Fn8=U=4tzdqVMw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 May 2026 10:18:43 +0200
X-Gm-Features: AVHnY4KFukmQYI-q8GoBaaQc0XWvbZk4l7LeZesgbN6krzy2myXG0rMqS4bp1mQ
Message-ID: <CANNYZj_hmNTnQ6OnaQWmkaoM7qY-KY2TCP5asVFLBFOMRALJwA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] libfwumdata: add new recipe
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: openembedded-core@lists.openembedded.org, 
	linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 08:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236472

On Tue, 5 May 2026 at 10:08, Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
> I have already submitted a patch [1] to the SWUpdate mailing list that
> integrates libfwumdata as a handler, which is its first primary use-case.
> I am also currently using it in a custom SWUpdate implementation for a
> client project.

If there's a swupdate patch that hasn't been accepted yet then the
swupdate support should be reviewed, accepted, merged, and released
first, and such a release should be integrated into the yocto layer
that provides it, and the libfwumdata support should be enabled there.
Until all of it happens, adding the library to oe-core is premature.

> The FWU (Firmware Update) metadata is not a custom vendor format, but
> a standardized binary structure [2] defined by the Arm specification (part
> of Arm SystemReady / PSA). It is already implemented and supported in U-Boot.

How? Does u-boot support it without needing an external library? If
not, then should u-boot support be enabled together with adding this
recipe?

If swupdate is the only expected consumer, then the recipe should go
to meta-swupdate, not to oe-core.

> The development and testing of this recipe were done against the scarthgap
> release. On that specific branch, the S = "${WORKDIR}/git" assignment did
> not trigger the immediate build error that is enforced on master.

If you submit patches for the master branch, the expectation is that
you test them on master before submission, and include the test
protocol in the commit message.

Thanks,
Alex

