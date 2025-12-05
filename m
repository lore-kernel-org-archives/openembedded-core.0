Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F15D2F7CB
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 09:44:00 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2083.1764927830928229736
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 01:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ltQUuaxe;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b2aa1ae006so240208485a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 01:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764927830; x=1765532630; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KOt4mCTBoDD/rc6WrWK1b5k2ck1ZirhN1uzMov8oUgg=;
        b=ltQUuaxeQhX3CHRNPlK/yA+eRpjD5Y68P02goylOJhWeBIkc7hDoiD0LFGBgQiipkw
         g9YWWyQZdjapfBb6ZX7IQrnUkTkd7p7Cz5GErLi1nOYB351oUuJVDroyNdUEsQvmsK9Z
         fwFchviHYFVVPCJSVFLpC8ePqsKTTa25khItEr7oU0o5h1lfVCJYJb6XYojkZFog09D0
         SpISXvVRj6fYB+75Ly0n+JGrtq+frJ3M+CTLVupM25m1pT5Z9Uw6qjY2fybBCtdZdkV6
         XFqJCnnsI88MbQsqtJcTRzqzOKS+4m6fZkoCyZVIdu5F8WdIIE/EXIRwVj+pmtb0oeqV
         g3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764927830; x=1765532630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOt4mCTBoDD/rc6WrWK1b5k2ck1ZirhN1uzMov8oUgg=;
        b=DtdyGoq4FNzW6VS7Rxrebn4IOWL04rYpWvk/hN0F15EMTJo7WVdI+O9NYlqPE4Is/z
         USzlLx0rtlU/Gt5XTvP3giHneJjNFgGB12VTVEyNS9OQnMmy+tH5cCSio04fSulty80R
         FjxaslQxd2CgPcNr3NuWG2eyGIDfSML4klYDT8+q8+7eddKPstKjdzZOX3IzeKnhWbMD
         dwOpj7tpt7kSe53G6UAnCR35L3j5JkAC6zg84CTymEaY/nbdC/mBD/qjbe90xnX94jD1
         1Mc0+gf/gIcln8248UWYAEBh2p1smNmDnzgCbrf9LyQbjQ5JfPEJuXE39X16By81c+/R
         8vWw==
X-Gm-Message-State: AOJu0YzGZqnBpbvBtz6RDHbfRJtqE3be0dHrQbwumo0ml5fvUNXciYkX
	VivHX58VR52+zbfkAMw6i4tRU0SPGK4tpABQtO8yM/DJhpsSKbxUwiM62UOCt3rIpuNnN9GRPCl
	c8Iq1XJqNbu6M5m76iB/cQRXaeR+k/0M=
X-Gm-Gg: ASbGncsOfQlYkZpG0ST63jpt+O3g5raRYl7hM7HBspJSziNq3gYSblwGVC3ZlT7Zhnp
	6/6cHdENjamhjN9O0F7SUwGhw88YGxEMqwAdzziS75ngHd0v4LWOkYu2w6/HXRrLAgAT2h169m6
	ee4EtM3Ab1iph0jCnvRFt1Jcl8+qF7ybK0fBfQSakP67nV7BRelAoSR+O/0/3B/XK9jLe5avaED
	JZAiyRhuk6RF5Pwbb5KXsymV7UhNQtUGNyK1UOTJkxif8G1okHNXn6BCOJJH7JCVQECxy0VC95T
	r1h793JStA17tAILt7jIveWBGrpXrA==
X-Google-Smtp-Source: AGHT+IF4SDEikrY7lRWRusvem35Z5Uitbu09wyEAso3EQNoPmmIPveeiW6siNRkZmYbL0002coRcKVrxEUaO49RqXzE=
X-Received: by 2002:a05:620a:40cb:b0:893:2ba8:eec8 with SMTP id
 af79cd13be357-8b5e6d88e9fmr1087526785a.79.1764927829809; Fri, 05 Dec 2025
 01:43:49 -0800 (PST)
MIME-Version: 1.0
References: <20251205083202.330982-1-Qi.Chen@windriver.com> <20251205083202.330982-2-Qi.Chen@windriver.com>
In-Reply-To: <20251205083202.330982-2-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Dec 2025 10:43:38 +0100
X-Gm-Features: AQt7F2rB5nKuSlw-Hv-auAdBU8JhJXjNBLpAkVh2_QFpBUf7tKOuRGOu5jAKqag
Message-ID: <CANNYZj_1RO49jZ1gQR9R1Nb4uHoHbbPxJ+QxXBq9cFiHBVY19A@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2 2/2] core-image-ptest.bb: use ?= for PTEST_EXPECT_FAILURE
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 09:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227346

On Fri, 5 Dec 2025 at 09:32, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>  # Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
> -PTEST_EXPECT_FAILURE = "1"
> +PTEST_EXPECT_FAILURE ?= "1"

I'd say let's rather drop this assignment and the comment. This was
the case years ago when ptests were indeed flaky, but they've come a
long way since. And even though because of this assignment ptest fails
become AB warnings, de facto such warnings are still treated as fails
that block the patch that caused them.

You'd also need to tweak the regexp in
yocto-autobuilder2/steps/observer.py that Mathieu has recently
introduced.

Alex

