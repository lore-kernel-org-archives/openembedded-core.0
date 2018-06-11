Return-Path: <damien.riegel@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 63C7078BE9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 15:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E8EF79C1E63;
	Mon, 11 Jun 2018 11:12:46 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id Fi4iCGY0fqqj; Mon, 11 Jun 2018 11:12:46 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6890A9C209E;
	Mon, 11 Jun 2018 11:12:46 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id 3cfW80kGZXQq; Mon, 11 Jun 2018 11:12:46 -0400 (EDT)
Received: from workotop.localdomain (unknown [192.168.50.174])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 3C9189C1E63;
	Mon, 11 Jun 2018 11:12:46 -0400 (EDT)
Date: Mon, 11 Jun 2018 11:12:46 -0400
From: Damien Riegel <damien.riegel@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180611151246.pix7bmjnxvkaqtw4@workotop.localdomain>
References: <20180607144814.10678-1-damien.riegel@savoirfairelinux.com>
MIME-Version: 1.0
In-Reply-To: <20180607144814.10678-1-damien.riegel@savoirfairelinux.com>
User-Agent: NeoMutt/20180512
Subject: Re: [PATCH v2] populate_sdk_ext.bbclass: fix corebase identification
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
X-List-Received-Date: Mon, 11 Jun 2018 15:12:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Richard, what's your opinion on this v2? It fixes the issue I have while
addressing the concern you had about the v1.

-- 
Damien

On Thu, Jun 07, 2018 at 10:48:14AM -0400, Damien Riegel wrote:
> When generating the extended SDK, there is a copy step where this class
> goes through the layers and other stuff that have been copied to
> generate the SDK. The corebase; ie. the folder that contains the core
> layer 'meta' is treated in a special way. Unfortunately in our tree, we
> have:
> 
>   sources/meta/meta
>            |     `- core layer
>            `------- corebase
> 
> In populate_sdk_ext's copy_buildsystem, the heuristic to determine which
> element of the list returned by copy_bitbake_and_layers is corebase is
> fooled by such layout.
> 
> In copy_bitbake_and_layers, corebase is already handled specifically and
> reliably, so we should let that function tell us which folder is
> corebase instead of trying to determine it.
> 
> To do so, change the return type of copy_bitbake_and_layers to a tuple
> that contains (corebase, copied_layers). It also simplifies the code on
> the caller side.
> 
> Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
> ---
> Changes in v2:
>  - move the logic in copy_bitbake_and_layers
> 
>  meta/classes/populate_sdk_ext.bbclass | 12 +++---------
>  meta/lib/oe/copy_buildsystem.py       |  8 +++++---
>  2 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
> index 2dd21237e2..cc3f5d0e50 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -202,15 +202,9 @@ python copy_buildsystem () {
>          workspace_name = 'orig-workspace'
>      else:
>          workspace_name = None
> -    layers_copied = buildsystem.copy_bitbake_and_layers(baseoutpath + '/layers', workspace_name)
> -
> -    sdkbblayers = []
> -    corebase = os.path.basename(d.getVar('COREBASE'))
> -    for layer in layers_copied:
> -        if corebase == os.path.basename(layer):
> -            conf_bbpath = os.path.join('layers', layer, 'bitbake')
> -        else:
> -            sdkbblayers.append(layer)
> +
> +    corebase, sdkbblayers = buildsystem.copy_bitbake_and_layers(baseoutpath + '/layers', workspace_name)
> +    conf_bbpath = os.path.join('layers', corebase, 'bitbake')
>  
>      for path in os.listdir(baseoutpath + '/layers'):
>          relpath = os.path.join('layers', path, oe_init_env_script)
> diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
> index ac2fae1ed1..05f65ac632 100644
> --- a/meta/lib/oe/copy_buildsystem.py
> +++ b/meta/lib/oe/copy_buildsystem.py
> @@ -26,6 +26,7 @@ class BuildSystem(object):
>  
>      def copy_bitbake_and_layers(self, destdir, workspace_name=None):
>          # Copy in all metadata layers + bitbake (as repositories)
> +        copied_corebase = None
>          layers_copied = []
>          bb.utils.mkdirhier(destdir)
>          layers = list(self.layerdirs)
> @@ -84,17 +85,18 @@ class BuildSystem(object):
>  
>              layer_relative = os.path.relpath(layerdestpath,
>                                               destdir)
> -            layers_copied.append(layer_relative)
> -
>              # Treat corebase as special since it typically will contain
>              # build directories or other custom items.
>              if corebase == layer:
> +                copied_corebase = layer_relative
>                  bb.utils.mkdirhier(layerdestpath)
>                  for f in corebase_files:
>                      f_basename = os.path.basename(f)
>                      destname = os.path.join(layerdestpath, f_basename)
>                      _smart_copy(f, destname)
>              else:
> +                layers_copied.append(layer_relative)
> +
>                  if os.path.exists(layerdestpath):
>                      bb.note("Skipping layer %s, already handled" % layer)
>                  else:
> @@ -140,7 +142,7 @@ class BuildSystem(object):
>                  layers_copied.remove(layer)
>                  break
>  
> -        return layers_copied
> +        return copied_corebase, layers_copied
>  
>  def generate_locked_sigs(sigfile, d):
>      bb.utils.mkdirhier(os.path.dirname(sigfile))
> -- 
> 2.17.0
> 

