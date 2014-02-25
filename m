Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id D682A6ED65
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 17:36:59 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id uy5so9113335obc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 09:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OcbtEfkAIbpZQK3vg+FesTefKSYYVEhlwmGswbJJs08=;
	b=NxH3DoDKXmypWcBQnlKgPWNC+5nZiKRiZ1+S7jVDtGCdz0aldMmc2KJFL3sMSVkM3+
	5QZOXe4cThfLSVwfdpftlpMXHNeRQTbEJozCL35X3XqbUQDxOqZb+YEELAompMtznXL1
	fZDmrlftSnwUmQG80rJ4CTF2CX2qEvdTaTzg0oUZVgtve/rCGUtJMs5+RDfhYBexAJiB
	Qfk1tv21z4i3en7uqZAEhyQT7qrLwSDnr0Aq1HONqxAztJ7nx/TDS1/k1bedLz3/jVL8
	fG7LW4k/y23p4rSCKH6SlgFptKRL5i1FMagO7lyu8T2qKSpzJwHWXViVDP+D2Lk2GlwP
	V6tQ==
X-Gm-Message-State: ALoCoQlCICKWO1+/HVu3g8/9Nev9lCrNdo9Yzn0FmpuAOE0RsbRixlqj+htlmMdeNwdRacm/F1uT
X-Received: by 10.60.130.234 with SMTP id oh10mr2424945oeb.60.1393349820283;
	Tue, 25 Feb 2014 09:37:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Tue, 25 Feb 2014 09:36:40 -0800 (PST)
In-Reply-To: <20140224160954.GI26981@jama>
References: <1393253881.31769.6.camel@ted> <20140224152753.GG26981@jama>
	<CAJTo0LYBuZv5NDyM1gsQEL5KQfOvMsRpvOn5kjFaYBi5XL8wCw@mail.gmail.com>
	<20140224160954.GI26981@jama>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 25 Feb 2014 18:36:40 +0100
Message-ID: <CAP71Wjxz0e7qzU4tVZ3XEpF1oZtCErqjD4pPnETVJLnoecq3QQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Separate build dir for autotools
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
X-List-Received-Date: Tue, 25 Feb 2014 17:37:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 5:09 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> That list is opt-in and mainly covers oe-core, so this gets tested
>> every time the YP autobuilder does a world build.  We need a meta-oe
>> world build where autotools.bbclass sets B="${WORKDIR}/build": it's
>> literally just this one-line patch.
>
> But doesn't cover oe-core built with different combinations for
> PACKAGECONFIGs, .bbappends etc, so including this file in
> defaultsetup.conf can still reveal few issues in oe-core recipes.

right. I have recently (on dora) noticed that mesa build is broken
when using separate build dir, i have the following extra config:

PACKAGECONFIG_append = " gallium gallium-egl gallium-gbm gallium-llvm"

since gallium-egl needs the egl.h files generated during mesa build.
the generated files stay in $B while gallium-egl is looking for them
in $S (or sysroot)

