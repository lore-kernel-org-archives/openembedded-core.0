Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4145B72682
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Dec 2014 08:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBO8jmXc028357; Wed, 24 Dec 2014 08:45:48 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id G2Bhedcoqc-n; Wed, 24 Dec 2014 08:45:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBO8jWfF028332
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 24 Dec 2014 08:45:43 GMT
Message-ID: <1419410769.6428.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 24 Dec 2014 08:46:09 +0000
In-Reply-To: <1418159277-3620-1-git-send-email-otavio@ossystems.com.br>
References: <1418159277-3620-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] image_types.bbclass: Respect IMAGE_TYPEDEP dependencies
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
X-List-Received-Date: Wed, 24 Dec 2014 08:46:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-12-09 at 19:07 -0200, Otavio Salvador wrote:
> The IMAGE_TYPEDEP dependencies also need to be taken into account when
> building an IMAGE_FSTYPE.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/image_types.bbclass | 2 ++
>  1 file changed, 2 insertions(+)

According to my tests, something in this patch series is causing:

https://autobuilder.yoctoproject.org/main/builders/minnow/builds/137/steps/BuildImages/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/minnow-lsb/builds/138/steps/BuildImages/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-x86/builds/137/steps/BuildImages_1/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/builds/138/steps/BuildImages_1/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/138/steps/BuildImages_1/logs/stdio

I could reproduce locally just by building anything with a live image
type and executing do_bootimg. It appears the ".gz" version of the
initramfs isn't created. You have to force stamps to get the code to
rerun.

Cheers,

Richard

> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 9aee745..24e4bbb 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -21,6 +21,8 @@ def imagetypes_getdepends(d):
>                  basetype = type[:-len("." + ctype)]
>                  adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype, True), deps)
>                  break
> +        for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype, True) or "").split():
> +            adddep(d.getVar('IMAGE_DEPENDS_%s' % typedepends, True) , deps)
>          adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype, True) , deps)
>  
>      depstr = ""



