Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19942C636D4
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 10:37:23 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.3828.1676630234457294891
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Feb 2023 02:37:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hfzkxUcZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id p5so613931wmg.4
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 02:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fVn9v74GiODx9o3Ow6ijzdQpU+uNJaAJlaHkg41qjns=;
        b=hfzkxUcZWIVyl+vDNzOSs8ewBy6uWndUAyCH2rBPlpU5hQsHqGRdHOBQPAgc5bWQTe
         shfgIOH1UEMwhZjcOxfeRL46ZY3wJgGm8hESCCM68vsf55mfGqRINeapH+FE7c48Zpw5
         Y2OUEC2CZNdParxe0T6TcwDGHWkjyWAYmWJ7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fVn9v74GiODx9o3Ow6ijzdQpU+uNJaAJlaHkg41qjns=;
        b=0TBvMW+TNqga6ULh+V6lEklqZqF5T2+Z2LfE6TcNFrSBGvSEHAG7eiJXe3yZAusWv4
         44eUZpbR6gYGlFk+rky08zx5VRjARtAtVhsotoe74OPtULNL8cpGygNjMEh6Wmcu4IMH
         5QWx4prtj4zm/aDIu/52EwtCu2oC3uJOHO1FwaHwlI9vxf9/KHZb0WQFxiYPObeIUwCh
         C72M9E5ut1PkIsrDp44TADzt7vru0cnQR8XJLG/DkILplrXCo2Y27GrMUpzu4UfwkdNg
         R4nBw/8F02xMJC86fljVw2Mo1LtIdfkGLM2fkpgDXT9XSKWY1dUnS0u/vt5yFtugNVJW
         mSSg==
X-Gm-Message-State: AO0yUKWAjJ/XsKo2z0hUTHj+p65tKyEqKgTrUBiHu6X34JUIcD+Nx+xs
	dXTDzjbr/7rPNIsK3oq9N2vFIA==
X-Google-Smtp-Source: AK7set+/e0rxuAIlh2+2yX4ai4OIzImkidhXkyhwWPtRWXtsX3lsMzjl3r722iC199+05+97NSCxaA==
X-Received: by 2002:a05:600c:4aaa:b0:3e2:59d:432c with SMTP id b42-20020a05600c4aaa00b003e2059d432cmr128571wmp.17.1676630232591;
        Fri, 17 Feb 2023 02:37:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:33b5:dd6c:d0ba:e1ab? ([2001:8b0:aba:5f3c:33b5:dd6c:d0ba:e1ab])
        by smtp.gmail.com with ESMTPSA id y11-20020a05600c364b00b003dc0cb5e3f1sm4157736wmq.46.2023.02.17.02.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 02:37:12 -0800 (PST)
Message-ID: <4dd6abd612950cacc03c1aa414d3d74cce14ac69.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH 3/3] patchreview: use
 check_upstream_status() from oe.qa
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com
Date: Fri, 17 Feb 2023 10:37:11 +0000
In-Reply-To: <20230215172041.636292-3-Martin.Jansa@gmail.com>
References: <20230215172041.636292-1-Martin.Jansa@gmail.com>
	 <20230215172041.636292-3-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 10:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177307

On Wed, 2023-02-15 at 18:20 +0100, Martin Jansa wrote:
> * the idea was to reuse the same function as I've noticed that the
>   QA check which was added to insane.bbclass in:
>   https://git.openembedded.org/openembedded-core/commit/?id=3D76a685bfcf9=
27593eac67157762a53259089ea8a
>   is in some cases more strcit than scripts/contrib/patchreview.py
>=20
>   To be honest I wasn't aware of scripts/contrib/patchreview.py
>   existence when I've asked about moving check_upstream_status()
>   to oe.qa in order to write standalone script just like
>   patchreview.py, now I don't feel strongly about sharing this
>   functionality (other than adjusting regexes in patchreview.py)
>=20
> * it finds one "new" issue in oe-core:
>   Malformed Upstream-Status 'Malformed Upstream-Status in patch
>   meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-de=
cide-if-a-test-is-bui.patch
>   Please correct according to https://www.openembedded.org/wiki/Commit_Pa=
tch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status :
>   Upstream-Status: Inappropriate[oe specific]' (meta/recipes-support/libs=
sh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch)
>=20
> * but unlike the QA check patchreview.py will report this:
>   -Upstream-Status: Submitted [https://github.com/madler/zlib/pull/599]
>   +Upstream-Broken-Status: Submitted [https://github.com/madler/zlib/pull=
/599]
>=20
>   as a missing Upstream-Status instead of malformed as reported by QA che=
ck:
>=20
>   ERROR: zlib-native-1.2.13-r0 do_patch: QA Issue: Malformed Upstream-Sta=
tus in patch
>   /OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib/0001-co=
nfigure-Pass-LDFLAGS-to-link-tests.patch
>   Please correct according to https://www.openembedded.org/wiki/Commit_Pa=
tch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status :
>   Upstream-Broken-Status: Submitted [https://github.com/madler/zlib/pull/=
599] [patch-status-core]
>=20
> * RFC: let me know if you think it's worth re-working this to better
>   integrate (e.g. detecting Upstream-Broken-Status and not repeating
>   .patch path in patchreview.py output) or if I should just adjust
>   regexes in patchreview.py.

FWIW I quite like the idea of detecting malformed entries and it would
be nice if both pieces of code behaved the same way...

Cheers,

Richard


