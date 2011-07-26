Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QlqYj-0001IG-NO
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 00:57:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2011 15:41:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,272,1309762800"; d="scan'208";a="31799541"
Received: from unknown (HELO [10.255.14.148]) ([10.255.14.148])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2011 15:41:32 -0700
Message-ID: <4E2F429E.5030607@linux.intel.com>
Date: Tue, 26 Jul 2011 15:41:34 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4E2F384F.6060907@ll.mit.edu>
In-Reply-To: <4E2F384F.6060907@ll.mit.edu>
Subject: Re: [PATCH] bb-matrix.sh: check for the existence of time
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
X-List-Received-Date: Tue, 26 Jul 2011 22:57:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Hi Jeff,

Thanks for the patch. A couple points of feedback below:

On 07/26/2011 02:57 PM, Jeff Mitchell wrote:
> What an existential subject. The patch is quite self-explanatory.

Well, there is almost always a need for commit log beyond just the
subject. The only exception might be "whitespace fixes only" or
"spelling fixes only".

Something like:

"If time is missing, bb-matrix will fail to run and report misleading
 errors about tmp/buildstats not existing. Check and abort with an
 appropriate error message."

Also, while it is tempting to squeeze in typo fixes and such with a
functional patch, unless they are in the code you are changing anyway,
they should be sent as separate patches. If it were necessary to revert
the functional patch, we'd rather not have to also lose the typo or
whitespace cleanup, for example.

> -# This script runs BB_CMD (typically building core-image-sato) for all
> +# This script runs BB_CMD (typically building core-image-minimal) for all
>  # combincations of BB_RANGE and PM_RANGE values. It saves off all the console

           ^ heh, another typo! bad dvhart.

>  # logs, the buildstats directories, and creates a bb-pm-runtime.dat file which
>  # can be used to postprocess the results with a plotting tool, spreadsheet, etc.
> @@ -32,6 +32,11 @@
>  # Darren Hart <dvhart@linux.intel.com>
>  #
>  
> +if [ ! -f /usr/bin/time ]; then

This should probably be a bit more generic:

TIME_CMD=$(which time)
if [ -z "$TIME_CMD" ]; then
	echo 'The "time" binary was not found in your path, \
              please install it.'
	exit 1
fi

Then replace /usr/bin/time below with TIME_CMD.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


