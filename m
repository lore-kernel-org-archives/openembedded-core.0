Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14F9CD6E7B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 10:34:47 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5309.1780655681983202680
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 03:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m+nvxwiL;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so16923906d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 03:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780655681; cv=none;
        d=google.com; s=arc-20240605;
        b=XIVSkIDxeEyL7KwIe+g23ogNE6ot5oGW90iJ2t1VzYnLwjolqc6vQLKK1bCN2wOQv2
         gVaiO6d06r/aX3pt1Gd6TspjKu9l1eKSEJTEIBsFWkn3j0lDrS3GNTWRxMV4l3Dv5LJu
         5S6C2orp0L3zyhgQPAIb9SCZG1YC0Q3bboLUjaiEtkli6GvAofRzoyR9VLwbzFNc7obQ
         wbJ/5IWIqMxZwH4CIpuN5JZT4yjJ4Z6Oi6rAvJ3r/XHrvA7LaNp4gDEEnyfKTgfzPVpa
         7BhqJ4ElxK3nyNn+dQDkd6BF8Mutz53erZ3WI869VhXWv/h60VlDwVYgJ+HkrIl7+oXI
         il9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sOww1gjpekxi4Sa1t294d6kn9YmSVKOS0h71zkHAfSs=;
        fh=vSwDZj2kzNbZyAlZWOu9RQTd8b5d7rkl1aRf/jb6cnQ=;
        b=GAQNdO166Q+R2dzdes1hoyzcd+tG/be7gc0wNq0e5GE2n0LXCbc9YHJwpCjb8hacs/
         KoJBwb7gLF037u34eKoBrAyc3/ZIWlph8kInLRLaVf50huCw0fwRDDcfHtScb335VpBT
         spYC+rnTOATCKhwsueMVi3k/+NJSGqQ0kTTfkWYf7fLTdux9O5IiA/Bonak0+2M5r37v
         mq/PwlLpCaqIYL9mPm2hecdtHMNA+00epObGMEVhaPosafrAr2/fbpHxNZjryDcbIkAV
         lKn9b51H801eNUSSioa0H6EBk7xpkKSYeU7sNjuj2Yzy9L4sfI8RfLAoO5TlbF8w4sj4
         kJpg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780655681; x=1781260481; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sOww1gjpekxi4Sa1t294d6kn9YmSVKOS0h71zkHAfSs=;
        b=m+nvxwiLrpIpzATFw4+FWNruuajy33M9xRD82UVJhWbpt/uT0K4NO0MujdWkoz6Mrj
         efFAKpa38eit8Iu0UsKMsG3gSI7+5qX37mTm9DMvXPODzZS4DnVXJdYl3SAWLxm77j33
         SjOGduaDAGqVz8E+oxAcjqPhCN0mImoLWeiBV7TWbTCJ5uOAFhSB3UyRp+y2OTazELnq
         qYlgVGeo5k63MgLvBXGbzQlpw0ABAMCxrZLR+AU09ZqFhsTKnsMYaZCiBWTAV7/A2MfG
         ZuPsvFkYJ+0VDkmxwAX8kxwCjcWBZkDHQMhdkglMWcxzuRz9Nsxek4SeMAdePAP6rP3b
         xLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780655681; x=1781260481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOww1gjpekxi4Sa1t294d6kn9YmSVKOS0h71zkHAfSs=;
        b=snaCk3FLyhx8+u+FNhyrEeiOiQ6FCmGSjY8Tq5U/C17aeTPYJCPmDVyuM2jRpagtUr
         AVlG6dMhqs3GSzffSrweYdcnqchAJASUzgDrW6VHhwD4qPMyGDItlaANTd18w9BI5fcy
         nZO3uzF5GHFSz18fZ8HVYhLe2nbvo8yR+IDvZBNsE5LlJb/vbb2qxnlqSOC/wu5YVP6Y
         QEcQ2Xpu93rcmaVoNACwK3Esf68IREGzQCt0/U67bqEu6c/TbJDxjxKTgmT3Y0e/4QDQ
         Zi87X3eQlLUX9+w2i09vu3Wj4VdlRkUHdM8WBHlsOV2U8/18iKN6bvwbOpnBT2To19Hh
         qNXg==
X-Gm-Message-State: AOJu0YyhblLIKz3cbN66JuppqcgDnB5Ya4d2a2bqYefnAE3oIwa8zl06
	/IzmVNLj87/QfB6iNyls7ESyUUjL6if8cZ0kBj/hOKflmFCJwHOaTcbNjgmqEXKwGAQgQ6wGKQ7
	qB+2mhVgEXs2z/BoUjJjqcX5ejMQuPlg=
X-Gm-Gg: Acq92OF4NaAnyWp5WA47VUIxQPYGfpusFvh0WZjTjejkAB3YpQaGb5XsgJTEr4RXLUD
	zQ8EFCAoBDVqPRvqMAyJ9K0uOsCNdZGbxyHaGxV/hJcPASqKEIRfFQyJVpe3FRA0p82I3Vj3ZU2
	RvzrqwE1eU8Hc5tSlVsDH9KoK/mx6oSH8G6SqEIMSQ4uvDY7Bv0QEwNn/64d/rQzESNgdWP1q1V
	VNeZOSI/39vvLZ3KoLvZ1Dk6yUfTwTsGda2t3CaH/e4PWL6NElKdCnA6tk4FaIeus4tSSiUnpg1
	zcmWiRJATenyXwxMltTRnmhyJYUckQEMQ2I8WV3QLpb+TGlKfgh7
X-Received: by 2002:a05:6214:194f:b0:899:f0b1:7332 with SMTP id
 6a1803df08f44-8cee61347famr56750726d6.32.1780655681038; Fri, 05 Jun 2026
 03:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260605081737.1568-1-adityags2004@gmail.com> <CANNYZj9thZKkUceNJpbbaMyCHzjy=HdJYjjtCcCkzy=UToOfxw@mail.gmail.com>
 <CAHaUZZAUoOqO8ODDLCvip2QJksnDATEwpKyVgPh46hDYv9vk4Q@mail.gmail.com>
In-Reply-To: <CAHaUZZAUoOqO8ODDLCvip2QJksnDATEwpKyVgPh46hDYv9vk4Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Jun 2026 12:34:28 +0200
X-Gm-Features: AVVi8Ce_wyJHOcS0ZhJMjvw2eTYjQv9e5rsRB-TYl_qcamQsub0MZwRKTstDfSQ
Message-ID: <CANNYZj9cRgFEp5=9-ejDMd+WyxS7r-goq75KHFGzesqV96LaOw@mail.gmail.com>
Subject: Re: [PATCH] gawk: improve randtest stability
To: "Aditya G.S" <adityags2004@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 10:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238160

On Fri, 5 Jun 2026 at 12:28, Aditya G.S <adityags2004@gmail.com> wrote:
> I've reviewed the merged commit and verified that the fix is already present and complete, including the required metadata.
>
> My latest submission (v11) also included the missing Signed-off-by, so I believe there are no remaining differences to address.

Your latest submission has the signed-off-by, but the version that got
merged in master does not. So you can rebase your latest submission on
top of master branch (use 'git rebase'), and it would reduce it to
just adding the signed-off-by, and then you can re-submit just that
change.

Alex

