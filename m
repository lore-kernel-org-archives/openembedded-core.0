Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 33A1A78BE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 13:06:39 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b11so1972273wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 05:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=bns8yH5WcLmi6pmuAq9VB0MRNnaSBwsBn+dbYODTSW4=;
	b=KBBO8yH73dTvFfCaaitehcgF6+ub3ogOhbRO+QIPj6daUmzZzq2EQqH1O/tPX/P7TB
	apAzI4i0dDk4UuDfmcjknAPsb6CegCiI4t2atcqB9lJ4RVaw2pxvJ2mixF+lSESZloR9
	ksIaAKLd6eoB4BaGkXvsnMP4z8B2e6d/kwEBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bns8yH5WcLmi6pmuAq9VB0MRNnaSBwsBn+dbYODTSW4=;
	b=Iqzx1RKJ/d4HIK8rAXt9zZZqNlNZ0w4kFCRlkMqCWB59ktIK0jJmK6ZBNailB4/Gv7
	v7oZ8s7Mw9nt6FgAPMEdZfAZmZyRpCZHqD6gIwUI5E2UYu3PHXVUBT5I7tvyhOkyDUK3
	GbGOYhVEbN0RVIiOS1sCDx4Brr/zpmWQKKM8f8EyI4vwgWpHDl9XnP+JyWiBFlvuNaT5
	qUA9/wESOneHkUxDZ9bKNrAHMh17EPZ8q3Kayqd8nFALFIQ412VDeMWp3PMrR3FN4VmN
	+GDqPePTId70Jb2wTUwzCEmKNKLUHDZtISR9V8TAh/Kv5iQTEGD4v0+vuwdj0Q89lb0V
	TOAg==
X-Gm-Message-State: AA+aEWbHkdVLq73Xf20Wz2v+Ebm2/skXq8ymlFtnrEoDt8RePX2dkEV3
	OqZHD6Pw++uuUYVPR6kc9P1OEw==
X-Google-Smtp-Source: AFSGD/XnnFCv8uCQfYmcavYa6T7k3mNq6iHjJj+0/f8qqb01rM5tB/lB15ORph60Mv4D8kr9JQWqfg==
X-Received: by 2002:a1c:630a:: with SMTP id x10mr11567853wmb.63.1545311199861; 
	Thu, 20 Dec 2018 05:06:39 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l20sm17408406wrb.93.2018.12.20.05.06.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 20 Dec 2018 05:06:39 -0800 (PST)
Message-ID: <57496d3f8ac212e1392ff6e908cd126abf111412.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Douglas Royds <douglas.royds@taitradio.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 13:06:38 +0000
In-Reply-To: <20181220054044.29476-1-douglas.royds@taitradio.com>
References: <20181220054044.29476-1-douglas.royds@taitradio.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] libpam: reproducibility: Fix host umask leakage at patch-time
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
X-List-Received-Date: Thu, 20 Dec 2018 13:06:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-12-20 at 18:40 +1300, Douglas Royds wrote:
> The patch file pam-security-abstract-securetty-handling.patch creates
> a new
> file (tty_secure.c) at patch-time, so its permissions are subject to
> the host
> umask. This file is later copied into the -dbg package with no change
> in
> permissions.
> 
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  meta/recipes-extended/pam/libpam_1.3.0.bb | 3 +++
>  1 file changed, 3 insertions(+)

I've noticed you're sending a number of reproducibility patches. Would
you have any interest in helping us develop some reproducibility tests
for OE-Core in meta/lib/oeqa, probably as part of oe-selftest?

Cheers,

Richard


