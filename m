Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0B537610B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 15:50:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48JyWl5vB8z29;
	Fri, 14 Feb 2020 16:50:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1581695428;
	bh=rjWuMu4SqAxBPHv+PHtdwxiZv7Et15+mMPEU3Y4A/AM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rbaHo+VGi3xfOn8jK1bB6OjwpiGuEg25zMXPL+6M8QyyiT4WblPNI8OoOaftjwgvH
	IqlltSso8STFdPaYsJO2E/G501aRaScpYtBuPEeEEARripMbT5mqmjGcdggE1lnfKB
	MoYWfhiv4r5qjfH+StMx4aLnM2foWE0VP5dO9AJKhp5jvRHv8Ai7JoEbDA589HfyCh
	rnoF+VMwNZWsFCCRrP2qiMhtL8jcEWtNmV8AhoxX2xP3EVVqPIZUTz1ridRqqF7SO7
	GOtwiKrYymkJTouACgAXpW4JKULL9csYXlZ5Wp3GYARLh+cTswQ3vuK/i9kQHy4mbe
	E/Dn2xQ4qMmpKPtvgcC70v5Hxx2MDcl9nDOjtl+gYWOEgcLPFLXUZUpM7a9yzx9L4O
	PeL+S7X2K0iUN3Ya3RFCaOJkG8LCLkzdKiTfH+NZbwRM29+UkR+QVcKCXK5eyft+mQ
	gNb7/8zNboUzt6fiEbIlNaNu2+Pz+FWUB8ejCH7Eg8Gs+b8nS030Kdt/L30yklsoLT
	rdVPmqWvMFxGecnDvD5y7qJePbTBnnMQG1xbz/7rHSpwV9+lOxm3dptK/239km8KZO
	3bdCIn55NdCOM6Enwd9+m9QsQEjFWx6AHKP+vXjyKD7kwD9ViFT7h68ZfAkVZZGcuy
	wrTIBKe2vEbnyBlvXNOSo6sI=
Date: Fri, 14 Feb 2020 17:50:24 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200214155024.GB31591@localhost>
References: <20200214070352.1206450-1-raj.khem@gmail.com>
	<20200214143525.GA31591@localhost>
	<CAMKF1srgk=M8AV2oeyyvYTJGUffS3P7+W0U6VqGZ3GYFfXau6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srgk=M8AV2oeyyvYTJGUffS3P7+W0U6VqGZ3GYFfXau6Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] swuashfs-tools: Enable on musl
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
X-List-Received-Date: Fri, 14 Feb 2020 15:50:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Feb 14, 2020 at 06:42:12AM -0800, Khem Raj wrote:
> On Fri, Feb 14, 2020 at 6:35 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Thu, Feb 13, 2020 at 11:03:52PM -0800, Khem Raj wrote:
> > > Upstream has a patch [1] to fix musl builds, Prior to this it would not
> > > build on musl due to missing GNU extentions for fnmatch
> > >
> > > [1] https://github.com/plougher/squashfs-tools/commit/4280e74de14070869787a9166242f9ce2dafd82e
> > >...
> >
> > I did already remove a similar bogus squashfs-tools change from OE,
> > with similar FNM_EXTMATCH "fixes" in ifupdown and elfutils
> > also resulting in the expected runtime misbehaviour.
> 
> I think it would be better to use gnulib implementation for these
> packages you point out
> and those patches will be upstream worthy and make them portable
> as well.

Yes, this would be better since the resulting code would be working.

But looking at the gnulib sources someone made gl_FUNC_FNMATCH_GNU do 
the wrong thing by "guessing yes" when cross-compiling for musl...

> At least it is calling out bad elements.

The only bad element is code that builds but silently does the wrong 
thing. Everything else is visible for users early during product
development and can be mitigated.

cu
Adrian

