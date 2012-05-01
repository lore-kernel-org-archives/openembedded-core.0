Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SPAlU-0000Du-St for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 12:57:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q41AlMSx013748
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 May 2012 11:47:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13377-02 for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2012 11:47:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q41AlB3o013742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 May 2012 11:47:12 +0100
Message-ID: <1335869234.7415.94.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 01 May 2012 11:47:14 +0100
In-Reply-To: <1a15132d9ff316a53f58764aad35bb09c5fbcf0e.1335815704.git.peter.seebach@windriver.com>
References: <cover.1335815704.git.peter.seebach@windriver.com>
	<1a15132d9ff316a53f58764aad35bb09c5fbcf0e.1335815704.git.peter.seebach@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] sanity.bbclass: Implement initial toolchain sanity checks
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
X-List-Received-Date: Tue, 01 May 2012 10:57:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-30 at 15:33 -0500, Peter Seebach wrote:
> This introduces a sanity check for the toolchain, which verifies
> each tuning (including any multilibs), producing meaningful diagnostics
> for problems, and also provides some higher-level tuning features.
> 
> The TUNEVALID and TUNECONFLICT/TUNECONFLICTS settings were not
> implemented, and there were some loose ends (like not knowing how
> the conflict one was spelled).  Listed one or two missing features
> in TUNEVALID, also (in a previous patch) fixed the references to
> features which didn't exist.
> 
> This patch also provides a whitelisting mechanism (which is completely
> unused) to allow vendors providing prebuilt toolchain components to
> restrict tunings to those based on or compatible with a particular ABI.
> 
> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> ---
>  meta/classes/sanity.bbclass                      |   67 ++++++++++++++++++++++
>  meta/conf/documentation.conf                     |    6 ++
>  meta/conf/machine/include/README                 |    4 +
>  meta/conf/machine/include/arm/arch-armv5-dsp.inc |    1 +
>  meta/conf/machine/include/arm/arch-armv7a.inc    |    2 +-
>  meta/conf/machine/include/ia32/arch-ia32.inc     |    2 +-
>  meta/conf/machine/include/mips/arch-mips.inc     |    6 +-
>  meta/conf/machine/include/tune-c3.inc            |    2 +-
>  8 files changed, 84 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 687ddeb..c77e675 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -11,6 +11,70 @@ def raise_sanity_error(msg):
>      
>      %s""" % msg)
>  
> +# Check a single tune for validity.
> +def check_toolchain_tune(data, tune, multilib):
> +    tune_errors = []
> +    if not tune or tune == "":

"if not tune:"

will suffice here ("" equates to false)

> +        return "No tuning found for %s multilib." % multilib
> +    bb.note("Sanity-checking tuning '%s' (%s) features:" % (tune, multilib))

bb.debug(2, xxx) please

> +    features = data.getVar("TUNE_FEATURES_tune-%s" % tune, True) or ""
> +    if features == '':
> +        return "Tuning '%s' has no defined features, and cannot be used." % tune
> +    features = features.split()

We'd usually have

   features = (data.getVar("TUNE_FEATURES_tune-%s" % tune, True) or "").split()
   if not features:
       return "Tuning '%s' has no defined features, and cannot be used." % tune

> +    valid_tunes = data.getVarFlags('TUNEVALID') or ""
> +    conflicts = data.getVarFlags('TUNECONFLICTS') or ""

Hmm, shouldn't this be "or {}" ?

> +    split_conflicts = {}
> +    for feature in features:
> +        if feature in conflicts:
> +            for conflict in conflicts[feature].split():
> +                if conflict in features:
> +                    tune_errors.append("Feature '%s' conflicts with '%s'." %
> +                        ( feature, conflict ))

whitespace isn't quite right here.

> +        if feature in valid_tunes:
> +            bb.note("  %s: %s" % (feature, valid_tunes[feature]))

We don't print a message every time something happens successfully. The
user would drown if we did so again, this needs to be bb.debug(2, xxx)

> +        else:
> +            tune_errors.append("Feature '%s' is not defined." % feature)
> +    whitelist = data.getVar("TUNEABI_WHITELIST", True) or ''

So what is TUNEABI_WHITELIST?


> +    if whitelist != '':

if whitelist:

> +        override = data.getVar("TUNEABI_OVERRIDE", True) or ''

and what is TUNEABI_OVERRIDE? These should probably get the [doc] tags
you add for other things.

> +        if not override:

Might as well make this:

    whitelist = data.getVar("TUNEABI_WHITELIST", True) or ''
    override = data.getVar("TUNEABI_OVERRIDE", True) or ''
    if whitelist and not override:

> +            tuneabi = data.getVar("TUNEABI_tune-%s" % tune, True) or ""
> +            if tuneabi == "":
> +                tuneabi = tune
> +            if True not in [x in whitelist.split() for x in tuneabi.split()]:
> +                tune_errors.append("Tuning '%s' (%s) cannot be used with any supported tuning/ABI." %
> +                    (tune, tuneabi))

To be honest I'm really tempted to split this tuneabi stuff out into a
different class. I appreciate the OSVs need something but it probably
doesn't make sense with half an implementation sitting in the core like
this, particularly when the code is near impenetrable like the above.
I'm left wondering what TUNEABI is too...

> +    if tune_errors:
> +        return "Tuning '%s' has the following errors:\n" + '\n'.join(tune_errors)
> +
> +def check_toolchain(data):
> +    tune_error_set = []
> +    deftune = data.getVar("DEFAULTTUNE", True)
> +    tune_errors = check_toolchain_tune(data, deftune, 'default')
> +    if tune_errors:
> +        tune_error_set.append(tune_errors)
> +
> +    multilibs = data.getVar("MULTILIBS", True) or ""
> +    if multilibs != "":
> +        for pairs in [x.split(':') for x in multilibs.split()]:
> +            if pairs[0] != 'multilib':
> +                bb.warn("Got an unexpected '%s' in MULTILIBS." % pairs[0])

Shouldn't this get added to the errors list?

> +            else:
> +                if pairs[1] == 'lib':
> +                    tune_error_set.append("The multilib 'lib' was specified, but that causes parse errors.")

Hmm, it does?

What we really want to check here is that each pair[1] value is unique.

> +                else:
> +                    tune = data.getVar("DEFAULTTUNE_virtclass-multilib-%s" % pairs[1], True)
> +                    if tune == deftune:
> +                        bb.warn("Multilib '%s' (%s) is also the default tuning." % (pairs[1], deftune))

Again, I'd just add this to the error list. If someone really wants to
do it, they can disable the checks. This should also happen if tune is
used more than once.

We also want to check BASE_LIB_tune- is unique for each multilib.

> +                    else:
> +                        tune_errors = check_toolchain_tune(data, tune, pairs[1])
> +                    if tune_errors:
> +                        tune_error_set.append(tune_errors)
> +    if tune_error_set:
> +        return "Toolchain tunings invalid:\n" + '\n'.join(tune_error_set)
> +
> +    return ""
> +
>  def check_conf_exists(fn, data):
>      bbpath = []
>      fn = data.expand(fn)
> @@ -327,6 +391,9 @@ def check_sanity(e):
>          messages = messages + pseudo_msg + '\n'
>  
>      check_supported_distro(e)
> +    toolchain_msg = check_toolchain(e.data)
> +    if toolchain_msg != "":
> +        messages = messages + toolchain_msg + '\n'
>  
>      # Check if DISPLAY is set if IMAGETEST is set
>      if not data.getVar( 'DISPLAY', e.data, True ) and data.getVar( 'IMAGETEST', e.data, True ) == 'qemu':
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index f4d6241..99c16fb 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -34,6 +34,12 @@ TARGET_CC_ARCH[doc] = "FIXME"
>  TARGET_FPU[doc] = "Floating point option (mostly for FPU-less systems), can be 'soft' or empty \
>  for hardware floating point instructions."
>  
> +# WARNING:  Because the flags on these have semantic implecations,
> +# they must not actually be defined.
> +#TUNEVALID[doc] = "Descriptions of valid tuning features, stored as flags."
> +#TUNECONFLICTS[doc] = "List of conflicting features for a given feature."
> +TUNEABI[doc] = "A base ABI used by a given tuning, used with prebuilt binaries."

Just set these and skip "doc" in the above tests. Its ugly but I'd
prefer to have them set than unset.

Can you split this patch into two so we can get the bits that were below
in (they look fine) whilst we work on the above.

Cheers,

Richard




