Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TBvMv-0008Bw-GZ
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 00:25:13 +0200
Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 12 Sep 2012 15:12:38 -0700
Received: by daks35 with SMTP id s35so1203662dak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 15:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=d7/E8dYtqdKe2Rm+0RZ6dlhjZKTNNS2/Sh0h9gt7/d8=;
	b=X+inDhFg9gP3ZZUfCYlW16BOnV4r1YJXcc5wOyrXF2zdgQhPunX50rmAZD0DYQpt7/
	SgYdicWg6Lc1bVDQsr7qiC0gbMHCSmF6DSF51Pn3LkTklwL53jSbT4qjOk4i2n03fyCA
	shTh+qU3HScBR/a2nJUsANYUC8q3JcDA/TxtMIf9iVCeXeRQ7QxBhkX8QK/Cd4egMZa/
	1FznRva0bWObziZxmIxE99zqFoh1edUSMIcZVRhbDyZKd/uxrwAE7SI0Rtc9jTF5Hkjb
	H0BbgTmBcJQcUZ4vdYkXzk9ZqCtxrTsttLrHoTIu5KNXn8U9hSn4m6IDCuLPdiImSfNs
	gi6w==
Received: by 10.68.224.70 with SMTP id ra6mr1059432pbc.11.1347487957396;
	Wed, 12 Sep 2012 15:12:37 -0700 (PDT)
Received: from [10.0.99.24] (208.176.205.99.ptr.us.xo.net. [208.176.205.99])
	by mx.google.com with ESMTPS id it5sm5876887pbc.10.2012.09.12.15.12.34
	(version=SSLv3 cipher=OTHER); Wed, 12 Sep 2012 15:12:35 -0700 (PDT)
Message-ID: <505108CD.8080408@intel.com>
Date: Wed, 12 Sep 2012 15:12:29 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1347429555-32159-1-git-send-email-raj.khem@gmail.com>
	<1347429555-32159-2-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1347429555-32159-2-git-send-email-raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQne5p1ktkjOtihh1K/ZgYGtuJF6qMH+Aj2lrPi1plFSBgOMMGAjlUiO7tjHKDD5Op70wFcp
Subject: Re: [PATCH 2/3] runqemu: Explicitly specify MACHINE when calling bitbake
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
X-List-Received-Date: Wed, 12 Sep 2012 22:25:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 10:59 PM, Khem Raj wrote:
> When using runqemu with distros outside oe-core then
> MACHINE may not be there in local.conf so use the one
> thats available in environment of runqemu which is actually
> the correct one.

Looks simple enough.

Acked-by: Scott Garman <scott.a.garman@intel.com>

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   scripts/runqemu |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index a3c3509..e843946 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -281,7 +281,7 @@ setup_tmpdir() {
>               exit 1; }
>
>           # We have bitbake in PATH, get OE_TMPDIR from bitbake
> -        OE_TMPDIR=`bitbake -e | grep ^TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
> +        OE_TMPDIR=`MACHINE=$MACHINE bitbake -e | grep ^TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
>           if [ -z "$OE_TMPDIR" ]; then
>               echo "Error: this script needs to be run from your build directory,"
>               echo "or you need to explicitly set OE_TMPDIR in your environment"
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


