Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RkPBa-0000aB-FZ
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 01:03:31 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 09 Jan 2012 15:55:52 -0800
Received: by iadk27 with SMTP id k27so15897iad.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2012 15:55:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.157.133 with SMTP id d5mr20040695icx.46.1326153351550; Mon,
	09 Jan 2012 15:55:51 -0800 (PST)
Received: by 10.231.162.131 with HTTP; Mon, 9 Jan 2012 15:55:51 -0800 (PST)
In-Reply-To: <cover.1325903501.git.tom.zanussi@intel.com>
References: <cover.1325903501.git.tom.zanussi@intel.com>
Date: Mon, 9 Jan 2012 15:55:51 -0800
Message-ID: <CAPhnLPCiG4ZERTt5kQYmg4f45yTote-ki=yxkVARNCizBuwj5g@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: paul.eggleton@linux.intel.com, philb@gnu.org
Subject: Re: [PATCH 0/5] LICENSE_FLAGS, a replacement for COMMERCIAL_LICENSE, v3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jan 2012 00:03:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 6, 2012 at 6:34 PM,  <tom.zanussi@intel.com> wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
>
> This patchset is a replacement for COMMERCIAL_LICENSE called LICENSE_FLAG=
S.
>
> Please see the commit message for '[PATCH 1/5] base.bbclass: add support
> =A0for LICENSE_FLAGS' for an explanation of the LICENSE_FLAGS mechanism.
>
> v3 changes:
>
> - add back an accidentally-stripped comment in PATCH 1.
>
> v2 changes, reflecting comments from Phil Blundell and Paul Eggleton:
>
> - This version converts all the existing packages listed in COMMERCIAL_LI=
CENSE
> to the equivalent "commercial_${PN}" LICENSE_FLAGS. =A0This allows each p=
ackage
> to be added to or removed from the whitelist instead of the previously
> too-broad 'Commercial' flags for those packages.
>
> - Changes all values to lowercase.
>
> - The new commit message should explain the mechanism and how it can be
> used a little better.
>
>
> For some background on these changes, the original proposal for the
> functionality covered by this replacement was drafted by Saul Wold -
> the relevant details of that proposal are copied below:
>
> ***
>
> There has been some issues raised with the initial implementation of
> COMMERCIAL_LICENSE and we are looking for ways to address this.
> Currently COMMERCIAL_LICENSE (C_L) is defined in default-distrovars.conf
> to contain a list of packages that have additional license requirements
> when used commercially (such as royalty requirements, or acknowledging
> some type of commercial T&Cs). These packages are skipped during parsing.
>
> It currently contains a number of Audio and Video packages that require
> additional licensing terms when used commercially. As we add additional
> layers, some of these layers want to add additional package to the C_L
> list, but how to easily enable them.
>
> Since local.conf, where you would normally override things like this, is
> read in before base.bbclass, which contains tools like oe_filter_out()
> to modify lists, we can't use that mechanism.
>
> That's the background, now for the proposal.
>
> Do away with C_L and C_*_PLUGINS, move to a "Named Bit Flag" list in
> LICENSE_FLAGS, each recipe can then maintain their flags directly,
> instead of in a shared location like default-distrovars.conf.
>
> LICENSE_FLAGS_WHITELIST would be set in local.conf with the values
> that are acceptable to include in this image, by default it would be
> blank.
>
> Possible values for LICENSE_FLAGS could be:
> - Binary - provides some kind of binary with no source
> - Patent - provides a potential infringing item, that some may not want
> - Commercial - include recipes that may have commercial T&C
> - Commercial_${PN} - commercial licenses specific to ${PN}
> - License_${PN} - include a recipe that has a specific license
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 - maybe similar or different than Commerc=
ial_${PN}
>
> ***
>
> [T&C =3D Terms and Conditions]
>
> [NOTE: the above are only 'possible values' that particular license
> flags could take. =A0The above are not proposals for specific flags
> that will be implemented - it's completely up to the package maintainers
> to define appropriate flags for their packages.]

Tom,

I know I would like to see a proposed group of flags. I can see this
being used elsewhere at a later date and the thought of no
standardization around this field worries me a bit.

-b

>
> Note that there's no policy attached to any of the above license types
> - this is simply string-matching that can be used for the purpose of
> screening packages - if the strings match, the recipe gets in, if not,
> it doesn't i.e. during parsing, we would inspect the recipe's data for
> LICENSE_FLAGS and if it has a value then try to match against the
> WHITELIST - if it matches it gets added to the parsed list, if there
> is no match then it gets Skip_Package()'ed.
>
> The following changes since commit 468998cddbe1a803096c9b357e1b5daa3b7e8c=
2e:
> =A0Dongxiao Xu (1):
> =A0 =A0 =A0 =A0command.py: add parseConfigurationFiles API
>
> are available in the git repository at:
>
> =A0git://git.yoctoproject.org/poky-contrib.git tzanussi/license-flags.v3
> =A0http://git.yoctoproject.org/cgit.cgi//log/?h=3Dtzanussi/license-flags.=
v3
>
> Tom Zanussi (5):
> =A0base.bbclass: add support for LICENSE_FLAGS
> =A0Add LICENSE_FLAGS to packages mentioned in COMMERCIAL_LICENSE
> =A0base.bbclass: remove COMMERCIAL_LICENSE code
> =A0default-distrovars.inc: remove COMMERCIAL_LICENSE et al
> =A0documentation-audit.sh: remove COMMERCIAL_LICENSE warning
>
> =A0meta/classes/base.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 24 +++++++++++++++-----
> =A0meta/conf/distro/include/default-distrovars.inc =A0 =A0| =A0 =A05 ----
> =A0.../gstreamer/gst-fluendo-mp3_0.10.16.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
1 +
> =A0.../gstreamer/gst-openmax_0.10.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A01 +
> =A0.../gstreamer/gst-plugins-ugly_0.10.18.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
1 +
> =A0meta/recipes-multimedia/lame/lame_3.99.3.bb =A0 =A0 =A0 =A0| =A0 =A02 =
+
> =A0meta/recipes-multimedia/libmad/libmad_0.15.1b.bb =A0 | =A0 =A01 +
> =A0meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb | =A0 =A01 +
> =A0meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb | =A0 =A01 +
> =A0meta/recipes-qt/qt-apps/qmmp_0.5.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A01 +
> =A0scripts/contrib/documentation-audit.sh =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A03 +-
> =A011 files changed, 29 insertions(+), 12 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


