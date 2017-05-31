Return-Path: <california.l.sullivan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8D81178072
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 00:10:49 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 May 2017 17:10:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,420,1491289200"; d="scan'208";a="107271727"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga005.jf.intel.com with ESMTP; 30 May 2017 17:10:51 -0700
To: openembedded-core@lists.openembedded.org
References: <1495474501-10841-1-git-send-email-california.l.sullivan@intel.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <ee1c6e65-f2f1-4873-48ed-0b5e57f293ef@intel.com>
Date: Tue, 30 May 2017 17:10:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1495474501-10841-1-git-send-email-california.l.sullivan@intel.com>
Cc: akuster@mvista.com
Subject: Re: [PATCH] systemd-boot.bbclass: Add configuration data to secondary EFI partition
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
X-List-Received-Date: Wed, 31 May 2017 00:10:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

It looks like this was accepted on master. Would it be possible to 
backport this fix to pyro as well?

Thanks,
Cal

On 05/22/2017 10:35 AM, California Sullivan wrote:
> The secondary EFI partition is used when booting in EFI mode, and
> without the configuration data we don't get any boot targets.
>
> Partial fix to [YOCTO #11503].
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
>   meta/classes/systemd-boot.bbclass | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
> index 4e69a2c..9597759 100644
> --- a/meta/classes/systemd-boot.bbclass
> +++ b/meta/classes/systemd-boot.bbclass
> @@ -50,6 +50,7 @@ efi_iso_populate() {
>           efi_populate $iso_dir
>           mkdir -p ${EFIIMGDIR}/${EFIDIR}
>           cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
> +        cp -r $iso_dir/loader ${EFIIMGDIR}
>           cp $iso_dir/vmlinuz ${EFIIMGDIR}
>           EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
>           echo "fs0:${EFIPATH}\\${DEST_EFI_IMAGE}" > ${EFIIMGDIR}/startup.nsh


