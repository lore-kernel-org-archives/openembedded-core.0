Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S0piK-0001yG-Lq
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 08:37:12 +0100
Received: by daln34 with SMTP id n34so1895852dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 23:28:49 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.138.167 as permitted sender) client-ip=10.68.138.167; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.138.167 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.138.167])
	by 10.68.138.167 with SMTP id qr7mr4362802pbb.0.1330068529459 (num_hops
	= 1); Thu, 23 Feb 2012 23:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/GdjhuOsf6kbVxOBGgNUjkaIAeUpklgydUsRxEQxXyc=;
	b=ZQ21mL3YRASanrbvRmvKH9vIn6bwJIT/cVAdBm0YHhzccR9m2uftqqyL0gaGL6lKHj
	VDIIi/iDHVyBd9YVM57HtfF58lhPeKocZef1su8MprZ5ybx7wbyqeYzmTGEyfcxdWLCA
	oWXVYcmaQ57GH06pEcb3AzFtDWnCcqbPElHtE=
Received: by 10.68.138.167 with SMTP id qr7mr3585250pbb.0.1330068529393;
	Thu, 23 Feb 2012 23:28:49 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id y1sm3636072pbg.73.2012.02.23.23.28.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 23:28:48 -0800 (PST)
Date: Thu, 23 Feb 2012 23:29:33 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120224072933.GA2479@sakrah.homelinux.org>
References: <A3766F63-815A-4152-8E80-A9D8D742C947@dominion.thruhere.net>
	<CAAQYJAv++Om6Mi4MwdzpVjE8oEQ7abrrs3=LMey8uon77L4Yeg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAv++Om6Mi4MwdzpVjE8oEQ7abrrs3=LMey8uon77L4Yeg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: fri2-noemgd build breakage with extra layers enabled
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
X-List-Received-Date: Fri, 24 Feb 2012 07:37:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/02/12 15:00), Andrea Adami wrote:
> On Tue, Feb 21, 2012 at 1:18 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > [posting this to oe-core since it involves a ton of non-'yocto' layers]
> >
> > Hi,
> >
> > I tried to build systemd-image for fri2-noemgd yesterday and the build failed in kexectools-klibc:
> >
> > NOTE: package kexec-tools-klibc-2.0.2-r4.0: task do_fetch: Started
> > ERROR: Function failed: Fetcher failure for URL: 'file://pass-ld-options-through-gcc.patch'. Unable to fetch URL from any source.
> > ERROR: Logfile of failure stored in: /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/core2-angstrom-linux/kexec-tools-klibc-2.0.2-r4.0/temp/log.do_fetch.30663
> > Log data follows:| DEBUG: Trying PREMIRRORS
> > | DEBUG: Trying Upstream
> > | ERROR: Function failed: Fetcher failure for URL: 'file://pass-ld-options-through-gcc.patch'. Unable to fetch URL from any source.
> > NOTE: package kexec-tools-klibc-2.0.2-r4.0: task do_fetch: Failed
> > ERROR: Task 2253 (/OE/tentacle/sources/meta-nslu2/recipes-kernel/kexec-tools/kexec-tools-klibc_2.0.2.bb, do_fetch) failed with exit code '1'
> >
> > removing meta-nslu2 fixed it. Rerunning the build made it fail in a recipe from meta-handhelds. Removing that layer got the build going again. Does anyone have a clue why those layers would break fri2-noemgd builds? The oe-core qemu and meta-ti machines build fine.
> 
> The meta-nslu2 layers needs another cleaning after "kexec-tools: Remove ".
> Khem, please remove klibc.bbclass as well.
> Thanks
> 


Fixed



