Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sf4Ho-0005rK-9D
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 09:16:08 +0200
Received: by pbbrq2 with SMTP id rq2so3298956pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 00:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=hN/+Ohjb8EB0uCJbQsDQ6osGSZOjvrmA9yrccfB0n7s=;
	b=sq0ZZEi1mS6f6ZLRswVp582JsA+stwl79o5/rFz+0uD0bgcn7A4T/RKwF2jXCkCo0H
	naHrUFdo3mFHgvcAJdS2kNiCQC+lBAk7bdpZNcYVSjzGRMnTW/R3iPlwlzWYJrDMbcMO
	7HpSAOOvz66I7w8Vt+36tJxuO1SToTe9dCXsXijG6FHnGmO7cDMWA2ou0eoSOWwPDYPG
	bNfAYPl6IESMoLfCNgCvMchOCKzUVZ1ptQPAfCdVaZbZ9IY0iALc5kq1JXLX9tQOquki
	TSAC+3LpRObyj70aSDsNKF28NRpuBJdl2IStRxAO93EINOCBPl81CH1QhlCQA5oCkN7c
	KgJw==
Received: by 10.68.225.170 with SMTP id rl10mr4959922pbc.13.1339657530492;
	Thu, 14 Jun 2012 00:05:30 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id ku7sm8537011pbc.31.2012.06.14.00.05.28
	(version=SSLv3 cipher=OTHER); Thu, 14 Jun 2012 00:05:29 -0700 (PDT)
Message-ID: <4FD98D3B.7060200@gmail.com>
Date: Thu, 14 Jun 2012 00:05:31 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1339650859.git.dvhart@linux.intel.com>
	<3b44305edae36265295087fb5f31d22d660599b8.1339650859.git.dvhart@linux.intel.com>
In-Reply-To: <3b44305edae36265295087fb5f31d22d660599b8.1339650859.git.dvhart@linux.intel.com>
X-Enigmail-Version: 1.4.2
Subject: Re: [PATCH 2/3] busybox: Add setsid and cttyhack for tiny DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jun 2012 07:16:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/13/2012 10:19 PM, Darren Hart wrote:
> When building very small systems, it can be useful to spawn a shell
> from a simple init script, rather than a full System V Init 
> process. This requires the shell be the session leader and be able
> to open the controlling terminal if it is to have job control.
> 
> Enable CONFIG_CTTYHACK and CONFIG_SETSID to enable this for
> distros defining the "tiny" DISTRO_FEATURE.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com> CC: OE Core
> <openembedded-core@lists.openembedded.org> --- 
> meta/recipes-core/busybox/busybox.inc |    2 ++ 1 files changed, 2
> insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-core/busybox/busybox.inc
> b/meta/recipes-core/busybox/busybox.inc index 5b83d32..d07ba7e
> 100644 --- a/meta/recipes-core/busybox/busybox.inc +++
> b/meta/recipes-core/busybox/busybox.inc @@ -57,6 +57,8 @@ def
> features_to_busybox_settings(d): busybox_cfg('nls',
> distro_features, 'CONFIG_LOCALE_SUPPORT', cnf, rem) 
> busybox_cfg('ipv4', distro_features,
> 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem) busybox_cfg('ipv6',
> distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem) +
> busybox_cfg('tiny', distro_features, 'CONFIG_SETSID', cnf, rem) +
> busybox_cfg('tiny', distro_features, 'CONFIG_CTTYHACK', cnf, rem) 
> return "\n".join(cnf), "\n".join(rem)
> 
> # X, Y = ${@features_to_uclibc_settings(d)}

Enabling cttyhack and setsid could be a good thing in general
(thinking of initramfs kind of images) so I would propose to enable it
by default
and not introduce another distro knob here. How much does busybox code
size grow which these two features turned on.?

otherwise second best thing is to keep it in poky-tiny distro layer
which wants to set the policy
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/ZjTsACgkQuwUzVZGdMxSXwACfX44Ffs5G4hhW9q9toubwxZYn
Ag4AnijTe1TbzrGZfHaHw+qZY/IQAzlA
=mTVi
-----END PGP SIGNATURE-----


