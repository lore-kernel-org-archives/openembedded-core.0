Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.483.1586816321136206233
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2020 15:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gggiUxoY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id k11so11349373wrp.5
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2020 15:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=DF616Ix3xD3ojHcO+kW5HEZ+8oHdDBos40IcZ0rklHM=;
        b=gggiUxoYnUPpVnDFG10XyXmPCBoTLF15Ogug71rKxKWtaGG3APHr157/CrquAWWiI/
         VHZcECZ3g06aj7CsGTqerxD70bLXk3bfLdu6Uae90GZDq2dQn53tITn7eOAL2BsD5beo
         +ADFpBih4VB2uj/Am7oEYaupcNvufsuGXZ1/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DF616Ix3xD3ojHcO+kW5HEZ+8oHdDBos40IcZ0rklHM=;
        b=lC8Vfd4a1uLp/y2RxzjXcQgT4d3afA8/KFpb81//uvJcIh/2cA1owC39QUOkyTvKyq
         NdyZlRLYrRfmfJmVnITPFqT1nFd0SBzg1RS8kmBr0zzDY+GfI0HoIkyqL+dupiSVQiSb
         GciKvljdC+IQdd3NE2enI6VxowUq61NSFKesHXm2HyUVz+UpRZFHpoabSkF+L4+wkxO6
         ybu5H7yJArdMzYuB9UMqUDKJffArdVkLzXtXW9LpVo3bGTBYMxmemqLBiR6HyMmk1fno
         /c5s/qyXqU576zF0wXzwFtaEJPKE7VHsoAUgw3A9TGZVpzt4XwVgk5pVEtj9/jDF6C1j
         7VyA==
X-Gm-Message-State: AGi0PuZRfTAItC0SGGnKV098rWFJSebNo7QyUFIQvqPGGMW+EhzYaqCQ
	Lu4uSR5eqcy2oVzXWikvue2OCg==
X-Google-Smtp-Source: APiQypJ47PbWgOzHqeHqgemC6lRFlELPfgwuB24tjpJwQNCnzW8F6OBMAkjFVjtfBiNtLfWshTc0Lg==
X-Received: by 2002:adf:bb94:: with SMTP id q20mr22344726wrg.105.1586816319639;
        Mon, 13 Apr 2020 15:18:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w17sm8106837wru.20.2020.04.13.15.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 15:18:39 -0700 (PDT)
Message-ID: <adc5c7b96326ab21bda3d1b69478ab745be8e51f.camel@linuxfoundation.org>
Subject: Re: [OE-core] looking for clarification re: "rm_work" features and variations
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Apr 2020 23:18:36 +0100
In-Reply-To: <alpine.LFD.2.21.2004101340380.7834@localhost.localdomain>
References: <alpine.LFD.2.21.2004101340380.7834@localhost.localdomain>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-04-10 at 13:52 -0400, Robert P. J. Day wrote:
>   was looking to expand on the whole "rm_work" documentation, only to
> discover i was profoundly ignorant of some of its features (don't say
> it :-).
> 
>   so, first, there's the basic stuff (which is already in the YP
> documentation):
> 
>   INHERIT += "rm_work"
>   RM_WORK_EXCLUDE += "pkg1 pkg2 ..."
> 
> then in rm_work.bbclass, i see this:
> 
>   # Recipes can also configure which entries in their ${WORKDIR}
>   # are preserved besides temp, which already gets excluded by
> default
>   # because it contains logs:
>   # do_install_append () {
>   #     echo "bar" >${WORKDIR}/foo
>   # }
>   # RM_WORK_EXCLUDE_ITEMS += "foo"
>   RM_WORK_EXCLUDE_ITEMS = "temp"
> 
> of which i was totally unaware, so let's start there. the above
> suggests that recipes can configure, selectively, what in their
> WORKDIR gets preserved, but it makes little sense to set that sort of
> thing in an actual recipe file; it's clearly the sort of thing a
> developer would put in a local.conf.

I'd suggest this is more of a class internal and not really aimed at
the general user. There are things which someone might set here but its
not common usage.

Cheers,

Richard

