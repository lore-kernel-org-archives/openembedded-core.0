Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990EEC433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 07:05:25 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.7361.1651215919162990923
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 00:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FiHUHU+o;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id bq30so12453278lfb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 00:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UjJ5FWqOIULtGUNURCHqaQjDshIphPQivVGh3bq8xdQ=;
        b=FiHUHU+oYYXqJrlsxg2lCSpb+zpNf2/afjeRAAyq2GzJVOT8jHZkGpBtP7TdoTGKQR
         2UxA3xITyJlq1MDTNe33Lg6Vnzt9YdxCygGGPGJGGdkrjymee/ldQNLuei89uTHc+EAj
         iUiggK8FSKrvzybsy+75ZGmc+53gIpnZqLWSuHRgHUzyM7tXPiNu+M0MTZco3eQcC6ng
         4j8bPozte/TDBog8y4p2ZSAzZlaUgjfORLB9zLe07lkSEv/l1lVdeo2TXH4OcjuHVXhQ
         c6BUTPDEz39bhJAlyTEXmRM/UkMtqzdnUmZSmNaH/GDTg/6Bnz9F+dM7j6W9cAtGcGa8
         HRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UjJ5FWqOIULtGUNURCHqaQjDshIphPQivVGh3bq8xdQ=;
        b=O6P0hBvD2hucCRwqCo6HztlcvAv3NMgIOV5CBSK4psbPDf9neWDih9c5le/dobWKBH
         ISg56iPgik2ujF/MT8wSfxjOR0UOOo1PmjnPd72WpydgR/UWuxssNGI8WtVTxk8Avof0
         3fMlhTn0QCbdPK3wAlC+YvGaW4CGcZj52RJ44QAen2wbI3lk/EUf0PSPZyUXYsobQ6uZ
         q37FxSUxHKoxRk0dDZzCs4Ku6nxVUJgWw2preRCb+WSQOe8DNowuVlNX9mP26CjDC7kf
         b7t10O2DaQU+hRJJyS4dTCpxAduf+xTZGTxnSY3MvyRE3jP6DTJhs/OUAH6k0DBqhPax
         WKiA==
X-Gm-Message-State: AOAM532aFHn7o5PDp48uCOOdwiTv98A12TkRnSBHXGu5nzwJV32s2kwr
	IneEwZ7oPkeKsrD/C+RIUS1RPHULRReq87nubQc=
X-Google-Smtp-Source: 
 ABdhPJzc/dRIOVXqD9dVqjIxdxT4NCosvwh71bRjXRZpaBXBIs1he+1DSD2795U4zKpZ/FhEvLUzOUsDmnMCPEKlxGg=
X-Received: by 2002:ac2:5b1e:0:b0:472:2c9f:5891 with SMTP id
 v30-20020ac25b1e000000b004722c9f5891mr8443894lfn.534.1651215917279; Fri, 29
 Apr 2022 00:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <1651131215-4196-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj_5zAZvg_rbPw4C-YNA6ptohpxvDOXbCdNvj3Bom08b3g@mail.gmail.com>
 <OS0PR01MB6178D7CB066B54B254C078E0A0FC9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OS0PR01MB6178D7CB066B54B254C078E0A0FC9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 Apr 2022 09:05:05 +0200
Message-ID: 
 <CANNYZj_qUUccE2Bntys3vQiPF=+u6UpFMXwhTmT9Ey1S=0XCuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gnutls: Added fips support option.
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 07:05:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164996

On Fri, 29 Apr 2022 at 06:51, leimaohui@fujitsu.com
<leimaohui@fujitsu.com> wrote:
> Sorry, It seems that I should add an explain in commit message.
> I found that if enable fips, a binary build for target will be executed in do_compile task. The log(MACHINE ?= "qemuarm64") is as the following:
> ------------------------------------------------------
> | ./fipshmac .libs/libgnutls.so.30 > .libs/.libgnutls.so.30.hmac-t && mv .libs/.libgnutls.so.30.hmac-t .libs/.libgnutls.so.30.hmac
> | libtool: link: (cd ".libs" && rm -f "libgnutlsxx.so.30" && ln -s "libgnutlsxx.so.30.0.0" "libgnutlsxx.so.30")
> | libtool: link: (cd ".libs" && rm -f "libgnutlsxx.so" && ln -s "libgnutlsxx.so.30.0.0" "libgnutlsxx.so")
> | /lib/ld-linux-aarch64.so.1: No such file or directory
>
> So, I tweaked do_compile/do_install to use fipshmac from native instead of target. If there is better way, please tell me.
> And if there are no questions, I'll send a v2 patch with an issue fixed for multilib.

Can you please show the fragment in the Makefile where the target
binary is executed? It is better to make a real patch that changes it
to run a native binary, instead of changing it with sed. (sed patching
is problematic because it's not clear from the recipe what is being
done exactly, and how the original and the changed code looks like).

Alex

