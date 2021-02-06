Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.4396.1612602468446269931
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 01:07:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NJWUbWLo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id c12so10445849wrc.7
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 01:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=SifY2HU0virDTqVX66sKSETA/eUbT7H4lGnuLXJ0azw=;
        b=NJWUbWLohTzBPsQUT6y3WZnFA6vniRj7Jel5OoB3H1H4+OpHTwqGJgTWhsegzyEn0x
         +cgmigIBbLUz/HrxcJz9VuTlD9DXYZjd8cJSXHSmVUFAEZNqGNn6j03y2Fu+UOS4DdA6
         GaqrVGziupKObDeDUGyysfD0Usr9yhvN7n2kQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SifY2HU0virDTqVX66sKSETA/eUbT7H4lGnuLXJ0azw=;
        b=DrOVvq/8zYvMB6PtOj1DMZdKU0CZhiRBIaYR9QM2VillDIxwYzrjaYVxG2brVUo1SY
         /TB9c+kgcdDtiDg0257m++Yqzb1QAJNoCxzZJFGGakXxodKoKqPZFYQMT03aGEv0qvIO
         JbKZX3e25+IiJD7lBfepOS5WWzDWvtqzs4m3GOKJsh2822fp/KzG4t5d2Mk3AGiFSC9T
         7d83blsaPz8B+reOKk+TKnjLp8MHnoYcJWsLGtu/ihSpS36L0j/phrRyE7AsCr5t3HKs
         OHPdqJSC5jtjaqxsHr6xrR3NBFGHD3KXFL6yxcsz7TH86Kq3LRJdlcii/wUB81UnpRYd
         uPTw==
X-Gm-Message-State: AOAM5332qQl+7iPvOFIA6cWTEEj5xmQfup/GxWNVxXrZvn1kwHlzG2Jn
	43ycA2dgnlyApJxDkZcCVT3T0Q==
X-Google-Smtp-Source: ABdhPJzfzlfX/6rze2TPHms9AcLEUnYeMpUfV2jCjSvyDhSahNhg1FG4YnT6OO8WW1rdnNXjMWvdpQ==
X-Received: by 2002:adf:8b47:: with SMTP id v7mr9204195wra.133.1612602467000;
        Sat, 06 Feb 2021 01:07:47 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:be75:a088:9c76:71df? ([2001:8b0:aba:5f3c:be75:a088:9c76:71df])
        by smtp.gmail.com with ESMTPSA id w25sm11178797wmc.42.2021.02.06.01.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 01:07:46 -0800 (PST)
Message-ID: <267ec66436e2a7cb1c049dbc98b69c3d90001d55.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH] manifest.py: Add tests to empty image
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Milan Shah <milan.opensource@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: akuster@mvista.com, randy.macleod@windriver.com
Date: Sat, 06 Feb 2021 09:07:45 +0000
In-Reply-To: <20210122055805.14834-1-milan.opensource@gmail.com>
References: <20210122055805.14834-1-milan.opensource@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-22 at 11:28 +0530, Milan Shah wrote:
> An oe-selftest test is added to ensure
> meta-selftest/recipes-test/images/test-empty-image.bb builds and is empty.
> 
> It is just a test that ensures that an empty image has no packages in it
> (i.e. nothing in the manifest)
> 
> See [YOCTO #8455] for details.
> 
> Signed-off-by: Milan Shah <milan.opensource@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/manifest.py | 45 ++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)

I was curious what else was using test-empty-image.bb and I see a test
in:

meta/lib/oeqa/selftest/cases/imagefeatures.py:

        """Test creation of image with no packages"""
        bitbake('test-empty-image')
        res_dir = get_bb_var('DEPLOY_DIR_IMAGE')
        images = os.path.join(res_dir, "test-empty-image-*.manifest")
        result = glob.glob(images)
        with open(result[1],"r") as f:
                self.assertEqual(len(f.read().strip()),0)

Is this test doing the same thing?

Cheers,

Richard

