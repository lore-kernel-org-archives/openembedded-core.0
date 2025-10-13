Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EACCCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 06:51:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.37036.1760338295553391074
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 23:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iUAR5xeS;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e6c8bc46eso23465605e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 23:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760338294; x=1760943094; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y78E6QfzOGpmr6WzINQGm1YUEJ2imrMhTPzbHvBYjKM=;
        b=iUAR5xeSX0WudNQ41SRsGxli1AvHWREnfza27RT1VmFZrm5WXLUgFMVsR8/O2zX6mR
         t1wwL1VWSenN+J3zc/Yq+Hw4VO3XtmLddyFhxqS4nD3uk0kuCZ5E2ZKFpdyalY/jxyFI
         l26sOtDlVWzeybohb8Gggfn7JWxsu3rr40YGv4iemXsVHd5Fdx8D1iYWfWA9oGeQ0BKW
         J7J7EB7a5SzmlvJ1IQpao09+qcbH+HC7Eqb4asrB8x544mAyA5o0R3SsT+tS4QgA4kBg
         S/159bReqvKT1KyJaBq3280UEwnD8q1+SUbgxU9Hf782dzVCMakuqMRS1aysQ5FlC3m0
         gH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760338294; x=1760943094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y78E6QfzOGpmr6WzINQGm1YUEJ2imrMhTPzbHvBYjKM=;
        b=fJZFxl5r/2WGcwKzBvUfQF0Ka2f66Tw7PjlolhH78aF/5jZeBYHD0LDgOC2eI3ogm6
         0ZCvSH5hnYNcljzaIk2ye7bz+gYrHQWDsdAPuOeZEm6TUdhrIVVszyFojH0dVx/AEflK
         5bZGI82m0Gcn6vta3cqHJxM8OEHGHSmWj6EN/EHOlRZamkCuooww94SJ1d1kfcvObFMC
         zbm+8GBOwbCxrYIFVcgkFyJKNE52hS8UK4eSyzQg/8G+43HJTzvEKjBgFxn6k+E/UIym
         4TgLY0NijD2lgLqVCu4lB6P51f7rQc06umCcd6qqSyDTc6c8W242Ui74gfUWy8L5lQgI
         WxDw==
X-Forwarded-Encrypted: i=1; AJvYcCXWji5uK7QhC4Jou/zAeZyxazyvV2wUesVa5no+xHPMZTqCXO0PdG8gY3Lk7djpZJEql645iT/ybibl4Uk/FjQKvA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzkmFFeoRICI+06ZfG8FwN/tbxw5//kGOhXryPorhpjW0TZ4qL/
	8M9N2W9pbZ/ClrOiOfBzeKMKq8XzovWM0iOSp/FHARQV5FY3I4fuFkV8
X-Gm-Gg: ASbGnctfSTVNqxw6hWI9DCiWY8kfxQBIPJseUas5czRl7DY1eG+hpHhE78lCWj6U9/7
	Sk2fcD2gHxadKCYitsWf+exV5n+SPhRDp+gNg5PVBGHdXzhcQ6gpQVqjFRvD3GHyJ8dWgEUUGKH
	1P5xFFce8+qyEnAPKl2d3mRTkPlGlwnUoU0NqDfL4eMX9D2tqQ9A1BGVqReWaBqOG47BpUq4oAu
	Q55cAufNqctkAkcNSHFfPssj4VglPxjY7MjgtrG7KKIGNhE1nJDR4DpJJa4GlYoZMzdZKyY14eL
	tFZ3QVer67glKR9rbRGTzMl54Ec0VUmhrQjdP4fUV7ox3M8UlKtQ0BKUJOPctZmW8sH5Q6VW4k5
	VyuNacFwg81gvGIbMMi6fFkYyMZNuGkPRIdl2P5x8siJcAc1jtofI6x2Bd7p1
X-Google-Smtp-Source: AGHT+IFLdtLrGL3d3aF9Nee8jGyiJT7Wn9katjy+//rBVyhqrH4jn2zJxnM+z/33lgLmpXh7G/N4Tg==
X-Received: by 2002:a05:600c:a104:b0:46e:4329:a4d1 with SMTP id 5b1f17b1804b1-46fa9a945abmr99205605e9.4.1760338293558;
        Sun, 12 Oct 2025 23:51:33 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab633cdasm119271275e9.9.2025.10.12.23.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Oct 2025 23:51:33 -0700 (PDT)
Message-ID: <840d03e1-ec3c-4e51-ac00-7a50696987ce@gmail.com>
Date: Mon, 13 Oct 2025 08:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] 1/2] systemd: backport fix for
 handle USE_NLS from master
To: emailaddress.ashish@gmail.com, openembedded-core@lists.openembedded.org
References: <3495.1759728792995913135@lists.openembedded.org>
 <6802.1760333540954833228@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <6802.1760333540954833228@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 06:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224762

Note that the maintainer of all stable openembedded-core branches is
Steve Sakoman.
Your patch is part of his staging branch[1] already, and chances are
that it will be included in the next release.

[1]:
https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

On 10/13/25 07:32, Ashish Mishra via lists.openembedded.org wrote:
> Hi Gyorgy Sarvari, 
>  
> Good morning.
>
> Would request to please consider this patch for merge.
> If you have any feedback / suggestion, please feel free to share.
> I will work accordingly.
>  
> Thanks,
> Ashish 
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224755): https://lists.openembedded.org/g/openembedded-core/message/224755
> Mute This Topic: https://lists.openembedded.org/mt/115565555/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


