Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 971576FEFA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Nov 2017 21:12:22 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Nov 2017 13:12:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,349,1505804400"; d="scan'208";a="172269098"
Received: from sowmyasr-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.65.177])
	by fmsmga006.fm.intel.com with ESMTP; 05 Nov 2017 13:12:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Mon, 06 Nov 2017 10:12:17 +1300
Message-ID: <2704024.6lLbPlqStP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <378c0f0d22f44ab8aab5131cb1e97305@XBOX02.axis.com>
References: <cover.1509678875.git.paul.eggleton@linux.intel.com>
	<11083c0d85e4443807e5bd526df47bf97e653672.1509678875.git.paul.eggleton@linux.intel.com>
	<378c0f0d22f44ab8aab5131cb1e97305@XBOX02.axis.com>
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] scripts/send-pull-request: allow -C to be used multiple times
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Nov 2017 21:12:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Peter,

On Saturday, 4 November 2017 1:50:21 PM NZDT Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Paul Eggleton
> > Sent: den 3 november 2017 04:16
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 3/3] scripts/send-pull-request: allow -C to
> > be used multiple times
> > 
> > Allow -C to be specified multiple times in order to CC multiple people
> > instead of only taking the last specified value. (You can already use
> > commas to separate multiple recipients, but it makes sense to support
> > this usage as well as commas as separators may not be immediately
> > obvious).
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> >  scripts/send-pull-request | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/send-pull-request b/scripts/send-pull-request
> > index 883deac..baa907d 100755
> > --- a/scripts/send-pull-request
> > +++ b/scripts/send-pull-request
> > @@ -82,7 +82,7 @@ while getopts "acC:hp:t:" OPT; do
> >  		GITSOBCC="--signed-off-by-cc"
> >  		;;
> >  	C)
> > -		EXTRA_CC="$OPTARG"
> > +		EXTRA_CC="$EXTRA_CC,$OPTARG"
> 
> That will introduce a leading comma in $EXTRA_CC, which in turn will 
> lead to a --cc='' option being passed to git send-email. You can avoid 
> that by doing:

Sure, but I did test this and that didn't appear to have any ill effect. I 
agree that it's tidier not to be passing such options to git though, so I'll 
send a v2.


> You can also rewrite the case statement for -t in a similar way:
> 
> 	t)
> 		TO="${TO:+$TO,}$OPTARG"
> 		;;
> 
> Similarly, you can rewrite the code that assigns AUTO_CC in 
> harvest_recipients() as:
> 
> 				AUTO_CC="${AUTO_CC:+$AUTO_CC,}$EMAIL"
> 
> And if you replace:
> 
> unset TO
> 
> near the beginning of the script with:
> 
> TO=$(git config sendmail.to)
> 
> you can remove everything related to AUTO_TO.

I'm not sure I'll get to this, but if I don't perhaps you could?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

