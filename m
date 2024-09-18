Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A248CCD19F
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 11:17:07 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.12655.1726658219772039869
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 04:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KJ2E90N3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-374bd059b12so3472960f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 04:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726658218; x=1727263018; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JNLKcry38EjmjEnUF0pFdb4yxHCSarc4Am2cfio5c4c=;
        b=KJ2E90N3QDKcJwhBqWp7cW+6v9J/+oU5IpUHjHkRSYkvr5x8CBOd6AWidYgBFpqJQb
         rd01ffTyS2JBhLGVuJm2GjVW+j5LwqSKlzGT16JiBAND4D2iIzIUXxUxj+00RkIsfhas
         JXQgqoaL8hBMUWMhDOhud8qcr0ihM1vyZi9Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726658218; x=1727263018;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNLKcry38EjmjEnUF0pFdb4yxHCSarc4Am2cfio5c4c=;
        b=YjzZdK9v0bkrWpNNjlGTdJfJOOYTzSdeJMnClxXuNzQUONEWNDCOu05HmaY94SeQu3
         opQMWwtXCAIU7V2+9X/UUESqxyILPCZNTwqCNJdmsYPw81DI1cRNrViIhidaY3Ql7Ien
         vqHUJzBb74G8obu1inuhhM31wqw1ArqQ3v9ByODLd4SN/2txnMA2ItJ+OyGc3DVtFykL
         qd71XOc+mkLpgfL1o98ZFUI8GTDGLkIN6Bd4N6FpRckxugKR8LdQvtwnPC8A00cjHTPX
         VjbAbSEpiBwDx3T5ctxkwbZOGYT5bpcewK8MwDUutVS0b+FQe7hMF00B2HOdSNipDtKS
         oTZA==
X-Gm-Message-State: AOJu0YyBo3CbAlTsKtE81Jgla9jnvdGYMT8mAh78bnw2YC8FG4Bv3d4Q
	OAtPdw3odVXhnR7001f4kkNMI/iD5Rmhe/t1GJq6EMh3/sSAUYvpoi+u5cyvHiIh1Xl3o26rMB3
	j
X-Google-Smtp-Source: AGHT+IGU/vfKEF1GdGknW658STLM8CiAD0jmmQawfgv39BIug6I82MKmp/TH27mFVeJ2GshKiNatlw==
X-Received: by 2002:adf:e80d:0:b0:375:48e6:f30f with SMTP id ffacd0b85a97d-378d61f0bcemr9537621f8f.30.1726658217559;
        Wed, 18 Sep 2024 04:16:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:84e0:f160:18f9:5089? ([2001:8b0:aba:5f3c:84e0:f160:18f9:5089])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73e81e2sm12011881f8f.37.2024.09.18.04.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 04:16:57 -0700 (PDT)
Message-ID: <dc8deba20a5d6f5fdc521415df9427fb8ef8576a.camel@linuxfoundation.org>
Subject: userns issues on Ubunu 24.04/24.10
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Wed, 18 Sep 2024 12:16:56 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 11:17:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204641

I wanted to give people some real world data on the userns issues on
Ubuntu 24.04 and 24.10.

The advice has been to create /etc/apparmor.d/bitbake:

abi <abi/4.0>,
include <tunables/global>
profile bitbake /**/bitbake/bin/bitbake flags=3D(unconfined) {
        userns,
}
EOF

and then reparse the config:

sudo apparmor_parser -r /etc/apparmor.d/bitbake

This "works" to a point however we started seeing weird failures on
some of the new autobuilder workers even with this applied.

The problem is BB_SERVER_TIMEOUT=3D60 the autobuilder uses which means
task execution commands may not be started with a "bitbake" command but
could be started by devtool or something else. Those don't match the
glob above.

So far the only reliable solution I've found was to effectively disable
the userns restrictions with a /** glob.

I wanted to try and stop someone else scratching their head over why
this fails.

Cheers,

Richard




