Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF64B10A3D8B
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:50:55 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46577.1774529447102739608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bELnaVCH;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-899ee87355dso10987276d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774529446; cv=none;
        d=google.com; s=arc-20240605;
        b=LV3y3gmbBu1uKus/cX2UW+ZIme8YTF0+/LtLq9BENpQ7myQkVi3paDxEizpk2T10es
         C1J4y7SOWt5dG/HGz/hAJGt8d/Z8MmuZhZXOvFfLDrae8GVeIBf/qmvqCeYR7r7JQPjI
         WCCK1m6QJQRpFXE0lJQUr5bmbx2wPsHzi0Q+4RHgnE3swqEIsY2yq9QCE/xfeN3UG/8o
         qQsMYXcQyuGMjViCUJEkHpsXSjFCKfLyp6Oxl5XFjAKGqiGQPpIr+BPZx9bsc46/fYSU
         dPSbg3BF/DmzfLJ0XLUfCsS14EdvUrpnzJ/vFadwDA0jXYFJOGh+yOdE7clHD6ad7TAu
         ZLSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZvluAPJLq/6HKnh7TZLLRZmIa36XsaWd9wYpo/JqSHs=;
        fh=Eip4Jn1XwWJma9SY+p290X7lO535Eq/j3krUlYr6gVY=;
        b=YyKETg3H2Jwphg5/yRzuP+LdRkICyLZlB+F31I/1+hMxTFspTCTjsR/g/p99x4NN1Z
         P38+qFeC03z5WMkXtM/HkWcOZEIa2rz1QidginUlDT06C0J9PnAUMT0EEYC8f4edn9wJ
         zeVtn9kAF7dsIRd0ArYPNTu0v2oqXXEArWrof3Ky2oIlTNiyrP6mDV3w8ODcLjn4AlKU
         vy/afK00+wP1pccOnrcqf4wORB1Af4nRQShKv7JvxtywnO7YEl2PR7BBU51j9+5cvcsN
         oJQq1UIv0OdT+xDNuZZoBqGo2VPj5iiahlX9LWQrKdeJ0o3q/kIfdrU8GVPwjO80mdzl
         BkUQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774529446; x=1775134246; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvluAPJLq/6HKnh7TZLLRZmIa36XsaWd9wYpo/JqSHs=;
        b=bELnaVCHKUWpvL8jd17iVfr9H21c45uPyGTV3OLMAd/6fYnVnBEugmBi5l+7bfW3P3
         QietlD2y10/XEe8hZ8JyTVCM7umMuUyaxFsnPV1GWeXFmjZ+CRkicE7BTYkqTKU0/aw/
         w5e/QrLDUI2pURvL1IxJgBpYDeMfL2pmjKZxgCtxUbCu7w3k4hDwORC2w4Jo2zobxxXd
         KV++NsKQMgqVE2Y4e9uP8Myvt22HTDo3gm0Yh3GY3P64YlFQacEaJ43dnHUNaZCaa1WZ
         bXDj7JDO+yRhoyhcIkx5LC0tdtGH7l3AxXLXtsFNbQkLBXnWVX3NmCmYt3YlqANah3eC
         s+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529446; x=1775134246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvluAPJLq/6HKnh7TZLLRZmIa36XsaWd9wYpo/JqSHs=;
        b=BfUcPm9CBv+s3EUHirr7VBU5qNhln1lc5MlGD9K+A6My673MaTr/tiDeEdcvhpgDNG
         8o8DHgBwopJynkznrRx4iwp9MtHYqMw9ImHAB6pSNPu48elwX7B7QzLyx6s+FNLEhPzY
         JPPoglQ3DFxbojAiAYG51VvMV88WsbUZZKDa9taHw4aObAS61mjdhT54yyaNVK06MsKQ
         zwH13Zz1rIiqnbRVbk6ABd3vvdByBwOc2QpnJyE8Yd+VgaeryoyiTVr4tfQ7cTZb03dw
         j4IzjyTLcOb9/ryn5MCSqdpzzrR/LCZy3ZALrv1RZAEeNo5KutQpVdtTemxMhAXln4Si
         rqZA==
X-Gm-Message-State: AOJu0YwDBeUPFH7aaCz5+0W2GM8Pj+T1b9FdF8KAL0Q2ckVG6+TJ9cm8
	LLz33ZZarynPnI1pUFpUmDKTvkYHk+q+F8eov/QIKJBVmpkW4P5TWrWXm31G334ChkZ75D98OBY
	+ENn3SYOzqgsXfen22sqEop7E3x/nKVMoGY2D
X-Gm-Gg: ATEYQzzvXBmQ4o3GY3x+ryA3HhyGz2Kx6og1g8ZN2kp1B+CxK5ukEdxtMncegI5DmV7
	ijcmlO/BzO/JUbwsKQmcqtmWlP+kScD7NSLCFjuGilOe43eok2TH9/E3rh9zXOmDAG8LeEC2hnt
	gvvJL+iIQ01ber9cw5MMD8IOe4DpGbcUy6AnCnyc+6B6fkPGXgV0J+3aD5e6+5VC7hF2JzCtu/s
	iKeppC6vO/bZkw8CfrAhQEqmZARnyH2sjyhinC5dKI8tUuEXqMiCbiFzfiUZ5ohe09duznVHFSK
	frrnLry6tj8wfT96nalfey1yDsf/5XnsXiTdo7nklQ==
X-Received: by 2002:a05:6214:2e44:b0:89c:8cc8:7c6a with SMTP id
 6a1803df08f44-89cc49841c3mr104111616d6.5.1774529445985; Thu, 26 Mar 2026
 05:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260326105453.1799455-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20260326105453.1799455-1-ankur.tyagi85@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Mar 2026 13:50:35 +0100
X-Gm-Features: AQROBzDvvJ7lveDP3I1UaHo_vHUzNrmmCcJAMo_aHzPpBE7nYZwFqhOiA535qyI
Message-ID: <CANNYZj9eMOVW12_nz5h9ri7NbUx=hpEH_ecQkisFX9v4ES-fiQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] vte: upgrade 0.82.2 -> 0.84.0
To: ankur.tyagi85@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233983

On Thu, 26 Mar 2026 at 11:55, Ankur Tyagi via lists.openembedded.org
<ankur.tyagi85=gmail.com@lists.openembedded.org> wrote:

>  SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
> -            file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf \

The patch file needs to be removed as well.

Alex

