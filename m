Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UPrgh-0008Og-Sp
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 11:51:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3A9Y9Xs016351
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Apr 2013 02:34:09 -0700 (PDT)
Received: from [128.224.162.147] (128.224.162.147) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 10 Apr 2013 02:34:08 -0700
Message-ID: <5165320E.1050803@windriver.com>
Date: Wed, 10 Apr 2013 17:34:06 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1365575154-25919-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1365575154-25919-1-git-send-email-sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] udev-extraconf: Add -o silent to auto mount
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 09:51:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/10/2013 02:25 PM, Saul Wold wrote:
> This will silence some of the noisy output from mount and the kernel
> when trying to automount filesystems or devices
>
> [YOCTO #3935]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
> index 99c76b2..7b58361 100644
> --- a/meta/recipes-core/udev/udev-extraconf/mount.sh
> +++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
> @@ -22,7 +22,7 @@ automount() {
>   
>   	! test -d "/media/$name" && mkdir -p "/media/$name"
>   	
> -	if ! $MOUNT -t auto $DEVNAME "/media/$name"
> +	if ! $MOUNT -o silent -t auto $DEVNAME "/media/$name"
>   	then
>   		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
>   		rm_dir "/media/$name"
I have tested on atom-pc,  mount option "silent" is unrecognized.
...
root@atom-pc:~# mount -o silent -t auto /dev/sdb1 /media/sdb1
mount: mounting /dev/sdb1 on /media/sdb1 failed: Invalid argument
...

Without this option, mount is ok
...
root@atom-pc:~# mount -t auto /dev/sdb1 /media/sdb1
root@atom-pc:~# mount
/dev/sdb1 on /media/sdb1 type ext4 (rw,relatime,data=ordered)
...

root@atom-pc:~# which mount
/bin/mount
root@atom-pc:~# ls /bin/mount -al
lrwxrwxrwx    1 root     root            12 Apr 10 07:44 /bin/mount -> 
/bin/busybox

branch master 6d4d42d63db4c3fcffd831ce359599f3ee1d710e

Thanks,
Hongxu




