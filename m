Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D924E73173
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 10:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBQAar7U011624; Mon, 26 Dec 2016 10:36:53 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id R2p3z0xrYSlr; Mon, 26 Dec 2016 10:36:53 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBQAanAr011621
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 26 Dec 2016 10:36:50 GMT
Message-ID: <1482748609.9843.136.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: srikanth krishnakar <skrishnakar@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Dec 2016 10:36:49 +0000
In-Reply-To: <CALDxG5gxGqHP7S1fK-NmFrvQt9KRgjH+u4t+xHF=3m=UvUY=bQ@mail.gmail.com>
References: <CALDxG5gxGqHP7S1fK-NmFrvQt9KRgjH+u4t+xHF=3m=UvUY=bQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: Yocto-2.2 build failures on Ubuntu 14.04.5 & 16.04.x hosts due to crash of unity-settings-daemon followed by restart of lightdm
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
X-List-Received-Date: Mon, 26 Dec 2016 10:36:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-12-26 at 15:11 +0530, srikanth krishnakar wrote:
> Environment: Ubuntu-14.04.5/16.04.1 (64-bit)
> Yocto build: qemuarm
> Target image: core-image-sato
> Error nature: The lightdm restarts on its own and logs out by killing
> processes running and brings up a login UI. 
> 
> 
> We have been observing yocto-2.2 build failures on Ubuntu 14.04.5 and
> Ubuntu-16.04.1 hosts due to restart of "lightdm" (Light Desktop
> Manager)  that is triggered by crash of "unity-settings-daemon", we
> couldn't figure out any workaround so far to overcome the issue. The
> build goes fine in the beginning but eventually the unity desktop
> logs out and kills all the processes running in the user session
> (including bitbake) and lands us into "Login screen" and when we
> login its a new session where as the bitbake running in previous
> session is killed and we need to continue the build. This is
> happening consistently when the user logs into desktop via lightdm
> and triggers a build. 
> 
> Another interesting thing to notice is the build goes fine if we
> connect to host via. SSH session and invoke a bitbake build. We are
> suspecting on unity-settings-daemon that is crashing consistently and
> is evident from the ".xsession-errors" log file as shown below:
> 
> builder@ubuntu:~$ cat .xsession-errors.old
> Script for ibus started at run_im.
> Script for auto started at run_im.
> Script for default started at run_im.
> init: Disconnected from notified D-Bus bus
> init:"unity-settings-daemon main process (2076) terminated with
> status 1"
> init: indicator-bluetooth main process (2212) killed by TERM signal
> init: indicator-power main process (2214) killed by TERM signal
> init: indicator-datetime main process (2215) killed by TERM signal
> init: indicator-printers main process (2222) killed by TERM signal
> init: indicator-session main process (2245) killed by TERM signal
> init: indicator-application main process (2270) killed by TERM signal
> 
> Corresponding unity-settings-daemon bug reported in Launchpad:
> 
> https://bugs.launchpad.net/ubuntu/+source/unity-settings-daemon/+bug/
> 1546641
> 
> Would anyone kindly confirm the logout behaviour during bitbake
> process on Ubuntu-14.04.5 & Ubuntu-16.04.1 ? Since Yocto 2.2 mentions
> both Ubuntu-14.04 & 16.04 as supported distributions this blocker
> issue must be resolved at earliest. 
> 
> Appreciate your Inputs !

What would really help is knowing what recipe is being built when this
happens. There are a few ways you might be able to figure this out:

a) Watching the screen to see which recipes were building when it
happens
b) Perhaps using some kind of screen recorder to automate this, you'd
be able to review the recording to see when it breaks
c) Looking at the bitbake/build logs to see what it was doing when the
build broke (assuming bitbake stops when the session dies).

"bitbake | cat" can provide better output for this since it will
produce a scrolling log rather than the more interactive UI.

Once you find the problematic recipe, a "bitbake XXX -c clean; bitbake
XXX" should hopefully reproduce this more easily.

Cheers,

Richard

