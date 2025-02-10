Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC35CC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 12:04:19 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.49024.1739189023619494113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 04:03:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cAYrn09v;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c05c2dc5ddso106431485a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 04:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739189022; x=1739793822; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C9ixCg0PNIq4bkyTkptWRq85aF2Fgl+JlSwJbAKHEt0=;
        b=cAYrn09vHzql7s4pt5dJmHlBTXNZmvQ/62etqo37gMyF8VZ7dYMPISox2PTnP1o5uI
         7qYewzkA3bq9dm5Bh6i5PvxIKJ5jkvCDomAxeBOTXBenfHijvTl3KiTKxBVuPrhYbaYW
         rxbJ9oLuPlRzd4QGY9J8Hb6aKhifuoF4HTyxmqWYO1csCk9CUCHkIdBtZ2U/CqgTWCzQ
         lRuQUZiGlHRzgBRM84a8Rgbx/1/O+J6+59J10XFYfMzZ8Y3xtNM/g81P/D4VhikKo7O1
         UvZK9KroF+iYw2jaEwCKC37Jr25+xYZdboIHSl4BiwM56LaAPArhBxcxbNjeqcO58lkC
         ks/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739189022; x=1739793822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9ixCg0PNIq4bkyTkptWRq85aF2Fgl+JlSwJbAKHEt0=;
        b=ukxtH5dnqxwYDQzjhFK01djX/rkHCQzyQX0M4DQSV8mwdPn4gxaz0dcfE00qHtuuMS
         y+Xh8L+KmDE7FiDymT2WbO0bYW9vDU6zk2jdE+/smVr8cB5THXLBNDOZ60lthM0zSHH1
         R7jyL+wE7y8lX9UFU4jnxOOQ/qx0MZPUWLZs6lSX2a9qyefjQ7kgk/509cXo+69MdjZ7
         GIUji3sZqQycS6zn5Y1n24EMN1Jm0TQ3eEeh8WNXuTL6Ru/HntlrhZlSWcXIxdKD5N0F
         j8s9FqOvUYO0YRpzCaZwKnXNZFkJ8CACHJpuzftg7pFBseMsnkb+5uUJrO/7BQfG1NCX
         4f9w==
X-Forwarded-Encrypted: i=1; AJvYcCV2j4OXWMrUQEtGuRW/NMXRI3+5SIf+PLTR0hJH6aQU9awjRj5gKmvNRxFFYiDKt19VWbCiNx23fWoiupV/kCAYag==@lists.openembedded.org
X-Gm-Message-State: AOJu0YynimwcMFETuk0rZUSTQd33vsmcbo4yDBVhbJbUGtIBq8miIUiw
	qox4zR2Xql7kjRlrxmP2kitJG488rsb4r3FMUom/lt18EDrFey2Ox3Lj5UiQ8z4eSdDJyDkTZ5e
	+Z08bBf5bdig5KVkVfJPNkh9bN8w=
X-Gm-Gg: ASbGncsfSUO3J5ep0jXEKZVjgG4r0ED3XhZx6ZlujVT63fc2T2sno2SsCas4tYkzDLo
	uFOJmtO3ZF2l5Oc+RYknRfhJKuYod+uQhVWjIN/jzWC5tazw+aFG+iZecROPVEIAjIz2+sTVxt9
	QcU+9XW2bIgLSTOrSnQEvCiX00hLCmMf0=
X-Google-Smtp-Source: AGHT+IG90X7y6usODHqYGN1/WgQ89XDSN/+WcqMe2HRIRBrf2qZwsRqMQzRJxMuvAimis4yif+ue+UJetX1xKQ/+iSU=
X-Received: by 2002:a05:6214:21a1:b0:6e4:4331:aae6 with SMTP id
 6a1803df08f44-6e44574089cmr172953516d6.39.1739189022476; Mon, 10 Feb 2025
 04:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20250206144907.1924993-1-oobitots@cisco.com> <E631A283-5721-4E5C-A65B-5A8CC986A600@arm.com>
 <PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Feb 2025 13:03:30 +0100
X-Gm-Features: AWEUYZmE9ux178kgfwwBoxMR4DM6MXM4lR9SDIbCSvzf-Hx3Xm1sFhTmT18PCfk
Message-ID: <CANNYZj8rSuhpT6eoWA5eudSkKZFkqcfcSWgL6YogcX1f1qjLFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate subpackage
To: oobitots@cisco.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Ruslan Bilovol (rbilovol)" <rbilovol@cisco.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 12:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211094

On Mon, 10 Feb 2025 at 13:01, Oleksiy Obitotskyy via
lists.openembedded.org <oobitots=cisco.com@lists.openembedded.org>
wrote:
> We have next situation:
> - a lot of software components that depend on packages and deploy all packages they depend on locally inside component.
> - some components directly depend on systemctl only (e.g. this binary used in scripts), so for every component we have to deploy whole systemd locally.
> - finally, all/some of those components will be merged in some way and will use systemd/libsystemd, but until then it will be nice to get rid of such duplication.

I'm sorry, but this does not quite make sense. You need to more
specifically describe what 'deploying whole systemd' means, and why is
that problematic.

Alex

