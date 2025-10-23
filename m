Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3A2CCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 10:30:51 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.17105.1761215442385362168
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 03:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dafRzDuC;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4eb7f0b9041so4914421cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 03:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761215441; x=1761820241; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hCAz3A7HRjn6zuUNkVEPaPiCdWO/sR2QTSMxYm9IGSo=;
        b=dafRzDuCxqFBvck8iyUi0BdwYQSF7q78+Y9x45Vh94/nIqLa8gbaZBWhg9T2bvztro
         w4iMdHNsQ7eygzOwYN/kYmCDguwCAeTZ9zleBDqLxZjydN9a2Iusap/OY3Zc60uzVwtY
         BwGcgD9VGuMBQybfhNsCwRVEJnhSsnyUMzPF2sSDn/uuJzT4zXr9qhs7Jd0n8tQxKfcL
         xYpYH0DatfbqVhc+yHZkWdNyzmQoEod3D27BgtvwlhZrurKUiL/9vWxi5V141AAHAwMG
         BdA38EQIxidT7BvdhbUBxoqD6/FIqpzv1cIw7YNTcTv3se+Se7R8LID6uw7om9DfRgnE
         AI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215441; x=1761820241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCAz3A7HRjn6zuUNkVEPaPiCdWO/sR2QTSMxYm9IGSo=;
        b=G4fx4DVPwFHRivK5l9BlKzyW0TpxtUKTTrG55YLNCcxruRW2FCKpMMirr7UGMhXLJt
         BBz8gd1tGvUNpWTwUZTOcYmylj4hNsRDLnEfB1zQntN2I5ITVXdmQ0jbknOxLYBVCTo1
         IuMA+olCNuV3afWECtti2SzX4Hn75LVn9aVn669zqHCUVc8Iv4d1Iq8RpMITslDUsKKo
         KA0QuDzO5u/hV8jbtle0f35kxI7K8KTxDZD1EzocwBQc98LTBrTL/+1Pbga9NW56/5Ts
         Ze/FsjUawy/0UpCfw2BiqL9CPHVd0+J7Bi7co+MU+oTDTFztRrf4ccbbUb/4X/en1YHS
         h3XA==
X-Gm-Message-State: AOJu0Yy4puYw7PB9jy26VXgg8PeAdYo4TLNmdHQ+pb8M2RtMR8oXSyap
	sHWc/lO3K1ddQXvB98qULGkSwrEH2lLDLU5fjKMPx3gvgbvob8LI2ePvYAy8VHZEXV0eTTFng1E
	hqkujmgE+3MMdi5amkg31Eivz/4t1mQs=
X-Gm-Gg: ASbGncstfDm8vEKwkfRfKnmpsoUN6VrNzVm51fCKcrERXWbU/DZEr9dnhitkzQAbBfh
	gHs9uMJ8R+tm6Haw8O91668qUzhYxrfmOCJyI74SYUBGAegAZef7fYn/0UCweI1mH8+pKzZIhYZ
	Y92TWMXj51qtUng/Bmw1XaqkOsWmHqPl+J9GVj+1mY/kFE2v/p/0kl/7OX0De6JBVMVCKYPzVpQ
	UDuAFPbMATkf00EAK9rnP2FrXOOUKU4uUbcjTEy5/4AecDcbxf0nFUYc3hliPKFn7vydZTbI4OU
	uVxj8WRKeqDd2Mbn2Mr9nL06uM+rwQDr3pqS0/jpzdtwL21kIaUrxTopcbxLaHIuyD3pmdJdI39
	zofGy5B9klK/DTG4lBQ==
X-Google-Smtp-Source: AGHT+IF5ZnAEo3W74jsLGEVvy0HAsH/Oo2PibHYHFzoq5068SIbd3oZOHzJkZRdzff7yfzGB/OIEdaFTCbX4UnUoYiw=
X-Received: by 2002:a05:622a:15d0:b0:4eb:7dac:7b99 with SMTP id
 d75a77b69052e-4eb7dacbae4mr52038831cf.39.1761215441294; Thu, 23 Oct 2025
 03:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251023102236.4184982-1-skandigraun@gmail.com>
In-Reply-To: <20251023102236.4184982-1-skandigraun@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Oct 2025 12:30:29 +0200
X-Gm-Features: AWmQ_bkUyk1_tuvc1ftNYGiLy4L4kCmfN5QEsTaAmGfIRbCpMD7vUM-ONnIVl98
Message-ID: <CANNYZj9+JktmaAf=iKEgcrNFjx3xS3fQv2bHQDxY2r+DKgeMAA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: extend check_cwm test timeout
To: skandigraun@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 10:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225229

On Thu, 23 Oct 2025 at 12:23, Gyorgy Sarvari via
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
wrote:
> +The default, 3s long test timeout isn't always enough for this
> +particular test in case there is a high load on the host machine
> +(assuming it is running in qemu). Extend the default timeout to 6s
> +for the check_cwm test to avoid timeouts.
> +
> +Upstream-Status: Inappropriate [oe-specific: qemu on AB doesn't always get enough CPU]

I think this does merit at least a ticket upstream, or actual patch
submission. High CPU load is not at all an oe-specific problem.

Alex

