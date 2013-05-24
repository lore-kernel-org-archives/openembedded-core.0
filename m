Return-Path: <net147@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0C0036969F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 13:38:56 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id bj3so4308131pad.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 06:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=WQvFrhdQJosziFi0Dva+nc+vl8YLotXzQid/ZJjrvbM=;
	b=FhxTnFwSCC9PzDSi/HrM1d8fGMk5jBkoDxWa1W8OV9asd4LQKvS87ISPHi96ty4iRb
	hA61AbnoE6WeXuonJCVj2Zx9PTCksUdF8yEN+ZM0wQVGPvuTlV+x2JX+KoL6Qz5GO1CB
	ZksCu0GZqkM4WcdhtkB6e4ciC+1lTDPS7rlQhh0MGDMJLGITxO0XlKsljwfYnflS1iQA
	78mwN51LCobz8FBob/NYifHh3LALiljBRhDjsSBNXIUOIyg+G9/ROsOZhucuXaoptKR0
	x9ZlFDUlnIeMl02syLpsaoKrwLNOtWMLVnILpwbm7ji2UJ4TcBtbXSEV1w14/s53vYaQ
	Gz7g==
X-Received: by 10.68.189.105 with SMTP id gh9mr17838561pbc.77.1369402722195;
	Fri, 24 May 2013 06:38:42 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	ze11sm17481449pab.22.2013.05.24.06.38.40 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 24 May 2013 06:38:41 -0700 (PDT)
Message-ID: <519F6C40.3070108@gmail.com>
Date: Fri, 24 May 2013 23:33:52 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1368673187-20121-1-git-send-email-net147@gmail.com>
In-Reply-To: <1368673187-20121-1-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: fix ordering for machineid and run-postinsts services
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
X-List-Received-Date: Fri, 24 May 2013 13:38:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 16/05/2013 12:59 PM, Jonathan Liu wrote:
> The remount-rootfs.service unit has been renamed to
> systemd-remount-fs.service in systemd v183 and later.
>
> The run-postinsts script writes to /var/log (a symbolic link to
> /var/volatile/log), so systemd-tmpfiles-setup.service is added to After=
> in run-postinsts.service to ensure /var/volatile/log is created before
> running the script.
>
> [YOCTO #4490]
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   meta/recipes-core/systemd/systemd-compat-units/machineid.service     | 2 +-
>   meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd-compat-units/machineid.service b/meta/recipes-core/systemd/systemd-compat-units/machineid.service
> index cab8f76..f586c6d 100644
> --- a/meta/recipes-core/systemd/systemd-compat-units/machineid.service
> +++ b/meta/recipes-core/systemd/systemd-compat-units/machineid.service
> @@ -2,7 +2,7 @@
>   Description=Machine ID first boot configure
>   DefaultDependencies=no
>   ConditionPathExists=|!/etc/machine-id
> -After=remount-rootfs.service
> +After=systemd-remount-fs.service
>   Before=sysinit.target
>   
>   [Service]
> diff --git a/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service b/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
> index da6fe76..02c1d86 100644
> --- a/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
> +++ b/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
> @@ -2,7 +2,7 @@
>   Description=Run pending postinsts
>   DefaultDependencies=no
>   ConditionPathExists=|/etc/rcS.d/S98run-postinsts
> -After=remount-rootfs.service tmp.mount
> +After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
>   Before=sysinit.target
>   
>   [Service]
Bump. This fixes the postinst service failing on startup when using 
systemd with an image that inherits from boot-directdisk.

Regards,
Jonathan

