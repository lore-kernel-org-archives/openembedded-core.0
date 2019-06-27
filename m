Return-Path: <lemagoup@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9AA78F72
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 09:11:09 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k8so3187488iot.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 02:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=s4PEp57zGmsTGG0G6Nh5R115+kBYUZaKoY0dSebCVbg=;
	b=YqjPAODR8kOq7Zk0tlDEXSNVPdjiTE7mXRmofm44RW/xWPnmZvwO+giZfO20TnYH6u
	5ZH3zYio7ymVEl9hyLz12VZY6XpDAZFaJ0Binx/BWRcLCWj/tTF+MZYQ10kR2GaO2Yxs
	3trq9uhXxLnVIncSBPLx7w+XFVH3EIMyfZGJNaHr4wRqMRae/5oNR+iCrWGHIU+q1nXG
	7+YsIG1jh4BdY6//+A5UbMzP3XK9i1IoeJ4FyOx0TuWFz57t8bSIaFgcz/yLNwyEuZul
	RDYivowuVHQqb5KyfQwvnG6xQCG+pB2tF5WiGudcoo5RlAxWy121phRKJP4P84QklRQ0
	me/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=s4PEp57zGmsTGG0G6Nh5R115+kBYUZaKoY0dSebCVbg=;
	b=D8CDqtKmPvvKsfBKv8yN4wIPa0cJpZhN5dfrC1dThvnow5vvomBOonboDsKDIRhmRl
	GClh1pJq/mFInTdS7POqJOC0pvphLz38ec6/vDAaUW7TYDf5oPxSkTSKpPPmD5+7dZEs
	wUPNgxIppG/nbFs5zOlS2nFNjDWGRG9ntTvNj2Gxhl4tAe605yeDTwWHjw5pINZRi2uK
	5GAma3Pmy3Akz5W/9mVcD3RUYU9/KJEiUjocu5gquxm6O6PnxjccZa9kzfurYMSFU6+2
	ZtRZJTlVTOihFkf7EnwICcFRtZzQxhEfr0HcrPjEZi1Im73nooeWEZZ+NAxWLoXZc9Ig
	HfKg==
X-Gm-Message-State: APjAAAVd8KxwWwWC2Dh0TFogSKxaSZWTqlFF+XpMvOS54NCr1ejFhHxo
	VI/B49e7S6HtLn66WpFpN83VU+0yB64M6hDKjPyxJJVO
X-Google-Smtp-Source: APXvYqx/ShFqAmSOma6/2jCQYbGY5yMsJe/1nCwmzgJMLv0ZNBS38LC9uGW9qFiT86KxHwUqEo0XyNcJnHVxGo4KwiA=
X-Received: by 2002:a6b:c80a:: with SMTP id y10mr3665406iof.170.1561626671125; 
	Thu, 27 Jun 2019 02:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190619135940.18544-1-lemagoup@gmail.com>
	<065a68d75756f3afbc07d2229e307969cd4de386.camel@linuxfoundation.org>
In-Reply-To: <065a68d75756f3afbc07d2229e307969cd4de386.camel@linuxfoundation.org>
From: Pierre Le Magourou <lemagoup@gmail.com>
Date: Thu, 27 Jun 2019 11:10:59 +0200
Message-ID: <CAEz4NHqA3ohB=MOiT2PskneU93PJmgq2P84uUqQ0PZi6nzf21Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] cve-update-db: New recipe to update CVE database
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
X-List-Received-Date: Thu, 27 Jun 2019 09:11:10 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

> It looks like CVE_CHECK_DB_DIR has no default value which resulted in:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/988/steps/7/logs/step1b
>
> We only started seeing that error after your later patch to add back
> the do_fetch task. build-appliance is trying to collect up all the
> sources it may need.
>

I see the problem, it happens when cve-update-db do_fetch task is executed and
cve-check class is not inherited. I sent a v2 patch that sets default value to
CVE_CHECK_DB_DIR.


Pierre

