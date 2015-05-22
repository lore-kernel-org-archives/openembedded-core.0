Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 675F26AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 15:00:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 22 May 2015 08:00:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,475,1427785200"; d="scan'208";a="698922762"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.3.49])
	([10.252.3.49])
	by orsmga001.jf.intel.com with ESMTP; 22 May 2015 08:00:49 -0700
Message-ID: <1432306848.2882.16.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 22 May 2015 18:00:48 +0300
In-Reply-To: <2968009.Jcp0e3iZx0@peggleto-mobl.ger.corp.intel.com>
References: <cover.1432303757.git.tanu.kaskinen@linux.intel.com>
	<bbc0c5d2ae38edbfb1c0a5e0542a8f4ff99a256b.1432303757.git.tanu.kaskinen@linux.intel.com>
	<2968009.Jcp0e3iZx0@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/5] alsa-plugins: initial recipe
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
X-List-Received-Date: Fri, 22 May 2015 15:00:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-05-22 at 15:44 +0100, Paul Eggleton wrote:
> On Friday 22 May 2015 17:15:45 Tanu Kaskinen wrote:
> > +# meta/conf/bitbake.conf sets ALLOW_EMPTY_${PN}-dev = "1", but we don't
> > want an 
> > +# empty alsa-plugins-dev package. The empty package would depend
> > on +# alsa-plugins, which is a package that doesn't exist.
> > +ALLOW_EMPTY_${PN}-dev = "0"
> 
> Wouldn't it make sense to actually have a pulseaudio-plugins package which 
> depends on all of the actual plugin packages? This way you would also avoid 
> the other issue we've seen in similar recipes where users try to add the main 
> package to their image, which the build system thinks will be produced, and 
> then get the "package not found in base feeds" error at do_rootfs time.

That sounds like a reasonable approach too. To avoid maintaining a list
of all modules in the recipe, it would be good to script the
dependencies:

RDEPENDS_${PN} = "${@get_built_plugin_packages()}"

I'm not experienced with bitbake scripting, so any pointers for
implementing get_built_plugin_packages() would be helpful.

-- 
Tanu


