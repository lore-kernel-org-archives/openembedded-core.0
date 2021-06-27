Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.3687.1624831252121546436
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 15:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q+fZ+Zt2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id j2so18383193wrs.12
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 15:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=PxGNwAmTqzv5nUvSiPFU5LbtPBp14OXcag+tU3bJQXs=;
        b=Q+fZ+Zt2WpNsVMo/n2a/m5ZCB39Y6xzQJzjgtyU2N2lHGnS9yhDPxyEp78MUvScJqG
         LzQqIisKQ2d1ptwgz9vWZo35D6A5+sNV5th35lM+C3EpyvVYf4/6yj+YuKEpgnt5M82G
         hhF6pe4jeXWVbzjNxWUCRLusQkZoEdsdIZ1VU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PxGNwAmTqzv5nUvSiPFU5LbtPBp14OXcag+tU3bJQXs=;
        b=FPBHnTUwrMocRiKZJC3s+DwQX5McUnT0FzJyML7OTW/DJGvOx7sO/7QvxUJA0IeSFZ
         iLw7SMAeEsUm0kc5TJZ2L4W1ShIp01mLT9f7AkYdtOM8iiuJb3HHBSIVd0lC5LLWPlVp
         CmrEgaPlhk+fdC00UYQoT/qjLHZOqSBljK3CT5mZjVryiL5vhqIJg7FrBRpM6eLPytZr
         mkeIbdmQeun0LG762w7gZzu2KkrVRthgcljvdr+obmt0NH+fzrWBkWok4GQDDpjexYWW
         uP2ILaIuJCVGwKoTnsma9+KwBbBth13MrmOUv4S7tEQ0Fg89Tj6wuyvbZbju9r2gIVFK
         kfNA==
X-Gm-Message-State: AOAM532WX5N/5zEcmKKHEhPQnsLvknnb/+FJcU1jsD/Vf6WnoqkGumBH
	v8vy69syXta70bNuZCaB7CraNg==
X-Google-Smtp-Source: ABdhPJxmnEmQ22FuLaynmOeDXehnlVjhk4EdJ+UngDeS2J84ZPEPzhtIXzaZ09wx8ktbGcsiFGE8yQ==
X-Received: by 2002:adf:eacc:: with SMTP id o12mr23530638wrn.3.1624831250588;
        Sun, 27 Jun 2021 15:00:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6f48:4aa9:490d:a26? ([2001:8b0:aba:5f3c:6f48:4aa9:490d:a26])
        by smtp.gmail.com with ESMTPSA id v15sm17674593wmj.39.2021.06.27.15.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 15:00:50 -0700 (PDT)
Message-ID: <76618960f73199585debc705dfd09775472d38f8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] package.bbclass: manage external sources for debug source file packaging
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Frederic Martinsons <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 27 Jun 2021 23:00:49 +0100
In-Reply-To: <CA+cAkeoV-ncBLKpcGm4MKeuqYjSXyKsCU4NWdNTmO51iUAaqZg@mail.gmail.com>
References: <20210623130637.3314755-1-frederic.martinsons@gmail.com>
	 <20210623130637.3314755-2-frederic.martinsons@gmail.com>
	 <CA+cAkeoV-ncBLKpcGm4MKeuqYjSXyKsCU4NWdNTmO51iUAaqZg@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-06-23 at 15:09 +0200, Frederic Martinsons wrote:
> Hello, I would like to add a link to a yocto mail where I expose my problematic that led 
> to this patch series:  
> https://lists.yoctoproject.org/g/yocto/topic/83622035?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,83622035
> 
> After further research, I think these patch can be simplified by modified only 
> WORKDIR variable to be os.path.dirname(EXTERNALSRC) but I fear of consequence 
> to have WORKDIR outside of TMPDIR so I didn't take this path.

Changing WORKDIR would no doubt solve your immediate problem but would create
a ton of others :(.

The issue is that the class wants to re-declare S but some of our code makes
assumptions about the location of WORKDIR with regard to S (and B). There
is more inside WORKDIR than just S and EXTERNALSRC does really correspond to S,
not WORKDIR...

Cheers,

Richard



