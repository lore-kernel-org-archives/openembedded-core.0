Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9758AD41157
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 10:02:02 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32220.1768471318407188077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 02:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d7/ZObjh;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8c5265d06c3so174012685a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 02:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768471317; x=1769076117; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H5OQft0pUbNjbAQa+u9xVPaKc5WIBQ2T5hJkZ7kg9Fc=;
        b=d7/ZObjhMGR4i75fwBlSf7TpaoTak9VziDBDayiMeiivjrzynbWXX4tNp1CNSShcmR
         TrKD7aMFvNSS4bUaYlepriJCYHbBXI/uLmwbLEWZfgdRXOD2xEWrZRH4ZqCgivA26afK
         oYkz1NWWjv9JjfuYOpVAA9/RZIthIE7OD/jRbEoBw/2PvVmsokdUQrFXHrY6n6sdMJUl
         KSdZquRgarze739Xsvibm3qpXCo+AdeEoNHXjPzHYOW6UE64TAJIWcS622IbWqmI3brd
         TFyW/5l66YGzlRbnKqWMYW1ckpKuI8X4bdUqZm4pL/0W0+E23ZUK5Vm0irz7TcUUGoH1
         tDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768471317; x=1769076117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5OQft0pUbNjbAQa+u9xVPaKc5WIBQ2T5hJkZ7kg9Fc=;
        b=TD8qNwZtKUdvtM7p9Hesx5a6U/xNmNAWNk29mYIwcgTno085+oHmpUtfyzIM8NTakn
         tDcWgxUU5LdRLAR1jfPln+TQAggEremGSpKl5wO+hLGAnuRFL+nONgzoFnJKUl1MRhRI
         v1swEJ5BEcUMRSM4nVM4m9pCKItBufqM6nY6y2vDwqW/jurB3IUwHwn3JB5xwtR/DcFf
         EeyEp7OcBfbmZpJAQcP23FmjNV8/4aQAxChzWEWNcuYIJT/TQXexVvErnKx5GbvvysHF
         h18ZddWorApMcp0iX+VDo6/cnPd/ncpdYIGlUj3zk/nhKwsvEAyQe+bBSAPastL5ZR4R
         O3mQ==
X-Gm-Message-State: AOJu0YyFHkwV/6IZBiEbLPJOF8c0ZzQiw98ek7BrQJ/z/xCtmW6zXxsG
	XS48+1gdLevD6K7oM/xGrRsEIEmZLHEn6yUtoZMtaXNWE2+xzjLRkyD8vR7OWMNvhkeHWAWD6qF
	Do0VrMq4bFjcEiW2JdoKzMB6tPWMeekyV4mwF
X-Gm-Gg: AY/fxX5chVt373W7JmKO+hWfH8oZk1FHJ/9EGFzzwWGNO96qo4F7tnoCpY2JxRYcdpl
	TEq+GWR/wjuxgK/NPPcA/aPGMA/Z7V3bytU7/GAMfkdGBMe0dR5C+Q+Dil35swLKTwSgahtmyMq
	sQYYmXbkZp/YEvbAfoINW5i0znGtCqRlAsVX3fjDQ/xIZdx20XGAl1hu0r7Mo9PK/HjgXN0l6Bl
	LTTk9kPDM+JSpbAO//4bj5x9KEdRIYqd1i5ppguipOkepCGQvFSzDmxMqueGjqE0aNt/e1a
X-Received: by 2002:a05:620a:7009:b0:8b8:7f8d:c33c with SMTP id
 af79cd13be357-8c591a2d0f5mr297066185a.44.1768471317416; Thu, 15 Jan 2026
 02:01:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1768469892.git.liezhi.yang@windriver.com>
 <f69b7f8ddf584c045a6fa168f6add2850519e410.1768469892.git.liezhi.yang@windriver.com>
 <CANNYZj-C+1htk4XR-uaSbsCw8OwE-bskmucyw0qLkD4TnNDbTQ@mail.gmail.com> <e94a5ab8-88fd-457c-8130-8b738895787c@windriver.com>
In-Reply-To: <e94a5ab8-88fd-457c-8130-8b738895787c@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Jan 2026 11:01:45 +0100
X-Gm-Features: AZwV_QhcWCt7NWUd0xV9lzviRoIehe1N6Czii6r-4Zt9oCzOcXIQ1r-zjvhSh9M
Message-ID: <CANNYZj-_cRUQXiWij81yP4QaN3ewGYWrpc8o6FhhGev6R1D8gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] rpm: 4.20.1 -> 6.0.1
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 10:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229398

On Thu, 15 Jan 2026 at 10:59, Robert Yang <liezhi.yang@windriver.com> wrote:
> >> diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtools/rpm/rpm_6.0.1.bb
> >> similarity index 100%
> >> rename from meta/recipes-devtools/rpm/rpm_4.20.1.bb
> >> rename to meta/recipes-devtools/rpm/rpm_6.0.1.bb
> >
> > This can't be right?
>
> You're right, I was curious that why there wasn't errors for such an upgrade.
>
> I checked the PV and rpm file name, both of them are changed..., but I should
> update the SRCREV, I will re-do it.

I guess there's no tag= in SRC_URI at the moment, otherwise it
would've been caught?

Alex

