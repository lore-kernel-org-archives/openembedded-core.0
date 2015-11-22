Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A92E46010D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Nov 2015 09:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tAM9XSpm026157; Sun, 22 Nov 2015 09:33:28 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id T7pEYv2wivcK; Sun, 22 Nov 2015 09:33:28 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tAM9XDao026148
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 22 Nov 2015 09:33:24 GMT
Message-ID: <1448184793.27882.32.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ming Liu <liu.ming50@gmail.com>
Date: Sun, 22 Nov 2015 09:33:13 +0000
In-Reply-To: <1448142950-5321-1-git-send-email-liu.ming50@gmail.com>
References: <1448142950-5321-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] initscripts: do not save timestamp for readonly system
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
X-List-Received-Date: Sun, 22 Nov 2015 09:33:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2015-11-21 at 22:55 +0100, Ming Liu wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> 
> To avoid reporting errors for /etc/timestamp is not writeable in a
> readonly system.
> 
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
> index b038fc5..0f7aa20 100644
> --- a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
> @@ -9,5 +9,7 @@
>  # Description:       
>  ### END INIT INFO
>  
> -# Update the timestamp
> -date -u +%4Y%2m%2d%2H%2M%2S > /etc/timestamp
> +# Update the timestamp for non-readonly system
> +[ -f /etc/default/rcS ] && . /etc/default/rcS
> +
> +[ "$ROOTFS_READ_ONLY" = "no" ] && date -u +%4Y%2m%2d%2H%2M%2S > /etc/timestamp

Couldn't we just test if /etc/timestamp is writable first:

[ -w /etc/timestamp ] && date -u +%4Y%2m%2d%2H%2M%2S > /etc/timestamp

?

Cheers,

Richard




