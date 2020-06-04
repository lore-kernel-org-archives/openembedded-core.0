Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.24479.1591304168544619081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 13:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y0fymu6d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id l11so7612842wru.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 13:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=uqAXIzs8YXg85K01229KeAJv2sKRH5YPkI6RWZEMq2U=;
        b=Y0fymu6daV8EvckKj7IMxHqGNe0U3b1yZY2va+7UX75blf9wo7LkXBc6hZQ+a/Fgmb
         r3SuGEfzMnzPcS4jlQSLKJSKFfZ43NUAWp+RuKI3wzEi8Le4QMQYpySjynm4LYwgxjUm
         h+UzUwLl7z/k+ELuJ1PD8Vox7rvTf4J+z/JN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uqAXIzs8YXg85K01229KeAJv2sKRH5YPkI6RWZEMq2U=;
        b=F/Dmkqu3UZ72+u4Yo165XRoFkoRx4eT8HHsFt+l5UeST/hXqymZQqQiDKUxD10jSyQ
         W6WOpr/nV2s2Q8xZjHT3GkRVXKbU3qr+0YOIfNgfMXrz+GLLudeck2RaG57Vyq8/Oe32
         8KGcZPwdWrbBY4OdUYCP7mdCF6Lqz4sVXXI/VJQ8CcTczWbl/o0G9go3eawJ5s7ipJzC
         hWdCVG8kUypXiasiX3xcSHWjmWf0E76jG84zaVNwavMnGlckBYwyJj/NWQOdOKDz/BKj
         wtO/JvFivEokDoX/oVTIU4PU46wJ20oSSO9QMd2DTm1I2Az+7OaBe/6PuvVAN+TkeJ9y
         XOGA==
X-Gm-Message-State: AOAM5319a3EIFhMvDDY3SGPd/Wv646P9+FvoO6pMcaSZkwqJO48phV7y
	q29CC+s2ErCzLtTduZoWprNjXw==
X-Google-Smtp-Source: ABdhPJx5yyMvSyM81sk+oPLUi0FgIZ/2vT6vYUJpJ3MPKFBXp3EVe/Xw1UrbMQoyE9ns63R855taqg==
X-Received: by 2002:a5d:4484:: with SMTP id j4mr6030825wrq.325.1591304166962;
        Thu, 04 Jun 2020 13:56:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id y5sm9691424wrs.63.2020.06.04.13.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 13:56:04 -0700 (PDT)
Message-ID: <38c108ddb09675f4638502391d05dbdf3a8cb83e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] bzip2: Add test suite for bzip2
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Rahul Kumar <rahulk@mvista.com>, openembedded-core@lists.openembedded.org
Date: Thu, 04 Jun 2020 21:56:03 +0100
In-Reply-To: <1590928026-6366-1-git-send-email-rahulk@mvista.com>
References: <1590928026-6366-1-git-send-email-rahulk@mvista.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-05-31 at 17:57 +0530, Rahul Kumar wrote:
> Source: git://sourceware.org/git/bzip2-tests.git
> Type: Enhancement
> Description:
> bzip2 now has a test suite available at
> git://sourceware.org/git/bzip2-tests.git.
> 
> This is a collection of "interesting" .bz2 files that can be used to
> test bzip2 works correctly. They come from different projects.
> 
> Some files are deliberately bad, and are use to see how bzip2 handles
> corrupt files. They are explicitly not intended to decompress
> correctly,
> but to catch errors in bzip2 trying to deal with deliberately bad
> data.
> All such files have a name ending in .bz2.bad.
> 
> All non-bad files end in bz2. And should come with a .md5 file for
> the original input file. The .md5 file is used to check that bzip2
> could correctly decompress the file. The original (non-compressed)
> files are deliberately not checked in.
> 
> It will by default test with the command 'bzip2', running under
> valgrind (if installed on the system).
> 
> For each .bz2 file found it is decompressed, recompressed and
> decompressed again. Once with the default bzip2 settings and
> once in --small (-s) mode.
> 
> For each .bz2.bad file decompression is tried twice also. In
> default mode and small mode. The bzip2 binary is expected to
> return either 1 or 2 as exit status. Any other exit code is
> interpreted as failure.
> 
> License:
>    In bzip2-tests source code Each directory should contain a README
>    file explaining where the .bz2 files originally came from.
>    Plus a reference to the (Free Software) license that the project
>    files were distributed under.
> 
> Test Summery:
>    On qemux86-64/kvm the ptest results with extra filesystem space
> (atleast 114688) are:
> 
> TOTAL:      396
> PASS:       396
> SKIP:       0
> XFAIL:      0
> FAIL:       0
> XPASS:      0
> ERROR:      0
> 
> All tests passed
> DURATION: 517
> 
> [YOCTO #13444]
> 
> Signed-off-by: Rahul Kumar <rahulk@mvista.com>

Still not quite there yet unfortunately:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1996
https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/1992
and probably a few other builds too.

Cheers,

Richard


