Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.31002.1631545004312197399
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 07:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UHtrOaI9;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.51, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f51.google.com with SMTP id d207-20020a1c1dd8000000b00307e2d1ec1aso177017wmd.5
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 07:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Y8stPHpbekdkMVTsML0A6q3z0uiEnxx203csAy/4VY=;
        b=UHtrOaI9EUL78P6TckhTp0mhjQzcRlLpm/WoGNS297h9l7r4rMlC5ZH9PUNhzOYYY4
         1vGmt/wfnKJZCk/BZgCCUpZegKh90wkAGY1GS1KR/kr0fayVCI2SC055YjNvgA6xCaeC
         SJYvsHPNtraqCirWBK3GKwyNYv7y7r75JNdnvV4rRoyYDI+GPZrYmc1wHzTAyomQseJH
         o+JXi48rflu5SbpMHZ0osboDQ+l8VDzly/CMJH473awu/58g+zIMp8xHv2ccjEav6Zox
         Kq9DQW/VMKptVLLUSqIpSN8bQP0soV6SIe0sMfoFxtNaMRiI8zsPC2S8kSq2b9EVldyw
         eHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Y8stPHpbekdkMVTsML0A6q3z0uiEnxx203csAy/4VY=;
        b=nHeBPjarl4yMrvslJvR4I/maIX6GK7LdcdGGgGqghR+0clyqdGiNDhJuGhi5ZNJ0U8
         fcOXkDjsHLqlpT0wK62QG+tv3TkEQOMbS401/WbgvpC+DMINRHeQ1Yl214b9rLgFhSNN
         E5YoXD874ElQP8uy2s1MnCZlivtO5bz9NkprcuTXLQl1E4mY73aEQj3oL9wxmhOWe/GY
         DhPlNkab3y2OiwQRO4GV+AO1Wsm47ZP91sPiZ+pDjM+anQrUWabVdG4ZPct2DwbPMoV/
         CVxQo22gsXUtw4yc02L3r1NRNWow5/qeAliplXuqhlOheh9K/VnXPItFFkYdyDsWgj7t
         hMtQ==
X-Gm-Message-State: AOAM533bEuTFpmANyQN9mIoSNS5n3gfN//22hrFTCZWd6FtkeVabO21m
	eFzhIt8MpbCZhpYxKfx2wnqxuHURCPcJ1+kR/p8qWg==
X-Google-Smtp-Source: ABdhPJx6qSU/Acmc6APWhXMxtgXrTcqU4Ca+cxT0dx7see8mYFaQfVTPIltqog0mgR30v+bWMLuDoDr80wy72kgTwOE=
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr11760285wmj.18.1631545002412;
 Mon, 13 Sep 2021 07:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210913124526.26861-1-jainsaloni0918@gmail.com>
In-Reply-To: <20210913124526.26861-1-jainsaloni0918@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 13 Sep 2021 04:56:30 -1000
Message-ID: <CAOSpxdaZGZnOFD1TuhRzEfQpJ-obtkvSs+O9eLJ8LKm1xgXL5g@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] db: Whitelist CVEs
To: Saloni Jain <jainsaloni0918@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Saloni Jain <salonij@kpit.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 2:45 AM Saloni Jain <jainsaloni0918@gmail.com> wrote:
>
> From: Saloni Jain <salonij@kpit.com>
>
> Below CVE affects only Oracle Berkeley DB as per upstream.
> Hence, whitelisted them.

I suspect that a cleaner solution might be to revert:

db: update CVE_PRODUCT
(https://git.openembedded.org/openembedded-core/commit/?id=ad799b109716ccd2f44dcf7a6a4cfcbd622ea661)

which adds berkeley_db to CVE_PRODUCT

I did a quick test and this eliminates all of the below CVE's. And of
course it makes sense to only check for oracle_berkeley_db since that
is the source code we are using.

Also, this same issue is present in master, so any fix would need to
go there first and I will cherry-pick.

Could you confirm that this approach works for you too?

Steve

>
> 1. CVE-2015-2583
> Link: https://security-tracker.debian.org/tracker/CVE-2015-2583
> 2. CVE-2015-2624
> Link: https://security-tracker.debian.org/tracker/CVE-2015-2624
> 3. CVE-2015-2626
> Link: https://security-tracker.debian.org/tracker/CVE-2015-2626
> 4. CVE-2015-2640
> Link: https://security-tracker.debian.org/tracker/CVE-2015-2640
> 5. CVE-2015-2654
> Link: https://security-tracker.debian.org/tracker/CVE-2015-2654
> 6. CVE-2015-2656
> Link: https://security-tracker.debian.org/tracker/CVE-2015-2656
> 7. CVE-2015-4754
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4754
> 8. CVE-2015-4764
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4764
> 9. CVE-2015-4774
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4774
> 10. CVE-2015-4775
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4775
> 11. CVE-2015-4776
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4776
> 12. CVE-2015-4777
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4777
> 13. CVE-2015-4778
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4778
> 14. CVE-2015-4779
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4779
> 15. CVE-2015-4780
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4780
> 16. CVE-2015-4781
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4781
> 17. CVE-2015-4782
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4782
> 18. CVE-2015-4783
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4783
> 19. CVE-2015-4784
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4784
> 20. CVE-2015-4785
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4785
> 21. CVE-2015-4786
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4786
> 22. CVE-2015-4787
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4787
> 23. CVE-2015-4788
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4788
> 24. CVE-2015-4789
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4789
> 25. CVE-2015-4790
> Link: https://security-tracker.debian.org/tracker/CVE-2015-4790
> 26. CVE-2016-0682
> Link: https://security-tracker.debian.org/tracker/CVE-2016-0682
> 27. CVE-2016-0689
> Link: https://security-tracker.debian.org/tracker/CVE-2016-0689
> 28. CVE-2016-0692
> Link: https://security-tracker.debian.org/tracker/CVE-2016-0692
> 29. CVE-2016-0694
> Link: https://security-tracker.debian.org/tracker/CVE-2016-0694
> 30. CVE-2016-3418
> Link: https://security-tracker.debian.org/tracker/CVE-2016-3418
> 31. CVE-2017-3604
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3604
> 32. CVE-2017-3605
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3605
> 33. CVE-2017-3606
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3606
> 34. CVE-2017-3607
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3607
> 35. CVE-2017-3608
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3608
> 36. CVE-2017-3609
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3609
> 37. CVE-2017-3610
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3610
> 38. CVE-2017-3611
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3611
> 39. CVE-2017-3612
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3612
> 40. CVE-2017-3613
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3613
> 41. CVE-2017-3614
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3614
> 42. CVE-2017-3615
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3615
> 43. CVE-2017-3616
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3616
> 44. CVE-2017-3617
> Link: https://security-tracker.debian.org/tracker/CVE-2017-3617
> 45. CVE-2020-2981
> Link: https://security-tracker.debian.org/tracker/CVE-2020-2981
>
> Signed-off-by: Saloni <jainsaloni0918@gmail.com>
> ---
>  meta/recipes-support/db/db_5.3.28.bb | 92 ++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>
> diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
> index b2ae98f05c..000e9ef468 100644
> --- a/meta/recipes-support/db/db_5.3.28.bb
> +++ b/meta/recipes-support/db/db_5.3.28.bb
> @@ -39,6 +39,98 @@ SRC_URI[sha256sum] = "e0a992d740709892e81f9d93f06daf305cf73fb81b545afe7247804317
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1158e31437f4f87cdd4ab2b8613955"
>
> +# Below CVEs affects only Oracle Berkeley DB as per upstream.
> +# https://security-tracker.debian.org/tracker/CVE-2015-2583
> +CVE_CHECK_WHITELIST += "CVE-2015-2583"
> +# https://security-tracker.debian.org/tracker/CVE-2015-2624
> +CVE_CHECK_WHITELIST += "CVE-2015-2624"
> +# https://security-tracker.debian.org/tracker/CVE-2015-2626
> +CVE_CHECK_WHITELIST += "CVE-2015-2626"
> +# https://security-tracker.debian.org/tracker/CVE-2015-2640
> +CVE_CHECK_WHITELIST += "CVE-2015-2640"
> +# https://security-tracker.debian.org/tracker/CVE-2015-2654
> +CVE_CHECK_WHITELIST += "CVE-2015-2654"
> +# https://security-tracker.debian.org/tracker/CVE-2015-2656
> +CVE_CHECK_WHITELIST += "CVE-2015-2656"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4754
> +CVE_CHECK_WHITELIST += "CVE-2015-4754"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4764
> +CVE_CHECK_WHITELIST += "CVE-2015-4764"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4774
> +CVE_CHECK_WHITELIST += "CVE-2015-4774"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4775
> +CVE_CHECK_WHITELIST += "CVE-2015-4775"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4776
> +CVE_CHECK_WHITELIST += "CVE-2015-4776"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4777
> +CVE_CHECK_WHITELIST += "CVE-2015-4777"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4778
> +CVE_CHECK_WHITELIST += "CVE-2015-4778"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4779
> +CVE_CHECK_WHITELIST += "CVE-2015-4779"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4780
> +CVE_CHECK_WHITELIST += "CVE-2015-4780"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4781
> +CVE_CHECK_WHITELIST += "CVE-2015-4781"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4782
> +CVE_CHECK_WHITELIST += "CVE-2015-4782"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4783
> +CVE_CHECK_WHITELIST += "CVE-2015-4783"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4784
> +CVE_CHECK_WHITELIST += "CVE-2015-4784"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4785
> +CVE_CHECK_WHITELIST += "CVE-2015-4785"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4786
> +CVE_CHECK_WHITELIST += "CVE-2015-4786"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4787
> +CVE_CHECK_WHITELIST += "CVE-2015-4787"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4788
> +CVE_CHECK_WHITELIST += "CVE-2015-4788"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4789
> +CVE_CHECK_WHITELIST += "CVE-2015-4789"
> +# https://security-tracker.debian.org/tracker/CVE-2015-4790
> +CVE_CHECK_WHITELIST += "CVE-2015-4790"
> +# https://security-tracker.debian.org/tracker/CVE-2016-0682
> +CVE_CHECK_WHITELIST += "CVE-2016-0682"
> +# https://security-tracker.debian.org/tracker/CVE-2016-0689
> +CVE_CHECK_WHITELIST += "CVE-2016-0689"
> +# https://security-tracker.debian.org/tracker/CVE-2016-0692
> +CVE_CHECK_WHITELIST += "CVE-2016-0692"
> +# https://security-tracker.debian.org/tracker/CVE-2016-0694
> +CVE_CHECK_WHITELIST += "CVE-2016-0694"
> +# https://security-tracker.debian.org/tracker/CVE-2016-3418
> +CVE_CHECK_WHITELIST += "CVE-2016-3418"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3604
> +CVE_CHECK_WHITELIST += "CVE-2017-3604"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3605
> +CVE_CHECK_WHITELIST += "CVE-2017-3605"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3606
> +CVE_CHECK_WHITELIST += "CVE-2017-3606"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3607
> +CVE_CHECK_WHITELIST += "CVE-2017-3607"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3608
> +CVE_CHECK_WHITELIST += "CVE-2017-3608"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3609
> +CVE_CHECK_WHITELIST += "CVE-2017-3609"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3610
> +CVE_CHECK_WHITELIST += "CVE-2017-3610"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3611
> +CVE_CHECK_WHITELIST += "CVE-2017-3611"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3612
> +CVE_CHECK_WHITELIST += "CVE-2017-3612"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3613
> +CVE_CHECK_WHITELIST += "CVE-2017-3613"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3614
> +CVE_CHECK_WHITELIST += "CVE-2017-3614"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3615
> +CVE_CHECK_WHITELIST += "CVE-2017-3615"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3616
> +CVE_CHECK_WHITELIST += "CVE-2017-3616"
> +# https://security-tracker.debian.org/tracker/CVE-2017-3617
> +CVE_CHECK_WHITELIST += "CVE-2017-3617"
> +# https://security-tracker.debian.org/tracker/CVE-2020-2981
> +CVE_CHECK_WHITELIST += "CVE-2020-2981"
> +
>  inherit autotools
>
>  # The executables go in a separate package - typically there
> --
> 2.17.1
>
>
> 
>
