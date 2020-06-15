Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.18746.1592229751578565108
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 07:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y3WmyX3W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id e1so17280384wrt.5
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 07:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ndj8CpGF6PPLe8Zav9rZbY/XIaE2dtets8y+WAkfBog=;
        b=Y3WmyX3WjaQqGdy1I4Tz2S6GGBZiLIs+Krepc5hNkA/nEqnNxH59u9vrwL7Qa6KgDy
         XCQGfzEu8OeRyuj5+LvGzgGsncWODdvcYOjoph12fFbZrKrOzwWlbGmxIYSqmJihW9ZV
         GbbGxqKAgCubC8AnhxTQnOzQv/oXfTkTOqjM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ndj8CpGF6PPLe8Zav9rZbY/XIaE2dtets8y+WAkfBog=;
        b=oadtauwZTt9em4qXgfKZI6m+qC5n8W/SwbrCxD4wmLHTuSOcVWd9MFyONP7HX1kFQw
         aLjUP0RjY5d00M4nc+3f1cR04caxxqEzlcx7wt07JeP3Ta8Uq15+LH87R6IhLnnx58di
         IJwpylqUlA/DqPPxwun+iS/876nmZSmzzsl8x/0Cx4Qi3nIx114t7WBXGeJcRvNNIO3p
         DOkjekSm+rlF0Wc+HVkxFksxBNoZCUspARkZNbMPkjpbrhf4Rmzj0p/OhgixrXdX8jvF
         D1mAGW0OjULaqOtSaVx1kgUSUKws8E44RIcZl1qoYWir8UhSYQwizqRHtxBomjaDIRjg
         q1mg==
X-Gm-Message-State: AOAM533EYcO741cQfkDyXMOUUfC/UOzfp+yRXZleW1V4hJiVokTl66Y4
	dXRaU52jAaJcgxu+SZzV3VeQRA==
X-Google-Smtp-Source: ABdhPJyFP6TKLBLov8HBsJWPPa/TuqcDYw5k7GaC8NAe9m3vleSNJRlCS1tY7DosgmET6CuhdlUhbA==
X-Received: by 2002:a5d:428e:: with SMTP id k14mr28771223wrq.21.1592229750124;
        Mon, 15 Jun 2020 07:02:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l17sm21446374wmi.16.2020.06.15.07.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 07:02:29 -0700 (PDT)
Message-ID: <8c4f219514c2d9ca3d29b3f452dfb00df65109aa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: Add OERequirePackage decorator
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2020 15:02:28 +0100
In-Reply-To: <AM7PR05MB68814488723D88530BBC17E2A89E0@AM7PR05MB6881.eurprd05.prod.outlook.com>
References: 
	<AM7PR05MB68814488723D88530BBC17E2A89E0@AM7PR05MB6881.eurprd05.prod.outlook.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-06-13 at 12:19 +0200, Konrad Weihmann wrote:
> Add new decorator which behaves like OEHasPackage, but
> fails the testcase if a dependency isn't met.
> 
> This helps to identify missing packages in the image
> under test when using static test suite lists, otherwise
> a missing package won't fail the overall test suite and
> errors might slip through unnoticed
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/lib/oeqa/runtime/decorator/package.py | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/meta/lib/oeqa/runtime/decorator/package.py b/meta/lib/oeqa/runtime/decorator/package.py
> index 4c5ca198b0..b3d3fdbec2 100644
> --- a/meta/lib/oeqa/runtime/decorator/package.py
> +++ b/meta/lib/oeqa/runtime/decorator/package.py
> @@ -54,3 +54,53 @@ class OEHasPackage(OETestDecorator):
>              if self.case.tc.image_packages.isdisjoint(need_pkgs):
>                  msg = "Test requires %s to be installed" % ', or'.join(need_pkgs)
>                  self.case.skipTest(msg)
> +
> +@registerDecorator
> +class OERequirePackage(OETestDecorator):
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
> +    attrs = ('need_pkgs',)
> +
> +    def setUpDecorator(self):
> +        need_pkgs = set()
> +        unneed_pkgs = set()
> +        pkgs = strToSet(self.need_pkgs)
> +        for pkg in pkgs:
> +            if pkg.startswith('!'):
> +                unneed_pkgs.add(pkg[1:])
> +            else:
> +                need_pkgs.add(pkg)
> +
> +        if unneed_pkgs:
> +            msg = 'Checking if %s is not installed' % ', '.join(unneed_pkgs)
> +            self.logger.debug(msg)
> +            if not self.case.tc.image_packages.isdisjoint(unneed_pkgs):
> +                msg = "Test can't run with %s installed" % ', or'.join(unneed_pkgs)
> +                self.case.fail(msg)
> +
> +        if need_pkgs:
> +            msg = 'Checking if at least one of %s is installed' % ', '.join(need_pkgs)
> +            self.logger.debug(msg)
> +            if self.case.tc.image_packages.isdisjoint(need_pkgs):
> +                msg = "Test requires %s to be installed" % ', or'.join(need_pkgs)
> +                self.case.fail(msg)

I can see the use case, I'm a bit torn on whether we should fail in
these cases, or whether we should enourage people to check the tests
they expected to run really did.

With the complexity on the autobuilder we've had to rely on the latter,
comparing that all tests that ran previously, still run.

With regard to the patch itself, I'm worried about the code duplication
with the other skip decorator, is there a way to reduce that and make
things a bit neater?

Cheers,

Richard





