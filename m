Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEED5C61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 11:52:34 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34318.1787831551160948099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 04:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qah3z9jF;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90c776f6c13so20157366d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 04:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787831550; cv=none;
        d=google.com; s=arc-20260327;
        b=rqsCqEViNgWxA9HxKc4gkSGkbA7P9ie4xKZx76z9sMaOQj8cMG/z8Q5NwuZENqw9RP
         gAHoRz0u5z9PcCTEFe7dCF7aF8UoQhrBMTjo8t0/WzqNvKNYMii1NALL7UAgzzdIl6kq
         VEva2fVnlR9zwFpM843hdv50MBljTGvCBCbPIt36LwKwr/GrWPPsLK1qNC2DQ5HUmHaZ
         c1/HXYw000zKx3D9V0Um9xTuNjmWIloCvJ9tZ9HRcmi+bJI4pUGnE5SofuryNHYnIgWw
         k3zm/FdLxDQPmYW/uVJfrWykqXbysFPSIVnQTyoPNhYiRGm8iuVQeCpJIrkwbA+5Oe4P
         2XBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k/d6vEylM5whSq7NfGjnzMsRkMLJLr0ywSjvMM5Q6aU=;
        fh=7/XFrrRujDvIKlCrzlgTb9zOyDKfLM/zHxbA7wn7yGM=;
        b=aWBswFe9PR8rKQ1flohgYPbee2oTUzKkU8GNrwgLakquc+Bxv6zdhBYpwz2onOoic5
         YzfkCXJykB31oElI/zIy6VNoRVo2lTrylFHzeWRnKBLL+j7LD0zHFnMfDH7r8mzPrLAi
         1X4il4db3QKeX0TRtHnQVSWppLVB19gQscFy+yzJcmtxgLOf7OB9IbWg/O5rKwlCWgxl
         Ss7xOCWhreVZRGgYjsRwcZZAvRxuMe4/1DM+dpKYRAjZWmyt0+GfyWqvHQw4by/uXXp/
         fFbuLgjnHejBuShiuQDbDB9p0zT0kETrjL4+I9jXxLEMb5f1igWvKbqTu8EtOlbtsVTh
         oHYg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787831550; x=1788436350; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k/d6vEylM5whSq7NfGjnzMsRkMLJLr0ywSjvMM5Q6aU=;
        b=qah3z9jFoc1mY5swZ2PmmWq5XB2mLWVyhOT4IzwnCILuhQWwTEzpuGy4ZIAf/oROl4
         hdXfMVPOucBiJLnXqChjyc9O5/GwmgNKar79zdanZqtarYqWbtD1B2QQgE3s8fkcNT1o
         Bg6QgmMqsS5Fr6UaL2V5MD0ABFSpPEtzhGCDXLq9hjrTWbUSnEx6MY5CtZV9IuCsJcLw
         nQsOcpQy9ndMYH7F/KhHE7FSTyel0zPsZaHw0fTTz+K0QwPYAGADZkTxyZ1vTTkjPGIw
         1lN97rAfycw1E5mcqrirCUvQrzVVYneoOTw5jNSfJep+DPyETVSwgRggj2lqiEtmuiXF
         ARyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787831550; x=1788436350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/d6vEylM5whSq7NfGjnzMsRkMLJLr0ywSjvMM5Q6aU=;
        b=AKzv1ZDbluRQXKzvVFLuvFIuUJVIoGRfZObUYu1k2vMN2eO8a2Wadt786U0d80Mjk4
         HU3n384ck/liHJxlQnLclqUA/T6fs3L1LjPplAa7MUgURCr2wDk50zgRlY7tdhgCqYJL
         Am3wtblccsOaYX0qdnE1LK5w6D3VpM1t73cMC5+JER0zQcdd5Zf/GUs3MHGO3Nm+oLg9
         NPge1KZRPcK0luB0nSIdRhKg8+wCkHqVmK9wr30pezwWOe6y65HzIjTPShZhdfozZAuA
         IEaWYRz0PNsFTxrMqNThB7ch30+5uZ2G6ANPF3Q6gCzlsAnA5CQEwLZ0vbfkq4p9yybI
         KGKg==
X-Gm-Message-State: AFuF++kML2nZUoxjz4DKUs9sJ+V1XfUjaCD3oqvFmO330Zpjnm75b/OI
	KDdo9XToPFv2PknGhm5+UXVbjiF1eW8sU4WWNyQ5Vju9Bnvb1KduVpmJsAFdjfQYR2ZFPLKBM5G
	IJsd1nIfIjq1lD6oZqaq0SULtj9rDDhA=
X-Gm-Gg: AR+sD10Dd+42XcXV8M/4ftmN+NPhmpc+krvx0ysNeRI7bMWams8rBlju9tS2uVsPGOk
	5MCHZFfwELCuCx2qDO6WUpyEsBT71zReZAoj9eXmoaQhfAfmjwBxILFXgXYFzIwvJtH2mbCrEqn
	Ot/g63MYX9QGza1kYZ0OSev43tyLh2Y0uYS8Ch2hznof/zUSrDBIk6bZXd2J3WwtxwfZra8o8Oi
	GAeF4CnET82wjrVCADOYOOoP24ydrd/y6aPJ8mV4QTjcWKQcUDArwnjCpoH9aWJyUp+zODgSvVq
	VtvPJMZAIc0w/Eqr5nBAqVw9fTHHVXdHg4WrGlG7F66Mp+OEMmnf5fqjZwvKV+RpTHWndnNh+oh
	q/Bk=
X-Received: by 2002:a05:622a:5d1:b0:52d:92c1:b7b2 with SMTP id
 d75a77b69052e-52e4228f2fbmr133678801cf.2.1787831549872; Thu, 27 Aug 2026
 04:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260519090816.17783-1-pratik.farkase@est.tech>
 <20260826082716.15560-1-pratik.farkase@est.tech> <CANNYZj9eY2mj9XoMdCmY80o+95btOvxp1g94RYn9VSAFD2tHAQ@mail.gmail.com>
 <PA3P189MB3239CD19DE451BCAF6B8F036FEAD2@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <PA3P189MB3239CD19DE451BCAF6B8F036FEAD2@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Aug 2026 13:52:18 +0200
X-Gm-Features: AcwNN1VlrtuOn5UczEe7UjnZMc3L76uui_uV_xpeyh8WKvUjARhzh64YAwHV2RA
Message-ID: <CANNYZj-0=a44B9Dwm1ttxnezZ72-938uNKz=NFXFg142bFEYqw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] zstd: add ptest support
To: Pratik Farkase <pratik.farkase@est.tech>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 11:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244479

On Thu, 27 Aug 2026 at 13:22, Pratik Farkase <pratik.farkase@est.tech> wrot=
e:
> Thanks for the review. cli-tests now run as the ptest user, GNU grep and =
less are added to RDEPENDS, and the QEMU image is given 4GB RAM and with th=
ese changes, 40 out of 41 cli-tests pass. The only remaining failure is com=
pression/levels.sh, where zstd --max attempts to allocate ~8.5GB (kernel lo=
gs: __vm_enough_memory: bytes: 8597475328) on 64-bit systems. This exceeds =
what we can reasonably provide in a QEMU ptest environment. Would it be acc=
eptable to exclude this single test, or do you have another suggestion?

It's not easy to suggest one way or the other. We should certainly be
careful with allocating massive amounts of RAM to qemu processes, as
ptests are run in parallel, and it adds up, and can exhaust the RAM on
the build machine.

Is it possible to adjust the test itself, so that it skips the
memory-intensive max level, but otherwise runs?

Alex

