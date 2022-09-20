Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9BDC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 22:17:37 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.3455.1663712255271891917
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 15:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vb9FpatV;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 o99-20020a17090a0a6c00b002039c4fce53so6803326pjo.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 15:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yXyL/wEobQqb2yMxwxW2X2G3sZKFS1HgAmz88YuSs6E=;
        b=Vb9FpatV+S47vsdtf5cbvaWBhQvMQ/LPMLGGfCEmGETsDzm6yQDW1qh57u1xWZf6Is
         DthOJCekIoxXobchjiMi0Eh9Ecja6OOBpzF8WJpHsBhu+Hr8Tt0bDGUO/cmsPhsnIN0u
         m9KR9vcSrJ3C+i6ze90auaLUQiQqB8G4TBl/oFes7Kd56S86DNXY37maIAfnUZk279S0
         a5DONsCM/QW73ENvP9oIBZZ1pwANWl3t34RX62609+RItC/t9rU7K7ivFEDkIc2p7Jc/
         IFHFE6PbevTEBlw/onRfseLCyDiTAixFi//+BkrPwIdYNFqahEy24xgaEFmy+lYUWMk9
         5LRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yXyL/wEobQqb2yMxwxW2X2G3sZKFS1HgAmz88YuSs6E=;
        b=6feiO732ZRHMzUjLjn1Ecuz7wbnNzJSRhzB9fJ9EcobwlnbLcVFusVdi8UmsePDmUm
         zydMKu6XODPQHXezi/5kf+VelQDRGtoEEzBda5oF3VIeE62p+HPRj6z3oeVBru8v7q7T
         AEiO1Gx2f7/jOWBkwOxOjpVgMsaN+biB+sPHx12aDAOWgI7NCtxxf+ibpDWI1S0Fg16M
         tZmgs11RBAf+V4/ojhvTP0hY18i3Hb7T5JRVV/iMgCnuUHX2iFP+U1tWafMix5KEjzyI
         q4Y0hdmooaM6BfTZGEJpH1MDAHVlyDBRvUCbEr7o0gI7Lh2ChTA0SelhrKPiKGFOWDC4
         1IMg==
X-Gm-Message-State: ACrzQf3+uUDMXbH+FESNgxPH7K4lPKth/oJYyVMj7zRzlOR6DVEqu00J
	/oCzNaOWSrWw/Ep5b32E5Q/dz+08Wa7/yAnHNvE=
X-Google-Smtp-Source: 
 AMsMyM5BBqn3YMew7RELtcKiWuiNdS1XSp4tZXL6CedPKBXfCbM1F+vKnfDIs+4+xcwbYYjabCled7kDNV43HthvQN8=
X-Received: by 2002:a17:902:ab15:b0:178:cdb:b98c with SMTP id
 ik21-20020a170902ab1500b001780cdbb98cmr1711350plb.57.1663712254464; Tue, 20
 Sep 2022 15:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220920221250.1544461-1-richard.purdie@linuxfoundation.org>
 <20220920221250.1544461-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220920221250.1544461-2-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 20 Sep 2022 18:17:23 -0400
Message-ID: 
 <CADkTA4ODEABmSL=FAdgVmtOHTe34USdPFiVKVMbvJcRGa4OdHw@mail.gmail.com>
Subject: Re: [PATCH 2/2] perf: Fix for recent kernel upgrades
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 22:17:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170914

On Tue, Sep 20, 2022 at 6:12 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> With recent kernel changes in stable, the full path to python was being
> encoded into binaries and python install files. Add some workarounds
> for both issues to fix build reproducibility issues.

Ack'd.

Looks good to me. I was looking into this, but had only barely figured
out what was being encoded .. much less fix.

Bruce

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-kernel/perf/perf.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 9f7c300a40e..31bc04635d8 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -145,6 +145,9 @@ do_install() {
>         # we are checking for this make target to be compatible with older perf versions
>         if ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'true', 'false', d)} && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
>             oe_runmake DESTDIR=${D} install-python_ext
> +           if [ -e ${D}${libdir}/python*/site-packages/perf-*/SOURCES.txt ]; then
> +               sed -i -e 's#${WORKDIR}##g' ${D}${libdir}/python*/site-packages/perf-*/SOURCES.txt
> +           fi
>         fi
>  }
>
> @@ -245,6 +248,9 @@ do_configure:prepend () {
>          # change the Makefile line to remove everything before 'tools/perf'
>          sed -i -e "s%srcdir_SQ = \$(subst ','\\\'',\$(srcdir))%srcdir_SQ = \$(patsubst \%tools/perf,tools/perf,\$(subst ','\\\'',\$(srcdir)))%g" \
>              ${S}/tools/perf/Makefile.config
> +        # Avoid hardcoded path to python-native
> +        sed -i -e 's#\(PYTHON_WORD := \)$(call shell-wordify,$(PYTHON))#\1 python3#g' \
> +            ${S}/tools/perf/Makefile.config
>      fi
>      if [ -e "${S}/tools/perf/tests/Build" ]; then
>          # OUTPUT is the full path, we have python on the path so we remove it from the
> --
> 2.34.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

