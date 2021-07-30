Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.565.1627664276895319825
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 09:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X0FgHFUI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id u15so6407445wmj.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 09:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=tpuGRQy67byOsFp+zjOWL+7zDXLOZYe5uZ9xogWCwRo=;
        b=X0FgHFUI51sTEA1dm3r1ldFSkgmoKzd15s5tekLGM5DmsbukTyTXw3Ejm2Ncu7r+DZ
         40KDT1+p8N0N/SmyF3Wjg8eOFOw1TmVOglEUeamr9JzAVN+AzDsBrRL4sJTV0ZrR8EWa
         r38X5pibXInsZ1Uvpa4n6B6Sf9yZ3ckt4mqMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tpuGRQy67byOsFp+zjOWL+7zDXLOZYe5uZ9xogWCwRo=;
        b=GwcgV5Ho7LjgR2xOHBYjsJf8sjFj5gd+38K7n2dRcZRlmPzUKTHq2XBURzezNxO/bt
         1PhKk8PSyPC0GicRYRuFS0rxk0+xWTqbF6DI+K6E7kiadhgzmIALrKWsGOF+GLKiQBsU
         J1NQDO4Vj3zkVKxiIxXy9dqvUHxakTc+mHK7xD/47I+Q/5JKdip97mUQv2N/Io72OfHy
         vYoQubMNBXnjIFVEdwpuJPnn1O8NOEokG3ANyF13qXE8LeCYpgJERhqAjMyCDGexxqYu
         JQRcAbGFiMx8EBAvuGqbwk9piX/ndhsJYPutKUFg8sZfhuY1drJiDQCBXdVmNUuqOyAc
         F0FQ==
X-Gm-Message-State: AOAM532IUHGU5FMkXk7wR689oVJb1CEmmqT1PEUpe5XdL1Ntaveso/0Z
	T5M3W2hD22NhF3L6zZV4gCIDFQ==
X-Google-Smtp-Source: ABdhPJzcTp9BnDWgcJt7+Cc1DBikmlKUB4IjsY5QBy6GrW4bTetB/NQVhmghFbqZ4hyTEuLwA2yMZw==
X-Received: by 2002:a7b:c75a:: with SMTP id w26mr4094783wmk.106.1627664275312;
        Fri, 30 Jul 2021 09:57:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b? ([2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b])
        by smtp.gmail.com with ESMTPSA id l2sm1985653wms.21.2021.07.30.09.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 09:57:55 -0700 (PDT)
Message-ID: <a5454ec1aca97562becc961996f37d667cf1dd52.camel@linuxfoundation.org>
Subject: Re: [OE-core] SYSROOTS_EXCLUDEDEPS_SYSROOT changing more hashes than I expect
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jate Sujjavanich <jatedev@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 30 Jul 2021 17:57:52 +0100
In-Reply-To: <7639.1627661055320457660@lists.openembedded.org>
References: 
	<e3f3675380a84f3c726f8238707653fbaad1136a.camel@linuxfoundation.org>
	 <7639.1627661055320457660@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-07-30 at 09:04 -0700, Jate Sujjavanich wrote:
> The ones in meta/conf/layer.conf are much more global. This one in 
> meta-java/conf/layer.conf certainly does not apply to perl and other irrelevant recipes.
> 
> SSTATE_EXCLUDEDEPS_SYSROOT += "\
>     openjdk-8-native->(ant-native|attr-native|coreutils-native|icedtea7-native|libxslt-native|make-
> native|openssl-native|zip-native|unzip-native) \
> "
> 
> Do you have a recommendation on how to apply this strictly within meta-java? 
> The only way I can think of is to move the EXCLUDEDEPS to the specific recipe(s). 
> Are there any other good ways?

Sorry, your original email said "SYSROOT_<something>" and I read that as 
being one of the SYSROOT_* variables. I kind of filtered out the rest. 
SSTATE_* is a very different thing!

I think we need to add:

setscene_depvalid[vardepsexclude] = "SSTATE_EXCLUDEDEPS_SYSROOT"

to sstate.bbclass.

Cheers,

Richard


