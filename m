Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QqPK0-0005nc-Mf for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 14:52:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78CmEuG002750;
	Mon, 8 Aug 2011 13:48:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02202-04; Mon,  8 Aug 2011 13:48:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78Cm5IR002744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 8 Aug 2011 13:48:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yu Ke <ke.yu@intel.com>
In-Reply-To: <4E3FA84A.5030600@intel.com>
References: <8f296f721bbda3e9df8a80422cd876b9d52712f8.1312540193.git.lianhao.lu@intel.com>
	<a6ffbc82edee2699f74d9d49676ab8f37acd8658.1312540193.git.lianhao.lu@intel.com>
	<4E3FA84A.5030600@intel.com>
Date: Mon, 08 Aug 2011 13:47:36 +0100
Message-ID: <1312807656.14274.178.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] ghostscript: Fixed the incorrect DEPENDS.
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
X-List-Received-Date: Mon, 08 Aug 2011 12:52:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-08 at 17:11 +0800, Yu Ke wrote:
> on 2011-8-5 18:37, Lianhao Lu wrote:
> > [YOCTO #1337]
> > Using ghostscript-native instead of ${PN}-native in DEPENDS to correct
> > the invalid DEPENDS in multilib cases.
> >
> > Signed-off-by: Lianhao Lu<lianhao.lu@intel.com>
> > ---
> >   .../ghostscript/ghostscript_9.02.bb                |    2 +-
> >   1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb b/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
> > index 28c6c9e..2e46734 100644
> > --- a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
> > +++ b/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
> > @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d151214b3131251dfc9d858593acbd24"
> >
> >   PR = "r4"
> >
> > -DEPENDS = "${PN}-native tiff jpeg fontconfig cups"
> > +DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
> >   DEPENDS_virtclass-native = ""
> >
> >   SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.bz2"
> 
> This looks a generic issue to me. i.e. when the dependency ends with 
> "-native", we should make sure it won't has multilib prefix. so the 
> following patch will be more generic. or at least, we should document 
> somewhere that "${PN}-native" dependency is not right.
> 
> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
> index 6e1669f..c73e5f9 100644
> --- a/meta/classes/multilib.bbclass
> +++ b/meta/classes/multilib.bbclass
> @@ -43,7 +43,11 @@ python __anonymous () {
>           newdeps = []
>           for dep in deps:
>               if dep.endswith(("-native", "-native-runtime")):
> -                newdeps.append(dep)
> +                if dep.startswith(variant):
> +                    # remove the leading MLPREFIX
> +                    newdeps.append(dep[len(variant)+1:])
> +                else:
> +                    newdeps.append(dep)
>               else:
>                   newdeps.append(extend_name(dep))
>           d.setVar(varname, " ".join(newdeps))
> 
> comment? if it is Ok, I will submit a patch.

I'm not sure I like this. I think fixing the individual recipes to use
BPN instead of PN might be a better way to handle this.

We could also error upon detecting this situation instead of magically
fixing it up as above...

Cheers,

Richard



