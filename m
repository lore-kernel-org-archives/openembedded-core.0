Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C1BCAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 15:40:18 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.12495.1759419611450405191
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 08:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WzVsk3MZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-87499a3cd37so9576936d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 08:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759419610; x=1760024410; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yaC1rEngQR1rEXfZOgEhIKMJITedpgZRFTcAHVm5yr0=;
        b=WzVsk3MZ9ZyDZGNBAOPEjnHk9F0/FjU4UqcHviICHHnqbhiD1kuiwuL07PEL7rdrid
         b7GhrI3Jp/V10KaOsbmqq7Dsv5GQVPfOcJMPOWwTsPErvx/6sc9Mdrxt6VZBxFKKNT+9
         A+ryHWZCW/JkNVVplNhmqY0kcT8ViyrI1ReaoTRyYW4PxwvZLiZoQIh8js8DtBMMPoFY
         Ic2qoD8dAsOqnA9EaHlDnQ5XY9GcNmU2ovpWe/juhH+Efe7txvWC1XfGBPoMoheFULqB
         BQ0AN7anUUmTT/RpTU0Hs4As3OhGkigZTwbYNQ1HsM26dOHKg9RVnT/7f32MBrPZGj6U
         ZWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759419610; x=1760024410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaC1rEngQR1rEXfZOgEhIKMJITedpgZRFTcAHVm5yr0=;
        b=MSfnsInbnIAXQL9WuNHqZcNBRixr7bWMCEnYFLdZWnyz8ASS8we6h/xDkPTFJDCQZA
         b1mjhZNwqITtjwMxANJ461AmTafoEQwocGi1wqG7W8eGZJLTSHZpX/lfeD2Zad23JKrT
         tao12V6MIJBAJlXeLrU8Tmz81cQZOuzCTUez4JLe06lepUW3+N7cR6EAhyi+gtrwmoS7
         SmIysrzDI0xZ2bQmD2R8tWZLqPsjOZyJcXBkMmJUKF7lIBqz5FkrI5uGCn4KFc95/Dgf
         Gep+SpYjDIYkCj4/0cjnXOz3GUnBUtMxJwd7q3uDNhFEE4D56qUlVMbMnGwvT/J3ZQ8G
         qZqg==
X-Forwarded-Encrypted: i=1; AJvYcCVnt6I1OslbLOFwHaQE6DMvmVFjX+v+GO7/MZ4NLneNiUU8FH2DE2xg08auQKyY889ZESJ7aR1vFFL8N+HcRC6XnQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxyipeJvBkxjg7WucbABBKV+uk7MFr1THQ2hGxmlyY/zuLBCHnq
	VlhCJbw8IgYq0nEV3MZOrF54ihfeILLgl5vD645fc0b9j4XcWzmyQ+VgBKHXjHmXtWnRJbK802E
	qlmRaNUtxaCgHCtBnaAmqzwTB1We3Qus=
X-Gm-Gg: ASbGncv2qOwT6hKSl0rloW7KswmmTxj5viwwUZurAT1HE8wkkrxSDwUqV8i7Wx8Sbru
	B8AzO6P3Yl+B64o5PhprRyR9lCksp3rQSJkdNDef23FOZr36wGUDqVGk5tL+2BVW4G+xmWg/75J
	I3P2SSU/cg5pw6hPel/M0+PQwM59Pe1+Mh0E6d5qKsG6HSl4Pv9eSkZEPGaGsZSjH1eixTFb+1R
	jNEEA4FVHizJkrRY3AgZ4xl/8iEo78lTWgDo0FpB9yAWoV7OYg2wNKCV/CHeoSYai0dpWm6rs1J
	gQgK0392Qn04oMsuwtPnqOBIx4qcrSM6zwkyck1t4GjbPtbAUSih+puhHAOPUsHY
X-Google-Smtp-Source: AGHT+IFXsQ3eFyqJPFg1en3QdPjpSfBD8XUtWr03a2RoCCjAx6ChbFFZ/rU+CBr8X3J0AneVXu8jo5AwtfRsCCHfcSg=
X-Received: by 2002:ad4:5f06:0:b0:7ea:9df1:78de with SMTP id
 6a1803df08f44-873a704c448mr80654876d6.46.1759419610262; Thu, 02 Oct 2025
 08:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20251001152850.1342075-1-anna-lena.marx@inovex.de>
 <DD7SOFNX7NVH.2H7W150BPF4GW@bootlin.com> <20251002151509.GD3125@denix.org> <CABFt5o=k=E=Wvktmv7qPp4QQj6k+XWrfhsTc0tGjQtCTL+K2Xg@mail.gmail.com>
In-Reply-To: <CABFt5o=k=E=Wvktmv7qPp4QQj6k+XWrfhsTc0tGjQtCTL+K2Xg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 Oct 2025 17:39:59 +0200
X-Gm-Features: AS18NWBce-M1cBuibHdJ2SjRxoWBu0hv1HuRkuqSK5EgywU_Jc1cqE-q8UrLH90
Message-ID: <CANNYZj8z1==f5RiMOy0iaVcPukZwNWQQwjzPCaYnJqV3KOhDdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
To: Anna-Lena Marx <anna-lena.marx@inovex.de>
Cc: Denys Dmytriyenko <denis@denix.org>, mathieu.dubois-briand@bootlin.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 15:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224371

On Thu, 2 Oct 2025 at 17:34, Anna-Lena Marx <anna-lena.marx@inovex.de> wrote:
> I just sent another patch version solving the issue differently, but
> it's probably worth answering again here.
>
> sqlite3 has no option to disable rpath in the current version. There
> is some code preparing it, but it's commented and not yet ready to use
> - thus the hacky patch with status "pending".
> The sqlite user forum states that the `--disable-rpath` flag will be
> reintroduced in 3.51 again:
> https://sqlite.org/forum/forumpost/be3b253ddadaa9f16a9b42c41c85701ae56811159a36535ff5ee7c6c44c1ea63
> Please feel free to suggest a better suitable upstream status.

That forum post actually refers to an upstream commit that does the
re-introduction, so it's much better to backport that and use
upstream-status: Backport [link].

Alex

