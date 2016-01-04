Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 65BCD6FF72
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:16:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 04 Jan 2016 02:17:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,520,1444719600"; d="scan'208";a="23218779"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 04 Jan 2016 02:17:00 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id B7F886A4002;
	Mon,  4 Jan 2016 03:04:58 -0800 (PST)
Date: Mon, 4 Jan 2016 10:20:30 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160104082030.GA14212@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1451895136-13944-1-git-send-email-ed.bartosh@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1451895136-13944-1-git-send-email-ed.bartosh@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: CABcZANkw_e36yhZgTVcMdVO5fm7=B4UoN-ZxjKOzNOQTvf3-1g@mail.gmail.com
Subject: Re: [PATCH v2] uievent: refactor retry loop
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
X-List-Received-Date: Mon, 04 Jan 2016 10:17:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

wrong list. please ignore.

On Mon, Jan 04, 2016 at 10:12:16AM +0200, Ed Bartosh wrote:
> Replaced 'while' loop with 'for' loop.
> Made the code more compact and hopefully more understandable.
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  bitbake/lib/bb/ui/uievent.py | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/bitbake/lib/bb/ui/uievent.py b/bitbake/lib/bb/ui/uievent.py
> index 19a9301..af239a3 100644
> --- a/bitbake/lib/bb/ui/uievent.py
> +++ b/bitbake/lib/bb/ui/uievent.py
> @@ -45,27 +45,25 @@ class BBUIEventQueue:
>          server.socket.settimeout(1)
>  
>          self.EventHandle = None
> -        count_tries = 0
>  
>          # the event handler registration may fail here due to cooker being in invalid state
>          # this is a transient situation, and we should retry a couple of times before
>          # giving up
>  
> -        while self.EventHandle == None and count_tries < 5:
> +        for count_tries in range(5):
> +
>              self.EventHandle, error = self.BBServer.registerEventHandler(self.host, self.port)
>  
> -            if (self.EventHandle != None):
> +            if self.EventHandle != None:
>                  break
>  
>              errmsg = "Could not register UI event handler. Error: %s, host %s, "
>                       "port %d" % (error, self.host, self.port))
>              bb.warn("%s, retry" % errmsg)
> -            count_tries += 1
> +
>              import time
>              time.sleep(1)
> -
> -
> -        if self.EventHandle == None:
> +        else:
>              raise Exception(errmsg)
>  
>          self.server = server
> -- 
> 2.1.4
> 

-- 
--
Regards,
Ed

