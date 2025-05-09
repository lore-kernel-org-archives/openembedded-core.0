Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC352C3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 09:56:55 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.10695.1746784610344028239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 02:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z1SNNRVC;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f549550d96so25467696d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 02:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746784609; x=1747389409; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cAkYDparSg4N8xGcPsxACavrR0nnN4vu1xLNI1ET5sM=;
        b=Z1SNNRVC2XfK36tX6y/wPP9YGjQGapN720ZA0k0l0pQjg7mJ+Ku7fCVElXItUzWZHv
         /WymiImv8XWh1jEJOIoIkkeaFNDOM0+9oCFRvLWA9r+yLS5YOMN/R34Gq3xI2JIIMeFl
         reDbVn9DQVRe5GWiu9EmS2PW/qzYHWe8ZIddNWBINaGpoh1wfokzIlr4aUD4qb/Nv3Pj
         mhYiVmZ93wMqLh2wkSCcdc7PGLSRMxdgNwmZCxRucMQQB4vbxK79DRrYHxR5cqyJbPCJ
         Nq/v4ZYz+vamj0bH/61ndtmMkKN4MvIvPnfApgDq7QwdTDSPO7ey+2s7mLm5mngWMc6R
         1LHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746784609; x=1747389409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAkYDparSg4N8xGcPsxACavrR0nnN4vu1xLNI1ET5sM=;
        b=BH8Y7PA6Xo6rrVAkbMJslmwhUCSuDowicREbwz7gll/Mmg6NS4gZP9Ua3uZ0C8htNo
         wb/L8OVTtJr4ELTI0jnuKUiTVpKM3zxOKOdNoDsCR6AtNLRCjDQujONBE176UvjdASuL
         cYT9hmUYoXhc1GcTeRjGdJAx0DncplOaeyVIlqfpCkuRh258lTO801mCvKQW8Pc+X8WL
         jqhn/Vcwi9h0hYEBI0pWZLQKcHhG4iqPpGNE12mH1Kc6J8aS3wZEKvkRidLfQHNRCBqW
         4bJN3393d64j+lUqKIumenMP/12YpAbz9+q93BfcpGQtHiTKmGbDQOJAXI+7UIxrtW/6
         6OVQ==
X-Gm-Message-State: AOJu0YziybtVYkAskrYr+ZneI/tXWYaUSZp3UgV2cKFfbgOVfctJthae
	t0NzCc7twxTOeSsXQkMluJzvhdf4RDr4/TV3CbEK2BK7tnwgHvBnEl5p6BKP0HAWbemuCSDnzI5
	PpH1JZrzZ4JpG+KDTsQ/yQFL2a3Q=
X-Gm-Gg: ASbGncsgbMJz550OgE3u8IQXPTokHC7r/OOuegEWSC0JnlBl8DNH2spbuqzqNenlO+F
	LCI7WLvYQQ0DVZvjLnDMpwm/uw0tNTKDyrsnzCwHbfWfacuUBIX4s4iezJPRi9ifpUCu8GSo332
	F/oGHi/R7i+ex8D896dh6CGr4=
X-Google-Smtp-Source: AGHT+IGc3ISwYBc+9TCu0OmtKhiX0AywgVJbhjU5VvO2FMlso9c2gSBKasSJfTPpLWj7JqcdYPX+H2dFzxp1yvGjlzw=
X-Received: by 2002:a05:6214:240b:b0:6e8:96aa:6034 with SMTP id
 6a1803df08f44-6f6e47979efmr41413076d6.3.1746784609285; Fri, 09 May 2025
 02:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250509093740.1367372-1-yi.zhao@windriver.com>
In-Reply-To: <20250509093740.1367372-1-yi.zhao@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 May 2025 11:56:37 +0200
X-Gm-Features: AX0GCFvP-nCuDYWxOxOj7mjHl947hn34ynX-T3NlH3ayvGo4fEn7T7JBiC3MQI0
Message-ID: <CANNYZj8+SvOzz7D0a_sEi81vhi3up699eYoJ1pgBsW0xMHuhog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: add fips support
To: yi.zhao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 09:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216191

On Fri, 9 May 2025 at 11:38, Yi Zhao via lists.openembedded.org
<yi.zhao=eng.windriver.com@lists.openembedded.org> wrote:
> * Add pkg_postinst_ontarget for openssl-ossl-module-fips to ensure the
>   config file fipsmodule.cnf is created on target.
> +       # Generate fipsmodule.cnf on first boot
> +       if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
> +               rm -f ${D}${libdir}/ssl-3/fipsmodule.cnf
> +       fi
> +pkg_postinst_ontarget:${PN}-ossl-module-fips () {
> +       if test -f ${libdir}/ossl-modules/fips.so; then
> +               ${bindir}/openssl fipsinstall -out ${libdir}/ssl-3/fipsmodule.cnf -module ${libdir}/ossl-modules/fips.so
> +       fi
> +}
> +

This needs to be better explained:

- why is the standard fipsmodule.cnf deleted in do_install? If
upstream installs it, then why can't we simply use it?

- why re-generation of that file has to happen on target? Can we use
native openssl instead? Or run target openssl with qemu usermode?

Alex

