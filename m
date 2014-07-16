Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABCF7059E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:43:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Jul 2014 09:42:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,673,1400050800"; d="scan'208";a="574166839"
Received: from unknown (HELO [10.255.12.224]) ([10.255.12.224])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2014 09:42:29 -0700
Message-ID: <53C6AB75.70909@linux.intel.com>
Date: Wed, 16 Jul 2014 09:42:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Shan Hai <shan.hai@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1405491353-23636-1-git-send-email-shan.hai@windriver.com>
In-Reply-To: <1405491353-23636-1-git-send-email-shan.hai@windriver.com>
Subject: Re: [PATCH] grub-core: fix endianness problem
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
X-List-Received-Date: Wed, 16 Jul 2014 16:43:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2014 11:15 PM, Shan Hai wrote:
> Fix tftp stalls on loading files bigger than ~32k bug by cherry picking
> a patch from grub upstream.
>
> Upstream-Status: Backport
>

> Signed-off-by: Shan Hai <shan.hai@windriver.com>
> ---
>   .../grub/grub-2.00/fix-endianness-problem.patch    | 46 ++++++++++++++++++++++
>   meta/recipes-bsp/grub/grub_2.00.bb                 |  1 +
>   2 files changed, 47 insertions(+)
>   create mode 100644 meta/recipes-bsp/grub/grub-2.00/fix-endianness-problem.patch
>
> diff --git a/meta/recipes-bsp/grub/grub-2.00/fix-endianness-problem.patch b/meta/recipes-bsp/grub/grub-2.00/fix-endianness-problem.patch
> new file mode 100644
> index 0000000..bb5ba9b
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/grub-2.00/fix-endianness-problem.patch
> @@ -0,0 +1,46 @@
> +grub-core/net/tftp.c: fix endianness problem.
> +
> +	* grub-core/net/tftp.c (ack): Fix endianness problem.
> +	(tftp_receive): Likewise.
> +	Reported by: Michael Davidsaver.
> +
> +Upstream-Status: Submitted [grub-devel@gnu.org]
> +

Is this patch a backport from the upstream or submitted only on the 
mailing list?

Sau!


> +Signed-off-by: Vladimir 'phcoder' Serbinenko <phcoder@gmail.com>
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index 81bdae9..c2f42d5 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,9 @@
> ++2012-07-02  Vladimir Serbinenko  <phcoder@gmail.com>
> ++
> ++	* grub-core/net/tftp.c (ack): Fix endianness problem.
> ++	(tftp_receive): Likewise.
> ++	Reported by: Michael Davidsaver.
> ++
> + 2012-06-27  Vladimir Serbinenko  <phcoder@gmail.com>
> +
> + 	* configure.ac: Bump version to 2.00.
> +diff --git a/grub-core/net/tftp.c b/grub-core/net/tftp.c
> +index 9c70efb..d0f39ea 100644
> +--- a/grub-core/net/tftp.c
> ++++ b/grub-core/net/tftp.c
> +@@ -143,7 +143,7 @@ ack (tftp_data_t data, grub_uint16_t block)
> +
> +   tftph_ack = (struct tftphdr *) nb_ack.data;
> +   tftph_ack->opcode = grub_cpu_to_be16 (TFTP_ACK);
> +-  tftph_ack->u.ack.block = block;
> ++  tftph_ack->u.ack.block = grub_cpu_to_be16 (block);
> +
> +   err = grub_net_send_udp_packet (data->sock, &nb_ack);
> +   if (err)
> +@@ -225,7 +225,7 @@ tftp_receive (grub_net_udp_socket_t sock __attribute__ ((unused)),
> + 	    grub_priority_queue_pop (data->pq);
> +
> + 	    if (file->device->net->packs.count < 50)
> +-	      err = ack (data, tftph->u.data.block);
> ++	      err = ack (data, data->block + 1);
> + 	    else
> + 	      {
> + 		file->device->net->stall = 1;
> diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
> index 72ed402..36c648e 100644
> --- a/meta/recipes-bsp/grub/grub_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub_2.00.bb
> @@ -22,6 +22,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>             file://check-if-liblzma-is-disabled.patch \
>             file://fix-issue-with-flex-2.5.37.patch \
>             file://grub-2.00-add-oe-kernel.patch \
> +          file://fix-endianness-problem.patch \
>             "
>
>   SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
>

