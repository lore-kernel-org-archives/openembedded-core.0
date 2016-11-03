Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE1571AEC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 20:22:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 03 Nov 2016 13:22:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,440,1473145200"; d="scan'208";a="782104062"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.38])
	([10.219.5.38])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2016 13:22:31 -0700
To: Adrian Dudau <adrian.dudau@enea.com>,
	openembedded-core@lists.openembedded.org
References: <1478179081-34596-1-git-send-email-adrian.dudau@enea.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <871ee446-6301-06e4-6ec1-f8231901bf5f@linux.intel.com>
Date: Thu, 3 Nov 2016 14:27:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1478179081-34596-1-git-send-email-adrian.dudau@enea.com>
Subject: Re: [krogoth][PATCH 1/2] qemu: Security fix CVE-2016-4439
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
X-List-Received-Date: Thu, 03 Nov 2016 20:22:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Adrian,


On 11/03/2016 07:18 AM, Adrian Dudau wrote:
> affects qemu < 2.7.0
>
> Quick Emulator(Qemu) built with the ESP/NCR53C9x controller emulation
> support is vulnerable to an OOB write access issue. The controller uses
> 16-byte FIFO buffer for command and data transfer. The OOB write occurs
> while writing to this command buffer in routine get_cmd().
>
> A privileged user inside guest could use this flaw to crash the Qemu
> process resulting in DoS.
>
> References:
> ----------
> http://www.openwall.com/lists/oss-security/2016/05/19/4
> https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2016-4441
>
> Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
> ---
>   .../recipes-devtools/qemu/qemu/CVE-2016-4441.patch | 78 ++++++++++++++++++++++
>   meta/recipes-devtools/qemu/qemu_2.5.0.bb           |  1 +
>   2 files changed, 79 insertions(+)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4441.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-4441.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-4441.patch
> new file mode 100644
> index 0000000..3cbe394
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2016-4441.patch
> @@ -0,0 +1,78 @@
> +From 6c1fef6b59563cc415f21e03f81539ed4b33ad90 Mon Sep 17 00:00:00 2001
> +From: Prasad J Pandit <pjp@fedoraproject.org>
> +Date: Thu, 19 May 2016 16:09:31 +0530
> +Subject: [PATCH] esp: check dma length before reading scsi command(CVE-2016-4441)
> +
> +The 53C9X Fast SCSI Controller(FSC) comes with an internal 16-byte
> +FIFO buffer. It is used to handle command and data transfer.
> +Routine get_cmd() uses DMA to read scsi commands into this buffer.
> +Add check to validate DMA length against buffer size to avoid any
> +overrun.
> +
> +Fixes CVE-2016-4441.
> +

Correct or include the CVE tag on cve patch with format:'CVE: CVE-YYYY-XXXX'


