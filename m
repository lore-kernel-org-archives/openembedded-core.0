Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.27153.1611851892350860771
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 08:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TdAbGtLo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id e15so5093725wme.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 08:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=QyGm1Sjre9uhNSeR+rQFcmKzD29Drd3TGDYsikvnHvM=;
        b=TdAbGtLohkAW9SozQR8oForkTIFUt/g3tlk0CE5PJZWVb/uViq3ZzzM416oJyrpDu5
         3IqWcR6bV+dyv/UQsslHpYJEjIfR0NUXP3M6fkPhgWa1bmvBzFqLaKCQ+LGorfMy5kJz
         jebYzMfXtetc/m5wGF5Y2JzEAEtaeMBrW2sqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QyGm1Sjre9uhNSeR+rQFcmKzD29Drd3TGDYsikvnHvM=;
        b=rX2X8paQ3EqMXw1uQSrECQT44ALgT3IlrwUq/NrWkkQQDLSPX2EEepTholu/t031uM
         Xr8mK+8RQckDUUhjmxCFtuYNBpVDMwy2vVzgil/XQsiYZzUxL9ybsmwdheCAGnPgoF9y
         ohs8/3NXSCWxP+bL7ix2ee9xH4cmxezDi+9LrIIpTgAVftp0SwrzTdUai37FeGz+kDo1
         VVJoLV+cQYWWnTbhhUS7NOEhoykwMMpQxSY8HMb6VaRJ9bHL5CeX1dO56Zkdfs+vkiSn
         Lm5VkvqOJVB1wzCQV5Jlte1wYevXe0k9lEzMS3af77wxR+atQZ42UcjzQHNRzIPkaLnj
         SUrg==
X-Gm-Message-State: AOAM531IGDevSRdb1Sg5KtHMnbk+x0pTjakJL3Hg/sVy4or4lmCvUFm7
	ysUkRoBXxUa85+9wMR9xyp4FSw==
X-Google-Smtp-Source: ABdhPJzGTvdWvxyo5S/PdKWj466gcg2nNeEkz+e3ZY8DI5mb+aVfZy9MpCiD1zY4EOlt3CXZ3qNJ0A==
X-Received: by 2002:a05:600c:2204:: with SMTP id z4mr98487wml.138.1611851890861;
        Thu, 28 Jan 2021 08:38:10 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4bc5:547d:5310:bf3a? ([2001:8b0:aba:5f3c:4bc5:547d:5310:bf3a])
        by smtp.gmail.com with ESMTPSA id i7sm1663143wmq.2.2021.01.28.08.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 08:38:10 -0800 (PST)
Message-ID: <12fd7a6096af189960490edfe5aada5a75e128ea.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/7] ncurses: Don't put terminfo into the sysroot
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jan 2021 16:38:08 +0000
In-Reply-To: <YBJ5qanQrSxjhX6u@korppu>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
	 <YBJ5qanQrSxjhX6u@korppu>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-01-28 at 08:45 +0000, Mikko.Rapeli@bmw.de wrote:
> Interesting series! Do you already have some numbers how this affects
> bitbake builds?

We do now have measurements:

https://autobuilder.yocto.io/pub/non-release/20210128-10/testresults/buildperf-centos7/perf-centos7.yoctoproject.org_master-next_20210128130350_0ec9fb3f98.html

https://autobuilder.yocto.io/pub/non-release/20210128-9/testresults/buildperf-ubuntu1604/perf-ubuntu1604_master-next_20210128130346_0ec9fb3f98.html

so a 5-7% build time speedup with and without rm_work and a 7%
reduction in disk usage without rm_work.

Cheers,

Richard

