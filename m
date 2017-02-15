Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 927276FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 10:36:28 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r18so7486492wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 02:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Are+T1yTw1Uu/nW8FhE4TUZItb1+pe8ajIbF0J64QnU=;
	b=PhAHcWLnc3gFE2cX3gzVvcIWOM07I+Asr9WeXMpXK8MGadGGDOboWiFA1Z2ha+4/Wp
	9RkUwiVFTXg5LuWh3UaU8hqoEiHsPG5Qt0wBUEM2i/nuxBVk4RgmNfMsLe7LcPrYEwrr
	4c/8TeMoJQmzQX25YR/vFicRn+YCPNlSZCsLwpBAlHmxZzZePm53zpLeVTqDtnS6zM/N
	wmhewDuUBomfQnaGdDEf4uyk4g9Fz0GPaIGfXLoj1UIxSlWNCbUBC3R0QPgUjmicVqaw
	Jz9y6jyCGdx0CUnZOxWD26QbfNIvDH4xunSExr6ttYfD4umnezfKf+6ShdEWwPmog+CL
	mGNg==
X-Gm-Message-State: AMke39lHtoKFyIDD4TwubAktqVjF21DgL04R5MdCU1KeWy+tS14BQEWaDXhyGCPBBlFhhA==
X-Received: by 10.28.40.65 with SMTP id o62mr7506596wmo.131.1487154987941;
	Wed, 15 Feb 2017 02:36:27 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 36sm4353047wrz.8.2017.02.15.02.36.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 Feb 2017 02:36:27 -0800 (PST)
Message-ID: <1487154986.2824.6.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 10:36:26 +0000
In-Reply-To: <5eb1a4810bf745c5932feee2d1b47621353e9689.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
	<5eb1a4810bf745c5932feee2d1b47621353e9689.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.22.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH 36/36] package_deb.bbclass: Ignore file paths in RPROVIDES
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
X-List-Received-Date: Wed, 15 Feb 2017 10:36:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-02-13 at 17:06 +0200, Alexander Kanavin wrote:
> From: Amarnath Valluri <amarnath.valluri@intel.com>
> 
> Unlike rpm, debian packaging does not allow file paths in 'Provides:'
> field.
> When 'usrmerge' distro feature enabled bash/busybox packages adds
> '/bin/sh' to
> it's RPROVIDES to satisfy build dependencies, this entry should be
> filtered out.

What about opkg - is it OK with PATHs (my blind guess would be no)? Has it
been tested?

Cheers,
Andre'

> 
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/package_deb.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/classes/package_deb.bbclass
> b/meta/classes/package_deb.bbclass
> index eb549ca971a..e1bc078d6b6 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -237,6 +237,10 @@ python do_package_deb () {
>          debian_cmp_remap(rsuggests)
>          # Deliberately drop version information here, not
> wanted/supported by deb
>          rprovides =
> dict.fromkeys(bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES")
> or ""), [])
> +        # Remove file paths if any from rprovides, debian does not
> support custom providers
> +        for key in list(rprovides.keys()):
> +            if key.startswith('/'):
> +                del rprovides[key]
>          rprovides = collections.OrderedDict(sorted(rprovides.items(),
> key=lambda x: x[0]))
>          debian_cmp_remap(rprovides)
>          rreplaces =
> bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES") or "")
> -- 
> 2.11.0
> 

