Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.199.1612909473620502938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 14:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=akPIKzkE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id m1so166058wml.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 14:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=jZe3a29ULkVw3x4qCuESStUjLltqxplSOaMCKAvyKUg=;
        b=akPIKzkEkspu2IOK+nidwQ9qTdqZG4bOyFfRG2FYRBE7akpH498K0pcf3fEeSt79xa
         1XCpqW0nyvT4ScYzaaqwX3xhPMgvU0i5y2v74/ag3zZXfXE1DfW8giWNEum5Lh9R6oB9
         /i5R+3OUShs4R+dbWPD9B/GMHpGO/j2dEbATU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jZe3a29ULkVw3x4qCuESStUjLltqxplSOaMCKAvyKUg=;
        b=Wv0hwoKmOQWXOqMNN8UnZLOYp/YfdkbKptmnWErKx7e/lsK9GnqqAvwPb2QSejXIf+
         4pQZO2fH/n+mDHh7ESTdmMUgwcs5oi4vBXSt6xx8oaMBYnDYtlx/htC+vt+Rr5wcAUqO
         QepB4uFTXFbmjZ9Gwh6AO5uPKL0HDJxVe59ydoPDhU7LGumdfLDo1kh+MwWQxq2lhgXP
         WrCZoLMGBoV0s8YYkUmNHXawbVaIDYTX/0KF7I0EZ55R1goL//yevT2CD2/p5FSjTNMz
         3+Nxmf2LR3mdG+ed8wad1LXjGEOuyzdgUCWLSKqY2nmo6llEQO6FZuzevsgiD9LrOCcT
         jyjQ==
X-Gm-Message-State: AOAM5321GRyl7PJq/rL6zSu2lfexNFJ+MyinuO6539xsVOkQJ8q5N9BL
	CcxdjiYxSRhlBJqZXTFhutO7iA==
X-Google-Smtp-Source: ABdhPJyHEJtJ2RG8AqFrfZg3NwlNvlhlL5Z2g/igFMI6Nxz/ptCEO10ayKrOjDxtD8e7rxnERK8wpQ==
X-Received: by 2002:a1c:6387:: with SMTP id x129mr228498wmb.84.1612909472038;
        Tue, 09 Feb 2021 14:24:32 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:486c:54d8:3bdb:bc7a? ([2001:8b0:aba:5f3c:486c:54d8:3bdb:bc7a])
        by smtp.gmail.com with ESMTPSA id t197sm9264886wmt.3.2021.02.09.14.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 14:24:31 -0800 (PST)
Message-ID: <86e12e50c3d95200a3192a56e4cac352832d97cd.camel@linuxfoundation.org>
Subject: Re: [OE-core] Build libpwquality without distutils3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joseph Reynolds <jrey@linux.ibm.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 09 Feb 2021 22:24:30 +0000
In-Reply-To: <f8302620-913a-2e91-b118-7881437aaeb0@linux.ibm.com>
References: <f8302620-913a-2e91-b118-7881437aaeb0@linux.ibm.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-02-09 at 15:27 -0600, Joseph Reynolds wrote:
> Dear openembedded-core members,
> 
> How can I avoid bringing Python into my image via libpwquality?  I need 
> to keep my image size small.  My bbappend uses EXTRA_OECONF += 
> "--enable-python-bindings=no" to take advantage of the source project's 
> configuration option [1], but because libpwquality_1.4.4.bb [2] imports 
> distutil3-base, my image gets Python.  I built a working proof of 
> concept that libpwquality does not need Python here: [3].
> 
> I tried enhancing libpwquality_1.4.4.bb with PACKAGECONFIG 
> "python-bindings" (so my bbappend can use 
> PACKAGECONFIG_remove="python-bindings") but can't find a way to get the 
> final value of PACKAGECONFIG to conditionally `inherit 
> distutils3-base`.  So I am asking for help.
> 
> How can I avoid bringing in Python via libpwquality?

distutils3-base looks rather simple. Offhand, you could:

a) remove python3-core from RDEPENDS when the appropriate PACKAGECONFIG
is set using the remove operator

b) replace the distutils3-base with the other inherits directly and
rewrite the RDEPENDS code to be conditions

c) propose a patch to allow the RDEPENDS to be indirected via another
variable?

Some of these work from bbappends, some are more neater but take a bit
more work to sort out.

Cheers,

Richard

