Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B54FC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 13:52:48 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.41754.1656337962431564300
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 06:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zxxxs+GZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id k22so13178121wrd.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 06:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:content-transfer-encoding
         :user-agent:mime-version;
        bh=oLuZlkh+u6knVfPhc45oCDrfgsjqBSCjp0tfR1zvzpM=;
        b=Zxxxs+GZT0KRV4+WI87mCr5YIFmXj0PAXaOKkAmrr+AuchH553RJxJMvQqoWcvo50f
         PQDHEl3LavMJh8V//UbcjiDAzReGDf9hU03/Drkcz96rYs4KQEqlW7z3Pdzfz6XJfKG8
         xTQvd8gdH3vOMslJKdNKhE0uNFcIZFL8u/1is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date
         :content-transfer-encoding:user-agent:mime-version;
        bh=oLuZlkh+u6knVfPhc45oCDrfgsjqBSCjp0tfR1zvzpM=;
        b=XLHzR6vutuiAoqgNgPvV+CuaUH3Ve2j1em08eGLao0HZ2D1O+nGXHlezt04+4Fz9XP
         93tK8Up66/S/2G2ipRwjxgNNtfSL6Df3NAPOSLUrFjxQdmUd8TSlRisMke2jAPiq3IQC
         kfXe75FufZqZR9NLYB4p5WNvh8ksUVoYaG+vjmlOLw7aqdFM+eIhQIjZrDvpiqHtaI+L
         tGfTeymYPtIPzY9hTRGVVWKCoGPX5UnAoTGaG629dRgNdzN/j1HY8uI+WVz8AQHM5ewQ
         5+1EPLedi65EEwtcsZbeV2KG7PL0unOO/a/T6i4mtTvcnqVAg7wU+/z0aAMon9Fyfwhe
         hgZA==
X-Gm-Message-State: AJIora9YpDZwBwevE1pJfP+jflpRSbi/4TQz+xH06Iuv30esBYojJ6+q
	b6gOqCW3p2w4wtLtkDWz9t7qh69LnVTJ/Q==
X-Google-Smtp-Source: 
 AGRyM1uoGl3YW49v/v315Kl5ixv/SgIaUuj+gsC/Hg7vR/Zr9Mrvhnf5/ucmw5ggTTs6G5SMcCRkDQ==
X-Received: by 2002:a5d:504f:0:b0:21b:a39f:7e6f with SMTP id
 h15-20020a5d504f000000b0021ba39f7e6fmr11940350wrt.129.1656337960389;
        Mon, 27 Jun 2022 06:52:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8950:ad6c:6fd6:5033?
 ([2001:8b0:aba:5f3c:8950:ad6c:6fd6:5033])
        by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c501100b003975c7058bfsm13409558wmr.12.2022.06.27.06.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 06:52:39 -0700 (PDT)
Message-ID: 
 <ced1bde4cd0d5ef021c13088ffe4fd522648811c.camel@linuxfoundation.org>
Subject: pseudo database integrity checking
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jun 2022 14:52:39 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 13:52:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167322

I've been worrying a bit about pseudo. Since we made it stricter about
inode mismatches, we see a trickle of reports of pseudo aborts
(fakeroot tasks showing exit 134 which is SIGABORT).

The issue occurs when a file in the pseudo database is removed outside
of pseudo's context. The inode stored in the database can then appear
as a new file, which would trigger path mismatch errors.

Since pseudo is an LD_PRELOAD, even getting a sensible error to the
user is hard. The error occurs in the pseudo server process (which has
the database) and is reported back over a connection to the library
code wrapping some libc call in some user application. All we can
really do is abort(), we can't print to stdout/stderr since we don't
even known whether that is available or where it might go.

One of the worries is about build determinism. Rather than randomly
hitting these issues, could we hit them more consistently? There are
two and a half ideas I've had there:

a) Adding in a startup DB integrity check. I have a patch which does
this, i.e. when the server loads, it just exits if the DB inodes don't
match those on disk. The trouble is the server is usually spawned
through some application making a glibc call, so reporting any sensible
error is near impossible, we can just abort(). We can put a decent
error in pseudo.log but that isn't something seen on the console,
particularly problematic for CI. Locally in testing, I do see
occasional issues with missing files /tmp/ with this.

The second issue here is the server startup retry code. It takes pseudo
about 80s to timeout startup a server due to the backoff+retry
algorithm it understandably has. bitbake sits looking confused during
this time (no tasks running) as the worker processes never report in.

b) We could add a new command to run an integrity check on the DB to
pseudo. If we do that, we would then be able to show the user a decent
error and above the timeout issue. The question is where/when to
trigger it and whether races could occur against the check (e.g. where
multiple fakeroot tasks are running in parallel against the same
WORKDIR).

c) We could add specialist code to bitbake such that when a fakeroot
worker exits with 134, we dump the tail end of the pseudo log if
present. That doens't directly fix the issue but would help users debug
problems. This does come at a cost of making the bitbake code pseudo
specific.


Unfortunately the position of pseudo maintainer is effectively open, I
know some people have expressed interest but nobody is really working
on issues like this. I am open to people's thoughts on the ideas above
or whether there is some other approach anyone can see...

Cheers,

Richard


