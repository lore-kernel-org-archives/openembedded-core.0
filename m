Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.7878.1605202179340371118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 09:29:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CiSimM5b;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id l1so6854842wrb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 09:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=yR8F3V89CoaalYyoVd0vXIb6YwXJzX4c8b/8+C3Ucvg=;
        b=CiSimM5besEK6Ft4FsnlrcnKO8X38E8FlU5pkHa8q9QFUtEs+fTxtxepXxR29+EWxp
         fY8eJtloMwiyt5DdvpVH3l0PBKtZs8kqjOJqGgErZFgib+1hrcowkrplsNVvRvMyCx0R
         eTAgVaTO/zDrwZzGxZzWK41O+cIE3gLa0KdU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yR8F3V89CoaalYyoVd0vXIb6YwXJzX4c8b/8+C3Ucvg=;
        b=EN5zsXr706GVyWxvgTd5mP6U4sZLjhGJtM37lC/vJXNLJTfo+BIkAs8M+oh8gUBA5J
         5Ld4XHDZaRvh2Js9agXJjbRhK+l4m9LLEygw396pTeSjJICdCFd//LjUSVrCS++99krS
         7sgadZNySqSFdGzgpmWx8LkGNEHSnK6YXSj0ti4KHRCKraHnPPbwnjYr7E3eBd0FZNCZ
         AflPThEcqolwwrK1O2gSKwIxhbV0c/EG8A9UJXadYnGPUr5lXpWc1TShkFWV4ivygSkj
         6k3jYA7dv0aZKhA1gVqkgWloqjAv1NSrgLCHRlDGyJCTdrnb4mIEtz3cNQUYaF5Dl2Xz
         mTOw==
X-Gm-Message-State: AOAM533i7YZbjoAL1pn0EQ2I+e+t5TlXTLWJMfonekAH92oTlOEPp7no
	Xt2oGc/XUvlOEVM2z2B7jcswFw==
X-Google-Smtp-Source: ABdhPJz2rYFH/yXbN90TveWAA/PUMDF7yHUtvSWLkt03gv8WIXjfPUO9PydNwBNniBhWbEhzhhrwSw==
X-Received: by 2002:a5d:46c6:: with SMTP id g6mr738311wrs.170.1605202177987;
        Thu, 12 Nov 2020 09:29:37 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from e.3.a.b.8.4.f.3.4.e.5.7.b.c.8.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (e.3.a.b.8.4.f.3.4.e.5.7.b.c.8.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:48cb:75e4:3f48:ba3e])
        by smtp.gmail.com with ESMTPSA id t4sm7640472wmb.20.2020.11.12.09.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 09:29:37 -0800 (PST)
Message-ID: <6af65017cec256407db0319271c648275a18ff5d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] dbus: split -common and -tools out of main package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Date: Thu, 12 Nov 2020 17:29:35 +0000
In-Reply-To: <20201102191848.1799747-1-luca.boccassi@gmail.com>
References: <20201102180559.1177417-1-luca.boccassi@gmail.com>
	 <20201102191848.1799747-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-02 at 19:18 +0000, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Certain config files and units are shared between dbus-daemon and
> dbus-broker (available in meta-openembedded), so split them out to
> allow installing dbus-broker without pulling in dbus-daemon and its
> dependencies.
> Stand-alone command line tools can also be used regardless of whether
> the buses are provided by dbus-daemon or dbus-broker, so split them
> out into dbus-tools.
> Finally, move the XML schema files out of the main package and into
> the development package.
> 
> All these changes follow the same pattern used by Fedora, which was
> one of the first distro to switch to dbus-broker by default:
> 
> https://src.fedoraproject.org/rpms/dbus/blob/master/f/dbus.spec
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: fix FILES_ regex to correctly include all units but the sockets
>     in the main package

I tried putting this through testing on the autobuilder but it fails in
world builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1589/steps/13/logs/stdio

(dbus-native seems to depend upon dbus-native-tools-native)

so I've had to drop the patch.

Cheers,

Richard

