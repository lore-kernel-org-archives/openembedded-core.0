Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.1725.1613684649044089525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 13:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CIv10nkf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id g6so4534714wrs.11
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 13:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=4kHNtSfTvnPAkA2bErIdzzXQBG6irC65VI9EAn+0X/4=;
        b=CIv10nkfyq5I88G9SecgLeOj/tu9jlGsqXVcTQ4QPy2luqv40NIrp80GXrY/C+USXP
         AViIE4MO2js0m7eg6A1ncbrWjLNWwfIhXfzuORFn2Mtg0zoxDAfcBhMnFfJ72XYzhaaO
         Au6U6Bqq0Kjg1/ag2lm/aaVHTicCtBA88JD6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4kHNtSfTvnPAkA2bErIdzzXQBG6irC65VI9EAn+0X/4=;
        b=SrkOS/C0iMGb5Qp6bQ3gd22rfueD1HfQHatkHWO25dStVyKjNWQ0u0ULWpeUghqi6k
         XP9nwX8YAYDhF6D1LH6s9QWcMXQlmGDzYtd2zYxkwyH0HsEGPFYkPjWuSGJz9P1LShnk
         FotN6Ro7gzdkFcEVsZjy6nbBi2WKgMuYTMhhmlbCboYR47Ba7g9BOHhLtO7zzfTS9uiw
         lzjrgPrKqtwX6Mzbz0TjsHaUMY5O6VZfQL0nPNUXYrHpSvVSxAUQF6wK3qqfy/Zdi1UC
         jGrP3EgHkZqsoPFqj/LM8bMvqND+Ji8d5eaGpSJnP4E0Bi0G2UqhPFxJknu3HXBiCQOt
         3hLQ==
X-Gm-Message-State: AOAM532Z+SHIYV5wPFZA3DdfPa/thI7nXrvHc9r5emfzsgW+ZrWa8OVx
	gerFp2SOLfbLH4+SiYdQYjrJ9Q==
X-Google-Smtp-Source: ABdhPJxZT5X4Vf9YYxjNACoRixxrhqBzLfLODuJdsMNfr8LK18EWjh3wzfjTmeNtt20vBfKEaDpsHQ==
X-Received: by 2002:adf:de86:: with SMTP id w6mr6069016wrl.32.1613684647459;
        Thu, 18 Feb 2021 13:44:07 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9? ([2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9])
        by smtp.gmail.com with ESMTPSA id h12sm13449400wru.18.2021.02.18.13.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 13:44:07 -0800 (PST)
Message-ID: <623d1b0df8dec2247f9d0c41ca8372cfb0af59e8.camel@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] iputils: Use STAGING_DIR_NATIVE for setcap detection
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Jate Sujjavanich
	 <jatedev@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Feb 2021 21:44:06 +0000
In-Reply-To: <CANNYZj9W4N0VeTi2WOQYG0c_XzwYX0EwEXD-GVkoUz_ciaoUCw@mail.gmail.com>
References: <20210218192138.39449-1-jatedev@gmail.com>
	 <20210218192138.39449-2-jatedev@gmail.com>
	 <CANNYZj9W4N0VeTi2WOQYG0c_XzwYX0EwEXD-GVkoUz_ciaoUCw@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-02-18 at 20:58 +0100, Alexander Kanavin wrote:
> On Thu, 18 Feb 2021 at 20:22, Jate Sujjavanich <jatedev@gmail.com> wrote:
> > +-setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
> > ++stagingdirnative = get_option('stagingdirnative')
> > ++setcap = find_program(stagingdirnative + '/usr/sbin/setcap', stagingdirnative + '/sbin/setcap', required
> > : false)
> > 
> 
> Just remove the hardcoded paths from find_program altogether (see meson manual), and it will take the binary
> from PATH env var, which is exactly how native sysroots are supposed to work.

I'm guessing upstream does this so you can build as a normal user who
doesn't have sbin in PATH and still use setcap during "make install".

We need something upstream might accept. I suspect what we need here 
is a way to specify a specific path to the util and then fall back on 
the current approach if the feature is enabled but no path provided. 
Please do ensure that it won't look in the host's directories unless 
its enabled though.

Cheers,

Richard

