Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
	[209.85.217.44])
	by mail.openembedded.org (Postfix) with ESMTP id BE3027C75E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 15:59:27 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id b20so6059523vsl.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 07:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=BGUVdpDDOzU/0rlaZt0Vxmr1HunlpdMCudG2wZFtetw=;
	b=VR0H7Ta3oXj49B/znzPojkXABZ1dtpPseIiywz86F85gJt8nK1X0IJJ4xpk3z2ZL0U
	AE4Yh1seKDhqZnDZ2XkqcmXz5rzMnRrQVO/NpA1fUzGwUlSEGwOHNFvGzuxIT7ena6D0
	/XlL2+fuIDZaOgByDYa4MYQ4IOg7XyZkCtFrxSiGhvzT6ES6Kba/d9kq1jWz6DZzVyIK
	fX42kOMqZdQgSI/kuns/2KH1DRaNcmTB0aUoKpOBcXYy2uedXTYqSIk+dy1Xs9iLm69u
	mxpiAdkNBGZYj38LGTxYWhAedhkC3l4Dp8xraASsAQKTkkEXwlNmiXJMumHebmPv1TuW
	TnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=BGUVdpDDOzU/0rlaZt0Vxmr1HunlpdMCudG2wZFtetw=;
	b=d6FpzZ5XlszmDphtm3l58/e+5f3LOzJ/MERL2beg1O/O5G+aHwuLyMKGjjfn4x+Jt3
	swLBWj4dTBO/bWwFy9XqMdtGN3MVoLkV3q8V3+2JlZc9/HNyw/J/DTmdCq4fqaI4pOL7
	pkPDn+ole5x5jvMiDS2uAo9RzUZuqF43cVIDQkLYKh/i6UFRcuG1Ys8SlXadJEbFHLE1
	W8gbje7OLkaysW9zi0lp11YTRUCGVQ8dOczSDGE7gHu4a9lpZkeGjqhYB/oakVsvLK35
	uAAyLSuVdC4tywcGp+WFbrDS9Dryn6GfYe+LlIkbKzilAnY8Kth0Newu4OWkhpUytp3w
	PqqQ==
X-Gm-Message-State: AHQUAuagb46ikWsO/G59+giLujD9ySLJDXHEhqH1GMLNVFLYwZARyAmr
	soeUPdxErQnWKesQhoC76HhUyL0mxWU4RjAcCwfDIoIPePU=
X-Google-Smtp-Source: AHgI3IYopKMvKdY7utS0AQ+aMMMvH3jFSQFDqYWW3jYaPhkUjLKcvXNj6+DSitE9pktHwhfHAxQ3+ooF09mlERtbEjE=
X-Received: by 2002:a67:ea13:: with SMTP id g19mr5180992vso.77.1550246368480; 
	Fri, 15 Feb 2019 07:59:28 -0800 (PST)
MIME-Version: 1.0
References: <1547535307-15876-1-git-send-email-alex.kiernan@gmail.com>
In-Reply-To: <1547535307-15876-1-git-send-email-alex.kiernan@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 15 Feb 2019 15:59:17 +0000
Message-ID: <CAO5Uq5SQt9-CyZ6iCca_xd-3vV83pyhOJeHxwUH12AaMEMj_Kw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Package libperf-jvmti.so as part of ${PN}
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
X-List-Received-Date: Fri, 15 Feb 2019 15:59:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 15, 2019 at 6:55 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> perf's jvmti support builds libperf-jvmti.so that needs to be packaged
> as part of the main package, not a developer package. Given there's no
> files in the developer package, override FILES_SOLIBSDEV so it's not
> gobbled by FILES_${PN}-dev, and then add just that file to FILES_${PN}
> so that if in the future there other files which would be added to the
> dev package we'll fail then.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---

ping?

-- 
Alex Kiernan

