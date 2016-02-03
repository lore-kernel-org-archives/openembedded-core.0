Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 8721D773A7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 20:42:58 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aR4GQ-00049v-Gx; Wed, 03 Feb 2016 21:42:59 +0100
Message-ID: <1454532171.7421.52.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 03 Feb 2016 20:42:51 +0000
In-Reply-To: <e45e550e5d1bdcd4011e9d92c77201596d52ea2b.1454303080.git.raj.khem@gmail.com>
References: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
	<e45e550e5d1bdcd4011e9d92c77201596d52ea2b.1454303080.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/8] boost: Fix build on soft-float ABI arm systems
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
X-List-Received-Date: Wed, 03 Feb 2016 20:43:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-02-01 at 05:08 +0000, Khem Raj wrote:
> +     BOOST_FPE_ALL       = MCW_EM,
> +-#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG)
> ++#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG) \
> ++    || defined(__ARM_PCS)
> +     BOOST_FPE_ALL       = 1,

This looks a bit bogus.  Whether or not a particular fesetenv() flag is
available is, or should be, orthogonal to the question of whether you
are using the soft-float or hard-float ABI.  I think it might be true
that some libraries don't implement fesetenv() when using softfp (i.e.
no VFP instructions at all) but that is not necessarily the same thing
as the soft float ABI.  What was the exact situation where you had a
problem with this?

Anyway, if what you want to test is the availability of FE_DIVBYZERO,
you can just use "#ifdef FE_DIVBYZERO" since FE_* are required to be
macros.

p.



