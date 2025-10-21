Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C2BCCD1A7
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 17:52:36 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.19673.1761069154763111444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 10:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GynsGEz4;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-87be45cba29so81358086d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 10:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761069154; x=1761673954; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1GlddcfepCTPjUDiRKlAjekcadqLxgeFt1qRDk1MnjQ=;
        b=GynsGEz4BTOWGvd9jZ2+Y5ik0QD68bLldZmJ4CHpP/qcNvhnnB+S7V7UZlPsUZ7tWc
         BTrhYLOyDILPI6/vTXx+kB4CVcBpZCbRLXh3okh4zWMVFNs0uBp54py3VPkDADqORyMs
         sgEgpvxE+QyY1a1WQWf5KTZ8p7A6UXg9C12Ma7XpoHSlQn1LiUwTOa3+VOPGmuagvl/m
         gm74+WahMoVtimH6oDh9ZTuGET+VbFaDzPG9+gUnMKiVP4QZ9wt312m1YRv8ww7mQ28T
         P10DV1T5QWCCrr94XmTVO3QVfcRYfhJoGez3rhF1gaXcGenx+tuGO+iLJ8NfLDdbUtSA
         MFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761069154; x=1761673954;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GlddcfepCTPjUDiRKlAjekcadqLxgeFt1qRDk1MnjQ=;
        b=siRkOkO5vKK5PY4UoRZiLNX9KQwRkZcH6Xer7xKynZo6/6ERmYU2ECWg0jnPQyOyq6
         8nvpDiYImBewuFUv81iHQO0G4ksX4YbHCjikpqDxgkNKxYu/0VWwCyfqoGyotMgPpwZR
         jb1kytChD8Zy2bfRwCvqsZ2U1HIQU43g6UjiJ6Irvif4YX6VePcYiIbbt0BNrnF2Q6Hf
         DiuI10fGFR5itg7GBNVYwunW6d9PAdpsB57pKGKMa012BO77Y0qkAn+zja++TfYj3SgN
         2pRSGzoKqrZcHWobnob+cmf2s7DMZeFeE1dCYIGf5YDzOfQYqVAPFNJTbnS1EEb5qrFj
         UraA==
X-Forwarded-Encrypted: i=1; AJvYcCXLjJZDqWPyVFBoKlMkwBpQ/zMWgwe4j3GOVg1kd/9X1ufogoMK6rczsiHu5hcn2yOh9eTSg8ZlikmfOr3e2ETURw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy6Harci6dgIGQgDLjvdW3R5lhFzEj/0EycJiqktKbGwTRfpRNH
	qc8vFTOghHcO7vLEoDHhyH1AAOdpXurAwxxpVn+d8c3yi7TkptXIehfHPcJMTOYY8Lrlq9KN3tv
	5G2LYxes7XsI43ZA3jE3K5BiSyBmo7d0=
X-Gm-Gg: ASbGncvB6Rnqy1cMQboCxiKZ+wkLK/QBMisiycx+Q1zM1LggnBlUpAndszwZAOmR85N
	CWWexNLwqSUEIhr/l3uwmhKZkJAsGNPFj3Dob1VcaccOFcNIb+mfalKUH+xy4UzoNrs4ldW2AeE
	ErGTQ3NkENRtSQ37KdggR4hLcYAuiFRmJ5331xjynfoe3Y+txHAGsc9d7VkGM5H+Ss+VhMnXTg6
	Xb0jCWfVaDj6TYJQP0NFABc1SEij8anew4eAX5OnYqJ+4AawlGX+TvIGRacCgyPuAsfvOdxOepm
	pGOmtrZ7TW980VjumO0Nfya5G7b/tfXvXn4+htpPbsSrCwgjosuxn+oZgP/wSRYpJCXdBK6a21c
	Lbg1kdrsalsN1SfnscbTQRO2AeIUD
X-Google-Smtp-Source: AGHT+IFWpJpOh0vRv+QmwbOsfAbZOPFK6BibY1Qy7qmgwe7oqjB5eD/RRpg037OPiDioX/X2T/LxW4/ZwxOSsPmlpSQ=
X-Received: by 2002:a05:6214:1c81:b0:87c:f97:7acf with SMTP id
 6a1803df08f44-87c20653c2emr223177796d6.62.1761069153779; Tue, 21 Oct 2025
 10:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251013185934.GA114595@pevik> <59f5af6c290efef806b73ba905cbfc412c290109.camel@linuxfoundation.org>
 <20251017164332.GA355538@pevik> <CANNYZj-6s0z-VgsONFkD-BW-kimhJ1R7bRLsXTJ2NQ7ANjfi4Q@mail.gmail.com>
 <3065c655cb09c8934022b9e9295620024eb3f94c.camel@linuxfoundation.org>
 <CAB1t1Cw=59ADv+M=bptkEMs4TAotCaE=uc8Nuw39wTMTRQq16w@mail.gmail.com> <18702F64E374DBD3.535@lists.openembedded.org>
In-Reply-To: <18702F64E374DBD3.535@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Oct 2025 19:52:22 +0200
X-Gm-Features: AS18NWAZWcka4Sitto4cAJHm6Fh4Od7LZtFUx9NYcJtlDsGvMLm9aOrKB41C3z0
Message-ID: <CANNYZj_MnGRkzi1keb7L0z6ZNVBGtpCCMAeLoCLL02jUxK+uaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: upgrade 20250530 -> 20250930
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Yi Zhao <yi.zhao@eng.windriver.com>, 
	Khem Raj <raj.khem@gmail.com>, Hui Min Mina Chou <minachou@andestech.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 17:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225159

On Mon, 20 Oct 2025 at 13:26, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> As chance would have it, poky repo is soon discontinued, and everyone
> will be using separate repos. Bitbake-setup will help somewhat with
> avoiding the mismatches, but bitbake should probably have checks that
> it isn't used with a wildly mismatching layer metadata.
>
> Maybe add an equivalent of LAYERSERIES_COMPAT declaration to bitbake
> itself, so it doesn't just check that the layers are matching, but
> also that they match bitbake?

Ah, there is such a check in meta/classes-global/sanity.bbclass:

    # Check the bitbake version meets minimum requirements
    minversion = d.getVar('BB_MIN_VERSION')
    if bb.utils.vercmp_string_op(bb.__version__, minversion, "<"):
        status.addresult('Bitbake version %s is required and version
%s was found\n' % (minversion, bb.__version__))

The check seems to be happening later than the parse problem you've
encountered (which is triggered by addpylib statement in
meta/conf/layer.conf), and so it would be good to do something similar
as early as possible. I'll prototype a patch.

Alex

