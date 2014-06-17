Return-Path: <darren.hart@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4724065E62
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 14:54:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jun 2014 07:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,494,1400050800"; d="scan'208";a="556829733"
Received: from fmsmsx106.amr.corp.intel.com ([10.19.9.37])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2014 07:53:39 -0700
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
	FMSMSX106.amr.corp.intel.com (10.19.9.37) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 17 Jun 2014 07:53:39 -0700
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.146]) by
	fmsmsx117.amr.corp.intel.com ([169.254.3.122]) with mapi id
	14.03.0123.003; Tue, 17 Jun 2014 07:53:38 -0700
From: "Hart, Darren" <darren.hart@intel.com>
To: Denys Dmytriyenko <denis@denix.org>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] [PATCH] kernel-module-split: Add support for
	KERNEL_MODULE_AUTOLOAD and KERNEL_MODULE_PROBECONF
Thread-Index: AQHPhx61zKa1f/WyYkOst4XYi+pXZ5tv2wqAgAADTwCABYtBAA==
Date: Tue, 17 Jun 2014 14:53:37 +0000
Message-ID: <CFC5A0C1.97B0E%darren.hart@intel.com>
References: <1402674385.29913.6.camel@ted>
	<CADkTA4MtGT145NMXzwfL9z6HDnrLzbvcDdeGeCjC5AJuN-Ad+g@mail.gmail.com>
	<20140613191356.GR27324@denix.org>
In-Reply-To: <20140613191356.GR27324@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.254.68.101]
MIME-Version: 1.0
Cc: Scott Rifenbark <srifenbark@gmail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-module-split: Add support for KERNEL_MODULE_AUTOLOAD and KERNEL_MODULE_PROBECONF
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
X-List-Received-Date: Tue, 17 Jun 2014 14:54:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6445D38AFAC812489C37CE1315FAE8B9@intel.com>
Content-Transfer-Encoding: quoted-printable

On 6/13/14, 12:13, "Denys Dmytriyenko" <denis@denix.org> wrote:

>On Fri, Jun 13, 2014 at 03:02:05PM -0400, Bruce Ashfield wrote:
>> On Fri, Jun 13, 2014 at 11:46 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > The current module_autoload_* and module_conf_* variables are error
>> > both ugly and error prone. They aren't registered in the task
>>checksums
>> > so changes to them aren't reflected in the build. This turns out to
>> > be near impossible to fix with the current variable format in any
>> > sensible way :(.
>> >
>> > This patch replace module_autoload with the list of variables in
>> > KERNEL_MODULE_AUTOLOAD which is a much simpler and usable API. An
>> > error is printed if an old style variable is encountered. It should
>> > be simple to convert to this.
>> >
>> > module_conf_* are harder to deal with since there is data associated
>> > with it, it isn't simply a flag. We need a list of variables that are
>>set
>> > in order to be able to correctly handle the task checksum so we add
>> > KERNEL_MODULE_PROBECONF for this purpose and error if the user hasn't
>> > added a module to it when they should have.
>>=20
>> Looks reasonable to me. In my experience, there aren't a lot of users of
>> the module_* variables, so the transition to the new names and semantics
>> shouldn't be a big issue.
>
>Right, only BSP/Distro maintainers should care... :)
>
>BTW, how about a documentation patch? :)

Adding Scott R.

I was just looking into that. It appears the ref-manual.html is the place
to update. The glossary has a module_autoload definition, which I suppose
needs to be replaced with KERNEL_MODULE_AUTOLOAD, which  will have
slightly different semantics.

If I understand this correctly, the old model was:

	module_autoload_foo =3D "foo"
	module_autoload_bar =3D "bar"

Although the following line in the docs confuses me:

	module_autoload_<modname> =3D "modname1 modname2 modname3"


And now, if I interpreted the commit comment correctly, it should look
like:

	KERNEL_MODULE_AUTOLOAD =3D "foo"
	...
	KERNEL_MODULE_AUTOLOAD +=3D "bar"

I'm not sure how KERNEL_MODULE_PROBECONF is involved, or what value it
brings beyond module_conf. From what I can tell, the changes now require:

	KERNEL_MODULE_PROBECONF =3D "foo"

	module_conf_foo =3D "options foo baz=3D1"

(/me notes the order of operations is non-obvious here "if modconf and
basename in modconflist")

Do I have this correct?

--
Darren

>
>--=20
>Denys
>
>
>> > [YOCTO #5786]
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> >
>> > diff --git a/meta/classes/kernel-module-split.bbclass
>>b/meta/classes/kernel-module-split.bbclass
>> > index d43f743..e38a6f6 100644
>> > --- a/meta/classes/kernel-module-split.bbclass
>> > +++ b/meta/classes/kernel-module-split.bbclass
>> > @@ -130,8 +130,11 @@ python split_kernel_module_packages () {
>> >
>> >          # If autoloading is requested, output
>>/etc/modules-load.d/<name>.conf and append
>> >          # appropriate modprobe commands to the postinst
>> > +        autoloadlist =3D (d.getVar("KERNEL_MODULE_AUTOLOAD", True) or
>>"").split()
>> >          autoload =3D d.getVar('module_autoload_%s' % basename, True)
>> >          if autoload:
>> > +            bb.error("KERNEL_MODULE_AUTOLOAD has replaced
>>module_autoload_%s, please replace it!" % basename)
>> > +        if basename in autoloadlist:
>> >              name =3D '%s/etc/modules-load.d/%s.conf' % (dvar, basenam=
e)
>> >              f =3D open(name, 'w')
>> >              for m in autoload.split():
>> > @@ -144,12 +147,15 @@ python split_kernel_module_packages () {
>> >              d.setVar('pkg_postinst_%s' % pkg, postinst)
>> >
>> >          # Write out any modconf fragment
>> > +        modconflist =3D (d.getVar("KERNEL_MODULE_PROBECONF", True) or
>>"").split()
>> >          modconf =3D d.getVar('module_conf_%s' % basename, True)
>> > -        if modconf:
>> > +        if modconf and basename in modconflist:
>> >              name =3D '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
>> >              f =3D open(name, 'w')
>> >              f.write("%s\n" % modconf)
>> >              f.close()
>> > +        elif modconf:
>> > +            bb.error("Please ensure module %s is listed in
>>KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename,
>>basename))
>> >
>> >          files =3D d.getVar('FILES_%s' % pkg, True)
>> >          files =3D "%s /etc/modules-load.d/%s.conf
>>/etc/modprobe.d/%s.conf" % (files, basename, basename)
>> > @@ -185,3 +191,5 @@ python split_kernel_module_packages () {
>> >          if len(os.listdir(dir)) =3D=3D 0:
>> >              os.rmdir(dir)
>> >  }
>> > +
>> > +do_package[vardeps] +=3D '${@" ".join(map(lambda s: "module_conf_" +
>>s, (d.getVar("KERNEL_MODULE_PROBECONF", True) or "").split()))}'
>> >
>> >
>>=20
>>=20
>>=20
>> --=20
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>> --=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--=20
Darren Hart					Open Source Technology Center
darren.hart@intel.com				            Intel Corporation



