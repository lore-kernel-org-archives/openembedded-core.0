Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QqnCO-0008RJ-Gj for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 16:22:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p79EHuBT014203
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 15:17:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13359-10 for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2011 15:17:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p79EHoJZ014197
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 15:17:50 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <C10D3FB0CD45994C8A51FEC1227CE22F2F9115B69C@shsmsx502.ccr.corp.intel.com>
References: <1312558875.14274.112.camel@rex>
	<C10D3FB0CD45994C8A51FEC1227CE22F2F9115B69C@shsmsx502.ccr.corp.intel.com>
Date: Tue, 09 Aug 2011 15:17:18 +0100
Message-ID: <1312899438.14274.302.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: base.bbclass: Ensure PREFERRED_PROVIDER and PREFERRED_VERSION values are set for multilibs
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
X-List-Received-Date: Tue, 09 Aug 2011 14:22:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-08 at 16:57 +0800, Lu, Lianhao wrote:
> Richard Purdie wrote on 2011-08-05:
> > When running multilib builds its not intuitive for the specificed
> > versions/providers to be build in one case and the higher version in the other.
> > This patch mirrors the options unless they're already set.
> > 
> > There shouldn't be any effect if the MULTILIBS variable isn't set.
> > 
> > [YOCTO #1339]
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org> ---
> > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass index
> > ff960cd..4aee847 100644 --- a/meta/classes/base.bbclass +++
> > b/meta/classes/base.bbclass @@ -139,6 +139,46 @@ def pkgarch_mapping(d):
> >          if d.getVar("TUNE_PKGARCH", True) == "armv7a-vfp-neon":
> >              d.setVar("TUNE_PKGARCH", "armv7a")
> > +def preferred_ml_updates(d):
> > +    # If any PREFERRED_PROVIDER or PREFERRED_VERSIONS are set,
> > +    # we need to mirror these variables in the multilib case
> > +    multilibs = d.getVar('MULTILIBS', True) or ""
> > +    if not multilibs:
> > +        return
> > +
> > +    prefixes = []
> > +    for ext in multilibs.split():
> > +        eext = ext.split(':')
> > +        if len(eext) > 1 and eext[0] == 'multilib':
> > +            prefixes.append(eext[1])
> > +
> > +    versions = []
> > +    providers = []
> > +    for v in d.keys():
> > +        if v.startswith("PREFERRED_VERSION_"):
> > +            versions.append(v)
> > +        if v.startswith("PREFERRED_PROVIDER_"):
> > +            providers.append(v)
> > +
> > +    for v in versions:
> > +        val = d.getVar(v, False)
> > +        pkg = v.replace("PREFERRED_VERSION_", "")
> > +        for p in prefixes:
> > +            newname = "PREFERRED_VERSION_" + p + "-" + pkg
> > +            if not d.getVar(newname, False):
> > +                d.setVar(newname, val)
> > +
> > +    for prov in providers:
> > +        val = d.getVar(prov, False)
> > +        pkg = prov.replace("PREFERRED_PROVIDER_", "")
> > +        virt = ""
> > +        if pkg.startswith("virtual/"):
> > +             pkg = pkg.replace("virtual/", "")
> > +             virt = "virtual/"
> > +        for p in prefixes:
> > +            newname = "PREFERRED_PROVIDER_" + virt + p + "-" + pkg
> > +            if not d.getVar(newname, False):
> > +                d.setVar(newname, p + "-" + val)
> 
> How about the native and nativesdk packages? I think they should not be prefixed.

Agreed. I've merged this with a tweak to stop the preferred
version/provider code taking effect for native/nativesdk packages.

Cheers,

Richard



