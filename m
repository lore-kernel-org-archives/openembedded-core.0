Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2047E71E21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 19:44:20 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 13 Dec 2016 11:44:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="41977338"
Received: from oshau-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.66])
	by orsmga005.jf.intel.com with ESMTP; 13 Dec 2016 11:44:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Wed, 14 Dec 2016 08:44:16 +1300
Message-ID: <1976647.jAKzAtoRFl@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.12-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1481648749-25726-1-git-send-email-ed.bartosh@linux.intel.com>
References: <CAJTo0LaODS73GuCL0z9Sz49EnQ5GiZF6FdJ+KHOUiCdfEhZJfQ@mail.gmail.com>
	<1481648749-25726-1-git-send-email-ed.bartosh@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] populate_sdk_ext: get NATIVELSBSTRING variable
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
X-List-Received-Date: Tue, 13 Dec 2016 19:44:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ed,

On Tue, 13 Dec 2016 19:05:49 Ed Bartosh wrote:
> Setting fixedlsbstring to 'universal' can break populate_sdk_ext
> task as NATIVELSBSTRING can be set to universal-<gcc version> in
> some cases.
> 
> Getting NATIVELSBSTRING value using getVar should fix this.
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/populate_sdk_ext.bbclass
> b/meta/classes/populate_sdk_ext.bbclass index 3c3a73c..6ef48c0 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -374,8 +374,8 @@ python copy_buildsystem () {
> 
>      sstate_out = baseoutpath + '/sstate-cache'
>      bb.utils.remove(sstate_out, True)
> -    # uninative.bbclass sets NATIVELSBSTRING to 'universal'
> -    fixedlsbstring = 'universal'
> +
> +    fixedlsbstring = d.getVar('NATIVELSBSTRING', True)
> 
>      sdk_include_toolchain = (d.getVar('SDK_INCLUDE_TOOLCHAIN', True) ==
> '1') sdk_ext_type = d.getVar('SDK_EXT_TYPE', True)

Have you tested this with OE-Core alone or any other configuration where 
uninative is not enabled? I suspect it won't work with that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

