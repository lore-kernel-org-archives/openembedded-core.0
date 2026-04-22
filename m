Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A34F9B60A
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 10:20:48 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79188.1776853245271075939
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 03:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iVgQO3yc;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8dfb9139008so356004785a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 03:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776853244; cv=none;
        d=google.com; s=arc-20240605;
        b=H9So9kRJgjPu0PiNY8+d+n+pDOGk88Zasxd1FSlo6uXmnaJSo3wgsbc3b2awUg9j7J
         t3XCwvDVzhvhp91ouuaG2bDEmb5JLSjL5TNHWhiHkp6nFmOhVcqJ5VmIH8HM6f2v2BVs
         bHv/ha3cJBF5iWjV27C3Ez7geSE5kgaRJaL69xkmuAm0i4KF9CiOSOQ0QZ/UMityIbfz
         NmrSn2rB6cUV7B9N8ya4x2euPmMsgQ1aoO26/bz3ve3Bi/VQpT+Uv9NT9yzvVI64xsOn
         MZEleYN7zVcq+b8Ta5+PxjyNIojBM/ceE2ikw6y4b9hOuNuSwmoQmO6BNZ3DGcfIhTZY
         zwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6felqTi7gbr6AsbjTRZDsI1ogqNGfCKeozzALvYPGfM=;
        fh=KDBggjr8BLztnc4QKL9wpIZeKsRhbOowKcZEQS8F7CA=;
        b=JOc6tBo/pfra50/bNPpm5H0D8kwwBQhlMEe0stc3iiSHoWkhssrPAMx33uTzZCI6CW
         0vh86AjsjrjJ16QpTGJScJ5G+3wJ+YrYEkKM1MttLES4W93qjXGwriXD4Bg8xpwt3SPo
         OYANnQmZ8Tn6SJN/VldvItkVD2296ZGWEtSz0Rio5lylU3AmMB9n6OtAKITXzxUedcqH
         5Y6RzeAgNsjy0X1kCZNTD6gf2u/GIrFhwcI/rRBtTRbWFweUu78HkgvMo0Z48L9+gK1b
         tCnNu0gQEM7nM5qSO6Np3lAmcR45/GPgxTLf2DqsRPIlVQ8a6OWInUxzCy4JLauSUY/l
         OUDA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776853244; x=1777458044; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6felqTi7gbr6AsbjTRZDsI1ogqNGfCKeozzALvYPGfM=;
        b=iVgQO3ycVK3pVBqTkA3YYkpGHHmVitfY6RjL9k1gN5sSDV+IAS5jLY2DAD371Qp/ET
         NSwc0JJWZUK7LTTaCmb2T9iI3hrNCywk5iAGRtwkD2y5sqH3UGcH9t47bfJVfZC13aW3
         hLrjb8tNZ8CD/G5DCen09JtW22YWSrKJDmwEjJOlbgk1/vfNUyCBmswbDUc5ThGLvzdx
         eE5ratJZYTBTXdN2wAcYvobr6H1syi5vnn3XRw36ojYzxDesCP/xzCF9bX/ZZzkYn/XD
         dUTVrXao9WFhjs4NFueCRe5b+tp7csEvBoodv8U7AhFAnWT81KM211lXNvBIPKKwxb97
         XPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853244; x=1777458044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6felqTi7gbr6AsbjTRZDsI1ogqNGfCKeozzALvYPGfM=;
        b=COY6OxmDQfrvzilFmMHP7EA7HGy5Gn29TDAfy1OdUO16hliBnRNkBAL430ncO45a+w
         eyFs/yAOggGtYetGuoIUEUyGrrnu2tJuo5vKtI0oLSq487dLjN5NdjlJmlbSfm0IfHWz
         Z+AXX2VNNzm3aEbkXCQZW/SpLettVgCan+u7Q6O8uEvrRJMwG1vmTvuOZfexIBOX1G8y
         Dyvsry4A7x+U9dacbwsyA1JtGLsL0XhXY3ddnl4chK/es/LOgW4rSoNjLCG6X1yUmjoh
         Eay3vCRY18AFOmzBY3KA7GlrDIKngMfgwvObCqYSQiypcEiyQIPxgAEnpRzO64B2HrWE
         zsyA==
X-Gm-Message-State: AOJu0YyxLmPKppuhE1nhq9uryH+V8XPeuMO4G6K3C6DD1zSTo0sMxmsC
	HN03K4VHEKl1pxyOIrZkWUlc1qtpb7JTPfFRRVLZVVbI6qatEXBTpSSTF/kNdQG7pNHTOIAUyU0
	tkeLh7rXhKwLxwx5Q94mqNml658KLFPc=
X-Gm-Gg: AeBDietEWz+bjicdfbI0RuIwy13855cGow+74cAlub3nsYBZcnn216qSE4faPuxUMml
	6WBtO6IiApPHPaXRVsqJZrnn07EbTdRzuCEDXbfGLlcDFrcOvplVF2PfiTG8j0aecVNrzHcsvlu
	GgszMIbz6CGjXQ9HlmG+1D8vE/E2sVdbHmpqicvTs6SjV4tHSDwkZMoEh1X6BiN4ROx5pk0dG2h
	4lvcDhPmb4EzADkslEUcSnpHx714ou7c0pabRJPxmzkjep2rv47FeYgkMVkdGLb3p+2cXv6RwL4
	1qP0FIUnyGaf/1gvp0faytTkW+ni6+NKD4tHosHMw9Kj6/ppTJu6
X-Received: by 2002:a05:620a:4403:b0:8ed:d6df:c779 with SMTP id
 af79cd13be357-8edd6ef1c26mr1281273985a.35.1776853244147; Wed, 22 Apr 2026
 03:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260421095559.1856-1-wangmy@fujitsu.com> <20260421095559.1856-24-wangmy@fujitsu.com>
In-Reply-To: <20260421095559.1856-24-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Apr 2026 12:20:31 +0200
X-Gm-Features: AQROBzCtVPUg5b12nLOrygbwOFtWZX2tOTY3x8788FdPYLZ1Ahqz3j5dBHEOa-U
Message-ID: <CANNYZj_y_tPwBYeGeGuEYk=SVNVVbJ0nBkwrXK44nVqmsSGGCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 24/49] python3-chardet: upgrade 6.0.0.post1 -> 7.4.3
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 10:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235708

Neither Fedora nor Debian have taken the 7.x rewrite yet. The AI
rewrite controversy is well publicized.

I think we should hold this for a bit longer.

Alex

On Tue, 21 Apr 2026 at 11:56, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update: Change 7.x license to 0BSD
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...hon3-chardet_6.0.0.post1.bb => python3-chardet_7.4.3.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/python/{python3-chardet_6.0.0.post1.bb => python3-chardet_7.4.3.bb} (68%)
>
> diff --git a/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb b/meta/recipes-devtools/python/python3-chardet_7.4.3.bb
> similarity index 68%
> rename from meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
> rename to meta/recipes-devtools/python/python3-chardet_7.4.3.bb
> index 14c3247b35..ad36834169 100644
> --- a/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
> +++ b/meta/recipes-devtools/python/python3-chardet_7.4.3.bb
> @@ -1,9 +1,9 @@
>  SUMMARY = "Universal encoding detector for Python 2 and 3"
>  HOMEPAGE = "https://pypi.org/project/chardet/"
> -LICENSE = "LGPL-2.1-only"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
> +LICENSE = "0BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=bd0753b9dc12e5e3da3047778fcf1dca"
>
> -SRC_URI[sha256sum] = "6b78048c3c97c7b2ed1fbad7a18f76f5a6547f7d34dbab536cc13887c9a92fa4"
> +SRC_URI[sha256sum] = "cc1d4eb92a4ec1c2df3b490836ffa46922e599d34ce0bb75cf41fd2bf6303d56"
>
>  inherit pypi python_hatchling
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235632): https://lists.openembedded.org/g/openembedded-core/message/235632
> Mute This Topic: https://lists.openembedded.org/mt/118935094/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

