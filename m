Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id EE7FE77046
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 16:08:15 +0000 (UTC)
Received: by iofh134 with SMTP id h134so25852074iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 09:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=hNnaoqq6jkutvQxjpbXfsLdVA6yFolPE5bViCxygqRk=;
	b=OQ6fMHWO7Q+gRisFkdE7H2M26PH/0eIQWjYMuQViIV9VbThsNg05rNHUt3uLoJBr0V
	m7AgW6zfsr4okbitoYI8iGWN9z9JX4zEKDL5sh1NC3YDfsIWgduNRga8JZ4m+84d8Zbg
	MoohvYNoLknaE4hf5Rrgc2FCzicPopKWNZk82jSaoVoGGIE0p4Y5V41BaQpcGcmSNQ0c
	sHGR4LXG8l/ctLZsylr9USO77ieeAl//ZpYtg252e73ltVNKCq+VRu+7b3mTkwAE1Z72
	8U5KU3Mxvqo/KstTvNRoJ9Ir+W3rgevbhCcEGyArYtF5CUlXmWM4e7m6RhCFWktDR23r
	KuTg==
X-Gm-Message-State: ALoCoQkkNrUHq43fNz2byZg4mYnq5g3SI6d9Grgx7Dl8+8FPyRRpfbCkpRzcPFDhMGSEAHf1Y+wc
X-Received: by 10.107.32.76 with SMTP id g73mr18270968iog.134.1441210095734;
	Wed, 02 Sep 2015 09:08:15 -0700 (PDT)
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com.
	[209.85.213.169]) by smtp.gmail.com with ESMTPSA id
	g65sm19522782iog.33.2015.09.02.09.08.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 09:08:14 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igcrk20 with SMTP id rk20so28596189igc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 09:08:13 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.32.69 with SMTP id g5mr4325717igi.5.1441210093895; Wed,
	02 Sep 2015 09:08:13 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 2 Sep 2015 09:08:13 -0700 (PDT)
In-Reply-To: <33a0da1f6331b4d44deefc5b7916d984981d2c30.1441207840.git.patrick.ohly@intel.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
	<3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
	<33a0da1f6331b4d44deefc5b7916d984981d2c30.1441207840.git.patrick.ohly@intel.com>
Date: Wed, 2 Sep 2015 13:08:13 -0300
Message-ID: <CAP9ODKqH+pQPezQo1CSyybYU3du+4_B+HOgxzBqui6uCE5Z6hA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/10] initrdscripts: create /dev/console
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
X-List-Received-Date: Wed, 02 Sep 2015 16:08:16 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 2, 2015 at 12:48 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> Some kernels, for example linux-yocto 3.19 for qemux86, fail to
> execute /init in an initramfs unless there is already a /dev/console
> char device in the initramfs. Booting then fails with:
>     Kernel panic - not syncing: /dev/console is missing or not a character device!
>     Please ensure your rootfs is properly configured
>
> The panic itself comes from a linux-yocto specific patch to
> kernel_init_freeable in init/main.c, but even without it, that
> function will print an error when /dev/console is missing. The
> kernel's Documentation/initrd.txt also mentions creating that device.
>
> It remained unclear why this is not a problem on other machines. On
> intel-corei7-64 from meta-intel, something (the kernel?) creates
> /dev/console and /dev/[012] before transfering control to the init
> script. In that case, creating /dev/console in advance is not
> necessary, but does not cause any problem either.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>

I fully agree with the patch but it would be better to split the patch
for both recipes.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

