Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.15385.1586084673537205079
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2020 04:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ujh25ZU1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id h2so3712460wmb.4
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2020 04:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zU8okfkpis3SLV6JatksFP2o5WEBUG3CixMsXesKrP0=;
        b=Ujh25ZU19XJ4DUViBO7IxD/LC948eAV+CO661rFHsltEtQwKVyaoWcP2MfAWZJpL/i
         zIhTeL3V3HVeffMt+tj6GnG2ydrQR+bwf7sm5g8PXffGHczGoMTL4Z/gZjKoyc/bbSSB
         qsdjgU7t75GoU0xvRBmZ21xZ1cgiaDwTsgj5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zU8okfkpis3SLV6JatksFP2o5WEBUG3CixMsXesKrP0=;
        b=OTCovafTNENdeno8nqKToFeMrgIlISdBvf8tya0SAvVe2HaP9J5ufGU19DAhBdrFvy
         r3MmqYMuC0RO84q0tpR0cqCp7hQxkCTKkdJsKXTXOsoKw3eS54hjnudMdVOnLM34eE3B
         VfE2WJL4fA9Vw3pWDMAqiI9jQqv4gLXBv4zIPNhikQq0AmITFFJaXm3wMLBkFtxbiSDS
         KAZW2Wy6NljkjCzceO0YZeAZuQ+ce54euCFK6iVzmxG+IER7bc07D4scyVjB1Gv+zWG8
         nvMCCjYoyBmJibcQvQ5lO5blt+Ay46MTaQoc3ORP4N/eH4UUHirqXek/W/8if2sIGW7P
         JnZQ==
X-Gm-Message-State: AGi0PuaKBPI3jFuyH6Nlpth4/m2Z9DLsvH8v7jGLiBdbxQyaYrSU8F/v
	socB3sQVj2iBJdVBYFziT4REmQ==
X-Google-Smtp-Source: APiQypIvU3CRWeg5SSVG/VuMS5CxGwUSrJLGYMhTLaubz/e3sFfOgu8cTwzcrkNIQfSElj8+WZHf8A==
X-Received: by 2002:a1c:5401:: with SMTP id i1mr17826896wmb.172.1586084671962;
        Sun, 05 Apr 2020 04:04:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w7sm21001286wrr.60.2020.04.05.04.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 04:04:31 -0700 (PDT)
Message-ID: <ed35318a96db8ac58bde7596f47bb0bfcd27b27b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] wic: Fix permissions when using exclude or include path
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	jpewhacker@gmail.com, Paul Barker <pbarker@konsulko.com>
Date: Sun, 05 Apr 2020 12:04:29 +0100
In-Reply-To: <CAPybu_2JFR2Q-id-7Fc5+p=RhKBbscMfEF11rE_yX0bmruqJvA@mail.gmail.com>
References: <20200304144936.2559106-1-ricardo@ribalda.com>
	 <8a556aedfe46e327c5d64d77c3b282f2108d12aa.camel@linuxfoundation.org>
	 <1602DB74B6717A3F.2403@lists.openembedded.org>
	 <CAPybu_2JFR2Q-id-7Fc5+p=RhKBbscMfEF11rE_yX0bmruqJvA@mail.gmail.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-04-05 at 11:56 +0200, Ricardo Ribalda Delgado wrote:
> Hi Richard
> 
> I have tried with master  (0c91fcba446418ad1f71d3df9aa3b186bbd353c7)
> +
> my two patches.
> Then I have used crops/poky:fedora-30
> 
> and: oe-selftest  --run-tests wic.Wic.test_exclude_path oe-selftest
> --run-tests wic.Wic.test_include_path wic.Wic.test_exclude_path
> 
> With an OK result :(

I worried this may be the case. There definitely is something wrong and
I could replicate it a third time too.

My guess is that there are perhaps files in /tmp/ which are logged in
the pseudo database but don't exist when the second rootfs is created.
Since the files no longer exist, the database integrity check fails.

Why that only occurs on Fedora case on the autobuilder, I don't know,
I'm just hypothesising right now...

Cheers,

Richard

