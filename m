Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web09.2544.1603827694250387793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 12:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I2CerRPJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id n18so3244382wrs.5
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 12:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=EtMFpZBy5lgJiuwlQG9a8ooeblYosBESUsZ7ZYqCr+g=;
        b=I2CerRPJRwok2UAaj+OzqoDHtHKwAxLDzHRnOXFGtpP894E31O/AdDlzmAfUevezT3
         kFAzxCF0exA/auQglJ4XP0rtfD6qbEmPEt7cjJlj0mHBd42cAoQzx1E+jxLGzUNw406L
         qRiNzyMM1cP5z7toXMuKUKuAWbft+/HuNRB6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EtMFpZBy5lgJiuwlQG9a8ooeblYosBESUsZ7ZYqCr+g=;
        b=RgFz3XtXBzMX8PHshuUfIQmbmFMRDbAe0ANk8HZEhzt0KgTOUl2X5AJTr/yWt3rh5Q
         bwYYLtyi9ZCgwIWN4EpyLZwOlM3OSb0DUj5IXKbWtYGBeNEdt0CQhXw+ewCmgRbw8yM6
         fcW2iB06OU4TwuMMzsWF5b8NSoaH2wiIHqsSyd0Xiy6ksSZBlgpSs3v4OKtkZx1OjLgH
         Dh736y1L2IZ701KBZxQ32OLFMZar/4HtrwtKyeM2JGuRSj7wnApECEt3viJfAVi+IfAP
         s1bcH9pGzCvmadsn5K0WKQKN5aMcO3rEUpIz9PQ7luu2E+GyewKixkwTOBMbrKdh7Ti1
         z9Wg==
X-Gm-Message-State: AOAM530CWAIIJxVO6veWHJF0gA7lqWI8U3HxP+3vC8U95efDASLhzWck
	J7aC6UBjrsSNkLX7bue6YUFMsg==
X-Google-Smtp-Source: ABdhPJzq95PZtH03oolffMY2iaoHIqpGbpd7JcdSBc8Os9ZDvRM7PG7ViBdZ0fpTWx0BExFp9/mORA==
X-Received: by 2002:a5d:414f:: with SMTP id c15mr4747288wrq.59.1603827692625;
        Tue, 27 Oct 2020 12:41:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1867:cb67:a1a2:320d])
        by smtp.gmail.com with ESMTPSA id l8sm3409997wrn.28.2020.10.27.12.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 12:41:32 -0700 (PDT)
Message-ID: <f154c498c88dfc436d4b9547b889e3aa8436fc41.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] add new extrausers command passwd-expire
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joseph Reynolds <jrey@linux.ibm.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Oct 2020 19:41:29 +0000
In-Reply-To: <978bccd7-a2f4-9aa0-9c77-9c10c81e068f@linux.ibm.com>
References: <978bccd7-a2f4-9aa0-9c77-9c10c81e068f@linux.ibm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Joseph,

On Mon, 2020-10-26 at 15:41 -0500, Joseph Reynolds wrote:
> This enhances extrausers with a new passwd-expire command that causes
> a local user's password to be expired as if the `passwd --expire`
> command was run, so the password needs to be changed on initial
> login.
> 
> Example: EXTRA_USERS_PARAMS += " useradd ... sofia; passwd-expire
> sofia;"
> 
> Tested: on useradd accounts
> When configured with Linux-PAM, console login prompts for and can
> successfully change the password.  OpenSSH server works.  Dropbear
> SSH server notes the password must be changed but does not offer a
> password change dialog and rejects the login request.
> 
> Signed-off-by: Joseph Reynolds <joseph-reynolds@charter.net>
> ---
>   meta/classes/extrausers.bbclass   |  3 +++
>   meta/classes/useradd_base.bbclass | 18 ++++++++++++++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/meta/classes/extrausers.bbclass 
> b/meta/classes/extrausers.bbclass
> index 32569e9..90811bf 100644
> --- a/meta/classes/extrausers.bbclass
> +++ b/meta/classes/extrausers.bbclass
> @@ -46,6 +46,9 @@ set_user_group () {
>               usermod)
>                   perform_usermod "${IMAGE_ROOTFS}" "-R
> ${IMAGE_ROOTFS} 
> $opts"

Unfortunately this patch is coming through line wrapped which makes it
hard to apply. Can you resend it without the line wrapping, or point at
a git tree with the patch in please?

I do remember the patch from the last time around and I think this was
the issue last time as well, I couldn't get it to apply. It does seem
like a reasonable addition and it would be good to work with openBMC on
common issues like this!

Cheers,

Richard

