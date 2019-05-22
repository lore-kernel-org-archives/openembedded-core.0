Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CF3EB7E33C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 06:49:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4583Bv3Gxpz63;
	Wed, 22 May 2019 08:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558507751;
	bh=u7RU0GBDVvgIFEG7nbuoTA3Zsu4jXuIOIhf/SpTjr4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QcDRMDithzEqVkUk530nW9Pk6YjrJMj2+4hRT5D0bBO+BHVV9siJdv4IHniglLVep
	2BHLxGSa4xsB4aHUpC8vnjN3rtCpvB2U6KoY/j88iwB7CdYfZ4O+Z2+bmHKc71E3Mc
	CKQ54WvEhV4eFC0JxcJx1hKvmLic1pQcQAi2VFB7zxDafxgG5DjXsyH9mt7zkkh7zy
	6Of1xLO2JjprrSYGFzkoi7gvUV5HQ0yeJmuAeYnptzabH5T64cIeJqnQ+AVZOZumze
	DXzDVdtQ+SdIKtLKd/6MnaIvhgB18ntiDw59aWG+vCaoj5Rql+1GCVNoulr2ssHxwS
	f/dyIgfNMs/f8TObq6XjIRfnHbL0zZX1H4EXLAxP4yVNDlo27EBKXzi21m0ehpe/Lr
	Afb/hr1uSDQhe2OPiwl1N6ilI8Xs0vezuJz4F/S30+nyZrDXHE5omNBYgA24BNsta2
	gIpw2mW9JETalCQnrE6rAx7riwClfjatVSjOEc4IlDFLLF8csTUvFzCxDtAmrFbdcs
	CyxJNvqamU8Z5m/yA7CqpwUosXYph/VP3ZNIyVRQ8jHS6hEMAbcf5dMFr6KtfdoAMT
	TriXDzqRSctm//KR0nyh795MMgJpyuuknsUlCmv123xcH2M4YKCjfsqn885mSmhkuS
	oLEi+x2XAycITAnt3BnFCz6I=
Date: Wed, 22 May 2019 09:49:09 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190522064909.GA9621@localhost>
References: <20190522013228.7591-1-raj.khem@gmail.com>
	<20190522013228.7591-3-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190522013228.7591-3-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] elfutils: Fix eu-* utils builds for musl
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
X-List-Received-Date: Wed, 22 May 2019 06:49:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 21, 2019 at 06:32:28PM -0700, Khem Raj wrote:
>...
> PN and PN-binutils is not empty anymore on musl
>...
> ++#if !defined(FNM_EXTMATCH)
> ++# define FNM_EXTMATCH (1 << 5) /* Use ksh-like extended matching. */
> ++#endif
>...

This might fix the compilation, but it is horribly wrong.

It passes a flag to a function that this function does not understand.

In the best case the function returns with an error on unknown flags.

In the worst case the function does silently something different from
what the caller expects it to do.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


