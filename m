Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id F30766AE73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 12:18:07 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0HCI235015892; Fri, 17 Jan 2014 12:18:02 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dWzPYyECsigl; Fri, 17 Jan 2014 12:18:02 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0HCHfKh015873
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 17 Jan 2014 12:17:43 GMT
Message-ID: <1389961055.14987.118.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 17 Jan 2014 12:17:35 +0000
In-Reply-To: <52D90D85.7010106@windriver.com>
References: <cover.1389940146.git.liezhi.yang@windriver.com>
	<981567c4dfef59be08373f124b36739449a546a1.1389940146.git.liezhi.yang@windriver.com>
	<1389954978.14987.106.camel@ted> <52D90D85.7010106@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: remove previous version's stamp
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
X-List-Received-Date: Fri, 17 Jan 2014 12:18:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-01-17 at 19:01 +0800, Robert Yang wrote:
> 
> On 01/17/2014 06:36 PM, Richard Purdie wrote:
> > On Fri, 2014-01-17 at 14:43 +0800, Robert Yang wrote:
> >> +        # Keep the sigdata
> >> +        if not re.match(re_sigdata, stfile):
> >> +            oe.path.remove(stfile)
> >
> > I'm not sure its worth the overhead of using regexps here. Can we not do
> > something simple like:
> >
> > if ".sigdata." not in stfile:
> >
> 
> Sounds better, I've updated the PULL:
> 
> git://git.pokylinux.org/poky-contrib rbt/clean_stamp
> 
> and here is the patch:
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 35c3f85..d4e0dcb 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -331,11 +331,17 @@ def sstate_clean_manifest(manifest, d):
> 
>   def sstate_clean(ss, d):
>       import oe.path
> +    import glob
> 
>       d2 = d.createCopy()
> +    stamp_clean = d.getVar("STAMPCLEAN", True)
>       extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
>       if extrainf:
>           d2.setVar("SSTATE_MANMACH", extrainf)
> +        wildcard_stfile = "%s.do_%s*.%s" % (stamp_clean, ss['task'], extrainf)
> +    else:
> +        wildcard_stfile = "%s.do_%s*" % (stamp_clean, ss['task'])
> +
>       manifest = d2.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['name'])
> 
>       if os.path.exists(manifest):
> @@ -350,15 +356,11 @@ def sstate_clean(ss, d):
>           for lock in locks:
>               bb.utils.unlockfile(lock)
> 
> -    stfile = d.getVar("STAMP", True) + ".do_" + ss['task']
> -    oe.path.remove(stfile)
> -    oe.path.remove(stfile + "_setscene")
> -    if extrainf:
> -        oe.path.remove(stfile + ".*" + extrainf)
> -        oe.path.remove(stfile + "_setscene" + ".*" + extrainf)
> -    else:
> -        oe.path.remove(stfile + ".*")
> -        oe.path.remove(stfile + "_setscene" + ".*")
> +    # Remove the current and previous stamps, but keep the sigdata
> +    for stfile in glob.glob(wildcard_stfile):
> +        # Keep the sigdata
> +        if ".sigdata." not in stfile:
> +            oe.path.remove(stfile)

Sorry Robert, there is one more issue here. You're doing "do_%s*" but
this can match multiple tasks, e.g. do_package* would also wipe out
do_package_write_ipk, do_package_write_rpm etc.

The easiest way to handle this is probably in the for loop, making sure
that do_<task>. or do_<task>_setscene. are in the filename.

It might be worth putting some comments in the code about these
subtleties. 

Cheers,

Richard






