Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id 47086781F4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 12:16:28 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id e142so21935223ywa.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 05:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kBY+/NNYj1ONo17ApOmB1E1tZoj4pdHngua+h2rJUaY=;
	b=uhWslfTqIgycvn1R5Qri0VKOfHNN9X6cVZ6+fdNIun0N8y0OGFXlE1jMcojK6hfZ0K
	cDLGG8hmuk2TSEuViahnzF1dk0r+A9mbmqusZZEWenhXUBNaaqw//8YCiukd7pRXDXRv
	wchBQ4WJvChKVPtN3j3ofor2Dq9rmNV9EaBh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kBY+/NNYj1ONo17ApOmB1E1tZoj4pdHngua+h2rJUaY=;
	b=jkeZgI3yOOQ5e5hnnZybD/PrpOMgqQjAasxzLBzJjem1j6c3AQnAVY/LENmvvpYWV0
	H5ykefjMTciZJAIZHcthECgtwwK2GdLcmlsc9nA48qKluH5GgDHxRnpw4cJW6J+CXJib
	lMJpBhAFlWThQHVqKOoRSyh6DtHdvM6ngGlXuLyShTaqtIAL7CN6okxo5A/51KbdP9+4
	OJBTFo8BI4lehU10risDpT/cU0RvASUyWE2Goi6RBfGMAJNfjAE4hP4J9/M/ZrubXnXY
	2B+8HqQO3DEZA4GGWat1SEkfRJfV1ntYbkH52T21pQ7NioLbYq9fi8JaEvi7hgA9Rg9t
	FRjg==
X-Gm-Message-State: AODbwcC4FSXffCnYCJeFO8sHHxDI2ln6guLq1AoZfr5rnMQs1xZ+KOmL
	4CeuQy4Mz47Y5VnH
X-Received: by 10.13.245.71 with SMTP id e68mr20551232ywf.269.1497183388968;
	Sun, 11 Jun 2017 05:16:28 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133])
	by smtp.gmail.com with ESMTPSA id x3sm2571078ywf.46.2017.06.11.05.16.28
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 05:16:28 -0700 (PDT)
Date: Sun, 11 Jun 2017 08:16:48 -0400
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170611121648.GP10782@bill-the-cat>
References: <1496966441-30260-1-git-send-email-trini@konsulko.com>
	<1496966441-30260-2-git-send-email-trini@konsulko.com>
	<CAJTo0LbUHNxxQMPz=RH+xxMk2=sN4tcg6MXtNHkz7-R_bY4g1A@mail.gmail.com>
	<20170609192840.GL10782@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20170609192840.GL10782@bill-the-cat>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] dpkg: Fix perl modules by moving them to the versioned perl directory
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
X-List-Received-Date: Sun, 11 Jun 2017 12:16:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 09, 2017 at 03:28:40PM -0400, Tom Rini wrote:
> On Fri, Jun 09, 2017 at 05:15:07PM +0100, Burton, Ross wrote:
> > On 9 June 2017 at 01:00, Tom Rini <trini@konsulko.com> wrote:
> > 
> > > In order for the dpkg perl modules to be used the must reside in the
> > > versioned perl library directory (as to be in the default include path).
> > > Be explicit about this location in our FILES_${PN}-perl directive, so
> > > that if this breaks in the future, the recipe will fail).  We can now
> > > drop the custom do_configure as it wasn't fixing this problem.
> > >
> > 
> >   * FILES: removed "/usr/lib/perl", added "/usr/lib/perl/None"
> > 
> > Obviously something didn't work right!
> 
> Oh, I see.  Yes, an existing feature is that if perl isn't built yet
> then no, you don't get a sane PERLVERSION.  That's true today, for
> example, see liburi-perl.

Oh oh, I see.  Sorry, hit a per recipe staging issue.  I've reproduced
and figured out the fix.

-- 
Tom

