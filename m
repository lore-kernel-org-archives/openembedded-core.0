Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0755FC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 07:50:59 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.28912.1744271449838716527
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 00:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PIYu/hxI;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e900a7ce55so7495846d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 00:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744271449; x=1744876249; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WZxiESLyliFnFNIlfaukG0OwZjKcaCFparIOArP2gmI=;
        b=PIYu/hxIlAU6GjQ9ZXs0ec1F+r4sHumAu2Ouutrr5CQvvudnvF/sf3S7DGxYzgWUnB
         Lgc0z6GVeF9P8BpVstbsnh2qxrbrSG2cMjNRZetJ6iYfczGbYR5Z5cgvTAomtMzItqdD
         23htRyJ7iYSYVFWP0Tn6wbRmzCiQ5BA8IYQyFr+GCp5YdupmOuWLbeEuAHR+5QyAUiIw
         p6h2JAZcvjdEX5bkIan7Dkw41PXlXsIuPgmYANFrKhrCm4zab7Ga+1B8Zib6qsNABLnl
         C5gmEQwmH/sFrmZQ5Q/mWQMCBcFiuBympn9YMsYCzLZVc1Msvqh/FyD2ILA2sTaNPIDa
         1SQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744271449; x=1744876249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZxiESLyliFnFNIlfaukG0OwZjKcaCFparIOArP2gmI=;
        b=PT+e52Ha4jdojDp8fWMR40jBBR3yv0F0Huj7Zr0gkS5eShBfwmlwIL8/uvGvMQ+HSv
         xdM//xYpE4KV3y7hrp+535BMSAFgypbAb/sCxAX73vbBtwOMipdDR3o0IGoB6QBnOFSQ
         w9zN9LmYpfDcoeIhrIIjo477Hm5v079t6SG04gy9T/thp2s8Y7XK1ZRPfBNfaqlvkRBY
         nr5fKi9LF+S5Zj+DX3ypavKU2qj+rfbn/SjQnJqJ8jT/zuqLTkF9awm/REp/v9hmL/PX
         1HMGLNeU5uQOCLSiWq3coF3Fr6MieloVpK8ZOTKcmixnqruAKXg1eIeGK7Ox51JMU1dW
         qTTQ==
X-Gm-Message-State: AOJu0YzLWzdE11JGWLdyHghISWfXkN4mCn/JOV/YGRCe6C2usvSmTgPt
	A9rlgFVez+VRQLYekeGRnhqT+DE6xP+ugiy/bDBRJEFcHs1+UfroSoWtL5fbqGbIcixSVKPHlKK
	1NWt6VpE18AiVSZq+X5J4AkDqGRvZ6Q==
X-Gm-Gg: ASbGncsfDLn8t2Qr13Oxda7mIRfLvzzT/s6fO21VWvBcEuW+6DARPPIzy+cGcEuhhRA
	4NW1KTW6+9AHcre7Dnv9V1AzJCz/SP1eK074VO5IMS2xDvpn75Txf3O93HXd5ku/KBqQtfH8DjX
	VgNL5Dnq9mz9Kdc/T228BTYvmB2Htu4xMAm3bRBERA6MhnK5k9rG6HkFiC
X-Google-Smtp-Source: AGHT+IHnOLnrnb+ZZXinR/TQiqKBcWCWD5iSatdruetps1PV4j6LSIcqeniDfxXKnPtpYLGAdnMcNjTFVL9+fhU2ry0=
X-Received: by 2002:a05:6214:21ce:b0:6eb:2878:e1f3 with SMTP id
 6a1803df08f44-6f0e5c13279mr30200016d6.39.1744271448816; Thu, 10 Apr 2025
 00:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250410040825.1283228-1-Qi.Chen@windriver.com> <20250410040825.1283228-2-Qi.Chen@windriver.com>
In-Reply-To: <20250410040825.1283228-2-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 09:50:37 +0200
X-Gm-Features: ATxdqUFytChHCi4eOgohBKeocuBEJmepsRdnDC6ohwFnUwvd4sFmdortCVEUNc0
Message-ID: <CANNYZj-e4q=gEJ0yCy6r373wK+Qy5=BreFEsPJzsvGEi5TMB1A@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] lib/classes/recipes: refactor qemu.bbclass
 functions into library functions
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 07:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214628

On Thu, 10 Apr 2025 at 06:08, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> -
> -        d.setVar("qemu_wrapper_cmdline", "def qemu_wrapper_cmdline(data, rootfs_path, library_paths):\n    return 'false'")

(in allarch.bbclass) I wonder about this, is there a reason this was
added (perhaps via 'git blame')? Is it ok to simply remove it?

Otherwise looks fine.

Alex

