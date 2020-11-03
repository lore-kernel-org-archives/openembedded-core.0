Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web08.6105.1604419024330869893
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 07:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L3ZC3ktf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id 33so8290274wrl.7
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 07:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=tYOs6q7V/ZtSZnVz/0PdnWlZ8YoAeHxv8DNVlRMboZQ=;
        b=L3ZC3ktfsvPNbxLiFRf8EO9xtp8M4d7dueqlK/D1u5nViWBHGlMPBT5XuDiq5+Rf66
         CpP/g8ig3I0/XF3X4cJy+cA2nfCAHGYHCBDn8ONpK6wB4QHxt/Eca/nY4uBkG1Tl1QGs
         dtqsI2bcetaV52CrIUwDHL9jyzwt3dAOTq4NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tYOs6q7V/ZtSZnVz/0PdnWlZ8YoAeHxv8DNVlRMboZQ=;
        b=n4VwvGxPcqzeZFZM+vIEZDlDyzNEeirW7oi92LUweZAYf1pCX/zxW6+2KB/jsyF3rO
         1Z/qpIwVIYgDCyUuQ/NQuJAZyXMiAipSjKnnaghr+kL8qQ9igXGdP/FTH7n9YTqQYtTV
         HGNOloY1AMFRMU4Aaub1d08lGEmSw8y1YkODPU0tWhBFHNk3zgRr48efR8ufzk3DGc8u
         g+K5epQkjdHMu9GG9LUzcckaaADF2NW64LVjWxqa5B2KI/VUA4OOqhbScBuq0nL5T2h/
         PmXmK6r2xdWok7+hmunpNC7plwbT/evdNS3GriEgHLY8QiHoQeRYEiF4flW20b07gURF
         17Gg==
X-Gm-Message-State: AOAM5301/cG3It7Fih3MQsLochs/5X++wQe+Wi+nSYXDlWhp7LsXz4LA
	MoZ+fEr8wS+gi1Q6segrpV44Fg==
X-Google-Smtp-Source: ABdhPJx+H+Aio5Mg3HdxPLqVO1Yu+yaFvukIyFVuYWXguHvZn/2wrkGen3u7ZcL7d9q6GAb2xk6Mzw==
X-Received: by 2002:adf:9f49:: with SMTP id f9mr19652358wrg.122.1604419022864;
        Tue, 03 Nov 2020 07:57:02 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id b4sm18541754wro.57.2020.11.03.07.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 07:57:02 -0800 (PST)
Message-ID: <4031cde0bf77b9f465493c651555ac62d3f621ff.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rootfs-postcommands: Add a few debug tweaks for systemd
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alban Bedel <alban.bedel@aerq.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 03 Nov 2020 15:57:01 +0000
In-Reply-To: <20201103135351.1581925-1-alban.bedel@aerq.com>
References: <20201103135351.1581925-1-alban.bedel@aerq.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-11-03 at 14:53 +0100, Alban Bedel wrote:
> Configure the systemd emergency service to not ask for a password when
> the debug-tweaks or empty-root-password image feature are enabled.
> Also enable all the sysrq commands when debug-tweaks is set as systemd
> only allow the sync command per default.
> 
> To avoid the need for over complex expressions when adding systemd
> specific tweak a new variable called SYSTEMD_ROOTFS_POSTPROCESS_COMMAND,
> is introduced to collect the systemd specific post commands.
> 
> Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
> ---
>  meta/classes/rootfs-postcommands.bbclass | 31 ++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

I think the idea here is good but to merge there are a couple of tweaks
needed.

Firstly, our plan is to move away from debug-tweaks to more
specifically named options. "systemd-debug-insecure" might be a better
name. We want a slightly scary name to remind people that this is not
something to enable on production images. Our plan is to split debug-
tweaks into similarly named options.

Secondly, you can do:

${@bb.utils.contains("IMAGE_FEATURES", ['debug-tweaks', 'systemd'], "systemd_enable_sysrq; ", "",d)}

so I'd prefer to do that than have a specific systemd variable there.

Cheers,

Richard


> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> index 1f27a3d07a..3b4e600d3c 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -17,6 +17,15 @@ ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp; "
>  # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
>  ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
>  
> +# Disable password in systemd emergency mode if debug-tweaks or empty-root-password is enabled
> +SYSTEMD_ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "systemd_emergency_no_password; ", "",d)}'
> +
> +# Enable sysrq on systemd distro if debug-tweaks is enabled
> +SYSTEMD_ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", 'debug-tweaks', "systemd_enable_sysrq; ", "",d)}'
> +
> +# Add the systemd specific post process commands
> +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "${SYSTEMD_ROOTFS_POSTPROCESS_COMMAND}", "",d)}'
> +
>  # We also need to do the same for the kernel boot parameters,
>  # otherwise kernel or initramfs end up mounting the rootfs read/write
>  # (the default) if supported by the underlying storage.
> @@ -153,6 +162,17 @@ zap_empty_root_password () {
>  	fi
>  }
>  
> +#
> +# Add a systemd config fragment to disable password for the emergency mode
> +#
> +systemd_emergency_no_password () {
> +	mkdir -p ${IMAGE_ROOTFS}${systemd_unitdir}/system/emergency.service.d
> +	cat > ${IMAGE_ROOTFS}${systemd_unitdir}/system/emergency.service.d/no-password.conf <<EOF
> +[Service]
> +Environment=SYSTEMD_SULOGIN_FORCE=1
> +EOF
> +}
> +
>  #
>  # allow dropbear/openssh to accept logins from accounts with an empty password string
>  #
> @@ -221,6 +241,17 @@ set_systemd_default_target () {
>  	fi
>  }
>  
> +#
> +# Enable sysrq on systemd distro
> +#
> +systemd_enable_sysrq () {
> +	mkdir -p ${IMAGE_ROOTFS}${libdir}/sysctl.d
> +	cat > ${IMAGE_ROOTFS}${libdir}/sysctl.d/90-enable-sysrq.conf <<EOF
> +# Allow all sysrq when debugging is enabled
> +kernel.sysrq = 1
> +EOF
> +}
> +
>  # If /var/volatile is not empty, we have seen problems where programs such as the
>  # journal make assumptions based on the contents of /var/volatile. The journal
>  # would then write to /var/volatile before it was mounted, thus hiding the
> 
> 

