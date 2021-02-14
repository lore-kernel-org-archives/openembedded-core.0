Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.16229.1613305197659510688
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 04:19:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PnN+UlXg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id u5so1013673wmj.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 04:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=wumWdvPY6APuRuVIbJrV8d9NW38R9rYmefte4zhR4Fw=;
        b=PnN+UlXgHHwWTEgEXMMbSu5QjA7TtzbmFJPdZ1H3wiYoVVd8bHYkYT1DUcgpf2T/DQ
         1HVwxD4nI6RN5prUznGomtl9XazM/Sg0H93Q7jDYxJpnxVW9sVMxEwB75Omm2vwU9S2W
         NJ+5skkmT5F1WWzWPiSwG42mMFkj+RYvgVhTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=wumWdvPY6APuRuVIbJrV8d9NW38R9rYmefte4zhR4Fw=;
        b=gGo5B63DFPQRggxdw8/Zib+HQ/10bI5vCzYXSMXG4Zb+y5yX+5lXt508BGW+8ump7c
         S5bHa4mHk29Wlj6XCD49W8Cs23h7aRXdavu8yfT+uCYcc5GH8lEWeBz0BPCRRq2IZxZP
         cGJhltWuXx+mQjSkLeYSVBaR5oDhlqtxpn4pLvGcD39R1ePVPvHm4xGQAWVINQBq8LZR
         EBmeFpgIQWwVmGFGlz41GeUwJXtXTGsImIAiL5mVNNQZjt6tS43tk0THuW5nEXtRWYi0
         jE7+rg0fgnDtERFdXJJq1nS+i75y6Um2VDLOnDf8tOUm2c5yqW6iwj86ocOJz5AFv4cu
         6uUg==
X-Gm-Message-State: AOAM530+UalvJG0Uorn6sd+wZo/Et3VR2cBL/hY2yeCzutyS/OiDYLNW
	sQicTGQ+MvGu7bTY9GnnUbZva+DU2O4Qxw==
X-Google-Smtp-Source: ABdhPJys7PCVPV+hJV5I0aWs/sggz2DLeNs8MwQS8oW59vX5DQqhx1aYQdiX5J9dcM4PAQKl2bE7RQ==
X-Received: by 2002:a7b:c84c:: with SMTP id c12mr1948514wml.112.1613305196075;
        Sun, 14 Feb 2021 04:19:56 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6c46:cb67:3902:3f00? ([2001:8b0:aba:5f3c:6c46:cb67:3902:3f00])
        by smtp.gmail.com with ESMTPSA id o129sm9374848wme.21.2021.02.14.04.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 04:19:55 -0800 (PST)
Message-ID: <80c70797943e52fa430d2f9f65bffe7a90730dec.camel@linuxfoundation.org>
Subject: Autobuilder reproducibility target changes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: swat <swat@lists.yoctoproject.org>, "Mittal, Anuj"
 <anuj.mittal@intel.com>,  Steve Sakoman <steve@sakoman.com>, Joshua Watt
 <jpewhacker@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 14 Feb 2021 12:19:54 +0000
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Regular users of the autobuilder will note that I've split the
reproducible builds test out of the main oe-selftest build and into its
own target build. This is because that test tends to run for a lot
longer time period and it helps to see the result separately.

I've only done this for master. If gatesgarth and dunfell want to
follow, that should be straight forward with a change to the branch in
autobuilder-helper. Obviously we should ensure this is working ok with
master first but so far so good.

It has already highlighted the difference between a successful run:

https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/2
https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/2
(took 3-4 hours)

and failing two failing runs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/2
https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/2
(took 9 hours)

the time difference being the system trying to run diffoscope on vim-
common :/.

I'm aware I removed some recipes from the exclusions list after seeing
multiple passing builds for all distros and we're now seeing test
failures. My mistake was not waiting for the date to change and for
builds to run on an autobuilder worker with a different umask.

Meson is failing with a pyc file mismatch which diffoscope can't decode
and despite trying for 5 hours, diffoscope hasn't given any data on why
vim-common differs. I should have fixes in for quilt, valgrind, kernel-
devsrc and cwautomacros. The umask fix may fix other issues too. Alex
has improved the reporting so we can spot cases where exclusion is now
longer needed.

Cheers,

Richard

