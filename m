Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rdeen-000812-A4 for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 10:09:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBM92aFl021566
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 09:02:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21171-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 09:02:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBM92Qge021560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 09:02:30 GMT
Message-ID: <1324544549.24604.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2011 09:02:29 +0000
In-Reply-To: <alpine.DEB.2.00.1112220939580.26143@entw48>
References: <alpine.DEB.2.00.1112220939580.26143@entw48>
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
X-List-Received-Date: Thu, 22 Dec 2011 09:09:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-22 at 09:49 +0100, Bernhard Guillon wrote:
> we switched the way we chown /usr/libexec/dbus-daemon-launch-helper
> with this commit:
> 
> commit 46e6c3fa8034b12d178d605f3f5d7efe69671a13
> Author: Otavio Salvador <otavio@ossystems.com.br>
> Date:   Fri Oct 21 02:49:51 2011 +0000
> 
>      dbus: use useradd class to allow use in read-only filesystems
> 
>      Move creation of required user/groups to useradd class thus allowing
>      use with read-only filesystems and booting the initial boot.
> 
>      Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> 
> 
> We changed the owner ship of the user on the device before this commit. 
> Now we change the owner ship on build time which is wrong. If we change 
> the owner ship on buildtime we cannot know the gid of the messagebus 
> group. On my system it is e.g 117 but on my targtet it is 997. There is no 
> standard mapping for gid to names so we need to switch back to change the 
> group on the device.
> 
> I can send a patch which reenables the postinstall owner ship change if 
> you like.

We have code which is designed to deal with this. The do_install,
do_package* and do_rootfs tasks are run under pseudo which maintains a
separate passwd/group file of IDs which are used instead of the system#s
passwd/group files. When we write out the packages, the named owners of
the files should be correct. When we install the packages, rpm/opkg/dpkg
should be looking up the names and resolving them to the correct IDs for
the system in question. We also have code to ensure the correct users
are present on the system before the packages are extracted.

There have been some issues in this area recently but those issues
should be resolved now. I believe the issue is present in the
1.1/edison/2011-1 release but the upcomming point release should fix
those regressions there.

So which code are you seeing this issue from?

Cheers,

Richard





