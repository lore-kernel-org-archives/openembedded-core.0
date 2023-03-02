Return-Path: <geoffrey.giry@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE79C6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 15:47:10 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.19449.1677772019983914950
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 07:47:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=BJjh2GVV;
 spf=pass (domain: smile.fr, ip: 209.85.208.54, mailfrom: geoffrey.giry@smile.fr)
Received: by mail-ed1-f54.google.com with SMTP id f13so69336523edz.6
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 07:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1677772018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A8d/LhrgV5ApTnnrWXSfcHA3JS42VBeELQeCiy28BxI=;
        b=BJjh2GVVFmqYnCSXNtDpYJA7DBWANal09GSnE6riAy/A8ZRLRwitnsjOwAIUltb4Uz
         znkzkRGS8UIYdkhrw76c8RWLffCWE6rnwaU/cdMnLazW6BbioTYtzmPreKszjYLgLfc7
         Qqj2h2PyQ08lXi0DBhqhq0z4dgkBAKHe+nnR9bZ7ZCldc2H4Pgs5P9wMYZ2WiD65xmen
         pCWENtak3TZ13cQZ/MvLRGX0BWV6SNnKpEeObmS5vi7KcLglz4pMCoXln3l+/rCpvYgj
         aqGQSn7UD/I0B8xyLtWuKzlt/Am+GkAMLvlnEz0TamimpQmNg9pNyzpBkpfo4od/lDOV
         00ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677772018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8d/LhrgV5ApTnnrWXSfcHA3JS42VBeELQeCiy28BxI=;
        b=IkmJj4IffBq4njUJpZSzr0Pj0FHZzknRzRBNWpM4GeTM4rQLIFqqYkV4VU3HsDBFtQ
         Yq1k4fZWNjAXfPei8B2egnDYNp59vtMky6a0B4+mIHi/hW7RtIUwbo2JWxbnt1weRNPn
         oYZ34z/Xm3qluCAdz+6HJC7JD+3LdI/nBPdItTb/mXtkzCUiX9EvH0o8nUS6jRLbXutb
         dsEI0wFPUW6VcUDbs1O32vNTZ0y/jTaiI4rEuPLFqoZSpwYIOXqh/lCor3Hd3k3u4RlS
         1ffML2B6Do1hEHo3Zzb0razZFlp6X+TWqj8HDtnSh+cwEcPS3sJoPgy9zDSWlV7dchKc
         A8bQ==
X-Gm-Message-State: AO0yUKV5Y1rG42JH56xDijtmVzdjg6srH/8Dn08LlpBOuG/vstXx9xHP
	5gJfUZM4QgLup3RLvli0QMeupgCI9RJFB6K9XxhEzA==
X-Google-Smtp-Source: AK7set/ycI7VcqpHmbHERm0Y/d3pOaigpU+EiD34MwcUVSFjomvHRJ/v6HwfKrPlwylEnD4WYH3Xw+JCuVFjRuetHyQ=
X-Received: by 2002:a17:906:389a:b0:877:747d:4a82 with SMTP id
 q26-20020a170906389a00b00877747d4a82mr5544187ejd.0.1677772018103; Thu, 02 Mar
 2023 07:46:58 -0800 (PST)
MIME-Version: 1.0
References: <20230227110027.804671-1-geoffrey.giry@smile.fr>
 <4b3623567692b08b281fc2157701dfae310c3229.camel@linuxfoundation.org> <Y/9jD66h53ssgyg6@nuoska>
In-Reply-To: <Y/9jD66h53ssgyg6@nuoska>
From: Geoffrey GIRY <geoffrey.giry@smile.fr>
Date: Thu, 2 Mar 2023 16:46:47 +0100
Message-ID: <CAGwXbzaRhpBawfEBQm-0FFJZOGfYK5=Y79B2eADLNKh4_pdcCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions: ignore inapplicable
 linux-yocto CVEs
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 15:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177965

Hello Mikko,

Thank you for the link to linux_kernel_cves, it will be very helpful.

For the target version, since yocto allow building image for kernel
version 6.1 and 5.15, we preferred to only add to the ignored list CVE
patched in both this versions to avoid adding false negatives.

Concerning the CVE listed in your mail, the first two are still under
analysis on NVD site and therefore do not appear (yocto tools use NVD
database to get CVE information).
For the last one, the patch was not yet back ported when I did the analysis.

Regards,
Geoffrey GIRY
SMILE ECS - R&D Engineer

