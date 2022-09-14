Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA32BC6FA91
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 08:53:12 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web09.3937.1663145585978482433
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hUXrUgAA;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id q17so3496273lji.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=l/5ZnRESgiArqsF2c8Q8+pfH6RDGd7UjQFKKb8eLGUk=;
        b=hUXrUgAAdceUYBJ2XLCTwMu/yYO8oIOVglOaHu97/mC2qgkUiee48N8ZBA/sgF9A8l
         hkQb6i5lQuonVIJk5pUAe9ArVXWtwLIvYJZJiwE0qiqi+tjOfZnUOIaUtCsniS/ahGtT
         IsXWf+moapx05fzCAag5PzO2Z6IL4YdbHG1mbNvVLtDC7cBg5tVYfZXgjVzfAc8BeC+O
         ZlMN2LqKwErm5mat1FltH/nlRa7QiLUapMkxU3iWFYZ2yOwSyXK0vHme18oSnlBXATdX
         q8+BE8JlrWHP7jgSpAAoW7hMD00fEUv8rhHxM3t+us4rflX6ztqAAeSRUPtILLze3e7/
         8QQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=l/5ZnRESgiArqsF2c8Q8+pfH6RDGd7UjQFKKb8eLGUk=;
        b=fTHu/4fTfOiKp6mdBUBoaGex4zz/FOM4abSEM/scA4QxbY54XCbJgrTCceyP292G1Q
         Cm4zUQ8lZO5UYVEjLG0MvsbNhGW0qobWT6yGmBeKYcTmWaTa+CeTGlGFqatBL0+Byj6Y
         uihC3XJT5X6MQ8e0Qec7Y+Nxg867m9Sqv6xusu6kUs1EQpbuBWLAkiSxlfMfyhk+fnOu
         iry9LbHaHTI8lU9bKStlBjnsMY+W2/sqLyH3wsA2sdygQ5oDq6Ncd7CMgk/w2KqJG7no
         oD8f8dlzQGxKdtLxwHpLHyqyQ39vSpqWC3XgRqjEC1z7FDzXKTZZsK+dPummYld/x0GG
         6WWg==
X-Gm-Message-State: ACgBeo3Swq71J4EsD9jXlk0itX5xDpqHGFk+X41lcJ+Dhs7fH09fj8PN
	nrEOVVjqXI1OzfPAo+OzIaI5uHfJr2BlhYIlg0E=
X-Google-Smtp-Source: 
 AA6agR5wa+R3Cbrc5oEWXWbxcv6hTZLpVwJDcp847DPCv1LhR0aYWMYuS4mHpj5h8ce1hraduaewUEbJcyH0TcXK8RU=
X-Received: by 2002:a05:651c:1787:b0:261:c1ff:4407 with SMTP id
 bn7-20020a05651c178700b00261c1ff4407mr10292775ljb.257.1663145583953; Wed, 14
 Sep 2022 01:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
 <7a1aa96b6b8883d47234c198992963c25b3ff6cd.camel@linuxfoundation.org>
 <CAJFpGrMqa3hk=QL56zFgZBHiJn173Wocz7a5AH=2a9=Eny1tog@mail.gmail.com>
 <41df899720a40675568c55a571308c9624ef5d2e.camel@linuxfoundation.org>
 <CAJFpGrNM3sqj0o0L3CtNOtiLsq=++sbxun5eGXZHPN+A-oT3Zg@mail.gmail.com>
 <CANNYZj8FpujQ+D3xc+g63LMJahyY2NRZK0KQpp2m=L2L9Jadow@mail.gmail.com>
 <CAJFpGrN4DzOqFsq-HLgdonuNuLFKTyb1BKRg=_6btzjjtN+eOg@mail.gmail.com>
 <CANNYZj8AiQ2bEfxk5ujs2H7C+3ER1OQ+hUeXUVnJxZjJ2O3QaA@mail.gmail.com>
 <CAJFpGrOETn=9tkMccp1PF5Z_sdqMb3zmicM4Xntfd=GgEPDcbA@mail.gmail.com>
In-Reply-To: 
 <CAJFpGrOETn=9tkMccp1PF5Z_sdqMb3zmicM4Xntfd=GgEPDcbA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Sep 2022 10:52:52 +0200
Message-ID: 
 <CANNYZj_Ww_kGiFHsb00vBayim3u9bMcx0RnuhpJu2EW_Vm8QXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken native
 functionality
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 08:53:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170648

On Wed, 14 Sept 2022 at 10:51, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> Was there some discussion in the past with openssl upstream about how
> to find config
> files, modules etc, or was there some alignment with e.g. Debian package?

I'm not aware of any such. Please open a ticket, and link to it in any
proposed oe-core patch.

Alex

