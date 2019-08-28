Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6D6277E995
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 00:15:10 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e16so574523wro.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 17:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=PUKlRpQIQFFCsOzH0qiY1gONrw76aN9aW2jo7VdKFlw=;
	b=URObEkE3f/wC/jfcoQe+j9h07UCTh8HRMp6TZuQAhzI56PlEjrb30TvgwRcEanNUlV
	gI5PBvt3UC1Vft7t1ZcUnQQ4/3u9+2RWNH4DlHg6T+lYlcL7+co9c6Ajmf5il6YaL95l
	OeEUKjMBbYBD4taaTdKESgBlhugzWlB685cWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=PUKlRpQIQFFCsOzH0qiY1gONrw76aN9aW2jo7VdKFlw=;
	b=VOqNpZPgKzBdYHL5a/D2kcsb1DuFbnTWhVer/Y/p/F8nRe592ZLeJ6w28xxWQLEalO
	uTZRWUjBE5mP2PUoAo3gd7yr1qMSifAF7XQG8IbhNgLZVmSr+WIdoOsMAXOBwlXAxp71
	b5wov3TGYYAfoJzjmxpPa0gDNJQnOiMNEsbc7yNe2FHskBYPUqXPW0RR/DEpTl8nFC9N
	EqNwEVgJqEoxJ8AphfFvZMdsW22kHZSxQWi3jioSvGIz30KfeQmprWUTWdCrmFy0wRus
	4QLQWjoShle/NUzeuuFIYwnKqtI2YtompQ6rnd/QsfXuuWcXlE5HuCDLZ0DzuIeDXjTl
	iTXg==
X-Gm-Message-State: APjAAAXos3ScR734CRw0UQR3+MnXxUaBwHAZFX2aMumL5RFfL2g/grsT
	q5G+L8HZ/adRmSQwYJ4P36r4Kw==
X-Google-Smtp-Source: APXvYqweuKKiMNA6ay2lAcUMoJYlstRy8OZ4j7XoouNlYLFI0Rug6Jg8+61Ry/Pm3QIPEIdhUR8apA==
X-Received: by 2002:adf:f008:: with SMTP id j8mr669866wro.129.1566951311034;
	Tue, 27 Aug 2019 17:15:11 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id i30sm880331wmb.20.2019.08.27.17.15.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 17:15:10 -0700 (PDT)
Message-ID: <fa27a4877d9dd0668e23873e02f8bd90bdf93ac0.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jason Wessel <jason.wessel@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2019 01:15:08 +0100
In-Reply-To: <1bd6ab16-628d-2326-d6c3-c6097d7ba698@windriver.com>
References: <20190821002750.52062-1-jason.wessel@windriver.com>
	<0f501dcaee763d8d33152fbd82af53385b8d0dc9.camel@linuxfoundation.org>
	<1bd6ab16-628d-2326-d6c3-c6097d7ba698@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] serial-getty@.service: Allow device to fast fail if it does not exist
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
X-List-Received-Date: Wed, 28 Aug 2019 00:15:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-27 at 19:03 -0500, Jason Wessel wrote:
> 
> On 8/27/19 5:58 PM, Richard Purdie wrote:
> > Hi Jason,
> > Somehow this change is responsible for this build failure:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/976
> > 
> > (steps 5c and 7c so failure during testimage).
> > 
> > I have bisected it to this change, I haven't looked into why.
> 
> Thanks for tracking it down.   I am sure how to try an duplicate
> this.  I clicked around to try and find out a bit about what it is
> running for these phases of the build but it is not very obvious.
> 
> Is there a local.conf I can try along with what ever commands it ran?

The configuration its using is shown in 
https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/978/steps/8/logs/stdio
for each step.

Cheers,

Richard


