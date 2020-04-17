Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web11.7979.1587124909533992165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 05:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n1aiUlra;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id z12so1831975ilb.10
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2020 05:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KhpnbBTWOx4rvVSCdGB4Kb6+gqldkKcw4VYeUfzifjo=;
        b=n1aiUlraxFR4bTP6G1AjLQ7b3hhZ3WM33+ztha3Vc5Qd1wGDF8XQptCdITwfFRFhZl
         DdYKnZw/pZwEjY7F7ynVsT+SYCuhSOikxPh7UXQHa2cbDw2uq2Z2OW14/X/8KFo9Ae72
         nYblsSAQQbF3tjF4YNO8qGOSyFFzx/ZN/CzYc37uQUn2/jRiz7XaFNvvFiB0U6zGegdX
         WkqBbxVcAvtKSfD2Yr4yHp3CU7w6YUgmEyd3TxuE16L3/vrQRNqmpr/1Y3Yqy/yIr3Cy
         AEwIQNcGp87L0kCQu2iOypXMwY5uw2U8dC492Cx+fgHdxKMGM44aKPJHnQyG4Vhwidjr
         7QxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KhpnbBTWOx4rvVSCdGB4Kb6+gqldkKcw4VYeUfzifjo=;
        b=Ts1ea3oW0SfjiEA6r+GQEOC8w1KRx9v5Th6y1UQeyZjnrddk2frZdJGVU8hezOKlwm
         iQNBDVUFdvCm1HTvK9XNo9dGsJrnWkZO3jFO6ojeMbV/Jqz0PO1B3h36wAMYuBAHGpLb
         WUTqt52Zg4x5Pc1A0IKFxbIHEVJAph1OeE4WMvcfC5yB4fySkT/v3QNp4BpO1loQDd5b
         PAi8PgcOtOvwmYngZlRqjevD5rKK9ACJ3IchTx39CUIrx5JPL2KTt+HQdBnv7qQxs2yW
         /Mc3CIVq/bo9gV1W+PIXRMH5wJFkpcIV98NKIxuxZBjIDjb5WJKur7OJaG7CI3QuJvk3
         lmcg==
X-Gm-Message-State: AGi0Pua4XvzzfMAiW8zitm/BiCyKKZQqr310pKjvv0qykdf+YGgyjMo0
	tFwizuRPXw3lTlEhoFIDGrV6/vqUXV3hItp3UBzDSflIek0=
X-Google-Smtp-Source: APiQypKZFxExe1W7waRr9fXj3a5pAkuuG5ROkm7BPuGK0DA+yD6fUgyB/4ltk3y6H8+Ytvc3rOenlEHLUwMtp6NHGVM=
X-Received: by 2002:a92:ba01:: with SMTP id o1mr2495623ili.217.1587124908907;
 Fri, 17 Apr 2020 05:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <1ae8755c596f479892ff0795d3fc869d@XBOX03.axis.com>
In-Reply-To: <1ae8755c596f479892ff0795d3fc869d@XBOX03.axis.com>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Fri, 17 Apr 2020 13:01:37 +0100
Message-ID: <CAO5Uq5QS8kwYKQ0zDtET5K9efjgJctKejRBmsHzGhTfo_fGUWw@mail.gmail.com>
Subject: Re: Creation of /etc/machine-id
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "OE Core (openembedded-core@lists.openembedded.org)" <openembedded-core@lists.openembedded.org>, 
	Jonas Bonn <jonas@norrbonn.se>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 17, 2020 at 12:49 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> In May last year, two changes were integrated related to how
> /etc/machine-id is created. The first [1] moved the creation
> from the systemd recipe to rootfs-postcommands.bbclass. The
> second [2] introduced creation of it via image.bbclass and
> systemd-systemctl-native unless the stateless-rootfs distro
> feature is set.
>
> When I look at these changes, I get the feeling that the
> second will never have any impact since the first will always
> create the /etc/machine-id file for all images (as long as
> systemd is enabled).
>
> Should the creation of /etc/machine-id be removed from
> rootfs-postcommands.bbclass so that it is only created in
> image.bbclass where there is extra logic to handle the
> stateless case?
>

Oddly enough, I was staring at that a few days ago and I think you're
completely right, the one in rootfs-postcommands is redundant. I
suspect I should have removed it as part of c5fb399f5894 ("systemd:
Default to non-stateless images").

> //Peter
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=76444b63e614baea33c044851a5859f6d1e69729
> [2] https://git.openembedded.org/openembedded-core/commit/?id=c5fb399f5894c16cf8eeadd507dc38c29b0fd657
>


-- 
Alex Kiernan
