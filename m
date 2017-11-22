Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EA88578690
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 20:51:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAMKpuYK022382
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Nov 2017 12:51:56 -0800 (PST)
Received: from server.local (128.224.21.97) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 22 Nov 2017 12:51:56 -0800
To: Saul Wold <sgw@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
References: <20171122184724.21416-1-sgw@linux.intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <3a0e2cdc-ca8c-07ba-e27d-701e3e4f6154@windriver.com>
Date: Wed, 22 Nov 2017 15:51:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171122184724.21416-1-sgw@linux.intel.com>
Subject: Re: [PATCH] kernel.bbclass: Add cleandirs for do_shared_workdir
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
X-List-Received-Date: Wed, 22 Nov 2017 20:51:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-11-22 1:47 PM, Saul Wold wrote:
> Ensure we have a clean and empty STAGING_KERNEL_BUILDDIR (kernel-build-artifacts)
> before creating it, otherwise there might be older artifacts from a prior
> kernel build.
> 

What's the actual error that this triggers ? It would be nice to
log it here in the commit message .. or at least a description
of the symptoms.

> [YOCTO #11880]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/classes/kernel.bbclass | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 756707a3c25..2a0a7707a14 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -400,6 +400,7 @@ emit_depmod_pkgdata() {
>   
>   PACKAGEFUNCS += "emit_depmod_pkgdata"
>   
> +do_shared_workdir[cleandirs] += " ${STAGING_KERNEL_BUILDDIR}"
>   do_shared_workdir () {
>   	cd ${B}
>   
> @@ -655,8 +656,6 @@ kernel_do_deploy() {
>   		fi
>   	done
>   }
> -do_deploy[cleandirs] = "${DEPLOYDIR}"
> -do_deploy[dirs] = "${DEPLOYDIR} ${B}"

This isn't clear to me. Why does cleaning the STAGING_KERNEL_BUILDDIR
as part of the do_shared_workdir mean that we no longer need the
clean before the deploy (as well as the deploy dir).

Bruce

>   do_deploy[prefuncs] += "package_get_auto_pr"
>   
>   addtask deploy after do_populate_sysroot do_packagedata
> 


