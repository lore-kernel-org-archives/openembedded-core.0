Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web09.16708.1605144865741487004
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 17:34:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W1tnF8I4;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 13so2019250qvr.5
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2020 17:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3I6qtxqAd9XonUJ9Ox/INP+ElxbrnmJu5zkWHgcQdZE=;
        b=W1tnF8I4ofE20zqG0wUJzrcGHT7owzhOOI4kXdy9vn5NHui1OaR8ZcVDQq5ezKVvqy
         CCT5TCL8fv7/77uYUsLiqpf1Fw3wSmnNfu3W5uXU0NHVT2x7OSM7OTcrxrjUhXmOPX2W
         oj9mBu3QX39/JU4BTdjvb3RikXLwJZ3cxzfCykwM+QErEks9ldx66HqQ72h7jycieBLM
         Bq8nwn46h6mslVb3Fd+z3XZDYZQST2QALjRUlP1MlmcM71etAwMmy3FqeNbk8MKRCE8d
         edD2MrHvrqimgo4/AGI1bU/mOg8vwEupbXxUp3fy0VrEZJqoOeCR015H7oikuIxY3cv5
         zU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3I6qtxqAd9XonUJ9Ox/INP+ElxbrnmJu5zkWHgcQdZE=;
        b=mJqH/u80ajaCD7i+k8eAyLPc2Cbc3JfMV5W8BYZKBoGlAlLH/dsSiTD66/mfcX+W4y
         wQ9Jbn/eFlnNnLAejViD6kz5RDfbRLDPhkncof1VYiCn609UFh9P0pxmsKU6yMEmVZIb
         GttvuPH9fGyYqms5QXSvuubXq61gElimIOvE/W/NRnbY87rMg9XcNWAEJc7Ne0eO4ad4
         /wwRni0Cq46WELaSU3SWOdMrzvbnkYiONREFyZmCucztqsHVdLID+IR+55aQXhv8YlQY
         eZ6IJJaxq4OXbGNM4NO2QGkRrj3dIV8mX/qDggKGJa07nqz/gi9uNd6oIT0qe15J6tQe
         dcvA==
X-Gm-Message-State: AOAM530mVUl5LzSWt0phM/AkJvwWna+y+J33LtHp53BZYjNmexp4dtW4
	+5AKG2NGae4zXfNG1MHG/SpKEtpPWKWqNxwgbCs=
X-Google-Smtp-Source: ABdhPJxeOTe0CndgUW7S0fbFhG3IrDYKtLiGY7Lz0FDQIxe9CkR4eCzOS+dJKYVlQ6FjP8pq+rywp6869vmU5B1awKQ=
X-Received: by 2002:ad4:4ae4:: with SMTP id cp4mr14267954qvb.21.1605144864584;
 Wed, 11 Nov 2020 17:34:24 -0800 (PST)
MIME-Version: 1.0
References: <20201111221503.2194455-1-peter@berginkonsult.se>
In-Reply-To: <20201111221503.2194455-1-peter@berginkonsult.se>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 11 Nov 2020 17:33:58 -0800
Message-ID: <CAMKF1sqLteW=fs+A5oQD+L9JT-CyFjV+KRq+dCxX9XxBuLiyVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] Make rt-tests buildable for all architectures
To: peter@berginkonsult.se
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2020 at 2:15 PM Peter Bergin <peter@berginkonsult.se> wrote:
>
> As rt-tests has added frc() to oslat and frc() function is not present
> on all architectures the rt-tests recipe was recently updated in commit
> 44010756b0ae91e0ac7715b7840285d59f991141 to avoid those.
> rt-tests repo has a commit that makes another workaround for the issue.
> With that commit the build always work but oslat fails in run-time if frc() is missing.
> This commit series will backport that patch from rt-tets and revert oe-core
> commit to allow builds for all architectures again.
>

this seems to improve the situation but its not clear if arches
without frc() will now fail miserably at runtime or will it only fail
a subset of tests and rt-tests will still be largely useful for such
arches. In the latter case, I am fine with this series.

> Peter Bergin (2):
>   rt-tests: backport patch that enable build for all archs
>   Revert "rt-tests: Enable only for x86/ppc64 architectures"
>
>  meta/recipes-rt/images/core-image-rt-sdk.bb   |  8 +--
>  ...-Allow-build-for-not-supported-archs.patch | 52 +++++++++++++++++++
>  meta/recipes-rt/rt-tests/rt-tests_1.9.bb      |  2 +-
>  3 files changed, 54 insertions(+), 8 deletions(-)
>  create mode 100644 meta/recipes-rt/rt-tests/files/0001-rt-tests-oslat-Allow-build-for-not-supported-archs.patch
>
> --
> 2.25.1
>
>
> 
>
