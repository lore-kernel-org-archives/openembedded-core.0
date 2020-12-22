Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.11419.1608644667931885421
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 05:44:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sPt8WQ58;
 spf=pass (domain: konsulko.com, ip: 209.85.167.170, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f170.google.com with SMTP id s2so14791983oij.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 05:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q2sj83w25MqK0KPtx79qETB5VtPs638WmVCWy08cc6k=;
        b=sPt8WQ58y+HUn18/6wLirD4hPjQWKTZzApcgGqTpwlJkXtcVmbbVc2D5VFQm8HwS08
         BWNzfDPl1Y7c6nHbGcjoNjPzbB+fDrfcJkvmvorRi+w6UL2qmZ/K4/AA8+vtVuCliM1H
         LfHa1j35Buw00GqdpmGM853iBP8b27Ds+mVFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q2sj83w25MqK0KPtx79qETB5VtPs638WmVCWy08cc6k=;
        b=YF4+/lqUiPw9MEe6APa9uHnH3Q9fhPcW4X/F4rAEKWT/IPg44MUp2szeURalTQuM7K
         Zfm0us1KzOODvp/X3Y/1dXMp7/fiDue4IyTM1mVVhXkUWIijrkA2zMyvJyW3bxvoaB1c
         T1Xxzpn4KZbPBnFZjFoCJtAmlw8gTKwHncb6+zD/nq9bf9jOPq+TwxSkrjxBxQjGXKjj
         /3YlUGm7jGtnPUUw+T4f81TON9qXqa4BTdvpSipbBtrxYeK8cLIuN//TyfUsSaG2Y+VK
         CdtZetIzaq6svb7tLK9Ua8i8POVhR9IsctpoAKTk2o87MOyG0PTMbqxCFC8iUfoVOqu8
         UZ3Q==
X-Gm-Message-State: AOAM530Rqncy0cWk5mCkGtUxsgp+MGadOaqe5TPwuxKb+CL6u2TKS8Y2
	71bW2sR2pCNrBKwRiBqtNqqaYfrQvnUQAw38Cy1hHw==
X-Google-Smtp-Source: ABdhPJy3GHwPR6lCF1bvRPm10IMvdRkstbPIFPYmEuY/k5EidrFuI+xvN1bKio9ZNXakKJcFzKnezKAtUrLz1QNQgmM=
X-Received: by 2002:aca:d882:: with SMTP id p124mr7170139oig.152.1608644667259;
 Tue, 22 Dec 2020 05:44:27 -0800 (PST)
MIME-Version: 1.0
References: <1608636285-20638-1-git-send-email-mshah@mvista.com>
In-Reply-To: <1608636285-20638-1-git-send-email-mshah@mvista.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 22 Dec 2020 13:44:17 +0000
Message-ID: <CAM9ZRVu+iqZPignsv3pP49NgUceRopZJpxTJHo_Xg++EPUxbhA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] oe-pkgdata-util: Added a test to verify oe-pkgdata-util without parameters
To: Milan Shah <mshah@mvista.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Dec 2020 at 11:25, Milan Shah <mshah@mvista.com> wrote:
>
> A test is implemented on poky/meta/lib/oeqa/selftest/pkgdata.py to test
> the scenario when oe-pkgdata-util is executed without parameters and
> help is displayed.
>
> See [YOCTO #10726] for detailed bug information.
>
> Upstream-Status: Submitted

This tag doesn't make sense here, you can just drop it. We only need
this tag for actual patch files added to the repository to be applied
to upstream software.

>
> Signed-off-by: Milan Shah <mshah@mvista.com>
> ---
>  meta/lib/oeqa/selftest/cases/pkgdata.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
> index 833a180..d3a5519 100644
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
> +        self.assertIn('oe-pkgdata-util: error: the following arguments are required: <subcommand>', result.output)
> +        self.assertIn('usage: oe-pkgdata-util [-h] [-d] [-p PKGDATA_DIR] <subcommand>', result.output)

I don't like these assertln calls - they just make it more difficult
to change the help output of the oe-pkgdata-util tool if additional
options are added in the future.

I'm not really sure what this test case is expected to catch but
perhaps just checking for the return code of 2 and the string "usage:
oe-pkgdata-util" somewhere in the output is enough.

Thanks,

-- 
Paul Barker
Konsulko Group
