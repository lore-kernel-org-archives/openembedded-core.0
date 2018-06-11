Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8D01778A0A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 07:21:29 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5B7LPMf025946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 11 Jun 2018 08:21:26 +0100
Message-ID: <4c3a2b83203d7c07affbd12ff5300f11d516e002.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2018 08:21:25 +0100
In-Reply-To: <20180611015207.10465-2-anuj.mittal@intel.com>
References: <20180611015207.10465-1-anuj.mittal@intel.com>
	<20180611015207.10465-2-anuj.mittal@intel.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/2] bitbake-blayers/create: add LAYERSERIES_COMPAT
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
X-List-Received-Date: Mon, 11 Jun 2018 07:21:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-06-11 at 09:52 +0800, Anuj Mittal wrote:
> Derive the value for template layer.conf from core layer and add
> dependendency on it too.
> 
> Fixes [YOCTO #12767]
> 
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/lib/bblayers/create.py            | 2 +-
>  meta/lib/bblayers/templates/layer.conf | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/bblayers/create.py
> b/meta/lib/bblayers/create.py
> index c1923166fd..d9699b21f9 100644
> --- a/meta/lib/bblayers/create.py
> +++ b/meta/lib/bblayers/create.py
> @@ -44,7 +44,7 @@ class CreatePlugin(LayerPlugin):
>          shutil.copy(license_src, license_dst)
>  
>          # Create the layer.conf from templates/layer.conf
> -        layerconf_template = read_template('layer.conf') %
> (args.layerdir, args.layerdir, args.layerdir, args.priority)
> +        layerconf_template = read_template('layer.conf') %
> (args.layerdir, args.layerdir, args.layerdir, args.priority,
> args.layerdir, args.layerdir)
>          layerconf = os.path.join(conf, 'layer.conf')
>          with open(layerconf, 'w') as fd:
>              fd.write(layerconf_template)
> diff --git a/meta/lib/bblayers/templates/layer.conf
> b/meta/lib/bblayers/templates/layer.conf
> index 3c0300226c..61b3ad8db3 100644
> --- a/meta/lib/bblayers/templates/layer.conf
> +++ b/meta/lib/bblayers/templates/layer.conf
> @@ -8,3 +8,6 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
>  BBFILE_COLLECTIONS += "%s"
>  BBFILE_PATTERN_%s = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_%s = "%s"
> +
> +LAYERDEPENDS_%s = "core"
> +LAYERSERIES_COMPAT_%s = "${LAYERSERIES_COMPAT_core}"

I feel very strongly that we do not want to just copy and paste this
"follow core" value around. The template needs to contain an expanded
value so that when core changes, people need to update their layer to
say what they're compatible with.

Cheers,

Richard

