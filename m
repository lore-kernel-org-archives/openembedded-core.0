Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TE6j8-0000qC-GH
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 00:57:10 +0200
Received: by eekb57 with SMTP id b57so132289eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 15:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XkJGMtpIka3jTSHhK5Pxfq+txGn0tK+ajrBHk0yzUyQ=;
	b=sUKwokR9HDBg46IbO8orntf+w5YacmBEWhtZtdXMSFU91i5QW0JL4ZUfSKmULvyldK
	maCoB69NUye1twtT27RfB+UZ9yZlOWHsD3hF4jmvWnqYNOmoy6u0SqssG9PobfSRCXy1
	E+Kk/fwJx1LUsZsrn1R9PzPCFPJPH35TcUYvllivjUzXgzOiO1+Mud5FZ4w+/SpThDm7
	s+vjXYlTzkOmSdU+1s6/j0GRTR++NhD2xbyGJrc83/UT3OhUGSIhP4CNma9TSUlQ2x2H
	ha5iKN9XSbKTqrN7fi4IUuMQ22cXhJD2CKyqsB26Sh4qJvrRz82oakb+PVZkxnL9K0yS
	DLAQ==
Received: by 10.14.202.131 with SMTP id d3mr1569689eeo.32.1348008270287; Tue,
	18 Sep 2012 15:44:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 18 Sep 2012 15:44:00 -0700 (PDT)
In-Reply-To: <1348006091-14992-6-git-send-email-msm@freescale.com>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
	<1348006091-14992-6-git-send-email-msm@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Sep 2012 15:44:00 -0700
Message-ID: <CAMKF1sqYh2BR_3z2OP-WvMCyFPk4nK9uqLZRK7ApQz4hV76OEg@mail.gmail.com>
To: Matthew McClintock <msm@freescale.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] insane.bbclass: skip checking arch (machine/bits) for powerpc kernel recipe
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
X-List-Received-Date: Tue, 18 Sep 2012 22:57:10 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 18, 2012 at 3:08 PM, Matthew McClintock <msm@freescale.com> wrote:
> For a 32-bit machine, we still might always (or optionally) want to build a
> 64-bit kernel so we add an exception.
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> Not sure if we should just skip for all virtual/kernel's?
>
>  meta/classes/insane.bbclass |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index e74eb3f..2ca1b49 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -366,11 +366,13 @@ def package_qa_check_arch(path,name,d, elf, messages):
>
>      # Check the architecture and endiannes of the binary
>      if not ((machine == elf.machine()) or \
> -       ("virtual/kernel" in provides) and (target_os == "linux-gnux32")):
> +       ("virtual/kernel" in provides) and (target_os == "linux-gnux32") or \
> +       ("virtual/kernel" in provides) and (target_arch == "powerpc")):

I feel using powerpc target_arch here is a broad brush. Can there be
some other variable in metadata
that could indicate 64bit kernel and a 32bit ppc userspace combo of
some sort ? or may be a variable
stating that this machine's kernel is 64bit and use that here instead.

>          messages.append("Architecture did not match (%d to %d) on %s" % \
>                   (machine, elf.machine(), package_qa_clean_path(path,d)))
>      elif not ((bits == elf.abiSize()) or  \
> -       ("virtual/kernel" in provides) and (target_os == "linux-gnux32")):
> +       ("virtual/kernel" in provides) and (target_os == "linux-gnux32") or \
> +       ("virtual/kernel" in provides) and (target_arch == "powerpc")):
>          messages.append("Bit size did not match (%d to %d) %s on %s" % \
>                   (bits, elf.abiSize(), bpn, package_qa_clean_path(path,d)))
>      elif not littleendian == elf.isLittleEndian():
> --
> 1.7.9.7
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


