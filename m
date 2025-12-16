Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465DCD5E136
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 11:29:45 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20045.1765884581420854551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 03:29:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FVhrSrY4;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b9f73728e8so426712985a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 03:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765884580; x=1766489380; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QiD9sO7ML3txdGA2nQm5rDZAzj+C3od6HSgpMDoaXHs=;
        b=FVhrSrY4yJZmfZKdA4XSg6Q2XC7E+FJk16wEXN2VucHa7/3Qlr7jqzEqge7+iI97JC
         /iCJZG65FJee1BLI1iLG0KkYwmHSjdZly/YAazH6FOOE8dvAvntHSlA96z/Wfum3fsGd
         bV/W5zK31eRlkN3lfKvtv7RZDh8DNRwWZEUh1aF4/mDCSvIk+CLTkAUUKIpJv+cWxvym
         MKDRPTlhknhWBQs5aULlzpf1q9akT1Gxj/2K+QEPTENOtFCC7DsOtVwYem78nAhVf0X+
         sfv5FXiTlAfI1JeTynppeckLudbqi/0re2XwdynoVVPB80AqbdS0WHISDJV3l1JIG8+G
         b0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765884580; x=1766489380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiD9sO7ML3txdGA2nQm5rDZAzj+C3od6HSgpMDoaXHs=;
        b=HxX1rjHrn8Zah2OhECKrkkSX3/weXLsT8oc0L2apYMQicDF/7u+Yhcy38D6nnnmpbS
         ESVVLqteiZjl8MvknFCL1hQCcB9BUjqgmocPffCw5265zflI8USU4pTxQHZmLIHMEDNl
         7bXvFxpUjcEN9LBxbTwXgRGsZWROQNZX804kOG05o73t5gn0MvWhn+ogjXYSvIlSh17V
         FblIfGCDNP+juaZvoaMZW2QpZgOymny1YhWmK2h8nrzlym0fy4HfbPbezdX/Yk1rIJu7
         +JfOuQAGbWE24EW5/RE6sb9vHERgFiv//Yz0dzMq9PPGfAzLBdObd6cvbhSCPpnMZfRj
         GVLA==
X-Gm-Message-State: AOJu0YzXacQWycDxJQI0Fm9xphPEN4XSVTmMUGh/0UF97q9FbIqb6cWF
	radJliLzlrUSEHxp3TzrFwgb8GaV92v7Q+tVMxgM0QyHxnEs41TqGynv/Le5c3IiSlARECmlKH1
	hJv+nIAT77iFuLxuDZ1da8rzCMZjkmxw=
X-Gm-Gg: AY/fxX5Qac3p+IfneXqTZAuWxwdIr+5f5Cq7RcsGBkVsyu7ZlXnG/YKn+SQ/oB8Gxg9
	Q+cGoVXGOywP/22phqBQMzFWHLpBC4gl7ZMCA0cngWRkQH8jrJq79sskzbdfBie1XuZRgkxuBDj
	THeGDRDM7B/ziw3YUsZguqhifxqdbj2TC8a9J7pU0y0IkInOn/niG7icgFH4dSQ6C+c6AfGVUDZ
	+Xg1+2L/YLbMfhO8b4CBx0F/XTYaLN7S3pomFT1jE85NTMDxBbuSi32BOmj2OueV6jppL09gJWk
	lqbqXdovT4CIB0Ca7L3AMK/m1YxfhA==
X-Google-Smtp-Source: AGHT+IHpcYWeaUzJJjTOjWd3odcbNAACAsupisICji2sNksF9osVPi5csH/MK9GX5TiOIyMIglCABGvVEb0xkDJkORY=
X-Received: by 2002:a05:620a:701a:b0:8b2:eb3b:fb3a with SMTP id
 af79cd13be357-8bb39ebb189mr1768239185a.35.1765884580273; Tue, 16 Dec 2025
 03:29:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765878985.git.liezhi.yang@windriver.com> <1fc8161d254e37709e63cf9d07ebd32a2f1023cc.1765878985.git.liezhi.yang@windriver.com>
In-Reply-To: <1fc8161d254e37709e63cf9d07ebd32a2f1023cc.1765878985.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Dec 2025 12:29:27 +0100
X-Gm-Features: AQt7F2p9e9pT9zJNoiOv8xHuBzf6YPnqD9K88Fc-WOHYvS7bA5UfkgkCKKzftWw
Message-ID: <CANNYZj8=3egJPC3dT1bc-9n=38-OAyAKfwb81mJjuiSiqVcaQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] strace: 6.17 -> 6.18
To: liezhi.yang@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 11:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227943

On Tue, 16 Dec 2025 at 10:57, Robert Yang via lists.openembedded.org
<liezhi.yang=windriver.com@lists.openembedded.org> wrote:
> The 6.17 has 27 failed test cases, and 6.18 only has 2 failed ones:
> FAIL: bpf.gen.test
> FAIL: bpf-v.gen.test

This needs a bit more context. If the old version had failures, and
the new version still has failures, why aren't they seen in testing?
Where and how do they happen? Should they be fixed rather?

Alex

