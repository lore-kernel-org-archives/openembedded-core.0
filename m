Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E9CC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 06:48:27 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.1853.1743576504155017556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 23:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K+7xmbkD;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e8f6970326so58381026d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 23:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743576503; x=1744181303; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0ksXIvXwE/l36DgMggy0nhF9NL/IDF7WFuaKUrtRr6U=;
        b=K+7xmbkDnfmSsv188L6JtZK/nqVVzcLjjFeVGR4AMHAbeQuKQ8bRWOJEJRdft/yv9v
         72jxNL07c5JFTDchBXhkqZjD+x/CGaUBZYOLZPUTqQiUpN/5ty2iJxXe1N/BntoVxF0x
         zw3V+DIjEV6kA3nZiavVhRWRXddn8zhqz93tnTNz4t+By6RG0mke86suJsmuj33iCFi4
         Z9ZefuqatWT4waWKgTuwVNg0x/GafCDDUv5WW6+TPvV+34g2SRoZFLWeVwicjxEZT/Eu
         JmuOsguaFhTgWP5Xb/+IWx6iN88N34N2QyT3w4CFETjO+R8nmH2CoYMNl7fkD8TLJCx0
         SuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743576503; x=1744181303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ksXIvXwE/l36DgMggy0nhF9NL/IDF7WFuaKUrtRr6U=;
        b=FzCeR1ON70XRtG9P2WvnPSaiJiXLMgh6lf3kfaz/r3gmEtbOL44gmaLTQ6z/0NfwuR
         2hmhpCFNjNpmwTvVhdLuXD81crFMLfihEZhzQfSFldCr4Bq5omlCNkzE22Ghg5VDjn/g
         3GdbQyTXXlE67QPV3+RzA+Ksj+J1g8ku06zo3uqcTNU5udVMLt8xv8PIvS0LBftAvhBS
         n1ofRcARNRJ4m+G0tHNhSl/fNXY7b/7O5aElNJyc0ZKG6QyMin3zP1x54pvQbzjtfAej
         dQE+Q00bBxPnIZ47cpxBwOJ924/GviWZg4jiIzwGMf0Q393CbWLcvQLGgUwEaITAALYu
         uqsw==
X-Forwarded-Encrypted: i=1; AJvYcCXYb5zH6fz9CQnI9OYVVZy4xhLVD+VsWE8AA26kZmzo77oxb4x8Tym2D8FBpUl37LioBqC4mhdWhf//J59+D1pLiQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxtQuUgMPJFULiz4grLg0aLxTzt9HzVEy8uxFoU8NKGPMWMeL3E
	/1SiLnS15+RWuT9cY/WJrSMUnuD2afifqlDLeUy/pELJ46YqpP5GY/LHt1AHStmHHjXkUaUlA+j
	e9dUmWv+jI+OrNMpE6bySPp83wMQ=
X-Gm-Gg: ASbGncsVD141pAr8sCrTw/4y3ZYT0LO815cKMbeiPccUpJiL315ty3soUdw7CC2Fb1g
	+mRY/j4FavGjesQFLLIj4rdltCRl90ydI4cvvCwn6d2b/wjmY2SucRAbgozNNX7uoapxFCVKsWK
	3fSMl8IlagBk6T3V+3Yjb6iZ6lApUStem0Hdhg421FFBSxs3pWadixWGSad0XG
X-Google-Smtp-Source: AGHT+IGd9R3Vx1hCu7Ni8+2HmPq/OeKjpp+gcnHdQ610bkN5AID12NPXVgCupr2p9XZxsLh9yB1qjtatTHkqkW9N2AI=
X-Received: by 2002:a05:6214:1948:b0:6ea:d046:bcc9 with SMTP id
 6a1803df08f44-6ef02d22110mr17563016d6.40.1743576503232; Tue, 01 Apr 2025
 23:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250331064844.2155-1-leimaohui@fujitsu.com> <D8UCORYIOR2I.1Q2YNS35P7HHS@bootlin.com>
 <D8UCSOK7M0KD.2FXD6KPWVXD95@bootlin.com> <9bb20616338ddfa915a7e2457858198fa4bdf6fc.camel@rpsys.net>
 <18325E1AAD0415AA.16050@lists.openembedded.org> <TY3PR01MB110569F4DAA67465F79B56CA7A0AF2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
 <18326D6769124EA9.22698@lists.openembedded.org>
In-Reply-To: <18326D6769124EA9.22698@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Apr 2025 08:48:12 +0200
X-Gm-Features: AQ5f1Jp3fHarcBqPcq38T39kxqlCGPtvylZytX6NCTQl7SLhCr9JGkko-lUPGxI
Message-ID: <CANNYZj_RHa7LJ6K5Cmv==LS=6PQ4tqOyFkqOrQbYBy_35jLCTg@mail.gmail.com>
Subject: Re: [OE-core] [Patch v3 01/10] gst-devtools: upgrade 1.24.12 -> 1.26.0
To: leimaohui@fujitsu.com
Cc: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, 
	Jose Quaresma <quaresma.jose@gmail.com>, Anuj Mittal <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 06:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214172

On Wed, 2 Apr 2025 at 08:45, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:

> You can see from these links that the fix is to add '-latomic' to
> linker flags. And indeed, this fixes the issue, until upstream adds
> auto-detection:

And they just did:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8637

It's better to backport this, as it will fix the problem on all
affected targets.

Alex

