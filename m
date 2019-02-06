Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id ABA8279CC0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 20:41:11 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id x28so5278120vsh.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 12:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uwKzRVXVVLmkkQOeJhSbuQK7j+etnvCrdji4OHHGi3Q=;
	b=FsJkZPbel0Y+2yRQtZZ7tInxDabpBLxWSfigXnX1F6+rE7aU88/DLBApnHF47RFE+I
	Cih1T114Bu5BPziuW/oca0t8sW718Sljx8WM+rKTYYgjyf9+Uv1klR7LKUNXEePCDPe8
	mhkXxVZ2Ds2cm4MWkKkqOMKsyrs7U/wELOqiGzt11TorxaLR47NqBQATgdVht+3z+gEF
	i6boU9OPIN5B4bnkbUhLhdxmvz2Lo3XJA0e6D/hrIVNjX4+dNK/iJ0zrbAgqqSqoQZpm
	cAbDwBeuACPkIX5b5TmqNGbw4frJ55mHnVYiNSQCSsFypTfYM6iHgg21wTMjA5Z2IKkF
	kqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uwKzRVXVVLmkkQOeJhSbuQK7j+etnvCrdji4OHHGi3Q=;
	b=oW13uSJ2mp6WzF1wc6BbPexyMFLpwwU5g9JuflcFjzuVDOqJbJUzwkzlP/4n40OC+X
	EHYVRpB3h3/KlC0f4F37XhDBQjJlgPAxtaDXdnwFp4I8Nu4haP6Z7PPhiLOJ/CEuOow6
	YJdhsCZCdu/dvhS53nVuxTzU1xEFsAYCheksDKBj5MwiN8hI80R3XWtucBf86WOkuHoM
	1H0y0EPFPlB1k6PkX1mLdMzqiHktML0DWkkUhywtasRSAeMPvBAVXHoWUXMfmE+2NfwM
	SaOn1TpFra5qIaqU7uhi7lZrOGB5P/fAQGlXA7YDyWZooRUBpIoKZFd5yPigsid4HfiR
	uJJg==
X-Gm-Message-State: AHQUAuYnzvCVDoAVu1SWPAw+Zz99l+JtpRwwOUQxc/EbVaLs7hOb+2E+
	sJhfLvN4vJBSNQ6wGcRKGyNhelVx2X4v96/QYkE=
X-Google-Smtp-Source: AHgI3IYzCBxS4YsIz6jZTV50wiFiszeoheuZyK3CBtwhowOw7SPDyA7EBjaeUPVFaRrFuAGFzxAn8pNCbuE4gGKGAQw=
X-Received: by 2002:a67:5d83:: with SMTP id r125mr5369793vsb.197.1549485672638;
	Wed, 06 Feb 2019 12:41:12 -0800 (PST)
MIME-Version: 1.0
References: <20190205003627.4454-1-raj.khem@gmail.com>
In-Reply-To: <20190205003627.4454-1-raj.khem@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 6 Feb 2019 20:41:01 +0000
Message-ID: <CAO5Uq5RAbDD9KRQhXT2osH_ivYvskAMRMj82yq3RB8Zr0QdF8w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 1/2] multilib_header_wrapper.h: Use #pragma once
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
X-List-Received-Date: Wed, 06 Feb 2019 20:41:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 5, 2019 at 12:36 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Avoid infinite include loops, especially with bits/wordsize.h which is
> now possible with the synthesized headers since we now also synthesize
> bits/wordsize.h itelf for some arches e.g. arm/aarch64
>
> In cases where extra preprocessing tools are used such as clang-tidy
> e.g. and these tools are not passed the knowledge about architecture
> then case comes where we enter into header include loop for
> bits/wordsize.h, since this template does explicitly include
> bits/wordsize.h
>
> To fix this emits the pragma once at beginning of file, this is better
> solution than include guards, and pragma once is practically supported
> on all compilers except few e.g. cray c/c++ compiler
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Something about this is breaking a local recipe (for tlsdate fwiw, but
I don't think that's relevant):

| checking openssl/ssl.h usability... no
| checking openssl/ssl.h presence... yes
| configure: WARNING: openssl/ssl.h: present but cannot be compiled
| configure: WARNING: openssl/ssl.h:     check for missing prerequisite headers?
| configure: WARNING: openssl/ssl.h: see the Autoconf documentation
| configure: WARNING: openssl/ssl.h:     section "Present But Cannot
Be Compiled"
| configure: WARNING: openssl/ssl.h: proceeding with the compiler's result
| configure: WARNING:     ## ------------------------------------- ##
| configure: WARNING:     ## Report this to jacob at appelbaum.net ##
| configure: WARNING:     ## ------------------------------------- ##
| checking for openssl/ssl.h... no
| configure: error: OpenSSL is not installed, openssl/sslh is missing

Somehow it's not getting the definition for THIRTY_TWO_BIT from
openssl/opensslconf.h (from openssl10) when testing for openssl/ssl.h
so BN_ULONG ends up undefined... still digging as to what's going on.

-- 
Alex Kiernan

