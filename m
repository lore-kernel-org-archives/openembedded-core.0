Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGEpB-0006I8-Eb
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 20:55:41 +0200
Received: by gyc15 with SMTP id 15so870420gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 11:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ugMH0nNB0bzz0yEXeNExDVOok0yKZ2Aa/g6N64ojkZg=;
	b=X79xxZGdzXx/9SjmqIKXR54cNOmATU+LRu+NxLhZzBwp1eDPfwncow8HKbqUOuUfQp
	agPWw84fqjLsaNvGnzP1g2oveS/gfEnbE5iRdl9+K/+DnRbGe/MlDUEcFlYLf0Lmlyc8
	3bqS2jB3OiZZvT940C7Wcgnu0g9xcmBBc81a0=
MIME-Version: 1.0
Received: by 10.68.35.231 with SMTP id l7mr6755228pbj.41.1318963786477; Tue,
	18 Oct 2011 11:49:46 -0700 (PDT)
Received: by 10.142.133.1 with HTTP; Tue, 18 Oct 2011 11:49:46 -0700 (PDT)
In-Reply-To: <bd5259c1b77e280bf7c076b50eedd0c3dc3424dc.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
	<bd5259c1b77e280bf7c076b50eedd0c3dc3424dc.1318796061.git.sgw@linux.intel.com>
Date: Tue, 18 Oct 2011 20:49:46 +0200
Message-ID: <CA+chaQfUYO5MZqKq5FCvx9D_yxXsGcg5KJo0RADXCB2BruhHPA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [v2 -CONSOLIDATED PULL 06/14] pulseaudio: make bluetooth support conditional upon DISTRO_FEATURES
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
X-List-Received-Date: Tue, 18 Oct 2011 18:55:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 16, 2011 at 10:17 PM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Paul Eggleton <paul.eggleton@linux.intel.com>
>
> If "bluetooth" is in DISTRO_FEATURES then enable bluetooth and depend on
> bluez4, otherwise disable it.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> =C2=A0meta/recipes-multimedia/pulseaudio/pulseaudio.inc =C2=A0| =C2=A0 =
=C2=A05 +++--
> =C2=A0.../pulseaudio/pulseaudio_0.9.22.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0.../pulseaudio/pulseaudio_0.9.23.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A03 files changed, 5 insertions(+), 4 deletions(-)

It's not caused by this patch.. but if you're looking into pulseaudio,
can you also fix this:

Building man pages is using host perl and fails if there isn't
XML/Parser.pm on host:

| perl ./xmltoman default.pa.5.xml > default.pa.5 || rm -f default.pa.5
| Can't locate XML/Parser.pm in @INC (@INC contains: /etc/perl
/usr/lib64/perl5/site_perl/5.12.4/x86_64-linux
/usr/lib64/perl5/site_perl/5.12.4
/usr/lib64/perl5/vendor_perl/5.12.4/x86_64-linux
/usr/lib64/perl5/vendor_perl/5.12.4 /usr/lib
64/perl5/site_perl /usr/lib64/perl5/vendor_perl
/usr/lib64/perl5/5.12.4/x86_64-linux /usr/lib64/perl5/5.12.4
/usr/local/lib/site_perl .) at ./xmltoman line 21.
| BEGIN failed--compilation aborted at ./xmltoman line 21.
| test -z "/usr/share/man/man1" || /bin/mkdir -p
"/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/pulseaudio-0.9.23-r=
5/image/usr/share/man/man1"
|  /usr/bin/install -c -m 644 ./pulseaudio.1 ./esdcompat.1
./pax11publish.1 ./paplay.1 ./pacat.1 ./pacmd.1 ./pactl.1
./pasuspender.1 ./padsp.1 ./pabrowse.1
'/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/pulseaudio-0.9.23-r=
5/image/usr/share/man/man1'
| /usr/bin/install: cannot stat `./pulseaudio.1': No such file or directory
| /usr/bin/install: cannot stat `./esdcompat.1': No such file or directory
| /usr/bin/install: cannot stat `./pax11publish.1': No such file or directo=
ry
| /usr/bin/install: cannot stat `./paplay.1': No such file or directory
| /usr/bin/install: cannot stat `./pacat.1': No such file or directory
| /usr/bin/install: cannot stat `./pacmd.1': No such file or directory
| /usr/bin/install: cannot stat `./pactl.1': No such file or directory
| /usr/bin/install: cannot stat `./pasuspender.1': No such file or director=
y
| /usr/bin/install: cannot stat `./padsp.1': No such file or directory
| /usr/bin/install: cannot stat `./pabrowse.1': No such file or directory
| make[3]: *** [install-man1] Error 1
| make[3]: Leaving directory
`/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/pulseaudio-0.9.23-r=
5/pulseaudio-0.9.23/man'

inherit perlnative works for me as work around as it puts perl
perl-native in PATH before host perl and XML/Parser.pm is installed in
native sysroot, but maybe you'll find cleaner solution (maybe patching
Makefile to use env perl will be enough).

Regards,


