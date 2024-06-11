Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B393C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 12:20:46 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.8108.1718108440985479236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 05:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YSopfD8m;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52c84a21b8cso2174596e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 05:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718108439; x=1718713239; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QT2v0rLvnz4inTqGXMYFseRl5aviJ4BaLT9O5qZshJ8=;
        b=YSopfD8mC8nrj08Dk37SDJZVaQQjYPyaJOeUTVtcyExf1vCdvV7PEw9OoxNyzVtvFd
         urKSWwjSOx0UPfPfB7LoMqU44gCXDKmWHlpDmuYSusWiVnG00dfa7xVphWwvUw4RUgTd
         qrhjAuNifgqfYuZY1RzDb6xt1jvyrcqV0VugYKyUT8y7A6q7GwttjGNb314i3mJZ9686
         tfey3PjfFgbfsJTAGCYalL/6zLjKBVeELUNHOLZRvuKkQegPibcd1dSvLbRjqzgl0jyb
         kYx82fhyfH1gfAToMxl3C0WscK5ExHiw8xF5SMHpW1C+2IihNCJaZXDaJ5wPFbUJDaxC
         Udng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718108439; x=1718713239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QT2v0rLvnz4inTqGXMYFseRl5aviJ4BaLT9O5qZshJ8=;
        b=eNjQctfRFttwgoiXmPukP28QPSY3HVVCMKWeKpYrPMJ2t9yrwL9hXhqyGsj504o4It
         LBbnOjiL7tNPoNUj23xr79RtLvc3KlrOJ4O3y5ranLH73oQuy4NGqcfRtI4JCZu+l8d2
         hRilLmn81VJd2b6nQv/yCvY7covWSNOMAoNepdEs2lWam3I8m1yjdn5DUx1r7/aTv3fQ
         QXbTSZG4aSQAAqulw9jFzfQJ8L8NAow6sdzP8MFdUdKnOpICsjIuSMaY1dfLuX/uhyox
         9sYZGcipMYDmWnbikwWt1RO7JkQQISbbLLOkIKC2bEuCKcq8AB0WP5IAYTL55lJrdyiI
         4Bcg==
X-Gm-Message-State: AOJu0YzxNOZJT8VyPTFKQ8WQMyIVr5XLDth7egcxTBOvWv4STz4VuTX9
	i+CuuVtq4Xs494DpbzkEEW74lGlTQwKtp/MbKElKgHgofw37+zOv9uBn/hzCwFkidihHT8DEM4Y
	/w4K9YUR2rNJZybugogQ+FcNKOGVfHA==
X-Google-Smtp-Source: AGHT+IEqAa+rPI7fU+TjVfMpUxxde65P6Dy2ds74zXwQ5wBLg29oTQFWB0hK0yWMwOmr5KUcNeg2F6gHHdEYQsx9FSo=
X-Received: by 2002:a05:6512:2032:b0:52c:8daf:da1c with SMTP id
 2adb3069b0e04-52c92437876mr642609e87.20.1718108439016; Tue, 11 Jun 2024
 05:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240509160843.3283186-1-alex.kanavin@gmail.com>
 <39d85fcd4e6a1b4bd439fdd7654b64ff69d4e646.camel@linuxfoundation.org>
 <CANNYZj9Y=TjdofvxL32rWqPVZ9xLyryA9ic=FFeq+XveJcx7mg@mail.gmail.com>
 <43d73fb614b0d43974169a0f01f8837e08afcf5d.camel@linuxfoundation.org>
 <CANNYZj-Qfaw6OPSoxLqv2HKa3ZTNozcfNnTfqyDqwtz0Epgh5g@mail.gmail.com> <2fe6e65a146a3ac281fdaae030c943342f7262ef.camel@linuxfoundation.org>
In-Reply-To: <2fe6e65a146a3ac281fdaae030c943342f7262ef.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Jun 2024 14:20:39 +0200
Message-ID: <CANNYZj8=nSE3WZcJMhgvdBzkHweOEmyacmsRFSbqw_-w8wLgFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake-config-build: add a plugin for config fragments
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 12:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200508

On Tue, 11 Jun 2024 at 12:56, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> oe-arch is the right place to discuss with the OE TSC being the
> ultimate decision maker if needed.

I've written a summary reply to oe-arch so that we can continue there.

Alex

