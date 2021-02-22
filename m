Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.2753.1614025619549807056
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 12:26:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xoyh0ses;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id v62so442957wmg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 12:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=hSV8zgLL1qI2VtuejLEMkCpglPFOb3EwRIeBgdx6TNw=;
        b=Xoyh0sesLYaVqsWvYBbAXUkdPNWGfWlUkLofwe4/1V9kkabSQd7WIhiTCnPDyJmO+y
         fEGLpcKISUvA32PDMJgWOO0BdpDI36zkTuMUwLMwfqSoXG96Jzpx1W2NXShZKuJfMU/c
         eJzGbVDsYsYuzVd0sEkZmV2s7IyQm8ZALa3PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hSV8zgLL1qI2VtuejLEMkCpglPFOb3EwRIeBgdx6TNw=;
        b=OwR+GOf5nMfVD1zdky9AMGAcrl5v87j2j2NDq4U8+3kr0+csTblPCkLwSCo80mITuG
         FEVJoWdJCjXnx/GRXCnH4IvonTC08081Mtx7Z5MhpA0sHAMPeJfPFCnMp0TQMkZpBzGV
         geIWVzzDLeVfmqfNvodnmpITflCCi0A2bmYKr/tlaPEsZjagEWTx43LXcOjNK2vtAeKY
         jDPB5yT9jQ5NATSwKfYVx6rzc3USVp8WWPbTaIn343ewi0ECxugoyp7AOc+g03sPsHn8
         hEuBnXI7CUmaITOCQW6L18BulGkk8HggWoiNRLSbgLFDDzK87A4gFHM75YcWiQoRZJWT
         OFvA==
X-Gm-Message-State: AOAM531kI9BmOrq6OW6rFHYksxzBFPQuG57r0OGT0SfvIbi6jzzkPqFX
	psYUJi7d4fnUzTuxWIwWvRLcng==
X-Google-Smtp-Source: ABdhPJyo8VLxhjAj3+Xf9T6eihBH/DifdvrDRAxCoh0G8NXbgyoRQEiAc6/eX3M1vrlhOjtSsZdGwA==
X-Received: by 2002:a1c:107:: with SMTP id 7mr21457658wmb.28.1614025618044;
        Mon, 22 Feb 2021 12:26:58 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6747:849:8224:46bc? ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id k15sm28582097wrn.0.2021.02.22.12.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 12:26:57 -0800 (PST)
Message-ID: <b06711bf332e943142cdda180915add2c78c6b69.camel@linuxfoundation.org>
Subject: Re: [PATCH v3 2/2] iputils: Fix setcap/setuid of executables
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, Jate Sujjavanich
	 <jatedev@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Date: Mon, 22 Feb 2021 20:26:56 +0000
In-Reply-To: <CANPvuRkSZxTOLM-gANOs_jrmkkMVZD83AJQMcJsWq5OCnhh1Lw@mail.gmail.com>
References: <20210219175307.46218-1-jatedev@gmail.com>
	 <20210219175307.46218-2-jatedev@gmail.com>
	 <CANPvuRkEwbKHMDf7EzD9r8PwDR-akj8JJtc6D3-youOiYiU4Wg@mail.gmail.com>
	 <CAPphmgayRkWXYqSmoCB-8LrTxfuSj+n+cVPX9F7HzpYe3QstCw@mail.gmail.com>
	 <CANPvuRkSZxTOLM-gANOs_jrmkkMVZD83AJQMcJsWq5OCnhh1Lw@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-02-22 at 17:39 +0000, Jose Quaresma wrote:
> Hi,
> 
> Jate Sujjavanich <jatedev@gmail.com> escreveu no dia segunda, 22/02/2021 à(s) 15:58:
> > If libcap is disabled in PACKAGECONFIG, then arguments two and three mean 
> > find_program find could setcap on the build machine. This would mean it is
> >  not strictly determined by the recipe and it's determined by the 
> > configuration of the build machine instead.
> > 
> 
> In this case the meson will not use the setcap from the build machine because 
> the libcap not found on the target sysroot. The libcap is a dependencie when 
> PACKAGECONFIG+="libcap" and in this case the meson it will fallback to use
> setuid.
> https://github.com/iputils/iputils/blob/f0c64bbb2b1563647bfeeed8d82bc4d2d2312d8a/meson.build#L221

Whilst it may not use libcap, I seem to remember issues with the output 
still not being deterministic since there was something in the out which 
indicated the presence of setcap (or not).

Cheers,

Richard

