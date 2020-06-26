Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web10.10370.1593185770954590975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 4308C2E8951;
	Fri, 26 Jun 2020 10:36:10 -0500 (CDT)
Date: Fri, 26 Jun 2020 10:36:07 -0500
From: "Seebs" <seebs@seebs.net>
To: "Johannes Beisswenger" <johannes.beisswenger@cetitec.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [pseudo][PATCH 1/2] xattr: Fixed corrupting UID&GID when running setfacl -m on a directory
Message-ID: <20200626103607.114d5711@seebsdell>
In-Reply-To: <49dc076b-16fd-cd82-5793-bbf2c2fc9adf@cetitec.com>
References: <20200626094031.9975-1-johannes.beisswenger@cetitec.com>
	<20200626090553.6853a571@seebsdell>
	<49dc076b-16fd-cd82-5793-bbf2c2fc9adf@cetitec.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Jun 2020 16:56:48 +0200
"Johannes Beisswenger" <johannes.beisswenger@cetitec.com> wrote:

> The OP_CREATE/REPLACE/SET_XATTR operations in pseudo_op() don't use 
> msg_header.mode at all, it is only used for DB sanity checks, which
> in turn only use the non-permission bits.

Right, the relevant part is the immediately following
wrap_chmod/wrap_fchmod. I had forgotten about this chunk of code.

And... that leads us to the realization of how it is possible that this
ever didn't bite us before.

The historical reason this exists is that at some point, GNU tar
decided that it was a crime against nature, humanity, and God to use a
stable existing API when a new API existed which could do the same
thing at hundreds of times the computational cost, and abandoned all
use of chmod() in circumstances when extended attributes are available.
But in practice, this only happens for regular filesystem modes that
do not require an ACL, and allow us to replace "here's your 12 bits
of values" with "here's a small binary blob you can decode expensively".

But usually that's all that's present, so we just hit the path where
we call chmod/fchmod and return early.

For us to hit this, we have to have gotten a system.posix_acl_access
message which contains access list values other than those, which of
course never happens, because who would actually use ACLs for their
intended purpose, instead of as a ridiculously expensive way to
implement chmod?

And yeah, I think you're right -- this assignment is just plain
unneeded.

(I think the Darwin port is long-dead because Apple's security stuff
makes it a pain to work with. Basically, "can we get this working on
Darwin" was a high priority and common request until about three days
after I got it running, and I don't think anyone's asked about it
since.)

-s
