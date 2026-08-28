Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B428C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 08:25:24 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1775.1787905520921147193
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 01:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3uJWRQIi;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso7529195e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 01:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787905519; x=1788510319; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7wHU5Zvb3Vm1dwHZefH37woBHkSuS4M+aQwwjVPguUQ=;
        b=3uJWRQIiOh+l+tnBODRHitqrllJEabcEjI4d3C0BmOaiSJov6K5TBKxiSdUg+VN3Uw
         Sv8PayNpd2aVon1/F1hbSYz2Xtod/kJPmy/bX7oF3I4y9PnGbyT8rFBxtbZlxsod9Xrl
         MLsKEiUk12Ke5IRQl2mnQzZ1eFCanx6NqJ/vU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787905519; x=1788510319;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7wHU5Zvb3Vm1dwHZefH37woBHkSuS4M+aQwwjVPguUQ=;
        b=EEJTjcT44XeQReMOJhssSUfJ/qibg3JXsGjKdEmn+Tc9R0FvQ61j/DyvugX6rMPcST
         v4f2qpWpd6B7rqTjCnxKi0Ev710lUEwHSUOiFTc38xsIvhHy/skOaRNzsK1r7a0Xu9gV
         ct6cnooMJklovAETtAxWF1IFcbLbXTeQhbn1YudtPgejKObQMuVJqFbuXjM1W+GheWNW
         /j3BAnF/ae/dEdXUytPhlDaQ95+Lrhw/EeH/yjhQlG094/cxg029FQE7NK19WElUeqI/
         F31nblHdOcw/vaOMfwh8z0p482t3cbUHUhRoX3NM3RbwOeVI9bR0X+YDWPEkYdcOte2T
         4WUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDnljAEETxuhA8JRzrR/NgAHDQY23uuhHtH6PfZbSddDgSMiUCLgA7/dBHujhbOvzaSDosu/0wlEZYB0JccA3fiQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++mkRZ04Fspsg3c+WkK8Z3J8D/vnasKFIvvUCQimMr9Rxr6rq0DO
	nb42gBijHXFYUft1iRCWYBRXgRl7GFMZTMgbDcjGRnRH9N2nlcCmsbAhV2c6FtrfyPg=
X-Gm-Gg: AR+sD1047OLraU9nSX9oY1atPMcfj6VTiRMYkey2mv9g4GKZ/4Q4665vfHQs8L0r5n4
	ZvBaOQaGVgC1ifIb2U+zOoYN220NF4nmVF3xLJb1op+YikS+NfxRTGl55ddhySQoNBr7i3IuSRj
	yh1y4Ls3JIoK9TD8aJOG7l6ja1bNrwQCQZ8ur28c/fZarH2q1JJRKwxnIQSbwxn24A9jIHRvvrl
	eTKIWpwG3+f17LG6l2ht78KI5ftHxAOjIEUJWvFLemeXoQAK1dJe0DYtFVE8rRAMZPpR54kStZQ
	5s6WXXPwqeldpBddcvaPN/16rm79OqcdSW52bS6Xe2ifNLKKnNNZBfRc5kqIjHVReOF8PdUZnqu
	YRcyqrx/A1F5CsujrpIaqs8XuN7xk/PFrzRyo+Ty7cvLXw+z0dxN1v21Cwy3jgZoVeZDGq89txu
	SsKCnWl+NzY/S4WSC4e8GggeXE0gzSJszu0sDVw1ODQht42+5jRFwWRE0S4c18AYJwLQgRoizEQ
	X1C3JpIvygUp+I6tvthiqM1pL5TfRUuPIJ9Dr2tnPDN928xiKVa
X-Received: by 2002:a05:600c:8518:b0:499:737c:8a8b with SMTP id 5b1f17b1804b1-49b91c56c0cmr86709795e9.12.1787905519159;
        Fri, 28 Aug 2026 01:25:19 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013ce4sm30303495e9.14.2026.08.28.01.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 01:25:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 10:25:18 +0200
Message-Id: <DL0FM099GEIW.TMGQI3PXEOAU@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH 1/3] cpio: patch CVE-2026-66485
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260815190824.2980891-1-peter.marko@siemens.com>
In-Reply-To: <20260815190824.2980891-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 08:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244522

On Sat Aug 15, 2026 at 9:08 PM CEST, Peter Marko via lists.openembedded.org=
 wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick patch mentioned in NVD CVE description.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (From OE-Core rev: c105fbf82e2f50b05dc680e0601bf0ea3198e58c)
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-extended/cpio/cpio_2.15.bb       |   1 +
>  .../cpio/files/CVE-2026-66485.patch           | 210 ++++++++++++++++++
>  2 files changed, 211 insertions(+)
>  create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66485.patch

Hello,

It looks like this series triggers ptests issues:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4362
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4378

https://valkyrie.yocto.io/pub/non-release/20260824-88/testresults/qemux86-6=
4-ptest/core-image-ptest-cpio/log.do_testimage.311338.20260824214940
| FAIL: CVE-2019-14866 (tar header size overflow)

Can you look into this?

Thanks!
--=20
Yoann Congal
Smile ECS


