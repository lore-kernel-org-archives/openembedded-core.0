Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RPIEj-0002k0-49 for openembedded-core@lists.openembedded.org;
	Sat, 12 Nov 2011 19:23:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pACIH9Tn029047;
	Sat, 12 Nov 2011 18:17:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25600-09; Sat, 12 Nov 2011 18:17:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pACIH1jh029041
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 12 Nov 2011 18:17:02 GMT
Message-ID: <1321121825.26881.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sat, 12 Nov 2011 18:17:05 +0000
In-Reply-To: <CAP9ODKpCZDJb_Cp7uOtXMmfRsfv5dS=nDFTCTk5JA4oPqOEtFA@mail.gmail.com>
References: <1321087015.26881.15.camel@ted>
	<CAP9ODKpCZDJb_Cp7uOtXMmfRsfv5dS=nDFTCTk5JA4oPqOEtFA@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs_ipk.bbclass: Ensure bad recommendations persist in the status file
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
X-List-Received-Date: Sat, 12 Nov 2011 18:23:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-11-12 at 13:57 -0200, Otavio Salvador wrote:
> On Sat, Nov 12, 2011 at 06:36, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Currently bad recommendations are added to the status file with status
> > "ok". After a single opkg command, whilst it will ignore the recommendation,
> > the status changes to "installed" even if the recommended package was not
> > installed. Whilst this is likely a glitch in opkg's logic, the correct
> > way to persist the information in the status file is to set the status
> > to "hold" as deinstall packages with that status remain. With this change
> > the bad recommendations persist accross multiple opkg runs and the system
> > behaves as expected.
> 
> I personally dislike fixing it in rootfs_ipk instead of opkg ... opkg
> has change its behaviour behind the scenes and this needs to be fixed
> IMO.

I'm not sure opkg has changed behaviour. We used to just do one single
"opkg install" after which the status file was incorrect but the bad
recommends was not installed. We started doing more than one "opkg
install" and this has muddied the waters so to speak. I'm still unclear
if the bad recommends actually make it onto the target system but
certainly the status file was incorrect.

The summary is we were not using opkg correctly in the first place. This
patch corrects that problem so we do what we what that code intended to
do and persists the bad recommend into the status file. This fixes the
bug that was reported too.

There look to be remaining issues in opkg but not ones that directly
affect the build system. Please do take this up with the opkg people but
I'm afraid I personally don't have time to start debugging opkg and I
think there are other more urgent priorities at the moment now this is a
non-issue for the builds.

Cheers,

Richard




