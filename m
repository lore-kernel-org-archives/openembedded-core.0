Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 128B662137
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 15:31:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3LFVZNW028755
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 08:31:35 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Apr 2016 08:31:34 -0700
To: <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.20.1604210738320.5726@localhost.localdomain>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5718F255.5000308@windriver.com>
Date: Thu, 21 Apr 2016 10:31:33 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1604210738320.5726@localhost.localdomain>
Subject: Re: trying to reconcile OE builds with rpm4-format rpm files built on centos 6
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
X-List-Received-Date: Thu, 21 Apr 2016 15:31:35 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 4/21/16 7:06 AM, Robert P. J. Day wrote:
> 
>   looking for advice on how to most cleanly deal with the following.
> currently working on BSP layer to which some folks want to add RPMs
> that are currently (and for quite some time have been) built on a
> centos 6 system, which means those RPM files are in rpm4 format; ergo,
> they obviously don't play well with a system built with current OE/YP.
> so ... what to do?

What is not working about the packages build with RPM 4?  The RPM format is
compatible between RPM 4 and RPM 5.

There are specific configurations that may or may not be used in the RPM 4
compilations, that may need to be enabled in RPM 5.  Things like compression
format for instance.

I need to see the errors that are encountered to give a clue as to what may be
wrong.

>   first, current muttering is, "grrrrrr ... why did OE migrate to
> rpm5?" i actually didn't really know the answer to that, so i poked
> around and found this:
> 
>   http://rpm5.org/community/rpm-users/0998.html

It's been a while, but there was a thread a while back on 4 vs 5 on the OE list,
and there was a mini thread on the YP list a few days ago.

Unfortunately I am not finding the email.

I'll quote from another email I've sent (this is NOT the one I'm referring to BTW).

Comparing RPM 4 to RPM 5 (circa May 2014):

HHGG:
* Don't panic!  RPM Packages are compatible between RPM 4 and RPM 5.

Background:

* RPM 4 and RPM 5 split a number of years ago.
   Both still have their purposes.

- RPM 4:
   * License: GPLv2+
   * Uses beecrypt and nss for encryption
   * Maintained and supported by Fedora(Red Hat)

- RPM 5:
   * License: LGPLv2.1
   * Uses beecrypt, and (nss or openssl or others) for encryption
     - Can't mix OpenSSL w/ GPLv2 due to license issue
   * Maintained and supported by Jeff Johnson

Differences:

* RPM 4 vs RPM 5
RPM 4 is missing the following features:

- Cross compile support / Cross endian support
  ** rpmbuild v4 is intended for native builds only

The RPM data structures should be little endian for the most part, but
historically RPM 4 did not transform everything to little endian.  This caused
problems when a package was built on x86 and installed on Power.  The berkleydb
itself was susceptible to this -- RPM5 does proper endian translations.

- "no arch"  / "not arch" support

In RPM4, there is a set list of 'compatible' and 'known' architectures.  If your
package 'arch' is not in this list, everything fails.

In RPM5, there is no set list.  Instead, there is a configuration of compatible
platforms (thats the /etc/rpm/platforms file).  The package arch is not used for
compatibility, instead there is a package platform that is inspected and
compared.  (Note, RPM4 also sets the platform, it just doesn't use it in this way.)

- Support for arbitrary tags

Packages can specify arbitrary information to include in the header and be
retrieved during install and inspection.  There tags are used by OpenEmbedded
for the 'Suggests' and 'Enhances' fields.  (While rarely used, we do support the
values.  In addition, I know of a few people who use the arbitrary tags to add
additional support information into the RPM packages themselves.  This is
outside the normal OE usage though.)

- RPM 5 has supported the 'Recommends' field for a long time, only recently has
RPM 4 added it -- and it was added in an incompatible way.

RPM 5 puts recommended items into the 'requires' field, and adds a 'MISSINGOK' flag.

RPM 4 defined a new tag for Recommended items.

(Both RPM 5 and 4 support each others implementations)

- RPM 5 maintainer actively cares about OE and YP usages.

You may not see Jeff on the mailing list, but I talk with him regularly and
discuss the problems and enhancements we have.  He will work through the issues
with me (and other YP folks) to try to come up with a solution that fits into
the RPM framework without creating new incompatibilities.  This is a huge help
for us.

- RPM 5 does not have a plug-in interface like RPM 4

This is the one place where I've seen discussions for people demanding RPM 4.
They need specific IMA, Smack, Selinux, etc plugins.  Frankly I think trusting
any system the size and complexity of RPM with that responsibility is
incorrect... but from a compatibility standpoint that may be one of the few
reasons to justify RPM 4 at present.

> the mention of "more flexibility in cross compilation and control"
> makes perfect sense to me, but is there a more comprehensive writeup
> somewhere that lays out the rationale for the move to rpm5 that can be
> used in its defense?
> 
>   next bit of muttering is, "can we downgrade the OE build to use
> rpm4-format packages?", which is not a path down which i want to walk.

If you want package compatibility, this simply should not be necessary.

>   another option is to simply install a totally independent rpm5 on
> the centos 6 box, and use that exclusively for building packages to be
> installed on an OE system. has anyone done this? does it represent a
> sane/reasonable approach?

Yes this works, I've done it as have others.

>   finally, my reaction to all of this is, "why not just write recipes
> for all that software so it can be built by OE?" but, as explained to
> me, the OE package build system is *heavily* tied to a much larger
> internal build process that resides on the centos 6 box, and there is
> a real reluctance to try to extract the OE component from the larger
> build process. the phrase that seems to pop up is, "not a chance in
> hell."
> 
>   so ... thoughts? short of ripping out that part of the build process
> and properly adding it as additional recipes to the OE build, is it
> possible to build and install rpm5 on a centos 6 box? as a test, i can
> try it for my fedora 23 system and, if that works, at least i can
> demonstrate proof-of-concept.
> 
>   anyone done this? if it's possible, it would seem to be the simplest
> solution under the circumstances.

At ELC a person from Fujitsu demonstrated using Smart from inside of the SDK.
The reason I bring this up, if smart works -- frankly rpmbuild should work as
well (properly configured/setup).

It should be possible, but I doubt it's been well tested, to produce an SDK that
includes rpm/rpmbuild in it and macro files that match the behaviors we expect.

On the target itself, you can run rpmbuild and build many packages.  (This falls
down a bit when there is a distribution specific macro file required -- however,
often you can just make the macro available and it works.)

> rday
> 
> p.s. does adding the smart package manager into all of this make any
> difference? i'm pretty familiar with RPM packaging, but have barely
> looked at smart, and i don't know whether it would have any relevance
> to this issue.
> 

It should not have any effect.

--Mark

