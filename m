Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id B02EA60616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 22:53:34 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1alOzW-0002DD-9E; Thu, 31 Mar 2016 00:53:34 +0200
Message-ID: <1459378408.2322.63.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Mar 2016 23:53:28 +0100
In-Reply-To: <1459360607-25880-1-git-send-email-raj.khem@gmail.com>
References: <1459360607-25880-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] psmisc: Remove including sys/user.h and __WORDSIZE
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
X-List-Received-Date: Wed, 30 Mar 2016 22:53:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-03-30 at 17:56 +0000, Khem Raj wrote:
> +Subject: [PATCH] Use UINTPTR_MAX instead of __WORDSIZE
> +
> +Do not include sys/user.h since it conflicts with
> +pt_regs struct from kernel APIs in asm/ptrace.h
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>

This description (and the subject line of the commit) implies that you
are removing the include unconditionally.  But actually, you are only
removing it for non-glibc platforms.  

Also, the change itself seems slightly backwards since the ptrace
manpage suggests that <sys/user.h> is actually the right header to be
using for these definitions and possibly it's <asm/ptrace.h> that should
be eliminated.  Maybe that's not feasible here but it would be nice if
the patch header explained why.  And...

> -SRC_URI += "file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch \
> -            file://0002-Include-limits.h-for-PATH_MAX.patch \
> -            "
> +SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz \
> +           file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch \
> +           file://0002-Include-limits.h-for-PATH_MAX.patch \
> +           file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
> +           "

... this change is not mentioned in the commit message.  Why have you
added the tarball to SRC_URI directly (rather than letting the .inc do
that as it did before)?  

p.



