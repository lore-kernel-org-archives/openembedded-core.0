Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.2758.1590054776311154991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 02:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F6TDHy+Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id w64so5710438wmg.4
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 02:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=JFU4Lwgecrl3dKWAQrnmzMmdtrd8EUI9LZIYgxFQfK4=;
        b=F6TDHy+ZBXLinSsfkdqeI9xYXxER2KxgTnH9b5x45fdOb1szVOpJHLm2KD9E8DYrba
         0pYN+d40U3BklQOtGA1MQZZ/IDMfjRtwaM6yw3OPbKPkuB9bZX1Cg2L1M6gtZZqD7sca
         G5KJdVoO3/gKIcegwSccW7TFyjQJ/ZA8TwPpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JFU4Lwgecrl3dKWAQrnmzMmdtrd8EUI9LZIYgxFQfK4=;
        b=r1Vdgq5qJr2kqhU32mxcnzaKiPN6T76Hq5o2UTuaPOFjEWhgb1KyuhX4DsWwSvToTE
         se2scN3Pm29nG4UhpGUKRAGpl5Gf9Zph1lhGy5BBrFFV8EZH9D+mfwsYaBVlguwpgIXT
         eAnERBLm69YKHytO/wputHQ/j9Y9XR1AFfjx/PpysO7Bf/Jv5SskRrs2hcGR4oZS6V2G
         4atdV1zA23dz3RSSEk3vf25vwVuUypeAS3z9RbtebvlIE6ixiaH6lFObCZ+deT2JoTi3
         GZ4A8r38qIpZGpRZIF1uSLxCkbwzSq+XtcvRNenTVAjzl7azCoSMQqnKoP20ApSFMMAi
         TxKw==
X-Gm-Message-State: AOAM533U8JzJu1oDA+T8jXrHRCqZPQJ9dIOcER/mPFeXJIGuV8YpkVFb
	7zEV32BTehxv0BekW9hQzdKFmw==
X-Google-Smtp-Source: ABdhPJxQ+lTuG46uQRZqltOvvbut07IrxSZq6QEbyr7Azg9od1mcQvktQFaD8rs9G6hzAxU55nT5RA==
X-Received: by 2002:a1c:3c8b:: with SMTP id j133mr8755072wma.17.1590054774562;
        Thu, 21 May 2020 02:52:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id v131sm6371820wmb.27.2020.05.21.02.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 02:52:53 -0700 (PDT)
Message-ID: <c167d4e2c44bb0fae3aedc5986d0c33e95f8aa36.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] devtool: do not write md5sums into upgraded recipes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2020 10:52:50 +0100
In-Reply-To: <20200519171031.28850-1-alex.kanavin@gmail.com>
References: <20200519171031.28850-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-19 at 19:10 +0200, Alexander Kanavin wrote:
> This will drop them md5sums from recipes that still have them,
> and will not re-add them for recipes where they're already
> removed.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  scripts/lib/devtool/upgrade.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/devtool/upgrade.py
> b/scripts/lib/devtool/upgrade.py
> index cb6dce378a..f962a71e41 100644
> --- a/scripts/lib/devtool/upgrade.py
> +++ b/scripts/lib/devtool/upgrade.py
> @@ -391,12 +391,12 @@ def _create_new_recipe(newpv, md5, sha256,
> srcrev, srcbranch, srcsubdir_old, src
>              newvalues['SRC_URI[%s.md5sum]' % name] = None
>              newvalues['SRC_URI[%s.sha256sum]' % name] = None
>  
> -    if md5 and sha256:
> +    if sha256:
>          if addnames:
>              nameprefix = '%s.' % addnames[0]
>          else:
>              nameprefix = ''
> -        newvalues['SRC_URI[%smd5sum]' % nameprefix] = md5
> +        newvalues['SRC_URI[%smd5sum]' % nameprefix] = None
>          newvalues['SRC_URI[%ssha256sum]' % nameprefix] = sha256
>  
>      if srcsubdir_new != srcsubdir_old:

This broke the devtool selftests but I added a fix to the change before
merging.

Cheers,

Richard

