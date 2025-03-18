Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0C9C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 14:00:55 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.12535.1742306449828133559
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 07:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NyKfP013;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso1296736d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 07:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742306449; x=1742911249; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7jY6HgceyIflXGS6AJalxeNah/2vn7LujKjBXYADyqE=;
        b=NyKfP01365ByQ9hOEf+0dufbBFM7v7/Y9VrsP0K1STS8Mt6vofIpj4swEtzKHI573i
         Au7kabIGMO9hv9LWpJN6itX0akxITe53oJfFW5wcqv4QMDlDCWDNT6ra3E6/iHeIc4vc
         5LHmpo6mOMXO6+hK2I7UfIas7qZIgWSvQrZZ0V8qzfwv+5spB48gZcGN/ZiXzUFmuziW
         gtALvFiCGK8gDmT9Mv7cq6/dgH8DX/L4N+lfipz1R/mJR+hGOAR44M/LP26wS+Th+iUR
         WRedQgUuObSXgk5Oiop1a9+QJz/lX4s3s4zT5l6PG7XWd3FencLuzADKOpuTVWMhthTN
         ie+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742306449; x=1742911249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jY6HgceyIflXGS6AJalxeNah/2vn7LujKjBXYADyqE=;
        b=nfUBtI5z4Afq9bA/vuHPShhdp8zZCa0F7MHcLdcIg1/Ykaga62jsisH35GBnhlCMZ6
         F0gm9SUuU+32rGKZ1l9rLOEqjzGFcVPLmNyehyFt6YwxjPqcEq2s71kcYk40nQ15NBsP
         14EAqT4N97GbnN1PmjsGOaxbZimMICjeM2dIxN4mi6N3rhudp9wTLgllnJBw1Qb/Qu3v
         ycXwghIH++RQR5VTJ5NTssTr4DazvtUapDFDqH34gMKWhs4j7ooebr2s7ZI+RLq59Qvr
         +sXNkZOWOQX8nvmtLIwyoKf9ZEt98s+EMkIyTBIAV7THivRG29bfzVI6nUx/zE1zbj8h
         grGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnJVfPA7BfbbHH5bE0oZ8HwvLEOj5DAKUem2NKKGKvHTpHeVLGuvKEzOgmOVdcLEwbtg7gmig1Cc/QtlVNaJESYQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwP/6urcOtxwTsMjP626RGC+rmABHTlrYd/T0F0fl83kxYD5cih
	nkA8PyFqy1+DaYOOQVmZQwXZatYq49FC8KZeG5JuUKKrz4PwxwfqnOBwaMiSEbc1O/rvOGMpMnr
	cwBkwlFN8VtvuN+FqAVFSVJmM7rDRuQ==
X-Gm-Gg: ASbGncv676eCD/G32Cu8yJn8NO2WzYR9dxQFW9w74F5KewuZOz6oGudxQLZga6cQco5
	9SHq4GY/mimPOXpYRJckOfKMCcoYuwmYCa2kmhUKmZt3EW0NmIPiemqPoskY8ncFIxyEfeOL5je
	kX08TMOMupNONLFfakXvsJ66W8XIeuw28ekfuaDHI7jpwJdVa1TwuZmfj7ZlrmvWijyk8KMR4=
X-Google-Smtp-Source: AGHT+IEeKrFpWkuVRa4mpJH0brQIxJWYy30UFW6Jtm1vZAvhK8jFPXXgXDB69yY587LX8Pe5NopizuZ2lFnJHulW8eU=
X-Received: by 2002:a05:6214:27c9:b0:6e8:f470:2b0d with SMTP id
 6a1803df08f44-6eaeaa52367mr310871736d6.19.1742306448784; Tue, 18 Mar 2025
 07:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <CANpL8Ovos0fzR1eWiDiqURHsQe6WYTeHDgw5MpdqRXh9_qf0yw@mail.gmail.com>
In-Reply-To: <CANpL8Ovos0fzR1eWiDiqURHsQe6WYTeHDgw5MpdqRXh9_qf0yw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Mar 2025 15:00:37 +0100
X-Gm-Features: AQ5f1Jrt4abllU_A0THqpLiO6kT_uznh-He-BmTqU6Tog35wXy9WondbRq3DC_E
Message-ID: <CANNYZj_HOQWJKtDgKy0i5efqxty7F85enr=N8cDwKE7kVLSrxQ@mail.gmail.com>
Subject: Re: [OE-core] [BACKPORT] icu: Adjust ICU_DATA_DIR path on big endian targets
To: makchrbiz@gmail.com
Cc: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 14:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213213

On Tue, 18 Mar 2025 at 14:57, Makarios Christakis via
lists.openembedded.org <makchrbiz=gmail.com@lists.openembedded.org>
wrote:
> I would like to backport this bugfix from master to Styhead and Scarthgap.
>
> Bug description:
> https://lists.openembedded.org/g/openembedded-core/topic/patch_icu_adjust/111744704
>
> oe-core master ref: 28cdc0110def011e3d690da1d591076385267ef7
>
> Let me know if this is not the proper way to request this.

It's alright to request backports, just don't send the same request
six hours apart please. You can also actually cherry-pick the needed
fix from master into needed branches, and send them with [scarthgap]
(or similar) prefix in the subject (but not before it merged into
master).

Alex

