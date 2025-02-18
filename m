Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52182C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 13:48:11 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.19699.1739886484899673309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 05:48:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CEocCPlg;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6ddcff5a823so38058856d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 05:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739886484; x=1740491284; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3vtY7JA9xUwdi99fxRDM01SvxNxA9nJ7yoghtpSWtg=;
        b=CEocCPlgHJ0mKo/dJZwYx6SKAS0BJ2MehenuSVW0O0EYodaCdtMSYwKBhHdG07wBFN
         ARCSkRPQ65TFD5PTNTzrs0gSk4z2mBwScv60KtEjbnRUefEznRBCJMGEmlrbpzb4p/sQ
         I1WCW4BJhqC4d6L+mUtt/PzKnQmDSkL14TMmAar1I/LMCCeeu01QdpT0Z7E/N2owP671
         RhRuINQ8iF+qzcRszbQeGgNoG6WFG2zmwZiZmHCS1MeipCNv22YiBMDfjynIrzTgEr6M
         3lAtEuoZR3jkkC1MRSbszyHjiAqU7/IWrAB5yUpKqz3vhBeSyrxA/cwt+fcPiQeX/iBk
         NgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739886484; x=1740491284;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3vtY7JA9xUwdi99fxRDM01SvxNxA9nJ7yoghtpSWtg=;
        b=iXwJTSbgSXYP5pAZdFlqRfuWH9nPN96mCsJFB4fVLrxRJY/IkET0IPcforbGKEl9m7
         AAsbg3itrtMYQ4r32JNmcILD+3sxoHfn4VWG2IwYZ1C8D5by9iP2xrKFeFJrKoydMUKG
         0HebFKdjCXhPxvEIBUGzG1+zXsxgBAAydZHaWugwPewB/rBXIdukNT1aJNu/x0xQNgbV
         Thf6vYoh549giryLsfAXTRPovGuwA2ypqWtTqN6RX5mlGUHK7cpELxRqUgRZYQT++K+d
         UN3kpDn0/xrBT0ubXRiS3khqQ64jH0TYKgmRWaEdY1Vpi/E5XWng4CANepuSrqmQN/n6
         2uXw==
X-Gm-Message-State: AOJu0YwOL7iE7321ttSHof0dJwmPsOGYa0TuueZ9qHaxXaOfgxXe+oiE
	iRiOf4TYDojDZToJRpWl3OmVHC6h7gW//zQzDdShBXxJI/cK2Vdf07XfxqhvqEX6WCQIYiWFR8c
	qo+wzDuCZc8/s3700uTz46ug+Wi5ngg==
X-Gm-Gg: ASbGncv31dhxVEc+ztzGYTU7TR8UPOVGnm6akP/qYmuNGeO8RUkyq5v7xDtoS4y106b
	MioCwzjFcWhtm43Mki7qYXWI6cyao03CgXkPuQZYIaecGj8dupsPs2PyEj6vhyYoxZXF4mHemeK
	rZTyNe/mpyR8Cnk5xXQ5nBdHmJtudBxzQ=
X-Google-Smtp-Source: AGHT+IEYPCADxmric71l/nY1UAGHd9HpCNVQX20pKKHmX65uahGDsQd07baiyd4/HMsrmHQx5tZ6w5/HsMVzc0xwYNk=
X-Received: by 2002:a05:6214:1c4a:b0:6d8:a39e:32a4 with SMTP id
 6a1803df08f44-6e66ccce3dbmr212685126d6.25.1739886483991; Tue, 18 Feb 2025
 05:48:03 -0800 (PST)
MIME-Version: 1.0
References: <20250218133736.2113804-1-hongxu.jia@windriver.com> <20250218133736.2113804-2-hongxu.jia@windriver.com>
In-Reply-To: <20250218133736.2113804-2-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Feb 2025 14:47:52 +0100
X-Gm-Features: AWEUYZlKal8UZcsdHdRlhzAV4E3_6rtOlAOJlc1_7TPIrtLMGyYdj0-dPejCyYw
Message-ID: <CANNYZj-X7wLRf9rxMBgDZn0nSDo12ya7nbhGTr=FZj=MPLu7=w@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH v2 2/2] setuptools3-base.bbclass:
 override default subprocess timeout
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211621

On Tue, 18 Feb 2025 at 14:37, hongxu via lists.openembedded.org
<hongxu.jia=eng.windriver.com@lists.openembedded.org> wrote:
> Explicitly set variable SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT to 600s in bbclass,
> and we could override it in local.conf

This hasn't been accepted in master yet. And there's a strong
opposition, as this is felt to be something needed for misconfigured
CIs that get I/O load beyond all reason. Can this be kept as your
local tweak?

Alex

