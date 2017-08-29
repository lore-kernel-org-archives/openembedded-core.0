Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6FF9977E71
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:50:00 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7TLnvSA022438
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 29 Aug 2017 22:49:58 +0100
Message-ID: <1504043397.2175.19.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Andre McCurdy
	<armccurdy@gmail.com>
Date: Tue, 29 Aug 2017 22:49:57 +0100
In-Reply-To: <70b15633357a418095d460b943d3e994@XBOX02.axis.com>
References: <cover.1504036763.git.pkj@axis.com>
	<CAJ86T=VajsxSGRakyVVmTZcEWwwLaVZxKpcsE+ZU75bGrsUkbQ@mail.gmail.com>
	<70b15633357a418095d460b943d3e994@XBOX02.axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 29 Aug 2017 22:49:59 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Avoid build failures due to setscene errors
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
X-List-Received-Date: Tue, 29 Aug 2017 21:50:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-08-29 at 20:59 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Andre McCurdy [mailto:armccurdy@gmail.com]
> > Sent: den 29 augusti 2017 22:38
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH 0/2] Avoid build failures due to
> > setscene
> > errors
> > 
> > On Tue, Aug 29, 2017 at 1:00 PM, Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > > 
> > > Occasionally, we see errors on our autobuilders where a setscene
> > > task
> > > fails to retrieve a file from our global sstate cache. It
> > > typically
> > > looks something like this:
> > > 
> > > WARNING: zip-3.0-r2 do_populate_sysroot_setscene: Failed to fetch
> > > URL
> > > file://66/sstate:zip:core2-64-poky-linux:3.0:r2:core2-64:3:\
> > > 66832b8c4e7babe0eac9d9579d1e2b6a_populate_sysroot.tgz;\
> > > downloadfilename=66/sstate:zip:core2-64-poky-linux:3.0:r2:core2-
> > 64:3:\
> > > 
> > > 66832b8c4e7babe0eac9d9579d1e2b6a_populate_sysroot.tgz, attempting
> > > MIRRORS if available
> > > ERROR: zip-3.0-r2 do_populate_sysroot_setscene: Fetcher failure:
> > > Unable to find file
> > > file://66/sstate:zip:core2-64-poky-linux:3.0:r2:core2-64:3:\
> > > 66832b8c4e7babe0eac9d9579d1e2b6a_populate_sysroot.tgz;\
> > > downloadfilename=66/sstate:zip:core2-64-poky-linux:3.0:r2:core2-
> > 64:3:\
> > > 
> > > 66832b8c4e7babe0eac9d9579d1e2b6a_populate_sysroot.tgz anywhere.
> > > The
> > > paths that were searched were:
> > >     /home/pkj/.openembedded/sstate-cache
> > To trigger this, do you have SSTATE_MIRRORS pointing to
> > "/home/pkj/.openembedded/sstate-cache" and SSTATE_DIR pointed
> > somewhere else? Or are they both pointing to the same local
> > directory?
> > Or something else?
> No, the directory above is actually what is in SSTATE_DIR. 
> SSTATE_MIRRORS is set to:
> 
> SSTATE_MIRRORS ?= "\
> file://.* file:///n/oe/sstate-cache/PATH;downloadfilename=PATH"
> 
> where /n/oe is an NFS mount where we share a global sstate cache. 
> 
> The only way I have figured out to manually simulate the problem is 
> by modifying the code in sstate_checkhashes() in sstate.bbclass and 
> commenting out the call to fetcher.checkstatus(). Then as long as 
> there actually is no sstate files for the task in either the global 
> or the local sstate cache, I will get the above. 
> 
> I do not know what triggers it on the autobuilder though. My guess
> is 
> that somehow the sstate tgz file disappears between the call to 
> sstate_checkhashes() and when bitbake actually tries to download the 
> file. 
> 
> We do have a daily job that cleans up the global sstate cache and 
> removes files that have not been accessed in the last ten days, but 
> it seems unlikely that it should remove a file that just happens to 
> be required again, and do it at exactly the time when that task is 
> building.

I have left this code as an error deliberately as this kind of thing
should not happen and if it does, there is really something wrong which
you need to figure out. It means that at one point bitbake thinks the
sstate is present and valid, then later it isn't.

I'm not convinced patching out the errors is the right solution here...

Cheers,

Richard

