Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 241B365C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 16:01:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 13 Oct 2015 09:01:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,678,1437462000"; d="scan'208";a="663509563"
Received: from porlows1-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.182])
	by orsmga003.jf.intel.com with ESMTP; 13 Oct 2015 09:01:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Oct 2015 17:01:06 +0100
Message-ID: <1854639.UYInMFZv0A@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.8-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1444750177-22377-1-git-send-email-otavio@ossystems.com.br>
References: <1444750177-22377-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH] lib/oe/image.py: Fix dependency handling for compressed types
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
X-List-Received-Date: Tue, 13 Oct 2015 16:01:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 13 October 2015 12:29:37 Otavio Salvador wrote:
> The dependency code needs to also include the dependency of base
> types. For example:
> 
>  - sdcard.gz image with ext4
> 
> The dependency chain needs to include:
> 
>  - sdcard
>  - ext4
>  - gz
> 
> Until this change, the ext4 dependency were not being taken into
> account when using the compressed one.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  meta/lib/oe/image.py | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
> index b0d81a6..b9eb3de 100644
> --- a/meta/lib/oe/image.py
> +++ b/meta/lib/oe/image.py
> @@ -54,14 +54,16 @@ class ImageDepGraph(object):
>              base_type = self._image_base_type(node)
>              deps = (self.d.getVar('IMAGE_TYPEDEP_' + node, True) or "")
>              base_deps = (self.d.getVar('IMAGE_TYPEDEP_' + base_type, True)
> or "") -            if deps != "" or base_deps != "":
> -                graph[node] = deps
> -
> -                for dep in deps.split() + base_deps.split():
> -                    if not dep in graph:
> -                        add_node(dep)
> -            else:
> -                graph[node] = ""
> +
> +            graph[node] = ""
> +            for dep in deps.split() + base_deps.split():
> +                if not dep in graph[node]:
> +                    if graph[node] != "":
> +                        graph[node] += " "
> +                    graph[node] += dep
> +
> +                if not dep in graph:
> +                    add_node(dep)
> 
>          for fstype in image_fstypes:
>              add_node(fstype)

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre

