Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.2762.1600759452454331388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 00:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LJdpXjYZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id z9so2213873wmk.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2020 00:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=k2a9MCmBPnRli7mgE3UTEImg/kOE8OvDeXiK6i3NRNs=;
        b=LJdpXjYZAGqHifnBb4+72O8MgOSCWiaMkqLGxeW2YmGxUtC/hDLdHfawABQMP0jgS7
         PdQb/XzTw186bUP9eFh92nmcDqp3k+LvTMTn2pJo+1WllCLNZoQkEpgs37vIGRhECyQD
         KI9dp8lOwTIVaawjAHo9oOh1ztNVSA2Q8DwgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=k2a9MCmBPnRli7mgE3UTEImg/kOE8OvDeXiK6i3NRNs=;
        b=j6y8X1FLJGJpg0wK0SnDWMbjq4dBe1BpZ8I6kkbPUmnDxCDLJtVW5eciJ3V/rcuabs
         XB6NSAsozrPQrl2/cmxjqRKNAWRtrUa/yLm7OtESXuMK3Z7VGBphZ1M8bMw3mlpaqBMQ
         MomIPUYoFaiOf2dXUAelzGKry3mWT2JsssVlq+18B95SeWzeEOQLzS/AvTfvplT8fNpE
         vwP8gJQwA1i5KHEcX0vysyW66e81cRKAEH0RCryBUabdJvzd4+WAA3+mzr1+toPISlnw
         +IDTVHyKMk2rRJdK85BebtCAuIPYdzJSGx9q8Y2NeuSXMvEIm/9P4pwNNpE3dw7ItaXu
         yLrA==
X-Gm-Message-State: AOAM531MljHOSnYNnEJi4lxAR975hE8KbfIZVflwBEK4vDb68u606po4
	i+s354ktFVwKSZMRh0fjuvsM9Q==
X-Google-Smtp-Source: ABdhPJx1muoIZUo+UFrVIjDICL0zJlYH8KpqTFmyxDW0liSRBjOM/WExOfcioIcoSW6rNufEB7mbuA==
X-Received: by 2002:a7b:cde8:: with SMTP id p8mr3010248wmj.106.1600759450639;
        Tue, 22 Sep 2020 00:24:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.4.9.1.b.0.3.3.1.2.9.4.4.4.0.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.4.9.1.b.0.3.3.1.2.9.4.4.4.0.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b044:4921:330b:194d])
        by smtp.gmail.com with ESMTPSA id k12sm24845520wrn.39.2020.09.22.00.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 00:24:10 -0700 (PDT)
Message-ID: <b90b4250a950e807bc4b85f6cec0e3d56cecc095.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/3] Import two python recipes from meta-oe/meta-python
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2020 08:24:07 +0100
In-Reply-To: <d8f4dfd2-7a48-6f96-bcfd-0b17989886a8@gmail.com>
References: <20200921121204.2443466-1-richard.purdie@linuxfoundation.org>
	 <d8f4dfd2-7a48-6f96-bcfd-0b17989886a8@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-09-21 at 23:57 -0700, Khem Raj wrote:
> 
> On 9/21/20 5:12 AM, Richard Purdie wrote:
> > We have a slightly pressing situation where the performance test builds
> > are failing after we cleaned up the system installs on those machines
> > and tried to switch over to buildtools entirely.
> > 
> > The issue is the need for jinja2, complicated by the recipe's ptest
> > dependencies. This series imports them with ptest not inherited, the
> > idea being meta-python can bbappend and add the inherit.
> > 
> 
> this seems to make this recipes inferior to what they currently are, 
> IMO, while it solves the OE-Core usecase, it is ignoring wider usecase 
> it has already been addressing all along. So either bring them in full
> or leave some bbappends in meta-python to keep features working for 
> users who are using it.

I discussed this and Tim/Trevor are going to replace the recipe with a
bbappend in meta-oe to ensure that doesn't regress.

Cheers,

Richard

