Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QJTr8-0003kt-Me
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 19:02:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 May 2011 10:00:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,341,1301900400"; d="scan'208";a="640175558"
Received: from doubt.jf.intel.com (HELO [10.7.199.57]) ([10.7.199.57])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2011 10:00:05 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTin+ix9F=SpnuWgvn3uYyOtQ1SUEOQ@mail.gmail.com>
References: <cover.1304754527.git.raj.khem@gmail.com>
	<0a674cfa8f7de53b7b75c0213a483aad0276986f.1304754527.git.raj.khem@gmail.com>
	<1304785415.8085.6.camel@doubt>
	<BANLkTin+ix9F=SpnuWgvn3uYyOtQ1SUEOQ@mail.gmail.com>
Date: Mon, 09 May 2011 10:00:05 -0700
Message-ID: <1304960405.18625.39.camel@doubt>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 8/8] scripts/send-pull-request: Add CC selectively
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
X-List-Received-Date: Mon, 09 May 2011 17:02:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-05-07 at 10:57 -0700, Khem Raj wrote:
> On Sat, May 7, 2011 at 9:23 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> > On Sat, 2011-05-07 at 00:54 -0700, Khem Raj wrote:

Hi Khem,

> >> Currently a consolidated pull request adds all the participants
> >> to every patch, which in essence is good but might lose focus
> >> of developers who would be interested to know about the patch
> >> that developer contributed to. This patch fixes the script by
> >> extracting the to and cc information from each patch one by one
> >> and add it to patch mail header instead of doing a sweeping one
> >> pass over all patches to collect all email addresses. It should
> >> reduce some email traffic for developers.
> >
> > This behavior was intentional. If you don't want the CC applied to the
> > entire series, you can just use git-send-email as this is its behavior.
> 
> imho git request-pull would have been sufficient for us along with git
> send-mail to post all patches for review

Right. So some context on why I wrote this pair of scripts. There was an
existing practice amongst the poky developers to only send a pull
request and no patches, which effectively reduced the level of code
review by complicating access to the patches for potential reviewers.
IIRC there was an existing script to generate the pull request.

In order to facilitate adoption of a new process which sent the patches
to the list, but still kept the pull model that the community was
accustomed to, I wrote the new scripts. I chose to avoid using
git-send-email as not everyone had git setup to do mail, and I wasn't
aware of "git request-pull" at the time.  I always found not having all
the CCs on the cover letter to be very frustrating, and defeating the
purpose of the auto-cc feature, which is why I manually collect the CC.

After some experience using these scripts, I agree that CC'ing the
entire list on EVERY patch is probably overkill, and can lead to
annoying people. I added a task to the Yocto Janitors list to use
request-pull to generate the cover letter. One to keep the CC list local
to each recipe is also a good idea.

> and get acks and sign-offs then the they all can be collected using
> patchwork or whatever way one likes and
> then git pull-request can be sent
> 
> Right now one one sends a pull requests and publishes the tree for
> pull then feedback is given and one does another round and
> repulishes the tree. So having all patches sent for review using git
> send-mail and then form pull-requests once they are approved
> would be a way to go
> 
> 
> > In particular, it doesn't apply any of the addresses from the patches to
> > the cover letter, which was my primary objection.
> 
> yes once I did this I was sort of thinking that it would be
> appropriate to CC all concerned on cover letter
> Should be doable.
> 
> >
> > If you would like to modify this patch to apply the entire CC list to
> > the cover letter, then I think you'll have addressed both of our
> > concerns and I'll add my Acked-by. As it is, please do not accept this
> > patch. I will nack it for poky and we don't want the two to diverge.
> >
> > Please include the primary author/maintainer of sources/recipes/etc. on
> > CC.
> 
> I guess this should be automated somehow too.

That is a bit more tricky as there can be a long list of people involved
with a particular file. Just doing a "git log FILE" is often enough to
let you know who you're collaborating with, and who you need to CC.

--
Darren

> 
> >
> > Thanks,
> >
> > --
> > Darren Hart
> > Intel Open Source Technology Center
> > Yocto Project - Linux Kernel
> >
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  scripts/send-pull-request |   51 +++++++++++++++++++++++++-------------------
> >>  1 files changed, 29 insertions(+), 22 deletions(-)
> >>
> >> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
> >> index 3af2a9f..36a89f4 100755
> >> --- a/scripts/send-pull-request
> >> +++ b/scripts/send-pull-request
> >> @@ -29,24 +29,38 @@ EOM
> >>  # Collect To and CC addresses from the patch files if they exist
> >>  # $1: Which header to add the recipients to, "TO" or "CC"
> >>  # $2: The regex to match and strip from the line with email addresses
> >> +# $3: The patch which we are preparing to send
> >>  harvest_recipients()
> >>  {
> >>      TO_CC=$1
> >>      REGX=$2
> >> +    PATCH=$3
> >>      export IFS=$',\n'
> >> -    for PATCH in $PDIR/*.patch; do
> >> -        # Grab To addresses
> >> -        for EMAIL in $(sed '/^---$/q' $PATCH | grep -e "$REGX" | sed "s/$REGX//"); do
> >> -            if [ "$TO_CC" == "TO" ] && [ "${TO/$EMAIL/}" == "$TO" ] && [ -n "$EMAIL" ]; then
> >> -                if [ -z "$TO" ]; then TO=$EMAIL; else TO="$TO,$EMAIL"; fi
> >> -            elif [ "$TO_CC" == "CC" ] && [ "${CC/$EMAIL/}" == "$CC" ] && [ -n "$EMAIL" ]; then
> >> -                if [ -z "$CC" ]; then CC=$EMAIL; else CC="$CC,$EMAIL"; fi
> >> -            fi
> >> -        done
> >> +    # Grab To addresses
> >> +    for EMAIL in $(sed '/^---$/q' $PATCH | grep -e "$REGX" | sed "s/$REGX//"); do
> >> +        if [ "$TO_CC" == "TO" ] && [ "${TO/$EMAIL/}" == "$TO" ] && [ -n "$EMAIL" ]; then
> >> +           if [ -z "$TO" ]; then TO=$EMAIL; else TO="$TO,$EMAIL"; fi
> >> +        elif [ "$TO_CC" == "CC" ] && [ "${CC/$EMAIL/}" == "$CC" ] && [ -n "$EMAIL" ]; then
> >> +           if [ -z "$CC" ]; then CC=$EMAIL; else CC="$CC,$EMAIL"; fi
> >> +        fi
> >>      done
> >>      unset IFS
> >>  }
> >>
> >> +# $1: The given patch
> >> +create_recipient_lists()
> >> +{
> >> +    THEPATCH=$1
> >> +    # Harvest emails from the generated patch and populate the TO and CC variables
> >> +    # In addition to To and CC headers/lines, the common Signed-off-by, Tested-by,
> >> +    # etc. (*-by) will be added to CC.
> >> +    if [ $AUTO -eq 1 ]; then
> >> +        harvest_recipients TO "^[Tt][Oo]: *" $THEPATCH
> >> +        harvest_recipients CC "^[Cc][Cc]: *" $THEPATCH
> >> +        harvest_recipients CC "^.*-[Bb][Yy]: *" $THEPATCH
> >> +    fi
> >> +}
> >> +
> >>
> >>  # Parse and verify arguments
> >>  while getopts "af:ghp:t:" OPT; do
> >> @@ -100,15 +114,6 @@ for TOKEN in SUBJECT BLURB; do
> >>  done
> >>
> >>
> >> -# Harvest emails from the generated patches and populate the TO and CC variables
> >> -# In addition to To and CC headers/lines, the common Signed-off-by, Tested-by,
> >> -# etc. (*-by) will be added to CC.
> >> -if [ $AUTO -eq 1 ]; then
> >> -    harvest_recipients TO "^[Tt][Oo]: *"
> >> -    harvest_recipients CC "^[Cc][Cc]: *"
> >> -    harvest_recipients CC "^.*-[Bb][Yy]: *"
> >> -fi
> >> -
> >>  case "$PULL_MTA" in
> >>      git)
> >>          FROM="$(git config sendemail.from)"
> >> @@ -158,11 +163,12 @@ if [ "$cont" == "y" ] || [ "$cont" == "Y" ]; then
> >>      ERROR=0
> >>      case "$PULL_MTA" in
> >>          git)
> >> -            export IFS=$','
> >> -            GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
> >> -            GIT_CC=$(for R in $CC; do echo -n "--cc='$R' "; done)
> >> -            unset IFS
> >>              for PATCH in $PDIR/*patch; do
> >> +                create_recipient_lists $PATCH
> >> +                export IFS=$','
> >> +                GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
> >> +                GIT_CC=$(for R in $CC; do echo -n "--cc='$R' "; done)
> >> +                unset IFS
> >>                  # We harvest the emails manually, so force git not to.
> >>                  eval "git send-email $GIT_TO $GIT_CC --no-chain-reply-to --suppress-cc=all $PATCH"
> >>                  if [ $? -eq 1 ]; then
> >> @@ -172,6 +178,7 @@ if [ "$cont" == "y" ] || [ "$cont" == "Y" ]; then
> >>              ;;
> >>          sendmail)
> >>              for PATCH in $PDIR/*patch; do
> >> +                create_recipient_lists $PATCH
> >>                  # Insert To and CC headers via formail to keep them separate and
> >>                  # appending them to the sendmail command as -- $TO $CC has
> >>                  # proven to be an exercise in futility.
> >
> > --
> > Darren Hart
> > Yocto Linux Kernel
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Darren Hart
Yocto Linux Kernel



