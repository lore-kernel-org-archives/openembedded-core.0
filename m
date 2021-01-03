Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web12.24109.1609674495938902608
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jan 2021 03:48:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PiN1sN7R;
 spf=pass (domain: konsulko.com, ip: 209.85.210.48, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f48.google.com with SMTP id j12so23492302ota.7
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Jan 2021 03:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=okBzS4iAIJM17/WUTYa2Ap+UnWCZRMNiSREiMCGzREI=;
        b=PiN1sN7RfBCTT0pzZJAGQ274D52AIqWswkphqLZrFa15tcU7UwR9t19olb0fKhAwSb
         MISoEwICkSnDN0Da6QXuLD9vrFNZzrkPwWAR/8pGrStfhGlmChuKs8QKtNT6JA72AG+c
         wokthfJ7BDKRpf+Kx3dnNofdBsT4xRbFx2rb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=okBzS4iAIJM17/WUTYa2Ap+UnWCZRMNiSREiMCGzREI=;
        b=QZS8Y+T6I997gefAxwLpn+k+dFzNh1K3HIcN2uROMoWyA6fLduzJeyiwBv5u380zPU
         SzN/ScxCa4IlvYjJKI5warTMiPP/e8gXKTTufmwKxiCPLUu7TEqqvKY6Igi/MJpwW3DF
         3sgaups9jfr6BUVoIRmStPwqI+ttB08XiEGaBVq6Q0cz8AdfRQIGV0OZT4Z/dnDh4x5Q
         6vYdjynbixe3I6jDORWDm3vms8z0GiT53sgiF8FHg9nPMJwBUzNx6b0QnXEk+3/JZIbS
         cEk+MZh0T9JgwrdWKVL7m7GrV5clCGbzXX+lHpLUDD4yAWFyQ7Frms8Vty1lkay0Pjxn
         3jcw==
X-Gm-Message-State: AOAM531q8T09K+UO8pF0ZAnHHo4PQP9whH/t65CWOB5ftAnlgn0D7j+K
	IwkuKdDuKlbLtqunJgfrLFo5ePqq6t0ZJQ6jgbzIow==
X-Google-Smtp-Source: ABdhPJw3mAMr18J2NSoTW5nkKKJupiV/gwnt4an+0FDs+B1+ip5W1HHO0VpSLe0NhJrwT8m9eBK0tTAuoojTYln6swo=
X-Received: by 2002:a9d:136:: with SMTP id 51mr48655211otu.92.1609674495242;
 Sun, 03 Jan 2021 03:48:15 -0800 (PST)
MIME-Version: 1.0
References: <1608804087-15784-1-git-send-email-mshah@mvista.com>
In-Reply-To: <1608804087-15784-1-git-send-email-mshah@mvista.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Sun, 3 Jan 2021 11:48:06 +0000
Message-ID: <CAM9ZRVuPpM3HT0oRyMDo9viO7gpwsQONoQaY7MoaCkXahmWU1Q@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2] oe-pkgdata-util: Added a test to verify oe-pkgdata-util without parameters
To: Milan Shah <mshah@mvista.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Dec 2020 at 10:01, Milan Shah <mshah@mvista.com> wrote:
>
> A test is implemented on poky/meta/lib/oeqa/selftest/pkgdata.py to test
> the scenario when oe-pkgdata-util is executed without parameters and
> help is displayed.
>
> See [YOCTO #10726] for detailed bug information.
>
> Signed-off-by: Milan Shah <mshah@mvista.com>
> ---
>  meta/lib/oeqa/selftest/cases/pkgdata.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
> index 833a180..94ee1f5 100644
> --- a/meta/lib/oeqa/selftest/cases/pkgdata.py
> +++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
> @@ -218,3 +218,9 @@ class OePkgdataUtilTests(OESelftestTestCase):
>      def test_specify_pkgdatadir(self):
>          result = runCmd('oe-pkgdata-util -p %s lookup-pkg zlib' % get_bb_var('PKGDATA_DIR'))
>          self.assertEqual(result.output, 'libz1')
> +
> +    def test_no_param(self):
> +        result = runCmd('oe-pkgdata-util', ignore_status=True)
> +        self.assertEqual(result.status, 2, "Status different than 2. output: %s" % result.output)
> +        currpos = result.output.find('usage: oe-pkgdata-util [-h] [-d] [-p PKGDATA_DIR] <subcommand>')

In my opinion this is still too restrictive a test, it would need
updating when any further arguments are added to the oe-pkgdata-util
tool. I'd recommend just checking for "usage: oe-pkgdata-util" and
ignoring the rest of the line.

Thanks,

-- 
Paul Barker
Konsulko Group
