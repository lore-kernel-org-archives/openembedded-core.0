Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nicolas.francois@centraliens.net>)
	id 1RJAXS-0007we-Id for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 22:57:30 +0200
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 1D42A2E04F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 22:51:30 +0200 (CEST)
Received: from nekral.nekral.homelinux.net (unknown [82.224.24.210])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 5C834D481B2;
	Wed, 26 Oct 2011 22:51:20 +0200 (CEST)
Received: from fzt by nekral.nekral.homelinux.net with local (Exim 4.74)
	(envelope-from <nicolas.francois@centraliens.net>)
	id 1RJARN-0003At-Bh; Wed, 26 Oct 2011 22:51:13 +0200
Date: Wed, 26 Oct 2011 22:51:13 +0200
From: Nicolas =?iso-8859-1?Q?Fran=E7ois?= <nicolas.francois@centraliens.net>
To: julian.pidancet@gmail.com
Message-ID: <20111026205113.GB25451@nekral.nekral.homelinux.net>
Mail-Followup-To: julian.pidancet@gmail.com,
	openembedded-core@lists.openembedded.org,
	Scott Garman <scott.a.garman@intel.com>,
	pkg-shadow-devel@lists.alioth.debian.org
References: <20111022115412.GM16703@nekral.nekral.homelinux.net>
	<CAKZ=5EWt4QwLeVSJp5v6xgSOX6C_VRpz3hq_PjfCrAGBWU0DEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKZ=5EWt4QwLeVSJp5v6xgSOX6C_VRpz3hq_PjfCrAGBWU0DEw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: pkg-shadow-devel@lists.alioth.debian.org,
	Scott Garman <scott.a.garman@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: --root option in upstream shadow
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
X-List-Received-Date: Wed, 26 Oct 2011 20:57:31 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 24, 2011 at 01:06:11AM +0100, julian.pidancet@gmail.com wrote=
:
> On Sat, Oct 22, 2011 at 12:54 PM, Nicolas Fran=E7ois
> <nicolas.francois@centraliens.net> wrote:
> >
> > What is the expected behavior when the utility authenticates the call=
er?
> > =A01] authenticate the caller in the caller's chroot
> > =A02] authenticate the caller in the target's chroot
> > =A03] both
> >
> > I currently think that 3] would be the right behavior: the caller nee=
ds to
> > be authenticated to make sure it is allowed to use the tool, then it
> > should be authenticated on the target to make sure the operation is
> > allowed.
> > ...But this is much more complex.
> >
> > If this is fine for you, I would prefer to disable this feature when =
the
> > utility is setuid and not executed by root.
> >
>=20
> I'm affraid this patch does not do what you think it does. The --root
> option does not apply to login, but only to the various administrative
> tools that comes with it (gpasswd, groupadd, groupdel, groupmod,
> grpconv, grpunconv, passwd, pwconv, pwunconv, useradd, userdel).

I understand this correctly.

Lets take the passwd use case.
passwd usually authenticates the caller (when UID=3D=3D0, this authentica=
tion
is usually skipped), then asks for the new password, then update the
password databases.
passwd is suid and can be used by non root users to change the caller's
password. What should be the behavior of passwd is such case?
With the current patch, an user with UID 1000 will be allowed to change t=
he
password of the user from the target chroot with the same UID 1000.=20

In the patched tools you indicated, gpasswd is also suid.
And all the others can be suid when configured with
--enable-account-tools-setuid

My proposal is to only support --root for root. For non suid utils,
regular users will be denied chroot anyway, hence: "disable this feature
when the utility is setuid and not executed by root."

In your use case (for packaging), I assume the tools are always called by
root. Then this restriction should not affect you.

> It allows OE to manipulate passwd and group files that are located in
> a sysroot by chrooting into it, because all these programs have their
> path to /etc/passwd and friends hardcoded.

The advantage is not only that the destination user/group files are
changed, but also that they are changed considering the configuration of
the target system (e.g. PAM, /etc/login.defs, ...)

Best Regards,
--=20
Nekral


