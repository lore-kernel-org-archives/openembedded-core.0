Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F058DC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 14:42:28 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.23873.1702564941900765612
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 06:42:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ILFgJFM9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40c2718a768so79806985e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 06:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702564940; x=1703169740; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBlf9nwJpHD5NteGR9a12/OHi+tXQ70lyUaTsBUXmTo=;
        b=ILFgJFM9xpTV2o4brQa7/N+Jpwanoga8GbpNc64Qn5nOR+Xf5CpzkEUZn/Ti5ODqCv
         gLEKzax0xQ2P5YVDMYXp0+6UvGj0z3sB97idYLhGHWlpoDQtR4Gugda4ydstvf3uNJUN
         Lew8RK0cQTwxJIbsCYWmz5GELLvZopQ4eCseQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702564940; x=1703169740;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BBlf9nwJpHD5NteGR9a12/OHi+tXQ70lyUaTsBUXmTo=;
        b=EiRAMTFq77XngyetkB9WG2i5807rLtAgYn84mIhJmyOzV1LvqYakSDPypgw1klhcCa
         f29IDTjPaZPilyrUgZiPPAqYbFZG4bHX30ZZ5snrXITxz+sNKNc5R0vIZcO9vHGWYLr6
         VWGqyv0ncSL0YmbCzb/zkhtwLmIQ+IVgV4vk3QqVrwH64l0npRtUpcXWOxGHS0tDRJ3p
         NoeJmLrtYXvDhppYwoq1FYhSoSr9m7VbbLKWw7qhKzSGU2z8OikU6oQNsBAOkSAKeCmm
         fQFah5Sa+kjLMYBquzKDpwMcr7639oH8EN5HvPbd94zajf5at8+8Z4StSSvJjAwcbap+
         +1Ew==
X-Gm-Message-State: AOJu0YxR2IHm4C7ltRIWnI5uYivlp1j0QMXm+IvNXwfRy9+kdCQiJoP9
	8gigmjFNVJ8YnJm7r80HoZ5wmvGmpjJSe//ThUo=
X-Google-Smtp-Source: AGHT+IGu2zZ7z4CJtDyUdoaeT83F2nfECEaw7al5VhrWGMjZIxDRNioWxDmDkxBizJSyvyP2mXnjoQ==
X-Received: by 2002:a7b:c7ca:0:b0:40b:5e1b:54ac with SMTP id z10-20020a7bc7ca000000b0040b5e1b54acmr6130534wmk.56.1702564940146;
        Thu, 14 Dec 2023 06:42:20 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e972:7f32:1182:98d2? ([2001:8b0:aba:5f3c:e972:7f32:1182:98d2])
        by smtp.gmail.com with ESMTPSA id fc7-20020a05600c524700b0040c44cb251dsm17398369wmb.46.2023.12.14.06.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 06:42:19 -0800 (PST)
Message-ID: <fb2ed73c7b5022c87b0e6e156e50a39dcf470c66.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] usergrouptests.py: Test that
 postinst-useradd-* run in order
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Eil=EDs?= 'pidge' =?ISO-8859-1?Q?N=ED_Fhlannag=E1in?=
	 <pidge@baylibre.com>, openembedded-core@lists.openembedded.org
Date: Thu, 14 Dec 2023 14:42:19 +0000
In-Reply-To: <add845338f015b4fce34a9e68a7be4ba304d74fa.1702401361.git.pidge@baylibre.com>
References: 
	<add845338f015b4fce34a9e68a7be4ba304d74fa.1702401361.git.pidge@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 14:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192388

On Tue, 2023-12-12 at 17:17 +0000, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=
=A1in wrote:
> This tests for 13904, that postinst-useradd-* run in order.
>=20
> Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibr=
e.com>
> ---
>  .../selftest-users/asecondgroup.bb            | 31 +++++++++++++++++++
>  .../selftest-users/bfirstgroup.bb             | 29 +++++++++++++++++
>  .../selftest-users/cthirdgroup.bb             | 30 ++++++++++++++++++
>  .../recipes-test/selftest-users/groupdep.bb   | 25 +++++++++++++++
>  .../lib/oeqa/selftest/cases/usergrouptests.py |  7 +++++
>  5 files changed, 122 insertions(+)
>  create mode 100644 meta-selftest/recipes-test/selftest-users/asecondgrou=
p.bb
>  create mode 100644 meta-selftest/recipes-test/selftest-users/bfirstgroup=
.bb
>  create mode 100644 meta-selftest/recipes-test/selftest-users/cthirdgroup=
.bb
>  create mode 100644 meta-selftest/recipes-test/selftest-users/groupdep.bb

I ran this test and it passes without 2/2. This worries me a little as
I was expecting it to fail until we fixed the bug?

Cheers,

Richard

