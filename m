Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe02.domain01.net (STOEXHUBFE02.domain01.net
	[83.145.59.141])
	by mail.openembedded.org (Postfix) with ESMTP id A31EB6F2A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 13:58:54 +0000 (UTC)
Received: from ad.chargestorm.se (2.71.241.194) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Mon, 24 Feb 2014 14:59:05 +0100
Date: Mon, 24 Feb 2014 14:58:50 +0100
From: Anders Darander <anders@chargestorm.se>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20140224135848.GA26295@ad.chargestorm.se>
Mail-Followup-To: Laszlo Papp <lpapp@kde.org>,
	"Burton, Ross" <ross.burton@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <CAOMwXhOmoLP_8+mv_c_4Eg8YG_T1JD-ao+P1S9FDKvityy_3mA@mail.gmail.com>
	<CAJTo0LY6hsYxR2=aeRodKhZ+5VBEUh+q+7nRYU0E6XYc+Pn-NQ@mail.gmail.com>
	<CAOMwXhN+D+kGw70ijEs_Zd9aNiLsmuts0B6SHf9QXkytgaQCPA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMwXhN+D+kGw70ijEs_Zd9aNiLsmuts0B6SHf9QXkytgaQCPA@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: No versioning for existing images
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
X-List-Received-Date: Mon, 24 Feb 2014 13:58:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Laszlo Papp <lpapp@kde.org> [140224 14:37]:

> On Mon, Feb 24, 2014 at 1:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
> > On 24 February 2014 12:01, Laszlo Papp <lpapp@kde.org> wrote:
> >> For instance, the MeeGo Nokia phone had a software version information
> >> in the settings, and that is something I would personally consider as
> >> the image version, but again, there might be better ways. Please share
> >> good practices in here., or alternatively, feel free to point me to
> >> any documentation, examples, etc.

> > This is an interesting example and a useful demonstration of why the
> > image version isn't always that useful.

> I am not sure about that; see below.

> > The software build number
> > covers *everything* that goes into the image, but the image version
> > number is just the version of the top-level image recipe.

> The problem is that build numbers, that I have seen at least, are
> human unreadable. A human readable number would be nicer to have;
> something that I have just double checked on my Blackberry Limited
> Edition phone, and it is so that the OS Version is 10.0.10.738 in the
> settings.

> Perhaps the build number can be made human readable... but currently,
> when I build an image, all I get is a long and not so convenient
> time-stamp. Is there a more gentle way of generating image version
> then?

Human readable... I think that I've got to agree with Ross on this one.

Though, the big question is about human readable...

For our internal images, we're using

IMAGE_PREPROCESS_COMMAND += "rootfs_update_timestamp ;\
             date +%Y%m%d%H%M >${IMAGE_ROOTFS}/etc/build ; \
             git describe --dirty --long --always >${IMAGE_ROOTFS}/etc/version ;\
             "

The first line is more or less the timestamp that you dislike.

The git describe line is our main versioning. Using that line we get the
abreviated SHA1 of our repo, the last tag, the number of commits after
the last tag, and finally whether the repo was clean or dirty during the
build.

This allows us internally to pinpoint the exact build setup (assuming
the build wasn't dirty, which it should never be on an autobuilder /
release build).

It might not be as pretty as the 10.0.10.738 in your example, though for
us it's sufficient for the time being.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

