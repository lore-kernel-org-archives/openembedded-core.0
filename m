Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.11535.1599131551801138195
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 04:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M9dDgHBk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id w5so2756411wrp.8
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2020 04:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=byYu1T4aaGai1e43f7uhP0hjObIbr9vbumC44GV1Ge8=;
        b=M9dDgHBkfK4znYJ5REhp9hgW6ZVzL/rpEyZfEKp2Y+x4mb+JFtWYW522zPQ+ZzVHgE
         7E5Sb0/oRMALx6ndsoDQcLHlM2iC56863pXAhdD2VneTr05FffralJ2dFIffSeYd39Qv
         h+wlSHLzXjQZ07Nd61kgwrrh0DUX+0KE2z57o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=byYu1T4aaGai1e43f7uhP0hjObIbr9vbumC44GV1Ge8=;
        b=bpMVMY6JVcXof5lxa5xraDlTiNAgGDgC7Qo/lhEZZigQNreR0AbqXYQ6H3LbaXGjM9
         lL3wPtlkEcVcneaQ4MrLcuO/3B3eoBVMQqPGlstcpUIL8C4l+2BMUnUbPGO1qLehliVz
         uX3yxQ+a13BtcLfA+I1EoCHj2PlIGrYBkvMENnct/g16yJjBEZZr0eQjwoNsKVSGD0ab
         bOkL7107IB2+jzUrk4u2qRdMwEuYz4amHACblCMvOKmUg8cWWW8OfJd/Q730qPfGSddD
         1SpRub0yNDfsVQODIa0v12qbFSOJbj96lj2YjgH634ZdNawLkNWtuiPqjaA1ho6kIR3C
         Z5nw==
X-Gm-Message-State: AOAM5313e5bOC9pyUeqqsUbL0aFq1lrhN3LboL7/Ker5c3D/ehIBImzI
	YyWpjXrmZrsQB6/5XjM1+H4stg==
X-Google-Smtp-Source: ABdhPJzuCycD+y11zj8HQ8pzHb+knF1HnzME8aqgu+zZV2p9kDVdW2C7BAPvSY/3Hq0fYe+y0qo2Cw==
X-Received: by 2002:a5d:4bc6:: with SMTP id l6mr2042608wrt.132.1599131550066;
        Thu, 03 Sep 2020 04:12:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.f.d.f.5.0.6.0.0.2.6.1.6.b.c.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.f.d.f.5.0.6.0.0.2.6.1.6.b.c.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7cb6:1620:605:fdfd])
        by smtp.gmail.com with ESMTPSA id z203sm4017132wmc.31.2020.09.03.04.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 04:12:29 -0700 (PDT)
Message-ID: <029196ff18a0d039ea41d70db9497c0a8c0db1d0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python2: fix segmentation fault in ptest test_bigrepeat
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Heng Guo <heng.guo@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 03 Sep 2020 12:12:28 +0100
In-Reply-To: <20200903092448.26165-1-heng.guo@windriver.com>
References: <20200903092448.26165-1-heng.guo@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-09-03 at 17:24 +0800, Heng Guo wrote:
> Segmentation fault at case test_bigrepeat of python ptest. a similar
> bug
> can be found at https://bugs.python.org/issue33153.
> 
> tuplerepeat() in Objects/tupleobject.c uses a questionable check that
> relies on signed integer overflow. A singed integer overflow is
> triggered by ptest case: test_bigrepeat.
> 
> Python2 is out of maintainus, so backport the related patch from
> python3
> commit:
> https://github.com/python/cpython/commit/c04ddff290fc203d05b75c8569b748525fb76b5b
> 
> Signed-off-by: Heng Guo <heng.guo@windriver.com>
> ---
>  ...segmentation-fault-in-test_bigrepeat.patch | 33
> +++++++++++++++++++
>  meta/recipes-devtools/python/python_2.7.18.bb |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python/0001-python2-
> fix-segmentation-fault-in-test_bigrepeat.patch
> 
> diff --git a/meta/recipes-devtools/python/python/0001-python2-fix-
> segmentation-fault-in-test_bigrepeat.patch b/meta/recipes-
> devtools/python/python/0001-python2-fix-segmentation-fault-in-
> test_bigrepeat.patch
> new file mode 100644
> index 0000000000..45087bfb8d
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python/0001-python2-fix-
> segmentation-fault-in-test_bigrepeat.patch
> @@ -0,0 +1,33 @@
> +From 031d06e1e670d40b6500cce4134ab35ec8858a8b Mon Sep 17 00:00:00
> 2001
> +From: Heng Guo <heng.guo@windriver.com>
> +Date: Wed, 15 Jul 2020 15:42:13 +0800
> +Subject: [PATCH] python2: fix segmentation fault in test_bigrepeat
> +
> +Port from:
> +
> https://github.com/python/cpython/commit/c04ddff290fc203d05b75c8569b748525fb76b5b
> +Only merge codes related to tuplerepeat() in tupleobject.c.
> +
> +Signed-off-by: Heng Guo <heng.guo@windriver.com>

Missing Upstream-Status tag, also which branch is this against? The
recipe no longer exists in OE-Core.

Cheers,

Richard

