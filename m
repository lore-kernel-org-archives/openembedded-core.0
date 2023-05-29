Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2455C7EE23
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 15:13:24 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.51771.1685373201126193906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 08:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=pbco+o6H;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-96f818c48fbso636442166b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685373199; x=1687965199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9t6lQbieUE76FkR9CMP5TeeOIbdqwBkNNY1UGyxZXYo=;
        b=pbco+o6H3/dWU2L8apKfsusHN4aViOEdvTTX0qHw2u6jCPkFsXutyriANBZa5wYvdi
         t/O0m9w2qc+k11WOO7EveC1RRfm9LvfkI6whrLuwCzSSLLTdv/k023S7JSA/jUWcuGiC
         Aw/4q+8aZuN6PQcv+2CVy+ku4oSZlIWciZhX04OoujeKus4vIRSHLyiJxtD5rp8GyqiV
         c0kQ7QCb/gGj6Nmnu2icYM9vNnmZSrK5KhVtnYkJ2LbAJhd3qUac4N64ll8T7xE9Tvuy
         8tE1Qv8Ear5FTPgPNwPWZgIOEiHJ0s4pjLzDuBVPFdQQcKQybMdctCRg6PjEaaptyK/3
         EQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685373199; x=1687965199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9t6lQbieUE76FkR9CMP5TeeOIbdqwBkNNY1UGyxZXYo=;
        b=V5E2jUNHr4zL7PxfdP6MlDkjfji08rEUHuuJZn3tU7kzdG/kFWUhA1GaWMDqRE2Y7s
         ewpdJ5IF0PI7v+MhotsxbmMoL6TkqQTxxE42OxY8q3fCrpCC1DP01Kq2Mgd0+M9LrXpy
         3Xja3KwK6KG3CW8OJEyLtBd+ONxBsTRiLM0Rxk4znoRrhDtqBfl8uOLP8dDWskLRl89U
         n9tvQJRazGrCUph6Z1Ft1fubRt6f4w0Jw3L/512f5kqpx8+T85PpTaZf/pJKA4Stkrcx
         0P22lQGY7N+N0Px8xSV5uLNr44/blFcec9b4PuCn/IEXFPHOEA8YF7Mtd2u62ffrNcWu
         AHuA==
X-Gm-Message-State: AC+VfDwCXzou71Y7/E8YMnjv9ZRazEHRGjwUfOFGHcqfCneV5SNE12//
	Y9bQcD9y6YApsa11pT54rbC3io44FtmAm1qIkInEag==
X-Google-Smtp-Source: ACHHUZ49UVV7l4qENnkn6OInTwyJEDoNe7o5bQyWu2TLPXNVbOQuMt69YL7JX7w8ilylGFUjm0ztcCtgEWgQEgHEtVU=
X-Received: by 2002:a17:907:3f0d:b0:895:58be:957 with SMTP id
 hq13-20020a1709073f0d00b0089558be0957mr11332638ejc.2.1685373199439; Mon, 29
 May 2023 08:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230527062532.938477-1-m.belouarga@technologyandstrategy.com>
In-Reply-To: <20230527062532.938477-1-m.belouarga@technologyandstrategy.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 29 May 2023 05:13:08 -1000
Message-ID: <CAOSpxdYft-9vk_Cb3VJY-pUoHJF2nyYBneiH=wXCueVdUqiLwA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 1/5] recipetool: create: npm: Remove
 duplicate function to not have future conflicts
To: belouargamohamed@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	e.aubineau@technologyandstrategy.com, f.lahoudere@technologyandstrategy.com, 
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 15:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181873

Are these same issues present in the master branch?  If so, this
series should be submitted for the master branch first, and I will
then backport to kirkstone (and mickledore).

Steve

On Fri, May 26, 2023 at 8:25=E2=80=AFPM <belouargamohamed@gmail.com> wrote:
>
> From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
>
> Npm packages do not have yocto friendly names. fore instance we can have =
names like
> "@example/npmPackage"
>
> npm fetcher has a function that convert these names to yocto friendly nam=
es.
> But in recipe tool we have an other function (duplicate).
>
> Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
> ---
>  scripts/lib/recipetool/create_npm.py | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetoo=
l/create_npm.py
> index 3394a89970..e667a4d19b 100644
> --- a/scripts/lib/recipetool/create_npm.py
> +++ b/scripts/lib/recipetool/create_npm.py
> @@ -13,6 +13,7 @@ import sys
>  import tempfile
>  import bb
>  from bb.fetch2.npm import NpmEnvironment
> +from bb.fetch2.npm import npm_package
>  from bb.fetch2.npmsw import foreach_dependencies
>  from recipetool.create import RecipeHandler
>  from recipetool.create import get_license_md5sums
> @@ -30,15 +31,6 @@ def tinfoil_init(instance):
>  class NpmRecipeHandler(RecipeHandler):
>      """Class to handle the npm recipe creation"""
>
> -    @staticmethod
> -    def _npm_name(name):
> -        """Generate a Yocto friendly npm name"""
> -        name =3D re.sub("/", "-", name)
> -        name =3D name.lower()
> -        name =3D re.sub(r"[^\-a-z0-9]", "", name)
> -        name =3D name.strip("-")
> -        return name
> -
>      @staticmethod
>      def _get_registry(lines):
>          """Get the registry value from the 'npm://registry' url"""
> @@ -143,7 +135,7 @@ class NpmRecipeHandler(RecipeHandler):
>
>          # Handle the dependencies
>          def _handle_dependency(name, params, deptree):
> -            suffix =3D "-".join([self._npm_name(dep) for dep in deptree]=
)
> +            suffix =3D "-".join([npm_package(dep) for dep in deptree])
>              destdirs =3D [os.path.join("node_modules", dep) for dep in d=
eptree]
>              destdir =3D os.path.join(*destdirs)
>              packages["${PN}-" + suffix] =3D destdir
> @@ -173,7 +165,7 @@ class NpmRecipeHandler(RecipeHandler):
>          if "name" not in data or "version" not in data:
>              return False
>
> -        extravalues["PN"] =3D self._npm_name(data["name"])
> +        extravalues["PN"] =3D npm_package(data["name"])
>          extravalues["PV"] =3D data["version"]
>
>          if "description" in data:
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181791): https://lists.openembedded.org/g/openembedde=
d-core/message/181791
> Mute This Topic: https://lists.openembedded.org/mt/99163838/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

