Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.4316.1628254854080321634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 06:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id EB408240007;
	Fri,  6 Aug 2021 13:00:51 +0000 (UTC)
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "Yurkov, Vyacheslav" <Vyacheslav.Yurkov@bruker.com>
Subject: Re: [OE-core] [PATCH v4 2/7] overlayfs.bbclass: generate overlayfs mount units
To: openembedded-core@lists.openembedded.org
References: <20210806120611.124246-1-uvv.mail@gmail.com>
 <20210806120611.124246-2-uvv.mail@gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ac780428-cee9-c5b0-bec5-4e7578950c0b@bootlin.com>
Date: Fri, 6 Aug 2021 15:00:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806120611.124246-2-uvv.mail@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Slava, Richard,

On 8/6/21 2:06 PM, Vyacheslav Yurkov wrote:
> It's often desired in Embedded System design to have a read-only rootfs.
> But a lot of different applications might want to have a read-write access
> to some parts of a filesystem. It can be especially useful when your update
> mechanism overwrites the whole rootfs, but you want your application data
> to be preserved between updates. This class provides a way to achieve that
> by means of overlayfs and at the same time keeping the base rootfs read-only.
>
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/classes/overlayfs.bbclass | 111 +++++++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
>  create mode 100644 meta/classes/overlayfs.bbclass
>
> diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
> new file mode 100644
> index 0000000000..8d9b59c9bf
> --- /dev/null
> +++ b/meta/classes/overlayfs.bbclass
> @@ -0,0 +1,111 @@
> +# Class for generation of overlayfs mount units
> +#
> +# It's often desired in Embedded System design to have a read-only rootfs.
> +# But a lot of different applications might want to have a read-write access to
> +# some parts of a filesystem. It can be especially useful when your update mechanism
> +# overwrites the whole rootfs, but you want your application data to be preserved
> +# between updates. This class provides a way to achieve that by means
> +# of overlayfs and at the same time keeping the base rootfs read-only.
> +#
> +# Usage example.
> +#
> +# Set a mount point for a partition overlayfs is going to use as upper layer
> +# in your machine configuration. Underlying file system can be anything that
> +# is supported by overlayfs. This has to be done in your machine configuration.
> +# QA check fails to catch file existence if you redefine this variable in your recipe!
> +#
> +#   OVERLAYFS_MOUNT_POINT[data] ?= "/data"
> +#
> +# The class assumes you have a data.mount systemd unit defined in your
> +# systemd-machine-units recipe and installed to the image.
> +#
> +# Then you can specify writable directories on a recipe base
> +#
> +#   OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
> +#
> +# To support several mount points you can use a different variable flag. Assume we
> +# want to have a writable location on the file system, but not interested where the data
> +# survive a reboot. Then we could have a mnt-overlay.mount unit for a tmpfs file system:
> +#
> +#   OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> +#   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
> +#
> +# Note: the class does not support /etc directory itself, because systemd depends on it


Many thanks for this new class and the corresponding documentation.
Richard, I guess that's something we'll need to document in the manual,
once it's merge, right?

Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

