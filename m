Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.8186.1592922765448452623
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 07:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TuBQGGqq;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id a1so7824588ejg.12
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 07:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=ch2UgwFXVanoFaJdJpP8r/qZbo1LDOFMydm+QZHfU1M=;
        b=TuBQGGqqikPzjHJF9ueStwwvjo6IVEgScEIObMFfbWYJlliZ3KM1tEM5qbWF0EKNS6
         sWpP7xg8PMiPfxiZYz5LyOfups57mQA9kSdnoJkaPUJwgu5Oi1JScoruUYTgqNK3G0t2
         7q59K3mVkBpLRlMHIve4o0FbF+Auh0sGDkNnZyTggLi+8Ri8Q0Fhoh3xEKzVZwQrGAgA
         uh0OZNfEWLLcvIB9AmpsQqeg5CW3kFHDyfRuahXzlcuLHu5nu9Nnxd9fzAXcu+9H13Q8
         GMoSJuI0+dVdJIR94wZzs6F04j57wwsiWRqOCVgzJvgUMTPphuaO26110RJweHWRyTRV
         IHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=ch2UgwFXVanoFaJdJpP8r/qZbo1LDOFMydm+QZHfU1M=;
        b=QdzanQpElIwrLCURI/aeEKMEQGp37jG6D3HnSuUfNegMu0c4H+RRglZwqjcg0FGNw/
         sh+97FTKkubI/Uvv/rtlMXsvpzhoTtlFSscpySJyPL+AyIorL9p0qGB1oCeGaNZ6fFsa
         gDmgXCE1oCKmzyGJb9bEnIviHd/BjkaX7D1HRSRTybU7mjziABgORK9yvgVImHocmIPZ
         DhlUi/gtu+FZQfVP/L6xV92Dv2Uya9DUpRVUJybD0ce+KU/rJD+ThrKoIs2RdzQLujFu
         IzMBR/QzO8cbgc8oC03B7ARdoCP/1vFa1ZTc9Bhs/ZIi9wmj7/nImywmaSFgyiLcr914
         V1Fg==
X-Gm-Message-State: AOAM532AjmH6aYlu45BjkC5JyUk/c8AsnDnT4oXfRu/SewaW7NjZ5Itc
	fIwNJB8qLBMd0lTPEGWWZq2coqsgTIB4cywO2JYz1WQzkuQ=
X-Google-Smtp-Source: ABdhPJx4yu7SOm5FLW+voSLF326efpaJEBTW6JyqQKo7j8aUVWaT6OOj/dODNmzO66kzK1pONv3PeFbsnBoRuGrdMGE=
X-Received: by 2002:a17:906:c443:: with SMTP id ck3mr10978455ejb.153.1592922763424;
 Tue, 23 Jun 2020 07:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1592848337.git.steve@sakoman.com> <2c54047118e813311581f9dc567bd12f9f211aa6.1592848337.git.steve@sakoman.com>
In-Reply-To: <2c54047118e813311581f9dc567bd12f9f211aa6.1592848337.git.steve@sakoman.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 23 Jun 2020 04:32:30 -1000
Message-ID: <CAOSpxdaCtGHg0zp6PZ5nSkmXtDZfXC193FPYcBhD7kPQo9ODsA@mail.gmail.com>
Subject: Re: [OE-core][dunfell 22/33] oeqa/runtime: Add OERequirePackage decorator
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Dropping this from the final pull request since, while useful, it is a
feature addition.

Steve

On Mon, Jun 22, 2020 at 8:01 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> From: Konrad Weihmann <kweihmann@outlook.com>
>
> Add new decorator which behaves like OEHasPackage, but
> fails the testcase if a dependency isn't met.
>
> This helps to identify missing packages in the image
> under test when using static test suite lists, otherwise
> a missing package won't fail the overall test suite and
> errors might slip through unnoticed
>
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit c5be39df1494f33e2cae116e4930f2a0f3dd2000)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/lib/oeqa/runtime/decorator/package.py | 34 ++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/runtime/decorator/package.py b/meta/lib/oeqa/runtime/decorator/package.py
> index 4c5ca198b0..57178655cc 100644
> --- a/meta/lib/oeqa/runtime/decorator/package.py
> +++ b/meta/lib/oeqa/runtime/decorator/package.py
> @@ -46,11 +46,41 @@ class OEHasPackage(OETestDecorator):
>              self.logger.debug(msg)
>              if not self.case.tc.image_packages.isdisjoint(unneed_pkgs):
>                  msg = "Test can't run with %s installed" % ', or'.join(unneed_pkgs)
> -                self.case.skipTest(msg)
> +                self._decorator_fail(msg)
>
>          if need_pkgs:
>              msg = 'Checking if at least one of %s is installed' % ', '.join(need_pkgs)
>              self.logger.debug(msg)
>              if self.case.tc.image_packages.isdisjoint(need_pkgs):
>                  msg = "Test requires %s to be installed" % ', or'.join(need_pkgs)
> -                self.case.skipTest(msg)
> +                self._decorator_fail(msg)
> +
> +    def _decorator_fail(self, msg):
> +        self.case.skipTest(msg)
> +
> +@registerDecorator
> +class OERequirePackage(OEHasPackage):
> +    """
> +        Checks if image has packages (un)installed.
> +        It is almost the same as OEHasPackage, but if dependencies are missing
> +        the test case fails.
> +
> +        The argument must be a string, set, or list of packages that must be
> +        installed or not present in the image.
> +
> +        The way to tell a package must not be in an image is using an
> +        exclamation point ('!') before the name of the package.
> +
> +        If test depends on pkg1 or pkg2 you need to use:
> +        @OERequirePackage({'pkg1', 'pkg2'})
> +
> +        If test depends on pkg1 and pkg2 you need to use:
> +        @OERequirePackage('pkg1')
> +        @OERequirePackage('pkg2')
> +
> +        If test depends on pkg1 but pkg2 must not be present use:
> +        @OERequirePackage({'pkg1', '!pkg2'})
> +    """
> +
> +    def _decorator_fail(self, msg):
> +        self.case.fail(msg)
> --
> 2.17.1
>
