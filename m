Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.8801.1601443658461339841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 22:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iwO/BQCO;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id di5so292874qvb.13
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 22:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=36HEL+4prTesy2OJJMGTcSDpx2ju32Q6qIXcu3W8Fzg=;
        b=iwO/BQCOxcNl0Ylf//+zCsIcMXu3G8A/E82JhJqEp4gzvgDAieQ0AyKJZC3atmp7Yw
         yqlcvJ9GBD1MB0pCgvvI/cIkaqoK0aQM7BzK+zyuh+2ZvHedgVCA+rCpAhyRPV4oTyR1
         dS6rfhWZJvSwkJErFlTGFpKbnsnwaf/b/9QP2dV2FuBMsKpL+h92R4t5Uau4/FSdY/mT
         EFHfeOOCwsqcjMaut9B15balJm8NBe6OKy4DxHK9Ha/EJ3ZNRdRYkygquVsmwpPPZvDK
         RS7xrFBwKy8QYYQeQBV4XkYE1fIzDKy1xuluCJHO0bRsah5aEZ1WSzZKu68gp+/AvCZ0
         9DuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=36HEL+4prTesy2OJJMGTcSDpx2ju32Q6qIXcu3W8Fzg=;
        b=O79n8xUvOxd1Uf03xTa0E17qpiJVoOP9ZuexMBVNQJnFDUXZzy7XhfFTz4ktx30QST
         NR1sNmeqAkOpgAZhmJm22wvYjpOrklYvE6kbiNDDrkKxLdmRwB/mnUoy6itQ6vmgBKbk
         GfrlAWe2HfQOffl93wJDWbQW/hm1zcL15lqwhRy5WmInSuUuHnkom6HmQ+K6/O1ZPvBr
         J51czdYUoSrJi84Jwpjo/08zIPtZ+ttTq5IDzc/0YMTGeDRtXqos7WpNSWScBz+y6+gi
         UC3dJxTv+HatlR/RIoUARxXlKXxU4r5p2kIVSTqSx/8A+73Z6CrgNOFsMzV4WE/V/9mv
         Pp0g==
X-Gm-Message-State: AOAM5305kPf18EbqomgTfpFBVTlsitDOBNgbNX+E3gkGNQoAaWqMazr4
	zmv9mkWXcz5EpT63lDkwTA8hGZOZkF5qZpA3Y34=
X-Google-Smtp-Source: ABdhPJx0lUFwx4ntdDLaVWQ4OzQHcWeVq6go8AENe2NijdHp+vRcxQc5mFmRSxcpfgAdqMQvQvxSoaaDYicBkPuI3Co=
X-Received: by 2002:a0c:e188:: with SMTP id p8mr679500qvl.8.1601443657536;
 Tue, 29 Sep 2020 22:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200929043246.11195-1-ticotimo@gmail.com>
In-Reply-To: <20200929043246.11195-1-ticotimo@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 29 Sep 2020 22:27:11 -0700
Message-ID: <CAMKF1sqgMORq1VOHKz_HPy8atGu3vZvpH3dCtyoej=v0WC6sRw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/cases/devtool.py: avoid .pyc race
To: Tim Orling <ticotimo@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Tim Orling <timothy.t.orling@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 28, 2020 at 9:32 PM Tim Orling <ticotimo@gmail.com> wrote:
>
> From: Tim Orling <timothy.t.orling@linux.intel.com>
>
> In certain conditions, most likely under heavy load on the
> AutoBuiler, the prebuilt .pyc files are attempting to be
> executed before they have been completely copied. Avoid
> this by not copying the .pyc files (nor the __pycache__
> directory). The impact of python3-native recreating the .pyc
> files should hopefully be negligible.
>

pyc makes difference only when loading, execution is still same. So it
will depend
if we are invoking the script repeatedly or is it invoked once and
executed for longer time.
benefits might be less in later case.

> YOCTO#13421
> YOCTO#13803
>
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  meta/lib/oeqa/selftest/cases/devtool.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
> index b383ed9c50b..a3d2e9ea7cc 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -56,7 +56,8 @@ def setUpModule():
>                      if pth.startswith(canonical_layerpath):
>                          if relpth.endswith('/'):
>                              destdir = os.path.join(corecopydir, relpth)
> -                            shutil.copytree(pth, destdir)
> +                            # avoid race condition by not copying .pyc files YPBZ#13421,13803
> +                            shutil.copytree(pth, destdir, ignore=ignore_patterns('*.pyc', '__pycache__'))
>                          else:
>                              destdir = os.path.join(corecopydir, os.path.dirname(relpth))
>                              bb.utils.mkdirhier(destdir)
> --
> 2.25.0
>
>
> 
>
