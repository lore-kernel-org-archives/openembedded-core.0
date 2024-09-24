Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A98DCF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 08:23:42 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.8925.1727166215239454453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 01:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mqEhD9il;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-537a2a2c74fso1550152e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 01:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727166213; x=1727771013; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qjnQI1yTVq66H81FSStrFpcDurgqVt9JlmRSh3TVknI=;
        b=mqEhD9il9StIzzHNhG8vPraURMg3wWAZaER3a3DvpK8Yo5kEvOAFnaQc/81ZavHtWp
         3JCjnE+44lJleq+lRQ6O4f/64P3qbazy+/j08PiOk51C1l8raq3P9ZjoLKMrf0yZWORS
         ZARpIWNxQ95GkOPVUjyMqqN2zrrYRLfm9c3Lq+iW2F8rUnKbAH9KLZBZGwW/fgLU/85V
         fep3uEta32RQ7mq2lovpJMT+ZPQSmCkMlIBXBodXXMYMveZoB9YOox6fnCY65fk2CvvD
         A7FuXdGgpFMxVAB/RYpAfJSNrvAz1ji41aDd0fzXvAkggx/8zgu9UFeu9zqVIrI/gaBP
         J5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727166213; x=1727771013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjnQI1yTVq66H81FSStrFpcDurgqVt9JlmRSh3TVknI=;
        b=rI/DK8Mp6ppqR21NyZcirUrrEm6g3ZQ4z+GjCXFp2HBHJqtSjiJRgrWrHn64VMM8rI
         kvNmI764NxIxMlHFvaysoLI3yKih2VxUBIGQ1tJ4yP+DuV6PlA087S5OS/YwAD2rWtkO
         OIPBfgdA2OciD7WcA8TsODwQJL6BM+WA/npRMV0ifacfQpFW4rJzGbCSIJkW8uVnus//
         e/zEvMqBxXB+fjFkv5zT4VnILML26FbFRxD2z/2ItiIVJM05aYfR0Tc25GFun87Nm9Vh
         Wj4KYto7CSVtVsrrLU5sH1lgVN7r4NSmZgXmJjwv0sheMXeIffeZ7Q0CO+KwRyqx3hSH
         y3mw==
X-Forwarded-Encrypted: i=1; AJvYcCWmxnJtQTn4cLdxu4KSkyEWf02CgMFYWdc8fMGSNn+20/hiobbO08D7LBpKPwtfMWatneY8qjCTU+Fu7w9+spLxyg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyp78qZspryEVckNaW83yW8OAd+ZM8BUpSuOjGZ6NnccykjR5aR
	yvPugTV3vtQt9D54Uf/mPGe8cw4EJiDqJO/YwR3ZKFrbPZ6SZZQsoJQNlOhhO4TyPiP9OIDnP+R
	QoKLXWEzEgptjIEUEQAH4ljk9sgc=
X-Google-Smtp-Source: AGHT+IHYfoSAcauq+m4yquPczF9C0G3R+IqO4D5+TFkouxWgtjakbFuWGKbMSUOKE/ndLiHwuwGQYVrKwQ4wLxTmOQM=
X-Received: by 2002:ac2:4e0e:0:b0:535:6707:80a3 with SMTP id
 2adb3069b0e04-537a6921621mr750407e87.28.1727166212854; Tue, 24 Sep 2024
 01:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1726821150.git.liezhi.yang@windriver.com>
 <CANNYZj9SyrR1TMWY3ehfbT+-rrDQqfKVSiN-thQQBoVwXK+uxQ@mail.gmail.com>
 <0738ba86-15be-4c53-a8a3-624c65eef18e@windriver.com> <CANNYZj-VTYcBgd8TDdwsE+Zww3LCH2tiAzOUUuU+9SkubczPUA@mail.gmail.com>
 <4285e3a9-7db3-429b-abe6-3f299555c3b7@windriver.com>
In-Reply-To: <4285e3a9-7db3-429b-abe6-3f299555c3b7@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Sep 2024 10:23:21 +0200
Message-ID: <CANNYZj8BsidvTgthc4t+L7QC_GDzmHk67-BSMAYkYvaQxeJVsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] proposal: Append VENDOR_REVISION to PR for
 CVE scanners
To: Robert Yang <liezhi.yang@windriver.com>
Cc: david.reyna@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 08:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204841

On Tue, 24 Sept 2024 at 10:18, Robert Yang <liezhi.yang@windriver.com> wrote:
> > done by users in local installations? This does appear hack-ish to me,
> > the better thing to do would be to actually include the list of fixed
> > CVEs into package metadata.
>
> The problem is that Trivy can't work in this way AFAIK.

You do need to raise this with trivy. It's open source, and can be improved.

This whole CVE ecosystem is already mad enough and that's why I'm not
getting involved, managing vendor revisions instead of directly
looking at what has been fixed is just adding to that madness.

Or let's just not use broken external tools, and do things right ourselves.

Alex

