Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AA23B71633
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:26:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 13 Mar 2016 12:26:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,332,1455004800"; d="scan'208";a="763349900"
Received: from jschew-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.169.99])
	by orsmga003.jf.intel.com with ESMTP; 13 Mar 2016 12:26:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 14 Mar 2016 08:26:02 +1300
Message-ID: <10341857.OKlmJH1THC@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.3-300.fc23.x86_64; KDE/4.14.17; x86_64; ;
	)
In-Reply-To: <1457836529-32388-1-git-send-email-twoerner@gmail.com>
References: <1457836529-32388-1-git-send-email-twoerner@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] metadata-revs: provide more information
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
X-List-Received-Date: Sun, 13 Mar 2016 19:26:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sat, 12 Mar 2016 21:35:29 Trevor Woerner wrote:
> Provide many more details concerning the repositories that are used in a
> particular build: the remote information, the layer, the local branch, the
> remote branch the local branch tracks (if any), and the HEAD commit.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/classes/buildhistory.bbclass |  6 +++++-
>  meta/classes/metadata_scm.bbclass | 18 ++++++++++++++++++
>  2 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass index b6b4324..1b0ae0e 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -615,9 +615,13 @@ def buildhistory_get_build_id(d):
> 
>  def buildhistory_get_metadata_revs(d):
>      # We want an easily machine-readable format here, so
> get_layers_branch_rev isn't quite what we want +    import subprocess
>      layers = (d.getVar("BBLAYERS", True) or "").split()
> -    medadata_revs = ["%-17s = %s:%s" % (os.path.relpath(i,
> d.getVar('BBLAYERS_FETCH_DIR', True)), \ +    medadata_revs = ["%s\tlayer: 
> %s\n\tbranch: %s\n\tremote: %s\n\tHEAD:   %s\n" % ( \ +       
> base_get_metadata_git_remote(i, None), \
> +        os.path.relpath(i, d.getVar('BBLAYERS_FETCH_DIR', True)), \
>          base_get_metadata_git_branch(i, None).strip(), \
> +        base_get_metadata_git_remote_branch(i, None).strip(), \
>          base_get_metadata_git_revision(i, None)) \
>              for i in layers]
>      return '\n'.join(medadata_revs)
> diff --git a/meta/classes/metadata_scm.bbclass
> b/meta/classes/metadata_scm.bbclass index 0f7f423..31a2c54 100644
> --- a/meta/classes/metadata_scm.bbclass
> +++ b/meta/classes/metadata_scm.bbclass
> @@ -73,6 +73,15 @@ def base_get_metadata_git_branch(path, d):
>          rev = '<unknown>'
>      return rev.strip()
> 
> +def base_get_metadata_git_remote_branch(path, d):
> +    import bb.process
> +
> +    try:
> +        rev, _ = bb.process.run('git rev-parse --abbrev-ref
> --symbolic-full-name @{u}', cwd=path) +    except
> bb.process.ExecutionError:
> +        rev = '(HEAD does not point to a remote branch)'
> +    return rev.strip()
> +
>  def base_get_metadata_git_revision(path, d):
>      import bb.process
> 
> @@ -81,3 +90,12 @@ def base_get_metadata_git_revision(path, d):
>      except bb.process.ExecutionError:
>          rev = '<unknown>'
>      return rev.strip()
> +
> +def base_get_metadata_git_remote(path, d):
> +    import bb.process
> +
> +    try:
> +        lines, _ = bb.process.run('git remote -v', cwd=path)
> +    except bb.process.ExecutionError:
> +        return '<unknown>'
> +    return lines

As I mentioned in my other reply, metadata-revs was intended to be consumed by 
scripts rather than humans, so I'd rather not change its format unless 
absolutely necessary.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

