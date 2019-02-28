Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id CE1FB7CCBA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 15:21:59 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id i16so22362999wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 07:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=C/P2XMin9u+rigxVWA1wefZAwSJ0fMiC2Siby0auou4=;
	b=hLqMmi+K5UdjmtmpZPIF9w89mWPU9ui3Vco1bcmyFtfLUQ4S4lyQmEhQryjW5jh+lZ
	LM5yxkYWXvYt9PsNK/FFWkmtl7hRX5Muy0ve0gMjYgxbncUl/ixFWL5LcWFtvNi0qjuP
	wj79wogrNAPUsA+Q/TKcDkzCk0m68jzEzujoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=C/P2XMin9u+rigxVWA1wefZAwSJ0fMiC2Siby0auou4=;
	b=t+ipDbjMUNE+JW/Vhw+wgMwSeCRVy91rtDpnQ6vyCEu3EgGxhqttZOneuIKrVjt3Z0
	/IxXUUqjhyLJQwACoA9qb/2aqhr63Vvugyi06P1e1LUZPa9U/aOKJPMRI3qemC1MrO0P
	DHiAh76MOd882hqwdQYSVEqnXymNTetCzbcgssprw5db/5Jh8HujIpF0jQyqLAuJt92O
	JGGh1dPXaQosY/i2kov3VqPLu0cCIqotV8OxIsuky+++Su1C//JVSZf/AOZoNi/IDhpo
	P6lWO/l9eOWPa8wQfKKdPH8TFZ3eB2ZB9lkW0DaK9hxg9Gh7R9u75zg0PjYc41a3RiMu
	XiYQ==
X-Gm-Message-State: APjAAAWce8vIzfO/OVXmBj7pZc5uituz9ZXSvJxoCFvHJ0YcGB9+s/I0
	gKgBe4oim4gzMOyKj7/HBSVpXQ==
X-Google-Smtp-Source: APXvYqx0T4oxSAKxqUDJPRN5zUNbkby76IgpSmP7fyIqlSEl1LOQKva/W5UtFJChY0xtEU92jcQVKw==
X-Received: by 2002:adf:fecd:: with SMTP id q13mr6756035wrs.3.1551367320438;
	Thu, 28 Feb 2019 07:22:00 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f126sm5256703wmf.6.2019.02.28.07.21.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Feb 2019 07:21:59 -0800 (PST)
Message-ID: <13316d216954b0238c5a05b0f821bb74858c1065.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 15:21:58 +0000
In-Reply-To: <983e13de-1319-ca48-a022-6b00d7409569@windriver.com>
References: <20190207003537.7135-1-raj.khem@gmail.com>
	<983e13de-1319-ca48-a022-6b00d7409569@windriver.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH] glibc-locale: Rewrite do_install using install utility instead of cp
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
X-List-Received-Date: Thu, 28 Feb 2019 15:22:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-28 at 09:53 +0800, ChenQi wrote:
> Just to provide some feedback.
> Even with this patch, this annoying QA issue is still there.
> WARNING: glibc-locale-2.29-r0 do_package_qa: QA Issue: glibc-locale: 
> /glibc-binary-localedata-wo-sn/usr/lib/locale/wo_SN/LC_CTYPE is owned
> by 
> uid 1001, which is the same as the user running bitbake. This may be
> due 
> to host contamination [host-user-contaminated]

Just seen on our autobuilder too:

WARNING: glibc-locale-2.29-r0 do_package_qa: QA Issue: glibc-locale: /glibc-binary-localedata-gez-et+abegede/usr/lib/locale/gez_ET@abegede/LC_MESSAGES/SYS_LC_MESSAGES is owned by uid 6000, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

(https://autobuilder.yoctoproject.org/typhoon/#/builders/70/builds/346)

Cheers,

Richard


