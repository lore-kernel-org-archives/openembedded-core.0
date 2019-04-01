Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6028E7D1E3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 22:51:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Apr 2019 15:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,298,1549958400"; d="scan'208";a="127784597"
Received: from nshahrol-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.144.90])
	by orsmga007.jf.intel.com with ESMTP; 01 Apr 2019 15:51:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Date: Tue, 02 Apr 2019 11:51:06 +1300
Message-ID: <7510832.zsYhOAh3AW@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <1553799321-17585-2-git-send-email-chandana.kalluri@xilinx.com>
References: <1553799321-17585-1-git-send-email-chandana.kalluri@xilinx.com>
	<1553799321-17585-2-git-send-email-chandana.kalluri@xilinx.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][PATCH v3 1/3] devtool/standard.py: Update devtool modify to copy source from work-shared if its already downloaded
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
X-List-Received-Date: Mon, 01 Apr 2019 22:51:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 29 March 2019 7:55:19 AM NZDT Sai Hari Chandana Kalluri wrote:
> +def get_staging_kbranch(srcdir):
> +      staging_kbranch = ""
> +      if os.path.exists(srcdir) and os.listdir(srcdir):
> +          (branch, _) = bb.process.run('git branch | grep \* | cut -d \' \' -f2', cwd=srcdir)
> +          staging_kbranch = "".join(branch.split('\n')[0])

This would be a lot more simply implemented as:

          (branch, _) = bb.process.run('git branch | grep \*', cwd=srcdir)
	   staging_kbranch = branch.split()[1]

Note however that this produces "(HEAD" if the current checked out revision is detached from a branch, as I believe your original code would. Is that an issue?

> @@ -763,6 +783,80 @@ def modify(args, config, basepath, workspace):
>          initial_rev = None
>          commits = []
>          check_commits = False
> +
> +        if bb.data.inherits_class('kernel-yocto', rd):
> +               #Current set kernel version
> +               kernelVersion = rd.getVar('LINUX_VERSION')
> +               srcdir = rd.getVar('STAGING_KERNEL_DIR')
> +               kbranch = rd.getVar('KBRANCH')
> +
> +               staging_kerVer = get_staging_kver(srcdir)
> +               staging_kbranch = get_staging_kbranch(srcdir)
> +               if (os.path.exists(srcdir) and os.listdir(srcdir)) and (kernelVersion in staging_kerVer and staging_kbranch == kbranch):
> +                  oe.path.copyhardlinktree(srcdir,srctree)
> +                  workdir = rd.getVar('WORKDIR')
> +                  srcsubdir = rd.getVar('S')
> +                  localfilesdir = os.path.join(srctree,'oe-local-files') 
> +                  # Move local source files into separate subdir
> +                  recipe_patches = [os.path.basename(patch) for patch in oe.recipeutils.get_recipe_patches(rd)]
> +                  local_files = oe.recipeutils.get_recipe_local_files(rd)
> +
> +                  for key in local_files.copy():
> +                        if key.endswith('scc'):
> +                              sccfile = open(local_files[key], 'r')
> +                              for l in sccfile:
> +                                  line = l.split()
> +                                  if line and line[0] in ('kconf', 'patch'):
> +                                        cfg = os.path.join(os.path.dirname(local_files[key]), line[-1])
> +                                        if not cfg in local_files.values():
> +                                            local_files[line[-1]] = cfg
> +                                            shutil.copy2(cfg, workdir)
> +                              sccfile.close()

When opening a file please use "with open()..." so that it's guaranteed to be closed.

> +
> +                  # Ignore local files with subdir={BP}
> +                  srcabspath = os.path.abspath(srcsubdir)
> +                  local_files = [fname for fname in local_files if os.path.exists(os.path.join(workdir, fname)) and  (srcabspath == workdir or not  os.path.join(workdir, fname).startswith(srcabspath + os.sep))]
> +                  if local_files:
> +                       for fname in local_files:
> +                              _move_file(os.path.join(workdir, fname), os.path.join(srctree, 'oe-local-files', fname))
> +                       with open(os.path.join(srctree, 'oe-local-files', '.gitignore'), 'w') as f:
> +                              f.write('# Ignore local files, by default. Remove this file ''if you want to commit the directory to Git\n*\n')
> +
> +                  if os.path.abspath(rd.getVar('S')) == os.path.abspath(rd.getVar('WORKDIR')):
> +                  # If recipe extracts to ${WORKDIR}, symlink the files into the srctree
> +                  # (otherwise the recipe won't build as expected)
> +                        local_files_dir = os.path.join(srctree, 'oe-local-files')
> +                        addfiles = []
> +                        for root, _, files in os.walk(local_files_dir):
> +                            relpth = os.path.relpath(root, local_files_dir)
> +                            if relpth != '.':
> +                                  bb.utils.mkdirhier(os.path.join(srctree, relpth))
> +                            for fn in files:
> +                                if fn == '.gitignore':
> +                                    continue
> +                                destpth = os.path.join(srctree, relpth, fn)
> +                                if os.path.exists(destpth):
> +                                    os.unlink(destpth)
> +                                os.symlink('oe-local-files/%s' % fn, destpth)
> +                                addfiles.append(os.path.join(relpth, fn))
> +                        if addfiles:
> +                           bb.process.run('git add %s' % ' '.join(addfiles), cwd=srctree)
> +                        useroptions = []
> +                        oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=d)
> +                        bb.process.run('git %s commit -a -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)

Some of the above is copy-pasted from _extract_source(). Would it be possible to break some of it out into functions that would avoid duplicating code?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



