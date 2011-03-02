Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PuuUD-0006ZA-3o
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 23:25:37 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PuuSn-0000ba-1c from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 14:24:09 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 2 Mar 2011 14:24:08 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Wed, 2 Mar 2011 14:24:08 -0800
Message-ID: <4D6EC374.6040709@mentor.com>
Date: Wed, 2 Mar 2011 15:23:48 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
	<1299055045-8096-8-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1299055045-8096-8-git-send-email-raj.khem@gmail.com>
X-OriginalArrivalTime: 02 Mar 2011 22:24:08.0728 (UTC)
	FILETIME=[8C610980:01CBD928]
Subject: Re: [PATCH v2 7/7] sanity.bbclass: Check for	/proc/sys/vm/mmap_min_addr to be >= 65536
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Mar 2011 22:25:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2011 01:37 AM, Khem Raj wrote:
> * Now qemu can handle lower values we can chnage this sanity test
>    to check of values if less than 65536
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/classes/sanity.bbclass |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 13940f8..4fba852 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -171,8 +171,8 @@ def check_sanity(e):
>           try:
>               if os.path.exists("/proc/sys/vm/mmap_min_addr"):
>                   f = file("/proc/sys/vm/mmap_min_addr", "r")
> -                if (f.read().strip() != "0"):
> -                        messages = messages + "/proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 0 in /etc/sysctl.conf.\n"
> +                if (int(f.read().strip())<  65536):
> +                        messages = messages + "/proc/sys/vm/mmap_min_addr is not>= 65536. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 65536 in /etc/sysctl.conf.\n"
>                   f.close()
>           except:
>               pass

Does this work or fail in the case where the file is unreadable?  IIRC 
that's the case in certain cases.

-- 
Tom Rini
Mentor Graphics Corporation


