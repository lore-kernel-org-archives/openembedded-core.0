Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.35890.1585226714653305912
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 05:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KhAm7RpP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id z18so6319463wmk.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=r+gsik9fO2+M0IGvLUfsrb1Ou28Bv2QYEilZnSbtuEk=;
        b=KhAm7RpPyff2Gv55e1+haJLoZOAu5EvAeWMgMKgumMEyAux6w41EYupdGP+ibia8Jr
         QcYhIy9xwsbWlkIIDaomrCCnyksftyhjg9cGdKb1R2LIlsWvXCKxhZWKORzVWS2pXTAa
         dBqTODtccuM1YoIdQXWSfiroEI7AhP85bi8bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=r+gsik9fO2+M0IGvLUfsrb1Ou28Bv2QYEilZnSbtuEk=;
        b=G517cBNtkOgSVU0Jhy2MN9QbVDrx3zc68DhpD+fl0Cnvhs8g3hQfEoeiLNMnWZRXAa
         PJqisQBqOSO5xPidfmztzoiPhxb5Vk+0rPh63vu99BEywhV3rOocn+cQ7SkYlZGm4XIH
         43lJe5Rlf5Z7tzUkHOqHGR9kQ5MRnnPRr66N9Y8lqSretIMb5vOcRXyv0alW9SaV9zd8
         7tBbFn2C2N1NpQziF2q5IbgBn/4RRcIb4bzFcQBjJuxXZiRsylYy4B7mm9IYfISnwHX5
         mM2YPx/2d7Z8uFXZvjcwJcOFO5IxVs5s30YHJYKWJF+EeyAr3Up9nec+CKfWp5nWCbZC
         Obkw==
X-Gm-Message-State: ANhLgQ3J1cOBV9IfXTJPgwdmHF1Vi/gpTwb+5J7wUSrntoGFVNrKb/jd
	wN4kHbgxq4lQ8hbye8TNTXVV/g==
X-Google-Smtp-Source: ADFU+vvh8+p4CEnaPPOwiBIriVBSgV0hKNNyhxBQx/lLaZUb6EnAQpfSNYGV22cUuvLooSZThBALSg==
X-Received: by 2002:a05:600c:3cb:: with SMTP id z11mr2879104wmd.3.1585226713110;
        Thu, 26 Mar 2020 05:45:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id r9sm3518950wma.47.2020.03.26.05.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 05:45:12 -0700 (PDT)
Message-ID: <9c14fe5a594e1edd4cb678340ec27859ba9df864.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: Pregenerate autoconf files
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@intel.com>
Date: Thu, 26 Mar 2020 12:45:11 +0000
In-Reply-To: <20200325231637.802324-1-raj.khem@gmail.com>
References: <20200325231637.802324-1-raj.khem@gmail.com>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-03-25 at 16:16 -0700, Khem Raj wrote:
> libtool patch will result in configure file regeneration, instead of
> doing that at build time, do it in patch itself, this avoids running
> autoconf before configure step.
> 
> Since binutils needs specific version of autoconf ( which is 2.69 )
> this will break on systems using newer or older verisons of autoconf
> in current state.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/binutils/binutils.inc   |     8 +-
>  .../binutils/0007-Use-libtool-2.4.patch       | 26583 ++++++++++++
> ----
>  2 files changed, 20352 insertions(+), 6239 deletions(-)

Whilst I appreciate the intent here, our policy is to autoreconf most
things in general. This allows us to more easily support newer
architectures and platforms.

There is a significant build speed benefit from not autoreconf'ing
things but where do we draw the line?

I'm also worried about patches which touch both configure and
configure.ac since the timestamp changes can cause things to autoreconf
even when we're trying to avoid that. As such this is actually quite a
risky change given past bad experiences :(

I'm not completely against it but I am worried.

Cheers,

Richard

