Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.1182.1611270205363373121
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 15:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gbxsGyoj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id m187so2816457wme.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 15:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=U3jL73uYH9ImpJkkSA4p7LKLUPqCGetCIevGT4+W4qc=;
        b=gbxsGyojdn8Y9gKMNHMM9AHB5BvSaSHkXUg9jEq0DLV92VdlNMGro8YF80Rsy5KFtG
         S8HiAJWPx5Kq9lgQ5OC/4U05Fw+UppDK6wbAUGlGID1cBtRtgxzJNrMcQF2+6JHnNF6L
         LgCfjuDRxHDvpVi5vfi3JMoMekqcmqudfydrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=U3jL73uYH9ImpJkkSA4p7LKLUPqCGetCIevGT4+W4qc=;
        b=sai+fSh1x4LRaqZlteldrVxvpWQ4TnIL8MFYljNvcDpgwaj+gV9WdAXQb7yxKNSDpK
         sZg6p9I5eeuToU80rMc+nt2Zg2k/x0a5R2uVDVnqrUfMf+2d4tHq08AbT339DlFe4eVQ
         ZluMvXBcP1EcKuciqdNJdEPR3CcMJ7jyHI1pr01EdDIFXq8ZD1JZlBafzAky0aE6g8g8
         GXEOUPO7m/SQiQRh9whYPqfXCMgyOiyr+7pe/etALXnx7xhtdP8TFjy50NFE7kzkeG0S
         71gLcuvAkSABehAAimua+CB19KC0EFyxo43p0fsQzhqm2MO0LatQYPamjIv1B87nV+/w
         KYYg==
X-Gm-Message-State: AOAM530qHtlvyphgrDuCO6NFbFbj4Kw3RTriy+bSwhANL+FkIj+hKFhL
	10tMg5oqMUQlmnJx72y29WAUYw==
X-Google-Smtp-Source: ABdhPJzbCtTr6+bUG6PAvYpGESN5DeeG1R+VDK08QnZSQhYKNO0VJdREfetL23vQKMadTt1IBSlyQA==
X-Received: by 2002:a1c:1f11:: with SMTP id f17mr1266700wmf.67.1611270203807;
        Thu, 21 Jan 2021 15:03:23 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78? ([2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78])
        by smtp.gmail.com with ESMTPSA id x81sm4939690wmg.40.2021.01.21.15.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 15:03:23 -0800 (PST)
Message-ID: <6ce04c3ac3f5106a2dd7740f6145e62401bef312.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] devtool: Fix file:// fetcher symlink directory structure
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2021 23:03:20 +0000
In-Reply-To: <20210121223153.1347-1-tomasz.dziendzielski@gmail.com>
References: <20210121223153.1347-1-tomasz.dziendzielski@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-21 at 23:31 +0100, Tomasz Dziendzielski wrote:
> Add relative path if file is under directory.
> 
> [YOCTO #13738]
> 
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>  scripts/lib/devtool/standard.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
> index f7d8a82117..7b62b7e7b8 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -474,7 +474,11 @@ def symlink_oelocal_files_srctree(rd,srctree):
>                  destpth = os.path.join(srctree, relpth, fn)
>                  if os.path.exists(destpth):
>                      os.unlink(destpth)
> -                os.symlink('oe-local-files/%s' % fn, destpth)
> +                if relpth != '.':
> +                    back_relpth = os.path.relpath(local_files_dir, root)
> +                    os.symlink('%s/oe-local-files/%s/%s' % (back_relpth, relpth, fn), destpth)
> +                else:
> +                    os.symlink('oe-local-files/%s' % fn, destpth)
>                  addfiles.append(os.path.join(relpth, fn))
>          if addfiles:
>              bb.process.run('git add %s' % ' '.join(addfiles), cwd=srctree)

Are there some extra test cases we should be adding to account for some
of these changes? They suggest we have some missing coverage.

oe-selftest -r devtool

and see meta/lib/oeqa/selftest/cases/

Cheers,

Richard

