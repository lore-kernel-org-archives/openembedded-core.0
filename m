Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3877039F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 23:49:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Jul 2014 16:43:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,661,1400050800"; d="scan'208";a="573115364"
Received: from unknown (HELO [10.255.13.46]) ([10.255.13.46])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2014 16:48:38 -0700
Message-ID: <53C46C56.1090702@linux.intel.com>
Date: Mon, 14 Jul 2014 16:48:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1405319307.git.Qi.Chen@windriver.com>
	<c36d415106e1210c21f520017b52b0ce84e064f3.1405319307.git.Qi.Chen@windriver.com>
In-Reply-To: <c36d415106e1210c21f520017b52b0ce84e064f3.1405319307.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 2/2] base-files: stage the /home directory
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
X-List-Received-Date: Mon, 14 Jul 2014 23:49:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/13/2014 11:31 PM, Chen Qi wrote:
> The /home directory might be needed by packages that inherit useradd.bbclass.
> One example is the 'xuser-account' recipe.
>
> Previously, we patched the shadow package to change the behaviour of the
> '--create-home' option. This is not appropriate. Instead, we should let
> the base-files package also stage the /home directory.
>
Why is this not appropriate, we had been doing it in the past. I believe 
that we do not want to stage a /home dir that will never be used, so 
having it staged by default does not make sense.

Sau!

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-core/base-files/base-files_3.0.14.bb |    6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index 6d76a2b..fe82d20 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -138,6 +138,12 @@ do_install_append_linuxstdbase() {
>           done
>   }
>
> +sysroot_stage_home () {
> +	sysroot_stage_dir ${D}/home ${SYSROOT_DESTDIR}/home
> +}
> +
> +SYSROOT_PREPROCESS_FUNCS = "sysroot_stage_home"
> +
>   PACKAGES = "${PN}-doc ${PN} ${PN}-dev ${PN}-dbg"
>   FILES_${PN} = "/"
>   FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
>

