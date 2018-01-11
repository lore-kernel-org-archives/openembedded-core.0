Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 32B5B71B69
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 15:29:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jan 2018 07:29:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,345,1511856000"; 
   d="scan'208";a="9990126"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 11 Jan 2018 07:29:17 -0800
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180111151834.4169-1-ross.burton@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ca739de3-59f6-e215-8ea5-8cbaf785cf18@linux.intel.com>
Date: Thu, 11 Jan 2018 17:29:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20180111151834.4169-1-ross.burton@intel.com>
Subject: Re: [PATCH] image: use du --apparent-size when calculating rootfs size
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
X-List-Received-Date: Thu, 11 Jan 2018 15:29:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/11/2018 05:18 PM, Ross Burton wrote:
> We should pass --apparent-size to du when calculating how large the rootfs is as
> otherwise we get the actual disk usage, which if the files are compressed by the
> file system (such as ZFS) may be sufficiently smaller than the space required by
> the image that construction will fail.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/classes/image.bbclass | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 4531aa2a57a..8e763e4d543 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -534,6 +534,7 @@ def get_rootfs_size(d):
>       initramfs_maxsize = d.getVar('INITRAMFS_MAXSIZE')
>   
>       output = subprocess.check_output(['du', '-ks',
> +                                      '--apparent-size',
>                                         d.getVar('IMAGE_ROOTFS')])
>       size_kb = int(output.split()[0])

Exactly same patch from Maxin caused failures previously, no?

Alex

