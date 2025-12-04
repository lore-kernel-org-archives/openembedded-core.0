Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7631DD1D870
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 06:36:23 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37413.1764830181662179321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 22:36:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fhEkhCSw;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8823fa3bd95so15197326d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 22:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764830180; x=1765434980; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S4DIuBr4DXfmbZYRJ4/rpWsSBfNWYe8hLxX8LVD5SOg=;
        b=fhEkhCSwhn6JJ5sMImIMPwNrEsowZYNHZ/whCIvPpF0aSGlT2RID0pJ1RHAKaJpTYO
         H4D2WQp+Wl0PL4b/cyE5ehqVL9jz8sxr3P+6lOAnIiB4jZTdp96cgM5lITyGgQDdtK5+
         hQhkOpDepZy39/GrthXaOPXnx5s8k1VE+Wx2TaQArX5680iw1WgHL2g14qi8O97+4ojw
         +bfuo8UGf30grYVxWMtGJ8EhKvRSGxU3h8SHyf0sjODC/B9OOoqAMjvkB9xwYVETDlCR
         fDL7bApKJ+Oz0BxjLdibegt+fVtWbA+OTFa/tJe6Mx/5f/OpaHhi4TZQZLaD9WRmCNky
         yu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764830180; x=1765434980;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4DIuBr4DXfmbZYRJ4/rpWsSBfNWYe8hLxX8LVD5SOg=;
        b=XxvafNoJ3r5KfO5WIo6Ai5PQttOqmL8LiNPUIJ3xGeDr5UoXrWzdyZKN7THGBHNoyf
         mh655PW61VVQbJMYRpTq6P7zza34VWSZ2pHtdlR9pyDkbiExdCe/T/j3Q7w/urZkAzjO
         8WbhCHcIExXZFHdqGsKvk5x7NPy9RFkNd7NwbjNW5AhJwFccf1U3Thvc7eCi3/0WddTb
         Z5BcM25sCQfvHGPwpc1kaToUavI6H09iLiTnG9NiUqhO3xCtjGGKt+YmrUkGUresHKpZ
         f/ydqOeWbeZEm4Axrn+/xTLcMh3Qm/BGVVG9Yc8KCjFewAakYPiNLia1Djuds+PHiPNY
         UkyA==
X-Forwarded-Encrypted: i=1; AJvYcCXMAsgTBY2yCvROARyMPUVkISt5JTH6N+1yixePVm5NVyQ4LZcMVxxJ4rA8btGWih0wTj8zdmL11KCmKAEKc0F2KQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwrneP++Yoy0SqKH4JdIKKApHWR6lJV1DfiufiK5VhhWCkx2536
	Wtoa55bYTIQH1GwrIXg4Ra4JFN7pJOIGoAKFyowYIGa6TtlOdm/fjzmqW/pSlnmFxX6Gy0HB8/i
	4S2P9VSJ5v6PZqJwFeUcflf8E2G9kTFU=
X-Gm-Gg: ASbGncuF+grMTBENsIzTXKMmB9g0oIV+uAMNNKP7T9bvKlP323RKSF3jsaESKKwJxFH
	uETruKy71ybF/HEXtr3zV22/3vDqyxe7qwD4+f/z2h01V99B3HJ4iFVs2tCJLmxmKgnm7tAGqe0
	wuWg+inmyFgeVVW35uY2L6gfUS4I9CGipQgj3MiCoCiLq5RpqCwkSaYjiDZ0PRcEdPD1ZcXRkyL
	Y76BZSAVrdCBsyryv3NfZXKKk/58zAQgiXppweCWhhxjJmsp2md3GldFhg3edhF4FQMuYq26JMC
	3yKSKTCzJGo23Ux7Nnuy9SDmpLIwSQ==
X-Google-Smtp-Source: AGHT+IH29esGAlsLniJNBk65LRaHklNZLzNu/MycCen5+fHCeflmqeG1RgiOhFS2ngRoubOwE47SfpWmOjVvTpeLrPY=
X-Received: by 2002:a05:6214:4113:b0:880:5589:54cd with SMTP id
 6a1803df08f44-88824579640mr35899996d6.19.1764830180526; Wed, 03 Dec 2025
 22:36:20 -0800 (PST)
MIME-Version: 1.0
References: <20251202151032.15053-1-schonm@gmail.com> <20251202151032.15053-2-schonm@gmail.com>
 <DEOKWAS5XALU.VTBEZYEYZL1J@bootlin.com> <CABTo8gDkybOgXP0ot4iOyJtnezNbMghuhSf9yLLewH4YkLVdOg@mail.gmail.com>
 <CAMKF1speTaJmuv9+a-FSHBZ1s8gH-DpfJ0DQrEjUjNHprLtreQ@mail.gmail.com>
In-Reply-To: <CAMKF1speTaJmuv9+a-FSHBZ1s8gH-DpfJ0DQrEjUjNHprLtreQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Dec 2025 07:36:09 +0100
X-Gm-Features: AWmQ_bkmHhBAU7wiCqFy38Hz7xm_HDPOl1VsiBeSKYJiitUtfK7Ah5J5Q318_0o
Message-ID: <CANNYZj8MKJAhXM-gN9RFqgR6uf8Fk0u7giWCnppQ0pMxfztXuw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] perl: upgrade 5.40.2 -> 5.42.0
To: raj.khem@gmail.com
Cc: schonm@gmail.com, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 06:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227269

On Thu, 4 Dec 2025 at 05:14, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
>> In the log files, I find
>>
>> Failed to load or import from ExtUtils::ParseXS (version 3.57). Please
>> check that ExtUtils::ParseXS is installed correctly and that the
>> newest version will be found in your @INC path
>>
>> I note that the version of libextutils-parsexs-perl provided by
>> meta-openembeded is  3.35.  Which I guess is far out of date.
>> Metacpan would suggest that is from a 2017 time frame.
>>
>
> Right, you might upgrade it and also propose it to migrating into core layer at same time
> and once merged send a patch to delete it from meta-perl as well.

I'm not sure that is going to help with the failing test. It is not
using anything from meta-openembedded, and relies on things in core
only. And this particular test has passed before the perl upgrade, and
is failing with it, so it would be good to reproduce both the pass and
the fail and check exactly what is triggering the fail and why it had
previously passed.

Alex

