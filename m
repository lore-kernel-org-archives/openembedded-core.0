Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.7669.1614870430327805160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 07:07:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cHj/QbJC;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.41, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f41.google.com with SMTP id d15so12787016wrv.5
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Mar 2021 07:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R1IstyeP39h6ST77bK/kQJ12U37YFVeNM/nq52bCL1E=;
        b=cHj/QbJC2dnBSsFK4MtofTuOjl/M5itKkGbUxcoRpSQZetnerqTUWlCxb8kDRUHyOu
         gMngl3OevjFfLhIM2afE2XaaumnbBJMbJDFBln9q0VpTZmyIo03Bgk/wd1ecSUh9RdXW
         Oe+i9SJF8654pIVRQjp9kr41V3osFjzfCZVSdtUhEVW/zENz37dCvzYhU93qGqv8QBXC
         mvotrmIToSlhLuMdzff2gCATRbNAjGeXTiurI4j4kq2BGSbn5+YqR9A4+7e0fIdKS3ZP
         Q2xiSl6Bp1ExXTymqUBdVXVQnrEH8DCT0fZ/lkI0uFMSrH3VM2UkQEzRkLmjlFUQvWFu
         uLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R1IstyeP39h6ST77bK/kQJ12U37YFVeNM/nq52bCL1E=;
        b=M31/rytZR+eEAmrOl5RGRW0LJrcgPpsiiQFgpCaMITmoYWOqiEvH4nNpa3ju4oYEAL
         Ut26h6YeQdFSP//GD5y5wLOj0lZgbKjjj4XuS4rLLU7rLvZrLw8HJI218fiABtWG9ft7
         AF8hI/y6FuiLwEO3F1jRVpZI/caMi9DU2A+Hv6WRIWGuf3vL4Ockmb0Oj8gT+TQY34/z
         vpoS73Kn4P5UqLzjldsutC6RbZ3+YM13P2zmsEpy5ExOfaLdobqA/nVVApv3TscfQeqQ
         01nzeG1eZ98ymjbzDW/DRvRiylYkZjBTyeXj4WtMKNgu93EvTFLEM4WUgMIi/qNmdYgV
         +YYA==
X-Gm-Message-State: AOAM533hokf3QEzXpKYXVFRm9vE5lmKMNK48CTL4KK20p/XxEFxLcSLA
	XzJGWuYahlbauuWqmYTPznhkny0CwA7ix/4MlhZhuA==
X-Google-Smtp-Source: ABdhPJzx6NTOtmTgX8wvYnIdVFX6ViOkAxmCdE6SCMeK/HGr0qAQ7JfBpyHfcgAs1x0TCGpJEUQFgWeX0RxaxQRuzBs=
X-Received: by 2002:adf:a2d3:: with SMTP id t19mr4422078wra.299.1614870428798;
 Thu, 04 Mar 2021 07:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20210304144407.66850-1-chee.yang.lee@intel.com>
In-Reply-To: <20210304144407.66850-1-chee.yang.lee@intel.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 4 Mar 2021 05:06:56 -1000
Message-ID: <CAOSpxdY1S4Xma=gZBSvCaEdOFLm7LDfnsS10zYEh_vdRa5kPLw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] cve-check: use Version for "=" operator
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross@burtonini.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 4, 2021 at 4:44 AM Lee Chee Yang <chee.yang.lee@intel.com> wrote:
>
> From: Lee Chee Yang <Chee.Yang.Lee@intel.com>
>
> version string from NVD might not constant all the time, cast them to
> Version whenever possible while compare for equal operator.
>
>  CVE-2010-0426
>  "cpe23Uri" : "cpe:2.3:a:todd_miller:sudo:1.6.3_p1:*:*:*:*:*:*:*"
>
>  CVE-2010-1646
>  "cpe23Uri" : "cpe:2.3:a:todd_miller:sudo:1.6.3p1:*:*:*:*:*:*:*"
>
> Signed-off-by: Lee Chee Yang <Chee.Yang.Lee@intel.com>
> ---
>  meta/classes/cve-check.bbclass | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index 112ee3379d..e0c8321e99 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -269,8 +269,15 @@ def check_cves(d, patched_cves):
>                  (_, _, _, version_start, operator_start, version_end, operator_end) = row
>                  #bb.debug(2, "Evaluating row " + str(row))
>
> -                if (operator_start == '=' and pv == version_start) or version_start == '-':
> +                if version_start == '-':
> +                    # '-' can be any version

I had an extended email exchange with the database maintainers about
the use/meaning of '-'

Here is their final word (which left me quite unsatisfied in its ambiguity)

"In general, the '-' is used when affected versions of a product are
unknown. If affected versions are stated, and there is no fix
available, the configuration would be up to (including) the latest
stated affected version. I would also like to add that '-' also means
N/A, so not necessarily only when affected versions are unknown, which
may help to clear your confusion."

Using '-' to signify either "we don't know" or "not applicable" seems
quite wrong to me :-( But that's the way it is.

>                      vulnerable = True
> +                elif operator_start == '=':
> +                    # it could be unexpected version string which cannot be parse, compare them string to string only in such case
> +                    try:
> +                        vulnerable = (Version(pv,suffix) == Version(version_start,suffix))
> +                    except:
> +                        vulnerable = (pv == version_start)
>                  else:
>                      if operator_start:
>                          try:
> --
> 2.17.1
>
>
> 
>
