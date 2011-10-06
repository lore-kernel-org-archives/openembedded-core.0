Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RBv5j-0000FR-Ql
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 23:02:55 +0200
Received: by eyx24 with SMTP id 24so1262797eyx.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2011 13:57:14 -0700 (PDT)
Received: by 10.223.62.19 with SMTP id v19mr5859385fah.27.1317934633263;
	Thu, 06 Oct 2011 13:57:13 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w6sm8822490fah.0.2011.10.06.13.57.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Oct 2011 13:57:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1317910796.6398.86.camel@ted>
Date: Thu, 6 Oct 2011 22:57:09 +0200
Message-Id: <F8FE5F56-9EC7-43BB-AD4B-EF30F73312E3@dominion.thruhere.net>
References: <1317910796.6398.86.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: sstate.bbclass: Ensure machine specific stamps are only wiped for the current task
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
X-List-Received-Date: Thu, 06 Oct 2011 21:02:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

let's get this in before my buildserver melts a hole in the floor :)

Op 6 okt. 2011, om 16:19 heeft Richard Purdie het volgende geschreven:

> sstate was being a little too ethusiastic about removing stamp files and
> was removing stamp files for other machines when it shouldn't have been.
> 
> This patch teaches sstate about machine specific stamp extensions and
> allows it to only remove the current task's stampfiles.
> 
> Based on a patch from Phil Blundell <philb@gnu.org> with some tweaks
> from me.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index eee04ab..6abf55b 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -259,10 +259,15 @@ def sstate_clean(ss, d):
>             bb.utils.unlockfile(lock)
> 
>     stfile = d.getVar("STAMP", True) + ".do_" + ss['task']
> +    extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info')
>     oe.path.remove(stfile)
>     oe.path.remove(stfile + "_setscene")
> -    oe.path.remove(stfile + ".*")
> -    oe.path.remove(stfile + "_setscene" + ".*")
> +    if extrainf:
> +        oe.path.remove(stfile + ".*" + extrainf)
> +        oe.path.remove(stfile + "_setscene" + ".*" + extrainf)
> +    else:
> +        oe.path.remove(stfile + ".*")
> +        oe.path.remove(stfile + "_setscene" + ".*")
> 
> CLEANFUNCS += "sstate_cleanall"
> 
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



