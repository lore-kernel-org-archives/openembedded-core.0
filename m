Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4DA6B7D65D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 06:17:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45nCxT0qBQz3l;
	Mon, 15 Jul 2019 08:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563171453;
	bh=IPRhLgPGKUaBFYV5HCZ4hou9Nph7XcwIwC9XzA+IVyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BDmOVz2D3VG0ifv66Skp7fbD02MzXx1UiuW09jlsnpL+7zztuDZPoAd5DOAXLtu2C
	09UwVrvM/IgAMg+MVZ+dsAhb1RzQb8ueAFO5yLVXyJE5F3sOPBR0SvZWLCnf60o6Vy
	8dP9r+I7NVS61YvUMBW2zRQtGcWqTDeN4ymjmmDoWb1oInnhMG0bAb2PkUsVtZ79eg
	Lxg2Zn2zwGs1H38DOMxoZAgZowbI6eLjpp6/KPKFR+wOYTLlPdF8DdmRVSldt8ccaa
	QWOR5UDhvImJ0pS0vfjRiaEVSrp3KlO1eSo5h59OF1760CPvD5NLq/+GfWntOJmKgj
	l9fX6ujAuJQ2myP5urVw1kIgppDKTu1gds9rJvaUM7QmMrFENs+1qgu70JMA3PVfT9
	RzvMfl53vZU6U01/wVvNT/mw5MM5cOYpW3dJwb/tr+8xY8ygFcT5rAlSCxRTblXuqQ
	OBRFTtIRZkMd6ouLqNXYseorreeuDn3Z0FgjuWtfulJicfsZpSPgUfqy5w0g7x+ezK
	zlo7VZmo42blug6MfZt5FPzKsQVE3hXz3ZV9N16FWFBdwLKiiBx4HxPRwcH02khjy0
	d00jXD7vnbxTyoLMsPTMyuCHKl8oR39pJ6vZ9AkXraUAzxvh/kWAFa6I55npohpqM8
	tauqyEiEW5GFvTnhaxbxeT+E=
Date: Mon, 15 Jul 2019 09:17:29 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20190715061729.GA21719@localhost>
References: <cover.1563168887.git.Qi.Chen@windriver.com>
	<c383309fe15b52683ac90b50d4305922c338b470.1563168887.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <c383309fe15b52683ac90b50d4305922c338b470.1563168887.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] msmtp: fix postinstall to avoid do_rootfs failure
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
X-List-Received-Date: Mon, 15 Jul 2019 06:17:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jul 15, 2019 at 01:35:15PM +0800, Chen Qi wrote:
> When lsb is enabled, that is, 'linuxstdbase' is in OVERRIDES,
> do_rootfs would fail if both 'msmtp' and 'postfix' are installed.
> This is because they both try to create /usr/lib/sendmail link if
> it does not exist. So we need to fix the check to avoid non-zero
> exit status.
>...

This would make it random (depending on installation order) which is 
linked to, and it could also make ${sbindir}/sendmail and 
$D/usr/lib/sendmail point to different programs.

It would be better to make $D/usr/lib/sendmail also an alternative in 
all packages that provide sendmail.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


