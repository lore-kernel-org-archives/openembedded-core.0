Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.11669.1602841612965849439
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 02:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MIy/A4R3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id t9so1975447wrq.11
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 02:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qrtPb/LC7Lp7KKKF6/oloIQresNq6HG0VOG0N9LWVro=;
        b=MIy/A4R33QrTtalrHG3h5F3JxaYBcb5t4pzX42g4ejyH9Jc/CCHFs2HigEhCFahiGo
         8Y6X3JjjsL1ykYWeSWbPmpWVllMUT3StlZ6qdPGpqMkIRmVE8sImxRfSgJaYOjdysmQO
         XHWYLgseYOGW8YxseYNX1x2JFCkRbdwsHJzgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qrtPb/LC7Lp7KKKF6/oloIQresNq6HG0VOG0N9LWVro=;
        b=GcSkXcz9Lqn7OG5XPFa21DNQvF96wq7el9z/rjXnTcwWX82zzGJ/TOf05NY8LdQOT8
         Lp20S33BrJXWc+yKzsTo7v6NvnsCYWQc8niKTiAzf1QOeDGUR8hY2BsjMHAK1J4e/M41
         2JFDPUt0eK4OjwxIIgb/1QG45P0PRCEdPCG9Y6QaiRmKOzqB3LdgBFIkvR7JG+cKJImB
         eE0vlycLJsR1Uu7eVH8/WgxajjCzGDQB+jOdZbNp3JdyS+f28JtiOlZMGsn4/micnNn/
         z8EKQuoa06FSR8Rsj0OBj7mGSJMirQzVLUmD2QbXi+oovyDuqtzWwmFrgPTK8I4lt1f2
         PzEA==
X-Gm-Message-State: AOAM5328LhUhecyBoz7VdP2YQK5/q+lKR8GT6BcIToQp3gjAVv+VksiJ
	/oe/2rcgD9KOXusXIYONZAsHIw==
X-Google-Smtp-Source: ABdhPJz66q1zDoYeXGyI3OH+pQaFKsJ//4e4FbtvwFWNrkXJxssHjKmM3tZocRYA35GvOATm+oSHPA==
X-Received: by 2002:a5d:550d:: with SMTP id b13mr2857454wrv.125.1602841611283;
        Fri, 16 Oct 2020 02:46:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7d78:e5d6:b970:ac7f])
        by smtp.gmail.com with ESMTPSA id z15sm2834177wrq.24.2020.10.16.02.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 02:46:50 -0700 (PDT)
Message-ID: <e490a2b55b22dc6b7716ab780a8ec81e739e9a7d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] waf: don't assume the waf intepretter is good
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Oct 2020 10:46:48 +0100
In-Reply-To: <CA+chaQdCL8b+rP_RuJxz+Kt2nqL79nqOQU_Oun4xXzG48J5nNQ@mail.gmail.com>
References: <20201016092122.2002294-1-ross.burton@arm.com>
	 <CA+chaQdCL8b+rP_RuJxz+Kt2nqL79nqOQU_Oun4xXzG48J5nNQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-10-16 at 11:45 +0200, Martin Jansa wrote:
> should it also inherit ${WAF_PYTHON}native, so that people who need
> to use python2 don't need to inherit it in the recipe (as python is
> no longer in HOSTTOOLS) or is python3-native considered unwanted
> dependency for the default behavior?
> 
> I don't personally use waf, so no opinion either way from me.

We need python3 for bitbake so I think we don't want to include the
native python chain here if we can help it...

Cheers,

Richard

