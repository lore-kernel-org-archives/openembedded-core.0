Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 55F4573695
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 14:44:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5GEifL1020683
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Jun 2016 07:44:41 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 16 Jun 2016 07:44:40 -0700
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.20.1606160643040.23824@localhost.localdomain>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <af5ab8f2-8b9d-8171-d650-62fe03e58e93@windriver.com>
Date: Thu, 16 Jun 2016 09:44:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1606160643040.23824@localhost.localdomain>
Subject: Re: couple trivial(?) questions regarding RPM revision/version numbers
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
X-List-Received-Date: Thu, 16 Jun 2016 14:44:49 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 6/16/16 6:00 AM, Robert P. J. Day wrote:
> 
>   not at my dev machine at the moment; otherwise, i could just test
> this but i'd probably still want clarification, anyway.
> 
>   so, i'm well aware that a single recipe can generate numerous (in my
> case, rpm) package files. basic case: a recipe can generate the "base"
> package, a "doc" package, a "dev" package, and so on and so on. no
> problem there.
> 
>   first clarification -- regardless of how versioning and revisioning
> is being done, *all* packages generated from a single recipe during
> the same build have to have the same version and revision number, yes?
> i can't imagine how that couldn't be true, but i've been surprised
> before.

This is not required, it is typically true -- but there may be some exceptions.

(I believe this is the same in deb and opkg...)

The final package name, epoch, version, and release come from the following
variables:

name: PKG_<package> or 'packagename' in the PACKAGES variable
epoch: PKGE_<package> or PKGE
version: PKGV_<package> or PKGV
release: PKGR_<package> or PKGR

PKG_<package> is often set in the debian.bbclass, but could be set directly in
the recipe itself.

PKGE/V/R are defined in bitbake.conf:
PKGV ?= "${PV}"
PKGR ?= "${PR}${EXTENDPRAUTO}"
PKGE ?= "${@['','${PE}'][int(d.getVar('PE', True) or 0) > 0]}"
EXTENDPKGEVER = "${@['','${PKGE}:'][d.getVar('PKGE', True).strip() != '']}"
EXTENDPKGV ?= "${EXTENDPKGEVER}${PKGV}-${PKGR}"

This gives the recipe author ultimate control over each sub package.

It's -strongly- suggested you don't manually set PKGE, but it is theoretically
there.... if you did set it, you should use the same type of package extension
code above for the PR server.

>   next question -- if any part of the base content for a recipe
> changes and that recipe is processed again, all generated packages
> have to jump to the next version/revision together, correct? again,
> this seems obvious, but i want to make absolutely sure.

version changes if the upstream source changes (not integration patches),
release changes on integration changes, including rebuilds due to dependent
packages.

>   so if i have a recipe for which i make a tiny change that affects
> the content of only one of the generated packages, if the revision
> number increases from, say, "r4" to "r5", *all* of the generated
> packages go along for the ride, even all the rest of the packages
> whose content did *not* change. so i could end up with a slew of
> generated packages whose revision number increased, even though
> absolutely nothing about the package content actually changed. so far,
> so good?

Yes, they all are revised as a unit, unless someone is playing games directly
with PKGE.

>   and finally, if the above is accurate, at some point, if i get an
> updated recipe, and rebuild never package files from it, and do an
> update, a lot of those "newer" packages might not contain any actual
> changes, and if that happens, does the rpm update operation actually
> do any work?

RPM is "smart" in that when you perform an upgrade activity, say from

foo-1.0-r1 to foo-1.0-r2, it will look at the checksums of the files to be
updated, from the old version to the new version.  It will ONLY unpack and
upgrade the files that have changed.  If none of the files were modified, then
the action is very quick as it simply updates the metadata in the RPM
repository.  (I don't know how deb/ipkg deal with those situations.)

Since other things that require all the way down to the revision level, it's
important that the package is upgraded even if there are no changes from the
previous version in order to deal with dependencies.

This is why the build compare code, when run properly, should be diffing each
sub package, if it encounters any sub package with a change -- then -all- of the
packages in that recipe should be considered to have changed and make it into
the upgrade set.

>   i understand that the end result will be(?) that all of those
> related packages will now have the newer revision number once the
> update is done, but it's entirely possible (even normal) for there to
> have been no change effected by that "update". and in cases like that,
> even if one of my packages was "updated":
> 
>   rday-doc-1.0-r0  --->  rday-doc-1.0-r1
> 
> the content of that package could be unchanged. and if that happens
> (and if everything i've been saying so far is true), is rpm smart
> enough to not do any work in cases like that, and just quietly bump up
> the version number of the installed package and move on?

See above.  Work is minimal, but this is built into the design of RPM.

One downside of this optimization -- the system never actually checks what is on
the disk.  So in the scenario above, if you do:

rpm -U rday-doc-1.0-r0

echo modfied > /usr/share/docs/rday/mydoc

rpm -V rday-doc

(this will show it's been modified)

rpm -U rday-doc-1.0-r1

rpm -V rday-doc

this will again show it's been modified.  As the package 'upgrade' does not
check the on-disk contents, only the database.  The rpm -V operation compares
the DB to the on-disk contents at the current time.

So when building an RPM based embedded system, you need to automate validation
of the system -- and if the system policy is that if things fail validation they
have to be 'fixed', you'll have to tell the system to re-install using
'--replacefiles'.

--Mark

>   is there anything here i'm missing or misunderstanding? thanks.
> 
> rday
> 


