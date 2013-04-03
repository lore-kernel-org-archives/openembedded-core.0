Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UNR5h-0007Vy-1V
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 19:03:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Apr 2013 09:45:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="288857720"
Received: from unknown (HELO helios.localnet) ([10.255.13.159])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2013 09:45:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 03 Apr 2013 17:45:44 +0100
Message-ID: <2294036.Yb79BO8GKn@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <1364978976-18388-1-git-send-email-Martin.Jansa@gmail.com>
References: <20130403082450.GE10679@jama.dyndns-home.com>
	<1364978976-18388-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCHv2] buildhistory: record tag names and show warning when the same tag corresponds to different revision
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2013 17:03:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 03 April 2013 10:49:36 Martin Jansa wrote:
> * persistent cache records tag-srcrev mappings, but is not shared between
> builders 
> * when tag is moved in remote repo, all builders should rebuild
> the component to use the same source, show warning when revision is
> different than what was used in last build
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/buildhistory.bbclass | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass index 82d0bf8..8c9f794 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -538,24 +538,38 @@ def _get_srcrev_values(d):
>              scms.append(u)
> 
>      autoinc_templ = 'AUTOINC+'
> -    dict = {}
> +    dict_srcrevs = {}
> +    dict_tag_srcrevs = {}
>      for scm in scms:
>          ud = urldata[scm]
>          for name in ud.names:
>              rev = ud.method.sortable_revision(scm, ud, d, name)
>              if rev.startswith(autoinc_templ):
>                  rev = rev[len(autoinc_templ):]
> -            dict[name] = rev
> -    return dict
> +            dict_srcrevs[name] = rev
> +            if 'tag' in ud.parm:
> +                tag = ud.parm['tag'];
> +                key = name+'_'+tag
> +                dict_tag_srcrevs[key] = rev
> +    return (dict_srcrevs, dict_tag_srcrevs)
> 
>  python do_write_srcrev() {
>      pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
>      srcrevfile = os.path.join(pkghistdir, 'latest_srcrev')
> 
> -    srcrevs = _get_srcrev_values(d)
> +    srcrevs, tag_srcrevs = _get_srcrev_values(d)
>      if srcrevs:
>          if not os.path.exists(pkghistdir):
>              os.makedirs(pkghistdir)
> +        old_tag_srcrevs = {}
> +        if os.path.exists(srcrevfile):
> +            with open(srcrevfile) as f:
> +                for line in f:
> +                    if line.startswith('# tag_'):
> +                        key, value = line.split("=", 1)
> +                        key = key.replace('# tag_', '').strip()
> +                        value = value.replace('"', '').strip()
> +                        old_tag_srcrevs[key] = value
>          with open(srcrevfile, 'w') as f:
>              orig_srcrev = d.getVar('SRCREV', False) or 'INVALID'
>              if orig_srcrev != 'INVALID':
> @@ -568,6 +582,13 @@ python do_write_srcrev() {
>                      f.write('SRCREV_%s = "%s"\n' % (name, srcrev))
>              else:
>                  f.write('SRCREV = "%s"\n' % srcrevs.itervalues().next())
> +            if len(tag_srcrevs) > 0:
> +                for name, srcrev in tag_srcrevs.items():
> +                    f.write('# tag_%s = "%s"\n' % (name, srcrev))
> +                    if name in old_tag_srcrevs and old_tag_srcrevs[name] !=
> srcrev: +                        pkg = d.getVar('PN', True)
> +                        bb.warn("Revision for tag %s in package %s was
> changed since last build (from %s to %s)" % (name, pkg,
> old_tag_srcrevs[name], srcrev)) +
>      else:
>          if os.path.exists(srcrevfile):
>              os.remove(srcrevfile)

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


