Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RbZmB-0008EO-Hx for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 16:32:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBGFPmLN018933
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 15:25:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18791-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 15:25:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBGFPdIA018927
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 15:25:40 GMT
Message-ID: <1324049140.4568.98.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Dec 2011 15:25:40 +0000
In-Reply-To: <jcfeeh$ub8$1@dough.gmane.org>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-4-git-send-email-dbaryshkov@gmail.com>
	<1323961117.4568.41.camel@ted>
	<1865303E0DED764181A9D882DEF65FB6EA436A83B6@shsmsx502.ccr.corp.intel.com>
	<jcfeeh$ub8$1@dough.gmane.org>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 4/9] consolekit: fix sdk generation issues
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
X-List-Received-Date: Fri, 16 Dec 2011 15:32:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-12-16 at 16:42 +0400, Dmitry Eremin-Solenikov wrote:
> On 12/15/2011 08:20 PM, Cui, Dexuan wrote:
> > Richard Purdie wrote on 2011-12-15:
> >> On Tue, 2011-12-13 at 20:19 +0400, Dmitry Eremin-Solenikov wrote:
> >>> Currently sdk generation might fail with the following error:
> >>> | Collected errors:
> >>> |  * extract_archive: Cannot create symlink from ./var/log to
> >>> 'volatile/log': File exists.
> >>> ERROR: Function 'do_populate_sdk' failed
> >>>
> >>> This happens as consolekit package will include both
> >>> /var/log/ConsoleKit and /var/volatile/log/ConsoleKit files:
> >>> lumag@fangorn:~/OE-scripts$ dpkg-deb -c
> >> build/tmp--eglibc/deploy/ipk/core2/consolekit_0.4.5-r7_core2.ipk  |
> >> grep var
> >>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/ drwxr-xr-x
> >>> root/root         0 2011-12-07 22:12 ./var/log/ drwxr-xr-x root/root
> >>>       0 2011-12-07 22:12 ./var/log/ConsoleKit/ lrwxrwxrwx root/root
> >>>     0 2011-12-07 22:12 ./var/run ->  volatile/run drwxr-xr-x root/root
> >>>       0 2011-12-07 22:12 ./var/volatile/ drwxr-xr-x root/root         0
> >>> 2011-12-07 22:12 ./var/volatile/log/ drwxr-xr-x root/root         0
> >>> 2011-12-07 22:12 ./var/volatile/log/ConsoleKit/ drwxr-xr-x root/root
> >>>       0 2011-12-07 22:12 ./var/volatile/run/ drwxr-xr-x root/root
> >>>   0 2011-12-07 22:12 ./var/volatile/run/ConsoleKit/
> >>>
> >>> Inclusion of both log directories causes this error. Drop the
> >>> /var/log/ConsoleKit in favour of /var/volatile/log
> > Hi Dmitry,
> > Could you please explain how and where the extract_archive error is caused?
> > Where is /var/log linked to /var/volatile/log?
> 
> I have tried building meta-toolchain-qte... and I got exactly the error 
> from my original message.
> 
> >
> > Do you mean RP's patch "consolekit: Fix ${localstatedir} race" didn't fix the issue?
> > (I suspect so)
> 
> Yes, I still had the issues even after PR's patch.
> 
> >
> >> This effectively reverts:
> >> http://git.openembedded.org/openembedded-core/commit/?id=5608a748
> >> af2c754f60137ab7c3010ccce6bf9e40 so I think this fixes one problem at
> >> the expense of causing another. Koen: Any comments?
> >
> > Thanks,
> > -- Dexuan

I believe this is an installation ordering problem in opkg. If you apply
my opkg patch (and the nativesdk one I just posted), I don't see this
problem with meta-toolchain-gmae.

Cheers,

Richard




