Return-Path: <alex.bennee@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDCBC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 15:10:30 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.15771.1702998625006875023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 07:10:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IsHomW6J;
 spf=pass (domain: linaro.org, ip: 209.85.221.48, mailfrom: alex.bennee@linaro.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3366ddd1eddso1989581f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 07:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702998623; x=1703603423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnsFibUZn9jwC1PNuBHKaGaZZ9YpKL1s1+vEk/t7v8A=;
        b=IsHomW6JUdmjlWRxru5Rg4BOAVsHGJYnvd9mKpA6uUcTmaiBh/zPinYdCIUF9Yv7t9
         gPVCMKPvVXwfc9smGlpK/bSTTifInuSVXrRbH8EMSbgTNOiT3B7hVBlHMHQi3IQ+Fjnm
         t1LFDucP9V1ge+uwhFCk+odxgUyPgjV4CkgmCjWLbFvn1G4rPqgcPY7+EzG6VzIRD8lU
         dT6a2ZuOc3xhEA6Ajs/DG811w3Qp/5wCeXqiOBujkBpAhZ55ZtQtw7MhraTqsmUgIV2n
         V9BCKpfFbLClbrFjQy+Qc+wOzHhjj3pFMvzV+BkvypH3zpqNErLLxRHMfh7M62T6YxaQ
         5S0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702998623; x=1703603423;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZnsFibUZn9jwC1PNuBHKaGaZZ9YpKL1s1+vEk/t7v8A=;
        b=VIR6zMZyhodyf0sQVFVOzs/1UFQWcoBItzxha487dlnigUdCviTRypyLgxZYd9TEai
         Wkot3oLGX058QijmS+9YVl4q2TgZuXGkUXCu6eQuERMCWAqs0oFgkr+iyD7NjygGiRCR
         u+WVHCFSty/L/ECWA2kUeH+0BpPStAKhL5ItqkTI9WpxiwXC7GskpY1vHusOrjpDp6eJ
         IvTY1BN582VyekOSjvJ83Svp7FDYj1EDbI5RF86h/MiKC2U8pzl5scyfJ7mHeXyDPR5K
         XFFqFOj2hAunh1rcCEKdW+/nBtg70ql4VyRmRF9DKXskO6cA/A2NuLfIMRDjCMySoWtQ
         hdcA==
X-Gm-Message-State: AOJu0YzDviKa9Sq0qLWMct49KM8A87afUNY/93EWWy0WkM+QqeYquabc
	LyH6X6E+nOZIOLlyOSyppWPzg1QNVsKHhOQUle4=
X-Google-Smtp-Source: AGHT+IEBb20+ocDybfQ36lNQyodJ9VLaX1daQSal6+RvQjQmbPX96F6i5uZTix7StkNdxvsm1gIF/w==
X-Received: by 2002:adf:e9c6:0:b0:336:5fb5:b5b with SMTP id l6-20020adfe9c6000000b003365fb50b5bmr1676029wrn.109.1702998623411;
        Tue, 19 Dec 2023 07:10:23 -0800 (PST)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id t18-20020adfa2d2000000b003364aa5cc13sm176755wra.1.2023.12.19.07.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 07:10:23 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9D92C5F8B9;
	Tue, 19 Dec 2023 15:10:22 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] qemurunner: Impove handling of serial
 port output blocking
In-Reply-To: <20231218152951.3398964-2-richard.purdie@linuxfoundation.org>
	(Richard Purdie's message of "Mon, 18 Dec 2023 15:29:51 +0000")
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
	<20231218152951.3398964-2-richard.purdie@linuxfoundation.org>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Tue, 19 Dec 2023 15:10:22 +0000
Message-ID: <87bkam449t.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 15:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192747

"Richard Purdie" <richard.purdie@linuxfoundation.org> writes:

> Similar to stdout in the previous commit, we need to ensure serial output
> if written is read and put somewhere, else qemu might block on writes to
> the serial port leading to hangs in the kernel. Use our existing logging
> thread to log data when run_serial is not in use.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

I'm still seeing hanging with my test case:

  o regression_1010.5 Invalid memory access 5
    regression_1010.5 OK
  o regression_1010.6 Invalid memory access 6

  Stdout:
  Tried to dump info from target but serial console failed
  Failed CMD: top -bn1
  Tried to dump info from target but serial console failed
  Failed CMD: ps
  Tried to dump info from target but serial console failed
  Failed CMD: free

  NOTE: test_soafee (soafeetestsuite.SoafeeTestSuite.test_soafee)
  DEBUG: Checking if at least one of soafee-test-suite is installed
  DEBUG: Setting up a 400 second(s) timeout
  DEBUG: [Running]$ ssh -l root -o ServerAliveCountMax=3D2 -o ServerAliveIn=
terval=3D30 -o UserKnownHostsFile=3D/dev/null -o StrictHostKeyChecking=3Dno=
 -o LogLevel=3DERROR -p 2222 127.0.0.1 export PATH=3D/usr/sbin:/sbin:/usr/b=
in:/bin; sudo -i -u trs soafee-test-suite run -r -t -T ; rm -rf /tmp/soafee=
-test-suite
  DEBUG: Waiting for process output: time: 1702998407.0291, endtime: 170299=
8707.0285847
  DEBUG: Waiting for process output: time: 1702998412.0338314, endtime: 170=
2998707.0285847
  DEBUG: Waiting for process output: time: 1702998417.0378022, endtime: 170=
2998707.0285847
  DEBUG: Waiting for process output: time: 1702998422.0417945, endtime: 170=
2998707.0285847
  <snip>

The regression tests are hanging because that has triggered output on
the serial port as the firmware attempted to service the test and the
port isn't being drained. Then when that times out we start spinning
waiting for more output.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

