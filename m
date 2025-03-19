Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B66C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 09:40:50 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.3911.1742377242747231824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 02:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VMrnyh0c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso40798585e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742377241; x=1742982041; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJ3QAO9PKP36Ndx3fLA6zhhNOAPAVPsgLqZmtWn1GDA=;
        b=VMrnyh0cXBk+40CAW5Gc6Y3s39PP2la+YCr78tbjiiKI4hzBUpR4NPWIA3EqBmUaS4
         mBXNfw4uJ/H9M24ccqrBPMdJw7GrCHR0DYjhyg22fAkVKStm/tI8vokHhVcVwca4k9TE
         QihZqxICHRgwRQXblo7edLUEXc+mHyaP8Wnjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742377241; x=1742982041;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wJ3QAO9PKP36Ndx3fLA6zhhNOAPAVPsgLqZmtWn1GDA=;
        b=nuTxQYtocuw5L3SJf8cAk5AoMdJMJOMWY8KrDmoZOvfyWGVJt0P8/hHG0Um4fPCEXi
         hFuEpJssi0mXzt+weVK7494GhjDsj8WL5BZzSQTOFfs5qHK58+6RQXT7AOyGqk5Irpb/
         /Zs/2c0kLQ96j/vqV17JLAMeWLhg6XstNJtnk5unTXoE1yiRQV2sGP2tO7jvuAdjq5h4
         eoVzgu9C3zyb7mq/AxT+/QpbeeZkwkx9/QxIGY/ZFiImY+fLYmdjt1irsTZQ5kRRpS7c
         i/+3/r7lXB5AELZBS7shHHX3YJEKa2JMKekKpt40hKKgfvhA5RNDfe0XG2vuNi4d7oYI
         4oaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl7OHjSiphWaUf2y/68PZJsZekMKJ/Rj6B3Gsys8FhHuAqQy5C+5LejfbyH/dwGnAkQXroDxwkOsuErhuwIf428Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxsxzKjxBglI15RqLCx7qg5s6trltXUHwoenyH5clK3XlGmdMS+
	UnuNqRR4wAsOUqbwv+T035+46da/Ybar91MVccyQCZnXeRW39ioFa3hXjBjFHAk=
X-Gm-Gg: ASbGncvW006TrmGx1ihGQ4OXdhcjl1YQ4bDEn/KeOkuc5xG1N/JSSkqNpu64j2eRj8t
	ZD6ht0zAOFXxS3lCahCc10D2FaxWfQWu68Pg05sC82A2cmO0EojGd2vOSxQXE3flq86+PAFkfr3
	iZ9P81gDz5pzI34O75SoeFHc9bd+BohyTxcWcgURwL7oWLJBlv4amsgGqWMaPGZ0b90V784Noo/
	KY8x8J+FYbuCU36OArHoBG3IKcZYBExDgmwbF49dx8V7bCA5QcZN9oKJBAxfHTAmdw07VvZgyPS
	nFhw1CGfDHp3lDvMpK5ldijBGlOz++I+NKQ4cVGgKTuyBcHw7k8/SI6ZRHVGUmIsVZrXQqaM0WV
	OcotA5G8WHkEEFbA8CA5fR07ruUNT4XY=
X-Google-Smtp-Source: AGHT+IFnNKE/AygTbUIWXMqIwub3fmh2YReZyNl6zjDmz11K4XjOdVB8Ihv+V7FfPf7kLlsi29II4w==
X-Received: by 2002:a05:600c:4e0e:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-43d438abf5bmr15878585e9.31.1742377241055;
        Wed, 19 Mar 2025 02:40:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:dad:b471:9c34:4577? ([2001:8b0:aba:5f3c:dad:b471:9c34:4577])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f6bf09sm13570615e9.26.2025.03.19.02.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:40:40 -0700 (PDT)
Message-ID: <9f97a4f6c9b8a5bc55f862f69012bb9e8d11a1b9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 01/27] webkitgtk: 2.46.6 -> 2.48.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 19 Mar 2025 09:40:39 +0000
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 09:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213316

Hi Khem,

I appreciate this patch series is a work in progress and evolving but
it is creating a headache for those trying to help merge patches.

The problem is that we have bits of this series already going through
testing/review. We now have a v3 and no idea which bits of it have
changed. The logical thing for us to do is throw away what we've done
and start again. If you could give an idea of what has changed that
would help.

Cheers,

Richard



