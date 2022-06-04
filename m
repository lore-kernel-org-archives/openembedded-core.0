Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE92C43334
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 13:23:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.9948.1654348983094880190
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 06:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NzU/VbK0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 h62-20020a1c2141000000b0039aa4d054e2so7668973wmh.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 06:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=6mhl19AVGtNKJFH3uWHTsfY3jsWZ1HAnI/uvRIozlQw=;
        b=NzU/VbK0GnI91yThLxDLL6HJi9+p340itq0o7+AeUk/0YEpMuZZWzaAc5IKJ8hX66/
         qYsl+SmujWZUgjrKi2fTEbw5KQxNRRnvd1Eq978tDbP7OjZrIBGHd9RKyuNpnrd3yM1C
         TLfSlElesYmGNzGof8W7APZdSfJRfOXGqsdCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=6mhl19AVGtNKJFH3uWHTsfY3jsWZ1HAnI/uvRIozlQw=;
        b=soMy0C9a3BdXRDBcyhfhHWUn2hynsZQ+6hIug4ABOVIsS6zJLSpSsNyYyea49mQDDn
         UmIUPyRHptY1/Cuxlg9RQS2OYkegDmAzOO44ay3JK0QLoy36iBMnfcmdIuK+hyYfs8n7
         I5VhKFfvLRtxcEZwshuXfNFSIDW6sjVAI8483yPZ8l7FZTuj2sahPEvKE1xuPpscVbhD
         YzByDaRSyQtPfYaS5Sy0bUDS4O2PwdCk40fwF7BN7/BqJA1qbR2FDRgC8Fm7xEgiyns7
         3UpkLAaxLSU7ZiZFy5toHWZCtjDNXa6pvYmxXnSUtnhBFwTjp96i63B3QaqZxaHBvxWG
         wFEw==
X-Gm-Message-State: AOAM530/Nq3ytZwdfVBUqD4VWjFBdsPol+Izw89i1K+oUXbOmOqnQXF1
	4PpVHHjU2xVSRNttxTjhWQvcQg==
X-Google-Smtp-Source: 
 ABdhPJzYHMfogjmqaQVAXp1IchBQzC+QGm9GS2FACSrrFGplVzChpUBDfhKPnZbsfACD5WgwoGj+Yw==
X-Received: by 2002:a05:600c:104a:b0:397:3385:898a with SMTP id
 10-20020a05600c104a00b003973385898amr13602924wmx.7.1654348981406;
        Sat, 04 Jun 2022 06:23:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118?
 ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 y18-20020adfd092000000b0020c5253d914sm10297879wrh.96.2022.06.04.06.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 06:23:00 -0700 (PDT)
Message-ID: 
 <061c22b495d0d2b5830332c5258c82ee30aa67fa.camel@linuxfoundation.org>
Subject: Re: [swat] [OE-core] perl makefile race - any make experts who can
 help?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: swat@lists.yoctoproject.org, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,  Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Randy MacLeod
 <randy.macleod@windriver.com>
Date: Sat, 04 Jun 2022 14:23:00 +0100
In-Reply-To: <16F56B1475C84995.11448@lists.yoctoproject.org>
References: 
	<8f3b92e25906a33c828d61941d45a26448ace79f.camel@linuxfoundation.org>
	 <CANNYZj_+jtBR77R8pFONWjOCG31AhsSCHA98MLBV4tY7qvSpkw@mail.gmail.com>
	 <16F56B1475C84995.11448@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 13:23:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166567

On Sat, 2022-06-04 at 13:36 +0100, Richard Purdie via
lists.yoctoproject.org wrote:
> On Sat, 2022-06-04 at 13:51 +0200, Alexander Kanavin wrote:
> > Here's something I didn't think of before. Has this occurred anywhere
> > else except Ubuntu 18.04?
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14096
>=20
> I'm struggling to get the data out from the old builds, one mentions
> ubuntu1604, there is an ubuntu1804 on both x86 and arm hosts.
>=20
> It is possible this is an ubuntu specific make issue or a make bug.

Ubuntu 18.04 uses make 4.1 which is old (Oct 2014).

I noticed these patches from 2016:

https://git.savannah.gnu.org/cgit/make.git/commit/?id=3D9bb994e8319c2b153cd=
3d6d61e2c2882895e7c3a
https://git.savannah.gnu.org/cgit/make.git/commit/?id=3D4762480ae9cb8df4878=
286411f178d32db14eff0

I think we may want to mandate a modern make for both this class of
issues and also perhaps for better loadavg support to keep load under
control on the autobuilders.

I'm torn, on the one hand we need to test the distros people use, on
the other we do need to remove sources of intermittent issues. I think
this bug must be some issue with make itself.

Adding a make-native dependency to perl would "hurt" people on modern
distros...

Cheers,

Richard


