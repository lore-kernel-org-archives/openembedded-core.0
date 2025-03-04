Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0130C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 18:10:06 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.28947.1741111804072672799
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 10:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RcaffUX4;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6dd15d03eacso729176d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 10:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741111803; x=1741716603; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LjEgtV+Mytgpq71GYbwvc/U7NG9+FZkApChpkpcnhJU=;
        b=RcaffUX4U0o5QDyi+XTKi3KzMWlDjQOFAtFbdkmVdVp0pP2tj7/fKcuToBTsj6/T13
         8l8vhnG4S4S4Tbcbm4Xb0I9nimzCxC5D7V2iZ37kg9LOeML4XM42tUk9Purb2bp6Ragw
         UvLrD/+1WoGqZR4bnXy9W8vyYtb81VwmkUMXrvDWMi+xxJfKFyJ+wWd4/xQ6Q/c7XSwo
         BbRBc08O6Jum3exSgXk1QGSa4q9xUqGjoHkDQX1ICS2OjGrV4wK7PWmE48mn9q4ffbH8
         uK4i8dEr8GysY1VukOc0/xXEPo2zMZXEjTnRUFyYyzGXCS4Z5peI9iMG+X4b3HRzUSjn
         WO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741111803; x=1741716603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjEgtV+Mytgpq71GYbwvc/U7NG9+FZkApChpkpcnhJU=;
        b=wmUXhxUDfS04hkIAWuZD2oFI4lRzkg/0YGXBtsjHVkoQ831HM7UGn/mNH62u21kItN
         +bqhgxeNktngaYW+vDx+OWLkSQtbrlNH97e9cJ8KNE3gqvePoOEOav2V+jPo+Js9YM70
         ed0NSEY+Pt8CLgRm8Ic5VYpgcIKB74zsvt5JeCdX93vuyMEGI/bJmDOcirfECezFYK7J
         fQvjW3VMBKldrMbSC4hq0K3EyXfO4dBzYCEKgY1TIopF3cWAcx6Wyn0lbUrDfFh3Yzwp
         CNe8oc6EzZugDWo3zu8l+/jEyHV5+qUhfcr0HHGdjP+tUV5Nx3+o3kBJbLvhmx9zKhFr
         ceuw==
X-Gm-Message-State: AOJu0YxV/injQ6q8M41JjFB9+AWSjbTholp+VnGihmeEP5eAUn0mJCIM
	58Ob8MDRMnLvueP/DjpIl7MxmEjKUgYpq1Q5CGcxLSXVcTUJe/QSZ9EPIWjoC5+xZYHhVhfF8yb
	SppOJr7wGDt3xf0Ns2ovO42DxFrJ+lw9N
X-Gm-Gg: ASbGncvx89JeqOR+QLYxZ19BTQBg4Be4IzDpl+QipQG5SR8ur4Qh9TcTJlcNA3HqPY8
	q8IGnRAQFB4oEvNVud6iG9M1lMunkb4j4q5Ysb0DbaRu6OTdHzelfG95F6I/6eyYJAOTzPeH+Px
	HEuKdNR5LNAnwEKinu2y1bRvv524hnXoYHX47hdU8DmuwtOTO8vZMu7k373/jz
X-Google-Smtp-Source: AGHT+IEIVhhqbO5fAKz/wnAJTW5u2IfowAWb3KqCPpeXKBvI6TFDVJrRIJjmVXUHBUbjf4/qhQAsbJHnEwlmkYNeuOM=
X-Received: by 2002:a05:6214:248f:b0:6e4:2198:12fe with SMTP id
 6a1803df08f44-6e8e6f7bfe7mr1576306d6.18.1741111803013; Tue, 04 Mar 2025
 10:10:03 -0800 (PST)
MIME-Version: 1.0
References: <20250302043802.3279519-1-hongxu.jia@windriver.com>
In-Reply-To: <20250302043802.3279519-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Mar 2025 19:09:51 +0100
X-Gm-Features: AQ5f1JrTK95tXmq_NXszodRGnSZcrUC84T6MRDt603psqGIokfQ-uAamjLCQiuw
Message-ID: <CANNYZj_ALBg=8wdXXiGwG1XM05z-oS2Su0FCeg318KKXFPTE3w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake-native: support RUNTIME_DEPENDENCIES for
 OE cross compiling
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 18:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212289

On Sun, 2 Mar 2025 at 05:38, hongxu via lists.openembedded.org
<hongxu.jia=eng.windriver.com@lists.openembedded.org> wrote:
> +Subject: [PATCH] support RUNTIME_DEPENDENCIES for oe cross compiling
> +
> +According to upstream cmake doc[1]:
> +...
> +``RUNTIME_DEPENDENCIES``
> +  .. versionadded:: 3.21
> +
> +  This option causes all runtime dependencies of installed executable, shared
> +  library, and module targets to be installed along with the targets
> +  themselves. The ``RUNTIME``, ``LIBRARY``, ``FRAMEWORK``, and generic
> +  arguments are used to determine the properties (``DESTINATION``,
> +  ``COMPONENT``, etc.) of the installation of these dependencies.
> +...
> +
> +But it does not support cross compiling, this commit adds environment
> +OECMAKE_FORCE_CROSSCOMPILING to force support RUNTIME_DEPENDENCIES for
> +OE cross compiling
> +
> +[1] https://gitlab.kitware.com/cmake/cmake/-/commit/72f2448e82d8b3e90fa733cb6c631298083ae06b
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + Source/cmInstallCommand.cxx | 7 +++++--

I'm not sure. This doesn't seem to be common, can we rather just patch
specific components instead, and not alter cmake behaviour?

At the very least, a patch like this needs an upstream ticket
describing the problem to upstream.

Alex

