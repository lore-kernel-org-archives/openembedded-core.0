Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C261973114
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 01:44:13 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 01 Mar 2017 17:44:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,228,1484035200"; d="scan'208";a="63421453"
Received: from yokemooi-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.134.143])
	by orsmga004.jf.intel.com with ESMTP; 01 Mar 2017 17:44:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Anders Darander <anders@chargestorm.se>
Date: Thu, 02 Mar 2017 14:44:11 +1300
Message-ID: <8048065.zPYkRBxOXs@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <1d9e36a9b92ba941e472aef5ed9dd32ec29404e9.1488388550.git.anders@chargestorm.se>
References: <cover.1488388550.git.anders@chargestorm.se>
	<1d9e36a9b92ba941e472aef5ed9dd32ec29404e9.1488388550.git.anders@chargestorm.se>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] create_npm.py: add devDependencies to depends
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
X-List-Received-Date: Thu, 02 Mar 2017 01:44:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Anders,

On Thursday, 2 March 2017 6:19:55 AM NZDT Anders Darander wrote:
> Web applications built using e.g. angular2, usually requires that the
> packages in devDependencies are available.
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  scripts/lib/recipetool/create_npm.py | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/lib/recipetool/create_npm.py
> b/scripts/lib/recipetool/create_npm.py index 3ba6de0..11b2950 100644
> --- a/scripts/lib/recipetool/create_npm.py
> +++ b/scripts/lib/recipetool/create_npm.py
> @@ -83,7 +83,7 @@ class NpmRecipeHandler(RecipeHandler):
>          extravalues['extrafiles']['lockdown.json'] = tmpfile
>          lines_before.append('NPM_LOCKDOWN :=
> "${THISDIR}/${PN}/lockdown.json"')
> 
> -    def _handle_dependencies(self, d, deps, optdeps, lines_before,
> srctree): +    def _handle_dependencies(self, d, deps, optdeps, devdeps,
> lines_before, srctree): import scriptutils
>          # If this isn't a single module we need to get the dependencies
>          # and add them to SRC_URI
> @@ -97,6 +97,10 @@ class NpmRecipeHandler(RecipeHandler):
>                          depdata = self.get_npm_data(dep, depver, d)
>                          if self.check_npm_optional_dependency(depdata):
>                              deplist[dep] = depdata
> +                    for dep, depver in devdeps.items():
> +                        depdata = self.get_npm_data(dep, depver, d)
> +                        if self.check_npm_optional_dependency(depdata):
> +                            deplist[dep] = depdata
>                      for dep, depver in deps.items():
>                          depdata = self.get_npm_data(dep, depver, d)
>                          deplist[dep] = depdata
> @@ -179,8 +183,8 @@ class NpmRecipeHandler(RecipeHandler):
>                  if 'homepage' in data:
>                      extravalues['HOMEPAGE'] = data['homepage']
> 
> -                deps, optdeps = self.get_npm_package_dependencies(data)
> -                updated = self._handle_dependencies(tinfoil.config_data,
> deps, optdeps, lines_before, srctree) +                deps, optdeps,
> devdeps = self.get_npm_package_dependencies(data) +                updated
> = self._handle_dependencies(tinfoil.config_data, deps, optdeps, devdeps,
> lines_before, srctree) if updated:
>                      # We need to redo the license stuff
>                      self._replace_license_vars(srctree, lines_before,
> handled, extravalues, tinfoil.config_data) @@ -277,15 +281,20 @@ class
> NpmRecipeHandler(RecipeHandler):
>      def get_npm_package_dependencies(self, pdata):
>          dependencies = pdata.get('dependencies', {})
>          optionalDependencies = pdata.get('optionalDependencies', {})
> +        devDependencies = pdata.get('devDependencies', {})
>          dependencies.update(optionalDependencies)
> +        dependencies.update(devDependencies)
>          depsfound = {}
>          optdepsfound = {}
> +        devdepsfound = {}
>          for dep in dependencies:
>              if dep in optionalDependencies:
>                  optdepsfound[dep] = dependencies[dep]
> +            elif dep in devDependencies:
> +                devdepsfound[dep] = dependencies[dep]
>              else:
>                  depsfound[dep] = dependencies[dep]
> -        return depsfound, optdepsfound
> +        return depsfound, optdepsfound, devdepsfound
> 
>      # FIXME this is effectively duplicated from lib/bb/fetch2/npm.py
>      # (split out from _getdependencies())

This worries me slightly - I've no familiarity with angular2 but AIUI in 
general the dev dependencies most often aren't needed, and may be onerous to 
pull in and build - should we really be pulling those in unconditionally?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

