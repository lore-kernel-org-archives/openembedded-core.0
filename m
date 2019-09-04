Return-Path: <quentin.schulz@streamunlimited.com>
X-Greylist: delayed 2386 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Sep 2019 08:12:26 UTC
Received: from bsmtp8.bon.at (bsmtp8.bon.at [213.33.87.20])
	by mail.openembedded.org (Postfix) with ESMTP id E41D87F289
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 08:12:26 +0000 (UTC)
Received: from bsmtp.bon.at (unknown [192.168.181.101])
	by bsmtp8.bon.at (Postfix) with ESMTPS id 46NbBf4SKHz62SX
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 09:32:42 +0200 (CEST)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 46NbBd04T8z5tlG;
	Wed,  4 Sep 2019 09:32:40 +0200 (CEST)
Date: Wed, 4 Sep 2019 09:32:39 +0200
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190904073239.rlk6spusid6m2zbd@qschulz>
References: <20190903163241.87739-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190903163241.87739-1-alex.kanavin@gmail.com>
User-Agent: NeoMutt/20180716
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package.bbclass: allow shell-style wildcards in PRIVATE_LIBS
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
X-List-Received-Date: Wed, 04 Sep 2019 08:12:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexander,

On Tue, Sep 03, 2019 at 06:32:41PM +0200, Alexander Kanavin wrote:
> PRIVATE_LIBS is used to exclude 'private' libraries from getting added to
> automatic runtime dependency resolution. This variable currently has to list
> all libraries by name, which becomes a maintenance issue if the list
> of such libraries frequently changes, or is very large.
> 
> This change allows using shell-style wildcards in the variable, similar
> to how FILES lists what gets packaged.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/classes/package.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 114d6559f5e..aa8451ffe8b 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1646,7 +1646,8 @@ python package_do_shlibs() {
>                  prov = (this_soname, ldir, pkgver)
>                  if not prov in sonames:
>                      # if library is private (only used by package) then do not build shlib for it
> -                    if not private_libs or this_soname not in private_libs:
> +                    import fnmatch
> +                    if not private_libs or len([i for i in private_libs if fnmatch.fnmatch(this_soname, i)]) == 0:

We only need to know if this_soname is matching one of the patterns, we
don't need to check for each and every pattern.

Something like:

for pattern in private_libs:
	if fnmatch.fnmatch(this_soname, pattern)]) == 0:
		sonames.add(prov)
		break

would be possible?

AFAICT, private_libs is either the content of PRIVATE_LIBS_PN or
PRIVATE_LIBS or "" then passed to .split(). This should be safe for the
forloop without a check.

>                          sonames.add(prov)
>                  if libdir_re.match(os.path.dirname(file)):
>                      needs_ldconfig = True
> @@ -1829,7 +1830,8 @@ python package_do_shlibs() {
>              # /opt/abc/lib/libfoo.so.1 and contains /usr/bin/abc depending on system library libfoo.so.1
>              # but skipping it is still better alternative than providing own
>              # version and then adding runtime dependency for the same system library
> -            if private_libs and n[0] in private_libs:
> +            import fnmatch
> +            if private_libs and len([i for i in private_libs if fnmatch.fnmatch(n[0], i)]) > 0:

Same here?

Just a suggestion :)

BR,
Quentin
-- 
StreamUnlimited Engineering GmbH
High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
quentin.schulz@streamunlimited.com, www.streamunlimited.com

