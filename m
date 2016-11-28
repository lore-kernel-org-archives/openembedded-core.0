Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 971FF600E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 10:46:53 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP; 28 Nov 2016 02:46:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,563,1473145200"; d="scan'208";a="36357821"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 02:46:54 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 65A0C6A4080;
	Mon, 28 Nov 2016 02:46:10 -0800 (PST)
Date: Mon, 28 Nov 2016 12:46:24 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <20161128104624.GA15660@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
	<CAD4b0_KP1V77ny5yP+WVJMSVMojVKFQPa-Gq0-4-cne2e19dDQ@mail.gmail.com>
	<2d3560fa-adce-8c5d-10c1-289d65b28da1@mender.io>
	<20161125163332.GB4830@linux.intel.com>
	<c74d1583-9f57-65d7-1631-36b29fb17165@mender.io>
MIME-Version: 1.0
In-Reply-To: <c74d1583-9f57-65d7-1631-36b29fb17165@mender.io>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Mon, 28 Nov 2016 10:46:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Nov 28, 2016 at 08:07:05AM +0100, Kristian Amlie wrote:
> On 25/11/16 17:33, Ed Bartosh wrote:
> > On Fri, Nov 25, 2016 at 01:35:53PM +0100, Kristian Amlie wrote:
> >> On 25/11/16 13:28, Maciej Borzęcki wrote:
> >>> On Fri, Nov 25, 2016 at 11:15 AM, Kristian Amlie
> >>>> +                # Disallow '..', because doing so could be quite disastrous
> >>>> +                # (we will delete the directory).
> >>>> +                remaining = path
> >>>> +                while True:
> >>>> +                    (head, tail) = os.path.split(remaining)
> >>>> +                    if tail == '..':
> >>>> +                        msger.error("'..' not allowed: --exclude-path=%s" % orig_path)
> >>>> +                    elif head == "":
> >>>> +                        break
> >>>> +                    remaining = head
> >>>
> >>> Why not do this instead?
> >>>
> >>>     if '..' in path:
> >>>         msger.error("'..' not allowed: --exclude-path=%s" % orig_path)
> >>>
> > would "'/..' in path" or something similar work?
> 
> '/..my-file' is a valid file name, so no, it wouldn't work. I realize
> that this would be uncommon, and it makes the check more complex, so I'm
> ok with making it simpler if you want me to, but we have to trade
> simplicity for correctness in that case.
>
OK, makes sense.

Would something like this work for you?

> mkdir -p /tmp/rootfs/bla/bla/bla/bla
> python -c "import os;print os.path.realpath('/tmp/rootfs/bla/../bla/../bla/../bla/../').startswith('/tmp/rootfs/')"
False
> python -c "import os;print os.path.realpath('/tmp/rootfs/bla/../bla/../bla/bla/../').startswith('/tmp/rootfs/')"
True

--
Regards,
Ed

