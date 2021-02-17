Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.10247.1613579818012040890
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 08:36:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eC2DZqC9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id n4so15076385wrx.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 08:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=rfVzs397tp/TFRQDVaaWRF3S8ANnc73onh9yF74iUY8=;
        b=eC2DZqC9RbgnMuSeJSPZTq79IysgZSejYXP/DOmwEWiqbhkkPpaJfOBXw1YaxTKzF4
         LAsPwinT5qoB/5K+MPVbS9c3DNT8DDw9b3UZQu0p3CGy8b0uYbg/M2PEDM5Hj2TVGCX8
         07lcForKQH0O+U8jZ7YBRx1Ag6S7M1Eqk8lPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rfVzs397tp/TFRQDVaaWRF3S8ANnc73onh9yF74iUY8=;
        b=LECIPnfPpRNnIqQABsXRX9x1NBr6MEGq5hi99RAzr/E3EHsH/4VTvtSVvJ+l+DLpu9
         S7XZGgCK5LXFcHmpfSt0GZJGplgvYwYeAN/O+C8WjIcunqwU/MypAn30Zd6gMpdh0joM
         IgPGzr9Ucd8aRgw+YmOCD/iX7eLKiNeZVKf2CFu/miGCFkZE9u2MNp/+yLEmXpDFKxw9
         +LJdr20acweollQH4lx6YFVAsoQ5K6XlQXqgxeJYsSb/3mEgJrTlJyG9IMHSaocH0MEr
         /JiSFVLFdqrSMUAQ5pZqDl80tngjXyThOuQJ/nl9hJn0mzHha0gEGoac3lG7VL7QxCZ4
         BfdQ==
X-Gm-Message-State: AOAM532cRDEg+4V+wLNSxNl26QbhXuAQ7Zyusz0SuWpxNlItLXLiWFSK
	yRwr1c64OJOSzsFD2BpmW2IE4w==
X-Google-Smtp-Source: ABdhPJyI3RygJ4q2H2ah39UAJuBuiPRmlbyIf0paeuHQOtxEMmpS5e+XOkAlbOu4GFadTSZ09SI8DQ==
X-Received: by 2002:adf:e708:: with SMTP id c8mr106533wrm.152.1613579816384;
        Wed, 17 Feb 2021 08:36:56 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:19d:cb66:14ba:c267? ([2001:8b0:aba:5f3c:19d:cb66:14ba:c267])
        by smtp.gmail.com with ESMTPSA id g1sm4559295wrq.30.2021.02.17.08.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 08:36:56 -0800 (PST)
Message-ID: <06102c024bfec00745d9b2dbde8b19a7fb4207b8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky-contrib][RFC PATCH 4/5] license.bbclass: Add functions to split and canonicalise license strings
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Meh Mbeh Ida Delphine
	 <idadelm@gmail.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Feb 2021 16:36:55 +0000
In-Reply-To: <2efffee96fae455b8cdb77d47c576bfe@XBOX03.axis.com>
References: <20210217040033.21541-1-idadelm@gmail.com>
	 <20210217040033.21541-5-idadelm@gmail.com>
	 <2efffee96fae455b8cdb77d47c576bfe@XBOX03.axis.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-02-17 at 15:04 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Meh Mbeh Ida Delphine
> > Sent: den 17 februari 2021 05:01
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [poky-contrib][RFC PATCH 4/5] license.bbclass: Add
> > functions to split and canonicalise license strings
> > 
> > These functions that will later be used in package.bbclass simply make the
> > source and recipe licenses in the same format so that they can easily be
> > compared and the ouput warnings filtered accordingly.
> > split_spdx_lic() splits the license strings and returns a set of the
> > canonicalised licenses.
> > rem_false_lics() does two things:
> > - Converts '-or-later' licenses to their canonicalised form
> > - Gets rid of "WITH Linux-syscall-note" from license string if specified
> > in local.conf
> > 
> > Signed-off-by: Ida Delphine <idadelm@gmail.com>
> > ---
> >  meta/classes/license.bbclass | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> > index dc91118340..576464cb26 100644
> > --- a/meta/classes/license.bbclass
> > +++ b/meta/classes/license.bbclass
> > @@ -435,3 +435,30 @@ python do_populate_lic_setscene () {
> >      sstate_setscene(d)
> >  }
> >  addtask do_populate_lic_setscene
> > +
> > +
> > +def split_spdx_lic(d, licensestr):
> > +    """
> > +    Split the license strings and returns a set of the
> > +    canonicalised licenses.
> > +    """
> > +    import oe.license
> > +    split_lic = oe.license.list_licenses(licensestr)
> > +    spdx_lic = set([canonical_license(d, l) for l in split_lic])
> > +    return spdx_lic
> > +
> > +def rem_false_lics(d, pkglic):
> > +    pkglicsperpkg = set([])
> > +    for l in pkglic:
> > +        if l.endswith('-or-later'):
> > +            # Converts '-or-later' licenses to their canonicalised form
> > +            lic_ = l.replace('-or-later', '+')
> 
> Given that licenses such as "GPL-2.0+" are deprecated by SPDX, shouldn't we 
> instead introduce the canonical "GPL-2.0-only" and "GPL-2.0-or-later"?
> And then add mappings for, e.g., "GPL-2.0" to "GPL-2.0-only" and "GPL-2.0+" 
> to "GPL-2.0-or-later".

Something like:
http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=1c2ce4565bc85915ab970e42bf7af3a78ec2dd6a
?

:)

> > +            pkglicsperpkg.add(lic_)
> > +        elif l.endswith(' WITH Linux-syscall-note'):
> > +        # Gets rid of "WITH Linux-syscall-note from license sring"
> > +            if d.getVar("LICENSE_WITH_LINUX_SYS") == "1":
> > +                lic_ = l.replace(' WITH Linux-syscall-note', '')
> 
> Looking at https://spdx.org/licenses/exceptions-index.html, there is a long 
> list of predefined exceptions and "Linux-syscall-note" is just one of them. 
> We probably want a more generic solution for how to handle exceptions.

Agreed, I was trying to make that point in one of my replies!

Cheers,

Richard
> 

