Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8DDD78771
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 13:30:29 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16709.1766151029094093945
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 05:30:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gz1kK7mN;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8888546d570so23838286d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 05:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766151028; x=1766755828; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Xp9cIRUPK1KDRiMFYc3yLDlYTGMfCQ9dQd76/C9NY4=;
        b=gz1kK7mNIneTOr2wQWEVUKNJmtl+yB5OB2wHiJUfZIKUwvtl8HnJ3RERcjHF+6K7Db
         hfrbNDeCHxfun7ZteziXeEudzQKf8JNzkfjAzUTU6p8zobMao/mpagITK1lok7c+BiA+
         WiJFiREvRhaC3Jk13heqXk7OzF/6mztlM3/NSy8FeXC6mNcI28+q+BUMZ95/UYMpyVar
         OSKgsRI1h9LtFwVhZqpKkuWUTSSoL6sUH8PPFVRuEjbnCRXO5mgXKFjeqOCY02w/vF+T
         fk5yFE/bUmqaG1wWhFPC7PgbUIEPaETkmzJcuyrIpk4Q1QPCOvmNNmt4FNlUZe3ka6l6
         qM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766151028; x=1766755828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Xp9cIRUPK1KDRiMFYc3yLDlYTGMfCQ9dQd76/C9NY4=;
        b=wUG1McGPbVbSDH+dG3+mkpRxSvtWCWJ0aow4VY0aEjVJXqZmWd9wIue1m03naQp91v
         vELqBfN525Ibq5lh5rcyvt95hivGsMJ6+4yI/1Be6U02ESbhRJKX81Vbrf727KIYZvFm
         Bdmkyj+HL1Lc3ZoP2H3JaZs3dWt1nsT+O+EIPrabipWjurkfyJuPIUsVeoj/iuWgTJHo
         zH9gDdPwzdNGvsZcwKyxzuIz5TJkdYQhrcn6UEVj6rFOQwQxZUUGFXHy3OcwG1D/Rm/g
         3UPNR2+DG2iK6N6hoh3cyEoe7gt1R3A88X0Dq5Nb1UBR5fjJm0pAlqM290g481n08v/E
         DEjg==
X-Gm-Message-State: AOJu0YyArE0Cd6AL1dDL/+f6D0iN8iwUUwmYsUIENClbS7FdVk9d6FB5
	GFZ5QYQrXGZCUO9o73z8XpJR3ixoR0l/qtmT8IbxWv2Wv7dAb4F6SJUVqoy/i9fZmcKbSbrzv/2
	B/CLbiIb6RD1AzSVez20oc/9gtt7zJ8w=
X-Gm-Gg: AY/fxX7pHvggThBM9vxxfH1mTP/OAC5b4iKjUJad01/9QYqJ9rrUo9mOP2vW5bkUkmw
	SfUpmDa7EefYpLH9suecVc0ClzmzTDKJQ/f3vZAQW2BhYxoEjx9qAJZwCorbnyfaii5Sfhs4ZuX
	URlBzM//vZKPJ1NaVeMT/XUbNKiOudC8x55RF+NNvQA2ZaxFqtgvjg5aAjzYijWAs0AO1vCxCrS
	8xhipBdv5uP60113HxzzzHZ2G2PDxsw2jmCUVqDr19PNrglU6Uk1GNY8/kSHp+G7IhB491B3ToU
	nmiHwC5lHy0y+oye9Q6hd+6wkj5kag==
X-Google-Smtp-Source: AGHT+IE6sn7L1xySuy/dwizC+CA6bh+hqEg9HvjkiaoHEdoWrCkn641hi0I7b5KJO/GXjiI/nEtDjscyTlV1lrhBL3w=
X-Received: by 2002:a05:6214:540e:b0:888:59d6:fc74 with SMTP id
 6a1803df08f44-88d881b88c4mr53389076d6.62.1766151027484; Fri, 19 Dec 2025
 05:30:27 -0800 (PST)
MIME-Version: 1.0
References: <20251219124928.1474117-1-vishal.gupta_1@bbl.philips.com>
In-Reply-To: <20251219124928.1474117-1-vishal.gupta_1@bbl.philips.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Dec 2025 14:30:15 +0100
X-Gm-Features: AQt7F2pt3UnMrXedVha7BYISWR-uA8Steh__vLinfl3BuncSAO6Okh4QMbE63A4
Message-ID: <CANNYZj-xn-KQUFor=QFG_OBq0MF1tuBacUYyQJUDwF2gqnZA9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] wpa-supplicant: fix sed expression
To: vishal.gupta_1@bbl.philips.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 13:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228231

On Fri, 19 Dec 2025 at 14:18, Vishal Gupta via lists.openembedded.org
<vishal.gupta_1=bbl.philips.com@lists.openembedded.org> wrote:
> The current expression does not remove CONFIG_TLS
> because the line begins with '#'. Updated the
> expression to make the leading '#' optional so
> that CONFIG_TLS is deleted whether or not the
> line starts with '#'.

But if the line starts with then it's perhaps unneeded to remove it as
its only a comment? What is the use case for doing it?

Alex

