Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6F075739A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 18:37:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 12 Mar 2015 11:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,390,1422950400"; d="scan'208";a="697905391"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.24.97])
	by orsmga002.jf.intel.com with ESMTP; 12 Mar 2015 11:37:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Thu, 12 Mar 2015 18:37:43 +0000
Message-ID: <6546171.DhLWhA9YHA@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.7-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <1425982249-17652-3-git-send-email-patrick.ohly@intel.com>
References: <1425982249-17652-1-git-send-email-patrick.ohly@intel.com>
	<1425982249-17652-3-git-send-email-patrick.ohly@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] combo-layer: exclude files
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
X-List-Received-Date: Thu, 12 Mar 2015 18:37:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 10 March 2015 11:10:49 Patrick Ohly wrote:
> Some combined repos intentionally do not include certain files.
> For example, Poky does not include bitbake's setup files and
> OE-core's sample files under meta/conf.
> 
> When these files get modified in the upstream repository, applying the
> patches fails and requires manual intervention. That is merely a
> nuisance for someone familiar with the problem, but a real show
> stopper when having the import run automatically or by someone less
> experienced.
> 
> Therefore this change introduces "file_exclude", a new per-repo list
> of file patterns which removes all matching files when initializing or
> updating a combined repository. Because fnmatch is used under the hood
> to match full path strings, removing entire directories must be done
> with a pattern ending in a '/*' (in contrast to file_filter).
> 
> For Poky, the additional configuration looks like this:
> 
> [bitbake]
> ...
> file_exclude = classes/base.bbclass
> 	conf/bitbake.conf
> 	.gitignore
> 	MANIFEST.in
> 	setup.py
> 	TODO
> 
> [openembedded-core]
> ...
> file_exclude = meta/conf/bblayers.conf.sample
> 	meta/conf/local.conf.sample
> 	meta/conf/local.conf.sample.extended
> 	meta/conf/site.conf.sample
> ---
>  scripts/combo-layer              | 41
> +++++++++++++++++++++++++++++++++++++++- scripts/combo-layer.conf.example |
> 14 ++++++++++++++
>  2 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/combo-layer b/scripts/combo-layer
> index fb3fb50..b121c99 100755
> --- a/scripts/combo-layer
> +++ b/scripts/combo-layer
> @@ -20,6 +20,7 @@
>  # with this program; if not, write to the Free Software Foundation, Inc.,
>  # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> 
> +import fnmatch
>  import os, sys
>  import optparse
>  import logging
> @@ -208,7 +209,18 @@ def action_init(conf, args):
>              else:
>                  extract_dir = os.getcwd()
>              file_filter = repo.get('file_filter', "")
> -            runcmd("git archive %s | tar -x -C %s %s" % (initialrev,
> extract_dir, file_filter), ldir) +            files = runcmd("git archive
> %s | tar -x -v -C %s %s" % (initialrev, extract_dir, file_filter), ldir) + 
>           exclude_patterns = repo.get('file_exclude', '').split() +        
>    if exclude_patterns:
> +                # Implement file removal by letting tar create the
> +                # file and then deleting it in the file system
> +                # again. Uses the list of files created by tar (easier
> +                # than walking the tree).
> +                for file in files.split('\n'):
> +                    for pattern in exclude_patterns:
> +                        if fnmatch.fnmatch(file, pattern):
> +                            os.unlink(os.path.join(extract_dir, file))
> +                            break
>              if not lastrev:
>                  lastrev = runcmd("git rev-parse %s" % initialrev,
> ldir).strip() conf.update(name, "last_revision", lastrev, initmode=True) @@
> -423,6 +435,33 @@ def action_update(conf, args):
>                  runcmd("%s %s %s %s" % (repo['hook'], patch,
> revlist[count], name)) count=count-1
> 
> +        # Step 3a: Filter out unwanted files and patches.
> +        exclude = repo.get('file_exclude', '')
> +        if exclude:
> +            filter = ['filterdiff', '-p1']
> +            for path in exclude.split():
> +                filter.append('-x')
> +                filter.append(path)
> +            for patch in patchlist[:]:
> +                filtered = patch + '.tmp'
> +                with open(filtered, 'w') as f:
> +                    runcmd(filter + [patch], out=f)
> +                # Now check for empty patches.
> +                if runcmd(['filterdiff', '--list', filtered]):
> +                    # Possibly modified.
> +                    os.unlink(patch)
> +                    os.rename(filtered, patch)
> +                else:
> +                    # Empty, ignore it. Must also remove from revlist.
> +                    fromline = open(patch, 'r').readline()

Can you use "with open(..." here? Otherwise looks good.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

