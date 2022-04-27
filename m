Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <6dff4bbd3390a8e6f7103210eb8e8d74d9cb239c.camel@linuxfoundation.org>
Subject: Re: [oe] CVE-check failing on world with meta-openembedded: diff.gz file
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Apr 2022 11:33:56 +0100
In-Reply-To: <6D1CD0C3-16D0-4FB4-BEDF-FA6FDF94724C@arm.com>
References: 
	<CAApg2=Q9DOoYVHNSCR_=pEN-x7EQuRw2yhwqWhEG2zaMTONt8w@mail.gmail.com>
	 <CAApg2=TjNwub9WsLfh1ZAA8hfMVDPgTYVCELotUfGRGpO9gu8Q@mail.gmail.com>
	 <5e82785b-14bc-5a4d-a807-fdaa58afee5d@gmail.com>
	 <CAApg2=Rd7rBM_PaVEzt4K4vKd4AqVC1uA6yZJZrABFLFYNWrcQ@mail.gmail.com>
	 <6D1CD0C3-16D0-4FB4-BEDF-FA6FDF94724C@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Ross Burton <Ross.Burton@arm.com>, "rybczynska@gmail.com" <rybczynska@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Steve Sakoman <steve@sakoman.com>, OE-core <openembedded-core@lists.openembedded.org>

On Wed, 2022-04-27 at 10:32 +0000, Ross Burton wrote:
> On 27 Apr 2022, at 08:14, Marta Rybczynska via lists.openembedded.org
> <rybczynska=gmail.com@lists.openembedded.org> wrote:
> > I'm wondering if it makes sense to consider .diff.gz (or .patch.gz) files as
> > patches for
> > cve-check. They basically come directly from 3rd parties and it is quite
> > unlikely to expect
> > them to keep the CVE: tag. All the pieces of documentation I can find
> > mention also only
> > .patch files for CVEs, and not .patch.gz.
> > 
> > This is tempting to remove the .gz handling here (for the cve-check) in my
> > opinion.
> > 
> > Also, since the commit f5f97d33a1703d75b9fd9760f2c7767081538e00, cve-check
> > depends only on do_fetch.
> 
> The patch being a .patch.gz isn’t entirely relevant, it’s the fact that it’s a
> remote http: patch not a local file: patch which is causing the problem. The
> code uses the localpath, which only exists for remote URL after do_unpack.
> 
> There are three alternatives here:
> 1) Only consider local patches.  Any remote patches won’t be scanned, but they
> don’t work anyway right now. This might mean the dependency on do_fetch can be
> dropped to speed up checking even further.
> 2) Change the task dependency to be on do_unpack instead of do_fetch. This
> will slow down processing if a build hasn’t already happened as tarballs will
> be unpacked, but remote files will be present for scanning then.
> 3) Try to be clever and manually call unpack on remote files.  More
> complicated but preserves the speed.
> 
> I’m actually undecided over what the best solution is. Clearly we need some
> test cases for this code too.

I think the deciding factor may be that most remote patches probably don't have
the information we're looking for in them anyway?

Cheers,

Richard

