Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D6CC83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 17:42:39 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.19819.1752255757545933313
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 10:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S5WHiK3g;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6face367320so22779696d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 10:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752255756; x=1752860556; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3IXJPGC/CNcqsMehsMHk5A7GzNzZqq2a7rpourML2xw=;
        b=S5WHiK3gnvpgsxIUjWT2xlcKAXZl6eCNHPnPNB+hp5SWRlCDsGsJJeb6Rk4cmNIKRt
         Ra1NCRNZShkxSLnwxCoZN1/MwrGd34M5UGFoAloYWJxujUBBDyEAcK+ZJiJIuy6vYhke
         sJtyxgUzrR2mwWFoePrm3VHkPSwAvDNxCcG7wnxZYVhDSfhzSzgyNk+jLZqNykZIz9MY
         F2uavXWx1/Cy4D13i/cDLZ/gXp4GmTv78JvvpCWiSeL/ev2crAdMHrpdDAdX2mRVZKgX
         zovyq/UlGfO+3LcE0KPURAZCr84qpSvRTFguA2FXjTUN7pTjfIxE09cVMVBi0xyNVl2+
         r2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255756; x=1752860556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IXJPGC/CNcqsMehsMHk5A7GzNzZqq2a7rpourML2xw=;
        b=Vbf+jAlP+XSR/55l2dFyAEpIP+eV9BlN7hUqOZ7kfC3MOcM4kcfMjDOmJTgSl9NFww
         YFr4NISVkRm4Sos8MgUbbpD04rHTfhdh47ArrxkvJ2aS3MDVr3RvxJ11D+joe36RLba+
         GOyl7T7rsY3CWPI36zWZaU/mv81JY3j7dN2XDWkueOLdqHrDzN+7MurzV/o63WCsPiWR
         JrTMomEweygmoOPbAnR1lagUxstyPD04Jb9IyNgxOWwbYC3Z5b6fuaENw68G0gag7hI9
         jo4bLXtBRZrx8SqNrsHbOdiOQB+GOuUyrPE119CSGJB5s6BSm6S7veL49/qw/ektNw63
         GOOQ==
X-Gm-Message-State: AOJu0YztX0HTc1oM4xJrcsJ4q6jDUvPjpuCipuA+0RMGvKsuDGxDQDyG
	shHw24zfGINAVOrqqkx5p921SBZzFUud0XRbDLdE9WCzvYM0B9T1w8ABFZGXcZEx9CVF6vBZbp2
	V+16QMOxhLRojZtTdNqTIy6jU9t4EUtNu4w==
X-Gm-Gg: ASbGncscTDFttFdMhsiFKuq+wy1cr24GQ80SrSkXKkgm/7DhFhDv8Un4v+svxGkESTr
	g79QFimBBtLbu/NDgfZJ8R4QIAQhEx86vEBo3FzRkRHZ9sh0bmgYidF0axC3oEw03lK/KSfuPxJ
	O+z4T+Jd1V994oCD6oQVQ5m0dpCNHBki9xqfEb2f6gVrIhxFv8BQu4BUWx+6VNmj/vXCFMxxSdo
	J2IFEmnG0tQdJcRYGdfq3CqhDjwPejHbjhxbyA=
X-Google-Smtp-Source: AGHT+IH8GYhj3Aig1ve3lqWCc82gpHCeLFd4cyGCeA46jOiIsgVDWXoS/E2GQq9igwHbf210fnEqRRBugipLcdlHL40=
X-Received: by 2002:a05:6214:3107:b0:6fd:7520:da87 with SMTP id
 6a1803df08f44-704a389f455mr77707066d6.25.1752255756237; Fri, 11 Jul 2025
 10:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9mqhhwvr145RCzR5NULK48_SmphXyiprLFbK9dOGnyhw@mail.gmail.com>
 <15249.1752159730747726200@lists.openembedded.org>
In-Reply-To: <15249.1752159730747726200@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Jul 2025 19:42:23 +0200
X-Gm-Features: Ac12FXz-oVb24MEcE2I4L-JsHf-42j7zJpuFAfiBHWAob61wAk6NL9N9890Wt5g
Message-ID: <CANNYZj9EJBJoFQ=MzCWYPM-etwcjkbh1eGEmpS003tt_YreMsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package: disable renamed dependency error if
 allarch is overridden
To: ohnatiuk@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 17:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220165

On Thu, 10 Jul 2025 at 17:02, Oleksandr Hnatiuk via
lists.openembedded.org <ohnatiuk=cisco.com@lists.openembedded.org>
wrote:
> Could you please clarify - which additional information is required in the commit message so that I can resubmit it?
> Alternatively, it is OK by me if you amend the commit how you see fit and pass it along.
> How should we proceed?

I guess you should first try to do what RP suggests rather than
resubmit the original patch?

Alex

