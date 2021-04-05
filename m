Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.114.1617635101788252745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 08:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NnVC8Sga;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: jandryuk@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id v140so90493lfa.4
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=45yT5VsBmjtabDp2gAjUfPe98fuJN1RCuK71mCUvOew=;
        b=NnVC8SgadHfoeZJV2P5MidpmuVhwRCWe4F1+JiDDYHKQ5cr1F1BulriLs8c0ljzKy+
         1H4k16owL1WSvefJONIhdRZkXfr1zrWsQikF0oXWHcCg9FDX2y4i3qtiAXJc1ZoLMpAh
         cFAADmmJ7ije0gjziAMovG25ZLNoBnZMGwksr0yk2LMZpurXKegWVWx6dbNr+y4YINJK
         2PWVMN/MJyv5lhoncubLrp3Y1h6pjYqvLymdeLKmdBHbvlAgaesfBO6ILA89l8lcuzOw
         bQFpSRksY8exckKvpAeHvZxpVNEHNnaZmmQ7zWT2ssmih3GZWxNaHTeVqqWZwXApxOyN
         AZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=45yT5VsBmjtabDp2gAjUfPe98fuJN1RCuK71mCUvOew=;
        b=ApfcS/t2QcJLAwtulN3hKkfuVeTWoxWVCpNRqMzKz6bJzqeEpNP6ixY7OD1dVvw1MY
         0Rbwyt/HTgbzIB0TQTIYhX2axeH7cDgMS0glGUCDYOpKO+Juo9jTQCG7IF3kALXSlJGN
         UUqPmOI9ihCg4BYSd23TyQouOjTpZYb3mpsn7q5WyfTAJSy/B2Veep7ADMXA4bSKqXM+
         gPYtlZrckN+SVo/dsgVZ7E9mLQV0Ylw9XH3xhk1zYwOPphWk72kdtSF0d9E4KaPJ2mhF
         JVJrpGthqp08ia3tIC+CxdE8/lAwErPLfP7HTuyZb9tuQDeBy/B3fbCyHRff06nuoe0G
         ws8g==
X-Gm-Message-State: AOAM531W3T0eKdu48d3Kr8tMun8p4GlZIfwH7I4v5/jKrxiLOHGOtHUp
	pM8KtAUs/23wog5HpvRMxUb9PhIl7VSl3DrBvjc4ps04hG4=
X-Google-Smtp-Source: ABdhPJxPXJXrpj8cbOt2PYwML1X5yX032s04tfK7gOGpbqmoCTRGQVSUiH9p4SMyWtYL5OkHs2YGps8S0DjRumARQBI=
X-Received: by 2002:ac2:5932:: with SMTP id v18mr18456367lfi.659.1617635099616;
 Mon, 05 Apr 2021 08:04:59 -0700 (PDT)
MIME-Version: 1.0
From: "Jason Andryuk" <jandryuk@gmail.com>
Date: Mon, 5 Apr 2021 11:04:48 -0400
Message-ID: <CAKf6xpv-_TCa7KkStXEro0V3eYPN6eeMkvsAj0per3VoPe-K+g@mail.gmail.com>
Subject: do_image_qa and IMAGE_QA_COMMANDS
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I noticed what may be a bug with do_image_qa and IMAGE_QA_COMMANDS.
My terminology may be a little off, but hopefully you get my point.

It seems the script content hash of a IMAGE_QA_COMMANDS command is not
added to the do_image_qa task hash.

For example, I have:
IMAGE_QA_COMMANDS += " \
        do_image_check_module_sigs \
"

If I change do_image_check_module_sigs and re-run the image recipe,
bitbake does not execute do_image_qa with the new
do_image_check_module_sigs.

It's not a big deal, but it made it tricky to test my qa command.
When it was a standalone task (before I knew about IMAGE_QA_COMMANDS)
the task was re-executed with every change.

Regards,
Jason
