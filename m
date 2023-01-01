Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5186BC3DA7D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 18:32:26 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.17336.1672597942872433076
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 10:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OoskoXZH;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id s25so27260112lji.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 10:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tovGcBEC1dP76YD/pNqKcg5HzPWLWyFDO7S4n0YTH7s=;
        b=OoskoXZH2i+m1S48YGUEzxD/Mc6Ae/QBkjstk1WicLtSPtWFKZygP7xkI2fkF3v6JQ
         57uwXLFmVdcf6bJYtUJEEyaImp5R6nBAhDVfQq0ReZQmqOXN9RtakCsD5Cqvt0vAB0f7
         825jrX6B8KwHrui64Ou9B7KxE5LTyA9Y1LYigU+sKad+cnYDuCTStWF2b+WhwmY1O90Q
         z89d94cWN4LxEhv18boKxeFhm3tZW4dtrDMeqf823shPLbMLpkzdfh0aY4yr9ebppe9q
         mWolxOOofscpjbyawnjeYaRczsFv+/Mk27wubi6dX0dYrp04gQEkMajVyDdiwCtr2vnn
         CV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tovGcBEC1dP76YD/pNqKcg5HzPWLWyFDO7S4n0YTH7s=;
        b=Np61JjrGpquImnaoW4BjMtS9vkgGp4ZFDmMMEi0529fVAp3cdxsHJKjvdunlpE57Y5
         ZM1EyyQ+WZtG9P5LufeerzWo9tkfTbdyy3eqq2AKhkR4M8R7a2kQZWpeMDK+WGrQmRpW
         pf5iES7n73KqvkXqlptrxvgQjkZBCBk/entt/0IZVEZJWk4R7eTvFwrQ2EEU811EjpdQ
         gZT+C1Ip/Bw787hOiXGAsphaQcS361AKJkFXVu1Oc/zXe7hUMF4TuSWib/zyropovmek
         j1JQFdt6ty/389vIQVpGWwfVMSVQsi/sbLjGT7r3XSfYqwnXI4sxaSd8xjs0F8XtrkVg
         jZxQ==
X-Gm-Message-State: AFqh2kqVOE1J4PgcONKTp/otcNKhmzfEDQ03L+clKpsHuvqct5Mcf7wY
	KmSMoLHsBSoexadtEClSjrIIFGMw/4tzsGiEODne7yTm
X-Google-Smtp-Source: AMrXdXuJpTHnqsRso8QTG9RxjDwDbRb49p3HvCAUM9IPrA2bxOFHXrLZTT48okchmbIMOv/JW9lLqgoY0+OsP3LH8cE=
X-Received: by 2002:a05:651c:23a2:b0:27f:af7a:82e0 with SMTP id
 bk34-20020a05651c23a200b0027faf7a82e0mr2453261ljb.453.1672597940346; Sun, 01
 Jan 2023 10:32:20 -0800 (PST)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 1 Jan 2023 18:32:07 +0000
Message-ID: <CAO5Uq5Toa3pa5Tnb1fuxLNe_PDYSAJUM4eJ5JObdeBOCQWzHVg@mail.gmail.com>
Subject: C.UTF-8 in glibc
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 18:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175237

glibc got an official C.UTF-8 in 2.35, but we don't appear to install
it by default... if I add "c" to IMAGE_LINGUAS then it gets installed,
but it feels like this ought to be default? Or even stronger and have
it separate from IMAGE_LINGUAS so even if that's set to "" you still
get it?

I tripped over it because I was trying to get the ostree ptest suite
to pass and it ended up with a time formatting failing a test because
it wasn't running in C.UTF-8.

-- 
Alex Kiernan

