Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8BCCD343F
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 04:10:16 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1367.1779077405188619941
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2026 21:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QnhTA3/R;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8b1f2b7f1bcso30251936d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2026 21:10:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779077404; cv=none;
        d=google.com; s=arc-20240605;
        b=X7nY1VMDvkNoo3h8pGsOu9q22Tii+BG7y86u3XEVxQD+VJuoKBveY66EZQg6/TaWk6
         02i55W8Pfg1sifXJqVryVUfb8Ck5QEbDcrIKOk/KSTv/nHq5wDoVa56XV4NBSdtj4Mwx
         I5JYHLrmjXhFu0kTd/fXk/pWWRkvKz9VryLG2uX8hd4SjyxAHjeaRNRHbZ6RIzvqfdpV
         NdOSiu6TqRuU/0jpQVcr73vyOMDAC2lfDDCX8xUJNOCso8HxjhmshzocK8S3e7ltcNRO
         tE3ymUGMp+GwFBH1m3F5nRxwbqlYeA1KbtFnrf6vQAgwGt2x+cbh3kPUi2UUb3uq8DL2
         TUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZWWziuLA1tPvx+3M3EH7fcUM9IvejEXpXCM4VNMZ0Fc=;
        fh=TzXJAjdH1tY70TZjbxQMbvHUj31xSSjEnNiDHFzu9ik=;
        b=H6eo7iCfQi9sLmb0UE3qGp4AV0ccfWsb/wXpNjBfW6xndKijYB4MBU4X2opQOz6hmv
         yog1hskxuWHovlyFfPpurMXaJ71HuYPHZaBvlAgijFtBn1ENuOlPCzErwLu2cw/h/BXU
         DJnyaL1vvoSlx6ex4APTdlpu6RI8TWPrqQaXhWbQsSeaZAydHq9gw8OeL0PM+LopKzou
         hPwgkGrL08s94IpUXp/XxutvkSBZEwalCYBHdVN91JH7wOu6Umernqi4DIldcZAEhbNf
         O/mhgJG/wa81M8t84OrPEhPS7JTQyE0CRlMnDClln6FUEOGSMA06MJ7x/vkbHAjaCCaP
         bJdg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779077404; x=1779682204; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWWziuLA1tPvx+3M3EH7fcUM9IvejEXpXCM4VNMZ0Fc=;
        b=QnhTA3/R9aWzu8A8vpDPKbpNJ+Xegi+2Jrz4DB5TxIADCq4lJAP7F5Dgv7SKE4ksjB
         1MSUBS0jpB/xk062RE5mxbCawI/roi1w2RorailTpSuOm2S7ex8VBQH3lx7GFK5fHbV2
         ELyHRHvPw2Ly3Eiz7KXLA6JznUm1z/5lyNxQAtuuXKboAE0wTUBso9yRFthCWD8BDv2I
         BLrNuhkPusD2eEHq0oeqnyLfAshmWYOCjLWKRMSBfSSElsh5hRGDoi2sOa0iVk+iizlJ
         u1kmvWG3dnatUntnmWbkEPzgrBhpwLxNphiKjaiMe3gmivzyCUC0M1zSRIDJ5hz1molF
         HtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779077404; x=1779682204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWWziuLA1tPvx+3M3EH7fcUM9IvejEXpXCM4VNMZ0Fc=;
        b=Gc0NktOmvkgCntXTb5xLLANoHkKu4xoymNko5i/+NUj5GjZlcPyIVVPtFuvIYVTPCB
         eKVWlcLrpV4IY3fxAtyNBJkJv8fzlU6fHumpaIXBnrIG6Xl0S0EXpXDSR5mKz8aBBYGg
         ZaNA7+w2F5vfbxHSob+h6IxZMW2ucw5Tyuc8gqhMEGiKrnqCD0YbLaKzGserMisSTveS
         kHv566SedMPzB9V0n+JHEQDQ4NpovtGre6rpCpVk916T0ZpkB7fMkSRUYBjp58EajMou
         0YxhqNrjhZHDZt0ln+xqa8Zl1SxXU3g9AkgxFhreAMRo8n83KbiYEzmBglia2+UsGSzt
         PaKA==
X-Forwarded-Encrypted: i=1; AFNElJ+W9DcEcmYiLHdERfHHkYRtQoVTN7dGe6TgIxnqZuNRgAsA0763X634zJNHTcdZiGZKHeNB2YgzuynFvUeTaXa9sQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzaIa21avs/feKcbXh6Pott/NXJTz8ksaRL6Z/C83c0meVLTfOO
	h/4KYWW1sfeiKa9wHMfMUALtJ7njh7CILvluV6RA/uLwpmoSVjulG2WM1GTzo3vVA78Wrro/6Rs
	vu7/HPtzvOCrH9kAmE0PxJ4mTpfCKmnM=
X-Gm-Gg: Acq92OGuHevy+/CM6jlb87I8v0dOGtkM0dAkpWnwKkt81yX7NELEUrgltg6IV1BwkiA
	RxWD+0XClQ8hGpkbQMi4qsic6LED1zp31roXKNwMJ/QlzbAKDXbl0gZES9fvNQk9gVJtrRb6hmy
	t25aoFpImiWO3fLaAdV54G+hEkBmZ44JOAlVPGnjJpAD+0FEEus1L0NhRIFmaQxNSw8nZl905He
	PjbbzGZ1K6T+8UanlsuoTDgaCeiJTT5buRnsxkY4D5Q0BS5T8DM2ga00dQEmBYPHLj2hvuSZs7J
	Vnk4PJ79IZyiM+BZu6UBdw6lX4lwYudrI5CldjxEyA==
X-Received: by 2002:a05:6214:29ce:b0:8b3:ff3f:5d61 with SMTP id
 6a1803df08f44-8c8fda1ccbbmr260978786d6.22.1779077404171; Sun, 17 May 2026
 21:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260513052334.2271800-1-Qi.Chen@windriver.com>
 <DIIC2A22J8TH.2IC6O1ZQ1MODS@bootlin.com> <CO6PR11MB5602B1780BBA2AD5C925D884ED042@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CANNYZj8pf8FtsRjZpnMGP2egY+Wc9aw4ZDz2DR=rqv74Oopk1w@mail.gmail.com> <c128db5e-2ef5-4c93-9cc9-ae55f31f7da0@windriver.com>
In-Reply-To: <c128db5e-2ef5-4c93-9cc9-ae55f31f7da0@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 May 2026 06:09:53 +0200
X-Gm-Features: AVHnY4IWO14KKfHXUF4bqK5EgbwvvLFsXzFjBHqT6mVPepheefM3LeI4I4RNSTk
Message-ID: <CANNYZj-JLp8MwK5UnjVUrdBtmqDM_+dQiodU0QgMiW7zcToOjw@mail.gmail.com>
Subject: Re: [OE-core][PATCH V5 1/7] recipeutils: add optional stable_upgrade
 parameter to get_recipe_upgrade_status
To: Qi.Chen@windriver.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 04:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237193

On Mon, 18 May 2026 at 04:37, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> And in Yocto, we can't set variable like this:
> VAR1 = r"abc"
> This will result in parsing error.
>
> I'm quite confused about this and any help is quite appreciated.

You don't need to change bitbake variables. The issue is in the python
function inside the newly added class, where you need to correct the
string literals:

    return '\.'.join(stable_parts)

should be

    return r'\.'.join(stable_parts)

Alex

