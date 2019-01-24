Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id CFF367C240
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 16:37:48 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l9so7149042wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 08:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=EPxvE22qn3EVFWPUmzutiEglSYi+sUO/hbwKX4AFebg=;
	b=UQLL2t5C9e0odNvG2kdGsoqlLt1ou0eKrvpBvS8SiRO4DCroWisR10XqWqqCHlPcab
	ibVl2/vVzq1pfxNlpsmrl62PaDEr5pye4NifspOvnkmlN8fVtm9AcBVDs+M9o3Cf3YR2
	wh7Fe50/0ZwAFLRw57WiBFEYPkcbBcUhsOUpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=EPxvE22qn3EVFWPUmzutiEglSYi+sUO/hbwKX4AFebg=;
	b=FEyC6d+j36zHktwpoBB4B4TaTWsgnUyP4/OJnyRmqp79zzHe1HOQ+AL9A6hfMCg3ed
	X/ee7ex5pMvAKTlYOeBPppXPbFCBGx1eixL3AcFaVsboxteE2yACkPbQ3dBFt0BMK59U
	qyE6i4vN9ZmlidrJHg4uG8Q+B+XsA+5SINauMTqDu98eHzuADk87WZladVEbSaET5rwJ
	l72kHKVk35hhXfgH70l2HSuS3mlEC04HuNMVbKfQ/ALHSBDxFd1PW+U1I0HHvjUNvdI0
	rnuIOH77kv7PZVHJwnIUY08C6BMqNu5046ecDTVnB25hG0QktBri83EU+d90YHIQ+6MQ
	QXgg==
X-Gm-Message-State: AJcUukdwmQOAaIQ5LrylxHjH3s2sTBJhiJxXQWeKEXcWLnqU5YQcyxLT
	h+vc6LZakRRZ2i3s+qhKw+49Zw==
X-Google-Smtp-Source: ALg8bN7VRJyK5bn8vUbkhmJGuhrOQh9dUKqTfKhCsOgp4Gl3uWefq0gTD7B9vwQV7lsHHVWu37g5Ag==
X-Received: by 2002:adf:9d4c:: with SMTP id o12mr7471750wre.94.1548347869351; 
	Thu, 24 Jan 2019 08:37:49 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p139sm121359876wmd.31.2019.01.24.08.37.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Jan 2019 08:37:48 -0800 (PST)
Message-ID: <c55556f5b3b05d24c66254ade873c44c155ef23b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2019 16:37:47 +0000
In-Reply-To: <20190124001802.32109-1-raj.khem@gmail.com>
References: <20190124001802.32109-1-raj.khem@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH V2] arch-arm: Do not add -march options for arm architecture along with -mcpu
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
X-List-Received-Date: Thu, 24 Jan 2019 16:37:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-01-23 at 16:18 -0800, Khem Raj wrote:
> tune files which inherit the arch definitions already define
> appropriate
> -mcpu option, which is equivalent of right -march and -mtune
> combination
> and is preferred since gcc is getting stricter and stricter with
> option
> check semantics and can now find incompatible -march and -mcpu
> options
> better with every release. It does internal feature consistency check
> and if it finds out discrepency between what -mcpu would expand to as
> compared to -march it will flag the options to be incompatible, for
> naked eye it sounds wrong but gcc would translate -mcpu to a given
> -march internally and it might not match to what we set in these arch
> files.
> 
> The effects are quite subtle, where this can result in configure test
> failing to compile due to these incompatible options and a feature
> option getting disabled for a recipe for no reason.
> 
> e.g. with gcc9 which can now detect that -mcpu=cortex-a5 and
> -march=armv7-a are incompatible, many features in libstdc++ ends up
> disabled due to configure check failures e.g. size_t size, ptrdiff_t
> sizes, which inturn results in compiling libstdc++ with unwanted
> disabled features.
> 
> If user has machine definitions which do not inherit the arm tune
> files
> then they can still use the -march switch as such
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Only delete -march if -mcpu is set

I suspect this might cause:

https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/212

Cheers,

Richard


