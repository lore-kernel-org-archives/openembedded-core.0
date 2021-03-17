Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.5118.1615982857712304439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 05:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=r5kK1o4z;
 spf=pass (domain: burtonini.com, ip: 209.85.128.48, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f48.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso1180028wmi.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 05:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wyzNnIdxl3u3bn0ogvAi9p3By2OLVW42YN5QfFtz8nw=;
        b=r5kK1o4z2RbOo0Ga1b8p1mayiw6sk8b0d4Yc1WL8Nu/UlDtjHOewgx02Txd9VA/IMq
         lScJt94wDVdmXHe7J3GhFUxsqupoF6nxcIrFYfgETqOaDaiZ2JeIhVOUZ8kcTytoGKW5
         uirPZ2IIJNz6SNxthJ4YjpLggQYy8JZRv9rGSzeMempLGAYHeZvNCBRibpOqccOcvzNM
         ocbbyxxj3TNh6SvEA3MW3O1Pp0TscrgedBJZJffDqNr20LoOCvVrvIuO9mA7fe+OfcY1
         uygY75QbMfMDzoYyOPaFHLjy+CEm+B1cEWyOsGQYFuKKE+GQnDo0/UW4l6hMDnJrPa24
         DpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wyzNnIdxl3u3bn0ogvAi9p3By2OLVW42YN5QfFtz8nw=;
        b=TC2MKyDPOvdCLwhgWKfnPAktYShGu8+ZQE87q0E+E3aLQZFQHRBTnXmApni2eON0CA
         ZkXMC1wezKANO10U+bOX+eAiECuWnI1jiiCAr226ye7Mj6j6DgmTX3OpEVvKfdSoeFgR
         eezguA0l6iZtv4dkw13QAQW3XB6BnK8u9d7u6wzSxDNU5ApdZQz37T5HfT6z+w8rNT4M
         0XEjSBeRgVFhh14JxDyyPDEUg+TjGa8rPrzGcIrcwG3OFp+yrzPL7tyWpcf6Cu/Hssbn
         km8NwK126UHnp70FN7YOvoxl4/msvQlVidGs1EB1h3A2eQBnYZN+oNwsqfNE9hnDTdt0
         bp4g==
X-Gm-Message-State: AOAM530cjwTYyYWrSqDe41J3cj/Iib3ps0CDV4ttOkrHAlAnncmY9rP7
	Irdwlpu2jokljCzO/M8LhMS8dQZO6N7lvOI7ffMXhQ==
X-Google-Smtp-Source: ABdhPJz5AlmCbSvPIxxvb6qaOL2+3BIKmVp2WsBcmxnU1Rt72ncYDiRtGoW69mPSdxht14EQJMrL5iEE8TT7KaywFC0=
X-Received: by 2002:a1c:2016:: with SMTP id g22mr3396314wmg.137.1615982855956;
 Wed, 17 Mar 2021 05:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210304144407.66850-1-chee.yang.lee@intel.com> <CAOSpxdY1S4Xma=gZBSvCaEdOFLm7LDfnsS10zYEh_vdRa5kPLw@mail.gmail.com>
In-Reply-To: <CAOSpxdY1S4Xma=gZBSvCaEdOFLm7LDfnsS10zYEh_vdRa5kPLw@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 17 Mar 2021 12:07:25 +0000
Message-ID: <CAAnfSTsoitY0d2h9srVS+TZJ4qmja9628KTuT8EmxR5mdMHAfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] cve-check: use Version for "=" operator
To: Steve Sakoman <steve@sakoman.com>
Cc: Lee Chee Yang <chee.yang.lee@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Right, as Steve said the semantics here are somewhat vague, and we
should err on the side of caution.

Changes like this make me think that we *really* need to expand the
test suite with every change.  Add in some CVEs to the suite that
demonstrate the problem, with comments explaining what should happen,
so that we don't regress as the logic gets more convoluted.

The other patches in the series are fine, but this one I think does
need some test cases.

Ross

On Thu, 4 Mar 2021 at 15:07, Steve Sakoman <steve@sakoman.com> wrote:
>
> On Thu, Mar 4, 2021 at 4:44 AM Lee Chee Yang <chee.yang.lee@intel.com> wrote:
> >
> > From: Lee Chee Yang <Chee.Yang.Lee@intel.com>
> >
> > version string from NVD might not constant all the time, cast them to
> > Version whenever possible while compare for equal operator.
> >
> >  CVE-2010-0426
> >  "cpe23Uri" : "cpe:2.3:a:todd_miller:sudo:1.6.3_p1:*:*:*:*:*:*:*"
> >
> >  CVE-2010-1646
> >  "cpe23Uri" : "cpe:2.3:a:todd_miller:sudo:1.6.3p1:*:*:*:*:*:*:*"
> >
> > Signed-off-by: Lee Chee Yang <Chee.Yang.Lee@intel.com>
> > ---
> >  meta/classes/cve-check.bbclass | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> > index 112ee3379d..e0c8321e99 100644
> > --- a/meta/classes/cve-check.bbclass
> > +++ b/meta/classes/cve-check.bbclass
> > @@ -269,8 +269,15 @@ def check_cves(d, patched_cves):
> >                  (_, _, _, version_start, operator_start, version_end, operator_end) = row
> >                  #bb.debug(2, "Evaluating row " + str(row))
> >
> > -                if (operator_start == '=' and pv == version_start) or version_start == '-':
> > +                if version_start == '-':
> > +                    # '-' can be any version
>
> I had an extended email exchange with the database maintainers about
> the use/meaning of '-'
>
> Here is their final word (which left me quite unsatisfied in its ambiguity)
>
> "In general, the '-' is used when affected versions of a product are
> unknown. If affected versions are stated, and there is no fix
> available, the configuration would be up to (including) the latest
> stated affected version. I would also like to add that '-' also means
> N/A, so not necessarily only when affected versions are unknown, which
> may help to clear your confusion."
>
> Using '-' to signify either "we don't know" or "not applicable" seems
> quite wrong to me :-( But that's the way it is.
>
> >                      vulnerable = True
> > +                elif operator_start == '=':
> > +                    # it could be unexpected version string which cannot be parse, compare them string to string only in such case
> > +                    try:
> > +                        vulnerable = (Version(pv,suffix) == Version(version_start,suffix))
> > +                    except:
> > +                        vulnerable = (pv == version_start)
> >                  else:
> >                      if operator_start:
> >                          try:
> > --
> > 2.17.1
> >
> >
> > 
> >
