Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D06CD4F5E
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:30:48 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33509.1779359448299316721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qaPXYQlB;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8acb856a674so74754616d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 03:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779359447; cv=none;
        d=google.com; s=arc-20240605;
        b=NUnZmSfxfENz2v2bmha5TcWolElXYrZMFA/KQKQ9FFqPTpFVEqa2lrxLh1+caIk707
         7VRo2/tdwB7+B1iid3cnfWsDNB+qcsPIXjyZxZiXDViGSirm1xwEEfiFs1q9GSoqKCdj
         iwCHqHIlAHnY4OXAomt2MImbmll26l/YcfZuzGF+zusu6fbgfE5fUd6DcZqOuGXVATgs
         fgRa1mwpcqFTIH3R/TMrzfNuAT6zGvDZBBVkwTJqWey0HHbRF+dJzN/Jsict2ASSHMfp
         oJ0+/w2ZzM/tSTt1huH+zAK7ozImjBeG0ADmbc4YnrWB2wmvNYeB1dpZzSIOEHOph8ng
         w0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lmUbCopxo27626NGr6nG2wgPP9ttKci9Kz8HwE9pF4o=;
        fh=l64FzpQvroiB3ZecvpIoJhb1PoLgfBaMRBiQBcsjF6c=;
        b=h5OgVvJRfTxT6/VLUgzqrCHm67Ea7T2QqWpwyIDBQEpKVAf9ieg7L9NLfHitTtDJAi
         JtjkJ1HE9tWEUSR8gZvHmEpi95Qn0hbBo7bfnBB+cBPdOkiG5SzZEfDCMZMDsjsNRvQU
         VvrLniFoi7sY61pivxgV3+IC665vrqHvbzueaoqwGxNBY8CEmnxZkyS4rG6YvU/RfMzc
         GV2qSWYf8LreSXXNjIpkPwTC8Q9o6w3+EFuyC7X3XC/tHAOyYTUs/YcctSvkSRRs3woQ
         MGlAML5ds9a3jOAHXlP3J53yhA/OV7GBInJTKPd42VLtTLZxcuydBECYxm7h33HTtirL
         lllQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779359447; x=1779964247; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lmUbCopxo27626NGr6nG2wgPP9ttKci9Kz8HwE9pF4o=;
        b=qaPXYQlBSrfTpUohu2589aN7+pe9dgXLJcbZFCU4aIREN0wP0z7zriW3g0qI9lC9fn
         C2onzRscWqkokGue3fvAqxOWzdmPAPP6n41m9xhGCXXILHQzhtkEUiUXZh7ThaIWq3cr
         6YY5QQ1pX0b6/s+r9jLktVW2wqwipIsS7iXQEweNobAUwYq4fgBcedKihl13N4aZySOP
         Gwey6OUYbTK7wInSsME1jsjkuwpQ5xbhxmXag4AS2PEHIT14xJy1yNMbMKhu2ryWUoRb
         k0r6vreKgJQW4bqJfjQNZ0xOF8ZGLtgYXhUHq3yIXBvOaIcTPAVz1dRbOyBAniI/2MIM
         emTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779359447; x=1779964247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmUbCopxo27626NGr6nG2wgPP9ttKci9Kz8HwE9pF4o=;
        b=V6V2uW3trwfQXJsLQNM8d7UvVsek3xgF6pq9F9VPw2AD08YTsY2c88HSY6Arze0DoB
         1QMe3F84R0Ft7WUSRdHXrq6H6lcN1cdm0F9ImqhfSwAdJiOiOsIJmRBl94kBee2RmXGv
         Aeh9hBWevAKDjLefHgxJovuKLNXGfPbyVLokv368occ+NGGvsz4HNb1fGhUEsFRM5v2/
         apBkAeseKgy/Z1B0EBbUVEMduWscJ1qGE6SdnRvI5aSSTRkWJtie0vXjq+2Lqjc/wphY
         m+wFn/62r/Lq1DJ83eEUfw5WhWhV0D/gcmwZYb8XE5W2+RVxMK/oAmYpjs+p+H1MJ2uF
         3NpA==
X-Gm-Message-State: AOJu0YzOoVSbN/hKim+LjHTj9FRV8Y5kfTE6hACU6YXiAPV2pNHxLALF
	NOb3RDldn7WNoIiwTSWZwOpY5cMnLrANjNel/4LZ4rPFyFXFeO8M33fi53jPZGiFvlPZUikj1wh
	ItHVVLLk3vXTHvDBjGT9b7UdOgr77MM8=
X-Gm-Gg: Acq92OEZd9RcnTuuU/wlSZTRareDaBVSk2zTTFGVzPhZv07+dEqcRZZImEbDaWzmFXW
	y+KFxkxvh6dlTwlwP6Y8MDjD5NuPfEdFYOj7mXpX/+ZHYrRjwfgrPJjrMDn+9dTkVUE9oVd9nBt
	Fwv+aeb1zV9hROL6YjDpQs6CJjauBk7c3Ux65zyWp88/ge/sbzuIU7AnPYwC2VOckFT2QzCKGek
	8NGaaLAD4eI8800U9rmAuQB/1Ml2VllxdXtonL4uWj4hJe1tdXMS06qeNcrfkysDjZruuMxSACZ
	7almH4rYAxTE7XYO15gjYU6uiWdj7jcAVxn+6ZGFZQ==
X-Received: by 2002:a05:6214:2425:b0:89c:47aa:1883 with SMTP id
 6a1803df08f44-8cc6e928c74mr26812276d6.8.1779359447327; Thu, 21 May 2026
 03:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260518135925.2579226-1-daniel.turull@ericsson.com>
 <CANNYZj_b1FwJ888KMGpMSvBHQTWw6ns_M83Z3hn5WQHbi-_WCQ@mail.gmail.com> <PA3PR07MB1072144F3A9A22B216961FBCB8A0E2@PA3PR07MB10721.eurprd07.prod.outlook.com>
In-Reply-To: <PA3PR07MB1072144F3A9A22B216961FBCB8A0E2@PA3PR07MB10721.eurprd07.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 May 2026 12:30:35 +0200
X-Gm-Features: AVHnY4J3utGAQAQusYQC9eZIJBpE5IANkH3DfIn0rPQfUrQusjv6hDL_zw79c28
Message-ID: <CANNYZj8uZeX=uRvG4LunO8M51bfA26otSP9=R=Nx+Eqbd_Lexg@mail.gmail.com>
Subject: Re: [PATCH v4] devtool: upgrade: extract changelog between versions
To: Daniel Turull <daniel.turull@ericsson.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"ticotimo@gmail.com" <ticotimo@gmail.com>, Tim Orling <tim.orling@konsulko.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237501

On Thu, 21 May 2026 at 12:25, Daniel Turull <daniel.turull@ericsson.com> wrote:

> Yes, I can do that. I was waiting to submit the AUH patch after this been merged, but I'll send it and put a note that depends on this patch to get in.
>
> I will take a 1 year old oe-core and run AUH skipping compilation to be faster. I'll push the commits as is into a contrib branch and analyse them for corner cases

If 'devtool upgrade' fails to rebase the patches (or otherwise fails),
will it still be able to extract the changelogs? If you go back 1 year
in time, the much larger version delta for most recipes will certainly
cause an increase in such failures, so I would probably do an update
on current master, and maybe master as of two months ago as well.

Alex

