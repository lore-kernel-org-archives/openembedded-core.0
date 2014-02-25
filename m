Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe02.domain01.net (STOEXHUBFE02.domain01.net
	[83.145.59.141])
	by mail.openembedded.org (Postfix) with ESMTP id 775A06B961
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 07:22:13 +0000 (UTC)
Received: from ad.chargestorm.se (2.68.210.98) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Tue, 25 Feb 2014 08:22:26 +0100
Date: Tue, 25 Feb 2014 08:22:04 +0100
From: Anders Darander <anders@chargestorm.se>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20140225072200.GA2985@ad.chargestorm.se>
Mail-Followup-To: Laszlo Papp <lpapp@kde.org>,
	"Burton, Ross" <ross.burton@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <CAOMwXhOmoLP_8+mv_c_4Eg8YG_T1JD-ao+P1S9FDKvityy_3mA@mail.gmail.com>
	<CAJTo0LY6hsYxR2=aeRodKhZ+5VBEUh+q+7nRYU0E6XYc+Pn-NQ@mail.gmail.com>
	<CAOMwXhN+D+kGw70ijEs_Zd9aNiLsmuts0B6SHf9QXkytgaQCPA@mail.gmail.com>
	<20140224135848.GA26295@ad.chargestorm.se>
	<CAOMwXhMsjQ2v40hM5UCx1R_NHnop2G2z_kTDVCqV4dWPwXW9EQ@mail.gmail.com>
	<20140224145117.GB26295@ad.chargestorm.se>
	<CAOMwXhOOghbcYwYyn__0=RxgipM_mFz-d6vwmqtebCpiW8_R3Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMwXhOOghbcYwYyn__0=RxgipM_mFz-d6vwmqtebCpiW8_R3Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 25 Feb 2014 07:22:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Laszlo Papp <lpapp@kde.org> [140224 16:26]:

> On Mon, Feb 24, 2014 at 2:51 PM, Anders Darander <anders@chargestorm.se> wrote:
> > * Laszlo Papp <lpapp@kde.org> [140224 15:12]:

> >> > It might not be as pretty as the 10.0.10.738 in your example, though for
> >> > us it's sufficient for the time being.

> >> As you are writing, that is good for internal operation, but I would
> >> dislike providing such "versioning" for customers.

> > Yes, for customer communication it might very well be preferred to use
> > some other version numbers.

> > I'd guess that the best bet then would be to either store the version
> > number in a config file in your repo, and have the build process take
> > that number and put it into the image in a way similar to what's above.

> Yes, I was thinking about a PRODUCT_VERSION or SOFTWARE_VERSION as a
> configuration option (and/or command line option).

Well, if you set it as a variable, you can always use it in e.g. the
IMAGE_PREPROCESS_COMMAND, to store it to a suitable file in the image.
Just as I'm storing the output from git describe.

If you plan on keeping multiple image versions (which you should do at
least for released images), you likely should then append your version
number to the image names (and possibly some more info), or at least
store them in a versioned tree/repository for easy retrieval.

> > Or to get the number from a tag.

> Hmm, actually, this is not such bad an idea.

> > In either case, you'll need to make
> > sure that the release process updates the number correctly, thought that
> > issue will be there no matter how you retreive and store the number.

> Yes, these things can be automated in release scripts, absolutely.

> > Though, I still think that having the info above on the images are
> > usefull, not least when the customer comes back with more difficult to
> > isolate issues.

> I am not sure what information you mean. If you identify the image
> appropriately with a version and the corresponding list of package and
> versions (e.g. "image" BUILDHISTORY_FEATURE), I think you are good to
> go.

Well, there's always a risk, especially at smaller companies (though
I've seen it happened quite a few times also in larger ones), that a
release build isn't build on an autobuilder, but manually on a
developers machine. If that developer isn't carefull enough / a little
bit lazy, he/she migth reuse an existing build tree. If that tree's
dirty, you'll never be able to recreate the image...

That's one reason that I like to always add the git describe info to the
image. Though, not necessarily in a way such that the customer normally
will see it. 

Now that I'm re-reading your comment, there's another possibility that
can occur, no matter if your setting the PRODUCT_VERSION on command line
or in a recipe. If you set it and build, and afterwards make another
change, followed by a rebuild, the version number will be re-used. Sure,
this is more of a release process thing; though if there's some way to
detect this, it's nice to automate it. Buildhistory is one such thing,
at least as long as you make sure that all releases are built on the
same build box.

> Currently, I am not trying to solve such internal issues. It is more
> important for me at this stage to be able to provide a useful version
> to the end user and also for own sake, but admittedly, tag is actually
> a good idea, thanks.

Sure, I agree that using a more standard versioning scheme towards the
customer is a good idea. (The customer can't know which SHA1 precedes
which other, nor the sequence of tags). I'm merely argueing that keeping
both types of version numbers is pretty vital in my opinion. (Not least
after having been tasked to try to find out what a customer's customer
actually was running, no-one knew what version were being used. After
that incident, I'm always advocating to include as much info as possible).

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

