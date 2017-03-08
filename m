Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 98D5172F4D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 23:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v28ND4XR031191; Wed, 8 Mar 2017 23:13:04 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id z-Qm4BOPiTIJ; Wed,  8 Mar 2017 23:13:04 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v28ND2CC031175
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Mar 2017 23:13:03 GMT
Message-ID: <1489014782.22968.82.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Ross Burton <ross.burton@intel.com>
Date: Wed, 08 Mar 2017 23:13:02 +0000
In-Reply-To: <CAJ86T=XSzySy8kV__TbKXnMWr-2RGjGPsGjD-MxVJV_CXbnVEQ@mail.gmail.com>
References: <1488993907-13037-1-git-send-email-ross.burton@intel.com>
	<CAJ86T=XEAnT+ZR4b2GLE_V+vQjRoXuv7Tn0_sQ5Cv14B4PoN2Q@mail.gmail.com>
	<CAJ86T=XSzySy8kV__TbKXnMWr-2RGjGPsGjD-MxVJV_CXbnVEQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: add gitupstream class
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
X-List-Received-Date: Wed, 08 Mar 2017 23:13:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-08 at 14:44 -0800, Andre McCurdy wrote:
> On Wed, Mar 8, 2017 at 12:54 PM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> > 
> > On Wed, Mar 8, 2017 at 9:25 AM, Ross Burton <ross.burton@intel.com>
> > wrote:
> > > 
> > > This class lets you use BBCLASSEXTEND to add a variant of the
> > > recipe that
> > > fetches from git instead of a tarball.
> > Looks good. This approach could perhaps also cover git -vs-
> > externalsrc variants of a recipe, which seems to be a big topic for
> > a
> > lot of users.
> > 
> > > 
> > > For example:
> > > 
> > >  BBCLASSEXTEND = "gitupstream:target"
> > >  SRC_URI_class-gitupstream = "git://git.example.com/example"
> > >  SRCREV_class-gitupstream = "abcd1234"
> > > 
> > > This variant will have DEFAULT_PREFERENCE set to -1 so it needs
> > > to be selected
> > > to be used
> > So if I want to select the gitupstream variant, what should I set
> > PREFERRED_VERSION to?
> > 
> > > 
> > > , and any git-specific tweaks can be done with the class-
> > > gitupstream
> > > override, for example:
> > > 
> > >  DEPENDS_append_class-gitupstream = " gperf-native"
> > > 
> > >  do_configure_prepend_class-gitupstream() {
> > >     touch ${S}/README
> > >  }
> > > 
> > > It currently only supports creating a git variant of the target
> > > recipe, not
> > > native or nativesdk.  The BBCLASSEXTEND syntax
> > > (gitupstream:target) was chosen
> > > so that support for native and nativesdk can be added at a later
> > > date.
> > > 
> > > [ YOCTO #10215 ]
> > > 
> > > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > ---
> > >  meta/classes/gitupstream.bbclass | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > >  create mode 100644 meta/classes/gitupstream.bbclass
> > > 
> > > diff --git a/meta/classes/gitupstream.bbclass
> > > b/meta/classes/gitupstream.bbclass
> > > new file mode 100644
> > > index 0000000..405283d
> > > --- /dev/null
> > > +++ b/meta/classes/gitupstream.bbclass
> > > @@ -0,0 +1,25 @@
> > > +CLASSOVERRIDE = "class-gitupstream"
> > > +
> > > +# TODO doesn't let you gitupstream a native recipe yet
> > > +
> > > +python gitupstream_virtclass_handler () {
> > > +    # Do nothing if this is inherited, as it's for BBCLASSEXTEND
> > > +    if "gitupstream" not in (e.data.getVar('BBCLASSEXTEND',
> > > True) or ""):
> > What's the significance of e.data.getVar() here -vs- d.getVar()
> > below?
> To answer my own question, this seems to be covered in the bitbake
> user manual:
> 
> "The global datastore is available as "d". In legacy code, you might
> see "e.data" used to get the datastore. However, realize that
> "e.data"
> is deprecated and you should use "d" going forward."
> 
> http://www.yoctoproject.org/docs/2.2.1/bitbake-user-manual/bitbake-us
> er-manual.html#events

Well found, I was about to reply mentioning this. I did help Scott
update that piece of the manual recently! :)

Cheers,

Richard

