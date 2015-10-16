Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 26AE27710B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 20:27:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Oct 2015 13:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,690,1437462000"; d="scan'208";a="795229300"
Received: from besquive-mobl2.amr.corp.intel.com ([10.219.128.95])
	by orsmga001.jf.intel.com with ESMTP; 16 Oct 2015 13:27:28 -0700
Message-ID: <1445027247.6970.32.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>, 
	openembedded-core@lists.openembedded.org
In-Reply-To: <5620A07B.3050305@topic.nl>
References: <1444930021-4096-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<5620A07B.3050305@topic.nl>
Organization: Intel Corporation
Date: Fri, 16 Oct 2015 15:27:27 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-3.fc22) 
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH] populate SDK: prepare calling of bb.utils for exceptions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: benjamin.esquivel@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Oct 2015 20:27:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hello Mike, comments below:

On Fri, 2015-10-16 at 09:00 +0200, Mike Looijmans wrote:
> ﻿On 15-10-15 19:27, Benjamin Esquivel wrote:
> > bb.utils.remove, bb.utils.movefile and bb.utils.mkdirhier can throw
> > exceptions that need handling and proper error messages.
> > 
> > [YOCTO#8213]
> ...
> > +    def mkdirhier(self, dirpath):
> > +        try:
> > +            bb.utils.mkdirhier(dirpath)
> > +        except OSError as e:
> > +            bb.warn(str(e))
> > +            bb.error("cannot make dir for SDK:
> > {}".format(dirpath))
> ...
> 
> 
> I see two bad things happening here:
> 
> - This will print a message, but continue processing as if nothing
> bad 
> happened, wreaking havoc later on when the caller might expect the
> directory 
> to actually exist and raise exceptions that are much harder to solve.
The exception is not re-raised since this is the appropriate level of
handling and you made me realize that this specific case will only be
reached if the dir is not present and unable to be created so it should
be changed for a bb.fatal instead of bb.error. thanks.
> 
> - It loses the information in the original exception, and since it
> doesn't 
> throw a new exception, the user is now left in the dark as to where
> the 
> problem occured, since there's no stack trace now.
> 
I will throw the trace to the log
> 
> For what I see in this code, it will actually make thing worse by
> hiding 
> errors and obscuring information. You're not "handling" the exception
> here, 
> you're almost "ignoring" them, which isn't quite the same.
> 
not agreed, current code hides errors in return codes which are not
even checked.
> 
> 
> Kind regards,
> 
> Mike Looijmans
> System Expert
> 
> TOPIC Embedded Products
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> Telefax: +31 (0) 499 33 69 70
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
> 
> Please consider the environment before printing this e-mail
> 
> 
> 
> 
> 

