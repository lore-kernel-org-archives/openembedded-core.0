Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4B89478335
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 08:02:52 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7U82ofK017551
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 30 Aug 2017 09:02:51 +0100
Message-ID: <1504080170.2175.26.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Andre McCurdy
	<armccurdy@gmail.com>
Date: Wed, 30 Aug 2017 09:02:50 +0100
In-Reply-To: <5ba32c0773d848ef8e6afb117a72abb0@XBOX02.axis.com>
References: <cover.1504036763.git.pkj@axis.com>
	<CAJ86T=VajsxSGRakyVVmTZcEWwwLaVZxKpcsE+ZU75bGrsUkbQ@mail.gmail.com>
	<70b15633357a418095d460b943d3e994@XBOX02.axis.com>
	<1504043397.2175.19.camel@linuxfoundation.org>
	<5ba32c0773d848ef8e6afb117a72abb0@XBOX02.axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 30 Aug 2017 09:02:51 +0100 (BST)
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
X-List-Received-Date: Wed, 30 Aug 2017 08:02:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-08-30 at 06:44 +0000, Peter Kjellerstedt wrote:
> > I have left this code as an error deliberately as this kind of
> > thing should not happen and if it does, there is really something
> > wrong which you need to figure out. It means that at one point
> > bitbake thinks the sstate is present and valid, then later it
> > isn't.
>
> True, but since the operations of checking if an sstate file exists
> and retrieving it is not an atomic operation, there are always
> problems that can occur. Some may be fixable, some may not. However,
> using a build failure to detect these kind of problems is a bit harsh
> on the developers who only sees their builds complete only to get an
> error for something that is not their fault. We have better ways to
> detect these kinds of problems, e.g., through log monitoring, without
> having to cause unnecessary grief amongst the developers.

Files are randomly disappearing from your sstate source. So far you've
been lucky and these are not causing corruption, but they could.

Please figure out and fix your sstate infrastructure, not hack the code
to avoid the errors.

I do appreciate its painful, we did once see this issue on the
autobuilder. There was a real error in the sstate cleanup scripts and
we fixed that but it took some work to find it.

Also, with changes like this you can end up in a state where sstate can
completely stop working and the only way you'd tell is by increased
build time.

> > I'm not convinced patching out the errors is the right solution
> > here...
> How about I make it conditional by adding an IGNORE_SETSCENE_ERRORS? 
> That way it can default to "0", but we can set it to "1" to
> prioritize the production builds.

I'm still not convinced, sorry.

[The reason being complexity. I don't like having multiple ways of
doing things if we can help it, particularly when one of them is a
workaround for a problem elsewhere. One of the codepaths in a case like
this is unlikely to get well tested.]

Cheers,

Richard

