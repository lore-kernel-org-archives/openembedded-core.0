Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD9CC43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 12:59:27 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10245.1783947565741425723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 05:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JFi2vcXl;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c1372f84dso21989631cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 05:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783947565; cv=none;
        d=google.com; s=arc-20260327;
        b=afC2C1kYT8ejihnDoG8L6YUoinz47/vgtqs+jOCYb/Y6O0dsfu3D/yQqu4pw57dhM5
         v6SK7zqqR1gyxcbC4HeME+m4QdQD1TRaEcUErS63lOS+b0KwuodjqqhgNda/x+rPSsUd
         wLGKEjwkRJGnNtruRfpqGtBs8G41zpGoso9NnxO7GddJ4CBVu9bpFyIhyefNy2r774nj
         MGkikr8KKQaqFiQaJjbaP+m92Y9s1L90M+zdH+rNWbClBFod+wBQCf5h/xTSLvQ+DotI
         z2j9hhe2j6MNISpcZ5JRu0KlDapv6K8hHzDstqF3EDx0o5Yut0SsQ+XdHCODMUviN6vO
         AV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0e9tXEGX4DQFt7MDwqnaisSlZ+2zRZiNkKwhM1r0Beo=;
        fh=BfsWvjZvgXaStClBpDNu35+4JHSxlBx4uH6yv+xp1+s=;
        b=YIbjViTf9qVeC9iZJmMLadwE0blObjM6rHH91ilbvXAN9JRxEaKxjL4y0zlqA9jSSK
         fEhN6l1cbjmB4076HI/WFOt3WEEkLQ4blmhxn1rfg+2Sa4x7ILx+SbbBWfUcoUC8qNgx
         /QZNnJyk4Pc525WKhjxEqXxdAioalgC6V7fNHyfLgxbwamPkJDGr3TpfLWh2NNxmawL1
         wc2OIaRIlB4xPJXY9eE/WHXgNdU9qwfd3/fh89n25zFgu/cX2nIPWMmc7KyiULswN+2h
         jZaC0KmNh4Sny6VRDxNWSYpBGyR8upbW0wk4FP1Vvt4h85YA5jrG6dT3QXgapQnXjJnC
         co0A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783947565; x=1784552365; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0e9tXEGX4DQFt7MDwqnaisSlZ+2zRZiNkKwhM1r0Beo=;
        b=JFi2vcXl8s8gE0YnqdrP5FkrKmzH366I9yUSU5MHEpIaq+pruE6ocYPS4N7ZVWgkyM
         WT7banvomRXGtAp1X8ECPGnt5eIzWY0U3bioinMHHXzFY0ZdVOSikZC97P5IqeCKW4Ps
         bY0yWLx1uBtv0pi/TzukZf8wC1EiR8KublZUguzwoztQCbgOElmA1EKl8WsJAtdM+8DI
         QQzDwLooTyJ+1szdEQbUhPMPzw9MEmZ9+3DCEqqRuQjYJHtoaf+wTvTEZwn8h3wRvuj8
         kkK3Gh/H/EbLhXq3aqScMAM6ZMCrxbTbKRHCot6oiJS6ISe6/pPOaBA6dsHGf7H+7hiZ
         akRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947565; x=1784552365;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0e9tXEGX4DQFt7MDwqnaisSlZ+2zRZiNkKwhM1r0Beo=;
        b=FKVfZI8XK9brsW+G9b7Gel4W8puJ64EHUGHxauoiRgzTVLA80eW5HjlwHSxkvqvlFC
         iYzz+XBQzjYn2ioyPXuRoFDcvQ6HOIAcmg7Ajd0+wLrwxp3NVm6CIc7wmwGwoGK5Fp3i
         6pATiKeqeNuxrYJd+JkmN6TcPj0Y6lXNU/2tHhQ0iZlOADBz9Af9lvWGicg+igs2mCR7
         q/0Dj0dH1EAoMycC+9DXyeKyFuf9JBha34DGRM0RiCUPV7vP28WXUxPUtfqqZXas+RFe
         dPRxKQ1S1I0S/tUZUwgL1rmQZoh6/WKrBdPWVrZA9JoIXxOKzq10/3wzUOoqiI8hHhb6
         1PUA==
X-Gm-Message-State: AOJu0YzoT/sVFbQ7SnGc47wFqTK0bgTf6KVYU+/cpgUkWu2uXJK3mkA2
	NAoDd0HAtDs/xCIP3pCrssswEXNjFnbuPsaEzZ989Nd6HEZy3XTgOKjA1iOKhpv4W1Dp8myMuOt
	dDA7Y8CTsUuJRfKrnUdDRtIsFPjWtBJU=
X-Gm-Gg: AfdE7ckoGIDnRsznu8p7c8AvjF++02t7+BJ6ShE8d5IyQdgCn2Oevj+4iWcA56VKtW0
	C3bJ/QPJMBK1K7wWCpX9EWM9B/jkqN3OXcyWHYQXju7Heg7boRjf0deOmHkHcAQiu2D95OfIeWx
	6qFWXSpb+wGaCr72C2IBStftd3tlp35X+060UjNzNRAxSo6fDEtz6fwTYQNTrGVH75BFFIjgxLs
	kjhvxfvCCmfc/O1WedO0mh/UY4BXBbI2myMIx7GzT9eMNGWW59i00ayDIdD8OWGxqJdZo3XJkiS
	HB9ZmHG0uqM6J4jWeU4rm/H+1BW0Qms=
X-Received: by 2002:a05:622a:1f8f:b0:51c:7b12:5ffb with SMTP id
 d75a77b69052e-51cbf4068b4mr81485331cf.87.1783947564521; Mon, 13 Jul 2026
 05:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260710185207.3999639-2-yoann.congal@smile.fr>
In-Reply-To: <20260710185207.3999639-2-yoann.congal@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jul 2026 14:59:18 +0200
X-Gm-Features: AUfX_my-vQNv_naCNeQp6oX8iA56_PpIVHfg7O61tBAPyvi4fKop1HUeH1fucgc
Message-ID: <CANNYZj8SEdTeTZDr5dyQfMxQ5cm_3CcXEc_5Vs22tYMP5Tb8Og@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib/oe/patch: avoid duplicated "From:" in
 generated patches
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 12:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240839

On Fri, 10 Jul 2026 at 20:52, Yoann Congal via lists.openembedded.org
<yoann.congal=smile.fr@lists.openembedded.org> wrote:
> With this configuration, devtool generated patches look like:
> |From 4457b9d7805551e6b35efa25f998b63901d4bf86 Mon Sep 17 00:00:00 2001
> |From: Yoann Congal <yoann.congal@smile.fr>
> |Subject: [PATCH] Add a new line
> |
> |From: Original Author <author@example.org>
> |
> |[rest of the patch]
> Notice the duplicated "From:" header.
>
> To fix the double "From:" header, use the --no-from option for
> git-format-patch to override this configuration and generate only one
> "From: Original Author <...>" header.

I don't understand. Why is the above problematic and why does it need fixing?

Alex

