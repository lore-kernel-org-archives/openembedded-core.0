Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 883637D72E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 07:38:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44jL3Q1VzjzJn;
	Mon, 15 Apr 2019 09:38:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555313938;
	bh=rpsA7+yOljUF4kLb6arUflxZlEchVQ9rLPORTxzaPvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2k6qG+qKb7sTN2Gpdf3SLDDFw8Y1FL+F/Qe1xqojO04CQa6RF2CalJb7Z6IzSNvp
	iqSFAKZ0jk8fnoPuc0Y3mzelF1q9iFxkXIpFwT2KkZq1xbbnJSXARrE04F+V7p9SFf
	GTzUxdEUGx3h6BMBitST1nhqld6+Of1qNw41SnQwIphdzF5Jm1xkKXIv5Kv3dTYKQj
	6Qw7z311jZSDdwHzCGHnYZU+lUSv1rHeaX/haiisAmTfFco3J3kqAyYlLVpZkvrmk+
	imxYv0D0t28MN5worOY+GQtwQlIcgIhhlF+uAEtitAcEcL2x12SGxzL+eHYEHFqFaq
	PKKjpoQ2k5ZuBOn3YbZQ1yRadbomO3sXSQoBg0rMQCJkZLgVXbrVUMWwCkQwWJcuXP
	3DtxW3Kx6KsIfzzz6ccN/OtAL32XvKb6W4tYT3xb8cxoI1p5FNHLNmyRRzX5YmAGHk
	ulYg7xDY3SPTQVXCNuxKcqGLMmdlwVMadVB1BLLy9/aM5XypR6h+YBZ8+G0HrjbwDf
	2d/2eMp+cjn0bCsA6HE14QMN3nFKRRMqEv8Td7Nt/Mbu2wtEaMW31TnCwNqNo3jQ+8
	hiJcHvgwp9McZoEd/tqPlGjPH/2oI2If8TRgBnul2tc4/a1i0ZTvmEz1NYo3kfBpbx
	Zd/rs0yCr+1Mt6N8u4vNjadg=
Date: Mon, 15 Apr 2019 10:38:54 +0300
From: Adrian Bunk <bunk@stusta.de>
To: kai.kang@windriver.com
Message-ID: <20190415073854.GA30607@localhost>
References: <20190415034231.105641-1-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190415034231.105641-1-kai.kang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cryptodev: update SRCREV
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
X-List-Received-Date: Mon, 15 Apr 2019 07:38:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Apr 14, 2019 at 11:42:31PM -0400, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Update SRCREV of cryptodev which only contains one fix for linux 5.0:
>...
> --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
> +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
>  SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux"
> -SRCREV = "fd8b15ef1c8398a69a37932ee48c74ab40329a29"
> +SRCREV = "f971e0cd4a0ebe59fb2e8e17240399bf6901b09b"
>  
>  S = "${WORKDIR}/git"

This moves cryptodev from a release to a git snapshot,
but no PV is set to show that.

It is a systematic problem caused by the switch to git hashes for 
releases that random git snapshots look exactly the same as releases
without any clean way to see what a commit actually is.

IMHO this needs support for tags, and then checks like (pseudo-code)
  if(TAG) (commit(TAG) == SRCREV)
  TAG xor (PV contains "+git") 

Short-term for the suggested change in cryptodev the
"which only contains one fix" is correct, and this
is not much different from adding the fix as .patch
which also wouldn't change PV.
So no objection from me to applying the suggested patch as-is.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


