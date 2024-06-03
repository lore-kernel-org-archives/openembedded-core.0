Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C86CBC25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 14:13:17 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.84510.1717423991329760161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 07:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NNUhBtK+;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e72b8931caso48923141fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 07:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717423989; x=1718028789; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LJj7Z6JqaMxrDnMtyvucAVFXdrzcAqimmTKwMOLRFyI=;
        b=NNUhBtK+rdgF6NhQmPV9N+psVO6k25HLTx4xDdoh9xQFeelO5I3d4RZArGELhdvsEQ
         hqoF/hThCR5oTQZxcFXFo+TGoLVEa9L6xS+XCUx+RmVk12zBERMxN6FIRxQlQfKf3j01
         t/E0qA+3oqDbm60tFZrsFgOqUsp/k61xF7a1rJhiqcFxrC/yHdyKiWQ4Sa1NCwgFrmEM
         JWiIX8HVIHkFNhS5kEgnIVw++TNH8M2/xFIrg+rhpzdc2ACirk6fvt+NiINvCPdXIISC
         FWmKs+EScvb/gnQKVY1tTl6IauF2v8rXyyUGODiPmmdrNxtlBPtigSNuSpTS8o9NPRV8
         uIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717423989; x=1718028789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJj7Z6JqaMxrDnMtyvucAVFXdrzcAqimmTKwMOLRFyI=;
        b=XcOpaeNJNKIQPhJVeXXIwQBNESOLNZrSGa1r8m4ATnDfeqwo9ziYpz4d7yJ3X0ILup
         bcZ/JlWgyD227A/hOcFCPzxt/Vzb84aNpqczEqZBYDKEMPAC/ztCT7BI39rol/Yh4HKF
         XEF8R/yt1cJxoYgZ9Ldzy99J71yunQGjIFzr0k0B3y3oBX79Ulo1NsuHPgxC4NGh4Ezv
         4k+r8KJgFfsLLKttJMtxE6hUEdKjXT+y3+0dXNnvivbmckehCDmv0W1vT0Z3QMcJ/lhW
         0WCVXwB2XRECzwht4UZnW52hZ6khOjAn3uI9/thA/6R4W0c1J40GL4eBtVU2DcYs3V8J
         Dbwg==
X-Gm-Message-State: AOJu0YzInp+/voIpgswj2DietwOI896be46ZsVLQ1xmbc48PnsaHRXel
	B+Ya+yCUIRZmyjMiygEzQY2rcip2RpS59wFR8RggNYVLl3OZV4lje97Z1E69OPOMh4aWH3WoSB4
	3REsH1y4eRsseihPnCM2xcV/N4uI=
X-Google-Smtp-Source: AGHT+IFTc7jnhN3Ex2iV7wvDDf6i+XNmROh3KZTLg3btOwL4gzPb43FxwFpMTJeZF4EMLGCYlBPLmRIp2imzD4bsIu8=
X-Received: by 2002:a05:651c:211c:b0:2d8:8eb4:11a6 with SMTP id
 38308e7fff4ca-2ea950effcamr69996981fa.12.1717423989127; Mon, 03 Jun 2024
 07:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240419121945.1920944-2-alex@linutronix.de> <30049.1717416683403790176@lists.openembedded.org>
In-Reply-To: <30049.1717416683403790176@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Jun 2024 16:12:59 +0200
Message-ID: <CANNYZj8tQWUDLdiby29LuGOTO4o1FMB1Ga-xGQbPS7nUeXcGSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/19] package_rpm: remove support for DIRFILES
To: egyszeregy@freemail.hu
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 14:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200257

I think it's better to drop DIRFILES from the meta-mono recipes
instead. Feature removal isn't eligible for LTS backport (even if the
feature isn't working).

Alex

On Mon, 3 Jun 2024 at 14:11, Livius via lists.openembedded.org
<egyszeregy=freemail.hu@lists.openembedded.org> wrote:
>
> As i see it is merged only for master branch of poky repo. Will it be merged to scarthgap branch also?
>
> It seems to me i have an issue which can be solved in scarthgap via this patch:
> https://github.com/DynamicDevices/meta-mono/pull/224#issuecomment-2144017190
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200248): https://lists.openembedded.org/g/openembedded-core/message/200248
> Mute This Topic: https://lists.openembedded.org/mt/105616493/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

