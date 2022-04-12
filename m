Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07506C38A2C
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web08.5799.1649727207736701756
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 18:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ndR9T7WQ;
 spf=pass (domain: linaro.org, ip: 209.85.221.176,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vk1-f176.google.com with SMTP id e2so3513385vkn.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 18:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5OKVYAQ78JW4jI/KzDxcBC3KI6fy+33Q1LbbAtwBc2g=;
        b=ndR9T7WQjStyOyuYFpI2c+u2vGMTLhDdsBxOQQdcnjx/VGVD4WBw5+Iavv5jgn+N7R
         XIl2E3eINRJ1KRaOw1jnFCISpduYrQQjzS8p/8VdYxxFeE64xeahbIGvHhfOBE+u+s30
         zVfoCxpWaHTfw10oNLZDQsWsY6ZkDVJsZdP0NycAF3RKYZX6pISUUyFw2AahYHpNJokF
         WLzpRsebhBciahYNPSv85Z7Vo98vk79HYalF/2E3jhDoLgO3HbrDVQXBZ/RVl32+SXFi
         rWIWwnhAbp9GECqPHSkBswlGbV79cFdcP03XCKHr44Y3xp5UW8/U7BvzddaW947dezvd
         fqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5OKVYAQ78JW4jI/KzDxcBC3KI6fy+33Q1LbbAtwBc2g=;
        b=sTwQz9+6ZQqq5SYHYs7kQ39z/kwm0wnfqxuBkbXHu1AUEXIecy5dMbonlwM3QrfKhY
         wQ9ROZYJ3SSWbrcUxXj0PgqBEdmGGVGrScCkVzLgrGb/ZWHI7ceWHX0q7caforfXa2jI
         MrPJ0/eWw2VUaSRtaALKlM9Au9m4TTG1tJxVnO9S9lnInOb/i8GQ6NfPxMfCAp258ww4
         hhMfQNcOcf2HavdrtNdwRi6eIeW3yGJPqRtsvzDrQyBhlDQtT0LF2Y9F8Qzpll2sEWDh
         RwFY4VjWDPdNCbjn6rNYF0CqhCmyqpEVsPdD4tFMeE2BlqWTIEdKxkOLcmO3R/ku6WKb
         wrZA==
X-Gm-Message-State: AOAM532jn625D7bBI3d4h2rDQHJtrihCkjt00gVd7QwqhnIR+NvEmuUE
	FiG7LkDCgQ5dSiZnY3rR2WY9+lXx0Fa0+aEI7hvhAQ==
X-Google-Smtp-Source: 
 ABdhPJyizN4CUQTbs+bkpTvVDXNecTCa9SKnLmO/6xbExdDC11bUcXebWIWwK1HearJWJXaKXzPKk5f3a+b/gwQAb/g=
X-Received: by 2002:a05:6122:9a9:b0:345:62da:2ce9 with SMTP id
 g41-20020a05612209a900b0034562da2ce9mr3408715vkd.39.1649727206503; Mon, 11
 Apr 2022 18:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220329130741.2430737-1-ross.burton@arm.com>
 <CAOSpxdap6UjLpy9M--b_EMYV+m3oYOQJT002Hqw5qcpCwgTVyw@mail.gmail.com>
 <CAAnfSTuHjbiN2NKVwZOut+MjxLhuFMwn+xAWkFHaqAXmM_8Ypg@mail.gmail.com>
 <CAOSpxdZGOwUs86K6bEX3WTgVu-+fFjonKxiGEe+u1OL=ivqx+w@mail.gmail.com>
 <CAOSpxdb+O=iDpDNr7S62wut=GErTXg8cvpYsj0nn6DM9G1CL-A@mail.gmail.com>
 <CANp-EDaVN-4Z_iYXJq7OcJ1QEtpAsHTGOQkCHeW+gJ6u2b=0xQ@mail.gmail.com>
 <CAOSpxdZdi+xiJcFeyOgrLTATOaaD0hf9k-+yQmsH2+GJm8xcQw@mail.gmail.com>
 <CANp-EDaN76FxTBEjWFe5WD3W+tHbqbfJuA=kcuW8eeyF_O8vHQ@mail.gmail.com>
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Mon, 11 Apr 2022 21:33:15 -0400
Message-ID: 
 <CANp-EDZ-b6JYx8h1LRkg7YwCX9frZw=s_XiJ1_Ys-nBuyvhvxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Steve Sakoman <steve@sakoman.com>
Cc: Ross Burton <ross@burtonini.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164248

On Mon, Apr 11, 2022 at 6:43 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> I was using qemux86-64 for my experiment, so I guess I need to redo it
> now using the correct machine!

I have rebuild with MACHINE=qemux86. Same result, all tests appear to pass:

RESULTS - apt.AptRepoTest.test_apt_install_from_repo: PASSED (44.80s)
...
SUMMARY:
core-image-sato () - Ran 64 tests in 61.570s
core-image-sato - OK - All required tests passed (successes=15,
skipped=49, failures=0, errors=0)

Ralph

