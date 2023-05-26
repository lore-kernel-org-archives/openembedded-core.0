Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FD9C77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 16:28:28 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.1642.1685118504972758421
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 09:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=KWvXKHpt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f606a80d34so7237645e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685118503; x=1687710503;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y8UVFRiRFfZ/z8TpidG8XcJE4OvAdTTKYu859qAfBUs=;
        b=KWvXKHptP3CtvFeDBKOJnBxNUp4clL5gNWCyOnlqYonTDQ4gyaDOsQnnrrKwuKK6Vx
         sNYHyU/CNNhqUNi0ez8iFJ4hr10SX24Zc2c+lrbgISze0HmV4oMhixZP2XzcbJeOJRDk
         SuZLcwkhh5AzvlspjW4zTn6o4z/C+3W0BgQyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685118503; x=1687710503;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8UVFRiRFfZ/z8TpidG8XcJE4OvAdTTKYu859qAfBUs=;
        b=DM7Rh8myIBWRRfZDhZtVjolC6I/dDLyT/mLs6rlVlgBD2prc5ep7reO80Q2aN6oU1T
         iUmbmQBAubdACnHXDs8ZrV3pf+0xZA1X0pmKmla6Rsv0KtIp/R7fDWWU5Z45gNPvTJJ2
         FY4GctjKMiy3KwUgXKOusE9Ish2x7GN87AjOyHshJrovJMLe1Hgrj3/PNqL0yP4mHC11
         schU9NW+NzPmNFPMSuww6IBa2gFZ60OjClhhXy/EPM/pUwg/YHQQhN0cZWYhO5VZeW8c
         xF+EGv4AHxXZzWrdTknA9QBqtdjk7N58fnI3761ti+/jYyDn784+DfLK1Dhw4WG/QDUt
         q2KQ==
X-Gm-Message-State: AC+VfDzu1hgxA7gcWW8ZPt98IetBYiSWQNgCzFIOnnkh/9UEZkL6xsEp
	Oze6RAZnh+xEMfXkh4VQkAUg1AeTFHW2MdLUOdE=
X-Google-Smtp-Source: ACHHUZ42lGMRoiylbQYlF2HNcm8HJFqJpsp22svFKIAut8f32F40evReKZOG41CuNo3urwPP4xRDjw==
X-Received: by 2002:adf:f809:0:b0:309:4988:7f83 with SMTP id s9-20020adff809000000b0030949887f83mr1795294wrp.20.1685118502770;
        Fri, 26 May 2023 09:28:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fb7f:e528:bcc3:c3ef? ([2001:8b0:aba:5f3c:fb7f:e528:bcc3:c3ef])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d4a49000000b003063db8f45bsm5479482wrs.23.2023.05.26.09.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 09:28:22 -0700 (PDT)
Message-ID: <f7d8cdc485e3d75304bd41931292f0cb76083e14.camel@linuxfoundation.org>
Subject: gcc 13 merged, meta-arm, meta-intel and meta-virt issues
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Jon Mason <Jon.Mason@arm.com>, "Mittal, Anuj" <anuj.mittal@intel.com>, 
 Bruce Ashfield <bruce.ashfield@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Fri, 26 May 2023 17:28:21 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 16:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181776

I just wanted to let people know I merged gcc 13 since I think we'd got
as far as we were going to without the patches landing. I dropped the
5.15 kernel and found ways to fix lttng-tools and glib-2.0 ptest
issues.

This leaves a few failures on the autobuilder in other layers:

meta-arm 5.15 kernel bbappend:
https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/4038/ste=
ps/12/logs/stdio

meta-intel intel-mediasdk do_compile:
https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/4488/ste=
ps/13/logs/stdio

meta-virt xen-tools do_compile:
https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/1691/ste=
ps/12/logs/stdio

Hopefully nothing too difficult to resolve.

We're now in the process of a uninative release which will hopefully
fix some of the other autobuilder failures.

Cheers,

Richard

