Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.16325.1599556147424884034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 02:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cIzwwKVC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id e11so13886723wme.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2020 02:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=RcW/SyWxKXTAiFvingqdDymHKeCf0HLehrHph+q7cY0=;
        b=cIzwwKVCGwLyb5S5oJ+oNwZoPgt5YVuD6jDflkwKcXpJRgzIPbhe+RYLJQ2dYO9YhH
         di0+7rQgW5p0NfarNM5iQnk58NdslzK8Xd5SwP7MaT72uJ70EhIhOUfbYqhCzQ08Qvmv
         Xv3YnuFtWDcxvs9qH+tXJlqh/dnSX7wCnVLgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RcW/SyWxKXTAiFvingqdDymHKeCf0HLehrHph+q7cY0=;
        b=orA66hHDp4VX9fGk/pEOYy9dH5B9zuJ/D5H9018iohxoirs54O0qpAz7omUQLToiLC
         vdIdm5RImfIZrutuQgyPBfd9ZNf82HhFRax1d+WA+miF8u1xSK7Poi++X0caa43gEvqQ
         r3q92uut/um/4RZG7HMfAoDEeTd11htysUko64uaplWVji8qBBB86c9QD32DNrDcespG
         EmBukMbhOXwFGOF78HhzlbMPu59IogcEQljVIqOUTjCg6OE4uO1tNrI6g+E/sGA5btAB
         otSjKB1XsbcA2ps7jYWgnExYL7zE3NNt7fGkdcICRI+38+LDiIP3U1uqy39CMnE4eoWu
         ssTg==
X-Gm-Message-State: AOAM533C6Z594SrOGJSLbSYAmKHzm9STLVtGhtrWusgsiDvq6r5kxxQ6
	S7AgbWqtgwoslTemsXt0MZIUCC0m1JTNbg==
X-Google-Smtp-Source: ABdhPJwGplmiHK4Wo2VMB1LtG2WqI+P4GJwcZafbCnagkTuERGyupDDeptWbPsaJcaNdRff0L9fFuw==
X-Received: by 2002:a7b:c00d:: with SMTP id c13mr3298614wmb.24.1599556145656;
        Tue, 08 Sep 2020 02:09:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 8sm35607199wrl.7.2020.09.08.02.09.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 02:09:04 -0700 (PDT)
Message-ID: <05c9581ff5597bbed1df07c5ad7ff3b6754e6949.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][zeus 18/19] selftest/signing: Ensure build path relocation is safe
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 08 Sep 2020 10:09:02 +0100
In-Reply-To: <16329BB5A70B8204.32160@lists.openembedded.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
	 <16329BB5A70B8204.32160@lists.openembedded.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-09-07 at 21:53 +0100, Richard Purdie via lists.openembedded.org wrote:
> Similarly to 04ee0e8b95cd8ed890374e0007f976684206b630, ensure only full
> build paths are replaced in the environment to avoid breaking buildtools.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/cases/signing.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
> index 5c4e01b2c36..87d3ae6bafe 100644
> --- a/meta/lib/oeqa/selftest/cases/signing.py
> +++ b/meta/lib/oeqa/selftest/cases/signing.py
> @@ -44,8 +44,8 @@ class Signing(OESelftestTestCase):
>          origenv = os.environ.copy()
>  
>          for e in os.environ:
> -            if builddir in os.environ[e]:
> -                os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
> +            if builddir + "/" in os.environ[e]:
> +                os.environ[e] = os.environ[e].replace(builddir + "/", newbuilddir + "/")
>  

This patch had a problem, I've updated the one in zeus-next to match
the revised version in master.

Cheers,

Richard

