Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5C2DB7670B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 14:04:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2015 07:04:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,661,1432623600"; d="scan'208";a="624111408"
Received: from menright-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.21.215])
	by orsmga003.jf.intel.com with ESMTP; 12 Aug 2015 07:04:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Wed, 12 Aug 2015 15:04:16 +0100
Message-ID: <10432947.mp7xZ4UyrG@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.3-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAP9ODKqw2QCuWD+NG3uGQONhFQGfc0SQihC4979mCCb5esuNEg@mail.gmail.com>
References: <cover.1438269391.git.liezhi.yang@windriver.com>
	<55CAABC2.50008@windriver.com>
	<CAP9ODKqw2QCuWD+NG3uGQONhFQGfc0SQihC4979mCCb5esuNEg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base.bbclass/blacklist.bbclass: remove doc item when d.getVarFlags()
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
X-List-Received-Date: Wed, 12 Aug 2015 14:04:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 12 August 2015 10:45:29 Otavio Salvador wrote:
> On Tue, Aug 11, 2015 at 11:13 PM, Robert Yang <liezhi.yang@windriver.com> 
wrote:
> > On 08/11/2015 08:45 PM, Otavio Salvador wrote:
> >> On Thu, Jul 30, 2015 at 12:18 PM, Robert Yang <liezhi.yang@windriver.com>
> >> 
> >> wrote:
> >>> The FOO[doc] is set in meta/conf/documentation.conf, we need remove it
> >>> from d.getVarFlags()'s return dict when it causes many loops.
> >>> 
> >>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> 
> >> It seems your commit log is incomplete or so as I couldn't understand
> >> why this is need.
> >> 
> >> Also as Andre says, we ought to not break existing layer without a
> >> very strong reason and if needed, changing documentation.conf instead
> >> of this seems more adequate.
> > 
> > The code in base.bbclass is: (no remove PACKAGECONFIG[doc])
> > 
> >     pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
> >     
> >     if pkgconfigflags:
> >        <foo>
> > 
> > And documentation.conf:
> > PACKAGECONFIG[doc] = "This variable provides a means of enabling or
> > disabling features of a recipe on a per-recipe basis."
> > 
> > This will make "if pkgconfigflags:" always be true and cause many unneeded
> > loops since there is always PACKAGECONFIG[doc].
> > 
> > Remove PACKAGECONFIG[doc] or comment it sounds good to me.
> 
> So documentation.conf needs change.

I'm not sure I'm particularly happy with this. Whilst its actual practical use 
is relatively recent (i.e. Toaster), documentation.conf and the doc varflag 
predate PACKAGECONFIG by quite some time. The fact that one layer has gone and 
used it is unfortunate but not unfixable.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

