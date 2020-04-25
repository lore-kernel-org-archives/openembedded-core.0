Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.599.1587848835532022525
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 14:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bT6pbsHX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id j2so15872101wrs.9
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 14:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=4G+XLuaGvJYmdDueuXwNXyS+6JPBd6cYUO3cTELO2gA=;
        b=bT6pbsHXMHmWMEFeUO4QLZ022aBHGpv2f3nKLJhmP5p3TW2uHBs3GWNLfWSNbSYbSh
         9a4Ih+Tf7I1fPEP0zYlIklSd1nixlFeskS9TL9dif9g0cg+muWaBCggQWT/ekw2gW5Vc
         sgDM4UFQd/pqd+mx/nlCDWVqvqxdVX90KHOrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4G+XLuaGvJYmdDueuXwNXyS+6JPBd6cYUO3cTELO2gA=;
        b=VwY208LPrardqm3dRlexk4EMt5O8RIn+cwksK5FIpJVAeL0wT26F6+bLAFq9rxKISw
         7sWaUnFtaXqDYxJWwse4Qe+AZy1Z8w4cyLalBpTvCjM+wkv/uKu9aFgDpHGZSluH3twS
         0V7PWOqXZBRI+aEgJJ80pJnUriRhEJrsEfRMRqjxFwlhq46NaGINWHGhZ/+QnNwEFPry
         frFRIV50/DMzBqIThG8iQsBKEtlB0CfUt3LXL7rm5W4jtLCRn5Kwe6T7dmCBXlfPprKY
         gylLFNRqGi0gTm7QKjLJrxvjRkELOndsZy826OYmqHFIb/j8n4p3opH6roYhbkR2uIT2
         MkRw==
X-Gm-Message-State: AGi0PuZpsXhMKlQY8vBVHH44rZjd2uTJGf4Jo3AjYT8xEIXk73TVND++
	pIPAeYT4tFYojVGjqxFRbgxkjQ==
X-Google-Smtp-Source: APiQypLncZx80QDSJCs5DV3bk9Hbx5pSy1QL+6zCLH86i6NYNbe64PQijX/o/Y5zSzC4OFhH9aabaQ==
X-Received: by 2002:a5d:6cc2:: with SMTP id c2mr6543666wrc.60.1587848834040;
        Sat, 25 Apr 2020 14:07:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id t67sm9359882wmg.40.2020.04.25.14.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 14:07:12 -0700 (PDT)
Message-ID: <d15d1601fdec27b7667dd16f62db13fc9ff475cd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 00/10] Fix permissions and embed-rotofs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Paul
 Barker <pbarker@konsulko.com>
Date: Sat, 25 Apr 2020 22:07:11 +0100
In-Reply-To: <CAPybu_16DsHfqq-Frixoq+ySqCbb2qvGmapZR-UbKGgmT8sJyA@mail.gmail.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
	 <258be2a52105a49413b954df67e61444dc73492e.camel@linuxfoundation.org>
	 <CAPybu_1XdULtkfUQsjTa=PvuyUECKpNLoFXX95F_+Ly3=fbqBg@mail.gmail.com>
	 <ebb64c86224b51b49b1d86f864566ecd91696f95.camel@linuxfoundation.org>
	 <16086D1E57B63D5A.14079@lists.openembedded.org>
	 <CAPybu_16DsHfqq-Frixoq+ySqCbb2qvGmapZR-UbKGgmT8sJyA@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-23 at 15:17 +0200, Ricardo Ribalda Delgado wrote:
> On my setup, using debian crops the error is even different :(
> 
> If you want I can keep trying, otherwise I will leave it to the
> experts ;)

Just to update, I bisected this down to my sysroot patches in master-
next. Which makes no sense, how would sysroot changes cause wic to fail
in runqemu?

I've discovered that you have to run two tests in the same build one
after the other, specifically:

oe-selftest -r  devtool.DevtoolExtractTests.test_devtool_deploy_target wic.Wic2.test_qemu_efi

and I think my sysroot change "causes" problems as it adds a new test
class. This reorders tests and triggers this magic order problem. I
haven't confirmed but I think the above will fail without my patch.

The key is the wic test failing with:

FileNotFoundError: [Errno 2] No such file or directory: '/media/build1/poky/build-st/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0-r0/testimage/qemurunner_log.20200425200658'

i.e. why is it writing to oe-selftest-image which is only used by the
devtool test?

The answer is I think the runqemu code is leaking logfile handles
somehow.

At least now we have a simpler and consistent reproducer and some idea
of the problem this should be easier to track down.

Cheers,

Richard



