Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web10.24072.1629726164744630064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 06:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=knFC8tFJ;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mIADq-0000QU-2D; Mon, 23 Aug 2021 15:42:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4yJ3le1+qDfCJzyNgs+pNEktNZ+wzZF2b8cyoqmin/U=; b=knFC8tFJ9+cEQL8t0hwtUhxqt9
	CLGDx32of0LC/egIB8ZCNmoAOiudFqueH1Vs3phbr4cOnGKxkdWyikT6ZCsBgZ3Y3LQ4zYsDmFP4f
	FJbm45NnqbfCjhuMurMaC1R68npCnIcwzyh5+0OXzfaZNMP2lM7arE96I7wrKAywUkoEc6xPsEvXm
	XhQaTuwewx7RX1KZOXJYP4xHKKUjCwpkV/rG+0as9hKqbnAVSycIo59+i1jvM5MqZlXIyjUKoADpf
	2RauIENsShWxZNsE26KJ0c3fzeuLjzSvsLBLXPvauS2i9I1/ZOfqYa1lDBsMjeViWCQiI69ne81Qw
	/fSHPo6Q==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mIADl-00083x-Jj; Mon, 23 Aug 2021 15:42:40 +0200
Subject: Re: [OE-core] [PATCH 1/6] package_rpm.bbclass: Handle posttrans scriptlets
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, zboszor@gmail.com
References: <20210823122323.97400-1-zboszor@pr.hu>
 <20210823122323.97400-2-zboszor@pr.hu>
 <CANNYZj_VL-bxXG_mb-Z5QaWhHZvr4p+LVnvgODm84tRkSrFjEA@mail.gmail.com>
 <fb092fdd-103a-9eb9-c070-b72313d45fdd@pr.hu>
 <3fc9ff4e880846c2cfd52fb5659c3294424ac176.camel@linuxfoundation.org>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <c090aae7-ebac-1a8f-8aca-162cebac8c5a@pr.hu>
Date: Mon, 23 Aug 2021 15:42:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3fc9ff4e880846c2cfd52fb5659c3294424ac176.camel@linuxfoundation.org>
X-Spam-Score: -1.9 (-)
X-Scan-Signature: b899a7fb3baab380f674538c2418a553
X-Spam-Tracer: backend.mail.pr.hu -1.9 20210823134240Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2021. 08. 23. 15:23 keltezéssel, Richard Purdie írta:
> On Mon, 2021-08-23 at 15:14 +0200, Zoltan Boszormenyi via lists.openembedded.org
> wrote:
>> It's documented at www.rpm.org, Red Hat and SuSE.
>>
>> https://docs.fedoraproject.org/en-US/packaging-guidelines/Scriptlets/
>> https://en.opensuse.org/openSUSE:Packaging_scriptlet_snippets
>> https://rpm-packaging-guide.github.io/
>>
>> It's available since RPM 4.4. RPM 4.16.1.3 is in Hardknott.
>>
>> A short Google search showed that *maybe* dpkg also supports it,
>> or at least there are(were?) plans to implement it:
>> https://wiki.debian.org/i18n/TranslationDebsProposals
>>
>> With postinst, the time when the scriptlet runs may depend
>> on the order of the packages in the upgrade transaction and
>> may run with the older binaries in place.
>>
>> The posttrans scriptlet runs at the very end of the
>> install/upgrade transaction, just like the OPKG "intercept"
>> scripts.
>>
>> I successfully tested it long ago with a kernel upgrade
>> that was running dracut on the new version, plus a dracut
>> upgrade in the same session. Dissecting the initramfs proved
>> that with postinst, the old dracut version generated it,
>> while with posttrans, the new one did.
>>
>> Who would want to use it? Anyone who needs some finalizer
>> script to be run at the end of an RPM/DNF transaction.
>>
>> I started on Angstrom and I know opkg doesn't implement this
>> and Yocto inherited it. This patch is basically a heads up
>> that there's another way to do the same thing. Maybe opkg
>> implements this some day, maybe not. Anyway, Yocto in general
>> will need more changes before the main package.bbclass can
>> start to use it for all package formats.
>>
> 
> There is a bigger issue here which is how can anyone use this without making
> their recipe rpm specific? I'm very reluctant to add functionality like this
> unless we have a way to emulate it or fall back on the other package formats.

Indeed. This patch can be dropped.

Full disclosure: I don't use this anymore, since I implemented
another two bbclass recipes to generate the kernel's initramfs
either during the kernel build (and ship it in a subpackage) or
during do_rootfs and move it out of the way in the image postprocess
script so e.g. a squashfs image will have it separately.
They work well for my use limited cases:
* full OS installed on disk
* squashfs for PXE-based remote booted machines

FYI: the dracutsysrootdir feature in recent dracut versions is my work.

I just carried this patch for a couple of years now and I thought maybe
someone sees some value in it.

> 
> The intercept pieces are used by both rpm and opkg and actually do something
> slightly different, they stack common calls until the end of the transaction.
> This means for example we can call "ldconfig" once rather than in every
> postinst.
> 
> Cheers,
> 
> Richard
> 
> 
> 
> 
> 
> 
> 

