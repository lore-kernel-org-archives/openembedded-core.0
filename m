Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RsaDL-0003P1-5e for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 14:27:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q11DJCI3021742
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Feb 2012 13:19:12 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20877-06 for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2012 13:19:08 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q11DJ4sL021736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Feb 2012 13:19:06 GMT
Message-ID: <1328102349.13744.68.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 01 Feb 2012 13:19:09 +0000
In-Reply-To: <d2dc84fee222915fee201ac867c00fda16b80284.1327975625.git.otavio@ossystems.com.br>
References: <cover.1327975625.git.otavio@ossystems.com.br>
	<d2dc84fee222915fee201ac867c00fda16b80284.1327975625.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] classes/gitpkgv.bbclass: import from Meta-OE
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
X-List-Received-Date: Wed, 01 Feb 2012 13:27:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-31 at 02:10 +0000, Otavio Salvador wrote:
> It provides a GITPKGV and GITPKGVTAG variables to be used in PKGV, as
> described bellow:
> 
>  - GITPKGV which is a sortable version with the format NN+GITHASH, to
>    be used in PKGV, where
> 
>    NN equals the total number of revs up to SRCREV
>    GITHASH is SRCREV's (full) hash
> 
>  - GITPKGVTAG which is the output of 'git describe' allowing for
>    automatic versioning
> 
> gitpkgv.bbclass assumes the git repository has been cloned, and
> contains SRCREV. So ${GITPKGV} and ${GITPKGVTAG} should never be
> used in PV, only in PKGV.  It can handle SRCREV = ${AUTOREV}, as
> well as SRCREV = "<some fixed git hash>".
> 
> The code has been imported from Meta-OE at revision
> a76fff17ea8420686ef81b35f80efac1bef21649.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/gitpkgv.bbclass |   95 ++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 95 insertions(+), 0 deletions(-)
>  create mode 100644 meta/classes/gitpkgv.bbclass

As discussed on IRC, I think some of the code here should really be
integrated into the bitbake git fetcher to ensure we have a
clean/consistent API for fetcher functionality. The interface I'm
thinking about would be similar to SRCPV:

SRCPV = "${@bb.fetch2.get_srcrev(d)}"

with a new fetcher call being added such as get_simplified_srcrev(d).
Switching between the simplified revision and the description could be
governed by a variable setting similar to some of the existing variables
that control fetcher behaviour.

There has been substantial work done to improve the fetcher APIs and
clean up the various corner cases and this would seem a logical
continuation of that, in keeping with the objectives of OE-Core.

Cheers,

Richard


> diff --git a/meta/classes/gitpkgv.bbclass b/meta/classes/gitpkgv.bbclass
> new file mode 100644
> index 0000000..238b0d2
> --- /dev/null
> +++ b/meta/classes/gitpkgv.bbclass
> @@ -0,0 +1,95 @@
> +# gitpkgv.bbclass provides a GITPKGV and GITPKGVTAG variables to be
> +# used in PKGV, as described bellow:
> +#
> +# - GITPKGV which is a sortable version with the format NN+GITHASH, to
> +#   be used in PKGV, where
> +#
> +#   NN equals the total number of revs up to SRCREV
> +#   GITHASH is SRCREV's (full) hash
> +#
> +# - GITPKGVTAG which is the output of 'git describe' allowing for
> +#   automatic versioning
> +#
> +# gitpkgv.bbclass assumes the git repository has been cloned, and
> +# contains SRCREV. So ${GITPKGV} and ${GITPKGVTAG} should never be
> +# used in PV, only in PKGV.  It can handle SRCREV = ${AUTOREV}, as
> +# well as SRCREV = "<some fixed git hash>".
> +#
> +# WARNING: if upstream repository is always using consistent and
> +# sortable tag name scheme you can get sortable version including tag
> +# name with ${GITPKGVTAG}, but be aware that ie tag sequence "v1.0,
> +# v1.2, xtest, v2.0" will force you to increment PE to get upgradeable
> +# path to v2.0 revisions
> +#
> +# use example:
> +#
> +# inherit gitpkgv
> +#
> +# PV = "1.0+gitr${SRCPV}"      # expands to something like 1.0+gitr3+4c1c21d7dbbf93b0df336994524313dfe0d4963b
> +# PKGV = "1.0+gitr${GITPKGV}"  # expands also to something like 1.0+gitr31337+4c1c21d7d
> +#
> +# or
> +#
> +# inherit gitpkgv
> +#
> +# PV = "1.0+gitr${SRCPV}" # expands to something like 1.0+gitr3+4c1c21d7dbbf93b0df336994524313dfe0d4963b
> +# PKGV = "${GITPKGVTAG}"  # expands to something like 1.0-31337+g4c1c21d
> +#                           if there is tag v1.0 before this revision or
> +#                           ver1.0-31337+g4c1c21d if there is tag ver1.0
> +
> +GITPKGV = "${@get_git_pkgv(d, False)}"
> +GITPKGVTAG = "${@get_git_pkgv(d, True)}"
> +
> +def gitpkgv_drop_tag_prefix(version):
> +    import re
> +    if re.match("v\d", version):
> +        return version[1:]
> +    else:
> +        return version
> +
> +def get_git_pkgv(d, use_tags):
> +    import os
> +    import bb
> +
> +    src_uri = bb.data.getVar('SRC_URI', d, 1).split()
> +    fetcher = bb.fetch2.Fetch(src_uri, d)
> +    ud = fetcher.ud
> +
> +    #
> +    # If SRCREV_FORMAT is set respect it for tags
> +    #
> +    format = bb.data.getVar('SRCREV_FORMAT', d, True)
> +    if not format:
> +        format = 'default'
> +
> +    found = False
> +    for url in ud.values():
> +        if url.type == 'git':
> +            for name, rev in url.revisions.items():
> +                if not os.path.exists(url.localpath):
> +                    return None
> +
> +                found = True
> +
> +                cwd = os.getcwd()
> +                os.chdir(url.localpath)
> +
> +                commits = bb.fetch2.runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=True).strip()
> +
> +                if use_tags:
> +                    try:
> +                        output = bb.fetch2.runfetchcmd("git describe %s 2>/dev/null" % rev, d, quiet=True).strip()
> +                        ver = gitpkgv_drop_tag_prefix(output)
> +                    except Exception:
> +                        ver = "0.0-%s-g%s" % (commits, rev[:7])
> +                else:
> +                    ver = "%s+%s" % (commits, rev[:7])
> +
> +                os.chdir(cwd)
> +
> +                format = format.replace(name, ver)
> +
> +    if found:
> +        return format
> +
> +    return '0+0'




