Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA256FFD8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 18:13:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 05 May 2016 11:13:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,583,1455004800"; d="scan'208";a="799717094"
Received: from cwchuah-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.137.193])
	by orsmga003.jf.intel.com with ESMTP; 05 May 2016 11:13:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>,
	Brendan Le Foll <brendan.le.foll@intel.com>
Date: Fri, 06 May 2016 06:13:50 +1200
Message-ID: <4689592.jhB3FmLTaB@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.8-300.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <CAAPZna3uDZab3jtmQYkiR+DR4k5UN_OYhJHcod0G02rdsmtTUQ@mail.gmail.com>
References: <CAAPZna1xLfbyYUKa+qcLfeGCv=mqg7JwWtirfAbqfM+TCu5m7g@mail.gmail.com>
	<20160505105743.GA22250@jupiter.localdomain>
	<CAAPZna3uDZab3jtmQYkiR+DR4k5UN_OYhJHcod0G02rdsmtTUQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: npm class usage
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
X-List-Received-Date: Thu, 05 May 2016 18:14:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Right, this is the problem Brendan was describing - I believe I sent a patch 
to fix this already:

http://patchwork.openembedded.org/patch/121039/

Cheers,
Paul

On Thu, 05 May 2016 09:51:53 Fabio Berton wrote:
> Hi Paul,
> 
> When running:
> recipetool create "npm://registry.npmjs.org;name=grunt-cli;version=1.1.0"
> 
> I get this error:
> 
> NOTE: Unpacking abbrev-1.0.7.tgz to
> /tmp/recipetool-tXXZDi/npmpkg/node_modules/nopt/node_modules/abbrev/
> Traceback (most recent call last):
>   File "sources/openembedded-core/scripts/recipetool", line 116, in <module>
> ret = main()
>   File "sources/openembedded-core/scripts/recipetool", line 107, in main
>     ret = args.func(args)
>   File "sources/openembedded-core/scripts/lib/recipetool/create.py", line
> 561, in create_recipe
>     handler.process(srctree_use, classes, lines_before, lines_after,
> handled, extravalues)
>   File "sources/openembedded-core/scripts/lib/recipetool/create_npm.py",
> line 133, in process
>     license = self._handle_license(pdata)
>   File "sources/openembedded-core/scripts/lib/recipetool/create_npm.py",
> line 44, in _handle_license
>     if 'license' in data:
> TypeError: argument of type 'NoneType' is not iterable
> 
> 
> On Thu, May 5, 2016 at 7:57 AM, Brendan Le Foll <brendan.le.foll@intel.com>
> 
> wrote:
> > On Thu, May 05, 2016 at 07:10:43PM +1200, Paul Eggleton wrote:
> > > Note also that devtool add / recipetool create are capable of creating
> > 
> > pretty
> > 
> > > complete recipes for npm packages where licenses are also correctly set
> > 
> > per
> > 
> > > package (so you get them in the image manifest). I'd strongly recommend
> > 
> > using
> > 
> > > it for this; if you have any issues please let me know.
> > 
> > So actually it errors in this case because of a test package in the
> > resolve module (this shows the issue quicker/easier) see:
> > $ recipetool create "npm://registry.npmjs.org;name=resolve;version=1.1.7"
> > 
> > There's a node_modules dir inside test/ it gets taken as if npm had
> > resolved/download a dep when in fact it hasn't. Since node packages
> > can and do ship their own deps with them sometimes, I think the only
> > fix would be in npm_split_package_dirs to walk 1 level of the ${PN}
> > dir only so that:
> > 
> > ${PN}/node_modules -> taken
> > ${PN}/tests/node_modules -> ignored
> > ${PN}/node_modules/${PN}/node_modules -> taken
> > 
> > Cheers,
> > Brendan

-- 

Paul Eggleton
Intel Open Source Technology Centre

