Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB6D7F931
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 18:26:33 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n1so5620879wra.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 10:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=HFJT3kLM2zyGPskY6mVIu4MsAsn3cJQul4y4rleFe9M=;
	b=d9htOrzj1o5M6/YzcIt5UQFZE8tFf6qE1uKmMK4ei9T53ey6qiKxF3G4/C9SO/Fnob
	BJkcuu80Ke/GlCnWkCGed4wihDkcdp52h6WLTSUL0VITOmSCrdbyrrsx7e3nNN8k/MbJ
	8uOsuLGvRLGYg5GDfF305MwTn7ov/3Fb7HX9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=HFJT3kLM2zyGPskY6mVIu4MsAsn3cJQul4y4rleFe9M=;
	b=BF/Gl/1k8l23LINbjxEqzJVk2vkIwf4RNXIOlG8VIjn7it/r9LR9qBcIKCJ+XcAVo6
	BzDbDrY4nDNdS2gdBk6umVXVW8FRUm7eDRfSTAbzKhAvdhnX/SCSRkXbk/BglKmSpYO4
	g+ub0KNv0f6DABWYVuy7S4g3hgdGjlrB9FKbOAOtCvDKF/o56WDUJsjy3hpjFqUhk8Ht
	7O0o99SRZ93SD9mOBE3MP7MeZkzz+f/sBGkscBh5SOvIqT/pOsaqiy0BGFpbC4I3zq1a
	QFfGRZ5yYxTVGQX3o2lchz/XYFmpoPd1PbMwPJurSDYkQ/XR4Z15AdHEwLQXzjtnJwBD
	SElg==
X-Gm-Message-State: APjAAAWXv+JRmorvyp4B3kgTUk235TKWKQKlbaPLFmuxvPZzywsLoQz5
	VQRlcFqTpB0JpN+G+cjWg49lWP10+wk=
X-Google-Smtp-Source: APXvYqydCK4cmNKGvqZANuRz4puRLc+VW6NRv8rEYVmlhhbolidbckDtw45REq4QBHICxi8s6zhWhA==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr10957380wro.310.1574360794217;
	Thu, 21 Nov 2019 10:26:34 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 11sm494633wmb.34.2019.11.21.10.26.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 10:26:33 -0800 (PST)
Message-ID: <b3ae667e644cf4b81c096562965268dbe5596065.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 18:26:32 +0000
In-Reply-To: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com, bunk@stusta.de
Subject: Re: [PATCH v3 00/17] NPM refactoring
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
X-List-Received-Date: Thu, 21 Nov 2019 18:26:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-11-20 at 10:33 +0100, Jean-Marie LEMETAYER wrote:
> The current NPM support have several issues:
>  - The current NPM fetcher downloads the dependency tree but not the other
>    fetchers. The 'subdir' parameter was used to fix this issue.
>  - They are multiple issues with package names (uppercase, exotic characters,
>    scoped packages) even if they are inside the dependencies.
>  - The lockdown file generation have issues. When a package depends on
>    multiple version of the same package (all versions have the same checksum).
> 
> This patchset refactors the NPM support in Yocto:
>  - As the NPM algorithm for dependency management is hard to handle, the new
>    NPM fetcher downloads only the package source (and not the dependencies,
>    like the other fetchers) (patch submitted in the bitbake-devel list).

I'm a little confused by this item.

If the NPM fetcher only downloads a given package's source and it has
dependencies, where/when are the dependencies downloaded?

My worry here is that if the fetcher isn't downloading them, DL_DIR
can't contain all the needed pieces needed to reproduce a build at a
later date?

I suspect I'm missing something obvious...

Cheers,

Richard


