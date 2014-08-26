Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ECBAB710E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 20:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7QK1LSr001011; Tue, 26 Aug 2014 21:01:21 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id h1X_SYdrDASl; Tue, 26 Aug 2014 21:01:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7QK1EOZ001006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 26 Aug 2014 21:01:16 +0100
Message-ID: <1409083276.5772.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas Oberritter <obi@opendreambox.org>, Paul Barker
	<paul@paulbarker.me.uk>
Date: Tue, 26 Aug 2014 21:01:16 +0100
In-Reply-To: <53FBDA04.4070609@opendreambox.org>
References: <1321087015.26881.15.camel@ted> <53FBDA04.4070609@opendreambox.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs_ipk.bbclass: Ensure bad recommendations persist in the status file
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
X-List-Received-Date: Tue, 26 Aug 2014 20:01:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-08-26 at 02:51 +0200, Andreas Oberritter wrote:
> Hello Richard,
> 
> sorry for digging out such an old message, but please see below.
> 
> On 12.11.2011 09:36, Richard Purdie wrote:
> > Currently bad recommendations are added to the status file with status
> > "ok". After a single opkg command, whilst it will ignore the recommendation,
> > the status changes to "installed" even if the recommended package was not
> > installed. Whilst this is likely a glitch in opkg's logic, the correct
> > way to persist the information in the status file is to set the status
> > to "hold" as deinstall packages with that status remain. With this change
> > the bad recommendations persist accross multiple opkg runs and the system
> > behaves as expected.
> > 
> > [YOCTO #1758]
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
> > index 3b4c392..4a5a2dd 100644
> > --- a/meta/classes/rootfs_ipk.bbclass
> > +++ b/meta/classes/rootfs_ipk.bbclass
> > @@ -44,7 +44,7 @@ fakeroot rootfs_ipk_do_rootfs () {
> >  		pkginfo="`opkg-cl ${IPKG_ARGS} info $i`"
> >  		if [ ! -z "$pkginfo" ]; then
> >  			echo "$pkginfo" | grep -e '^Package:' -e '^Architecture:' -e '^Version:' >> $STATUS
> > -			echo "Status: deinstall ok not-installed" >> $STATUS
> > +			echo "Status: deinstall hold not-installed" >> $STATUS
> 
> I just implemented bad recommendations for deb (in dora) and by looking
> at dpkg's source code I realized that "hold" is only a valid value for
> the first field. Maybe you meant to write "Status: hold ok
> not-installed" instead? Valid values for the second field are ok and
> reinstreq.
> 
> The code above doesn't exist in master anymore, but the status line
> hasn't changed in the newer version implemented in python.

I'm not sure what opkg accepts or what is correct. Paul, cc'd may have a
better idea though. What we have seems to work, that doesn't necessarily
mean its correct though...

Cheers,

Richard



