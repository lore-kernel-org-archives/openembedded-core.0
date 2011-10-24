Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <swaplinker@gmail.com>) id 1RI89T-0000k3-IR
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 02:12:27 +0200
Received: by vcbf1 with SMTP id f1so4789117vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2011 17:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=run6QyMaKuz2EwEGwse4keQ0e2NbDJjEazZ0rrIKY78=;
	b=C8itD4VNl/SMxL9nXr4EMltOocodMxz2wT9MU7vtK7XY5AdgdvxrYFQoi1xkuJ3g58
	yK2gucI7WvzefyyQFYOiWml8weGBzzc7Ez71tYk/gmdY56W7YXvMEL4QUSGzUsQUGn5v
	wyxASajvj1/PbpEP9jKg/TcUcWELidksZuSWk=
Received: by 10.52.177.3 with SMTP id cm3mr20586317vdc.89.1319414791063; Sun,
	23 Oct 2011 17:06:31 -0700 (PDT)
MIME-Version: 1.0
Sender: swaplinker@gmail.com
Received: by 10.52.187.132 with HTTP; Sun, 23 Oct 2011 17:06:11 -0700 (PDT)
In-Reply-To: <20111022115412.GM16703@nekral.nekral.homelinux.net>
References: <20111022115412.GM16703@nekral.nekral.homelinux.net>
From: Julian Pidancet <julian.pidancet@gmail.com>
Date: Mon, 24 Oct 2011 01:06:11 +0100
X-Google-Sender-Auth: OzDIx4Qy7NRlvML7-rIEHKWrmIg
Message-ID: <CAKZ=5EWt4QwLeVSJp5v6xgSOX6C_VRpz3hq_PjfCrAGBWU0DEw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, 
	Scott Garman <scott.a.garman@intel.com>,
	Julian Pidancet <julian.pidancet@gmail.com>, 
	pkg-shadow-devel@lists.alioth.debian.org
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
X-List-Received-Date: Mon, 24 Oct 2011 00:12:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 22, 2011 at 12:54 PM, Nicolas Fran=C3=A7ois
<nicolas.francois@centraliens.net> wrote:
> Hello,
>
> I'm the upstream maintainer of the shadow utilities.
>
> I was informed of the OpenEmbedded's add_root_cmd_options patch and would
> like to integrate it upstream.
>
> First of all, thanks a lot for implementing this feature. I was asked
> multiple times for it or something similar, but never found time to work
> on it.
>
> I did not review it completely yet, but would have a question.
> What is the expected behavior when the utility authenticates the caller?
> =C2=A01] authenticate the caller in the caller's chroot
> =C2=A02] authenticate the caller in the target's chroot
> =C2=A03] both
>
> I currently think that 3] would be the right behavior: the caller needs t=
o
> be authenticated to make sure it is allowed to use the tool, then it
> should be authenticated on the target to make sure the operation is
> allowed.
> ...But this is much more complex.
>
> If this is fine for you, I would prefer to disable this feature when the
> utility is setuid and not executed by root.
>
> Best Regards,

Hi Nicolas,

I'm affraid this patch does not do what you think it does. The --root
option does not apply to login, but only to the various administrative
tools that comes with it (gpasswd, groupadd, groupdel, groupmod,
grpconv, grpunconv, passwd, pwconv, pwunconv, useradd, userdel).

It allows OE to manipulate passwd and group files that are located in
a sysroot by chrooting into it, because all these programs have their
path to /etc/passwd and friends hardcoded.

This way, when OE builds a package which needs a special user to be
present at run-time, it can create the user off-line at build-time
instead of beeing required to create post-install scripts which does
the same job but has to be executed at run-time.

--=20
Julian


