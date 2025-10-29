Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91B4CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 10:32:46 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.3521.1761733957683924474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 03:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YLJxHj2Q;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-87c11268b97so74984696d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 03:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761733957; x=1762338757; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vvYuZ4kYTQqLSmruHAiRiL5eGaZlpZeNaQeJOBCrZUA=;
        b=YLJxHj2Q00M9f0GzNAQ+kcxO9AWjj1P2WnbRHbDdFZOueE44bKbJjvPBVDg2Gd/U6p
         k1/sUkcSyUdVPUxB4OELXV8HyOG9HPao0LCae4iCvD2CeHj/9+eXRmgt0z8Tl2XNw8jd
         KJITRgKMoJPhyCRe4I+fCb93E9Unq4t0XlOE+Rq3m1JVXyfRgxDQwiiHWu32quufWetL
         2gjQNWhE6j1KtzyFgByIN3tE9+LkbKaxSXyrj/hbovtpaHhwCqXgYa5TM0s7wdKjrJWZ
         0kgC5CF5MDfts+1f9WkHo1GhF8w0HGyaSRdGz9P1Ow25XC7y76/yIrU+7cxlUfJgwYjM
         PsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761733957; x=1762338757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvYuZ4kYTQqLSmruHAiRiL5eGaZlpZeNaQeJOBCrZUA=;
        b=WGfwZ3k2A0T7STuHVFrXn0tWOlKnDVYYe4X9jPWK9T4h2PDhqXZ22izy+pTRCVs3tC
         QDj76n30Rpw1bFtzKy1UbSeDWQOpWtNs746es45xQE87ovl78wa2ZKqAdHLZB/Lt0nQw
         jOtmRaFGLvJRUf6rn458MvPwsETcbUsPP2DJew0c5JHXzQkHc6of6ev/dbuF/C0BSQ2J
         QIkEIZmwoMNDAANSgV+kY8+jvrqBYQZKa0ImNwyZ3msRDxCAjY5YfrZ4OJ/ALqtKKrFk
         cxh/mblP6yluiDHoN1egb2J20WAqQtwMq2PJrP3nU1gjj99pgP5cI0vMlzgc8LsgdHqi
         Z/bw==
X-Gm-Message-State: AOJu0YxE3YUhRxu50k5KyUYvu8/LTg48fdqyx6TilLAOrVQfowfof/tO
	gjLS277vIaTm+d5yG510E68LHPohpNIDznFtK7hQx9cAr4pJrYW68n5wJwwFebv9ZBH0bOokS9/
	PYSMS9n4B2Hs4Q21lra0sOFqvB9RBaWQIxA==
X-Gm-Gg: ASbGncsfhq+VPR9evaNF/uhfaA8dEoHfL3gAkM61Br5K6Gv/p5mvg+LAKkrX5w4FFKo
	IspTE2GCy3m4B5T6X//ScMfwP9IB8bUi+muZvdmhNZQDhsdKsA9BrddFQtjHklIQ42PBdHCKVbD
	bgSdW1modyAkTwVERn99cBrWL0wfQwDJBJYubcYWBnmPTytNMWSpjUTkMLpDgyJakzBcSnSQUSx
	plWbZGgOPEpB3ClLhqemCxRtIDtGAz/keBj2SvIrHGdsrNSAfsidnTo8EJZ0C1H5hA+jmIYoKSV
	hbt1WhyotSzjc8EujMlOmvT2wwJOJm3dH7cffKjmPZ2KYdJGBs9MEyV11YvFqbqWmug5cbEe2Es
	EB7OdTzGn8e6FUenTzuzJfvDQ/cuJ
X-Google-Smtp-Source: AGHT+IG/8BMxlXZI+vFHhNA9VO2VS9u7Ci5BCcoawXkGipFujeo1vpi1G+sEO69SpJ3ruAMGqv+UkrbBmWa9jp4w3sI=
X-Received: by 2002:ad4:4ea9:0:b0:87f:ff3b:3a73 with SMTP id
 6a1803df08f44-88009c088demr24669886d6.32.1761733956619; Wed, 29 Oct 2025
 03:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <13053c3e-d249-52a2-5186-3dd43fe8a97d@crashcourse.ca>
 <CANNYZj8k7A_BuS=f_mEpSmoS7Hz8vQVujZ4sFGcqkpzKwVmjSg@mail.gmail.com> <141ccb4b-3cf7-a867-a52a-47f89fae93cc@crashcourse.ca>
In-Reply-To: <141ccb4b-3cf7-a867-a52a-47f89fae93cc@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Oct 2025 11:32:25 +0100
X-Gm-Features: AWmQ_bkv1ch_icAhCVPDCv1m3DkPCt6ptFZ4o4K3Cr9Pid-Twd0FQsqa6abnF3Y
Message-ID: <CANNYZj-nuGJHXLzs_+Dujc8bkdk6f=ENYLvRyYPzR3YCeOYfiQ@mail.gmail.com>
Subject: Re: [OE-core] what is the point of setting "do_fetch[number_threads]"
To: rpjday@crashcourse.ca
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 10:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225442

On Wed, 29 Oct 2025 at 10:47, Robert P. J. Day via
lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org>
wrote:
> > I guess you mean BB_NUMBER_THREADS, which limits the overall amount of
> > parrallel tasks bitbake runs. The do_fetch thing is specifically for
> > limiting fetch tasks. This is useful in situations where the build
> > machine can handle lots of tasks, but the (broken) network cannot, and
> > so the network access has to be limited to something smaller.
>
>   oh, i know it's for limiting solely fetch tasks, but if the (broken)
> network can't handle concurrent fetch tasks, would it not be the
> limiting factor, anyway?

Networks are often 'semi-broken'. They can't handle lots of fetch
tasks, but they can handle few. So by default you're going to get
fetch errors, but if you limit the rate of fetching, then it will
succeed.

Alex

