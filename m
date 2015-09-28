Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF93755F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 13:48:41 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 28 Sep 2015 06:48:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,602,1437462000"; d="scan'208";a="569820041"
Received: from blavenax-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.21.166])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Sep 2015 06:48:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Date: Mon, 28 Sep 2015 14:48:35 +0100
Message-ID: <2936022.hqFWI3dATu@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.6-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1443095587-13852-11-git-send-email-markus.lehtonen@linux.intel.com>
References: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1443095587-13852-11-git-send-email-markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 10/10] devtool: modify: make bitbake use local files from srctree
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
X-List-Received-Date: Mon, 28 Sep 2015 13:48:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Markus,

On Thursday 24 September 2015 14:53:07 Markus Lehtonen wrote:
> This change makes it possible to have local files (non-remote SRC_URI
> files, i.e. files that are located in the "recipe space") under the
> srctree even if S!=WORKDIR. The files must be placed under the
> 'local-files' subdirectory.
> 
> Complements the previous patch that imports local files into srctree.
> 
> [YOCTO #7602]
> 
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  scripts/lib/devtool/standard.py | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py index 6b85c8c..78b0d27 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -558,8 +558,13 @@ def modify(args, config, basepath, workspace):
>      if not os.path.exists(appendpath):
>          os.makedirs(appendpath)
>      with open(appendfile, 'w') as f:
> -        f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n\n')
> -        f.write('inherit externalsrc\n')
> +        f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n')
> +        # Local files can be modified/tracked in separate subdir under
> srctree +        # Mostly useful for packages with S != WORKDIR
> +        f.write('FILESPATH_prepend := "%s:"\n' %
> +                os.path.join(srctree, 'local-files'))

Shouldn't this directory be named "oe-local-files"?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

