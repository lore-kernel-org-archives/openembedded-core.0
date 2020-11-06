Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.9579.1604656931455190265
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 02:02:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RqzApX96;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id x7so681535wrl.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 02:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=EI+Tu/yW0HAcwRz5MnMM5WprQxXRtO+fKtrIShebw8E=;
        b=RqzApX96KAuYoA4v5E8hYuUtlPh5+cpx68yntHiRRaeA4aF4o8yxNERQjJZAieKWa0
         z3+7wYzpvpo9CYwfldbeVKC5126AHujaBvIsawGL6wuf4Z+LwugXKDI+mfbsb85p1vcJ
         faXbpWfIIbOfOYiUFbX3bOqU6c1S8lQg9Ymp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EI+Tu/yW0HAcwRz5MnMM5WprQxXRtO+fKtrIShebw8E=;
        b=LQuh/7mLqq4pnlrOruVDpNb7ZqlSptvZqZKynkflRuVa0MVxJOxCorCN3cx0h9wFbg
         txNp8UbwKCqw4wbq0m4lN+PgZMXoY+wrcrQ7c/X2Qq8/mXIB+m54bN+Exp/D3IJk1pqD
         rMPNsUC3r1Nv7Z6A8OTUJ6EF4fT8BzW7KE5NOE5OtpsqoSG+P2kAXVJKwuYHazmJBKE6
         x3lGpqfKexP372qnqTDUg3Eoeh7IRU/RtGZOwcSFU+IJXtXYc2JYtuTnK+fdnDkGn/bZ
         H66aUXDLOHtYGImeBn7DZBVJSR9fDiRq4VBHt8nsK4+tqPEX8Lq3bOaBIxm+PL6TTuAo
         24tw==
X-Gm-Message-State: AOAM533WpTDsTyz7OaNrjp2XIJ7oN1VeR4oKwlhijg+s6zcwnkDNx6oF
	yUZDDr2kjWZwKqCjqDFdGA1b1g==
X-Google-Smtp-Source: ABdhPJyau1dYDwqyBFqNcpyPytuukbZ9N6BcbR1Am0SGcoKyqpP1FSsObcIC59sftekXaZy1aE5G/A==
X-Received: by 2002:a5d:6652:: with SMTP id f18mr1667356wrw.186.1604656929891;
        Fri, 06 Nov 2020 02:02:09 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 8.b.5.4.f.1.8.b.1.d.2.1.c.c.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (8.b.5.4.f.1.8.b.1.d.2.1.c.c.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:90cc:12d1:b81f:45b8])
        by smtp.gmail.com with ESMTPSA id k18sm1318383wrx.96.2020.11.06.02.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 02:02:09 -0800 (PST)
Message-ID: <f75a25804d34913e592233c06a9dfdafe6be0830.camel@linuxfoundation.org>
Subject: Re: [RESEND for ML] wic: imager/direct: passno is set to 0 for all entries in the fstab
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Claudius Heine <ch@denx.de>, openembedded-core@lists.openembedded.org, 
 Henning Schild <henning.schild@siemens.com>, Tom Zanussi
 <tom.zanussi@linux.intel.com>
Date: Fri, 06 Nov 2020 10:02:05 +0000
In-Reply-To: <d99177cb-0258-dc14-6f39-8b00e2b64415@denx.de>
References: <d99177cb-0258-dc14-6f39-8b00e2b64415@denx.de>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-11-06 at 10:07 +0100, Claudius Heine wrote:
> I looked into periodic file system checks for ext* partitions, in
> order to increase robustness for systems that use those file systems
> and was  surprised that the fstab that wic generates that `0` hard
> coded as the  passno parameter [1]. This prevents for instance
> systemd-fsck@(8) [2]  from running checks on those file systems.
> 
> It seems that wic/mic generated a fstab with passno=0 from the
> beginning 
> [3]. What is the reason for that? Was it a conscious decision to do 
> that, or just copy&paste for a different project?
> 
> How would a way forward look like? Should a patch that changes passno
> from 0 to 2 be enough, or do we rather have this parameter
> configurable somehow?

I suspect changing things so fsck was run at every boot would upset
existing use cases, particularly on ext2/3 systems without a journal.
The only option would therefore me to make it configurable.

Cheers,

Richard

