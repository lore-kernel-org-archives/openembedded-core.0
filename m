Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1A8F07D768
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 21:31:17 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c1so280972wml.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 14:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=f/bKzWnVjKpYEzC1rudG5QckpAJQxQRn2j8yb6HY5kM=;
	b=O6RyAkGm4+roo0fx86mt/di7JBzn9TyCo2tm+JlUr1ZIYnSA84huHYSen+dxpA9UJx
	duU94NFICJ3UkUEnD7ySr4CL9S2yR4G2gfO0MQUrKn1LG3dZRXW9WqdR/6CH80Q9MxMZ
	mhj7hm/FoeHhKhlyRoD28bgqaTmxswLWBvzQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=f/bKzWnVjKpYEzC1rudG5QckpAJQxQRn2j8yb6HY5kM=;
	b=RizILVrp6RfGpkdpWr669NnBi7aBFL6Bi4ilYXcwLnOdrl5J60u16cFwAp6J7MiHRm
	stm/peNiKfMe8hCt9sbA2jisGug1igDgxa5m5vXptZ1WtDiZX9fTd8jLwQ3sFfAYlJeT
	lZfi//4CsOhzJNPI1wtHkhioegwOjOt/kgDO9z4Dx0AzdwyhYkUCX+oSWygRn0KaAeSd
	S5nbZOmha3k/pAiGe/uo/ObEHqXf5VcOHkm3Lk/vkbME03qThjElY1SYpwXpj+IrnzoE
	orCv473tqm6EMm0KvxV+fxA20ml9BVjAXphmUN3RKQ4Apo/wyaewN5G4xGU25pA0XiuJ
	FwJg==
X-Gm-Message-State: APjAAAXqV8PRt2hc/u/vGEHuTc4AxGgo6RUID/SYOAymqh8GbAOLX7ai
	jCtL8+/FUVpZtZqOSQjwODcQjQ==
X-Google-Smtp-Source: APXvYqwPWhZtpqN4xkLz2PbJmOB9daH11LGW6KeR2o5d7ncGAazKWlwhsu+rKXePd/nZ9kqM4KSHdw==
X-Received: by 2002:a1c:81c9:: with SMTP id c192mr261739wmd.124.1554845477866; 
	Tue, 09 Apr 2019 14:31:17 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 84sm359281wme.43.2019.04.09.14.31.16
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 09 Apr 2019 14:31:16 -0700 (PDT)
Message-ID: <9634b91d63c9dcb0b39c4d81646e02abc26a394e.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Mark Asselstine <mark.asselstine@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 09 Apr 2019 22:31:15 +0100
In-Reply-To: <1552922513-21915-2-git-send-email-mark.asselstine@windriver.com>
References: <1552922513-21915-1-git-send-email-mark.asselstine@windriver.com>
	<1552922513-21915-2-git-send-email-mark.asselstine@windriver.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [v3][PATCH 2/2] goarch.bbclass: use MACHINEOVERRIDES and simplify go_map_arm()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2019 21:31:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-03-18 at 11:21 -0400, Mark Asselstine wrote:
> Per https://github.com/golang/go/wiki/GoArm we need to set GOARM when
> cross building for ARMv5, ARMv6 and ARMv7. The current approach of
> using TUNE_FEATURES can be error prone, as we can see today when
> attempting to build for Cortex-A7 which results in GOARM=''.
> 
> Since the value of MACHINEOVERRIDES already consolidates the values
> of
> TUNE_FEATURES into something more consistent we can use the overrides
> mechanism to set GOARM, leaving just a little bit of logic in
> go_map_arm() to trigger off the arch (basically target vs host)
> for the setting of GOARM.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
> 
> V2
> * Cover all ARMv7 Cortex* variants
> 
> V3
> * Switch to using MACHINEOVERRIDES/overrides mechanism
> 
>  meta/classes/goarch.bbclass | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes/goarch.bbclass
> b/meta/classes/goarch.bbclass
> index 39fea5e..8fdb443 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -3,18 +3,26 @@ BUILD_GOARCH = "${@go_map_arch(d.getVar('BUILD_ARCH
> '), d)}"
>  BUILD_GOTUPLE = "${BUILD_GOOS}_${BUILD_GOARCH}"
>  HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS'), d)}"
>  HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
> -HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'),
> d.getVar('TUNE_FEATURES'), d)}"
> +HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'),
> d.getVar('BASE_GOARM'), d)}"
>  HOST_GO386 = "${@go_map_386(d.getVar('HOST_ARCH'),
> d.getVar('TUNE_FEATURES'), d)}"
>  HOST_GOMIPS = "${@go_map_mips(d.getVar('HOST_ARCH'),
> d.getVar('TUNE_FEATURES'), d)}"
>  HOST_GOTUPLE = "${HOST_GOOS}_${HOST_GOARCH}"
>  TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS'), d)}"
>  TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
> -TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'),
> d.getVar('TUNE_FEATURES'), d)}"
> +TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'),
> d.getVar('BASE_GOARM'), d)}"
>  TARGET_GO386 = "${@go_map_386(d.getVar('TARGET_ARCH'),
> d.getVar('TUNE_FEATURES'), d)}"
>  TARGET_GOMIPS = "${@go_map_mips(d.getVar('TARGET_ARCH'),
> d.getVar('TUNE_FEATURES'), d)}"
>  TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
>  GO_BUILD_BINDIR =
> "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') ==
> d.getVar('HOST_GOTUPLE')]}"
>  
> +# Use the MACHINEOVERRIDES to map ARM CPU architecture passed to GO
> via GOARM.
> +# This is combined with *_ARCH to set HOST_GOARM and TARGET_GOARM.
> +BASE_GOARM = ''
> +BASE_GOARM_armv7ve = '7'
> +BASE_GOARM_armv7a = '7'
> +BASE_GOARM_armv6 = '6'
> +BASE_GOARM_armv5 = '5'
> +
>  # Go supports dynamic linking on a limited set of architectures.
>  # See the supportsDynlink function in
> go/src/cmd/compile/internal/gc/main.go
>  GO_DYNLINK = ""
> @@ -74,12 +82,7 @@ def go_map_arch(a, d):
>  def go_map_arm(a, f, d):
>      import re
>      if re.match('arm.*', a):
> -        if 'armv7' in f:
> -            return '7'
> -        elif 'armv6' in f:
> -            return '6'
> -        elif 'armv5' in f:
> -            return '5'
> +        return f
>      return ''

regexs are slow, this is probably more pythonic too:

def go_map_arm(a, f, d):
    if a.startswith("arm"):
        return d.getVar('BASE_GOARM')
    return ''

and ditch f as a parameter?

Cheers,

Richard




