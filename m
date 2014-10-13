Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 12E3160167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 21:28:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9DLSrAd026165
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Oct 2014 14:28:53 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 13 Oct 2014 14:28:52 -0700
Date: Mon, 13 Oct 2014 16:28:51 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20141013162851.58e820e6@e6410-2>
In-Reply-To: <1413157795-1346-1-git-send-email-pab@pabigot.com>
References: <1413157795-1346-1-git-send-email-pab@pabigot.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] pseudo+image.bbclass: changes to avoid host contamination
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
X-List-Received-Date: Mon, 13 Oct 2014 21:28:53 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Sun, 12 Oct 2014 18:49:52 -0500
"Peter A. Bigot" <pab@pabigot.com> wrote:

> I believe OE should add --without-passwd-fallback to the pseudo 1.6.2
> configuration flags early in the 1.8 development cycle, to ensure there
> are no host contamination issues.  I can think of no reason why the
> build host passwd and group files should ever be considered suitable for
> use in determining target user/group characteristics.

I endorse this evaluation.

I've been thinking about this more, and I'd like to wave a thought at people:

I propose for consideration the idea that pseudo have a compile-time
hard-coded default answer to "what is uid 0" and "what is gid 0", and use
that instead of the "fallback path".

The rationale is basically: Yes, it's a special case. But it's *the* special
case. It's the special case that is the uid pseudo emulates by default, and
it's the only one that most packages ever need. If we do this, then the only
packages which need to depend on base-passwd are those which need to actually
use a *non-root* uid/gid. And every such package had better already have
a dependency either directly on the passwd stuff, or on some other package
which does.

I am pretty sure that this makes more sense than the default fallback to
host passwd/group. I might want to preserve the option of that fallback, but
make it a non-default.

Anyone have strong feelings on this? Thoughts I may not have thought through
yet? I don't know that I actually had a coherent reason in mind for the
original fallback behavior, and this analysis convinces me that falling back
to host uid/gid is probably wrong for many-to-most use cases.

I guess it might make sense for something more like a debian package build
where you really are targeting the host, but even then, I am not sure that the
default host fallback is a good idea.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

