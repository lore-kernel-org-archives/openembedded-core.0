Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 22D8860119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 21:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u66LPeO5029513; Wed, 6 Jul 2016 22:25:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZZOQigGhPeuZ; Wed,  6 Jul 2016 22:25:40 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u66LPa6g029505
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 6 Jul 2016 22:25:37 +0100
Message-ID: <1467840336.8590.218.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Date: Wed, 06 Jul 2016 22:25:36 +0100
In-Reply-To: <20160706173544.GB5805@mentor.com>
References: <1467812717-26591-1-git-send-email-joe_macdonald@mentor.com>
	<1467823685.8590.217.camel@linuxfoundation.org>
	<20160706173544.GB5805@mentor.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dpkg-deb: strip virtual/ package prefix in control files
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
X-List-Received-Date: Wed, 06 Jul 2016 21:25:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-07-06 at 13:35 -0400, Joe MacDonald wrote:
> [Re: [OE-core] [PATCH] dpkg-deb: strip virtual/ package prefix in
> control files] On 16.07.06 (Wed 17:48) Richard Purdie wrote:
> 
> > On Wed, 2016-07-06 at 09:45 -0400, Joe MacDonald wrote:
> > > If a recipe provides a 'virtual/foo', dpkg-deb will fail as '/'
> > > characters
> > > are not allowed in any of the Depends, Recommends, Suggests, etc.
> > > fields.
> > > The intent of these in the Debian package system and the few
> > > cases
> > > where
> > > they are used in Yocto layers seems like throwing away the
> > > 'virtual/'
> > > prefix preserves the intent, while not requiring it to be removed
> > > for
> > > package systems that allow it (eg. opkg and rpm).
> > > 
> > > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > > ---
> > >  meta/classes/package_deb.bbclass | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > Our virtual/ namespace is only used in DEPENDS, not in the runtime
> > package namespaces (RDEPENDS, RRECOMMENDS and friends). We
> > therefore
> > shouldn't need this patch...
> 
> I first encountered this in the meta-selinux layer but it seemed to
> be
> doing a sensible thing there and then found an example here:
> 
> http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/
> recipes-core/plymouth/plymouth_0.9.2.bb?h=master#n16
> 
> That said, there's so few examples like this, I can easily see it
> being
> an error in both spots.

It is incorrect in both cases, we don't support virtual/ in the runtime
namespace. We could change insane.bbclass to check for and error on
this...

Cheers,

Richard

