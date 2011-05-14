Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QL2XO-0003mB-51
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 02:16:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 May 2011 17:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,367,1301900400"; d="scan'208";a="747053972"
Received: from scimitar.jf.intel.com (HELO [10.7.199.58]) ([10.7.199.58])
	by orsmga001.jf.intel.com with ESMTP; 13 May 2011 17:14:03 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2011 17:14:02 -0700
In-Reply-To: <BANLkTiku_-qK483An7J9RNEs2xoEcPcHmA@mail.gmail.com>
References: <cover.1305329659.git.dvhart@linux.intel.com>
	<502617737ac9c95e9bd4a172cb8e70a24be1b14b.1305329659.git.dvhart@linux.intel.com>
	<BANLkTiku_-qK483An7J9RNEs2xoEcPcHmA@mail.gmail.com>
X-Mailer: Evolution 3.0.1 (3.0.1-1.fc15) 
Message-ID: <1305332042.2023.61.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [RFC PATCH 09/10] send-pull-request: don't send all patches to everyone even with -a
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
X-List-Received-Date: Sat, 14 May 2011 00:16:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-13 at 16:44 -0700, Khem Raj wrote:
> On Fri, May 13, 2011 at 4:38 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> > Rather than sending every patch to every recipient of the entire series when
> > -a is used, only send the cover letter to everyone and use git's
> > --signed-off-by-cc feature to generate an auto cc list for the individual
> > patches.
> >
> > Using git to harvest the Cc list means only collecting Signed-off-by and Cc
> > lines, rather than the more generic *-by lines previously. This is a fair
> > trade-off for significantly reduced complexity. If users want to add Acked-by
> > and Tested-by lines and want to use the -a feature, they should include those
> > recipients as Cc lines as well.
> >
> > Now that we rely on git for auto-cc for the individual patches,
> > make sure the user is prompted before sending each patch by forcing
> > --confirm=always.
> 
> it can be tedious for large patchsets say 30-40 patches. and moreover
> if something is wrong in middle of sending series of patches say a CC
> list is wrong then what to do as some of the patches would have
> already been sent.  So I would suggest a dry pass
> where it will show you the email headers and CC list so sender can be
> assured that all is well
> and then he can send them all at once.

Agree with Khem here, unless you're trying to force people to send
smaller patch series?

> 
> >
> > Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> > Cc: Khem Raj <raj.khem@gmail.com>
> > Cc: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> >  scripts/send-pull-request |   60 +++++++++++++++++++++++++++------------------
> >  1 files changed, 36 insertions(+), 24 deletions(-)
> >
> > diff --git a/scripts/send-pull-request b/scripts/send-pull-request
> > index b294d35..f94596f 100755
> > --- a/scripts/send-pull-request
> > +++ b/scripts/send-pull-request
> > @@ -4,33 +4,34 @@ AUTO=0
> >  # Prevent environment leakage to these vars.
> >  unset TO
> >  unset CC
> > +unset AUTO_CC
> >
> >  usage()
> >  {
> >  cat <<EOM
> >  Usage: $(basename $0) [-h] [-a] [[-t email]...] -p pull-dir
> >   -t email     Explicitly add email to the recipients
> > -  -a           Automatically harvest recipients from "*-by: email" lines
> > -               in the patches in the pull-dir
> > +  -a           Automatically harvest recipients from Cc and Signed-off-by lines
> > +               in the patches in the pull-dir. These will be used on a per
> > +               patch basis. The cover-letter will be sent to all addresses.
> >   -p pull-dir  Directory containing summary and patch files
> >  EOM
> >  }
> >
> > -# Collect To and CC addresses from the patch files if they exist
> > -# $1: Which header to add the recipients to, "TO" or "CC"
> > -# $2: The regex to match and strip from the line with email addresses
> > +# Collect addresses from a patch into AUTO_CC
> > +# $1: a patch file
> >  harvest_recipients()
> >  {
> > -       TO_CC=$1
> > -       REGX=$2
> > +       PATCH=$1
> >        export IFS=$',\n'
> > -       for PATCH in $PDIR/*.patch; do
> > -               # Grab To addresses
> > +       for REGX in "^[Cc][Cc]: *" "^[Ss]igned-[Oo]ff-[Bb]y: *"; do
> >                for EMAIL in $(sed '/^---$/q' $PATCH | grep -e "$REGX" | sed "s/$REGX//"); do
> > -                       if [ "$TO_CC" == "TO" ] && [ "${TO/$EMAIL/}" == "$TO" ] && [ -n "$EMAIL" ]; then
> > -                               if [ -z "$TO" ]; then TO=$EMAIL; else TO="$TO,$EMAIL"; fi
> > -                       elif [ "$TO_CC" == "CC" ] && [ "${CC/$EMAIL/}" == "$CC" ] && [ -n "$EMAIL" ]; then
> > -                               if [ -z "$CC" ]; then CC=$EMAIL; else CC="$CC,$EMAIL"; fi
> > +                       if [ "${AUTO_CC/$EMAIL/}" == "$AUTO_CC" ] && [ -n "$EMAIL" ]; then
> > +                               if [ -z "$AUTO_CC" ]; then
> > +                                       AUTO_CC=$EMAIL;
> > +                               else
> > +                                       AUTO_CC="$AUTO_CC,$EMAIL";
> > +                               fi
> >                        fi
> >                done
> >        done
> > @@ -84,13 +85,11 @@ for TOKEN in SUBJECT BLURB; do
> >  done
> >
> >
> > -# Harvest emails from the generated patches and populate the TO and CC variables
> > -# In addition to To and CC headers/lines, the common Signed-off-by, Tested-by,
> > -# etc. (*-by) will be added to CC.
> > +# Harvest emails from the generated patches and populate AUTO_CC.
> >  if [ $AUTO -eq 1 ]; then
> > -       harvest_recipients TO "^[Tt][Oo]: *"
> > -       harvest_recipients CC "^[Cc][Cc]: *"
> > -       harvest_recipients CC "^[A-Z][A-Za-z-]*-[Bb][Yy]: *"
> > +       for PATCH in $PDIR/*.patch; do
> > +               harvest_recipients $PATCH
> > +       done
> >  fi
> >
> >  AUTO_TO="$(git config sendemail.to)"
> > @@ -102,7 +101,7 @@ if [ -n "$AUTO_TO" ]; then
> >        fi
> >  fi
> >
> > -if [ -z "$TO" ] && [ -z "$CC" ]; then
> > +if [ -z "$TO" ] && [ -z "$AUTO_CC" ]; then
> >        echo "ERROR: you have not specified any recipients."
> >        usage
> >        exit 1
> > @@ -114,7 +113,8 @@ cat <<EOM
> >  The following patches:
> >  $(for PATCH in $PDIR/*.patch; do echo "    $PATCH"; done)
> >
> > -will now be sent via the git send-email command.
> > +will now be sent via the git send-email command. Git will prompt you before
> > +sending any email.
> >
> >  EOM
> >  echo "Continue? [y/N] "
> > @@ -124,11 +124,23 @@ if [ "$cont" == "y" ] || [ "$cont" == "Y" ]; then
> >        ERROR=0
> >        export IFS=$','
> >        GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
> > -       GIT_CC=$(for R in $CC; do echo -n "--cc='$R' "; done)
> > +       GIT_CC=$(for R in $AUTO_CC; do echo -n "--cc='$R' "; done)
> >        unset IFS
> >        for PATCH in $PDIR/*patch; do
> > -               # We harvest the emails manually, so force git not to.
> > -               eval "git send-email $GIT_TO $GIT_CC --no-chain-reply-to --suppress-cc=all $PATCH"
> > +               if [ $AUTO -eq 1 ]; then
> > +                       if [ $PATCH == "$CL" ]; then
> > +                               # Send the cover letter to every recipient, both
> > +                               # specified as well as harvested.
> > +                               eval "git send-email $GIT_TO $GIT_CC --confirm=always --no-chain-reply-to --suppress-cc=all $PATCH"
> > +                       else
> > +                               # Send the patch to the specified recipients and
> > +                               # those git finds in this specific patch.
> > +                               eval "git send-email $GIT_TO --confirm=always --no-chain-reply-to --signed-off-by-cc $PATCH"
> > +                       fi
> > +               else
> > +                       # Only send to the explicitly specified recipients
> > +                       eval "git send-email $GIT_TO --confirm=always --no-chain-reply-to --suppress-cc=all $PATCH"
> > +               fi
> >                if [ $? -eq 1 ]; then
> >                        ERROR=1
> >                fi
> > --
> > 1.7.1
> >
> >
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



