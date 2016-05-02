Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 163EA65CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 13:39:32 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id u185so195991149iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 06:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=gn9W8u6rdPEZ35hxfxCzfR/mlUYJCmQ4uJzYPCtbwvA=;
	b=kKeMBOV7UhjhvwWsr+v0baZ/dZkPPPinSqs9GB0eq37dNJzKuvlz4VZrquamuY6oQz
	muq4x5mZQZsuH2ZMUY7QmYHdEt9QX6LSFoIcekcfdyac5YVyJbWk/MlW5SyvfkeL7X2a
	h/3rNBi3ZYOh1nlW6MawM9ek37d6mrJXZ2LBnK1VNhjvl1q+0wvc4N7JpOcvOvnFJU68
	GbwCnglgUiSB2ncEqu1W/GLbrN6jWg15tqIWvnmY9GFDzbGAwoN4H666N8L4hyLkZ/dk
	C+cOiNX1+BItlWdF8bud+grFOQ/ivtJfSYd1YQovz2sb06XH41yDwp/5hHwju1IU5q80
	SaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=gn9W8u6rdPEZ35hxfxCzfR/mlUYJCmQ4uJzYPCtbwvA=;
	b=EpO6SPptz+2VFpj6SRSKPxXKQIUqu54WXWXpEKo575avVoHgChglQ0W+ha2TaA3pxc
	8Gg9IWWPmyOPGMh46By00KF2MFteYc3bj7mjXXqsezlO0mfK8qONz3P+eMw6xA6CcNEw
	2VUWUJAuLGj+J5WrbbsEMyy8i0c6c/yQ4US4dNGwGF5ldrK9GIrosus2fYma/P27sHbc
	kJ3z9e5C74AZn77b5p/r6V7mXIPzNx4Kwo+u7+whZh6yuww+SpiEy5Xc0t1SOlCqiFKR
	fryx6+FYldCuMObQhTe6aPV4QHnZP00UU25uTtil9TWl1CDQzZz3hnmroP6rgpsDaHEh
	kr2w==
X-Gm-Message-State: AOPr4FU1mJBnl4dsT3GEXEl7ipxd8/pwTXsFYoLgW/zQ7eY9a30sbh5+lneynL+RdsI8cXtt
X-Received: by 10.107.11.18 with SMTP id v18mr43428360ioi.184.1462196373141;
	Mon, 02 May 2016 06:39:33 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8DB4C.dip0.t-ipconnect.de. [93.232.219.76])
	by smtp.gmail.com with ESMTPSA id
	zp20sm9851410igc.13.2016.05.02.06.39.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 May 2016 06:39:32 -0700 (PDT)
Message-ID: <1462196370.30857.70.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 02 May 2016 15:39:30 +0200
In-Reply-To: <1461333082.31320.121.camel@linuxfoundation.org>
References: <1461333082.31320.121.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/rootfs: Fix DEBUGFS generation when using opkg
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
X-List-Received-Date: Mon, 02 May 2016 13:39:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-04-22 at 14:51 +0100, Richard Purdie wrote:
> When enabling extra DEBUGFS image generation with opkg, errors are seen like:
> 
> ERROR: core-image-minimal-1.0-r0 do_rootfs: Cannot get the installed packages list. Command '/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/bin/opkg -f /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/opkg.conf -o /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs  --force_postinstall --prefer-arch-to-version   status' returned 0 and stderr:
> Collected errors:
>  * file_md5sum_alloc: Failed to open
> file /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/syslog-startup.conf.busybox: No such file or directory.
>  * file_md5sum_alloc: Failed to open
> file /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/fstab: No such file or directory.
> 
> basically for all CONFFILES in the image. This is due to the file
> rearranging
> the rootfs generation code does. If we preserve the /etc directory,
> the avoids the problem.

It avoids the problem, but it does not address the root cause (IMHO).
Should opkg really complain about missing configuration files? It is
perhaps an edge case, but besides editing a configuration file
*removing* it entirely may also be a valid user modification.

The usage of opkg here is during image building, but the operation
itself (opkg status) is not specific to image creation and thus should
be able to handle arbitrary states of /etc and the config files in
general.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




