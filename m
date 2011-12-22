Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RdhV0-00083N-CV for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 13:11:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBMC4eJm022781
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 12:04:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22733-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 12:04:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBMC4Xsk022755
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 12:04:34 GMT
Message-ID: <1324555476.24604.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2011 12:04:36 +0000
In-Reply-To: <ABF02F6F-B5D0-425E-A568-B762D28A22D9@dominion.thruhere.net>
References: <alpine.DEB.2.00.1112220939580.26143@entw48>
	<20111222091041.GI12791@jama.jama.net>
	<ABF02F6F-B5D0-425E-A568-B762D28A22D9@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Regression bug: dbus messagebus user generation is wrong
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Dec 2011 12:11:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-22 at 11:26 +0100, Koen Kooi wrote:
> Op 22 dec. 2011, om 10:10 heeft Martin Jansa het volgende geschreven:
> 
> > On Thu, Dec 22, 2011 at 09:49:01AM +0100, Bernhard Guillon wrote:
> >> Hi all,
> >> we switched the way we chown /usr/libexec/dbus-daemon-launch-helper
> >> with this commit:
> >> 
> >> commit 46e6c3fa8034b12d178d605f3f5d7efe69671a13
> >> Author: Otavio Salvador <otavio@ossystems.com.br>
> >> Date:   Fri Oct 21 02:49:51 2011 +0000
> >> 
> >>     dbus: use useradd class to allow use in read-only filesystems
> >> 
> >>     Move creation of required user/groups to useradd class thus allowing
> >>     use with read-only filesystems and booting the initial boot.
> >> 
> >>     Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> 
> >> 
> >> We changed the owner ship of the user on the device before this commit. 
> >> Now we change the owner ship on build time which is wrong. If we change 
> >> the owner ship on buildtime we cannot know the gid of the messagebus 
> >> group. On my system it is e.g 117 but on my targtet it is 997. There is no 
> >> standard mapping for gid to names so we need to switch back to change the 
> >> group on the device.
> > 
> > See http://bugzilla.pokylinux.org/show_bug.cgi?id=1711
> > but it's still broken in some cases (on my buildhost 3 from 5 machines
> > are broken, 2 are working after last opkg changes).
> > 
> > Good test is to enable testlab and run this in your deploy/images directory
> > find . ! -type l -name \*tar.gz`; do 
> >  echo $i; 
> >  tar -tvf $i | grep dbus-daemon-launch; 
> >  tar --numeric-owner -tvf $i | grep dbus-daemon-launch; 
> >  tar xzvpf $i ./etc/group; 
> >  grep messagebus ./etc/group; 
> > done | tee -a image.test
> > 
> > And working image needs to have not only messagebus as owner but also
> > matching GID in 2nd line and last line from packaged /etc/group. With
> > latest opkg fixes it seems to work, but only if there is messagebus in
> > packaged /etc/group at all, reported here:
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014619.html
> > but probably got lost in other issues with new opkg, like this one
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014654.html
> > (if D is not needed to be set from opkg then why was offlineroot_varname.patch
> > added in first place? and I have updated this after
> > offlineroot_varname.patch removal and new version is in shr branch)
> > 
> >> I can send a patch which reenables the postinstall owner ship change if 
> >> you like.
> > 
> > Such patch is already on ML from me, now I'm using .bbappend from my
> > layer 
> > http://git.shr-project.org/git/?p=meta-smartphone.git;a=commit;h=c08dfd5f5559902f6966648f75d6c6bfd2597a5b
> 
> I'm willing to put that into meta-oe till the problem is 100% fixed.

What I really need is help in understanding what is still breaking. If
someone can show me where things are going wrong I can help (and have
done so) but "there is a problem somewhere" isn't going to help get this
fixed :(

Cheers,

Richard



