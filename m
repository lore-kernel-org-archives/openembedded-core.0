Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A256D71CB3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 01:28:06 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Nov 2017 17:28:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,386,1505804400"; 
   d="scan'208";a="802707"
Received: from mintingh-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.67.199])
	by fmsmga004.fm.intel.com with ESMTP; 12 Nov 2017 17:28:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Amanda Brindle <amanda.r.brindle@intel.com>
Date: Mon, 13 Nov 2017 14:27:59 +1300
Message-ID: <3886302.zPWej6uzDQ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <57ca9a160975cb564d534c0672a62354d19866ef.1509400153.git.amanda.r.brindle@intel.com>
References: <cover.1509400153.git.amanda.r.brindle@intel.com>
	<57ca9a160975cb564d534c0672a62354d19866ef.1509400153.git.amanda.r.brindle@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] scripts/contrib/bbvars.py: Rewrite to use tinfoil
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
X-List-Received-Date: Mon, 13 Nov 2017 01:28:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Amanda,

Finally getting around to reviewing this, sorry for the delay.

On Tuesday, 31 October 2017 10:57:04 AM NZDT Amanda Brindle wrote:
> Use tinfoil to collect all variable names globally and in each recipe.
> 
> No longer show the count of variables if they are undocumented.

Can you please describe why we're making these changes? i.e. we can capture
many more variable references using tinfoil than the manual parsing, and
we're not showing the counts anymore because we can't distinguish unique
references using this mechanism.

I also notice there's some dead code left after these changes that we
should remove at the same time - recipe_bbvars() and collect_bbvars()
at least. We also no longer need the -m option since we're searching through
all recipes in the configuration (the latter should be noted in the commit 
message as well).
 
> Fixes [YOCTO #2086]
> 
> Signed-off-by: Amanda Brindle <amanda.r.brindle@intel.com>
> ---
>  scripts/contrib/bbvars.py | 90 ++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 66 insertions(+), 24 deletions(-)
> 
> diff --git a/scripts/contrib/bbvars.py b/scripts/contrib/bbvars.py
> index d8d0594..556f652 100755
> --- a/scripts/contrib/bbvars.py
> +++ b/scripts/contrib/bbvars.py
> @@ -23,6 +23,14 @@ import os
>  import os.path
>  import re
>  
> +# Set up sys.path to let us import tinfoil
> +scripts_path = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
> +lib_path = scripts_path + '/lib'
> +sys.path.insert(0, lib_path)
> +import scriptpath
> +scriptpath.add_bitbake_lib_path()
> +import bb.tinfoil
> +
>  def usage():
>      print('Usage: %s -d FILENAME [-d FILENAME]* -m METADIR [-m MATADIR]*' % os.path.basename(sys.argv[0]))
>      print('  -d FILENAME         documentation file to search')
> @@ -66,19 +74,23 @@ def collect_bbvars(metadir):
>                          bbvars[key] = 1
>      return bbvars
>  
> -def bbvar_is_documented(var, docfiles):
> -    prog = re.compile(".*($|[^A-Z_])%s([^A-Z_]|$)" % (var))
> -    for doc in docfiles:
> -        try:
> -            f = open(doc)
> -        except IOError as err:
> -            print('WARNING: Failed to open doc ', doc)
> -            print(err.args[1])
> -        for line in f:
> -            if prog.match(line):
> -                return True
> -        f.close()
> -    return False
> +def bbvar_is_documented(var, documented_vars):
> +    ''' Check if variable (var) is in the list of documented variables(documented_vars) '''
> +    if var in documented_vars:
> +        return True
> +    else:
> +        return False
> +
> +def collect_documented_vars(docfiles):
> +    ''' Walk the docfiles and collect the documented variables '''
> +    documented_vars = []
> +    prog = re.compile(".*($|[^A-Z_])<glossentry id=\'var-")
> +    var_prog = re.compile('<glossentry id=\'var-(.*)\'>')
> +    for d in docfiles:
> +        with open(d) as f:
> +            documented_vars += var_prog.findall(f.read())
> +
> +    return documented_vars
>  
>  def bbvar_doctag(var, docconf):
>      prog = re.compile('^%s\[doc\] *= *"(.*)"' % (var))
> @@ -101,7 +113,7 @@ def bbvar_doctag(var, docconf):
>  def main():
>      docfiles = []
>      metadirs = []
> -    bbvars = {}
> +    bbvars = set()
>      undocumented = []
>      docconf = ""
>      onlydoctags = False
> @@ -153,33 +165,63 @@ def main():
>          usage()
>          sys.exit(7)
>  
> -    # Collect all the variable names from the recipes in the metadirs
> -    for m in metadirs:
> -        for key,cnt in collect_bbvars(m).items():
> -            if key in bbvars:
> -                bbvars[key] = bbvars[key] + cnt
> +    prog = re.compile("^[^a-z]*$")
> +    with bb.tinfoil.Tinfoil() as tinfoil:
> +        tinfoil.prepare(config_only=False)
> +        parser = bb.codeparser.PythonParser('parser', None)
> +        datastore = tinfoil.config_data
> +
> +        def bbvars_update(data):
> +            if prog.match(data):
> +                bbvars.add(data)
> +            if tinfoil.config_data.getVarFlag(data, 'python'):
> +                try:
> +                    parser.parse_python(tinfoil.config_data.getVar(data))
> +                except bb.data_smart.ExpansionError:
> +                    pass
> +                for var in parser.references:
> +                    if prog.match(var):
> +                        bbvars.add(var)
>              else:
> -                bbvars[key] = cnt
> +                try:
> +                    expandedVar = datastore.expandWithRefs(datastore.getVar(data, False), data)
> +                    for var in expandedVar.references:
> +                        if prog.match(var):
> +                            bbvars.add(var)
> +                except bb.data_smart.ExpansionError:
> +                    pass
> +
> +        # Use tinfoil to collect all the variable names globally
> +        for data in datastore:
> +            bbvars_update(data)
> +
> +        # Collect variables from all recipes
> +        for recipe in tinfoil.all_recipe_files():

I think we need to pass variants=False here, there's not much percentage in
scanning through all of the variants as well.

One other thing - looking at the output there are a lot of variables that
simply shouldn't be documented - particularly those that are set and
used entirely within one recipe or class and aren't intended to be used
outside of that context (a bit like local variables). I think the script would
be more useful if we could filter these out by default, but I don't think
there's any effective way we can detect those programmatically, so we'd
have to have an exclusion list. We can do that in a separate patch though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

