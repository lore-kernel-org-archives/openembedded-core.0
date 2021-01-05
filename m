Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.224.1609888671942700265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 15:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C/bU/XOg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id y17so765296wrr.10
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 15:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=EtpAAbnmCficNO19o0sprCLDPs6hbVmX+/ITzhpav/4=;
        b=C/bU/XOg1XOT68YPezELFNLhTK7Cw6gXaFlEDm/AO/a1kghMURTn6+Z8UW1SpgJde/
         CTZiKEzuS0/N+MAMtK6uoONPh6LVKMIGqNm5m1otFHfC57HMIgktJYQiUZyAuMoN7M1A
         PovnJc3qWVMO6NeaY6jcGwPLF6WFPiQSwm8Bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EtpAAbnmCficNO19o0sprCLDPs6hbVmX+/ITzhpav/4=;
        b=bjcItYiTBOQboR8FZnQXuTgTkWD5Quu2HnRG6viK/xKPdPb1rfzCpu+adMHDALZAYD
         9VRQu1IPYpE3p9/q4Ng/q5LP4Vhp5AndfGltogPuzK+FdHasKbALsDMKFXNzkoWf59ag
         gwmbjpXuJ9aMQBAAAjEJi9nS8BTRUO74p5zQ51VfGQm0peKosXkTcBuNgZzZpzSzsdYz
         6Pv6i1DCoPawhFgkHik/0JcZhqA6pKATysdrekjubE9frAIJjE5eIC3I/twTYRZXNoxm
         8u1JInD/qSluTUj75la1aP/F34vPAQgTIbzfE5klyR4eE6GGcXSf4a89aFPQFma4axSO
         hcSQ==
X-Gm-Message-State: AOAM531suNPrmJ0hvDmsS+kUasWopDJ+LhqZcujrrwV7mkExMPelJD+/
	zPwYdWjRCv3epF9/lCDhgJaUiQ==
X-Google-Smtp-Source: ABdhPJwDQKf/AeSnuA4KwPhU2233vlmuME/ZUP+lYtYyNgELo/X9bA6K0MbGNC2RjYD0R9Bncvlc6Q==
X-Received: by 2002:adf:8185:: with SMTP id 5mr1610340wra.44.1609888670214;
        Tue, 05 Jan 2021 15:17:50 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f056:12a7:edca:60f8? ([2001:8b0:aba:5f3c:f056:12a7:edca:60f8])
        by smtp.gmail.com with ESMTPSA id x25sm790328wmc.3.2021.01.05.15.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 15:17:49 -0800 (PST)
Message-ID: <5334acfaebf83a1a6f918572ad9581afecde2493.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH 1/2] oeqa: add OETestPriority decorator
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 05 Jan 2021 23:17:48 +0000
In-Reply-To: <DBBPR09MB4748488AFABBB0B74D5E3151A8D10@DBBPR09MB4748.eurprd09.prod.outlook.com>
References: 
	<DBBPR09MB4748488AFABBB0B74D5E3151A8D10@DBBPR09MB4748.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-01-05 at 20:16 +0100, Konrad Weihmann wrote:
This modifies an implicit default priority.
Can be used to move the test case either to the front
or to the end of the test suite.
Value can be between 0 and 99, implicit default is 50.
Lower values move are run at the beginning of the list,
higher values at the end.
Within a single priority ordering remains unchanged.

It enables use cases such as shutdown tests, which
should always run at the end of the overall test suite,
no matter what test suites/cases are set in the current
test suite list.

This avoids also using test suite naming hacks, such as
usage of zzz_foo_test.FooClass.test_foo to move it to
the end of the test suite list.

I have to admit I'm not 100% convinced we want to do this but I can see
why you might want it for log tests for example.

I did throw it into the pile of patches to run regression tests
against, it didn't get far unfortunately, it breaks check-layer:

https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/2905

Cheers,

Richard

