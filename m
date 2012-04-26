Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SNWuI-0007xr-55
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 00:11:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3QM1h6d013109
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 15:01:43 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 26 Apr 2012 15:01:42 -0700
Message-ID: <4F99C5C5.8090901@windriver.com>
Date: Thu, 26 Apr 2012 17:01:41 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120420 Thunderbird/12.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20120425203805.71113201@wrlaptop>
	<20120426160844.2d2a0b9f@wrlaptop>
In-Reply-To: <20120426160844.2d2a0b9f@wrlaptop>
Subject: Re: Toolchain library whitelisting: A first pass (preliminary patch/RFC)
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
X-List-Received-Date: Thu, 26 Apr 2012 22:11:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

In general I like this.. see a few critiques below:

On 4/26/12 4:08 PM, Peter Seebach wrote:
> On Wed, 25 Apr 2012 20:38:05 -0500
> Peter Seebach<peter.seebach@windriver.com>  wrote:
>> This is a followup from some chat in #yocto and elsewhere.
>
> Okay, some more followup.
>
> While testing this, I kept burning myself on perfectly reasonable
> things to get wrong while defining and using multilibs, so I wrote a
> bunch of sanity checks for that.
>
> The intent of this is to validate that tunings (including multilibs)
> are configured in a reasonable way that we would expect to work.  This
> includes:
>
> 1.  Verifying that no multilib's tuning is the same as DEFAULTTUNE.
> 2.  Verifying that no multilib's library name is 'lib', because that
> causes really cryptic error messages parsing recipes.
> 3.  For each tuning, verify:
> 3a.  The tuning has features.
> 3b.  Every feature has a TUNEVALID[x] entry.
> 3c.  If the feature has a TUNECONFLICTS[x] entry, no feature listed in
> it is included in the feature list.
> 3d.  If the value TUNEABI_WHITELIST exists, the tuning's
> TUNEABI_tune-foo value, or the tuning's name if that doesn't exist, is
> in TUNEABI_WHITELIST, or alternatively, TUNEABI_OVERRIDE is defined.
>
> The whitelist feature is optional, and my intent would be not to define
> any TUNEABI_tune values in oe-core, but just to maintain the hooks so
> that people with custom (and often prebuilt-binary) toolchains can use
> it without all of us writing our own.
>
> I am totally aware that my Python is a little rough, and would be happy
> to improve the legibility or idiom.
>
> Separately, I propose also the following fix:
>
>       # Check TARGET_ARCH is set correctly
> -    if data.getVar('TARGE_ARCH', e.data, False) == '${TUNE_ARCH}':
> +    if data.getVar('TARGET_ARCH', e.data, False) == '${TUNE_ARCH}':
>
> Anyway, the patch:
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 687ddeb..b7f93b5 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -11,6 +11,70 @@ def raise_sanity_error(msg):
>
>       %s""" % msg)
>
> +# Check a single tune for validity.
> +def check_toolchain_tune(data, tune, multilib):
> +    tune_errors = []
> +    bb.note("Sanity-checking tuning '%s' (%s) features:" % (tune, multilib))
> +    features = data.getVar("TUNE_FEATURES_tune-%s" % tune, True) or ""
> +    if features == '':
> +        return "Tuning '%s' has no defined features, and cannot be used." % tune
> +    features = features.split(' ')

split does a whitespace based split automatically, I'm used to seeing .split() 
everywhere.  (I won't comment on the other similar split items)

> +    validities = data.getVarFlags('TUNEVALID') or ""

"validities"?  that a new word?  ;)

> +    conflicts = data.getVarFlags('TUNECONFLICTS') or ""
> +    split_conflicts = {}
> +    for feature in features:
> +       if feature in conflicts:
> +	   if feature not in split_conflicts:
> +	       split_conflicts[feature] = conflicts[feature].split(' ')
> +	   for other in features:
> +	       if other in split_conflicts[feature]:
> +		   tune_errors.append("Feature '%s' conflicts with '%s'." %
> +		       ( feature, other ))
> +       if feature in validities:
> +	   bb.note("  %s: %s" % (feature, validities[feature]))
> +       else:
> +	   tune_errors.append("Feature '%s' is not defined." % feature)
> +    whitelist = data.getVar("TUNEABI_WHITELIST", True) or ''
> +    if whitelist != '':
> +	override = data.getVar("TUNEABI_OVERRIDE", True) or ''
> +	if not override:
> +	    tuneabi = data.getVar("TUNEABI", True) or ""
> +	    if tuneabi == "" or tuneabi.startswith('$'):
> +		tuneabi = tune
> +	    if True not in [x in whitelist.split(' ') for x in tuneabi.split(' ')]:
> +		tune_errors.append("Tuning '%s' (%s) cannot be used with any supported tuning/ABI." %
> +		    (tune, tuneabi))
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

Change the above to:
     multilibs = data.getVar("MULTILIBS", True)
     if multilibs:

> +        for pairs in [x.split(':') for x in multilibs.split(' ')]:
> +	    if pairs[0] != 'multilib':
> +	        bb.warn("Got an unexpected '%s' in MULTILIBS." % pairs[0])
> +	    else:
> +		if pairs[1] == 'lib':
> +		    tune_error_set.append("The multilib 'lib' was specified, but that doesn't work. You need lib32 or lib64.")

I'm surprised, why doesn't 'lib' work?  I was under the impression the naming 
was completely arbitrary.

Also we can definitely have more then just lib32 or lib64.  We already often use 
libx32 in testing the x32 layer.

> +		else:
> +		    tune = data.getVar("DEFAULTTUNE_virtclass-multilib-%s" % pairs[1], True)

If the tune isn't defined, then the multilib configuration is invalid.  I 
thought we already had a check for that somewhere else.. but if not.. it 
wouldn't be a bad idea to mention that here for the user.

A simple if not tune:  would do it..

> +		    if tune == deftune:
> +		        tune_error_set.append("Multilib '%s' (%s) is also the default tuning." % (pairs[1], deftune))

I wonder if this is an error or a warning.. I suspect it would be unintentional, 
but I'm not sure it's a failure?

> +		    else:
> +		        tune_errors = check_toolchain_tune(data, tune, pairs[1])
> +		    if tune_errors:
> +		        tune_error_set.append(tune_errors)
> +    if tune_error_set:
> +        return "Toolchain tunings invalid:\n" + '\n'.join(tune_error_set)
> +
> +    return ""
> +
>   def check_conf_exists(fn, data):
>       bbpath = []
>       fn = data.expand(fn)
> @@ -327,6 +391,9 @@ def check_sanity(e):
>           messages = messages + pseudo_msg + '\n'
>
>       check_supported_distro(e)
> +    toolchain_msg = check_toolchain(e.data)
> +    if toolchain_msg != "":
> +        messages = messages + toolchain_msg + '\n'

Your whitespace usage looks different.. perhaps that is just my mailer.

--Mark

>
>       # Check if DISPLAY is set if IMAGETEST is set
>       if not data.getVar( 'DISPLAY', e.data, True ) and data.getVar( 'IMAGETEST', e.data, True ) == 'qemu':



