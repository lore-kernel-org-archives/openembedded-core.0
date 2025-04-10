Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99A8C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 20:24:45 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.8607.1744316682166180752
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 13:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cse2kmnM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso13615585e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744316680; x=1744921480; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pwew6ix5wiplV+cb4yYg/kAFDNs3Ne2jxWmaHctUsTw=;
        b=cse2kmnMxCsMKVlfmPf7Hrzw5G63Y9f24fOX5V8aHsifM4pe+qn0CKXYqEco4vipJi
         z6EguxtQDEA2/LkcZIjI7CDWV9aZjd7jsi7aDz/cCP0hjU4EIYQyHxKCfP610xS40OVG
         KX4evwonl+ox8YTPpr+9BQNb4ZPKkmDxob8Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744316680; x=1744921480;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pwew6ix5wiplV+cb4yYg/kAFDNs3Ne2jxWmaHctUsTw=;
        b=dLfkw5itUDDjcZPsVaKRvjaHzo7YU9PJ2kNTI8dsVB1lUUMRENuiij0SZnpDMV4Kw5
         iMlGHtlLh4iHylmcCqgkLEnzxD3Q3C9dDRJrG7gESYjVbyE4bkWiEjTz+l9iCdFJMpqY
         LRL53tpaH0EaOA545vvDueu6iflJu34tN+R0a++6j9POYxPTWKMd1p2PfLsn41RUEl7d
         p3EBgtAVEuOglEf1EjeuMgjvUaWljJHzadw3tNkRHviol49WopVvtILqGW8NtJw/Orar
         L9XoQC0lQU43X4KkZ7TaCyClQkViRu0nV7WhTtlvu65AO+CKHm1PbRtHq6IiZHE4v1ma
         f5ow==
X-Gm-Message-State: AOJu0YxIO4DYhcu8kZUIg5VyVZ47Oxf/8tsEONUvBKPNIqB3adfLt4Gw
	SUmYxc3DCGC+pDspz0ttrvjIvG9QpTMqRpa75AHT+P1d0ve5+ISqgJBvsDM7+Tc=
X-Gm-Gg: ASbGnctwZrAjF6iVnREEEF/Sd22lonDBUrV05eKjrUsa+idsTnOz1p+QTcK36H+WERh
	T6ka2Q11FkAl+sU+Apib346yIcSvHOdqsPJtHTIZGvgrND8puDkz4AWIdh4h8p8nj8+1QJLAtAY
	inpnFafHDpMnXOYQWoSL8FQKnH8QAm3fAlA/+CkFbkHMxSKGBMkbyrCgF9IGaNQZRpcx4FFo1lt
	O73g+g6gyCInRDO9qz8qExzznpsg5Z+YiRSOULL3TJriEWu0c2IO0I0TlKXLb6q4RfoosC7NM7d
	a4Ap+2+lP8rr1B/hmUgtZ5R84EkLSeunor8rqGi6KrBB/WMe8w44d1HyTkN82dAy6zA9ApXHDos
	/uan775wvl2Sv98zqRE95srUatO/0dQ==
X-Google-Smtp-Source: AGHT+IGNQ+OsWgs08mdHDmfqhhSq4ZCwAHklBPgmNiODqhHnfXtKagt/do2kKHX8KltFM3cjEgGUng==
X-Received: by 2002:a05:600c:1546:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-43f3a9336e6mr31585e9.1.1744316680421;
        Thu, 10 Apr 2025 13:24:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4e4f:66c9:fe44:7399? ([2001:8b0:aba:5f3c:4e4f:66c9:fe44:7399])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d89377394sm5707846f8f.29.2025.04.10.13.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:24:39 -0700 (PDT)
Message-ID: <0812cec0e6ffa867634da976c9c9a735a9a23493.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/4] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 10 Apr 2025 21:24:37 +0100
In-Reply-To: <cover.1744311165.git.bruce.ashfield@gmail.com>
References: <cover.1744311165.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 20:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214708

Hi Bruce,

On Thu, 2025-04-10 at 14:55 -0400, bruce.ashfield@gmail.com wrote:
> Here are my latest round of linux-yocto configuration and -stable
> udpates.
>=20
> Note: if you take the 6.12.22 patch, you also need the kern-tools
> patch, or warnings will be thrown at configuration time. There's
> been a tweak to the meta-data to have some annotations around
> kernel configuration options.
>=20
> While the functionality to use those annotations is not intended
> for this release, getting the notation in place is a ground work
> step. It just needs a tweak to the audit regex to ensure that
> comments are not detected as part of a configuration option.

Thanks for these. There are currently two issues I'm tracking as
potentially blocking 5.2. One is getty issues on genericarm64 on kv260
which I need Ross/Jon to look at but I mention as I don't know if you
have an interest in that platform.

The other is an Intel kernel config issue where genericx86-64 is
lacking something the main intel config have which is causing boot
failures on some platforms:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15802

which would probably need a linux-yocto fix. If so, your advice on
which patches to take into walnascar would be very welcome. For now I
will queue and test them on master (which has diverged quite a lot).

Cheers,

Richard

