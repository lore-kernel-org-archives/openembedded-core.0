Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0C5EB1050
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 11:36:17 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37837.1773142567417222395
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 04:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DYF3u4nQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-89a1347051aso133200706d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 04:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773142566; cv=none;
        d=google.com; s=arc-20240605;
        b=ACCqOg4nVriWtg0QaTaXHlluj0OmYtEIGwjllrmZmWGsC0RUD5gNL7BCJgOjCmF6LJ
         jM1uztCHoOhql0AMAoGWq91qvv7SdMEMMvNFcJlmkv5ocVx1KY+UielM3PfnS7KnmE0k
         XYAO/BU/dp2s3M6QXskrQUVMrGkO4F88O1wJ1gUThlTCEF9IMDtKhanh7aht0xKu8pYI
         Q96cZD1W/rKrKkrxIIpjYZCUd49Vqg3bmzF7UzLeZNpFr2iKFXZRMVErm4m4PwiM9k90
         3iPNy02Qu+GNOltaIlHO5NTmImTaTGtrNcZHngsIMPRZjAX59LV2r2uCC/e5kSwvsCnJ
         nJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v0BHOpDiowZJQ9tt8n5a779z2u7NI8/CQBRgO0SsKC4=;
        fh=m0KzizRN+ZFswMf/rn28LzT7eZcaRkm+TLLaIfU/Nt4=;
        b=PLWGxxxnVszIs8+6LYuuBeM8qpLC1KJfPzb5iuTR4IvUf2EtTLrCAxXoIw+VmKopWz
         +M9VejR5wDpCacDK1yha+sjcZoED+S8Xt8WxFseli1cMclEwbUYxfV9esZwO2FXF6Ozf
         XBKvCa1yiOHBsPb0G7wNfQXxLKiyhCCTtT8CIhdNElEjKAUoZVF28jQ0vCF5M4/E1bQ9
         AUQAFTlQSjgpZPX9iOtkekkszsesjE8Qp566hZhF2DBcUS9JOEJDzkneb/uWvDJlVkrx
         ptFmMZCfi6uveUMssjh4fmb9VfxGelVjkYD4Zwvzcqu7pUVM1InrHYOjjzKqkq1OmtG9
         V/6g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773142566; x=1773747366; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v0BHOpDiowZJQ9tt8n5a779z2u7NI8/CQBRgO0SsKC4=;
        b=DYF3u4nQit710xXcbia5K4hf4UgRnqCWxI28nW7EsS/aJjHuFjhpjq+QbHRJo3HkbF
         Xbem40KY37AXSeINMW8x4d9Qx/vhQchJIUWmrB7JM+STA8L5C+hBMCROgdwGgKcKePOc
         tIAQhGVD+60mX0b5k2XJymNAmq9xrVjjJvjpee7+nhK61qCx7WeNXRuAStIqLXysMjZl
         jskDFnKaPA0ZEFMPZKQSjE4tjlvofOH0FSOY0bZC0QFwjMj3vF3yyWoS1Fdn/x3+AT5Y
         0TxM722zkGz1MK9oCEYhYRcCgxkpMQ3Wv5P02z0+27B9RzF/rVfPEQ5w7DH95I7Mks/C
         UQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773142566; x=1773747366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0BHOpDiowZJQ9tt8n5a779z2u7NI8/CQBRgO0SsKC4=;
        b=nNHZcCnxF9woY/8ZbawYao3lnLpsmdJJd3Rp0dgAO5s9ShsB5A/IPlp9hVSOBrRsHv
         YJ0R73+Gc69szT7a8G97heKwWGRU2RnxCx7TYYOm5Rum2gh1IywMFTpdToqZL5QxOmyG
         kLvRh1bCAWIbPPee4s+FPN0EO0h3UAWkBGlEWsib2kR3Rqm35XlWfhlJo7Cvcv32K6Lc
         W/RkH4k/pBjrwN1XwTESkhuuM03idJj1ZNeJJAwo5H+1PQnBrVbcI0C2504ACfArB6Ye
         n+GcesSogJdATZaRg9JJvlKUXcGmuxpvYfSpgzGZrWGWSzIZElqisU8GlJyOak1cLDug
         Lrvg==
X-Gm-Message-State: AOJu0YwqoWCoxb6F2eHEuLhO3hlJ4Ec/fvo8SulfQTpF2EfZFrg6WIdP
	9ySqgVdDRIoi/vQLS6jDUT5dIjqgFr6nib20fxBZYJ1Dt50YJVW1US90d/13i39Otwit+zD1N6I
	7xURgJvPFSosoRPv6qQ3zSwJ71WTrOu8=
X-Gm-Gg: ATEYQzyKiHSuSSlc7VJDE+piQaoC/M8RFFJv7R5APLIko3LDR+5NmCOgNJymB+s6KhM
	syCWdXzahiWzhXtGax4tZdNRylYtXXH23qg0TxC6o2RfIn0lvFt09IqUEgDMjfaovZhXttDD3pg
	VivNngwiEXBGIfDeXo4Qn3tc2SgCXxOJ1faDzEwv+QyWldVhpk22OKw6QLzma9vbLIwJPsip6Mk
	f3apxiQOt3PTFkXejaOfbyyzCPIVpz4DZCHj8RhiiF1v0dG0rYpEIypi6v7KJNdw8lLSKakop6D
	2OK03KRMtR+HX+7K54atqHhT6HN2FYzHk84Z8NhYBUHV3mtVdtxn
X-Received: by 2002:a05:6214:21c4:b0:899:ecd9:22be with SMTP id
 6a1803df08f44-89a30c36ff6mr211020486d6.67.1773142566468; Tue, 10 Mar 2026
 04:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260225033725.708-1-liuyd.fnst@fujitsu.com> <CANNYZj_JP3pWfO8=MPWBD8WiLEgr8SAcjAdM-ij7Ysu-3bzWeg@mail.gmail.com>
 <OS7PR01MB1444484634209A3F18545AEC99B46A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB1444484634209A3F18545AEC99B46A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Mar 2026 12:35:54 +0100
X-Gm-Features: AaiRm53l1EsthOciVCsBkRlOS4KD0FdD1RT_t2JwAGicikmORJ7suumIpz0dVNY
Message-ID: <CANNYZj_Q4GVbpBn4czN=oM0RXsn=tDt-64BWowNNh2_L7muv4A@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] orc: Enable hotdoc to produce doc
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232771

On Tue, 10 Mar 2026 at 06:16, Yiding Liu (Fujitsu)
<liuyd.fnst@fujitsu.com> wrote:
>    How about change this line
>      > +PACKAGECONFIG[hotdoc] = ",,hotdoc-native"
>    to
>    PACKAGECONFIG[hotdoc] = "-Dhotdoc=enabled,-Dhotdoc=disabled,hotdoc-native"

Yes, this should be fine.

Alex

