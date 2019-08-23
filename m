Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 838D87F376
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 16:42:01 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id t6so21524192ios.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 09:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ru+hYgr59TVbqVaqYON8TVFVsxZjfjEEbyQph9eq2zI=;
	b=CC2iC28ajJNDirVjsNogM79O5nbkBvqvRT39KD3K08zF0C0cBBeS5GmnrFS8I+anfD
	T7eVpl/Aqw2zuMxVPAmzk7/J/NOBEmwzgDKZz974eQ5BcMXvIVRS17wuK2AXJt32W+iI
	a6h8FB9ckPBJhYnP+/0AfyZ1xko90fhJ6SBTlvzCRAQgebjIKtzYDjlLNReWmL21yiHr
	rxKbTwbdH5t1jOtJPgSq0FVhx/zQ4sgs4JsgYmjSHTXhTm89ykjUGuVsFfp+tzCCCaX8
	x8oDaE0GMTh4uS+wmnfEBriZplgBRxVfizpIvdAf7nT/VjP46Qe8naCye3HuKhIIBUAK
	fDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ru+hYgr59TVbqVaqYON8TVFVsxZjfjEEbyQph9eq2zI=;
	b=iGIIHT9STx0APzFsDpjMdLTARyacSHOlpRwaRN4IVsbzXM8HivjTUDAJ+iEVO62ure
	yJJXhuBo2a1b4zdK2roN2EpT7Z7kKJtG/kUozNIaBxLkXIunTjodW3Q+wR6SSZ9Zbd80
	a8r5qLpwOnvm8gmfi1Qc992kOKL1TF4VeQyFpEP61Hl0d93BG5Avs7RCaDH7NJp5BLdT
	/QX1Q1qk6+jGhaznSzNPYqmI0xusMr7tBNIqDVoA6abL/eNZmtGG92cZWDD4FNH/7MCM
	A9FZX5KDMArqL/SQCnnjDng7CCjQ927HMxENGQHn2qNRlEelNTzWIUdI/MopODpy5Iwe
	dLhw==
X-Gm-Message-State: APjAAAWFsL37RC9V44dv2EydLnXzLj1DTdbG+JfqyosbxE0UfcTcF71C
	LIPPssdRWd2wRn49Af98i2dlnxz/2C0pzbZFOarTucuAliQ=
X-Google-Smtp-Source: APXvYqx8st3swLkYIqufK6xid6hhGkX6DLGzo67rOpqulnwEb8GYg8qSKgvZ4wDrA25vTnRs+g2lZCaTBfIWZ5sSV9w=
X-Received: by 2002:a6b:4011:: with SMTP id k17mr4850369ioa.288.1566578522460; 
	Fri, 23 Aug 2019 09:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190823163906.20144-1-fabio.berton@ossystems.com.br>
In-Reply-To: <20190823163906.20144-1-fabio.berton@ossystems.com.br>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Fri, 23 Aug 2019 13:41:46 -0300
Message-ID: <CAAPZna0V6aj9C5Zoeo3dQuSc-P-GGNuQ2cd5euqjQsRBi_sZ+g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Bedel, Alban" <alban.bedel@aerq.com>
Subject: Re: [warrior][PATCH] rng-tools: start rngd early in the boot process again
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
X-List-Received-Date: Fri, 23 Aug 2019 16:42:01 -0000
Content-Type: text/plain; charset="UTF-8"

Without this change, images with systemd hang on shutdown/reboot.

On Fri, Aug 23, 2019 at 1:39 PM Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
>
> From: "Bedel, Alban" <alban.bedel@aerq.com>
>
> It do make sense to start rngd early in the boot process because
> otherwise we would need to track every service that might need entropy
> and explicitly configure it to start after rngd.
>
> When used with systemd rngd blocked the shutdown process because it
> simply missed the proper unit configuration. As the systemd
> documentation explains, when using DefaultDependencies=no one also
> have to explicitly configure the unit to properly stop at some point.
> This is normaly achieved by having Before=shutdown.target and
> Conflicts=shutdown.target set for the unit.
>
> To have rngd started early again we reverte the changes done to
> rngd.service in commit edf7606822 (rng-tools: fix rngd blocks system
> shutdown). To have it properly stopped on shutdown we also add
> Before=shutdown.target and Conflicts=shutdown.target.
>
> Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit a74e7df33e2c8ab2152e3217c0a5df3f65971713)
> ---
>  meta/recipes-support/rng-tools/rng-tools/rngd.service | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> index f0355db14fc..5c8253b5fba 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
> +++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> @@ -2,7 +2,8 @@
>  Description=Hardware RNG Entropy Gatherer Daemon
>  DefaultDependencies=no
>  After=systemd-udev-settle.service
> -Before=sysinit.target
> +Before=sysinit.target shutdown.target
> +Conflicts=shutdown.target
>
>  [Service]
>  ExecStart=@SBINDIR@/rngd -f -r /dev/hwrng
> --
> 2.20.1
>

