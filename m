Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2789C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 20:32:01 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web12.2298.1648758721050000888
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 13:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oY9LIFS+;
 spf=pass (domain: linaro.org, ip: 209.85.217.52,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f52.google.com with SMTP id k15so691323vsr.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 13:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LEs13AHKJXAxdcqWGHEilws7FGDejiUzO6wTEYvD3NI=;
        b=oY9LIFS+1hHTe7Dj6vSrJ3wCOs9dG9m4g3uMRG8DSjQvItpoRJUK4yFW4RBb4Qr+fQ
         8COaODXVhlJv59IDLPa+R32/aSqYrBvHhjSe6XMZwbGftxFkVK8zuk+PREgqdzbxLsZI
         6Xwy4dpIHc17kc1ordpn0OlgyNd3S8yfKMqB8wQzhZWn+T69u3AP4w5DJzkzNSb8Y4lF
         smh2XDuFMBQvApL6P5tcjekqafVI5ESxsKP+Tf5ouwG9zfIaj2obLivUJqy2ykIjTS0i
         cwLzL6kWFuLGSsGd3ykmvLGqWmTt4PvtP7OrpFVBvUjzJUvqT2Fj+n/Tqmady99RwvKO
         6xgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LEs13AHKJXAxdcqWGHEilws7FGDejiUzO6wTEYvD3NI=;
        b=2bMOB551FdYGn2iY6QnE7snhWQt1mWtsbcYRxTE5h7FDLynIouW0OtlQ6XBymQLiGp
         YgZmPRne8M5ZWs0V6QapM8E3VbqCrSUVMEm5Iq2PTHzwUfFq1rzqMLXWPDZd/4H3TqxQ
         mX6sszk97iiNUeBG2+dQ9CqaFOnqyE0gZwR2fbc2HhPy6CGaw3PrX/3wTnejfqisBHix
         7cUzVHDHoiu5BzH4FiynaycZr0icGPhsJAfQimo2gqMcCyNlVQtpT2VRijYG7DUOoqYD
         khYRl2QUe0hB3gMbRZhZURg3+/Oviattef8YEy/phXNA7pDfCrlXf0gL0WyBT2YQ9slw
         E2nA==
X-Gm-Message-State: AOAM5301r09N+RXTWEpveBsuNRaM43qNcNHjME7g5C8k32xXBixZ1peY
	ZXRG8FZBf4XMDEvaCnS3Eq4vhWh83kHlhBejmDbxYA==
X-Google-Smtp-Source: 
 ABdhPJwI1wxgaMbOWml//FdfK9SUy9HRG+8TcTlLLbciMEWyfyMfEI32+XPqiNNCL0QUor+8WUVWVMwg6l9zBXo+VjU=
X-Received: by 2002:a05:6102:ed0:b0:325:9a2f:579b with SMTP id
 m16-20020a0561020ed000b003259a2f579bmr2345026vst.77.1648758720205; Thu, 31
 Mar 2022 13:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220331193819.1623580-1-ralph.siemsen@linaro.org>
 <CAMKF1sr7htUph5S7Fx=W69kjOfHbdcsOtHCC0cChyR3sodtCxA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr7htUph5S7Fx=W69kjOfHbdcsOtHCC0cChyR3sodtCxA@mail.gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Thu, 31 Mar 2022 16:31:49 -0400
Message-ID: 
 <CANp-EDZuqfBLJfvdFBHkDV=zz-CB+Pz9dHghYqfigHpej0iqeg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] bluez5: fix CVE-2022-0204
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 20:32:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163869

Yep, I must have fumbled it before sending it out.
Please ignore this one, I'll do a v2 later.

Any comments on the usefulness/format of the "Status in other
branches" would be appreciated.

Ralph

