Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B745DC83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 14:12:22 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.79113.1752502338280390360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 07:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jYxXtBVJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6facba680a1so53164876d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 07:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752502337; x=1753107137; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mBScH/Jw8DedOXMqPhJCfZ7CM+U8TxK3BzyJbXW+5oA=;
        b=jYxXtBVJjPv3IhzpfcmOHkcux6XBOULVe9Z3JNXhGvXUS9fLxbOT3wzQHW/wBFXR9J
         k1nDc25hHiw5ou+WdIBXVERYlaQdt4BQzW+9fwWhBuirW7xGhKcUmEOklC0n427nRJ2e
         VZH0d+yvaOA6Be+0r96YKx7b2WfUCaiKjNaMU/c3PBNxwVqrxDt3AJRTV2BmwblybLDj
         MTobuLEx/93DKMJLsiD8NsFy80VfVfJsOthDTwVBzXC/dYscoP3NU5a/GLkexqOJURZh
         BgyFuZpwZARjsLx/JngWz8j8jeoKwrrShNWCxUI6oE81tVifJ2Ieg8BqNor7lJYx93Ng
         vusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752502337; x=1753107137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBScH/Jw8DedOXMqPhJCfZ7CM+U8TxK3BzyJbXW+5oA=;
        b=EEqUIOst7JUnrRKzz/XvVpj+iN+cqcHvXoU7wIvlilUnzbBiwTp2wZlrJxA5+k7/GF
         aXSc280eLmeMxdcSp8p104gHVezaIdpUaXKTrv87cQqvO3NWjI+3+q4NwRhEvzjFiM5q
         Clj8DdGzlpCku9bYZjLWG3k4aMdTpK3LqOLWYEZ0Cgyab/agPnSADo2VuaNUVXK7Dpc5
         PqEdtYodcQuflJ33OKYRDzw2uR0YCrT8LVEdCxDpzHL8xiFSC/D1vhqQKgIg28YyQAPz
         bcwNcvOvG79cLxBT+Kf7MQAri+S3AV+D7p4vWcG6OVdjNBMkbSeUplfs470dVTGDXDzQ
         EdQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1TlAo1ze0PBnYOMWWSy9DuhZePY7jJUAnEo8qnrfcq+6PusTgqUPKtIstup5t4oa9Jll1UbP19pXc4rSukc1VVg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxr8aCDxzLVVw215VuA4G2eh7AdlqURVGeMcsgxTE/1xhp1Pfyb
	3DS37wWp7d8zj7umRpAxx8qbcAJp6KCyDWwcGB3aZ2fuYW2tf4eWWL7lyuooxgrVbmuCruuS7OM
	DEE9I4JkVdARpJ3+f0XaxncdT31f1s2g=
X-Gm-Gg: ASbGncuNv/pH2nV5iJrQ2d3HkIt1yrCxonT3kIdrBPX4OksghnM4roQ2HTEpwdEeqnN
	lyKbFyPmaK05U98bE5Sr3BYmNGalDpo/I13EuhxYdnZMo0BU0GS+AMaj1zJ189YlodwIxSw/7NE
	lbR4IkWPY5WYMPS47ChnwwWFyzW8qrMClS48/CxgpLXGwtuvQ2zv6apuIIgtA0nZH4au2pxcJKi
	0Z0sBViYD77t6ro3KdBlD4seupfGOcicYonoTjw
X-Google-Smtp-Source: AGHT+IHZvkhDf8nAf5Dqxbm9bphZnmFXyb6cPWGm3GEj/vkXCHWoXZrliMXBGbFnqfWwQ/fvIueJRLlqLQcf5pQ9wuk=
X-Received: by 2002:a05:6214:230c:b0:702:da0c:61d with SMTP id
 6a1803df08f44-704a421dab2mr247235176d6.25.1752502336758; Mon, 14 Jul 2025
 07:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250712125103.3404739-1-adrian.freihofer@siemens.com> <1852209495D5ACFD.19151@lists.openembedded.org>
In-Reply-To: <1852209495D5ACFD.19151@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Jul 2025 16:12:05 +0200
X-Gm-Features: Ac12FXys6EJAJHcMPdZ7xB9OlPYlsFQDa2-UM3hknQ1IzoQA_P7KF_2crEqNfRs
Message-ID: <CANNYZj89y-wwa1jtFU5w2AayYsoGGFi_wQz_tZKxNF2u2o8EyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/2] oe-selftest: devtool: split tap
 detection into function
To: alex.kanavin@gmail.com
Cc: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 14:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220233

On Mon, 14 Jul 2025 at 15:17, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > - Dropped the part which removed the test for the /etc/runqemu-nosudo
> >   file. This was discussed controversially in the patch review meeting.
> >   The file is kind of an API and is used in multiple scripts, not only
> >   by oe-selftest.
>
> I'd like to see that argument. runqemu-nosudo is not used in 'multiple
> scripts', it's used in one other places (runqemu) to determine whether
> runqemu should attempt creating the devices.
>
> Please bring it back, this check does get in the way, and isn't used
> anywhere else.

But I guess it should be turned into a separate patch, so it can be
discussed on its own merit, and not as a bundle with other changes.

Alex

