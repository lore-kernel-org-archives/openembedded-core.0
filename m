Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 57C266A960
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 09:53:09 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V2ehv-0000Wu-G7; Fri, 26 Jul 2013 11:53:08 +0200
Message-ID: <1374832374.2861.72.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 26 Jul 2013 10:52:54 +0100
In-Reply-To: <20130726092812.GD3280@jama>
References: <cover.1374642547.git.Qi.Chen@windriver.com>
	<5dc3be245a9757c51dadd7ce446c5116ce79496d.1374642547.git.Qi.Chen@windriver.com>
	<20130726092812.GD3280@jama>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, Zhangle.Yang@windriver.com
Subject: Re: [PATCH 9/9] Generate ssh keys at rootfs creation time in case of a read-only rootfs
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
X-List-Received-Date: Fri, 26 Jul 2013 09:53:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-07-26 at 11:28 +0200, Martin Jansa wrote:
> On Fri, Jul 26, 2013 at 03:39:36PM +0800, Qi.Chen@windriver.com wrote:
> > From: Chen Qi <Qi.Chen@windriver.com>
> > 
> > To avoid generating ssh keys every time a system with read-only rootfs
> > starts, we generate ssh keys at rootfs creation time.
> > 
> > This change only has effect for systems with read-only rootfs.
> 
> I'm not sure if having the same keys on all devices installed from the
> same image is always desired behavior, imho it should be controlled by
> another variable, because some people want read-only rootfs and keys
> generated in some other write-able partition.

Agreed.  In fact, I suspect that most folks who would be happy with all
devices getting identical keys would want to go even further and have
the keys be pre-generated so they were the same in every version of the
image, rather than having them change every time the rootfs is
regenerated.  Otherwise you still get the "host key has changed" warning
whenever you install a new rootfs.

If we're going to add this "generate keys at rootfs time" thing as an
option then that's fine, but it needs to be configurable under control
of IMAGE_FEATURES and/or DISTRO_FEATURES and/or PACKAGECONFIG.

Some other observations on this patch:

- the subject line is in the wrong format
- there are quite a lot of changes to the openssh recipe in here, some
of which look a bit hokey.  For example, this change:

-PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG_class-target ??= "tcp-wrappers"

... is going to be a trap for the unwary and probably shouldn't be done
this way.

p.



