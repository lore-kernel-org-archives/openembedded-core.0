Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 74963755A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 08:53:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6P8reOD012530
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 01:53:56 -0700 (PDT)
Received: from [128.224.162.161] (128.224.162.161) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 25 Jul 2018 01:53:51 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1532507399.git.liezhi.yang@windriver.com>
	<6c7e807f1f1369aa865201b4678a1764ab6c1ef1.1532507399.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <23ad59e9-6407-89b3-81d9-a1fb54ad87e5@windriver.com>
Date: Wed, 25 Jul 2018 16:53:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <6c7e807f1f1369aa865201b4678a1764ab6c1ef1.1532507399.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 2/3] runqemu: default qemumips memory to 256M
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
X-List-Received-Date: Wed, 25 Jul 2018 08:53:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sorry, please ignore this one, it had been fixed by:

commit c68e4c6e3eb612bb7afd9d7f1e9a6dc295d44346
Author: He Zhe <zhe.he@windriver.com>
Date:   Sun Jul 8 20:14:43 2018 -0700

     scripts/runqemu: fix qemumips qemumips64 memory detection kernel panic


I removed it from repo.

// Robert

On 07/25/2018 04:34 PM, Robert Yang wrote:
> The qemumips or qemumips64 can't be boot with 512M.
> 
> *Fixed when no QB_MEM is set:
>   - runqemu qemumips nographic core-image-minimal
> [    0.000000] Call Trace:
> [    0.000000] [<8011c010>] clear_page+0x0/0x128
> [    0.000000] [<8022b818>] get_page_from_freelist+0xa1c/0xb48
> [    0.000000] [<8022c00c>] __alloc_pages_nodemask+0xd8/0xf0c
> [    0.000000] [<8022ce58>] __get_free_pages+0x18/0x60
> [    0.000000] [<80118674>] setup_zero_pages+0x1c/0x98
> [    0.000000] [<80bd23e4>] mem_init+0x44/0x54
> [    0.000000] [<80bca964>] start_kernel+0x20c/0x4bc
> [    0.000000] [<80920090>] kernel_entry+0x0/0x40
> [    0.000000] Code: 00000000  00000000  00000000 <34860f80> cc9e0000  cc9e0010  cc9e0020  cc9e0030  cc9e0040
> [    0.000000]
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task!
> 
> [YOCTO #11521]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   scripts/runqemu | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 73d7d58..7a13e5d 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -665,8 +665,13 @@ class BaseConfig(object):
>           if s:
>               self.set('QB_MEM', '-m %s' % s.group(1))
>           elif not self.get('QB_MEM'):
> -            logger.info('QB_MEM is not set, use 512M by default')
> -            self.set('QB_MEM', '-m 512')
> +            mach = self.get('MACHINE')
> +            if mach.startswith('qemumips'):
> +                logger.info('QB_MEM is not set, use 256M by default')
> +                self.set('QB_MEM', '-m 256')
> +            else:
> +                logger.info('QB_MEM is not set, use 512M by default')
> +                self.set('QB_MEM', '-m 512')
>   
>           mach = self.get('MACHINE')
>           if not mach.startswith('qemumips'):
> 

