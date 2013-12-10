Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0935A60EFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 09:35:29 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id if17so4258182vcb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 01:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nzgen9NSvEikcGXq17cHqF59tJ8OWLEvaal8TjutHFk=;
	b=jxEL+TWPzBE0lEjSIqoUA7vqYbMpgcSqHkHeFAZrigr/IjPSch2E2CF9N3Dcd6OLhU
	TvqkpzIO12Br6eGcQeoZ2E9eLT4RmLdfnIUlHECLVOdfgAvdcIxCwmJvtvzLH+Y/FhjR
	siFxdRUn22atenABjEM015fi30w7zcDstphoPWAVwYQgJnopLgm1aZtt0qOXM17AbXoD
	NiU6bLnD+EiTzp60l4kEBGbih0SqTmmTm1NjUzI/INw5O+0gAdJF1KbwlhKo6u28BKUq
	9ym7ZDv/+LxaUD4TfLKyBdthirrYpnpr6P0/gnFBoJpBpAsEz3dHXvzk2QoCdbCpOpuU
	lwTg==
X-Gm-Message-State: ALoCoQlJA+szew+2vll9nCStuLgiKcPnK06Q+M9ntIwNiBw52zPL6hTUZohB5Jm3GAFIccqRh/h+
X-Received: by 10.221.47.193 with SMTP id ut1mr13379540vcb.8.1386668129017;
	Tue, 10 Dec 2013 01:35:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 10 Dec 2013 01:35:08 -0800 (PST)
In-Reply-To: <52A6B861.30104@topic.nl>
References: <52A6B861.30104@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Dec 2013 09:35:08 +0000
Message-ID: <CAJTo0LbFrnm3NEcUqBUnoeE+nhef+9SbW-J3Ppt=0=6GHTfmJw@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Figuring out why sstate-cache is no longer used for a package
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
X-List-Received-Date: Tue, 10 Dec 2013 09:35:30 -0000
Content-Type: text/plain; charset=UTF-8

On 10 December 2013 06:44, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> The current situation is that a client will grab everything from the
> buildserver's HTTP sstate-cache, potentially finishing a build from scratch
> in about five minutes. However, for some reason, the fpga-image does not
> fall into this category, and eache machine insists on re-building it from
> scratch. I've been trying to debug this, but the sstate-cache is on another
> machine. I tried copying part of the build server's sstate-cache onto my
> machine, but that only results in "bitbake-diffsigs -t fpga-image .."
> yielding "ERROR: No sigdata files found matching fpga-image .." so that
> apparently is a dead end.

The trick is to use bitbake -S to write stamp data for a particular
image and copy that around. The script sstate-diff-machines can help
here.

Note that there's been some sstate fallout from the recent
optimisations: it was discovered yesterday that sstate hashes using
the "contains()" optimisation wasn't reliable so could produce
different hashes on different machines.  Try oe-core master from today
and see if that's any better: it certainly is for me.

Ross

