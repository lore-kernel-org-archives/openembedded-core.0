Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.16100.1612084074797352899
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 01:07:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W2+pu11T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id j18so10062497wmi.3
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 01:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=47wtTGEC1MZfberOZTArJfhykyPvmgPo25hrRoN6YhA=;
        b=W2+pu11TzSccxrbQJzD8iawBpEN2EtyrSyqvjUeV7gQMRjbdMsX+skhKLF1/tmSQ15
         gKRci3UhHz3LKm9MhAYwBaFkW4v1b0kXuXGMkGxr0GKayT6FHx9d2HtcqYELh4hQOkUU
         p84KhgC+/eEs4tGRZBbGtn+eq1BlVMXji61V0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=47wtTGEC1MZfberOZTArJfhykyPvmgPo25hrRoN6YhA=;
        b=juT1cvLybrNnN2YXiJI90VvvkZOlnB1Rx+RjPW/57iyt7YTat3Q5qvRb/XzLIFAYP9
         r255N5QjfP9y0WzLv78CUZBcykeFY8hDFYgPYNK8m7UlVDlcWJ5PyB57NEtZG7JjsXyk
         T0+C6OUDI44MpRvaqpzm32wTISoj8lHJSuwPgaW0ARX5QnWwHXQ9YNgf6aKn5NuTLwSL
         qKXQJvzAomy9+rApJhiTn7K1BjhRNbm9B+WScKjxvX8beoysPK8TAEBz5n97y2m/1bm0
         zvk9b5jPgWAx+WOVFeyAj1cftIRwnh6BEozS24kVgWJ9ZqeQi20IhxVxBgQl3W5Dgtmm
         s3BQ==
X-Gm-Message-State: AOAM532mwUrXDEIgoRaCQ818B9d7ebgLxIhL/RpMWKQH/uZKZOtMpclr
	owXgeXFKlN2xSLmy7gLi6uOHAA==
X-Google-Smtp-Source: ABdhPJyAgP3mCx/J/DEBLekJQW56yYQNtcMl0wXqfnKXJjb2CJy08AfJJ4cmatWVll+SveEtBz001w==
X-Received: by 2002:a7b:c3d3:: with SMTP id t19mr10411520wmj.151.1612084073110;
        Sun, 31 Jan 2021 01:07:53 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:29f7:5a4e:c660:258e? ([2001:8b0:aba:5f3c:29f7:5a4e:c660:258e])
        by smtp.gmail.com with ESMTPSA id b83sm4250877wmc.44.2021.01.31.01.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 01:07:52 -0800 (PST)
Message-ID: <d29734c79a8d5712f4c2cc720e11071dedb68383.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/7] native: Stop clearing PACKAGES
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 31 Jan 2021 09:07:50 +0000
In-Reply-To: <CA+chaQdc7P6NsTno6oCcB4HmoseMziAXA57f646=YWWDPyEH8w@mail.gmail.com>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
	 <20210127172753.1286275-6-richard.purdie@linuxfoundation.org>
	 <CA+chaQdc7P6NsTno6oCcB4HmoseMziAXA57f646=YWWDPyEH8w@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2021-01-30 at 17:15 +0100, Martin Jansa wrote:
> 
> 
> On Wed, Jan 27, 2021 at 6:28 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > Some now unneeded code in python3-setuptools is dropped, there are
> > further
> > changes like this which can follow.
> > 
> > This change was verified with OE-Core by comparing task-depends.dot
> > generated
> > by "bitbake world -g" before and after the change, the files were
> > identical.
> > 
> > diff --git a/meta/recipes-
> > devtools/python/python3-setuptools_51.0.0.bb b/meta/recipes-
> > devtools/python/python3-setuptools_51.0.0.bb
> > index 6ee935f8f79..db336bfa13b 100644
> > --- a/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
> > +++ b/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
> > @@ -58,8 +58,3 @@ RDEPENDS_${PYTHON_PN}-pkg-resources = "\
> >    ${PYTHON_PN}-plistlib \
> >    ${PYTHON_PN}-pprint \
> >  "
> > -# Due to the way OE-Core implemented native recipes, the native
> > class cannot
> > -# have a dependency on something that is not a recipe name. Work
> > around that by
> > -# manually setting RPROVIDES.
> > -RDEPENDS_${PN}_append = " ${PYTHON_PN}-pkg-resources"
> > -RPROVIDES_append_class-native = " ${PYTHON_PN}-pkg-resources-
> > native"
> > 
>  
> The runtime dependency on ${PYTHON_PN}-pkg-resources isn't needed
> anymore? I don't see how it would get still included as you said that
> bitbake -g files were the same.

I think you're right and I shouldn't have removed the RDEPENDS, only
the RPROVIDES. bitbake -g are task dependencies and the task
dependencies still showed up so this didn't highlight any issue.

I'll test a patch to fix that and add it back, probably in the main
RDEPENDS list.

> I'm asking because meta-python2 has the same issue in:
> https://git.openembedded.org/meta-python2/tree/recipes-devtools/python/python-setuptools.inc#n49
> 
> and my fix I was planing to send was to replace it with:
> RDEPENDS_${PN}_append_class-target = " ${PYTHON_PN}-pkg-resources"
> and drop the RPROVIDES, because it unfortunately causes bitbake to
> get stuck after reporting parsing error as:
> 
> ERROR: meta-python2/recipes-devtools/python/python-
> setuptools_42.0.2.bb: QA Issue: meta-python2/recipes-
> devtools/python/python-setuptools_42.0.2.bb: Variable RPROVIDES is
> set as not being package specific, please fix this. [pkgvarcheck]
> ERROR: meta-python2/recipes-devtools/python/python-
> setuptools_42.0.2.bb: Fatal QA errors found, failing task.
> ERROR: Failed to parse recipe: meta-python2/recipes-
> devtools/python/python-setuptools_42.0.2.bb

Are you saying that it does that with the RPROVIDES removed? That seems
odd :/

Cheers,

Richard

