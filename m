Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1StbOR-0003hR-PH
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 11:27:03 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Jul 2012 02:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="126185513"
Received: from unknown (HELO helios.localnet) ([10.252.121.60])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Jul 2012 02:15:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 24 Jul 2012 10:15:32 +0100
Message-ID: <1610928.T7hSJDQ7P6@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1207240455440.18822@oneiric>
References: <alpine.DEB.2.02.1207240455440.18822@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: more pedantry: inconsistent presentation of how to introduce layers
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
X-List-Received-Date: Tue, 24 Jul 2012 09:27:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 24 July 2012 05:04:25 Robert P. J. Day wrote:
>   i asked about this not that long ago but i'm still a bit puzzled --
> what's the best practice for adding new layers in terms of how
> bblayers.conf and the various layer.conf files are defined?
> 
>   the default layer.conf for oe-core contains:
> 
> BBPATH .= ":${LAYERDIR}"
> ...
> BBFILE_PRIORITY_normal = "5"
> 
> so, clearly, the oe-core layer is being *appended* to whatever is in
> BBPATH.  ok, let's go with that.

FWIW, this was a relatively recent change.

>   on the other hand, that same file for the meta-yocto layer contains:
> 
> BBPATH := "${LAYERDIR}:${BBPATH}"
> ...
> BBFILE_PRIORITY_yocto = "5"
> 
> so it's being *prepended*.  is that deliberate? 

Not sure, but being kind of like a distro layer it's not unreasonable to 
expect that classes and conf files in it will take precedence. That said in 
most cases we probably ought to be consistent and stick to appending to 
BBPATH.

> the end result is that my BBPATH is:
> 
> /home/rpjday/yocto/git/meta-yocto:/home/rpjday/yocto/builds/bbc4:/home/rpjda
> y/yocto/git/meta
> 
> which clearly represents:
> 
>  * the yocto layer
>  * my build layer
>  * the oe-core layer
> 
> with both the yocto and oe-core layer having priority 5.  is there no
> chance of confusion here?

As I mentioned before, the priority currently has no bearing on the order of 
BBPATH - that is determined by the order in which the layer conf files are 
parsed and (as you highlight) whether they prepend or append to BBPATH. 
Remember that the BBPATH only affects how class and conf files are found - it 
does not have anything to do with recipes.

>   in addition, the yocto development manual itself, in section 4.1.2
> on layers, stresses the use of:
> 
> BBPATH := "${LAYERDIR}:${BBPATH}"
> 
> but every single meta-openembedded sub-layer uses the *other* form:
> 
> BBPATH .= ":${LAYERDIR}"

Again, only as of quite recently - something we should correct in the manual 
though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


