Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3941D2F7D4
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 12:10:14 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.47432.1729167004951852982
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 05:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cQo50sUm;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.172, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e2915f00c12so820500276.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 05:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729167004; x=1729771804; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asX05fkQC6+Vh6a1R6P+o0dzMWx54yZDYDnNOmja5Kg=;
        b=cQo50sUmn685tMiBL+8QUPNmKHlJq8HnBf3vg5GFimwGiQu7FXpkAiuxaUijgMnlDM
         zlLlT42aWJALEDRg9+KrcuPmzgy19aEgngZF2xsIQp6vjR4bRxbZJTMFEGR7rQgGoFPI
         V5LDWugnQWcnRjApvg7GS7yvjVJzP4dOr4NCti56hwgwlpdeFPdSl29rnFRJsrmK36mc
         EckQ8szBY25lrG1paKNi1y/UlrLQuzLfp+QrXu13NNh2VYSA26djAjsYNgGSKHuTO1i8
         62S9x9+TNvDgUR5UvBl09yXEVgk+tsuJT9NzgCTR2suqJzMhsQt3cjxuWy6CHS5twlWN
         CFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729167004; x=1729771804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asX05fkQC6+Vh6a1R6P+o0dzMWx54yZDYDnNOmja5Kg=;
        b=okKHOJ6uQ2ATTUwRXBoLcWE4hI9xVO9CHPdE4U/OlePljdvLzXGPKBJIfLufw+rIhA
         9A4ufAi8O0U8po6p00YxWd1RY+2O5DvHSntA9qwBtJUjxqTvjwuUfT+Vd6wXMCzrE7EU
         QjDUpmR37OisFm+i9lZ04KmiEMZLkxK7zj4GXFebHGgnUAXriPRMWl9EahaGNQ7LkiJH
         6iwL0/FN1LJcdNGyX5QnwWCxDX3/EtZmoxJgCuUQ1J3S09wO0chaBQOcHwMLt9uirB9S
         1tSJh44TANQhvwNR4Wz/nYZhn3Wa3C1rkAkrr4P39jL/8aCEoKi6+R/d3gpSMrMTQ4LT
         /vaQ==
X-Gm-Message-State: AOJu0YwaNYXHATAuktf92TGcTb5R9EQ3JTpgWjrQR6nFIrDNOG9giCbm
	pzxitTBEXCUR2XsiC1tr9puS++GcjJGXGlCaPUMs1tveNqfERAXYWOvpI5kOg96YqDFVe9v0yWS
	RMswWOuRo8S6L9ThkBEgeS2fgIVKYutvg8WPdWA==
X-Google-Smtp-Source: AGHT+IEMPR5TQ/82K48nMA5bNyytJJSXtGAF/5If9B5QlrVQXKUiFMa2vbSJi0A6GSgQ5s/OjrAzfbeYKFEJsYLJNLg=
X-Received: by 2002:a05:6902:2213:b0:e26:5b7:9f95 with SMTP id
 3f1490d57ef6-e297856f61amr6340193276.35.1729167003926; Thu, 17 Oct 2024
 05:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1728585736.git.steve@sakoman.com> <c4760d6a52011515b0f931d08f619c7e49e72158.1728585736.git.steve@sakoman.com>
 <CANNYZj9mNKK-6isfa_-kgnGw0i22kr=mLK=Lz0CxXkn=M8NzAQ@mail.gmail.com>
In-Reply-To: <CANNYZj9mNKK-6isfa_-kgnGw0i22kr=mLK=Lz0CxXkn=M8NzAQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 17 Oct 2024 05:09:53 -0700
Message-ID: <CAOSpxdau-oUBSfVcDHm=E0FqatCZCjxzWYpGWzYj3gRsp8EiyA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 2/2] selftest/runtime_test/virgl: Disable for
 all fedora
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 12:10:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206015

On Thu, Oct 17, 2024 at 2:05=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 10 Oct 2024 at 20:44, Steve Sakoman via lists.openembedded.org
> <steve=3Dsakoman.com@lists.openembedded.org> wrote:
>
> > We can't support vgem on RHEL derived distros so disable this test for
> > all fedora hosts rather than specific versions.
> >          render_hint =3D """If /dev/dri/renderD* is absent due to lack =
of suitable GPU, 'modprobe vgem' will create one suitable for mesa llvmpipe=
 software renderer."""
>
> I don't think this is accurate. It's the other way around: RHEL is
> derived from Fedora. Also, vgem module can be installed in Fedora, but
> not on RHEL or rocky/alma (which are derived from RHEL). We do this on
> all fedora build hosts, and virgl tests run fine on Fedora workers
> then, at least on the master branch.
>
> What prompted this patch specifically?

When we moved to the new autobuilder cluster the kirkstone supported
versions of fedora were no longer available, only fedora 39/40.

The kirkstone virgl headless tests failed 100% of the time with the
new fedora 39/40 workers.  I discussed this with Richard on irc and he
recommended that we disable the test for kirkstone on those workers.

Steve

