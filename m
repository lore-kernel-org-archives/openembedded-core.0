Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1425377209
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 07:06:49 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b187so2391020wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 00:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rIpiUa2TqHM+N1BLZknV38bY12Qp/qEv1apEmRpJn6k=;
	b=VcUjKu8lrCIT5hCAyZReR7JsgAPIxXNXzF6JTmgegugVuh1b92OAcBLFvN5AkbeSkK
	KEBjeYInl7jJnVJtDfjRMtx/7iFT2PEvs/WZlmdj3E+50vXpphZkEfv77F19AQuzG9A9
	hPblWHTCnMIj3KSv1MaVX+2hUkSQRQ5+u4LFl2QnheFzU2KheVEJ6bRPNjylwxWBVtpI
	ydpAOKwbLVzfdgEMlvHQeaFk35kNcsGjNrFr+/B1hIu47gc3B/IOcpkqFw1DLOM4Wk6N
	4+zNY468jNGMULz+ohtkXpKQrtW1L7q1eNHPyZ/S36AQoldJGuDCDyf3pIZGueDa0w2J
	OUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rIpiUa2TqHM+N1BLZknV38bY12Qp/qEv1apEmRpJn6k=;
	b=RPMaoqQiQa3mGTx+NEgX931MHudsLATiUmc22nMBsbbGb8QKI5yuyFHCl0NnkA4EGP
	KePoANvPF9xu8S0KnTcS2VcW6NogdAe623CzMuVrwZnyi4yZldYk5tiOINE+qcstFuoC
	jB0suwt0ghqkEi0hwPgaPsdW1QTx692a4zzxJhppGMLctd55vWISxD/xw99+CpaBiMkY
	tCxiqsoXYmFeBumrOyreH78EeyTDG6mzzADtpc+23GswhJXhMtIQsufMWvUzyj9HS6oI
	MY7VyiQHB6pVhEoPrkB65ZW9tm6cU84/kJMkDJ0qW3S8xIVYgXjSCrSWEZBWbLl2xGI4
	dj9Q==
X-Gm-Message-State: AE9vXwMPeo4LBMNbosp3umsdGPPpIvauyODMSPhnY7kn3RQ1+ycwlG7LP8xPpDLTSZE83HUsCdgyJZ8l8skS1Q==
X-Received: by 10.194.201.230 with SMTP id kd6mr20032471wjc.167.1473318409754; 
	Thu, 08 Sep 2016 00:06:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.216.100 with HTTP; Thu, 8 Sep 2016 00:06:49 -0700 (PDT)
In-Reply-To: <1473317486-13435-1-git-send-email-sujith.h@gmail.com>
References: <1473317486-13435-1-git-send-email-sujith.h@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 8 Sep 2016 00:06:49 -0700
Message-ID: <CAJ86T=VS6k_GDbCNc_Wf-yNegfP0dUAocZQApi_e+nFSgerTmA@mail.gmail.com>
To: Sujith H <sujith.h@gmail.com>
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Fix to obey LD failure on host i686
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
X-List-Received-Date: Thu, 08 Sep 2016 07:06:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 7, 2016 at 11:51 PM, Sujith H <sujith.h@gmail.com> wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> When built on an i686 host for qemux86-64 without the
> fix to obey LD and it fails:
>
> /scratch/dogwood/toolchains/x86_64/bin/i686-pc-linux-gnu-ld:
> Relocatable linking with relocations from format elf64-x86-64
> (/scratch/dogwood/perf-ld-test/build/tmp/work/qemux86_64-mel-linux/perf/1.0-r9/perf-1.0/fs/fs.o)
> to format elf32-i386 (/scratch/dogwood/perf-ld-test/build/tmp/work/qemux86_64-mel-linux/perf/1.0-r9/perf-1.0/fs/libapi-in.o)
> is not supported
>
> This is because LD includes HOST_LD_ARCH, which contains TUNE_LDARGS,
> which is -m elf32_x86_64 for x86_64. Without that, direct use of ld will fail.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 88e3a0a..85fe0ea 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -79,6 +79,7 @@ EXTRA_OEMAKE = '\
>      ARCH=${ARCH} \
>      CC="${CC}" \
>      AR="${AR}" \
> +    LD="${LD}" \
>      EXTRA_CFLAGS="-ldw" \
>      perfexecdir=${libexecdir} \
>      NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${LIBUNWIND_DEFINES} \
> @@ -98,6 +99,14 @@ EXTRA_OEMAKE += "\
>      'infodir=${@os.path.relpath(infodir, prefix)}' \
>  "
>
> +do_configure_prepend () {
> +    for makefile in "${S}/tools/perf/Makefile.perf" \
> +                    "${S}/tools/lib/api/Makefile"; do
> +        if [ -e "$makefile" ]; then
> +            sed -i 's,LD = $(CROSS_COMPILE)ld,#LD,' "$makefile"
> +        fi
> +    done
> +}

Isn't passing LD via the Make command line enough to over-ride these
definitions in the Makefiles?

>  do_compile() {
>         # Linux kernel build system is expected to do the right thing
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

