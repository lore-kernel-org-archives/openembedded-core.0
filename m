Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.13233.1626106109449714936
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 09:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=qCA4jeeh;
 spf=pass (domain: burtonini.com, ip: 209.85.221.54, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f54.google.com with SMTP id d2so26423460wrn.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 09:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=acB+82lpMCxrznAC/XA9gASnGJRSYIIeZpIpw84q6Go=;
        b=qCA4jeehvzSYzingyLyCrPHEycsrZ8SI/sfFkPpcYXY37C9h7dDkoY1hZxlYXDEZ7R
         D2Z99bweVWv9ht8hJkLUdmNgq8CPb6FlnyzVJ7FrbIcrxtkRoKAK4d22c101g51Uw0qH
         Sbfx20+00Bcx1FuiXIkwbAF1nH6ZGnliUBD4rEOvB6vjuAsjYadE+dAU/WqzTZqzkVYU
         kk7HsbZJMlihvauZoo2/OSFHZSAfIHy67dFAjD7E9u4X20FxFNU93v/Vxx+0uhO/9Wr7
         BrPJThijap4rpduLvp1jLVEkuAzhdaUbeez4McQC+KI7fLXooN41q1ObKr5MEio4LNlE
         dB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=acB+82lpMCxrznAC/XA9gASnGJRSYIIeZpIpw84q6Go=;
        b=dzgJ98xxrixC60Ebhaio3UQxWU3V6//4k8eNIPe/XpltBzLEJAwpAUdNy/s3ec2Qjt
         i1xmWF+pZ/WCm/IL8YPw+a62nFALO82CX89HgFZlpwryR4Lmdptcn9A/M4K0+2iux8DD
         BF+kUujeYFlw1vKyWZMcfrzUzbH1pQoax/iBKRKbUYKKmKu+Oxxnozda+w1pPy6oWeZ+
         moUUpUoCgWr8HR+OvE6fOqH3leETOFGP6pDlbM5uG8ydpstcZuqEYHeF8t37vrwwoRzs
         X45utslVy6ZqBu+LBJb7QHiTd+kC+w4Hm+mxrjVG4ilmUwMzIXcQka99Fc2WDwgEW+/U
         U7CQ==
X-Gm-Message-State: AOAM533GOdXU9lt96dZi0PsQxRi35HAhrQho/x4Z2vDlVUcEihrutzqk
	HrtCkPN92IdWrntx2be9XBdwKIRGFOUhrfDg6XRbrfTt8x1J4Q==
X-Google-Smtp-Source: ABdhPJyvbmwjOcu8Sot3imuQ84nENs802mlAzH5R+biNJAVlA9TB//KW9qNA0ka5YQ6WAs9Fs69bUuAFjbESZcTH/Os=
X-Received: by 2002:a05:6000:1867:: with SMTP id d7mr4308844wri.199.1626106107371;
 Mon, 12 Jul 2021 09:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210712135159.2131269-1-ross.burton@arm.com> <20210712135159.2131269-9-ross.burton@arm.com>
In-Reply-To: <20210712135159.2131269-9-ross.burton@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 12 Jul 2021 17:08:16 +0100
Message-ID: <CAAnfSTstJ4V4iHTB0=NCV2WCaPO4vJwgARkG9hSWVbk2UcKb6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 9/9] tcl: increase timeouts in interp.test
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hold off this patch, I have a better version incoming.

Ross

On Mon, 12 Jul 2021 at 14:52, Ross Burton via lists.openembedded.org
<ross=burtonini.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/tcltk/tcl/interp.patch | 23 ++++++++++++++++++++
>  meta/recipes-devtools/tcltk/tcl_8.6.11.bb    |  1 +
>  2 files changed, 24 insertions(+)
>  create mode 100644 meta/recipes-devtools/tcltk/tcl/interp.patch
>
> diff --git a/meta/recipes-devtools/tcltk/tcl/interp.patch b/meta/recipes-devtools/tcltk/tcl/interp.patch
> new file mode 100644
> index 0000000000..f33dbb21ac
> --- /dev/null
> +++ b/meta/recipes-devtools/tcltk/tcl/interp.patch
> @@ -0,0 +1,23 @@
> +Sometimes this test fails, and it appears as if this is because if the system is
> +loaded then the 'after 0' and 'after 10' blocks happen in the same iteration of
> +the interpretter and are executed in the wrong order.
> +
> +Increase the timeout on the 10ms interval to 1000ms to be a little more forgiving
> +of system load.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +diff --git a/tests/interp.test b/tests/interp.test
> +index 385d3e2ab..3b07ce30c 100644
> +--- a/tests/interp.test
> ++++ b/tests/interp.test
> +@@ -3599,7 +3599,7 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
> +     child eval {
> +         variable done {}
> +         after 0 error foo
> +-        after 10 [list ::set [namespace which -variable done] {}]
> ++        after 1000 [list ::set [namespace which -variable done] {}]
> +         vwait [namespace which -variable done]
> +     }
> +     set result
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
> index 0d7c2e4ac3..57a86e4c64 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
> @@ -22,6 +22,7 @@ SRC_URI = "${BASE_SRC_URI} \
>             file://fix_issue_with_old_distro_glibc.patch \
>             file://tcl-remove-hardcoded-install-path.patch \
>             file://alter-includedir.patch \
> +           file://interp.patch \
>             file://run-ptest \
>  "
>  SRC_URI[sha256sum] = "cfb49aab82bd179651e23eeeb69606f51b0ddc575ca55c3d35e2457469024cfa"
> --
> 2.25.1
>
>
> 
>
