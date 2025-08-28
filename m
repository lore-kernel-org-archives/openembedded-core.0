Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47472CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 18:08:21 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.4306.1756404499790132283
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 11:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gLLIICn9;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-70a9f5dfa62so11389836d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756404499; x=1757009299; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QhN4FeWQxlBuNeF29kmOmxe6sx/QThS6eKa+aHg6tw4=;
        b=gLLIICn95cJMjBTVvY5n+2Gnzd84xMOhqAiVV6BWTHFlsH11QzYuiRnD042CJzrk+x
         hQaJjrSKbZvUEwFw1l6YiAZRN3gjpleXohn2qxvG3d9yjVha7O+eOrv2YibkJp2iawbj
         IA4yONxslgXgw7CDiG/Os1vJ4BjwFYNsXCY+KB11G6JMzhnuy75jJl8JuMwz8HRJ4Y1Z
         NIGDVU8rTkhK28hTk3HaMoRUNjGTsjCvT0woXi84EFOuMerHhzcN0EIYhS2+KGZWUmDm
         km1g6JN9b8Ac3ZzZoV7W5kHY5IuPL3I7X4849gzCCHh6U0UB9WZqgZsVBsqFib7+PkXA
         nk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756404499; x=1757009299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhN4FeWQxlBuNeF29kmOmxe6sx/QThS6eKa+aHg6tw4=;
        b=MMHyxBV4wiAbiA0Xk0VnG+HPO/iTpTH36OpWdn3RMV2QSiVTw529PBOY02BGfkwheV
         GvEeMqfHJLVvpvhrsMkuOj2BsomWo2bUACdlmke9AvKZr9CTuRYOD8AtEynwwAwtSddG
         tpYAJ2WEHgHtZ4e3Ra4cCd65+CJmyBxqoUCKIu4SY9191L7aEDQVi3x1XDHj9M4/NS7T
         Ylp8ufN7GXP5EWIgp68d4ySZNFDfCuDRMVOzMO/RjWNmH9o9TaOnVnLlwhWPYyFmHrXv
         lLBeGRP1uJgxaZPtueet9VaRIBCnlIU2LCOFLi48vaN/rFC5mPfMomBYrRSFBfsc7bus
         tI+A==
X-Forwarded-Encrypted: i=1; AJvYcCW7glzdd/2M0GQYXMjjHFkaS/CpexLLfOZnZB7NLLdCejPIlNivKPHYFT/Vefz+naEbfLhHBqc105DO7acev1ZnLA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyA46WJUUvTnNwQhL8sxqcYYif6jvDlCaDFzLfL5nfJMgUlMFQ3
	KAAhpEVr7Dj9WFTi1uR5UgLPxpRr1S8GtqfKoDWUHoQGVNmtwnF+P5AFJKblOXquhNM2lvsdmpO
	aZgQVU2RvWDI8FgIjg8AOFatGiJ/vt5gZ2UdN
X-Gm-Gg: ASbGnctT5C43ftt4S0wjiKYgIaT0z37YS2q0Gu+EeIQyAJvrX6UwgaXqEDQeNbHWjup
	LAvKWzDxSFDA43qLh1NpqnzFZwlwWsNiqtqhH+xh8VqIMNbp/APIikVumoLBes6aYbQp6yEuIOw
	MHu9q+PJWgYAncRxfMxpRfDmOf1uovhNGasNQ7r71tvnpXEHOq5BQXFFWym9gZy1wi1WJ3CKtqV
	HIFoGCLrA16uRhfAwg=
X-Google-Smtp-Source: AGHT+IHK71BQEjVq9ceL0I4mOD9JKeN3QeKepvP8ZQpSgRIQbYODDW5sOGSNMozjpSwPLP5fDoBJ7g7upW8nbckedZM=
X-Received: by 2002:ad4:5ec6:0:b0:70d:e60a:c35a with SMTP id
 6a1803df08f44-70de60b33f3mr76557696d6.53.1756404498645; Thu, 28 Aug 2025
 11:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250827222051.367093-1-a-christidis@ti.com> <CAMSfU+498tFH0DSdi+NyFqAaDHQ-qxQgT149fjOBNxHr-2O8gQ@mail.gmail.com>
 <CANNYZj8nW8WKvQ6o4EsQe_F-6C3p5BGTww8i66Ku348+eFxD9Q@mail.gmail.com> <CAMSfU+5zuq=KwWnp0OrZTQ4s9RrSgPnh1K+GCLDSq8NFK9jE-g@mail.gmail.com>
In-Reply-To: <CAMSfU+5zuq=KwWnp0OrZTQ4s9RrSgPnh1K+GCLDSq8NFK9jE-g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Aug 2025 20:08:04 +0200
X-Gm-Features: Ac12FXxP3_qnCZaTbwUsfspXklMwcXgBU4Nq4JMoSHAFxUCM4Wdt-ny8hPPx6nI
Message-ID: <CANNYZj9VBtTkEagr7r+WsX6mgeTc2N57tkQ+XO7u6XUTxusD=Q@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] libsdl2: Add tests package and ptest support
To: Yoann Congal <yoann.congal@smile.fr>
Cc: a-christidis@ti.com, openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, alex@linutronix.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 18:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222588

On Thu, 28 Aug 2025 at 17:24, Yoann Congal <yoann.congal@smile.fr> wrote:

> That is the whole point of the ticket: realign what the existings run-ptest scripts do, what the dos says, what the code running tests expects (ptest-runner & testimage)
> Maybe we should talk about it in a tuesday call?

We can talk, but I do not think it is realistic to have new
requirements on run-ptest, especially around return codes. They are
expected to print at least one PASS or FAIL, and it stops there.

Alex

