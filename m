Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.6707.1616853257656252499
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Mar 2021 06:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MGW5aYgz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id x16so8325090wrn.4
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Mar 2021 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=WvjX6HuHU6FnZtaZMA1C/GhE2ytzP5KVg16iOeLCWUE=;
        b=MGW5aYgzzjqMGQidMECQSPIiADU0HFIehSXJ6c9+X24R7mqIB5hpshScfG6RIazEMW
         VVXihKIAFLNMlE/D9V241l0BqFGUBJlCBtkStWne+1eyF+jKhlG04YNvO5j8I2ZGeGLn
         8N3YzdIWYLrYY/QH2jXOdgbC6okrRjWBN8sxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WvjX6HuHU6FnZtaZMA1C/GhE2ytzP5KVg16iOeLCWUE=;
        b=otFTuJ7JAGrwLK2M0Llgdjy23XapbxC45ZCBu8XRZDt/qRgr2MuH3fJPIde17TOYyQ
         mS1HOecWyXxkMNNWJQpHr8ouM9Os4WO7qfuVWkUaAeBPqff+2SPBHkjdbcSK1Kr8HcL6
         PSIUnKTH4qY5OnuYWJFXWumDYlvNEfiYPEyg/B3w/bvNbskwzlhWdKOzhU/4woO3U9MN
         6We/CPeuticAHr1JIWL+U5sp0EzdII5zA6jX4oxnHyLujzOdpF+Q+vFMVqWDUHZnrBBx
         kIAayrp++la67o4CXoJg93ycBKGpVDSoAaWvthxtG1+CTTdVxgjUpIqSMtg9Jcrw6n7t
         joSA==
X-Gm-Message-State: AOAM531rIeXREB0p3XrtLZLHQ6p1zrl9rd+vMb7kNRaVvcZJ/fjgUqZr
	WD/w1VCH/Fbcuu/SzmO3WB0dSA==
X-Google-Smtp-Source: ABdhPJxIgm3s1rkwzQThtw9Yo6ev8o83ACPwjdwgi6JpqVloIayAeDsZO3nW/Dtt7Xjduz9MEJsZmg==
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr19480570wrn.315.1616853256098;
        Sat, 27 Mar 2021 06:54:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4383:e4a6:1ad5:5e4a? ([2001:8b0:aba:5f3c:4383:e4a6:1ad5:5e4a])
        by smtp.gmail.com with ESMTPSA id o15sm20518231wra.93.2021.03.27.06.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 06:54:15 -0700 (PDT)
Message-ID: <5d8f977d40c22d068dd8aa23e8d1f145752aebd7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib/oe/utils: ignore stderr while checking compiler version
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Lars Poeschel <poeschel@lemonage.de>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 27 Mar 2021 13:54:11 +0000
In-Reply-To: <20210327014118.2874876-1-poeschel@lemonage.de>
References: <20210327014118.2874876-1-poeschel@lemonage.de>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2021-03-27 at 02:41 +0100, Lars Poeschel wrote:
> From: Lars Poeschel <poeschel@lemonage.de>
> 
> The functions for checking the C compiler version call the compiler with
> the --version argument and capture stdout and stderr to extract the
> version information from that. This does not work if something goes
> wrong for the compiler and it then prints some warning to stderr. The
> following regex will certainly fail in that case.
> It is better to just concentrate on stdout where the real version is
> printed to and ignore stderr. So we have a chance to get a version info
> even if a waring or error happened.
> 
> Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> ---
>  meta/lib/oe/utils.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

What kind of warning/error would a compiler generate that we should 
ignore here? This seems a little odd...

Cheers,

Richard

