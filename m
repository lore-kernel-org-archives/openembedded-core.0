Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QwJKZ-0006qs-2l
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 21:41:43 +0200
Received: by qwh5 with SMTP id 5so1043086qwh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 12:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=6K9ivs5ZCSuTaFeFDdL/5bGYT/dD3kQMm/dbGhgp/OE=;
	b=QjcgXJ/TdA76g6L6XlQrU2zkE85p4ok5Zadq7CJAmMETy2GoZ7gL6TYhpJ6CDSYAvS
	zURTVVa9CksUzt/+vlqMBmjdRXqv4AB/BlvO1IoMuO9NqiHvvGelH7YYNmr7IOe0pCJ5
	cQAxV7u49PwJ62R7Ib1WjpvqFLtD8PWY44Ny0=
Received: by 10.52.93.116 with SMTP id ct20mr5655282vdb.29.1314214616112; Wed,
	24 Aug 2011 12:36:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.108.229 with HTTP; Wed, 24 Aug 2011 12:36:36 -0700 (PDT)
In-Reply-To: <4E554363.5070505@linux.intel.com>
References: <4E554363.5070505@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 24 Aug 2011 12:36:36 -0700
X-Google-Sender-Auth: lDaVK83AVDDm-T6J7GBdgwl1Wl0
Message-ID: <CABcZAN=gZUJt3fe2i7SptpGXz0antgttf86ZEqNawhiyMzttRg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recent Changes to DevShell
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
X-List-Received-Date: Wed, 24 Aug 2011 19:41:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2011 at 11:30 AM, Saul Wold <sgw@linux.intel.com> wrote:
> In your recent changes to devshell, you seem to have broken the default
> behavior of setting =C2=A0TERMCMD / TERMCMDRUN.
>
> When I set them up for scree as follows:
>
> TERMCMD =3D "${SCREEN_TERMCMD}"
> TERMCMDRUN =3D "${SCREEN_TERMCMDRUN}"

First, this isn't how you configure devshell now. This is a big part
of why I reworked it to begin with, so we'd have better usability. See
the commit messages for details, or just set OE_TERMINAL =3D 'screen'
(or 'xterm' or 'noop' or 'auto' or..).

> I get a DEBUG message claing to be starting konsole, not screen, also the=
re
> seems to be a problem with the environment being passed as the arg3 is
> related to env:
>
> ERROR: Logfile of failure stored in:
> /vol/1/sgw/autobuilder/yab/yocto-slave/oe-core/build/build/tmp/work/armv5=
te-poky-linux-gnueabi/lttng-ust-0.15-r2/temp/log.do_devshell.31726
> Log data follows:
> | DEBUG: Attempting to spawn terminal "konsole"
> | ERROR: Error executing a python function in
> /vol/1/sgw/autobuilder/yab/yocto-slave/oe-core/build/meta/recipes-kernel/=
lttng/lttng-ust_0.15.bb:
> | TypeError: execve() arg 3 contains a non-string value
> |
> | ERROR: The stack trace of python calls that resulted in this
> exception/failure was:
> | ERROR: =C2=A0 File "do_devshell", line 6, in <module>

This error is just a general bug in the reworked env var exporting I
did per Richard's request, I have a local patch here and will send it
shortly. Sorry about that. No idea why I didn't hit that when doing
the original testing. If you want a temporary local fix, edit
terminal.bbclass, see the env var export bits, and make it check to
see if the value it retrieves is None before adding it to the env for
the terminal. Expect the patch to the list within the hour.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


