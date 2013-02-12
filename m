Received: from mail-ob0-f179.google.com ([209.85.214.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1U5Low-00018H-5u; Tue, 12 Feb 2013 20:47:14 +0100
Received: by mail-ob0-f179.google.com with SMTP id un3so457207obb.24
	for <multiple recipients>; Tue, 12 Feb 2013 11:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=iskwcGdJ7zLcThNR9gOfzJdI85Mut500FXUjZw2CGYo=;
	b=xFNx91abVasSvOabdEYfURvfi43MOiWRGMtWVpkY/btVbsjd8EZ7GSiO/Ldz3y4njy
	5y/7Uvf6IfZkciB/uFvajpqfLrCppEd9hs35ASbb71OZG4hLpA1OQxb39+ee9Jsx+btY
	QXK5+7Tc0h2GJVkIhoE8oPjibScaODYnLdARD0TYr8K6X5r/nKtGUQWCgIY2to6XThyp
	W1UQlHz4tLYHVoO4y0MxiUkzy0xzWBM1dsqEhzhX2kp33Z0//RfmWKjugx7hXXryXJEc
	m46eOMah/zj446ArlEC5T9O7D0/0wWhV3EStZuJqAPr3rrz/RJ+DnWDto7aSbK0R/9zj
	5sMg==
MIME-Version: 1.0
X-Received: by 10.182.39.69 with SMTP id n5mr14725478obk.72.1360697473711;
	Tue, 12 Feb 2013 11:31:13 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 12 Feb 2013 11:31:13 -0800 (PST)
In-Reply-To: <20130212191902.GD3300@jama>
References: <2760168.9kFd94gL1F@helios>
	<20130212191902.GD3300@jama>
Date: Tue, 12 Feb 2013 17:31:13 -0200
X-Google-Sender-Auth: DP05XG5Pnf_wkiG3_wBD9pTLml4
Message-ID: <CAP9ODKqP0S=KGyvrZ0FmEwzOw-6GHmV7fX_O7CcLAx_tWQa-7g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: meta-oe appends and overlayed recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 19:47:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 12, 2013 at 5:19 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Feb 11, 2013 at 05:09:01PM +0000, Paul Eggleton wrote:
>> Hi all,
>>
>> I'd like to make an attempt to remove all appends and overlayed recipes from
>> the meta-oe layer. As I've said previously, I don't believe meta-oe - as a
>> collection of very useful additional recipes that many wish to be able to use
>> on top of their OE-Core based build configurations - should be making any
>> possibly unexpected changes to those configurations. Any such changes ought to
>> be the province of distro layers alone.
>>
>> We've already removed all of the obvious overlayed recipes and the meta-
>> systemd split removed most of the pieces that were there for systemd support;
>> there are just a few remaining recipes and appends that need to be dealt with.
>> I'll catalogue these below with my comments.
>>
>> Currently we have the following overlayed recipes:
>>
>> * icon-naming-utils: meta-oe has a newer version (0.8.90 vs OE-Core's 0.8.7)
>> and it uses BBCLASSEXTEND rather than OE-Core's native recipe. I would propose
>> to just move the meta-oe version to OE-Core since it appears to be superior.
>>
>> * libmad: both layers have the same version. The meta-oe version has some
>> slightly different versions of the MIPS compiler flag fix and -fforce-mem removal
>> patches but I think these can be ignored, since the OE-Core versions of these
>> patches have proper headers and are presumably working. The OE-Core version
>> has LICENSE_FLAGS that the meta-oe one doesn't, but is missing an avr32-
>> specific optimisation patch that is in the meta-oe version. What would we do
>> with the latter? Is it appropriate to add to the OE-Core recipe?
>>
>> * tslib: OE-Core has the 1.0 release version, meta-oe has a git recipe that is
>> ahead of 1.0; the OE-Core version has two patches not in the meta-oe version
>> but that both have been merged upstream in the git revision being used in the
>> meta-oe version. There is no newer stable release. What do we do here? Should
>> we ask upstream (Chris) for a new stable release?
>
> tslib is also requested on devices where kernel driver returns too much
> noise, tslib can filter that, evdev needs separate filter like
> http://atrey.karlin.mff.cuni.cz/~metan/evfilter/
> but that isn't integrated in OE.
>
>> * xserver-nodm-init: the two versions are quite distinct. Not sure I
>> understand the full history here but perhaps someone else can fill in the
>> blanks...?
>
> The biggest difference is integrated xinput-calibrator and use of
> xserver-common_1.34.bb
>
>> As far as bbappends go we have:
>>
>> * meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
>> As far as I can tell this just adds an /etc/busybox-syslog.default file
>> containing OPTIONS="-C64" and seems to have been added for systemd support.
>> I'm not sure why this wasn't moved to meta-systemd, but I assume it needs to
>> be merged into OE-Core now that systemd support is being added there... ?
>>
>> * meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
>> Another bbappend apparently for systemd support. Again, this should have been
>> moved to meta-systemd; do we now need to merge it into OE-Core?
>>
>> * meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
>> This is adding qwt to the qte toolchain. As far as I am concerned this is a
>> distro policy decision - Qwt is a third-party library that is not part of Qt.
>> I believe this should be moved to the layers for whichever distros want this.
>>
>> * meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
>> * meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
>> These two add MySQL and PostgreSQL support to Qt and Qt/Embedded. I see this
>> as a distro policy decision; these should move to the layers for whichever
>> distros want this. FWIW, this is particularly egregious if you've already
>> built Qt, then add meta-oe and find Qt is being unexpectedly rebuilt.
>
> MySQL and PostgreSQL are not in oe-core so it cannot be replaced with
> simple PACKAGECONFIG option in oe-core recipe, but I also prefer to
> share such .bbappend somewhere instead of every distribution reinventing
> the wheel when trying to enable something as simple as db in qt.

So maybe meta-oe ought to add PACKAGECONFIG options?

>> * meta-oe/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
>> Builds against external libav instead of using the builtin copy of ffmpeg,
>> apparently for better performance on ARM (and presumably that is not the only
>> benefit). It's less clear to me what should be done with this, but I'd still
>> rather it could be eliminated. OE-Core does not have ffmpeg/libav; one wonders
>> if it should or not.
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


