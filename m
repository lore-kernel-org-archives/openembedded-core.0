Return-Path: <riku.voipio@linaro.org>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3C66B65E14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 07:46:11 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id b6so4192306yha.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 00:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=xSF45+4/NPk57MBDy8v54atLjk52jB443Y2HnwrAHRQ=;
	b=FpmgOZuFsloIdoNUGlSHPBQ3Hsco2gcUDUP+C9rQF61jwWGlezibqVT56nAfvSYnrv
	A5UtfCrIerWxYyFO5Yr7bvFLE3OY6cOX5BIsgoKVmEqCwmO3SJSwd5SftqBafZzESoVP
	pT30Nt/4/1s4mAoXYFsXEK8QAuE8JcYk5RBlP2nTTrVlPr12McPBcwzpUteEt07FUAp2
	mGcav4HXTvvlNTFogGR4G3AEPUZl03ohLjfjUw83nNFPsUEMSNhAjB1xtGrABCwV3yUe
	j2e7Ivl7jir5/5p7hvYT6q6Hs1n8EEtHJ0awefER3H2A/T+3jMbbRfViLld28eqZ4zdH
	m7SQ==
X-Gm-Message-State: ALoCoQlyLEwLz0pv0lEzju7AxymjV4zVy2DlXVu9No3MMHVp/D5gIGDy+ucGYOycIz5bEAfqZH0/
MIME-Version: 1.0
X-Received: by 10.236.195.38 with SMTP id o26mr33723326yhn.51.1408347973162;
	Mon, 18 Aug 2014 00:46:13 -0700 (PDT)
Received: by 10.170.135.20 with HTTP; Mon, 18 Aug 2014 00:46:13 -0700 (PDT)
In-Reply-To: <1408007033-22777-1-git-send-email-riku.voipio@linaro.org>
References: <1408007033-22777-1-git-send-email-riku.voipio@linaro.org>
Date: Mon, 18 Aug 2014 10:46:13 +0300
Message-ID: <CAAqcGH=tx9fny+_HYW5HyKi=7u3ENV67ZH6zErfm=KRQmssBhw@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: fix /var/volatile/tmp permissions
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
X-List-Received-Date: Mon, 18 Aug 2014 07:46:15 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Any updates on this one?

Riku

On 14 August 2014 12:03, Riku Voipio <riku.voipio@linaro.org> wrote:
> Mariadb postinstall will fail with:
>
> ERROR: 1  Can't create/write to file '/tmp/#sql_a2a_0.MAI' (Errcode: 13)
> 140814  8:14:06 [ERROR] Aborting
>
> /tmp is a link to /var/volatile/tmp, set as:
>
> drwxr-xr-x 3 root root 60 Aug 14 08:07 .
>
> populate-volatiles.sh does not create the directory or set
> permissions, because it already exists:
>
> Checking for -/var/volatile/tmp-.
> Creating directory -/var/volatile/tmp-.
> Target already exists. Skipping.
>
> Traced the creation to the initfile in udev. Create with -m 1755
> to be sure. With this patch applied, mysql postinst succeeds and
> creates the neccesary user tables.
>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
>  meta/recipes-core/udev/udev/init | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
> index f2c84d5..a442c74 100644
> --- a/meta/recipes-core/udev/udev/init
> +++ b/meta/recipes-core/udev/udev/init
> @@ -57,7 +57,7 @@ case "$1" in
>      # the automount rule for udev needs /tmp directory available, as /tmp is a symlink
>      # to /var/tmp which in turn is a symlink to /var/volatile/tmp, we need to make sure
>      # /var/volatile/tmp directory to be available.
> -    mkdir -p /var/volatile/tmp
> +    mkdir -m 1777 -p /var/volatile/tmp
>
>      # Cache handling.
>      # A list of files which are used as a criteria to judge whether the udev cache could be reused.
> --
> 2.0.1
>

