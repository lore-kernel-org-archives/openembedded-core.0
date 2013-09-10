Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E2C0C61614
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 08:55:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8A8tHH9011900
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 01:55:17 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 10 Sep 2013 01:55:17 -0700
Message-ID: <522EDE9D.5080406@windriver.com>
Date: Tue, 10 Sep 2013 16:55:57 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1366631550-12726-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1366631550-12726-1-git-send-email-otavio@ossystems.com.br>
X-Originating-IP: [128.224.162.233]
Subject: Re: [PATCH] udev-extraconf: Avoid mounting unknown filesystems
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
X-List-Received-Date: Tue, 10 Sep 2013 08:55:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Otavio,

This patch caused a new bug. So I'm afraid maybe this patch is not 
totally correct.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4487

The problem is that for a cdrom device, there's no ID_FS_TYPE.
Any idea?

Besides, could you please detail a little about what problem this patch 
is trying to solve?
Which kernel version is involved?

Best Regards,
Chen Qi


On 04/22/2013 07:52 PM, Otavio Salvador wrote:
> Depending on kernel version used, the system can hung when trying to
> mount the extended partition (not the logical one) as it is a holder
> for other partitions and does not have a filesystem in it.
>
> To avoid this to happen we just mount partitions when these are using
> known filesystems so it does not try to mount a partition for an
> unsupported filesystem.
>
> Reported-by: Vladan Jovanovic <vladan.jovanovic@gmail.com>
> Reported-by: Leonardo Sandoval Gonzalez <b42214@freescale.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> Tested-by: Vladan Jovanovic <vladan.jovanovic@gmail.com>
> ---
>   meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
> index 97af608..d1419ed 100644
> --- a/meta/recipes-core/udev/udev-extraconf/mount.sh
> +++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
> @@ -47,7 +47,7 @@ rm_dir() {
>   	fi
>   }
>   
> -if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ]; then
> +if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" ]; then
>   	if [ -x "$PMOUNT" ]; then
>   		$PMOUNT $DEVNAME 2> /dev/null
>   	elif [ -x $MOUNT ]; then


