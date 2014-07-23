Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 7048F65CF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 19:59:08 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Jul 2014 12:59:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,719,1400050800"; d="scan'208";a="460568558"
Received: from unknown (HELO [10.255.12.245]) ([10.255.12.245])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2014 12:59:07 -0700
Message-ID: <1406145547.6335.37.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Date: Wed, 23 Jul 2014 14:59:07 -0500
In-Reply-To: <1405978453-16554-2-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1405978453-16554-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1405978453-16554-2-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] wic: --fsoptions handling
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
X-List-Received-Date: Wed, 23 Jul 2014 19:59:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-07-21 at 23:34 +0200, Maciej Borzecki wrote:
> Add handling of --fsoptions in parition definition. Default value of
> mount option is 'defaults', all user defined options are appended.
> 
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> ---
>  scripts/lib/mic/imager/direct.py | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
> index beae372..024cd09 100644
> --- a/scripts/lib/mic/imager/direct.py
> +++ b/scripts/lib/mic/imager/direct.py
> @@ -113,7 +113,14 @@ class DirectImageCreator(BaseImageCreator):
>                  device_name = "/dev/" + p.disk + str(num + 1)
>              else:
>                  device_name = "/dev/" + p.disk + str(num)
> -            fstab_entry = device_name + "\t" + p.mountpoint + "\t" + p.fstype + "\tdefaults\t0\t0\n"
> +            opts = "defaults"
> +            if p.fsopts:
> +                opts += ","
> +                opts += p.fsopts

This is better than the hard-coded 'defaults' there now, but shouldn't
the logic be more like 'if the user specifies --fsoptions, use only
those directly, otherwise use the default 'defaults'?

IOW, if users want to append to 'defaults' they can do it themselves in
the --fsoptions they specify.  Otherwise, there's no way for a user to
specify their own options without 'defaults'.

Tom

> +            fstab_entry = device_name + "\t" + \
> +                          p.mountpoint + "\t" + \
> +                          p.fstype + "\t" + \
> +                          opts + "\t0\t0\n"
>              fstab_lines.append(fstab_entry)
>  
>      def _write_fstab(self, fstab, fstab_lines):



