Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QoyIN-0000uu-GU
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 15:49:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Aug 2011 06:44:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,316,1309762800"; d="scan'208";a="35105233"
Received: from unknown (HELO [10.255.14.88]) ([10.255.14.88])
	by azsmga001.ch.intel.com with ESMTP; 04 Aug 2011 06:44:42 -0700
Message-ID: <4E3AA24A.7050400@linux.intel.com>
Date: Thu, 04 Aug 2011 06:44:42 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1312265186.git.dexuan.cui@intel.com>	<6def4624e63c8c7cf439dff32cb155dd2bba0ebe.1312265186.git.dexuan.cui@intel.com>	<1312285430.2344.582.camel@rex>
	<4E38C941.30805@linux.intel.com>	<1865303E0DED764181A9D882DEF65FB6B304414CE2@shsmsx502.ccr.corp.intel.com>	<4E395235.9010709@linux.intel.com>	<1865303E0DED764181A9D882DEF65FB6B3044150C6@shsmsx502.ccr.corp.intel.com>	<4E3A3562.1060907@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3046C9A79@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6B3046C9A79@shsmsx502.ccr.corp.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
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
X-List-Received-Date: Thu, 04 Aug 2011 13:49:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 08/04/2011 12:37 AM, Cui, Dexuan wrote:
> Darren Hart wrote on 2011-08-04:
>> As for a patch, I'm on Jury duty all this week and only get to a very
>> small percentage of my tasks. I would appreciate if you would try to
>> put one together using the above source snippet, with the suggested
>> changes from Paul of course. Then just send it to the list with Paul
>> and myself on CC. We'll review and provided additional Acked-by's to
>> confirm we're all happy with the end result.
> I made a patch according to your and Paul's suggestions.
> Please review the patch (I also pasted at the end of this mail):
> http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commit/?h=dcui/bug-671&id=13cd1538bc5be078039be2054f117610e2425951
> Please note I use sed to remove any trailing slash since ${BDIR%/} can only remove one trailing slash and this can cause issue, e.g., if $1 is /tmp/build_new//, *on Ubuntu 10.04*, we would get a weird msg "Error: the directory /tmp doesn't exist?"
> 
>> I would suggest you include a patch to first revert the previous patch
>> that was applied to address this issue.
> I'm trying to patch the first patch to save a revert commit... :-)
> 
> Thanks,
> -- Dexuan
> 
> commit 13cd1538bc5be078039be2054f117610e2425951
> Author: Dexuan Cui <dexuan.cui@intel.com>
> Date:   Thu Aug 4 14:53:20 2011 +0800
> 
>     scripts/oe-buildenv-internal: improve the error detecting for $BDIR
> 

Please remember to include a description of the problem and the approach
taken to fix it. This eliminates wasted time trying to decipher it later
or by people unfamiliar with the history. This is important even for
simple changes. In this case something like:

"
The previous fix for a bug in Ubuntu 10.04 readlink, $COMMIT_ID,
notified the user when a trailing slash was used. As there is no
semantic difference, simply remove any trailing slashes and proceed
without nagging the user.
"


>     Thanks a lot to Darren Hart and Paul Eggleton's sugestion!
> 
>     Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> 
> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> index 117b0c5..4a44174 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -28,14 +28,16 @@ if [ "x$BDIR" = "x" ]; then
>      if [ "x$1" = "x" ]; then
>          BDIR="build"
>      else
> -        BDIR=`readlink -f "$1"`
> -        if [ -z "$BDIR"  ]; then
> -            if expr "$1" : '.*/$' >/dev/null; then
> -                echo >&2 "Error: please remove any trailing / in the argument."
> -            else
> -                PARENTDIR=`dirname "$1"`
> -                echo >&2 "Error: the directory $PARENTDIR doesn't exist?"
> -            fi
> +        BDIR="$1"
> +        if [ "$BDIR" = "/" ]; then
> +            echo >&2 "Error: / is not supported as a build directory."
> +            return 1
> +        fi
> +        BDIR=`echo $BDIR | sed -re 's|/+$||'`
> +        BDIR=`readlink -f "$BDIR"`
> +        if [ -z "$BDIR" ]; then
> +            PARENTDIR=`dirname "$1"`
> +            echo >&2 "Error: the directory $PARENTDIR doesn't exist?"

This shouldn't be a question. If the documented behavior of readlink is
to return empty when the path doesn't exist, then assume this to be the
case. Also, it is a good idea to avoid contractions in printed error
messages.

	echo >&2 "Error: the directory $PARENTDIR does not exist."

Otherwise, this looks good to me.

Thanks Dexuan!

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


