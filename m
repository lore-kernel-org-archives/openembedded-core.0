Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C62C021B2
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 10:28:41 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.46291.1740047313682239519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 02:28:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZL9RcW+q;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-472039adb9bso9417471cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 02:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740047312; x=1740652112; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r77kXGQBqlBZ591Gzp61s5NSpm34pfn+QBt8zlzZWKM=;
        b=ZL9RcW+qFVrqlicmhnNIxlV6DFfc3FO/suj8h6kPllq+z7I2rC27pNHU34v2jTfL3r
         yXtLDSuF0FrBHTuvoyOnpiysRDFwj54qFZEJje2AM98H5DVsYFAPkb2kmC9axauUByez
         QheSmdmZdumleBAbtP8oE5LzIzQYOOkyahLzmrpHXWd5D9/LzeUYBqM7ffHr3lsVXnlZ
         RV/OLz1W0S1xhscG67e18u0gZAi/uAjusfA4/afhUv7tPp2OXCAk+AlctVgrA28+gNhn
         H4RsPgTOjFZi/I+AsPbUE6lCHNNjo2UsORue7dy8vqZnI0kY0M0amjsMU9vtJ1yApZML
         egdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740047312; x=1740652112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r77kXGQBqlBZ591Gzp61s5NSpm34pfn+QBt8zlzZWKM=;
        b=MAhKAT47xvsiok9VwunPHX/HRZ2Edk78d29b8UbbwzWvD1WcTqEc8ZL2n7NTxExMy1
         yIFMwWB4/1oLTBuqkf3juk+Z2DqqlAUlaLk6wsGidGJXBkIpjAicwzQCYsmy6k1rWeS0
         WzKqdHX7pZ/u/Olbh1bl13vEEY7mWCi1FVcTffNsccNTaoZQi5GgH8+YeliK0qouz0Dh
         9m2KO1MQBfDo6xylJYbvoHF1YMW9fDaPPtKCpO7tr4O/HV2MiIgUYnYF94h2jecsdjI2
         pRH3fw8kTmzUVyB6ykIPVdF9oUIvsSkXZiyBqUnMScUx6ZNwG8PLSVE5NKQ/2XSkExA7
         c95w==
X-Gm-Message-State: AOJu0Yyc7pGdnkqhHyCEwplgwFN/Ct3lQVR6LluZAZCw4iyll1s5vbCk
	bYkYUQDfeRTrH+lGZKeieA93tPCos2v7pVBQ4cdpjEQRDgcbk6kB8vtyIFVrkAY9Bz9gAG1mSL0
	BaX7ilFhDGhdQcAtOzQ0T08Jo2YwKAf5O
X-Gm-Gg: ASbGnct7xQAu8YLOYAs5qH6sj6VBKY91FhogL7eERDiwnIQUt1epV6guhcgN9gqU6LN
	k61SCvYsHLuEDAqM04Ss69gygP+qiZh1vAVsvD8RksEzHh8ypLX2W3TBdiUr7H8AjzsTrDKvVmP
	I5JM+AhjFoNXVeoifpBq3kZVKEsyONcA8=
X-Google-Smtp-Source: AGHT+IF4kSufA7CtEY5Hw1yRBvLMsIsATvUvq813In3WZ8M+keUmMZyU7qGsDwy+iBqiqjoxOqeFTdGst3soG6tR4BA=
X-Received: by 2002:a05:620a:450b:b0:7c0:7f7c:74fc with SMTP id
 af79cd13be357-7c0b5331896mr900627185a.48.1740047312426; Thu, 20 Feb 2025
 02:28:32 -0800 (PST)
MIME-Version: 1.0
References: <20250220043120.2347746-1-Qi.Chen@windriver.com>
In-Reply-To: <20250220043120.2347746-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Feb 2025 11:28:21 +0100
X-Gm-Features: AWEUYZlT29XrTgS8xmeul2nJ7CBDOY4bqwBNjEtjky0nWkmCyhUkvx-MqBakb0o
Message-ID: <CANNYZj8+28Hc-=kUMarP9V+xJ9RJfrL1kZj4stH5At=gB9xgvg@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2] debugedit: fix build failure when enabling DEBUG_BUILD
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 10:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211752

On Thu, 20 Feb 2025 at 05:31, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> +Upstream-Status: Backport [820498e881401a6f4b1715dc6831da965f6e1d69]

This doesn't say where the commit can be found. It's better to point
to the git web ui:

https://sourceware.org/cgit/debugedit/commit/?id=820498e881401a6f4b1715dc6831da965f6e1d69

Alex

