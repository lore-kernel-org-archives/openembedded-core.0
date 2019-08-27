Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1A7317E71A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 15:56:31 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id e8so2729833wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 08:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=WEc4gKxOsq3EVAaS2PT8/86j4aVRCza7r95kC8HILbs=;
	b=I9TWPY9AXoNyDoyeeEVpIpltcXf5OxQTgSOTutRKSI1LsuxHEl0iFjoKTxbYUE9Ly4
	jkv6IGgklt+361BDSPQ1/pQk08Ieu8yD/wqOM/JcjEGOBsC6welddI0cAmsgluV/YxPS
	WTVvZ/3iHdbCrv2eFhRCDrFQDHu8X6kSHASTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=WEc4gKxOsq3EVAaS2PT8/86j4aVRCza7r95kC8HILbs=;
	b=XfUgyb8EHKiJU5TbkZ4G+hPRajOLcOPFaQiO02gVp9W8kLqWQIc+N99ZjfUIkm2K2M
	FLaUcB90TSsQgszBeGw6Je56ffhPgoLQk2W2oL4hbRAFaoEZZdezvYsRNsQ+Ja03KHQb
	X4LhCCDutm6V5b4FiMArEtM+ncV8qiqSenpiP5vIR0fO1xK5ia8BOiTkpX22QTCUJ5ZH
	ydKF9EBdJNbKh2H0USM8j3IbJqXU0bhOKxFKL/ksuK4QrgTT0QZfm9fzZZLLZk9BFwi3
	0KWKQEvBEstPmdGds28689eQvCW96Kw+eg03Xv/oQg0Pn96kygwZ10kYGihyvuqM2E3h
	o6kA==
X-Gm-Message-State: APjAAAUjwm/dieUO23K75Xn8kys+UiSzLSilMhNb6uHpyVqqY27PPMcw
	HbNewmunWXUTkXSZE23BRbY3gA==
X-Google-Smtp-Source: APXvYqzHGNXuIpwcrSdGVKjJm/WvVQUDk9CLIIoTh+2joj94ymOE+Kd6wtG/oWK997OpVrPGf2OhYw==
X-Received: by 2002:a7b:c453:: with SMTP id l19mr28634296wmi.106.1566921392614;
	Tue, 27 Aug 2019 08:56:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p69sm4825603wme.36.2019.08.27.08.56.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 08:56:32 -0700 (PDT)
Message-ID: <e8a4362684b1f664344132261b6458396c711842.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zhe.he@windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 16:56:31 +0100
In-Reply-To: <1566880686-191373-1-git-send-email-zhe.he@windriver.com>
References: <1566880686-191373-1-git-send-email-zhe.he@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] ltp: cve/meltdown.c: Fix kernel symbol finding
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
X-List-Received-Date: Tue, 27 Aug 2019 15:56:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-27 at 12:38 +0800, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
> 
> Backport a patch to fix the following error.
> safe_file_ops.c:219: BROK: Expected 3 conversions got 2 at
> meltdown.c:272
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  ...-cve-meltdown.c-Fix-kernel-symbol-finding.patch | 83
> ++++++++++++++++++++++
>  meta/recipes-extended/ltp/ltp_20190517.bb          |  1 +
>  2 files changed, 84 insertions(+)
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-cve-
> meltdown.c-Fix-kernel-symbol-finding.patch

Patch doesn't apply, how was this tested?

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/981/steps/8/logs/step1b

Cheers,

Richard


