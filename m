Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.439.1591807016008216008
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 09:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m+BB2HIG;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: uvv.mail@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id g11so1324241qvs.2
        for <Openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2020 09:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=V08/cYbTALmwqj4SBqM5pAnufp+S71h2XQ1q3bmrwtI=;
        b=m+BB2HIGbmQjO2MdQzvs8k+patr6EE7ce+AeZqYsQ/EiBgzFDDtudnWbBnbWQptPbs
         XvPHWwCpQob4KbHZikK2JFzeeIOLkHSu8nZOa6Yc4D7Ut8oIw2ZnGPlcEofPozmzXE4L
         bxZXOi2dcZWJsBWAy3bDJ8mE8j98qe6dKcMZ1kWxXDo1WUy2pZ/cU0HwLvZ8mImtTHKk
         WkLMHjO9S27DNtz9yZz3KPUFDcUfXkiFE0DmBmlYtYEiqF3In5qK9DWk/ubSW9f4v4hC
         1K42GFghM1hVhf/FHuox52LIKf1FJNQ53z5FHY4qT5w+mqk047XhU1Kps0cF2Z+FNKzc
         znzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=V08/cYbTALmwqj4SBqM5pAnufp+S71h2XQ1q3bmrwtI=;
        b=lvT6s7QIMtPMMpviwYKbK7xmJYWSCHeJ+Y1Mxn+tSW+nbXpASt7pLICOrJWPGVUd28
         808iDx5eelK2JXdlyvDdNs1yTb+SJomMRLJaawXL0wOKi8bBoFASU7dhXAi1GDLOMtXY
         s/djWhmkYpo46K1E2A2vqFA+B5soP3FOVIVQO0kJuy0l2aNdG0hf1mGqIgWB8T+nDgOM
         CQKyAYhL/2lI7Ff22/vr4btl9wFIJnaG8Ky+gbMXedjPNnaApbCZXOl7sRG5BOZIveom
         12rbHJP//fSJAn/jLjKGGLU41avwg1mCmKZlOviChAGfdOfRMn20KouVXireCytSYeQ9
         ERUg==
X-Gm-Message-State: AOAM530N2R2BgdiqIwXvB7lXXxB/8OVKhof48qqE3acbLwcVOTGjxiTQ
	plD+Ok2lwlPV6ZOkbXl0V7U=
X-Google-Smtp-Source: ABdhPJyZy3+AOUgEXwxfuHy+u6lqfdQRKYJLHEW9jRpOpNEv/btZheeG+nEQF47msnlcEudg4oosUQ==
X-Received: by 2002:a0c:dd8e:: with SMTP id v14mr3773970qvk.169.1591807015062;
        Wed, 10 Jun 2020 09:36:55 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from Vyacheslavs-MacBook-Pro.local ([37.120.205.180])
        by smtp.gmail.com with ESMTPSA id g9sm299656qtq.66.2020.06.10.09.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 09:36:54 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] dhcp: use included bind version
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
Cc: tmark@isc.org, Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
References: <20200610143520.2727827-1-uvv.mail@gmail.com>
 <6dd0de0be72028b355cd759e40fee22c9d24ca7b.camel@linuxfoundation.org>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Message-ID: <b10c95a7-5d8b-d922-ad40-6d97cceb9c85@gmail.com>
Date: Wed, 10 Jun 2020 18:36:52 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <6dd0de0be72028b355cd759e40fee22c9d24ca7b.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 10.06.2020 17:05, Richard Purdie wrote:
> You seem to disable parallel make yet no mention of that in the log?
Right, I forgot to mention that in the commit message. Building bind at 
'compile' stage breaks parallel make. I assume that can be addressed, 
but I'd need to take a look at how to set that dependency with autotools.
> Why doesn't dhcp build and link against a static libbind by default if
> these issues are present the the dhcp authors don't want to work with
> such libbinds?
That's a good question. I assume the alternative is disable threads in 
bind recipes then a shared library can be used by both, dhcp and named 
(DNS). Hopefully Thomas from ISC (in CC) could clarify this better than me.
>
> Cheers,
>
> Richard
>

Regards,
Vyacheslav
