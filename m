Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web09.4476.1604412215377568647
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 06:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J1ZmVNv1;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id gn41so6959663ejc.4
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 06:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KSPLk30KtSK3lvThWXlkHqaa5NYcLdCDku9DaWb0T2M=;
        b=J1ZmVNv1SzLJPpDnRYul2FQszS0Tx3S7C42/nbtpGZMS4m+kwHG2K7INlwGULrr5zd
         w6HMy3n03g6tHsUyoeBUJSUImR9A2LqCAH6zGInOnjY5OGCNK4ghyaz8LvFBe9w9dTEm
         rr/ojJSrg8OzIX/Wx+yquaWvcUqJFt/MPjnxceMk0u5/Ye9xLZ26iK2SjPHEaIMuRFBK
         pVNRsKtLxajNPxePCNkEg7oK8LuC2r65/8KsJWMpO1XRxq9DMDFDmp1ZDii0qYNjRTun
         2xpSGZNfAjUStL1RDhUq93JQOp/DKWFHADDqSG/dAwO7X4j8v+aUjaBX5eU6rS85AkVb
         SeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KSPLk30KtSK3lvThWXlkHqaa5NYcLdCDku9DaWb0T2M=;
        b=V35kgqysaJHntESvaXNNqYuv+1ZSv9dfQptcxPbp+uLBt1f9KRnO3Sw9xO8+ghYSAE
         ypixdF2g/lIBNjwTpZgwEwelxFzx229ylxUjXbVCi8RZgsQu87cpXi/Sy4OWD80cMvyC
         I40P3pAybScWifEg2/sVmVoclV4eeYHbFb3EeVgdkGlIYsz1tMBvdwIktahV6VnGC374
         2qpjkWYxjUw0iO9yOzFjsiXIZ1h8gnUglPOjuy3991gGc4s6tSfDrxjCtF1CjdNk7AYk
         5djobcac1yWDbfdSepV8poUtGkS2kPj6xvRwtv9NGHVPhDoWnEyuWSUlYR+8PmVn6JVb
         6hNg==
X-Gm-Message-State: AOAM5337H2awd/4p2lwWTew+EUVvw0VG5cTNyVvJLxZXW8DeA+AJxkyH
	mhzi6DyE9RQQCnNGHXMwLXKbOgfljzxAW2f451w=
X-Google-Smtp-Source: ABdhPJzrv8xXvi3asHja5rQXJaRCT2fNJal9c5xfEzbez/wttSTD5VLAInFzLnhH8HKjPoA562XrS9Knf4O9wpZfS3g=
X-Received: by 2002:a17:906:8496:: with SMTP id m22mr7447328ejx.298.1604412213804;
 Tue, 03 Nov 2020 06:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20201102222852.38452-1-jason.wessel@windriver.com>
 <CADkTA4PuAX+p96ogha6vRcpz_-3DSOYRTZ4hOZ6id6acVGgAJg@mail.gmail.com> <fe6de5d5-c79a-2432-b9bc-9efbf99265f4@windriver.com>
In-Reply-To: <fe6de5d5-c79a-2432-b9bc-9efbf99265f4@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 3 Nov 2020 09:03:22 -0500
Message-ID: <CADkTA4P3bbWq+ZneQ18hLijEXQ+3+h3Wnd4WaMp4vd0COxef=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] base-files/profile: Add universal resize function
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 3, 2020 at 8:25 AM Jason Wessel <jason.wessel@windriver.com> wrote:
>
>
>
> On 11/3/20 7:15 AM, Bruce Ashfield wrote:
> > On Mon, Nov 2, 2020 at 5:29 PM Jason Wessel <jason.wessel@windriver.com> wrote:
> >>
> >> Using an editor or any kind of command line that wraps beyond the
> >> column width of the session on a serial port is quite problematic
> >> unless you are using an 80x24 session.
> >>
> >> The original /etc/profile tried to use the resize binary if it was
> >> available.  The problem is that you only get the resize binary if
> >> xterm, or busybox is installed.
> >>
> >> This updated /etc/profile will add a resize function available to the
> >> shell when no xterm or busybox resize binary is found.  More care is
> >> taken in this new version to test that terminal is interactive.  The
> >> EDITOR and SHLVL environment variables are checked to prevent resize
> >> from running necessarily.
> >>
> >> The function definitions are not indented intentionally to keep them
> >> to the 80 column width.
> >>
> >> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> >> ---
> >>  .../base-files/base-files/profile             | 48 ++++++++++++++++---
> >>  1 file changed, 41 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
> >> index 9e4283e0c7..cc37e1ba77 100644
> >> --- a/meta/recipes-core/base-files/base-files/profile
> >> +++ b/meta/recipes-core/base-files/base-files/profile
> >> @@ -2,7 +2,6 @@
> >>  # and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
> >>
> >>  PATH="/usr/local/bin:/usr/bin:/bin"
> >> -EDITOR="vi"                    # needed for packages like cron, git-commit
> >>  [ "$TERM" ] || TERM="vt100"    # Basic terminal capab. For screen etc.
> >>
> >>  # Add /sbin & co to $PATH for the root user
> >> @@ -20,13 +19,48 @@ if [ -d /etc/profile.d ]; then
> >>         unset i
> >>  fi
> >>
> >> -# Make sure we are on a serial console (i.e. the device used starts with
> >> -# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which tries do
> >> -# use ssh
> >> -case $(tty 2>/dev/null) in
> >> -       /dev/tty[A-z]*) [ -x @BINDIR@/resize ] && @BINDIR@/resize >/dev/null;;
> >> -esac
> >> +if [ -t 0 -a $# -eq 0 ]; then
> >> +       if [ ! -x @BINDIR@/resize ] ; then
> >> +               if [ -n "$BASH_VERSION" ] ; then
> >> +# Optimized resize funciton for bash
> >> +resize() {
> >> +       local x y
> >> +       IFS='[;' read -t 2 -p $(printf '\e7\e[r\e[999;999H\e[6n\e8') -sd R _ y x _
> >> +       [ -n "$y" ] && \
> >> +       echo -e "COLUMNS=$x;\nLINES=$y;\nexport COLUMNS LINES;" && \
> >> +       stty cols $x rows $y
> >> +}
> >> +               else
> >> +# Portable resize function for ash/bash/dash/ksh
> >> +# with subshell to avoid local variables
> >> +resize() {
> >> +       (o=$(stty -g)
> >> +       stty -echo raw min 0 time 2
> >> +       printf '\0337\033[r\033[999;999H\033[6n\0338'
> >> +       if echo R | read -d R x 2> /dev/null; then
> >> +               IFS='[;R' read -t 2 -d R -r z y x _
> >> +       else
> >> +               IFS='[;R' read -r _ y x _
> >> +       fi
> >> +       stty "$o"
> >> +       [ -z "$y" ] && y=${z##*[}&&x=${y##*;}&&y=${y%%;*}
> >> +       [ -n "$y" ] && \
> >> +       echo "COLUMNS=$x;"&&echo "LINES=$y;"&&echo "export COLUMNS LINES;"&& \
> >> +       stty cols $x rows $y)
> >> +}
> >> +               fi
> >> +       fi
> >> +       # Use the EDITOR not being set as a trigger to call resize
> >> +       # and only do this for /dev/tty[A-z] which are typically
> >> +       # serial ports
> >> +       if [ -z "$EDITOR" -a "$SHLVL" = 1 ] ; then
> >> +               case $(tty 2>/dev/null) in
> >> +                       /dev/tty[A-z]*) resize >/dev/null;;
> >> +               esac
> >> +       fi
> >> +fi
> >>
> >> +EDITOR="vi"                    # needed for packages like cron, git-commit
> >
> > If we set vi as the default, should it be in the RDEPENDS for base-files ?
> >
> > It's a bit of a grey area, since base-files has some special
> > dependency tweaks, and you actually need to trigger some functionality
> > for this to be used .. hence it isn't a hard rdepends.
>
>
> The issue you are pointing out has nothing to do with the problem the patch
> is solving.  As far as I can tell the EDITOR=vi variable has been set
> for the entire existence oe-core.  I just moved it as an extra safety
> check for not continuing to run resize in subshells, which does happen
> today.
>

It just shows up as an addition in the patch at hand, so I was reacting to that.

I didn't look into the history at all, but now that I scan up the
patch, I see that it is just relocated to where it stands now .. so
yah, nothing to see here. Leave it as-is.

Bruce

> If that part is controversial for some reason, I'll revert that part
> and just check SHLVL.
>
> Jason.



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
