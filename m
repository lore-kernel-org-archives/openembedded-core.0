Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.3956.1619563152623812039
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 15:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KKv/5rCm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id p6-20020a05600c3586b029014131bbe5c7so4720393wmq.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 15:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=mpfNYFEdNhtc+/vPcRMN6xYwlGBMIjQ1TBDGB9BYfeI=;
        b=KKv/5rCmt9XrO+fPGF3+PU78rW2yRlosCrXotYeRnI/M08WBrjIK6ZBg1pA69FNsrB
         2uWFQFZ7By63cUlgIEhBRHe9R0yxoQc+u3bDTizOYUzmm5VaQkCrU24C93LsNbvWklLZ
         nhjyrmEn16O4OVfwtyQAWkJIfA+C5YOxJLcWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mpfNYFEdNhtc+/vPcRMN6xYwlGBMIjQ1TBDGB9BYfeI=;
        b=Qk+GlKch8ApeRlNnqY/hRlxB7v9bSu84d6V/YkseWWwNLAXG46BQ2jfVO20ONP5yBT
         UI9ItaYr92DuINwwnK1s8TFx26sT12qgnNKF3Z4YrHLwNfy9mGiOXmudQhSaqjokUrzG
         b2zLtZl0lmY+CzvbmT3XrHf/HDM5fJQDv+KKlqvAHq2xkZaS5LZ3lwDAJ8pS1eMRkF2V
         KXeZd0qmGS5Lz/wqexQq4v0OGzheHgTCWMvWYPjjX0otQPaHlA5ceZaLDnVUek3HDPzd
         +UTwwh15rImW6TQyNIGimaghT2ie4byHwqDCPSE+aYfl8Nv3hIrsSNvltriTzjqpunp0
         ezUw==
X-Gm-Message-State: AOAM533pbSH4ykJseptlcBPZ0zZtoY/VmdiKjuh6BDXIxsVaobebGUqy
	ebpdlI6g4xRsfs7ojJ1SB4yUtw==
X-Google-Smtp-Source: ABdhPJx6X1Yz+CV2x8q4vn7ufm+UQmRmX+0ZsiMvgEXcrRhEj1BTZGhQJ+RmphXYGZl35Zaq+IxW1g==
X-Received: by 2002:a1c:2646:: with SMTP id m67mr552466wmm.71.1619563150983;
        Tue, 27 Apr 2021 15:39:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:89c2:a4ad:446:e40? ([2001:8b0:aba:5f3c:89c2:a4ad:446:e40])
        by smtp.gmail.com with ESMTPSA id a9sm1308284wmj.1.2021.04.27.15.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 15:39:10 -0700 (PDT)
Message-ID: <a825b895707921ccfb5a2d20a0def7982963de21.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Devendra Tewari <devendra.tewari@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Andre McCurdy <armccurdy@gmail.com>, OE
	Core mailing list <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Apr 2021 23:39:08 +0100
In-Reply-To: <3F33A9E1-ED6B-4728-A0CE-49EAAB2CFAC1@gmail.com>
References: 
	<d59ab2e71f0115018fb1c957276ce71e3292cd95.camel@linuxfoundation.org>
	 <F32A7470-A864-41C0-BA9C-FB611421DC0F@gmail.com>
	 <aebbbcf8d29afec37b4a9c459eca8ab24112137f.camel@linuxfoundation.org>
	 <4538E61E-9CE7-4346-877F-FA6CEAEB5074@gmail.com>
	 <61C98407-3B1A-4C8D-9969-7D3EEAE3B75A@gmail.com>
	 <3F33A9E1-ED6B-4728-A0CE-49EAAB2CFAC1@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-04-27 at 11:59 -0300, Devendra Tewari wrote:
> I suspect this is an issue in upstream createrepo_c tool, which has code that does not work across overlay
> file systems
> 
>     if (g_rename(out_repo, old_repodata_path) == -1) {
>         g_debug("Old repodata doesn't exists: Cannot rename %s -> %s: %s",
>                 out_repo, old_repodata_path, g_strerror(errno));
>     } else {
>         g_debug("Renamed %s -> %s", out_repo, old_repodata_path);
>         old_repodata_renamed = TRUE;
>     }
> 
> I’ll try patching and report an issue to upstream project.

I'm starting to worry that you're going to have this problem with many tools doing 
renames. It does sound like something the container filesystem should be handling rather
than exposing as a difference in behaviour. I suspect it becomes hard to see
predictably since builds writing in the same build instance are probably fine
and it only likely happens for files created in one instance and then later
renamed in another...

Given the breadth of build systems we run, I'm not sure we want to try and
support this?

Cheers,

Richard

