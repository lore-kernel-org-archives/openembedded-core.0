Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A51C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 13:10:12 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.6954.1655903407898560660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 06:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZJ/hEgNJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id s1so23331774wra.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 06:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:content-transfer-encoding
         :user-agent:mime-version;
        bh=TxkbmadzhY+kYpa3osuaaIMDsOi5cj6TxrC/uZO1230=;
        b=ZJ/hEgNJcjHVEHU6boc0AXjKnbxBptwAFkyQaPGWXt56qEi+mVHOod2V3Xv9yCc9/S
         kZBRctl+dXFkDyF6p4uL8DICbw+pFZu7zmgEbkDGUKUx2ElpVjgGOJTGdSX7MHGhXnkc
         64vOiKG+u9Xgv8sd0WshQ8dGyMYsPdG7r+aXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date
         :content-transfer-encoding:user-agent:mime-version;
        bh=TxkbmadzhY+kYpa3osuaaIMDsOi5cj6TxrC/uZO1230=;
        b=aHRfeF3cakjf8uQZ6tMrwwaMDIUoa+TgR4Gh0IZZ8v5eNAAEEcsmNNNzJqDKdPBrg6
         lReWt8q+8maOwdZ63jDPAoGFUp/kDEeFnwMUfAyEShOrAn7mz5pWPnCPxJAeW1GbfrbO
         ohUV6ABaOtWBAEdKaSAjI5ime1QWCWAvWd46xXGDlFvSYIH53vWcdfiEeg2X8hWxC0jA
         SVtydNVyQvmuZ4W/l7V4KLfPL6zJ+5so7r2Kmtb2L7ItWqxoampQQ8MC3uclE6uECqJU
         z4zMdVmyXBOjhOsERek+srNWwRav3qYspOhC4micrY28ArCRjLgO2NAEvu5dMlD6NXSe
         ydmQ==
X-Gm-Message-State: AJIora8ymK4zs3Y+rMi3Gus3c8D+P4xU5kYqDjLhK4ljhYTDER70v6mO
	sou1NSi4yPGKKiNZL7sT/rxSEGr1LbAvWQ==
X-Google-Smtp-Source: 
 AGRyM1tF460+aW75YsdZu3ONSQUh7wwYDjOwpvDQym116bo0Rg2J05BHk1mKh13QlcgDsEv3aomWCA==
X-Received: by 2002:a5d:504f:0:b0:21b:a39f:7e6f with SMTP id
 h15-20020a5d504f000000b0021ba39f7e6fmr802721wrt.129.1655903405950;
        Wed, 22 Jun 2022 06:10:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b8dc:82a2:aabd:2c47?
 ([2001:8b0:aba:5f3c:b8dc:82a2:aabd:2c47])
        by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c1c8600b0039c84c05d88sm28075686wms.23.2022.06.22.06.10.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 06:10:05 -0700 (PDT)
Message-ID: 
 <31700e81f90027d7359c688ac8b3d5bdf914a0f9.camel@linuxfoundation.org>
Subject: Easyish reproducibility issue for someone?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2022 14:10:04 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 13:10:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167234

There is a reproducibility issue which shouldn't be too hard to fix if
someone had a few minutes to help out:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14845

It is in llvm and is a cmake configuration issue. Rather than setting
that option based on the presence of python modules (with python from
the host), we should add a configuration option to force it to be
disabled in our case. Should be upstreamable with the right patch.

A cmake expert (in denial) mentioned option() is what we probably need
to use there.

Any takers?

Cheers,

Richard

