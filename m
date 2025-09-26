Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23955CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:28:10 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.12647.1758875288349791133
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 01:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XnlfuqBl;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4dca66a31f7so12352731cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 01:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758875287; x=1759480087; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h/UBuCl4PWi4CJO7Xq4FIMzb4sWhpx0FnOvXo5eUqro=;
        b=XnlfuqBlUOAFY4GrsT74MWQNKE8ubKb/dNhTjeYyTKS55kpbA3YMG2+RWiRjr6TAd+
         PaJS3+BBoVUQVT4RMBmymyFMERkiQxLmssG1R9dfoHQvB2pvQ6R5dkVmVeWj/hs8M8Wv
         18cwbfPGfI9Bz8+3YIVtA5wEVV9xEJ5fJ3D5Vy6eBUSV45fEhSOyuqml7EW+vknr2tvm
         Sj7UufwGA5uq/IIsRggGDcbyOfqvctAOBH/ePIndpsrrU0NZOaFvKECZjAVI0De9Rrwo
         VGaJx0vN4PZ/z3BMZNtGnMam7jol7O9YSwBmKJ1ic36aZqA3ofVjQ3Ive6iWDUizCp9X
         wttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758875287; x=1759480087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/UBuCl4PWi4CJO7Xq4FIMzb4sWhpx0FnOvXo5eUqro=;
        b=pbV3W/0YvImQbTVsWv0J722CU1irNRWB/9PMnYsalDadDoePZLOhe/uFrFC8nVgWNp
         cJwnEdEzTCyd+7xSWtMG45I1zuEqMMZRZfbUNLkFgQG318xM+y/4ebvwRq21cANCO3Uu
         1Zg3YlNAJJZVIbKKZQdtMAKAlRDx5s+/+7fPMJf5dsXLniAu0zU+R7PKC2rMK7YM4899
         IYUYTmwFS95SVoZjzuKqUE3zMNmVt2JG8y124CwkRqbRXMWP12/nn2iGxGV/ex0rRBUC
         pOfLh/mo6/WAVoG3ftb0lywpJctALDKbTDSdS940VWFL0Ei5c5ON/SCWknawkEG2I/XR
         bLrA==
X-Gm-Message-State: AOJu0YxP2DDNktUL67YS65mdOh6QmlHsaICyf96bPaa+LCM9FAVbgy+G
	NeFeVVDD29atgsDIc1jn9rt8CkK3XB0uO2pS9EcqRDLi7WOP4Ai4hl1xjdgHMlzizkPn6QXp9iS
	l75KWmdf9D0YP0yvyDFgcrBMjwwgWr3k=
X-Gm-Gg: ASbGncvX4Dxne40mPc+gt7QQKArfRxGS+W4ydCVWHPmL0MsAp00Vl12p7UFzhd7pjcX
	KcUMKQTBGc2//s0W3umfXHAc5yMnB4KHBBlJ2BoIf0PbTGsn5l/BkKgGNNf7b6so1MrlhmRSxqz
	bVOSPTfSJpQZKsytrZXLmnZ6vW5JLZ6WB8CvMpUKSjrFdzziJYqN5se/W6uR5yd0AcMthLjMMUy
	hXgzj1usPyaDw3rmo039HncX/H4x2caZf/cIpM/XM+QaiV/Qxn6SkOOtpRWAyqlN/JcoWd1fIBa
	hiNs
X-Google-Smtp-Source: AGHT+IGvnUm/aRBQksuyzy3Q7O4psVr72RGpWMSTwoBKsQn7Abrzb10sDJeSQ/+tk+2+BmueBbASQvwbrCXTj/cb0dY=
X-Received: by 2002:a05:6214:c65:b0:809:46e9:1f7c with SMTP id
 6a1803df08f44-80946e9f7femr63831456d6.39.1758875287288; Fri, 26 Sep 2025
 01:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250926073618.4162662-1-haixiao.yan.cn@windriver.com>
 <CANNYZj_QnvcztWCEeDa98DVJjbrpZYhsb56D1jMe+pL+=_uwUA@mail.gmail.com> <8f9969b9-aa03-4225-b72d-7df98d3f9490@windriver.com>
In-Reply-To: <8f9969b9-aa03-4225-b72d-7df98d3f9490@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Sep 2025 10:27:56 +0200
X-Gm-Features: AS18NWD-S3psdmzv6a644yoTAMSKpHEOG6Nz-YP57390dpSjE4hsV4I87D0Eb74
Message-ID: <CANNYZj_+3yOR14u2s6ooqQg8CuQYZqOhmi3M=k903gedmgTLLw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] syslinux: clean old object and dependency files
 before do_install
To: Haixiao Yan <haixiao.yan.cn@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 08:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224063

On Fri, 26 Sept 2025 at 10:03, Haixiao Yan <haixiao.yan.cn@windriver.com> wrote:

> Executing `make clean` deletes all existing .o and .d files from the OBJ
> directories, ensuring that zlib is rebuilt from scratch and preventing
> stale dependencies from causing build errors.

Thanks for the explanation. The next question I had was why the
standard clean mechanism that is usually triggered in do_configure()
isn't working, and indeed I am seeing this in the recipe:

do_configure() {
        oe_runmake firmware="bios" clean
}
...

do_configure:class-target() {
        # No need to do anything as we're mostly shipping the
precompiled binaries
        :
}

Should this second function be removed instead, so that the standard
one takes over and does the cleaning?

Alex

