Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18931C7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 11:12:58 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.127060.1680693172191967509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 04:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c7A8a0ki;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id e18so35790051wra.9
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 04:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680693170;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w3iYAHZ6YoijMjD+Cd3vEoppny/j0hgvvBsNOcSMiSk=;
        b=c7A8a0ki6CxTDLeLiw93WqkI0RmXxxtvhzaRklGlO7rFQDjIe9SVd5loBwZjIXRYZZ
         j3pQOuYcFVYed3icoMRiAKRH13z39dqcIfhlPfxdIYBe+DDzys6iUHt79dauAEzvCjog
         JbMbGSq5l9NkRN0PqSxZzMB5Rg5EPet7CTDdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680693170;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3iYAHZ6YoijMjD+Cd3vEoppny/j0hgvvBsNOcSMiSk=;
        b=R7RB/FpWXC2pfIDSQeJ+qDWwARDqAEZvay/WKBfB4uzapSwdb5aWL+hxw41U/pLic2
         tA/C/qT/kp2kxC+a6hfEQ+9QdBTWwu2WmOyGUncl1zWKGM4h6SAjyzISGUBdsjAeVZfA
         ZQzydn5bZf4MfJJkqWgVVMQK10F5Z0A5+cXiVPSgK70kop5oGQzg6XVDLrkYi1AveEon
         pLvXPHB3mQOTPpDdJ7AS+q5tudC6F5nI5ub6dEsgYYm+9Cp/SuBkaK+IKu4mH9xdhtGN
         Pbx9WvWOB02oOmaooF1Hdtx9AX8uHIuhoK3kDn6fU+DlA4/mO12RuY5qTeZymZA67/aJ
         qcLw==
X-Gm-Message-State: AAQBX9cXj+M3u9jY2gHlTWE7sc2OyZ70WKYciByyjRoritHhNi0YlZ+P
	cXdPp6suUiZQfaGt4VgOZ9WV73BZ3bPS2aGodDY=
X-Google-Smtp-Source: AKy350aCjgLNgTRJhrkvxtO6vWig2fH7UDa/n1XOhcadJtAs0mkxldTFJJgDr0qV03n6dRYXMwDDFw==
X-Received: by 2002:a5d:688d:0:b0:2de:bb7c:bae7 with SMTP id h13-20020a5d688d000000b002debb7cbae7mr3330432wru.14.1680693170060;
        Wed, 05 Apr 2023 04:12:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f5bf:59d3:395c:4325? ([2001:8b0:aba:5f3c:f5bf:59d3:395c:4325])
        by smtp.gmail.com with ESMTPSA id t6-20020a5d4606000000b002c70ce264bfsm14828287wrq.76.2023.04.05.04.12.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 04:12:49 -0700 (PDT)
Message-ID: <6eec8f242c590401fb448212dc06d57c2be0e19d.camel@linuxfoundation.org>
Subject: Performance observations and HOWTO
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 05 Apr 2023 12:12:49 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 11:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179733

I was asked about whether we look at performance. We do have automated
monitoring but interpretation is left for humans. The basic reports are
linked from here:

https://autobuilder.yocto.io/pub/non-release/

under "Performance Reports" confusingly enough.

Taking a recent example:

https://autobuilder.yocto.io/pub/non-release/20230405-6/testresults/buildpe=
rf-alma8/perf-alma8_master_20230405030047_38e3769a72.html

We can see there has recently been:

a) parsing time increase from 10s to 22s
b) 3GB increase in TMPDIR size
c) 9MB rootfs size jump
d) 6 minute build time increase

The parsing time was probably my ptest change. For the build
time/tmpdir, it happened between revision 69808 and 69828.

You can resolve these with a poky repository:

git rev-list --reverse HEAD | nl -n ln | grep ^69808
git rev-list --reverse HEAD | nl -n ln | grep ^69828

and then look at the diff:

git log c7ee2d0236184045d46cfffa9f8822d3118baaf6..506e22a311cfe1136e70eadc0=
f1f07933aca072c

which shows it was likely the llvm/mesa-native changes.

Cheers,

Richard



