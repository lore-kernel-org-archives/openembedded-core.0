Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE18C6377C
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.29082.1650202778599160968
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 06:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VMpoUqKv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id y21so5973328wmi.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 06:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=bLaLcBQNbxtDITLE28UmNlDzhdF2Nf3AV7J0WPw0YJc=;
        b=VMpoUqKvVnK2CMspi1q7fGt3FIIQQOrRHh1KiWCnd3QumJcG0Ss4RSsYr8+LnNQEmM
         ET9FhQEfFkbMRsOGH0Tlf8SGV551G8HcIl7yqObCXJgNPxUBHd+TwUhaTd0HEuHJ3iSu
         BQJDWUhhPwSv783LA9K9Mdd76tgeF1VKvVpPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bLaLcBQNbxtDITLE28UmNlDzhdF2Nf3AV7J0WPw0YJc=;
        b=UNmczAUDH5KyebR7tND947EdQSXxxNCSjZS+mWjK1Ig5Yw3/EEWaPrftHEnAX57/dp
         4mSvCQUjXpbrsYIJL0qT2TkCyRos3C7KmZFdBbEm9Nicn8sKnhA2Xt4zF2PXr/sXTpIW
         BWYDKU1zKLh9It3u/BvkXjKmlB1U3G2b8pKrp21KtizMaKdRGeTOfghb8HBIUtFfFZaN
         GDhLLs6Kgf71TMGEVYMMHIWZEBD8vRe3wWXwPi11n49Tp+p9PwDKl5YMV3XzUoijr4Ea
         6Qyop5bflAKU+fjfIV2I9LV9R9ZJSl/q7iEQiv3d9ZCrO4kYPGtm5cT+IqOuqlmSULNy
         MALQ==
X-Gm-Message-State: AOAM531kpO35lYp9SrzuJOMEdZ9K/kH6OI9xN/wwakIJinCUqNjEvrvB
	4iXLgO1nks/8q29xcO8e/v3Few==
X-Google-Smtp-Source: 
 ABdhPJzbgJ738C49+ysSef2HUMRJZVJhU/dNj7bp3f/vYm/UQzAlMXSc5SHoXn+6iEJCdGiWtiziWw==
X-Received: by 2002:a05:600c:190e:b0:392:910b:2770 with SMTP id
 j14-20020a05600c190e00b00392910b2770mr3693666wmq.3.1650202776992;
        Sun, 17 Apr 2022 06:39:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:af33:9195:2d77:ff68?
 ([2001:8b0:aba:5f3c:af33:9195:2d77:ff68])
        by smtp.gmail.com with ESMTPSA id
 c10-20020a056000184a00b0020a85e7f22asm4128372wri.26.2022.04.17.06.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 06:39:36 -0700 (PDT)
Message-ID: 
 <1ee83eaf6f59567bceaeb0ed6e98a8f042492720.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH v2 1/4] sstate: add a LockedSet class as
 python set() is not thread safe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Apr 2022 14:39:33 +0100
In-Reply-To: <20220416222846.219151-1-quaresma.jose@gmail.com>
References: <20220416222846.219151-1-quaresma.jose@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164575

On Sat, 2022-04-16 at 23:28 +0100, Jose Quaresma wrote:
> With this LockedSet python class we can call the 'add' and 'remove'
> safely inside the ThreadedPool.
> 
> This piece of code is taen from the stackoverflow
> https://stackoverflow.com/questions/13610654/how-to-make-built-in-containers-sets-dicts-lists-thread-safe
> 
> Fixes [YOCTO #14775] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=14775
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/sstate.bbclass | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 1c0cae4893..a3ba748a1e 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -918,8 +918,28 @@ sstate_unpack_package () {
>  BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
>  
>  def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
> -    found = set()
> -    missed = set()
> +    # https://stackoverflow.com/questions/13610654/how-to-make-built-in-containers-sets-dicts-lists-thread-safe
> +    import threading
> +    class LockedSet(set):
> +        """A set where add(), remove(), and 'in' operator are thread-safe"""
> +        def __init__(self, *args, **kwargs):
> +            self._lock = threading.Lock()
> +            super(LockedSet, self).__init__(*args, **kwargs)
> +
> +        def add(self, elem):
> +            with self._lock:
> +                super(LockedSet, self).add(elem)
> +
> +        def remove(self, elem):
> +            with self._lock:
> +                super(LockedSet, self).remove(elem)
> +
> +        def __contains__(self, elem):
> +            with self._lock:
> +                super(LockedSet, self).__contains__(elem)
> +
> +    found = LockedSet()
> +    missed = LockedSet()
>  
>      def gethash(task):
>          return sq_data['unihash'][task]


The series blew up on the autobuilder:

testsdkest:
https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5079/steps/17/logs/stdio
oe-selftest:
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3461/steps/15/logs/stdio
and many more, see:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3535

Cheers,

Richard





