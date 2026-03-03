Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF89EC142C
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:58:48 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15673.1772535522856570861
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SWUBA2Uq;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-899e43ae2e1so23844726d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 02:58:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772535522; cv=none;
        d=google.com; s=arc-20240605;
        b=ASFfdKCYgY/Nt8UC4gPjTydO/faXUbpSjE9o+j/i2F67bAZZmVY0aSELctJ2uCENlP
         +Us1LIm42J9OnOgdAnZZz3poCeP22oNeZoFXoBjHvlw+BriHzws/2meTSEm2+Beg6S8a
         CqExEyptCGNZ/O89CoaRrNV+W03BkRvjq7PyqFstcYsiJzx/zztcWq2RTTn4K5y9Ex7i
         5RJ3Du7MJlHAFYdvP34CvT54tzNcHBjnxoqdrL8gPXJOTIcD6/9Qfx2j3Aws6PMiu9+L
         Fxfy11wGt1t0sBL18scBwL4LUtscmj8W/reSbX2rvSC+S3r85XodIHmS/puXgUXGLX5N
         euMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pmBhegUbewkkqtXthLTXXV1Bi/3zK4I20JXE7nUt1rM=;
        fh=QG0/1kl/iNDCWfShgAIKRpbEE7JIBRGbrVXnRZODZk4=;
        b=BrElsLt/Suq/Zph2xblnXoUe5HC0G3TY9MEOQEoQFoHLXHorHtjrni1Eb/2hWV2MQd
         cxoz6+D95b2Fe95J0qIiJwSLovGFdMPTX7KtymALGixM2TCJlwr3V0j32x7nllp32axs
         QdXbpMSg7S9M0EBsdG70FtEY+woiPXgBBVQSz0kCy6RY4lYYex7ALKLbYmogGCCNAzAA
         1bzsN8dETof28+HaEcR74APrsl7h94jimMZvzAgKprTj0JlZWFtr4Cm+CvUQaHziddet
         CXxrdE6ec9kdKw/tWv+8zXjx4TVBNFb1p6cmn3hjROCx2mahNWBy4tG3gosJFSm+qyDT
         FyAA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772535522; x=1773140322; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pmBhegUbewkkqtXthLTXXV1Bi/3zK4I20JXE7nUt1rM=;
        b=SWUBA2UqkojTU7GuxN4TWJMJKhBlDxiyW8Uws1o1Zz1OPBY/5PKVpoo4eToFY8UC4f
         mu1+eYQpVgrcSoKLWvOLE5qCgW5GWBQL0Z7vyI4bjloTvdPKO2WmAjcPfsIHP4r47rIS
         4+kH4FY6W71CYYlXgyOLBHIfSgPOcbToq+FP4HHRc3ohEo+55f0jvKI5olUkgQAvggxo
         91FiWcL2mzq+3JzH0NOt+iCVDzElAkvgh6MwydXBBe4ol2S5x3jVEpokZRt+MXDtg5qJ
         FIC7aT7NL1EMOvASL4EKX2bxf6T08GMLU7TAV+ffyte/CTx04coyRoffd3ueeUPYuNuQ
         6yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772535522; x=1773140322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmBhegUbewkkqtXthLTXXV1Bi/3zK4I20JXE7nUt1rM=;
        b=Osn6HJm3oCpgTDE0VLh2PKspFIb+wU8CAnHbW7LBeMdv3qVaX09xnM7u4Ifbqvpk+E
         rC9bFLpBBM+SOcKPgbWJieIhy6CmywrWhYSHoeymt25HLrAzC42pzrco6o2m7FryMBlU
         QqrWz7cuZSNUl1qwIukOJp2A+048KTpEP3DFKGywre71FJLPv35ybaGML2H1w3IP/2q/
         P0towAKymmG48He7R7TYOMr8lRY+MwXxZoyC1rVhkcwtWJcIBfQN6dDDn66hZVti6nTN
         FeEtDO2+GcNQ4C1v4xF2H8GeDwoSOYwrclSLQOP/k/RGfSMy8kGd6BDfAj9qy07ieq+O
         sUJg==
X-Gm-Message-State: AOJu0YxxpYUPRSb+nP3rbLIt+XU/sXEIr1v3i+vXkiFHVCaDpRqdkdgj
	cKgfCu/EXzt4kHlQSmMIHcHL8tarQO7QZlGOFrVHioXbivMi4+UvRSNDjRQ84Su9UES8nEgHstE
	5vTJQ4xixb6J9ECUKBCV6rwdZ1MoEcpI=
X-Gm-Gg: ATEYQzwAreNKpilngIi4zU0BWYPerk7hcNKtdZMnpXvNbUj+YvAFB4vGwDO1F1YZgU5
	yyUmAr5uSng5XlQHctk3JH6uGCshz/u2/tZEAKCdb1G76S1XfluzwgMICx2QvmtfGFcHJ1rDqhd
	4XYk8LU+eiw9cK4ZPyK6PKQcKNOy2sIqOmTkC3Ej5s1gEvqpYxzeOaemAOn8P847a46sqRjvUr2
	ralDLECgTRSqEgi1rjL798TJOo9LrIzxzK4cZ2nFg6C49gjVrsw092h1mNYyH7OfMvYWQOHdd7l
	nfhpnayUL2Hk2DVZhoU55+zQVgklPWkSFnCt+IKoCg==
X-Received: by 2002:a05:6214:e84:b0:899:f997:747 with SMTP id
 6a1803df08f44-899f9970d41mr101910976d6.49.1772535521752; Tue, 03 Mar 2026
 02:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20260225094537.1213-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260225094537.1213-1-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 3 Mar 2026 11:58:29 +0100
X-Gm-Features: AaiRm52FdwCsbsLHQcm5Icc--HenGREnFRdAWjT9BydXT2CvWTaaPodBTz8EEpk
Message-ID: <CANNYZj9=jfp-sfg8tGJhYX+WxvJ18pfrfZDPqwzyj+LVpB_dOg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] gstreamer1.0-vaapi: Enable hotdoc to produce doc
To: liuyd.fnst@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232305

On Wed, 25 Feb 2026 at 10:45, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=fujitsu.com@lists.openembedded.org>
wrote:
> +Subject: [PATCH] Disable cross_build check to make doc work in yocto.
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +---
> + docs/meson.build | 9 ---------
> + 1 file changed, 9 deletions(-)
> +
> +diff --git a/docs/meson.build b/docs/meson.build
> +index ad5f785..1e7a808 100644
> +--- a/docs/meson.build
> ++++ b/docs/meson.build
> +@@ -4,15 +4,6 @@ if get_option('doc').disabled()
> +   subdir_done()
> + endif
> +
> +-if meson.is_cross_build()
> +-    if get_option('doc').enabled()
> +-        error('Documentation enabled but building the doc while cross building is not supported yet.')
> +-    endif
> +-
> +-    message('Documentation not built as building it while cross building is not supported yet.')
> +-    subdir_done()
> +-endif
> +-

I think this is suitable for upstream submission, Yocto is a cross
build environment and building docs does work.

> +do_install:append:class-target () {
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'hotdoc', 'true', 'false', d)}; then
> +        export LLVM_CONFIG=${STAGING_BINDIR_NATIVE}/llvm-config
> +        meson compile docs/vaapi-doc
> +        install -d ${D}${docdir}/${PN}
> +        cp -r ${B}/docs/vaapi-doc/html ${D}${docdir}/${PN}
> +    fi

Shouldn't these steps happen automatically by just enabling the hotdoc
option and building the component?

Alex

