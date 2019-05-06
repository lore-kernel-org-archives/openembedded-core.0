Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 739B87D07D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 18:23:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44yWMf14C2z3J;
	Mon,  6 May 2019 20:23:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557167022;
	bh=e8GPSy1dBrAsN04mEPyZEIaC7Pae0FS5sqGByxjT8ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JZsaTZgq//8izzZwi2P1z+kut0i3M1qkxYNf/qiHcAD/E9OL0aZZZF6I8pM/RKKDU
	R0KM7RysfnVVzUO5ZUFJ3efU5OI1340DeByCGh6qudvVU5NUpRfddUnEPVIojgqa+d
	OWEnF4V+1CHP7HJIBII4/7KxBMmpkgTzypQMgNTC7nFC2ZRjMurd5F7duFMwstX8Zf
	XBb3wz4zofmfEsy03ZVgxucl6Rtuq9uidRM96bcfdWqpueac+Dk2/UFID5ynWpJzED
	gtbvmCGBYUrBCmk0artRyZkiEyhDoAbC5o851zM2P7C+JoVGKya0qPiCpqw/oJn9zl
	nigYJxj28wAmWK4p9hym3jcPFZHl7gILCnqYp0ztCbroLE0zgkTW/sl8Jxj9IGOjXw
	GbpRilz2HlULSksvLGXfYk3+Th1BI4xw4Jfv3AUXGLsvZK14xlbZM1OgFQrHZpL+p1
	NzMaF+3w+edCyV90FxVsFB0d5a1k6rgcG6XHHH606fSPsXf3AgrBXBUC9i5k/gW1yJ
	niJ5j3W6zMge45l5TN9Beve7HULs11nfiY1DgyUV9Np+uC/04eH4s3HtmEECGTse8w
	B/TTYCzzc1xoISY330fv0ABk6Ib/jbqtWwjtVxukg/54ksNqUKRXys/22Y1rrRz7WS
	3rauyYEMdOyfm+dmCt2Nkhws=
Date: Mon, 6 May 2019 21:23:39 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190506182339.GA21306@localhost>
References: <20190506175136.7594-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190506175136.7594-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] systemd: Fix build with gcc9
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
X-List-Received-Date: Mon, 06 May 2019 18:23:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, May 06, 2019 at 10:51:35AM -0700, Khem Raj wrote:
>...
> +gcc-9 has become a bit stricter and can check all kind of formatted
> +input/output functions which causes additional warnings when compiling
> +networkd
> +
> +/src/basic/log.h:104:9: error: ‘%s’ directive argument is null [-Werror=format-overflow=]
> +         log_internal_realm(LOG_REALM_PLUS_LEVEL(LOG_REALM, (level)), __VA_ARGS__)
>...
> +         if (r < 0)
> +                 log_link_warning_errno(link, r, "Cannot %s IPv6 for interface %s: %m",
> +-                                       enable_disable(!disabled), link->ifname);
> ++                                       enable_disable(!disabled),
> ++                                       (link->ifname) ? link->ifname : "<null>");
>...

The fix doesn't look correct to me:
gcc says it "is null", so checking whether or not it is null doesn't
match the error message.

If it is a compiler bug as was at some point mentioned upstream,
a better temporary workaround would be to stop making this an error
with -Wno-error=format-overflow (untested).

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


