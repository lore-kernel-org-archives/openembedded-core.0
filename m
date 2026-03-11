Return-Path: <majortomtosourcecontrol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2E4FD88E6
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 03:19:34 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12936.1773199171945536498
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 20:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eCueU5vH;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d74d6bcc00so1748243a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 20:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773199171; x=1773803971; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o0V/63pLpmJrwNGAcjWPD1chRxqcYEbmB7dBYwAVk4U=;
        b=eCueU5vHACcL21dUZTDHYcLjjOhNyDfHsuSiDxxorF1cDTvKpDoT9TAo3dOtu2AQHr
         vg+9qoOV1hS8hAesoFmLjdNX8dquIfsB85LR7KCoHKgvF/8NSUPfLgFTCX7BfDuylGpn
         hjaNCrc+R9z/3XSY1xp4qiwIOxONe1gl/I+yZ3in4xHJuBllmwIsIUxJHQ2AhyDCAe3r
         7fwf81i73lFAAQ378fY8u89ForFRsa73+ML7SCYWguNx6pRK5tjW62VvG454oZj+T/4J
         NbR60BJawCs2kZzFfr0ytA7eqgKJYeHfQRtdvhPgZ0yNKFggRI7naxO/pX9oLC7StkIx
         sPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199171; x=1773803971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0V/63pLpmJrwNGAcjWPD1chRxqcYEbmB7dBYwAVk4U=;
        b=Ev2GbOo7wEjU6BMuDy6AZP0iVqcehZ21zFRbX5b4PZF6FqmoX5qQ+HBwTl2TDIyuo4
         3j9/vhJaTbECUvimQ6lUh7d/89dm64hSzriQy4VMOKH/TR/VOdXUjUx/XkK7CsXFOLt9
         l5mTSSzZl/DwCw0yDP1oxm/1QV1/vZr+4FxIRM2B7A367O95oFKsSmVl9Htmv0gqxXWu
         GQc5OZQ6bBJuKxTA9ONCOGsUz1mHAx8uEdpEbEDsaiPnYO/gfC7tzaoK8d8aKK3zgpCg
         0IZXBXTj+5l0/yJhpBln9g54m7rY+CsjP0exW2r3al9clZ66Onped9MI+4xYL8ReTIIw
         tJtg==
X-Gm-Message-State: AOJu0Yzt20Z/se6O7Oaj+h62mzd9+V7RLEPKOz1cmf5a9GRre/TVMG0p
	LbMHFKo1VvJUzUCBfX6GCc4euWf6orGR9tIgCnoFhK7K2BRrECNdl/F9
X-Gm-Gg: ATEYQzwMpF1gU5/Df7f826aNV0FCLCFeGxBQ9WzT121MVgkxupDgM2cw+UGdsEvRZ1w
	3Um3CxMR3mUjdpU3n+5CLactt8hGAY3QJwjWlm2WM5RA5h8tk+3zo3ELrbG5QjY2/VRhjIA9RWH
	1u4162j+x4rRJVkQtFz8qLChvRlrY5ZcpIYFaxSk/RxHTcyOzaBiWdd3rp0otMIkcZhDJNwQPtm
	igLeSlVWioKW4BpjjCYrCCPyPKldLyqgRemBCnhPIMioNLD7QgDkC1lnrhKL3Ppch0fqfi5zNz9
	DSLN64K22HgkgS3XUcg8lDM5wTS9n8LMd24QqbBYWk9u9BIHWT9hk1rmiH0Ef+EHWNgi5hnbnQT
	FCKFwnExhRoA+AhDX4/ljohrnyCCqPlbC+rcIkFqSMMAvH4iHv2/L1YZZn0ABkkrnmmU7dUAJXW
	fSbx13Gdonblopuw66sKG1BL28kduigA/8ConYiX3rtB8XmpmE4fwbcXeENCtp62ocY0TFVaYWP
	kX7
X-Received: by 2002:a05:6830:82eb:b0:7d7:5748:b988 with SMTP id 46e09a7af769-7d76a7bb6e6mr910749a34.35.1773199171150;
        Tue, 10 Mar 2026 20:19:31 -0700 (PDT)
Received: from [172.26.252.3] (97-118-253-141.hlrn.qwest.net. [97.118.253.141])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76ac8e5b4sm836962a34.12.2026.03.10.20.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 20:19:30 -0700 (PDT)
Message-ID: <67328661-4885-427d-b481-065322c04935@gmail.com>
Date: Tue, 10 Mar 2026 21:19:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] RPM 6 in Wrynose
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 "Matthew Ware (mattware)" <mattware@cisco.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "Elliot Sparling (esparlin)" <esparlin@cisco.com>,
 Robert Yang <liezhi.yang@windriver.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 adam.duskett@amarulasolutions.com
References: <SN7PR11MB770572B1859AB0B7EB592DE3CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj9Y0Fk_DHxTcP-2cqmYnzcD4_VSg5eihwXp1Vc10HbREg@mail.gmail.com>
 <SN7PR11MB770587ED31BE8EE18D973740CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <SN7PR11MB77056419029EAA594968E1DECD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj8uCJWnkhvh=CecWiawWd57k15wdqcfzc3mtbxoMFqSHg@mail.gmail.com>
Content-Language: en-US
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
In-Reply-To: <CANNYZj8uCJWnkhvh=CecWiawWd57k15wdqcfzc3mtbxoMFqSHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 03:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232834

> What makes you interested in having these versions in Yocto?

Our team is looking forward to RPM 6 [1]:
"Support for [...] PQC keys and signatures"
"rpmsign can use [...] Sequoia-sq for signing" [2] 
"Fix non-deterministic [...]" (reproducible builds)
"Crypto modernization"

[1] https://rpm.org/releases/6.0.0
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15690

Clayton Casciato

