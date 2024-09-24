Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEA6CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 04:48:01 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.6499.1727153273646192424
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 21:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CIUs6ynC;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-537a2a2c74fso1396265e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 21:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727153272; x=1727758072; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PUV+QEUf5l6pQBvG1LWI0yEiMviq8CF4ibtQR+yBfgk=;
        b=CIUs6ynCte+poW2dLpUrfRf/dHSowEo8/m4iU8giZHdwBdsNhia3azI9xEUYkc1dol
         iMZPjVpR/+Zu4NYj9wqL7bfTeaNmZ8kwC5VHKBaz7/hrpQZCDGoBiVZtGOBLeG2cNhkc
         HbSSYIWLKAVNamwlKBDrKHan9i51FYpk63Bn+bbOpHrNW178eStH9z6T1VRIbBZCQ3hV
         RjApqwIDw55P7rA0l5296zhp1KJ9lDoqIBMs/BEjAybfCfLCdv/pIf4qN6SiplGEGXQv
         6d8V6QLgxLWPjCAmACdRi5V46nFL0cTSIrKCncbAk3/J3c6I8Nwn1zQbP/aA91hjCCKz
         Ci7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727153272; x=1727758072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUV+QEUf5l6pQBvG1LWI0yEiMviq8CF4ibtQR+yBfgk=;
        b=oSn1vf/ivzmx4om9dF7JBNhvggEpsCXpKnicrmjarYqzlZ+wG9Qlg+t9EWOSmU6Cq3
         h8mjmlBgnl6C+pCozMTod7tfv5M4XPIog9WVrmn/36KlBmt1BVsckcth5iKkXXkwTB9r
         eRjvSTXd4pmDXi6F7QnwsqIWAbzSDdrMECumy9g+8qKZIaPbYFI+o47qnMTolMY+uLqq
         49ZjPB6UvGqcl6lX6Ymj3afib3VjwzCWDOmD9ZQMN/AjYMHyRwWOjMr4bl10kAwBYUJu
         mo07+MmIiVgkhreNoVYszw+jtc4erT43fyIExBbmwEq0gQjEAiEi/pMzQ4uG3yrwnFxj
         z0eg==
X-Gm-Message-State: AOJu0YxI5EFYfRyIEqGa47WTCEqTODdnhgEnV4mYtN/crmd94N+Gd322
	HDOqrA0ALVMaKTzjvythmAVxejDJXW7npmDRSsD/m5ns1J2f5ELiLaiunxlbDWWttFpULVz8e4x
	CHRlxWv5dCqM8140AXillzdT6T0g=
X-Google-Smtp-Source: AGHT+IHowIhvf3UZCAQ3MsEs2Ob0ar7yzVPpTNekMj3OlalM+oCA0+y61vrYDzsvtQdoeLmf088DNQEwC1nW56k2fQI=
X-Received: by 2002:a05:6512:224d:b0:533:32cf:6420 with SMTP id
 2adb3069b0e04-537a68eea58mr504342e87.8.1727153271088; Mon, 23 Sep 2024
 21:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1726821150.git.liezhi.yang@windriver.com>
 <CANNYZj9SyrR1TMWY3ehfbT+-rrDQqfKVSiN-thQQBoVwXK+uxQ@mail.gmail.com> <0738ba86-15be-4c53-a8a3-624c65eef18e@windriver.com>
In-Reply-To: <0738ba86-15be-4c53-a8a3-624c65eef18e@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Sep 2024 06:47:39 +0200
Message-ID: <CANNYZj-VTYcBgd8TDdwsE+Zww3LCH2tiAzOUUuU+9SkubczPUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] proposal: Append VENDOR_REVISION to PR for
 CVE scanners
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org, david.reyna@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 04:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204833

On Tue, 24 Sept 2024 at 06:24, Robert Yang <liezhi.yang@windriver.com> wrote:
> Thanks for looking into this, the problem is that the metadata (CVE patch info)
> is not in the binary packages such as RPMs, so the cve scanners such as Trivy
> doesn't know that. For example, CentOS and Ubuntu also has the similar issues,
> they use the vendor revisions such as 29.el6.centos and 0.4ubuntu3.3 to help
> Trivy know that the CVE is fixed in a lower version package.

But how is trivy's database updated to include such custom vendor
revisions? Is it done centrally by the vendor (and how?), or is it
done by users in local installations? This does appear hack-ish to me,
the better thing to do would be to actually include the list of fixed
CVEs into package metadata.

I'm not sure this should be carried in core, if there's only a single
known tool that needs it, and core has no support or tests for it.
Maybe something like meta-trivy?

Alex

