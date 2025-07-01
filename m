Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384F8C8302F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 09:05:52 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.6004.1751360743704357826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 02:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X7dT8+Q1;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d44c6774e7so161181885a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 02:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751360743; x=1751965543; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FUvQgDWam6KXWr7wB7g/4samiyrT90MfuFQKUgmjCso=;
        b=X7dT8+Q1W+rNH2n2qXnxPbPzOg/M+aDQjSBqA4+y+q7WHh6DueszlSavC3Lryzk6vl
         xiYN3yPxodwGOEVlQDq1VWYyvWZ5Ktn6eUMQZMc4YfX2kRE4hPbjvFHsSId5UxSARFyj
         CSDnVLMY8nBlDBJT0jwrmmkDwc+FI+xyB4nYiqpysQvoGBXnvC7msbqrMzwnpqaddKnV
         aMKveyV2lrZJmzBV4e+jAzs9vLzoeNkzQZo+eDVFdtCIqt5bx9sa2Q5TgiR35xFcZO/W
         Ci6tdV16n2tnWxaqCd7FhwqVkXaelKIIFlKUQxyrLtj6yVJoVZbLaVE+v3fv+laOIwxj
         kv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751360743; x=1751965543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUvQgDWam6KXWr7wB7g/4samiyrT90MfuFQKUgmjCso=;
        b=oXasK6FTzrW2rcW3/pvn/C4Wv+UP3WDcTkpiXAD2qZS2v3lY/cJhbXYLsr0K37Q/Kv
         cQCZwlmW3mcZwJ3UpGzNHz8+26YD+x2PLhvnZf2VYn7qRa3Iy00cPFqklGpHMR8+0CnQ
         oy2ijcjLdKD42Pzwm9OUZX1azmweHKrQXBTpekQA5P8RWhdtg7fOCj+DZCmi5d1+fkiR
         TG8c9mAfLfIKYBIIdFH/Frr2vUf1y4MxqN5X5boKtrPGEQXumxILsrIbZnTNtaRmdqVO
         2V/zmuSzL5uEe0GlVJQNux5r3tznkrpDVCO6qFc5sKWXRU48eglkXj8ePkkghl7qnunI
         f9hw==
X-Forwarded-Encrypted: i=1; AJvYcCXc8MGZPdCsXYXIDqGNkYUU2lxvphpvOBn2v6sPYn5DPMI9nuOopTfs4J6YzopFF2EfL0Bf4Y5h0lRhAHlmUk82ng==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyGuKmChT02PEij09kAcWXwarlA8AhTPaMu50ghsok2f44+NP+I
	SnjVUucv0rYGRYveWOaj2G13E1fGd3dxleooi/qir3EyyoMmslCIRxlRr2fCmYuc5bBWPGqFGTT
	qpzRsij/sHeATfjxg7bcXCpcmP6WKLeY=
X-Gm-Gg: ASbGncvDrr3J+tUZ2y5GxjnpN62ipk31vTucLaC18OKHHZZICttQZQM9g6D4iGqriBs
	3HfT5Mkvj70giKUbiKOKHbIVS6wh5MocFqZoSm8nj5nH7HHqxjGXNgEofiQM6KmgPojcZKRIqL8
	FAvzklzo2fxub04EMrATMJEGa+fhCnebNcYg5KOhX+kng4SSefhnWvRUdS0kjN9e2vWdvtw/sRM
	+MRWw==
X-Google-Smtp-Source: AGHT+IHUQLiYPOY24aNamYmJx8ShbEVIdjb2keFHE5LeO82H2eRYI5/1XaIQafK/HORZCuj+RvgKlwouJi+5k3om4Rw=
X-Received: by 2002:a05:620a:4623:b0:7d4:434e:2c17 with SMTP id
 af79cd13be357-7d44398e560mr2191016985a.17.1751360742423; Tue, 01 Jul 2025
 02:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250630091315.1897-1-wangmy@fujitsu.com> <20250630091315.1897-22-wangmy@fujitsu.com>
 <npdkml4x4sxxdljaiv4e2tbwtdwejbsnyqsummjumsqjbn2pqd@3kbwkp6hy3af>
In-Reply-To: <npdkml4x4sxxdljaiv4e2tbwtdwejbsnyqsummjumsqjbn2pqd@3kbwkp6hy3af>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Jul 2025 11:05:31 +0200
X-Gm-Features: Ac12FXxtxMCk-8oGB91t0-7HbFF79WgbGaqFCR5266X--KjxnXNrbnGmUY958LI
Message-ID: <CANNYZj9ar67VU5gbxLQ3GrNvFBSjULFMvUx-8TgPaFDruaoJug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 22/37] mesa: upgrade 25.1.3 -> 25.1.4
To: dmitry.baryshkov@oss.qualcomm.com
Cc: Wang Mingyu <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 09:05:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219560

On Mon, 30 Jun 2025 at 23:10, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> > 0001-freedreno-don-t-encode-build-path-into-binaries.patch
> > refreshed for 25.1.4
>
> Please drop, there is no need to refresh it: no fuzz, no changes.

Actually, there are:

> > -@@ -885,13 +885,14 @@ The rules-ng-ng source files this header
> > +@@ -889,13 +889,14 @@ The rules-ng-ng source files this header was generated from are:

Also, we usually do not ask to 'tidy up' commits like that; doing this
consistently would create a lot of noise on the list, and unneeded
extra work and patch churn. It's easier to just apply the update
without making a fuss, and learn to ignore patch tweaks that do
nothing.

Alex

