Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.11286.1614354778369829067
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 07:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cF+zJ0Xg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id w11so9018886wrr.10
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 07:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=2l72j7o3w3UaP1VCJb8Z86A2tLgq0AKtXaLfH+eiiGc=;
        b=cF+zJ0XgLzPnbz4JHzQJT5oIWMflcaE1YsPKdTqxYBSd+mSScZlOjOh6ZVUEA10Dp6
         UM+rpaJYjpntX6PeXaDptTwwk41aO9pcCwyWO1+APGPh+3cNOXmk/BNuTOBkfOOc87QN
         2TLnU8WhhqbuPX+DNIKbuWrh/v25gubDqkxTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2l72j7o3w3UaP1VCJb8Z86A2tLgq0AKtXaLfH+eiiGc=;
        b=avf6TYwYz8ATG2upNLDlC7rPnkajBQvq/oKTABDg+OvSV7VoFXlphwC7/Lj4E4d/YW
         G127yz0XRT0nFtFvH+M3KbxzQkT6eEgK7/XpWTUhvaVQPmh+XztyOaV+RndVVr6IiT/2
         JKjbICTQFDt/5Dzsg4F15ysbzbYSmIW+iboA6yHROGUjL6w1Co4jFEodzQhV6z83hOE/
         +0kOFjqPwXEhPQLP0S6JBQ5KZW6/IkO9e8+Acmb1AKDaX+bR8tRBj02whluNFDky90g0
         I2sCHIyrUrA7OMjX9QnxOilTJ3Ka3X++0Jmj5p7tk63l7t8YhWXrwYFCXFeYTkt2mqgC
         YL5g==
X-Gm-Message-State: AOAM533s0WWGxR8gwllVzL15V5BElRBRQn7yOuQUTh9x9hnZgLDbMzsL
	cUYZcV54ysqZezTO+rIYPd7vMA==
X-Google-Smtp-Source: ABdhPJy7vbx3O/djQ1zOcEA/T4w2+OJo6zq2YCzyfeKuvgv+FeE7Q6+32p+Qe+ibQ1AwOJsoDqRtpQ==
X-Received: by 2002:a5d:6b45:: with SMTP id x5mr3750418wrw.415.1614354776686;
        Fri, 26 Feb 2021 07:52:56 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f? ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id n5sm11585920wmq.7.2021.02.26.07.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 07:52:56 -0800 (PST)
Message-ID: <a20dc0e4746c01215213b7f1939a4f1198db769c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] vim: Improve reproducibility
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: oobitots@cisco.com, openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2021 15:52:55 +0000
In-Reply-To: <1666535551897E27.6890@lists.openembedded.org>
References: <20210222164211.23449-1-oobitots@cisco.com>
	 <1666535551897E27.6890@lists.openembedded.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-02-23 at 08:32 +0000, Richard Purdie via lists.openembedded.org wrote:
> On Mon, 2021-02-22 at 08:42 -0800, Oleksiy Obitotskyy via lists.openembedded.org wrote:
> > Override awk and perl path to avoid
> > using local absolute path.
> > 
> > Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> > ---
> >  .../0001-vim-Override-perl-and-awk.patch      | 34 +++++++++++++++++++
> >  meta/recipes-support/vim/vim.inc              |  3 ++
> >  2 files changed, 37 insertions(+)
> >  create mode 100644 meta/recipes-support/vim/files/0001-vim-Override-perl-and-awk.patch
> 
> Fails in vim-native unfortunately:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/26/steps/13/logs/stdio
> 

I'm also a little puzzled as vim reproduces ok in master as far as I 
know. Which configuration produces the issue? Is this a /usr/bin vs /bin
issue?

Cheers,

Richard



