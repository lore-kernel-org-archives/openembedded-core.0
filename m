Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1T3UOW-0001zM-OR; Mon, 20 Aug 2012 18:00:01 +0200
Received: by iaky10 with SMTP id y10so2823942iak.6
	for <multiple recipients>; Mon, 20 Aug 2012 08:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ZzR+/OKnRuDcHcc5bHkONKzoZn+2ZC/Pe5yHUaqVLyI=;
	b=CX8J4Ro1Sy2HzjQgyG0H1Ec84F36QPBWw+MamOeZHjO77ofhcCQCDjiJnKAoSzDj5Q
	+yGzNFEa5MPXgA8QmDhYYjH4mLCQlu9pBzwGIpj30F6HZHBK8xweMUXKB0DjTkRVNvz0
	UcKEBuafk7fQBv3ayMvD2PNA7gM8ABXuYkNutb1lTVGhq9rWQiTpitNA4D3ZxOG62QK2
	7q9p1MyT8MVNNtoPsSdPC6Owa9sF33q0d9pYdabFFVfYcCPvQADcVG3twwhJn65vvchP
	XNJoHIfEBi26ApV+c90PfPvBUMHkwM2gz7U8IZetMG+v2MsuV3RHZ36W1U1LdcoPkENe
	s5jg==
MIME-Version: 1.0
Received: by 10.42.53.208 with SMTP id o16mr11326817icg.6.1345477677433; Mon,
	20 Aug 2012 08:47:57 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Mon, 20 Aug 2012 08:47:57 -0700 (PDT)
In-Reply-To: <CALbNGRS50yfrmMYUzbCGYykQq25N208UY4k_AMtkrakhGYb0pw@mail.gmail.com>
References: <CALbNGRSyCyCSX23dQXa1neOBior_vHbmKtk8SmSV8pKJdQt44w@mail.gmail.com>
	<CALbNGRS50yfrmMYUzbCGYykQq25N208UY4k_AMtkrakhGYb0pw@mail.gmail.com>
Date: Mon, 20 Aug 2012 17:47:57 +0200
Message-ID: <CALbNGRQXm6ak1jwU7V7FCNKwO5e0UwXc8NpijbWDNGLQoTnm5w@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Subject: Re: pango modules postinst issue
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
X-List-Received-Date: Mon, 20 Aug 2012 16:00:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 20, 2012 at 4:20 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Jul 31, 2012 at 5:01 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
>> Hi,
>>
>> sorry fur disturbing again - but:
>>
>> When starting X on a maiden image I receive:
>>
>> No builtin or dynamically loaded modules were found.
>> PangoFc will not work correctly.
>> This probably means there was an error in the creation of:
>>   '/etc/pango/pango.modules'
>> You should create this file by running:
>>   pango-querymodules > '/etc/pango/pango.modules'
>>
>> and have no fonts displayed. Followed the suggestion
>>
>> pango-querymodules > '/etc/pango/pango.modules'
>>
>> -> fonts are OK.
>>
>> I checked: Besides other pango modules my image contains
>> pango-module-basic-x. In the postinst of this package I see
>>
>> #!/bin/sh
>> if [ "x$D" !=3D "x" ]; then
>>   exit 1
>> fi
>>
>> if ! [ -e $D/etc/pango ] ; then
>>         mkdir -p $D/etc/pango
>> fi
>> /usr/bin/pango-querymodules > /etc/pango/pango.modules
>>
>> This looks OK so far ( besides that I would not have the $D in second pa=
rt ).
>>
>> Additionally log.do_rootfs says:
>>
>> Configuring pango-module-basic-x.
>> pango-module-basic-x.postinst returned 1, marking as unpacked only,
>> configuration required on target.
>>
>> Any idea what is happening here?
>>
> I investigated this and found oe-core commit
> ffe93e2a099e4cadb1829dc12a58a6d7bef9a5a7 for opkg-collateral. Besides
> changing the configuration location it changes
>
> -lists_dir ext /var/lib/ipkg
> +lists_dir ext /var/lib/opkg
>
> The patch attached for meta-angstrom fixes the pango-postinst issue
> but I am not quite sure if this is a good solution, because it
> reinvents parts of opkg-collateral. Why does angstrom replace
> opkg-collateral? Wouldn't it be a better solution to append
> opkg-collateral with angstrom feeds packages?
>
Aargh - I did two things at the same time

1. patch attached in previous mail
2.
diff --git a/meta/recipes-devtools/opkg/opkg.inc
b/meta/recipes-devtools/opkg/opkg.inc
index 5c7cad3..168e4b1 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -59,7 +59,7 @@ if [ "x$D" !=3D "x" ]; then
        install -d $D${sysconfdir}/rcS.d
        # this happens at S98 where our good 'ole packages script used to r=
un
        echo "#!/bin/sh
-opkg-cl configure
+opkg-cl configure > /var/log/opkg-configure.log
 rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 " > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
        chmod 0755
$D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts


Now that I reverted 2. pango is again not properly prepared after
first boot :( So it is not a matter of wrong configuration of opkg by
meta-angstrom.

Seems that writing output of 'opkg-cl configure' changes timing and
thereby working around the bug.

Suspicious: The systemd startup sequence log says:

         Starting Run pending postinsts...
[  OK  ] Mounted POSIXBluetooth: HIDP (Human Interface Emulation) ver 1.2
 Message Queue File System.
[  OK  ] Mounted Debug File System.
systemd-journald[66]: Fixed max_use=3D23.9M max_size=3D2.9M min_size=3D64.0=
K
keep_free=3D11.9M
systemd-udevd[64]: starting version 187
Bluetooth: RFCOMM TTY layer initialized
Bluetooth: RFCOMM socket layer initialized
Bluetooth: RFCOMM ver 1.11
[  OK  ] Started udev Kernel Device Manager.
[  OK  ] Started Load Kernel Modules.
         Mounting FUSE Control File System...
systemd-journald[66]: Reserving 5447 entries in hash table.
[  OK  ] Mounted FUSE Control File System.
systemd-journald[66]: Vacuuming...
[  OK  ] Started udev Coldplug all Devices.
EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
[  OK  ] Started Remount Root and Kernel File Systems.
[  OK  ] Reached target Local File Systems (Pre).
         Mounting /tmp...
         Starting Load Random Seed...
[  OK  ] Mounted /tmp.

and

root@overo:~# journalctl | grep tmp
Aug 20 16:59:33 overo S98run-postinsts[68]: * opkg_prep_intercepts:
Failed to make temp dir /tmp/opkg-07xOYO/opkg-intercept-wfVgAQ: No
such file or directory.
Aug 20 16:59:33 overo S98run-postinsts[68]: * rm_r: Failed to open dir
/tmp/opkg-07xOYO: No such file or directory.
Aug 20 16:59:56 overo kernel[276]: devtmpfs: initialized
Aug 20 16:59:59 overo kernel[276]: devtmpfs: mounted

So my conclusion (for now): During postinst /tmp is required (by which
package I don't know and guess it is out of interest). Unfortunately
at that time /tmp is not yet mounted causing postinst to abort and
leave packages undone:

root@overo:~# opkg info pango-module*
Package: pango-module-basic-fc
Version: 1.30.0-r0
Depends: libffi5 (>=3D 3.0.10), libc6 (>=3D 2.15), libfreetype6 (>=3D
2.4.9), libstdc++6 (>=3D
4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede), libglib-2.0-0
(>=3D 2.32.4), pango, )
Provides:
Status: install ok *unpacked*
Architecture: armv7a-vfp-neon
Installed-Time: 1345474265

Package: pango-module-basic-x
Version: 1.30.0-r0
Depends: libx11-6 (>=3D 1.5.0), libxcb1 (>=3D 1.8.1), libffi5 (>=3D 3.0.10)=
,
libc6 (>=3D 2.15), libglib-2.0-0 (>=3D 2.32.4), pango, libxau6 (>=3D 1.0.7)=
,
libxdmcp6 (>=3D 1.1.1)
Provides:
Status: install ok *unpacked*
Architecture: armv7a-vfp-neon
Installed-Time: 1345474265

Support running postinst after /tmp is mounted is welcome...

Andreas


