Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.7516.1621339518929155969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 05:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=z3cN0PBf;
 spf=pass (domain: burtonini.com, ip: 209.85.221.50, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f50.google.com with SMTP id v12so9936750wrq.6
        for <openembedded-core@lists.openembedded.org>; Tue, 18 May 2021 05:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AcD9fI61aXZFAD0WK/F8iwf3GbVx427lxhxiG1oV9a8=;
        b=z3cN0PBf0dM1zx1UZkA7s76ociAlKhGzOBdPlq0Wq6Be431GHkSLFJpW1hogK3ROp8
         TyRGR711gvtzNrm62ep1Dvox6Yg+RIuNc0X003CnsekLFwP1w4LoG/oIa6iOeofSP4KW
         YNOJHYvDX8O2XrsYzEk1+3aiRIjmjRI20yGRoNCAUk6Nz8Bv9NUGfmI3htXRY7jeqK+U
         pas76gDcXQNzMg2tkFuaq+tq/qKEOyOgorLbl15/0qaOuk37IR79kNVVerthFSNSXRL+
         cVxmSly0RVW1uStM5O712SePw0twD3IMrWenmADMCE2sQM/nQ/O8TKk0kjnjKY/zJDbn
         rW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AcD9fI61aXZFAD0WK/F8iwf3GbVx427lxhxiG1oV9a8=;
        b=oEJhavanEXGpDCrAxeuibKrvz81FfjIypWU7hdrJhu/D2rgeyL5UPO27Lgku0PCbuC
         jl1Ec6pKlrg6uMHAEImhAAk9HNTpBUyJFxpxrS7MHO9UMqCiqOrv5mW7kpN7zyuecBjP
         9Y37ynBW/n3FuPG90PY6cQPIdHA+XBeU+cIFBm4CEIytndw4lXMT503R1a3EqfIoOYIr
         qhGxmOHK9r8q07UNN7giq79G9CZ7ukGwQp4DVErcE9uGiKDwugIO74MvN+IR+47lOBwi
         kKIA0W/SBcerRazTxhL/SNzAuwKIhA/cePAa3ni+4CupjLb7V4Zl6H4FRtQ+6tlgdoV3
         3wtg==
X-Gm-Message-State: AOAM530zi/QeqVP1nC1WFb053zl+S0Jz7SjtgcJtQwgrYwQaTVevsaFO
	w4TZuSJoQPS0KFPFwRt0ENieQ1YPTt3rWOxzj5AWnw==
X-Google-Smtp-Source: ABdhPJyAGmgmwcdg3T02koGksTitGpDMU2c6XZhy3RKe6GsHaxzCigv6EkgykK+YdIqXVL3aX0w/yw5LFn7yO2Q/+uI=
X-Received: by 2002:a5d:4e91:: with SMTP id e17mr6755841wru.396.1621339517307;
 Tue, 18 May 2021 05:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <15ece592-a5f2-5ca7-db9c-2fd614ea6eea@crashcourse.ca>
In-Reply-To: <15ece592-a5f2-5ca7-db9c-2fd614ea6eea@crashcourse.ca>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 18 May 2021 13:05:06 +0100
Message-ID: <CAAnfSTucAG+zihuVvnMYxb-xqQfOg1wscFzkvVNNPygCf5Y3Kw@mail.gmail.com>
Subject: Re: [OE-core] is there an easy to prevent *creation* of some recipe's packages?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 May 2021 at 12:17, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   pretty sure i know the answer to this one, but was asked the other
> day and wanted to make sure. in order to speed up the normal OE build,
> someone suggested bypassing the creation of packages that weren't
> going to be relevant, such as -dev, -doc and so on -- the idea was
> that that could make a significant difference in build time.

General case: no. Absolute waste of time.

There are common exceptions: if the recipe has e.g. API documentation
that takes a long time to build then add a PACKAGECONFIG for it and
respect the api-documentation DISTRO_FEATURE.

There are limited edge cases of course: Piglit is 99% auto-generated
test cases, the binaries are *huge* and the need to debug them is
limited, so the recipe installs striped binaries so there is no -dbg
package to generate.  We're talking minutes of time spent stripping
gigabytes of libraries here and there's no hackery or magic, the
recipe just tells the makefile to strip on install.

Ross
