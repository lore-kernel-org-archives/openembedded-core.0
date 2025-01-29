Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AF3C02192
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 09:41:35 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.9039.1738143693360545878
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 01:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HBNZtI2b;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d92e457230so63838616d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 01:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738143692; x=1738748492; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rYsEnKEakdIpj1w8FKEZEYdbnixz8Ed8U5iQeOzf8Gg=;
        b=HBNZtI2b8JF3fsi9ryrXOGh7bxE/9jQBNgDeOUe2l0GeWYVQhZgoko4/vKA/pk9JZJ
         bhKDt8/FgbLw+bjIrMdMUKzgh5wbe5ie5xaIRQtyBzAjgHhAEqHK8KUlSMz2z1BBsJe7
         mbx2SD4qo76uWjLhPnZN6zJbNUsTPzDZ9WUne4duGrLoo+VRXAf9fPw3zC3qgwr0RTc6
         F7OdnmdTkEo1qA3G2zdv6NwIfVoh62487+D1yJpM3ugvuCFCQj0UPkDB7sU11aryNfwd
         W6pIgO5UNfDaW33DZ5QZCzZVpIkS2+8JAaCr6KDhJKaPJT0D+tYwJC2qsFHGlzvikX/d
         6sGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738143692; x=1738748492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYsEnKEakdIpj1w8FKEZEYdbnixz8Ed8U5iQeOzf8Gg=;
        b=lIy/6OksKqXYhHaJZLGyTvKOtdo2sALwtBmNJdkY7ZjkTWj6Y7bWZmYD1h+0oSZtv3
         oxe4EAZkAliU6AK3e0spvHFf55qliwW0t7BaVHMH39UZMUPpbmbm3DiQ3rckERQq5Ooh
         0BchozXbXE54FGv1DoelAS4dQ2IHSrHHdlm693tjEO2qadYE8CVi6Fhx8QY2c1N9nNWV
         l1BSwGa/cFweENVF3lveiIhnVHgaUa7Ks6IRtDSzHaHf/pYcR93Tr3RwhkZWiJ+E9zg6
         dwTCASWtP1hrSf+1uuGfWb/eP97gympWbyCAXGGahGbF81h5NOtJEAdLV5mZXtI3V8pz
         nJqw==
X-Forwarded-Encrypted: i=1; AJvYcCX4Xlz62FZEsvqM7hV+ocBXDzXaZru/7A7YqhQClXjGS6nWfyKThCb5fNZek1J9IHUtdaJEmfufyFFHYPy1MCC99Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7ovXRm8NeVEO2m0mFqS5qNDq4ZKLj48hqLViB7wo8FQDl1NX+
	IW/NFS/vsEw5uqyPmNRX9eVf1j5jPDhnk/s0knxanMGWQvke9gowBgUDX36achh2RP1jIF/pIS7
	yMJ/IQnAfY8QW7f9CRwbZU/H91rA=
X-Gm-Gg: ASbGncs8Lp+4X9v0W4tEm0q9WI2YYs2jG14UJu44AKlyI8okymg5PqJizw2r6lg2AI/
	Y+/nZQdtX+6FHmikrjitvRjff1R6rZdW5jXFnyYB11c0mveadXYfv6QAUJy+S6gcl1IUxPIqCSu
	gzEWZzrRq59TIIaoDDz6CfEhirP3Py1CQ=
X-Google-Smtp-Source: AGHT+IEVy+TOTPCVY6boAQGgm14hOpGcbhv2kpCsiBuXt4tJb0MLlLViE/7EHth1G3LXfUfvvIBu3mvA6HCOX6x92N0=
X-Received: by 2002:a05:6214:3112:b0:6da:dc79:a3cd with SMTP id
 6a1803df08f44-6e243a7f135mr37830546d6.0.1738143692404; Wed, 29 Jan 2025
 01:41:32 -0800 (PST)
MIME-Version: 1.0
References: <20250129080902.1863054-1-zboszor@gmail.com> <20250129080902.1863054-2-zboszor@gmail.com>
 <CANNYZj-pUVu_vp7DERcSF__LcRWi3oA4hocfEqfKPW_KxmrGZg@mail.gmail.com>
 <1b6439a8-3688-4d45-90ab-0eef473eb347@gmail.com> <181F1FDA3B65007A.31881@lists.openembedded.org>
In-Reply-To: <181F1FDA3B65007A.31881@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jan 2025 10:41:21 +0100
X-Gm-Features: AWEUYZmNeV_7ajP2SVy6p6emstywEAhv0CP6cFUT8pW_GydtPMWuBcqtnESkju8
Message-ID: <CANNYZj_hy4eoxfi6tX-mTsL7z+PLhmDr5GVFgiAXZdYvvF3mBA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/3] rpm-sequoia: New recipe for version 1.6.0
To: alex.kanavin@gmail.com
Cc: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 09:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210360

On Wed, 29 Jan 2025 at 10:30, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:

> Yes, cargo_do_install only copies executables, you need to opt into
> libraries by setting CARGO_INSTALL_LIBRARIES.
>
> But before that, presumably sequioa upstream has a standard
> installation procedure that we can try to use instead of copying files
> by hand?
>
> I'm particularly interested in how ${S}/target/release/rpm-sequoia.pc
> is supposed to be installed.

I looked a bit into this. It seems like they do not a standard install
procedure, and copying files by hand is indeed correct.

Alex

