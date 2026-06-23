Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0C7CDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 15:27:01 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23714.1782228411281180477
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 08:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ve9jBOZy;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6c79d2bb687so4114478137.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 08:26:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782228410; cv=none;
        d=google.com; s=arc-20240605;
        b=CkhgXL+BVBOG0tJuwg7Bktk9eLCgowMoWzv9aLNOZZaQ82l6E5oKHXUtYFJy9rRMT7
         XE3895k6Hslw7W8mU8au6ZtCL8vTh7ix7B9a0+fl3URqE9fEnrT6xrjNG4aLU5P4Dgs/
         qkGzJ1oHc9znfnR6W1OPlBx6+Rik4FrPfihy6TK9s/I2sGMavZm7B5rWeK4Av5aJNNWB
         8UjrAZCzAP3p+xum5eY27XqmfSBBHOOSCL3Oo6H8WNnrXT+Nx2mDtCVee4t162biDZwA
         MBHmH0iCWNS2HFSiQAiT2O1m1L78B5fXxU6q96YHwtad/ZOE/uY0k0VTLFM9B+uK25Z6
         YURQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vrg+LOWHaN7lrOr9YCvS/e4uYB88TPqR+SR0Uzsymo0=;
        fh=IkLvm0gm8oE1eB+QXuU6mP9lAGsTQ6KRq7Zxigd6Hpk=;
        b=MZGKztHpv1WDje1WYhlo40i3sWsgT1ydVRoNgRdBUBSghApSPMU6ziRizvNoJau55q
         KFyzxzv6H1lsZ1RkSfJ/SimG1b+vSJY6VVzOjOf8FMEHzEVJSlR4gSfSX1mxI3l9wkpK
         NQnKFlxf9MP3caqkIlXPPMVi7d+PWwujceBCpUiIMvh0f3zQvh/pvtzi0emT2laqt8R5
         b8+cB53prsaRSj3206yuZcQptuO/R3p7u2CQxxOLOztq/8+9bv0/I4043al2hj2fZ2cm
         QLcw71wofv4CvDK3YkpuxUUnW46fblFaGm/eo/WxxF+uEaNOLNdnRECrwzvDoJRRtxg1
         JzAQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782228410; x=1782833210; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrg+LOWHaN7lrOr9YCvS/e4uYB88TPqR+SR0Uzsymo0=;
        b=Ve9jBOZykoArglKIXi8Ox5Czv+EvRvpslIHqKCjeLhrpvy4iqH6NjoPIZsQzwlmk1L
         9wZxVVV5j5sqZLqJk3zMKm6w2sxQyI30vCWuL0w5GJ6pyYeNn3r7f85BeoWJL/MNbVnJ
         9Rys2ubDfmoCA9Hio6V4ZKmHG2L/PYvan3GZmlcgsTLyshV/C50Y0KqJnrqBScZO4byi
         RDBVhyj6lPLq7WV4y7IQQJGvWAHHhXt//L0bR8SITP1Clp+iL9NpfcDdc4UjPG6AXDTJ
         PogSv/uDMKN57Az7g1Po5fvSBCezaBT3BBJ3hqfEDFGXEk1f/Jp8R0HrzlqikRlRXJ9L
         a8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782228410; x=1782833210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vrg+LOWHaN7lrOr9YCvS/e4uYB88TPqR+SR0Uzsymo0=;
        b=eMqYAs+w7PcoxKMzHtwaiZ+tXcqxowrR2G0ZBTvEEfVeNLcjt2f/1KDDC/8toWnvfK
         xTUUFGtTeatvn8C4Zk150OH9qxVwl4Zj38qVdJqdU3R+LqVi/eHhL4j3RpfdFwE+Y34d
         el2VYhAN5vIkAY4IUm2SAwm9hkisM5jK2ZNTxNkS2r6zU1jnTuElgOzbSxuNl3gx8nFZ
         Pi8YsKnuKDm8uFSx1ngOYsMa+EVP+M1Mshb8bQr9kYud9NtnkI6t/gggrKo74zc5ec8/
         +RxwZuEWbCBDz1m0/PrB9F7/IRPoy2Y8SxqxxoQPafqapqT8bNaEKeR/3wADEyrI3bTG
         A8dA==
X-Gm-Message-State: AOJu0Yx5VoTApOJhSnZWBBt4js2ZmznxPSrHFx9VhhOBAjTyJyqSs6Z+
	bDw8Hp0Z6Cic4liHBtqoB2hssFWwZObdVBJPd9H/ZK99/6OLZjDs4h9kgg4H3D1uMaEi3csZQZK
	faUb+WVV6VcdXnM5vIokwHISYdWtgV1E=
X-Gm-Gg: AfdE7cl9Pqn6N3O4H8PFDImyEjWgyHnwxpzALyG2rCYEG8zOcLDj0auHvFsezd/viME
	vOtCbikWTLLXMqnWK68gqYoiJgtvNRNlFHKnJ7hSwF20J3x9VMIyS9BS1D06AcP5pBRCC9cRPp/
	0TqIZS6lZjMWjc3v8+w2bHobjDEqqrx4CHVmOxoqDv750FXSf8USpBgtbIa+pkFNA1Sq7oFK9YF
	pBhwjEpR+Koz2vAzfuWszezmrtrkq+DUzWufdBWPZyorOikJQMedd8jrKUvoKC6TENDAeh38w==
X-Received: by 2002:a05:6102:6a81:b0:6c6:432c:84d3 with SMTP id
 ada2fe7eead31-72fd5ea52b7mr2114335137.12.1782228409987; Tue, 23 Jun 2026
 08:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260620043921.514-1-adityags2004@gmail.com> <285862.1782193349896158852@lists.openembedded.org>
In-Reply-To: <285862.1782193349896158852@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Jun 2026 17:26:39 +0200
X-Gm-Features: AVVi8CcmCIr_OCdgwQeUT4kJPzhMwiMlO5wwnhH3l5SGomPkxVZ2fvrPdMpGTc0
Message-ID: <CANNYZj_5xhSM-G3c-+nctAN1_0ZkfR8b17++JiZh_Dt=_zPoJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [Kirkstone][meta-lts-collab] openssl: upgrade
 3.0.20 -> 3.0.21
To: aditya.gs@bmwtechworks.in
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239407

On Tue, 23 Jun 2026 at 07:42, Aditya GS via lists.openembedded.org
<aditya.gs=3Dbmwtechworks.in@lists.openembedded.org> wrote:
> Just following up on this patch: [kirkstone][meta-lts-collab] openssl: up=
grade 3.0.20 -> 3.0.21 Are there any updates or feedback on this? Please le=
t me know if any changes or improvements are needed. I will be happy to sen=
d a v2 if required. Thanks for your time and review.

Please note how patches to meta-lts-collab should be submitted for review:
https://git.yoctoproject.org/meta-lts-collab/tree/README.md?h=3Dkirkstone#n=
46

Oe-core is not the right list for them.

Alex

