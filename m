Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67320C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 10:04:30 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.43041.1744020268914992577
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 03:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X7s0V2sK;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6ed16ce246bso20030496d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 03:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744020268; x=1744625068; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cGmULOp+pkw2LV3D9i5zACISORbVFeQ0/SDZ2CzuBo8=;
        b=X7s0V2sKbdGKe4q0biXotgOBQKxwHTbKyMNnur55nkTDPOYd9E31nMwLDPgawqOJuS
         5XAdNmCQwX4n2p8t1fD5xKwrlj0bhW2vrxSlbTDiHDvCCi4a5nFeacZcEATiANIE8qY9
         19qbulhoilgt1cm4KLaxGdoR/WspmaUS9nA1KWfuIMFDnJC1FJ8lMMyf0WAFF/Zx5b3X
         dGF7VFWD7qtBPYWvXNU/RYRnZNpknVZwr2CAkcFQnOyv/VTrYg8HlZbvlXDcLwfLDWAm
         CVCe2AlY0a0mT2k+mV+lRQpRq0biR4WOdTgiN6+K1IYbw6hCqf7ubu18JFFYYRsxdNYf
         5U9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744020268; x=1744625068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGmULOp+pkw2LV3D9i5zACISORbVFeQ0/SDZ2CzuBo8=;
        b=aQVCrcpKV6cUSiRb0VIDcGy/DJD3GpIGE5xBov2xs0gOEJYTDGAzM5BrhyhgqRKlYP
         4fqOB16nW0OiNsbDJBGj9060IM6d0Esn/qNc1/Zjnd1OwBQkHkHzGrqATZqw2+rhQOtc
         1nWDKiuUemUAtFbp7pwekdNqZ8L7kV1KNS9NvgdlFidy/UegDrcLb3QUT4mBeLu9oySd
         VPf5m827KW8LFYmdzUsXKk4LnEb5iZP8rQ0WV96QYIqeuOd5pYnLdx8yJHx5f7s7NRaD
         t8SFnmWcrHlVYNxHLWUPDYsG/+R3MMAw8YAtGR3jK3BtEuVniNGR848ox2zM8PJVFNH+
         Z+yw==
X-Gm-Message-State: AOJu0YyZlkW90ETE4JS3zsVApRJmoS7Rd5bRMJQED03LCMKrTR3pmFK/
	aqQYXxR4MdSrSw+9t/gr6yMbiJiJeMKOP+4mRtkiWZ4BC0M85T95sqN4MaK7I9H2dfq2DUXRLaJ
	jo5/BqSMi2ZGFddzVsiOKOkK7rLc=
X-Gm-Gg: ASbGnctlkCFQ6o80MlfD4WWU1oRdLGQKAA01JmPeOwqEYdvm2u1WhkpwqTZHxdLrdEw
	RQEw8Y2RRsPYCjZWausiSOus1wzVWLcV/4NYFlCrQvmLEvbTsdYoR2kXxHK4YpOy1aaYO9H5AM5
	BoKEbzH1g6SPxfbzBN2nE9MNanqXHiK+XZ4f5RZNH0LQwIwqLc5tvBC/IuXAY0
X-Google-Smtp-Source: AGHT+IHjmYf1jb5uQ/Ixxg3ZBtzWR6NPrnaDuL9CqDJGzajJTqDAvqtajKIJ5Ovn+2s7iYB1XceeHh5eogYYpe4OVtw=
X-Received: by 2002:a05:6214:f0c:b0:6e8:fe60:fdeb with SMTP id
 6a1803df08f44-6f0584edfadmr141321626d6.17.1744020267920; Mon, 07 Apr 2025
 03:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250406180920.262141-1-quic_vkraleti@quicinc.com>
In-Reply-To: <20250406180920.262141-1-quic_vkraleti@quicinc.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Apr 2025 12:04:15 +0200
X-Gm-Features: ATxdqUGzyQdVI5jkunXPicmnHS_1_1fHvaXk41ks4IyXDQrsGhmaFh_SvYMQDH0
Message-ID: <CANNYZj-JtbiNz37guCB_mJbOb19GJSDTpmAyY0_ZtDHr7yM7Sg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libinput: split udev rules into a separate package
To: quic_vkraleti@quicinc.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 10:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214444

On Sun, 6 Apr 2025 at 20:09, Viswanath Kraleti via
lists.openembedded.org
<quic_vkraleti=quicinc.com@lists.openembedded.org> wrote:
>
> Packaging udev rules separately would be helpful in case other packages
> need only libinput udev rules but don't require the library itself.

Can you give examples of such packages? I'm not sure I understand why
someone would expect the rules to be present on target, but not the
library, if libinput upstream always installs both.

Alex

