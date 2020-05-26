Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.55352.1590512556520117872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 10:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ej9FGpaq;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id j16so8705443wrb.7
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 10:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VaSSYPr4oIcKybZ7FMtRhliUVuhYSUesio1m0hTdjU0=;
        b=ej9FGpaq2swhgajPsv2bWl09/CF6fjnBCzfsYOo3UqDRcRQHyS8sWyqmNvtoSWW404
         w6LbS0cCvomj9O8WDhufwDUHdNBlpPFb/COAJSfr6iRty46hbvHBOPbVpv5l3+X3NutE
         TZuxTJWh+hzyoO+MbgTJQKMODdNGw4TBNcV4ZP6iHLPlLz277DztseP5kpHvnh3pYmo/
         dGGw1Jj6BzzNa4n4LU2WP1wXfSyZubyaAAmU+MBfcP4KOGpBqq4lfLwGwqFqY2kSU/X0
         LcjIzRGExLneWiKspL9yvFse+keQuEcQlvENyy4DnoYgYmkf0VXuT+mI4+Q6QMhyO69b
         YMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VaSSYPr4oIcKybZ7FMtRhliUVuhYSUesio1m0hTdjU0=;
        b=aPpzq0tmI2AW53QjZpwfoC6slFaC3kpB0yf/QL6LByapo/3eX8VR32QnD3wdwRyOGD
         7aELam5Z1VMyDBFs9rUVYP0yMvEl+keVicF4AF/owI7cFf2isnVpV7+uHljdnc7q+9dF
         /EyjoDmR5hN1OnqhD9K9d154d0mLd6HCYUSY+5OBY7MnWLXp2kL4eMQ19MK1jl2w31s+
         zWAeMDCHQccJ8lroSvt3PnEQ1ql140Mkch+z6CaRpqbtHK6B0arg/pNqPJvjvNMiyAsi
         KcI1EGChTdB4FqqojDXPJSqV8zKkP9nbHdcUR066qUmHV0yrnUurNDTyGAShe38TbG17
         4SrA==
X-Gm-Message-State: AOAM530taGkr+z91ohBNi2WqxcVwpTHaFvgNifjfO9gwmNTAMWHnKshh
	dBZ3R3OPQvJ85c5eiq2Nr8JIqywZYRhCzikzmpU=
X-Google-Smtp-Source: ABdhPJysPY55iu4G2q0GJ/0ZwwLUWnlyZrnPkAvlqsyikfvmB5W5AuVKsuwJkN07ApkTo+atN/W4B2bDSrZn5O4qdDI=
X-Received: by 2002:a5d:6283:: with SMTP id k3mr7480979wru.422.1590512555054;
 Tue, 26 May 2020 10:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <1590392749-329454-1-git-send-email-michael.ho@bmw.de>
In-Reply-To: <1590392749-329454-1-git-send-email-michael.ho@bmw.de>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Tue, 26 May 2020 07:02:23 -1000
Message-ID: <CAGDS+n=SfCk_+DeBghVu80=f+RfEJ39Hg72xPG2iUyTwz6WY7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_rpm.bbclass: respect package overrides for the main package
To: Michael Ho <Michael.Ho@bmw.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Does this patch (and the follow-on series) make sense for inclusion in dunfell?

Steve

On Sun, May 24, 2020 at 9:46 PM Michael Ho <Michael.Ho@bmw.de> wrote:
>
> From: Michael Ho <Michael.Ho@bmw.de>
>
> Apply ${PN} to OVERRIDES when determining the base package spec variables.
> Without this, there is a mismatch in behaviour where overrides for the base
> package have no effect while overrides for subpackages do. The subpackages
> should not be affected by this override as they apply their own package
> overrides and will by default fetch the base variables and apply them in
> the spec file.
>
> This makes the behaviour for package overrides match the implementation
> in package_deb.bbclass and package_ipk.bbclass.
>
> Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
> ---
>  meta/classes/package_rpm.bbclass | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 9a4be2e..519c22b 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -286,16 +286,18 @@ python write_specfile () {
>
>      # Construct the SPEC file...
>      srcname    = d.getVar('PN')
> -    srcsummary = (d.getVar('SUMMARY') or d.getVar('DESCRIPTION') or ".")
> -    srcversion = d.getVar('PKGV').replace('-', '+')
> -    srcrelease = d.getVar('PKGR')
> -    srcepoch   = (d.getVar('PKGE') or "")
> -    srclicense = d.getVar('LICENSE')
> -    srcsection = d.getVar('SECTION')
> -    srcmaintainer  = d.getVar('MAINTAINER')
> -    srchomepage    = d.getVar('HOMEPAGE')
> -    srcdescription = d.getVar('DESCRIPTION') or "."
> -    srccustomtagschunk = get_package_additional_metadata("rpm", d)
> +    localdata = bb.data.createCopy(d)
> +    localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + srcname)
> +    srcsummary = (localdata.getVar('SUMMARY') or localdata.getVar('DESCRIPTION') or ".")
> +    srcversion = localdata.getVar('PKGV').replace('-', '+')
> +    srcrelease = localdata.getVar('PKGR')
> +    srcepoch   = (localdata.getVar('PKGE') or "")
> +    srclicense = localdata.getVar('LICENSE')
> +    srcsection = localdata.getVar('SECTION')
> +    srcmaintainer  = localdata.getVar('MAINTAINER')
> +    srchomepage    = localdata.getVar('HOMEPAGE')
> +    srcdescription = localdata.getVar('DESCRIPTION') or "."
> +    srccustomtagschunk = get_package_additional_metadata("rpm", localdata)
>
>      srcdepends     = d.getVar('DEPENDS')
>      srcrdepends    = []
> --
> 2.7.4
>
> 
