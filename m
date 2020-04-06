Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.7238.1586163619754221752
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z491GIhN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id i19so14934267wmb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=38aDBOqYptKw7aJHHamJg/AEybIdVHcDBTP9lrGxM5o=;
        b=Z491GIhNXKkiSlhKyOmpFt9qGwfof8poOoD1S8tiK4LPGNf4mZiaJBFk0/JqClOzol
         aJr2lxzybSHFCPw5geAyxBhlqG0XqTJjQLXozyThlQJIfjgEZROIOhmbz4u7jdlRt1t9
         oiv7WOgmSsjjr2t4+Fd17p/k9xKtTaEicYXK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=38aDBOqYptKw7aJHHamJg/AEybIdVHcDBTP9lrGxM5o=;
        b=lZHNcBW+7jpdkyWXErPaCwh2RJS8d31pOoNiMbnvyzd6gdYLe3cyPZGaBTkIo2faXs
         pI4EQ6UjjqtDBVpZkhsVbek1XL2ixFRH3AlMeMuS1zBbZF/Fk3ICMxVzt9Q8NsLORBxI
         ZC0eGwDF+ZKE/khY+lw+vvml82KTzmS2EnBI3UpMu6Aoeq2682g2PZVo9/D7LaBEvwYh
         UTraDhF8oSXwtsSqc9sEuZWkvd7iwtBjnxLPFkJ4ngG1qkoP0MF2IUtFJLJgFpQ8G/CV
         /jn9/TcAGrkgAzbD18QQtpNUWeRnDZMfRLCMkESbTmWJ0nPhnfB/3Or/qSvFwZCabxmy
         5pqg==
X-Gm-Message-State: AGi0PubmTmUbAVvXDFWfDwyVvSyZsYPTT2mrxUikpQcvBfvlXbFtiMLK
	ekCFukdt6MqdJWgj+bwyqNWzjQ==
X-Google-Smtp-Source: APiQypIYo1KvZgSfqwCycHGmV4GTZD3fXpYPw7C0Gye1GVYo8pOzU8yLdfbdrAlWjJjV9NB5e1dMsw==
X-Received: by 2002:a1c:4d07:: with SMTP id o7mr9435710wmh.59.1586163618211;
        Mon, 06 Apr 2020 02:00:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id h4sm4606223wrv.91.2020.04.06.02.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:00:17 -0700 (PDT)
Message-ID: <0d818b09b16f9a1156643217599f6b774d1ebc17.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] wic: Fix permissions when using exclude or include path
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	jpewhacker@gmail.com, Paul Barker <pbarker@konsulko.com>
Date: Mon, 06 Apr 2020 10:00:16 +0100
In-Reply-To: <CAPybu_1ULyzXSJzYAHGRh7FeM9i0PX7g0N-v=XqeFPKJ8k0hzg@mail.gmail.com>
References: <20200304144936.2559106-1-ricardo@ribalda.com>
	 <8a556aedfe46e327c5d64d77c3b282f2108d12aa.camel@linuxfoundation.org>
	 <1602DB74B6717A3F.2403@lists.openembedded.org>
	 <CAPybu_2JFR2Q-id-7Fc5+p=RhKBbscMfEF11rE_yX0bmruqJvA@mail.gmail.com>
	 <ed35318a96db8ac58bde7596f47bb0bfcd27b27b.camel@linuxfoundation.org>
	 <CAPybu_0W9FAQaH17X7jt7+cJU05XaD+3J5owAMvoXurfGpc8fA@mail.gmail.com>
	 <CAPybu_2LZgaDFL-jexc0DcnEb0nzsLpZq30nA4UNufztDsKs1w@mail.gmail.com>
	 <db5856cec86de82a4feddf1cf739ce7eb37c6932.camel@linuxfoundation.org>
	 <CAPybu_1ULyzXSJzYAHGRh7FeM9i0PX7g0N-v=XqeFPKJ8k0hzg@mail.gmail.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-04-05 at 17:44 +0200, Ricardo Ribalda Delgado wrote:
> Hi Richard
> 
> Thanks for testing it out. Seems that I am either not very clever or
> I
> should not work on Sundays (or both), v1, and v2 where exactly the
> same. I am terribly sorry to spam you.
> 
> I know it is abusing your patience, but can you try again. I would
> love to try it on my setup , but I cannot replicate the bug.
> 
> As we speak I am running oe-selftest    --run-tests wic.Wic on
> poky/fedora-30...

I did re-run it, it took a while since a pseudo change invalidates
sstate. It passed:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/838

Cheers,

Richard

