Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88610C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 14:17:47 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36344.1782483458055960894
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 07:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ndakruap;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-662dc387b7aso1260003d50.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 07:17:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782483457; cv=none;
        d=google.com; s=arc-20260327;
        b=YZ+EeAedfreZ76Msu8PZoGcvc437LWZd0/E7UfX8b/uYdSo0RuexSJvEgWL25LcSDS
         cBYqqTL+GTlKMaBEjPKCk//CSwwNBq0FthDO6XXzO+R3yfp9R6NqwDUsXRdziqC08ohc
         NTixFfaphDrAzX6/FbOhDurPD7WkZm6OSQ649tgKPXs7Ehi+zVjs//+W68giMRTWZeC8
         X7qhZKaH4VAo8VNNF/tPv8JpkfCDaeRyuS3uIrT71Ag7jkapITYSc9BOOa7fKT/SC32m
         SC2hJiQcxV5RFdusRB1NIaSceSASifIeRPr+WHCSc3oMKfmWMO2Lrc+KWffCrIsEAqMD
         zyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UjW3LgbfkKqjljAGB88ae+DvCEr9Hc7g3armZZrgwQg=;
        fh=P/4EJgj+eGhwBBBjkan11mjw0IkzEEooDaNMS5xS4SA=;
        b=BS8GZ1bXQA/Ld4pyr2/VLQrTrHXvyU8uzM/H9EqEYlM6qObdlEj2lIjL8U7dQIraKO
         9cZY0Ro2gTc9BT0CVp86QgXBqhSCXUI+89VSZYbIt5mExPiqH4b7BuWeZDZfaSRPiA1P
         Y/gAcdOx6ZpeAR+6ba8uMtlo0RbmOz3NrGN+UZWy522GZFQb/1CLGoYd2RQJXg8u3DvG
         Yw5FrslMz6U/BkkmJQjKkB6Ymm8VeYqO03a9Q+cMpTpJ1sLjswU/V2Db592mPGIEXhqk
         9E7s5DDYgn0NgHOVj4L4qnJwsL1sS0LdJWXdozwRsPoxK/vA4JqslRDqdSHK6lBmrKZc
         wRAg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782483457; x=1783088257; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UjW3LgbfkKqjljAGB88ae+DvCEr9Hc7g3armZZrgwQg=;
        b=ndakruapYpqqhhsHdIGl6Rp9HmxglTQpgszKZzZEjxkUxtwLHQ2kijwMdbt7Znpi46
         sV519vxNKa3lysq2i6+h93qFxxKfsxYWTt5ui2XWK2GvCdi5Vkpcq8tPU6aKEt4FccVe
         OPalArRospeJ4hIRuqx3DXVEzqC9c5Ffe7tii4JSTAmJsgMsb3mRpLojsw1OY/3jMwRZ
         UzqBMY1DXUzTw88clmkeW+F/LbwjgbB1biQs2uC/YUHTGJVohRX/OuNV9V2doK3OHJ5S
         1oDnUkA/faPV814SdJN0GC7FPKsvOZdsGkkJet2kVHnb9mYo94zJkJeesZOhIfMND97V
         g1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782483457; x=1783088257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjW3LgbfkKqjljAGB88ae+DvCEr9Hc7g3armZZrgwQg=;
        b=IQk6NjWh2sN9LFKZ5PNz7n+95fkcj9JP/Ng2+5XU84gJsxFdAIp6vlrGcYqiKTPIUO
         Yr6nwG+15tK4VYpyo9OzcB9MUuqohTKIlK9KvciHtsnoyK48rB7AP+QVdU1jZpWRAaI5
         MOI8Tx3CLrZmkBqdHv2isA7IX1Nv8zCrhQjFJmGCA+YqhYB2m2ZCUqrCF+5uyMQotV02
         nsQ5WR0B6n8xSUiIEEr92hi4XJcd/+g4KxaNKcwBjyLQGfoPQ8s1Qm04lco1UFE9nMzm
         2jAAYPCMOnLLECOKBPzLY1H16GNj5LFRmj7fSf2isbI5DO4d9ZB87Zh4xlsrj/TEwDoo
         GfTQ==
X-Gm-Message-State: AOJu0YwSoEDXGcneOL+BJlGrrAETDHLTKL8wZuKmRyIfr5KSSlxtHhfE
	BL2YNAOKe9EtSHy/sVdACHKeWZ4lRH/6rzYc806Kc7unhLFJSBFm+N9+HrWaqmEJC/2iQODfEiG
	Pqups3IfGCsnKzSMqxeHih67uS7ED3sEwjWbk
X-Gm-Gg: AfdE7cnwj8/BEZi2nSGhtarzlevrsswvJ6C+7QZYBBIEVDIcKkgee7prDlN8lcM4f4a
	I1x9NIir1Ochg2SP5ZgpiIlZ6L23houvdOY3jHi1fZelW0GdDo2T+QN+XOdad1ByPZuQD5xx8/D
	FxvZuK+cRbjRw9zTxmrgLAnunPu/4hQOt+t5agyq8eXTtGa8Js9evuZcBqqKjjQVbA1NkcerOto
	gvbNRXvAvARVHZzvBo0uT80GsKq7UoFye+OdBKhc1hZnWKPIsDIKK5xOBU9Yn3Yp5F/yk42Qg==
X-Received: by 2002:a05:690e:4811:b0:664:ae6b:b490 with SMTP id
 956f58d0204a3-664ae6bb7a1mr416475d50.69.1782483456982; Fri, 26 Jun 2026
 07:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260625133120.2111653-1-luca.fancellu@arm.com>
 <CANNYZj8L9c48wTyEp38RkCMzi=XQQS9_rr++KJwZvk2fSuTHeQ@mail.gmail.com> <60267670-C3C0-4448-B2D8-B7B60E7297D3@arm.com>
In-Reply-To: <60267670-C3C0-4448-B2D8-B7B60E7297D3@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Jun 2026 16:17:25 +0200
X-Gm-Features: AVVi8Cdz4lpW75N3_l415NDAY6xdHJR62AQUraVMqs62TtkgsxJzvdEHO6VInqs
Message-ID: <CANNYZj8jarNnjjVLhW-F7guAz359G6MV5bfod-5VqXqZmi_F-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: Enable MLIR support
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 14:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239636

On Fri, 26 Jun 2026 at 09:39, Luca Fancellu <Luca.Fancellu@arm.com> wrote:

> I agree that having no in-tree consumer makes the patch weaker. One option I
> can add is a small meta-selftest consumer recipe that uses CMake
> find_package(MLIR CONFIG), links against the exported MLIR targets, and builds
> a tiny program using the TOSA dialect. That would not make MLIR part of any
> default image, but it would give oe-core coverage that the recipe exports a
> usable MLIR SDK/native integration and that the TOSA dialect APIs are available.
>
> If the preference is still that new recipes must have a production oe-core
> consumer rather than a selftest consumer, then I will drop this.

Thanks, that all makes sense, and since oe-core adopted clang, it
should be providing all parts of it. Oe-core does not need to have a
'production' consumer, and a synthetic test is fine, so at least it's
possible to know it's not completely broken. You need to extend the
commit message with this information, so it's recorded in git history.

The one part that is missing and that I would like to see is a
'production' usage of this in some other public layer. Is that being
developed somewhere? Presumably you're going to use this recipe for
'real work', can you show it? The more usage you can show, the
stronger the case.

Alex

