Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C5D7370955
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 16:36:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6UGabf1026035
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 09:36:37 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 30 Jul 2014 09:36:37 -0700
Date: Wed, 30 Jul 2014 11:36:35 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20140730113635.41d88bc5@e6410-2>
In-Reply-To: <53D68AD1.2010401@windriver.com>
References: <lymwbtto1t.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<53D68AD1.2010401@windriver.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: PSEUDO - SELinux support
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
X-List-Received-Date: Wed, 30 Jul 2014 16:36:39 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Mon, 28 Jul 2014 12:39:29 -0500
Mark Hatle <mark.hatle@windriver.com> wrote:

> Intercepting xattr is needed, and potentially access to the special proc files 
> may also be needed... [once we intercept though, what do we do with the data?]

This is pretty much where the problem comes in. The reason for the xattr
support is to make it mechanically possible to create things which would have
extended attributes such as security.selinux values. But if we are picking up
such values from the host, and they make it into our rootfs, that's host
contamination.

For modes, we can do a decent job of making things work by just setting
reasonably plausible inferred modes which won't cause problems in the
underlying filesystem, and storing the target rootfs modes in the database.

For xattrs, I don't think we can do that, really. The problem is that there's
no generic way to tell whether a given proposed selinux attribute is coming
from logic relating to the target filesystem, or from the host's filesystem.

If we hypothetically intercepted proc/self/attr/fscreate writes, that might
help some. I was originally concerned about it being written outside the
pseudo environment, but it occurs to me that if it were, that would also
imply that whatever value was written probably got derived from things that
were read outside the pseudo environment, so basically we'd be rendering
unto SELinux that which is SELinux's, and it wouldn't affect our rootfs
choices either way. I think.

I am not at all sure whether we can patch is_selinux_enabled(). I also don't
know that this would work for the other use cases, because some things that
want xattr support may not try to write selinux attributes if that returns
false, but we might want them to write those attributes.

I will say that, in general, running in an actual selinux environment is
probably going to break sometimes, because pseudo depends on doing things
that should absolutely be prohibited in any sort of secure environment. The
entire concept behind things like fakeroot and pseudo is to create a runtime
environment which is broken in a useful way.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

