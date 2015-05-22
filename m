Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3A89C609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 13:32:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 22 May 2015 06:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,475,1427785200"; d="scan'208";a="698888617"
Received: from cestaunt-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.15.40])
	by orsmga001.jf.intel.com with ESMTP; 22 May 2015 06:32:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Thomas Perrot <thomas.perrot@tupi.fr>
Date: Fri, 22 May 2015 14:32:45 +0100
Message-ID: <68207409.2TGPmlRSeZ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <555F2EF9.10506@mlbassoc.com>
References: <1432289348-5624-1-git-send-email-thomas.perrot@tupi.fr>
	<2176018.53hRFMtF2v@peggleto-mobl.ger.corp.intel.com>
	<555F2EF9.10506@mlbassoc.com>
MIME-Version: 1.0
Cc: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd-serialgetty: Remove SERIAL_CONSOLE definition, because it depends of machine definition. Set it, here, can be make the value is not good.
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
X-List-Received-Date: Fri, 22 May 2015 13:32:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 22 May 2015 07:28:25 Gary Thomas wrote:
> On 2015-05-22 07:12, Paul Eggleton wrote:
> > Hi Thomas,
> > 
> > On Friday 22 May 2015 15:02:02 Thomas PERROT wrote:
> >> If the machine layer definition is applied after meta-systemd also
> >> with a default setting operator instead an affectation, this var will
> >> be bad initialized. It's the case with meta-raspberrypi layer.
> > 
> > 1) Where in meta-systemd is SERIAL_CONSOLE being set? I can't find it
> > anywhere in there.
> 
> It's actually in OE-core:
>    meta/recipes-core/systemd/systemd-serialgetty.bb
> > 
> > 3) When the machine configuration sets the value, that happens pretty
> > early on in the parsing process so there's no way that this value is
> > going to take precedence over the machine value. Have you looked at the
> > output of bitbake -e systemd-serialgetty | less to see how the value of
> > this variable is being set?

Right, then my comment stands. Setting the value with ?= in systemd-
serialgetty.bb is not going to override a value set by the machine 
configuration, whether the machine configuration uses ?= or = - the machine 
configuration is parsed first, and ?= means "set if not already set" - which it 
will be by the time the recipe is parsed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

