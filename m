Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6ABC66FA59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 17:53:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Mar 2014 10:52:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,704,1389772800"; d="scan'208";a="496962814"
Received: from unknown (HELO [10.255.12.230]) ([10.255.12.230])
	by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2014 10:52:51 -0700
Message-ID: <1395424371.25867.76.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: =?ISO-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Date: Fri, 21 Mar 2014 12:52:51 -0500
In-Reply-To: <1395158745-9424-2-git-send-email-joaohf@gmail.com>
References: <1395158745-9424-1-git-send-email-joaohf@gmail.com>
	<1395158745-9424-2-git-send-email-joaohf@gmail.com>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: Add SD/MMC-Cards support to '--ondisk' param
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
X-List-Received-Date: Fri, 21 Mar 2014 17:53:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2014-03-18 at 13:05 -0300, João Henrique Ferreira de Freitas
wrote:
> The special case when wic is set up to use SD/MMC-Cards in place
> of sdX disks is not handled properly.
> 
> Append 'p' to the rootdev when disk is SD/MMC-Cards fix this situation.

This is missing your Signed-off-by.  Other than that,

Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>

> ---
>  scripts/lib/mic/imager/direct.py | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
> index f8c300c..1f2f8fc 100644
> --- a/scripts/lib/mic/imager/direct.py
> +++ b/scripts/lib/mic/imager/direct.py
> @@ -345,10 +345,14 @@ class DirectImageCreator(BaseImageCreator):
>          parts = self._get_parts()
>          for num, p in enumerate(parts, 1):
>              if p.mountpoint == "/":
> +                part = ''
> +                if p.disk.startswith('mmcblk'):
> +                    part = 'p'
> +
>                  if self._ptable_format == 'msdos' and num > 3:
> -                    rootdev = "/dev/%s%-d" % (p.disk, num + 1)
> +                    rootdev = "/dev/%s%s%-d" % (p.disk, part, num + 1)
>                  else:
> -                    rootdev = "/dev/%s%-d" % (p.disk, num)
> +                    rootdev = "/dev/%s%s%-d" % (p.disk, part, num)
>                  root_part_uuid = p.part_type
>  
>          return (rootdev, root_part_uuid)
> -- 
> 1.8.3.2
> 



