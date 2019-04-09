Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7EA7D7AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 21:27:43 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y7so349416wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 14:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=kJamQ/nBTP1ypw5ITaxD828SEUM56vCCeatwU/KlcQk=;
	b=Ldjkofg3SXIsNqXaSy4xID/sVs9YbDiw9D05hvbTtN9+pw50hq75iCA8XkWBdUoJfx
	XnTXCM/OaaUrsQSJHcVzmB4RRyIQfFVZroJS+gcYkPx+Uz8XN3a5kIQIvWmF7Y13fXJf
	cNCLdxJKZkj8V0RWEel8jdJt3VDXJKfzi8vRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=kJamQ/nBTP1ypw5ITaxD828SEUM56vCCeatwU/KlcQk=;
	b=P2gAQz5eHK7gFLmNGHhTlaGnLFIsVUPBX+8JLvFWVvmEYEqWzNbk3NxJNBuk7bDu54
	iIeOHxtXrsLSGOAyLNpAXdCr4Wpi7BMw8smyNSAqOumVPOiJSfzmcN9r7nsTDLIZPMMV
	XxvO7xZq6B3+OPRlZqNRI3i4nT9o2hkY/2dZpBwlNyNKjfS+tF26Wr3pvyA1w7z8bQeh
	Vcukmn86FF9V9bKicV7UbDCr0awyBuA7Gz0AcOR9tmmfkv3M1/NxN1C/6fgkTx4U7rrN
	LjVDRYwoVcazN795uTYD7imep2UcVJZsBKs6ttxITH+z7vL0SCcQhOwz4ucX4x7KR6v4
	LmSA==
X-Gm-Message-State: APjAAAWdh3thaHLZ0G5wsa9CmRK7hldJTUXyoD40IUj9kb/q0aXBvSVm
	SWhMkqCzsN2teNMBpjFCjI+W6A==
X-Google-Smtp-Source: APXvYqzw+F8hz8Q/33nEth2Bg7HYXfTzuEic1rPHb0yUvkliSkzvGxqNEbojus3bS9sPOBWNpWjiXw==
X-Received: by 2002:adf:edcf:: with SMTP id v15mr16837682wro.20.1554845264262; 
	Tue, 09 Apr 2019 14:27:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	7sm115677259wrc.81.2019.04.09.14.27.42
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 09 Apr 2019 14:27:43 -0700 (PDT)
Message-ID: <f755b3b339b8b6482ab99d29b733af43aa28cc00.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Mark Asselstine <mark.asselstine@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 09 Apr 2019 22:27:42 +0100
In-Reply-To: <1552922513-21915-1-git-send-email-mark.asselstine@windriver.com>
References: <1552922513-21915-1-git-send-email-mark.asselstine@windriver.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [v3][PATCH 1/2] go.bbclass: Export more GO* environment variables
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
X-List-Received-Date: Tue, 09 Apr 2019 21:27:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-03-18 at 11:21 -0400, Mark Asselstine wrote:
> Currently we are not doing a good job of consolidating GO environment
> variables used by the go build system in the go.bbclass, instead we
> are relying on the individual GO recipe authors to perform the
> exports. This can result in inconsistent build results and often
> binaries that are not properly cross compiled, resulting in segfaults
> when the applications are run on the target.
> 
> For example the GO documentation recommends that the environment
> include a value assigned to GOARM when cross building for ARMv5,
> ARMv6
> and ARMv7 (https://github.com/golang/go/wiki/GoArm).
> 
> In order to avoid polluting the build scripts with unnecessary
> exports, such as run.do_compile, we attempt to only export variables
> when they apply to a specific arch.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
> 
> V2
> * Avoid potential undefined situations
> 
> V3
> * Add more exports to cover the basics
> * Tested on all qemu* variants, -native and build test other BSPs
> 
>  meta/classes/go.bbclass | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index 7069c5f..78c2d68 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -8,6 +8,25 @@ GOROOT = "${STAGING_LIBDIR}/go"
>  export GOROOT
>  export GOROOT_FINAL = "${libdir}/go"
>  
> +export GOARCH = "${TARGET_GOARCH}"
> +export GOOS = "${TARGET_GOOS}"
> +export GOHOSTARCH="${BUILD_GOARCH}"
> +export GOHOSTOS="${BUILD_GOOS}"
> +
> +GOARM[export] = "0"
> +GOARM_arm_class-target = "${TARGET_GOARM}"
> +GOARM_arm_class-target[export] = "1"
> +
> +GO386[export] = "0"
> +GO386_x86_class-target = "${TARGET_GO386}"
> +GO386_x86_class-target[export] = "1"
> +GO386_i586_class-target = "${TARGET_GO386}"
> +GO386_i586_class-target[export] = "1"

I'm almost certain that you don't need the i586 variant here as the x86
class should cover that already.

The export 0/1 thing is ugly and I which we had better syntax in
bitbake but its too late in the release for that now.

Cheers,

Richard


