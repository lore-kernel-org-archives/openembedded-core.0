X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <5d21c744-33c3-ae3e-c902-712be3918d4e@pr.hu>
Date: Thu, 19 May 2022 12:25:22 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH 1/6] npm: replace 'npm pack' call by 'tar czf'
References: <cover.1652954597.git.enrico.scholz@sigma-chemnitz.de>
 <42a8c94825cdcee944a274210a78e9e9940e6b63.1652954597.git.enrico.scholz@sigma-chemnitz.de>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
In-Reply-To: <42a8c94825cdcee944a274210a78e9e9940e6b63.1652954597.git.enrico.scholz@sigma-chemnitz.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: enrico.scholz@sigma-chemnitz.de, openembedded-core@lists.openembedded.org

2022. 05. 19. 12:05 keltezéssel, Enrico Scholz via lists.openembedded.org írta:
> 'npm pack' is a maintainer tool which tries to execute 'prepare'
> and similar scripts.  This fails usually in OE because it requires
> completely installed 'node_modules'.
> 
> Earlier nodejs versions supported an undocumented 'ignore-scripts'
> option.  This has been removed in nodejs 16.
> 
> We could patch 'package.json' and remove the unwanted scripts.  But
> this might complicate local workflows (applying patches) and installed
> packages will contain the modified 'package.json'.
> 
> Instead of, package it manually by 'tar czf'.  As a sideeffect,
> 'do_configure' is running much faster now.

\o/ Hurray!

> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>   meta/classes/npm.bbclass | 35 +++++++++++++++++++++++++++++------
>   1 file changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index ba50fcac20..91f8f36b0d 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -57,13 +57,36 @@ def npm_global_configs(d):
>       configs.append(("cache", d.getVar("NPM_CACHE")))
>       return configs
>   
> +## 'npm pack' runs 'prepare' and 'prepack' scripts. Support for
> +## 'ignore-scripts' which prevents this behavior has been removed
> +## from nodejs 16.  Use simple 'tar' instead of.
>   def npm_pack(env, srcdir, workdir):
> -    """Run 'npm pack' on a specified directory"""
> -    import shlex
> -    cmd = "npm pack %s" % shlex.quote(srcdir)
> -    args = [("ignore-scripts", "true")]
> -    tarball = env.run(cmd, args=args, workdir=workdir).strip("\n")
> -    return os.path.join(workdir, tarball)
> +    """Emulate 'npm pack' on a specified directory"""
> +    import subprocess
> +    import os
> +    import json
> +
> +    src = os.path.join(srcdir, 'package.json')
> +    with open(src) as f:
> +        j = json.load(f)
> +
> +    # base does not really matter and is for documentation purposes
> +    # only.  But the 'version' part must exist because other parts of
> +    # the bbclass rely on it.
> +    base = j['name'].split('/')[-1]
> +    tarball = os.path.join(workdir, "%s-%s.tgz" % (base, j['version']));
> +
> +    # TODO: real 'npm pack' does not include directories while 'tar'
> +    # does.  But this does not seem to matter...
> +    subprocess.run(['tar', 'czf', tarball,
> +                    '--exclude', './node-modules',
> +                    '--exclude-vcs',
> +                    '--transform', 's,^\./,package/,',
> +                    '--mtime', '1985-10-26T08:15:00.000Z',
> +                    '.'],
> +                   check = True, cwd = srcdir)
> +
> +    return tarball
>   
>   python npm_do_configure() {
>       """
> 
> 
> 
> 
> 

