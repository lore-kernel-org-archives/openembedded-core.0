Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5818C6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 06:18:51 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.36569.1679465921173193819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 23:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iM9ilG9k;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id z42so17774544ljq.13
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 23:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679465919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pwK0jc6SLXNlWGvsRtpZyRK5Eay4DjbXxOa+Z8QU9VE=;
        b=iM9ilG9k8fzJcgmZdgAQCK3/Om1AfOXgj3HB0xNiwis4a46tCqhrihfSo+ld0gwTUL
         DwIwKyaR5LDhOg8G1X8fGuU71wx/Ujn9our74iYQsFOUHGeOkPpsOHXJ9rV00iQm0anQ
         /yZFsmAT2JGStUsyqU7tWg+HcjAZtOBhMMe/KZg7QKIyl1OBFRwa6FwoAMdAufsFguze
         RQX8p7wirUBPaBdcF9nccWDPUKJ/X6XwH5CRBIcmtdOW7J2fmq9z0YlrHOHuX4YqAQjS
         o3nTaUD5BhGPPn/rVpcqm9IbYKgaKbFs1h9aF7iNWUf9+M87rRjc+wFm+yRp1DInDBs1
         GWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679465919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwK0jc6SLXNlWGvsRtpZyRK5Eay4DjbXxOa+Z8QU9VE=;
        b=Q1Aciebk1SVsHCcELQORLqK2RXSnNx8LpgokouquadpoYZOuvpkFmFy+ZpPbabWUqJ
         nTURPb5T2UVnJkO6yxxRxipzbqdtZbJ1qfomNEQTdNFU6Wjrgqqb6z49Nmncy85Xj/h0
         xJQt05ef6IaNNADEuuVWJzkVgM8ZYrRrR7s/0aJ4ws7HbdZ60KzjHiQDymtHCf12gDEy
         iawvfi+Oc/n2eufQ5d11n6ckDlMhWtnvGGl+bOIB2+Us9eEs489+jKclBDjqOw6NzU3Q
         /oTfT3s3edWmkRamoHI/Qd2U3137UhT94i+9itNqlDxbSC9DC3XzM8b4NymIla3IDKO0
         qTOw==
X-Gm-Message-State: AO0yUKWteYnmA/kqMs+iI0gmgooPuiGvlxKT4vAMYD/XzTxZzNgkrnJk
	3CzdzD8wdDE7B1VGuFBBrIf8nrkjh3B89tftwYc=
X-Google-Smtp-Source: AK7set+0uqlMZapMq1W+i6peFa7aoe7Bl7DY0jE3o+jyIFn0w/4ACAD2yALISXQZY/buSsCjmV7yL7TftdG9tsNovO8=
X-Received: by 2002:a2e:7405:0:b0:298:b3c7:293d with SMTP id
 p5-20020a2e7405000000b00298b3c7293dmr1675322ljc.7.1679465919020; Tue, 21 Mar
 2023 23:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <1679451626-10625-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1679451626-10625-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Mar 2023 07:18:27 +0100
Message-ID: <CANNYZj-owD5bU9BSZmWPz2jDbddFBZXcuFvR5MzAR8MuzaP_QA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3] xcb-proto: Fix install conflict when enable multilib.
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 06:18:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178915

On Wed, 22 Mar 2023 at 03:20, wangmy <wangmy@fujitsu.com> wrote:
> +Subject: [PATCH] Fix install conflict when enable multilib.
> +
> +Upstream-Status: Pending

Please send this upstream first:
https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/merge_requests

There should also be a better commit message, something like "install
.pc file to $libdir, as it refers to it.

This is needed in particular for systems with multiple sets of
libraries (i.e. 32/64 bit).
"

Alex

