Return-Path: <andre.draszik@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 49155749C1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 14:23:42 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id d50so11949524qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 07:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=U9LhzMSEuMTOmdHXaP48n0gCQ7wavdNLFgP5gcFjo2E=;
	b=ZYB+tM91Abet2cYaCSUVL1i46wJBckjy0PU/0btt4tcFd373U6m4gIDrfRHi5ERe17
	vUT9WJ5e2HcQyuV4HWHOAbnFAYMK6SN54siEHxJ3NnIi+t3eR+xcMIU9TNhQCMM+3uaH
	LhQNFAphk3WC60Fx8S/IMy03hOtz4sPLZYnViqpmaVmmyQmdSwP7Hj6FSUq4Z34MKsou
	Sh13glfBMjL+kYOcjBbkNg5T+fc0oVn2/qRCyUxfygv5K/zpiBObz6YqA1/HBypXS6sw
	l2HKfoECCmHZKIXNp7sXbPr2dC8yk4W1Lc870wK4PcbMxiI+QDD7YnlJy2FmxXqrORIX
	GMDw==
X-Gm-Message-State: ALQs6tBZakfzP5C74c4xGzk2qmcX90BGq0z+J8XwoznUTsVIrwHrT8n2
	3c+SRPKJNbB3xHbSlH9MBrc=
X-Google-Smtp-Source: AIpwx49+NQn7SQrnC2ZT2BG7dJsMnaSnXnyhB+MLjawWmNvsBydrdR/1QbnniaWrCHoZCnNn8z7TZg==
X-Received: by 10.200.27.246 with SMTP id m51mr20477126qtk.13.1522765424050;
	Tue, 03 Apr 2018 07:23:44 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id t7sm2342138qkt.30.2018.04.03.07.23.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 03 Apr 2018 07:23:42 -0700 (PDT)
Message-ID: <1522765421.26897.51.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Oleksii Konoplitskyi <okonopli@cisco.com>, 
	openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com
Date: Tue, 03 Apr 2018 15:23:41 +0100
In-Reply-To: <052b3c4d-084c-9434-e47d-b68c068cd958@cisco.com>
References: <1520865187-13798-1-git-send-email-okonopli@cisco.com>
	<1520873954.3748.6.camel@andred.net>
	<052b3c4d-084c-9434-e47d-b68c068cd958@cisco.com>
X-Mailer: Evolution 3.26.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH] core-image-minimal-initramfs: prepare initramfs for NFS boot
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
X-List-Received-Date: Tue, 03 Apr 2018 14:23:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Thanks!

On Fri, 2018-03-16 at 20:20 +0200, Oleksii Konoplitskyi wrote:
> Taking into account your recommendations, module should have the next 
> content:
> 
> nfsrootfs_enabled() {
>      [ -z ${bootparam_nfsroot+x} ] && return 1
>      return 0
> }
> 
> nfsrootfs_run() {
>      nfs_mount_point=$(echo $bootparam_nfsroot | cut -d ',' -f 1)
>      nfs_mount_params=$(echo $bootparam_nfsroot | cut -d ',' -f 2)
> 
>      mount -t nfs ${nfs_mount_point} -o nolock,${nfs_server_params} 
> $ROOTFS_DIR
> }

Actually, this is missing various things, according to
linux/Documentation/filesystems/nfs/nfsroot.txt

nfsroot=[<server-ip>:]<root-dir>[,<nfs-options>]

* The server-ip is optional (and would be taken from the ip= option in
  that case)
* there can be more than one nfs-option (which is probably more important
  to fix)
* it ignores the 'ro' or rootflags=ro option

Maybe something like this (completely untested):

nfsrootfs_run() {
    local nfs_opts
    local location
    local flags

    nfs_opts=""
    if [ "${bootparam_nfsroot#*,}" != "${bootparam_nfsroot}" ] ; then
        nfs_opts="-o ${bootparam_nfsroot#*,}"
    fi
    location="${bootparam_nfsroot%%,*}"
    if [ "${location#*:}" = "${location}" ]; then
        # server-ip not given
        location=${ROOTSERVER}:${location}
    fi

    flags="-o nolock"
    if [ -n "$bootparam_ro" ] && ! echo "$bootparam_rootflags" | grep -w -q "ro"; then
        if [  -n "$bootparam_rootflags" ]; then
            bootparam_rootflags="$bootparam_rootflags,"
        fi
        bootparam_rootflags="${bootparam_rootflags}ro"
    fi
    if [ -n "$bootparam_rootflags" ]; then
        flags="$flags -o$bootparam_rootflags"
    fi

    mount -t nfs ${flags} ${nfs_opts} ${location} ${ROOTFS_DIR}
}

? Just need to get at $ROOTSERVER now, or at least issue a warning that it
should be given on the command line.


> What module is responsible for network configuration and network driver 
> loading?

I'd say IP should be separate, as you can then also easily add DHCP or
zeroconf. It's not really related to nfsroot (except for the ROOTSERVER
bit).
Network driver loading should definitely be a machine specific thing...

> Should it be separate custom module in initramfs-framework not related 
> to upstream?
> 
> Best regards,
> Oleksii


Cheers,
Andre'


