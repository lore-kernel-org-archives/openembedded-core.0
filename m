Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3727716A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 13:58:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2016 06:53:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,406,1459839600"; d="scan'208";a="712816438"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.101])
	([10.219.5.101])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Jun 2016 06:53:45 -0700
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
	<1c36ea6e275b1b86fc3a6396242a951fc350f6c8.1464861910.git.ed.bartosh@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <1d8f0b7c-b094-23cd-ff7e-320d919dba62@linux.intel.com>
Date: Thu, 2 Jun 2016 08:55:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1c36ea6e275b1b86fc3a6396242a951fc350f6c8.1464861910.git.ed.bartosh@linux.intel.com>
Subject: Re: [PATCH 01/16] scripts: python3: convert iterables to lists
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
X-List-Received-Date: Thu, 02 Jun 2016 13:58:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Ed,

what is the reason for this change?


On 06/02/2016 05:12 AM, Ed Bartosh wrote:
> Converted return value of items() keys() and values() to
> lists when dictionary is modified in the loop and when
> the result is added to the list.
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>   scripts/bitbake-whatchanged                      | 6 +++---
>   scripts/combo-layer                              | 2 +-
>   scripts/lib/devtool/build.py                     | 2 +-
>   scripts/lib/devtool/standard.py                  | 4 ++--
>   scripts/lib/recipetool/create_buildsys.py        | 2 +-
>   scripts/lib/recipetool/create_buildsys_python.py | 6 +++---
>   scripts/oe-pkgdata-util                          | 2 +-
>   7 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
> index a20adb2..b05aead 100755
> --- a/scripts/bitbake-whatchanged
> +++ b/scripts/bitbake-whatchanged
> @@ -120,7 +120,7 @@ def print_added(d_new = None, d_old = None):
>       Print the newly added tasks
>       """
>       added = {}
> -    for k in d_new.keys():
> +    for k in list(d_new.keys()):
>           if k not in d_old:
>               # Add the new one to added dict, and remove it from
>               # d_new, so the remaining ones are the changed ones
> @@ -155,7 +155,7 @@ def print_vrchanged(d_new = None, d_old = None, vr = None):
>       """
>       pvchanged = {}
>       counter = 0
> -    for k in d_new.keys():
> +    for k in list(d_new.keys()):
>           if d_new.get(k).get(vr) != d_old.get(k).get(vr):
>               counter += 1
>               pn, task = split_pntask(k)
> @@ -279,7 +279,7 @@ Note:
>   
>           # Remove the same one from both stamps.
>           cnt_unchanged = 0
> -        for k in new_dict.keys():
> +        for k in list(new_dict.keys()):
>               if k in old_dict:
>                   cnt_unchanged += 1
>                   del(new_dict[k])
> diff --git a/scripts/combo-layer b/scripts/combo-layer
> index 234d9e4..7c41f92 100755
> --- a/scripts/combo-layer
> +++ b/scripts/combo-layer
> @@ -1186,7 +1186,7 @@ def update_with_history(conf, components, revisions, repos):
>           msg = conf_commit_msg(conf, components)
>           new_tree = runcmd("git write-tree", **wargs).strip()
>           new_rev = runcmd("git commit-tree".split() +
> -                         add_p([head] + additional_heads.keys()) +
> +                         add_p([head] + list(additional_heads.keys())) +
>                            ["-m", msg, new_tree],
>                            **wargs).strip()
>           # And done! This is the first time we change the HEAD in the actual work tree.
> diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
> index 48f6fe1..6be549d 100644
> --- a/scripts/lib/devtool/build.py
> +++ b/scripts/lib/devtool/build.py
> @@ -27,7 +27,7 @@ logger = logging.getLogger('devtool')
>   
>   
>   def _set_file_values(fn, values):
> -    remaining = values.keys()
> +    remaining = list(values.keys())
>   
>       def varfunc(varname, origvalue, op, newlines):
>           newvalue = values.get(varname, origvalue)
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
> index 08153c6..a2516d6 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -998,7 +998,7 @@ def _export_local_files(srctree, rd, destdir):
>           bb.process.run(['git', 'checkout', tree, '--', '.'], cwd=srctree,
>                           env=dict(os.environ, GIT_WORK_TREE=destdir,
>                                    GIT_INDEX_FILE=tmp_index))
> -        new_set = _git_ls_tree(srctree, tree, True).keys()
> +        new_set = list(_git_ls_tree(srctree, tree, True).keys())
>       elif os.path.isdir(local_files_dir):
>           # If not tracked by Git, just copy from working copy
>           new_set = _ls_tree(os.path.join(srctree, 'oe-local-files'))
> @@ -1309,7 +1309,7 @@ def reset(args, config, basepath, workspace):
>           raise DevtoolError("Recipe must be specified, or specify -a/--all to "
>                              "reset all recipes")
>       if args.all:
> -        recipes = workspace.keys()
> +        recipes = list(workspace.keys())
>       else:
>           recipes = [args.recipename]
>   
> diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
> index de3d9ae..78ae4bc 100644
> --- a/scripts/lib/recipetool/create_buildsys.py
> +++ b/scripts/lib/recipetool/create_buildsys.py
> @@ -682,7 +682,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
>                   process_macro(in_keyword, partial)
>   
>           if extravalues:
> -            for k,v in extravalues.items():
> +            for k,v in list(extravalues.items()):
>                   if v:
>                       if v.startswith('$') or v.startswith('@') or v.startswith('%'):
>                           del extravalues[k]
> diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
> index 55cce0e..aff13cf 100644
> --- a/scripts/lib/recipetool/create_buildsys_python.py
> +++ b/scripts/lib/recipetool/create_buildsys_python.py
> @@ -361,7 +361,7 @@ class PythonRecipeHandler(RecipeHandler):
>   
>           # Naive mapping of setup() arguments to PKG-INFO field names
>           for d in [info, non_literals]:
> -            for key, value in d.items():
> +            for key, value in list(d.items()):
>                   new_key = _map(key)
>                   if new_key != key:
>                       del d[key]
> @@ -443,7 +443,7 @@ class PythonRecipeHandler(RecipeHandler):
>                   elif new_value != value:
>                       info[variable] = new_value
>               elif hasattr(value, 'items'):
> -                for dkey, dvalue in value.items():
> +                for dkey, dvalue in list(value.items()):
>                       new_list = []
>                       for pos, a_value in enumerate(dvalue):
>                           new_value = replace_value(search, replace, a_value)
> @@ -608,7 +608,7 @@ def gather_setup_info(fileobj):
>       visitor.visit(parsed)
>   
>       non_literals, extensions = {}, []
> -    for key, value in visitor.keywords.items():
> +    for key, value in list(visitor.keywords.items()):
>           if key == 'ext_modules':
>               if isinstance(value, list):
>                   for ext in value:
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index b39d9b5..b16ecc9 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -240,7 +240,7 @@ def lookup_pkg(args):
>           sys.exit(1)
>   
>       if args.reverse:
> -        items = mappings.values()
> +        items = list(mappings.values())
>       else:
>           items = []
>           for pkg in pkgs:


