Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id B81B26067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 22:47:32 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id t25-v6so77050wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 15:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=e3jn/vzOTC5WwoUkkvLx0IHRnksdZGBvd10M08noetY=;
	b=A5eLwwoImDNh6zJlH1PP2MeGfGTdHrISvYzqa1wT3MXUZx7fBrPQM5KjAN2gIcmKqS
	6POpI4l1v66hym8ULHZ9D+9xvdyyc7cmASmU5PhlQwGKKcz1FE8i3Q5d6Kuhi/yZUeYm
	8r1wDgpdV7BG4eZXgoFqQ8GEavB0MYgEsgawk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=e3jn/vzOTC5WwoUkkvLx0IHRnksdZGBvd10M08noetY=;
	b=SqQSK2mV2ecu9z6yBg+Md+rkZQnLP24SZV68TjfX9oW+UfWRI5FVlCApBV8HVveaO3
	sdVEiqDH93DcLXY/7kUfdNpjTCZ8vKDGVP77eQyXqLZQnURUzPSesqnWGedQH1PO6Qua
	JRPDOaacd43OmXWwZxGJ78lxZpGoe8U9ldMnU4LC5RZiDJrKQCnlxY2rCzLTjG6zesTl
	PqD9y8COKiTgHQeH6cEMMWrEB1tFgzuHBxCfUcKYmxdArUXi+cQJ7pMHcZ/7hHLwZ98e
	GyWDogNp7DZxQVfvrDadkXh7+8+Gh6rsOxTbCxuSjMzH7IgRS0uENCsGGn57zK4/buz/
	kMRQ==
X-Gm-Message-State: AOUpUlGDBtA/4wGZIOqd7Mxe2px2exStv0mVmPMmmW2QIEnorcHOC+MR
	/MHToVN6ZVnWdN0yaO94BPdmHw==
X-Google-Smtp-Source: AAOMgpfURqbqL80d3XTmUesE0Lg2kHt7znkHKbIADWO0OCJABWZjF9GPGUKR0ai7NrHjMskNaAiDmw==
X-Received: by 2002:a1c:f306:: with SMTP id
	q6-v6mr5671061wmq.111.1532558853162; 
	Wed, 25 Jul 2018 15:47:33 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w8-v6sm15688628wrp.72.2018.07.25.15.47.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jul 2018 15:47:32 -0700 (PDT)
Message-ID: <30c2f9cc5e10db824fb7df312bee88e17814221c.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: kai.kang@windriver.com, mark.hatle@windriver.com
Date: Wed, 25 Jul 2018 23:47:30 +0100
In-Reply-To: <20180725164107.8891-1-kai.kang@windriver.com>
References: <20180725164107.8891-1-kai.kang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/2] Install rdependent of allarch package with same multilib variant of image
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
X-List-Received-Date: Wed, 25 Jul 2018 22:47:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Kai,

On Thu, 2018-07-26 at 00:41 +0800, kai.kang@windriver.com wrote:
> The series rfc patch is trying to install 64bits packages which is
> required by allarch package to 32 bits image. Work for rpm and need
> little more work and test for dpkg and opkg.
> 
> Take ca-certificates as example. It requires openssl. So it intalls
> openssl for both core-image-sato and lib32-core-image-sato. But
> lib32-openssl is expected to be installed to lib32-core-image-sato.
> 
> So extend rdpendent of allarch package with all multilib variants and
> 'noarch-' as well.
> 
> Extend
> ca-certificates -> openssl
> 
> to
> 
> ca-certificates -> openssl, lib32-openssl, noarch-openssl
> 
> Rdepends on openssl and lib32-openssl make both of them exist in
> oe-core-repo when do rootfs. And then make both openssl and
> lib32-openssl provide noarch-openssl. And only keep noarch-openssl in
> RDEPENDS when write package for ca-certificates. When do image rootfs
> for lib32-core-image-sato, remove openssl if installed already and
> install lib32-openssl to provide noarch-openssl for allarch pacakge
> ca-certificates.
> 
> And extend rprovides of allarch package with prefix 'noarch-' too
> that
> it may be required by other allarch packages. Put all dependent
> packages
> of all allarch recipes in oe-core to a new ariable
> 'ALLARCH_RDEP_PKGS'.
> 
> Any comment for this method is welcomed. Thanks a lot.

I think this is kind of the right direction but its not ready in this
form. Taking a step back and thinking about this problem, its actually
similar to the allarch recipes signature problem.

Normally if A DEPENDS on B, the taskhash of A includes the taskhash of
B. In the allarch case this is problematic so you see ca-certificates-
>openssl listed in SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.

I think (but am not 100% sure) that everything you list in
ALLARCH_RDEP_PKGS is already covered somewhere in
SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.

I'd therefore propose using SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS instead of
adding a ALLARCH_RDEP_PKGS which duplicates information. I can't see
any case where you'd want an entry in one but not the other.

Rather than changing the RPROVIDES/RDEPENDS in package_{deb|ipk|rpm},
you should do this once in package.bbclass.

There is a bigger problem though since the allarch recipe signature
filtering doesn't change what bitbake will actually build, only how its
represented in sstate and the circumstances under which it would
rebuild it. If ca-certificates DEPENDS on openssl, it will build
openssl whether you're targeting core-image-sato or lib32-core-image-
sato. This potentially means you can end up in a situation where it
wouldn't build lib32-openssl if nothing else in lib32-core-image-sato
depended upon it more directly.

There is no easy way to solve this problem since somehow, if you're
building lib32-<image> it needs to build lib32-openssl and if you're
building <image> it needs to build openssl. "pushing" that information
back up the dependency chain is very hard, we have no such mechanism.

I'm afraid I don't have a solution for this piece, its a very hard
problem to solve. Your current patches happen to work as there are
other more direct dependencies which tend to ensure the right thing
happens but we can't rely on that and it probably isn't the case for
all the dependencies.

Finally, the package manager shouldn't really need changes for this
approach to work. If things RPROVIDE and RDEPEND on the noarch
versions, the feed priorities should mean the right things happen. If
that doesn't happen automatically, the feed prorities are not working
correctly and that needs fixing, not the 2/2 patch you're proposing. I
suspect this issue needs fixing regardless of anything else.

Cheers,

Richard

