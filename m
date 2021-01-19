Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.10679.1611059847160938006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 04:37:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U/9MTF9R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id u14so12363585wmq.4
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 04:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=4dGzn4t4msHf4a+DhD/1D7oaBuMznMRx2kIHxRM6UeE=;
        b=U/9MTF9RGn3/hGPHZrOUM8bBDnDujZs5bnsM9tQ5oJyfb+ML0jVoaZ0taJsDbl3YSE
         u5YohC52jh8ToQjeuMErDKH6a2eL9nxkYa42cxtVSkkzirYlmmGaLU8fuXRF5IHiuDFe
         gIsrlSoeU7ro8HATG5FMef8BOpT0p8cEP4LT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4dGzn4t4msHf4a+DhD/1D7oaBuMznMRx2kIHxRM6UeE=;
        b=g/YoLCQ7upzoQ1SyRgb3H1CYmP44PsXwfaKy49umnoK1NIom1dZicZ2ZosubRg0CwY
         e8T0KsTd7u0AlECJArql8jpaWZH7QNpinu+z9We1xVcxAxLsh+odWRe/rZDBRttbMS+v
         RKwOi/mNc3W7+Xl94B7EK1h8imtmzXQBYLPgn1DA+Ku3t0RzAENd0wlVf7dl3+st5FHM
         UeghmMnoOAY1sSTPG7uHMA52aA04OO5r0iNDHEXiz2vOVoMGvF5ylp8QMhmzLcNUGUmQ
         N/vjsrczatX5iegQqo/+jjPNxTrNJOpWAb8t0Iwh78XrD7Yo/AfoFFwjf3zSPW5J9gnc
         9Faw==
X-Gm-Message-State: AOAM530+9NRdCZrrcqyz67NkR9CDPsY3A9sX2tczS5hQxdl3MquG1con
	OQAmlYyx040jItxmRcgpacUW5Q==
X-Google-Smtp-Source: ABdhPJxNWz4HygMEdxEJnc18JMQqNlqMpWZ5FzlAm3Q+VN9r3pj84wMcDG2Zga5IBf+VZg1oS35Llg==
X-Received: by 2002:a1c:2341:: with SMTP id j62mr3983493wmj.34.1611059845541;
        Tue, 19 Jan 2021 04:37:25 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7a4:851a:48d5:440b? ([2001:8b0:aba:5f3c:f7a4:851a:48d5:440b])
        by smtp.gmail.com with ESMTPSA id z6sm36957717wrw.58.2021.01.19.04.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 04:37:24 -0800 (PST)
Message-ID: <926f9b256f3f8700caf9d4e31f49e68044c0cc64.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] tcp-wrappers: Update checksum for SRC_URI
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: zhengjunling@huawei.com, openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2021 12:37:14 +0000
In-Reply-To: <20210119062545.625-1-zhengjunling@huawei.com>
References: <20210119062545.625-1-zhengjunling@huawei.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-19 at 14:25 +0800, Junling Zheng via lists.openembedded.org wrote:
> Commit a11edd68b2 (Change ftp:// URIs to http(s)://) changed the URI
> from ftp to http without updating tarball's checksum, which is
> different between them unfortunately.

That seems strange. I tried to reproduce:

$ wget http://ftp.porcupine.org/pub/security/tcp_wrappers_7.6.tar.gz
--2021-01-19 12:33:34--  http://ftp.porcupine.org/pub/security/tcp_wrappers_7.6.tar.gz
Resolving ftp.porcupine.org (ftp.porcupine.org)... 168.100.185.123
Connecting to ftp.porcupine.org (ftp.porcupine.org)|168.100.185.123|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 99438 (97K) [application/x-tar]
Saving to: ‘tcp_wrappers_7.6.tar.gz’

tcp_wrappers_7.6.tar.gz               100%[=======================================================================>]  97.11K   295KB/s    in 0.3s    

2021-01-19 12:33:35 (295 KB/s) - ‘tcp_wrappers_7.6.tar.gz’ saved [99438/99438]

$ wget ftp://ftp.porcupine.org/pub/security/tcp_wrappers_7.6.tar.gz
--2021-01-19 12:33:46--  ftp://ftp.porcupine.org/pub/security/tcp_wrappers_7.6.tar.gz
           => ‘tcp_wrappers_7.6.tar.gz.1’
Resolving ftp.porcupine.org (ftp.porcupine.org)... 168.100.185.123
Connecting to ftp.porcupine.org (ftp.porcupine.org)|168.100.185.123|:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD (1) /pub/security ... done.
==> SIZE tcp_wrappers_7.6.tar.gz ... 99438
==> PASV ... done.    ==> RETR tcp_wrappers_7.6.tar.gz ... done.
Length: 99438 (97K) (unauthoritative)

tcp_wrappers_7.6.tar.gz.1             100%[=======================================================================>]  97.11K   295KB/s    in 0.3s    

2021-01-19 12:33:47 (295 KB/s) - ‘tcp_wrappers_7.6.tar.gz.1’ saved [99438]

$ md5sum tcp_wrappers_7.6.tar.gz*
e6fa25f71226d090f34de3f6b122fb5a  tcp_wrappers_7.6.tar.gz
e6fa25f71226d090f34de3f6b122fb5a  tcp_wrappers_7.6.tar.gz.1

So the checksums seem the same to me and match the recipe?

Cheers,

Richard

