Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id AB73B757A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 03:23:44 +0000 (UTC)
Received: by ykeo23 with SMTP id o23so156415080yke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 20:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=MOZIm7DPsZ5dZhFkZYRPK88S3UhiRBS4xyjbM+Q5MJE=;
	b=bsc6H127QFMMtYAfL8fTXhapk0kZLjpawGaNee6e4HQO3C3ZQyVB34jgb0EoRQIPvH
	7jcrUUX9aebo/SHgGG8Tc2os1r0dJ0TOJ65U3mbBg8vNa7aYB/FkUOZKXmA32MdFXVh9
	0w7meuj1GuEsXH9bYaVzqfHjkN84hVLYLmQ3ICXHdh4kzROom0gi3dZD02qryZhfbiOF
	KSqHqMyTr/xqtkEZVPKrXX586E4X8/eH8lvSOsAp9BOgZjNuzF+qZkT3wG0BsBXtqqhn
	2usLS9CPkkvorgS4r0v0aF1I0lSvyT16GxyDmaSUiztuacNcrDV8yUniRbQUBqga/Mhp
	ElaA==
MIME-Version: 1.0
X-Received: by 10.170.135.138 with SMTP id b132mr23468367ykc.16.1439263424144; 
	Mon, 10 Aug 2015 20:23:44 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Mon, 10 Aug 2015 20:23:44 -0700 (PDT)
In-Reply-To: <1439220090-3305-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1439220090-3305-1-git-send-email-s.mueller-klieser@phytec.de>
Date: Mon, 10 Aug 2015 23:23:44 -0400
Message-ID: <CADkTA4NL2Lz08PzmNhW1d9MiQhezDkmo5FwxpgG851Mc7Wffzw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?UTF-8?Q?Stefan_M=C3=BCller=2DKlieser?= <s.mueller-klieser@phytec.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Fix do_shared_workdir task ordering
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
X-List-Received-Date: Tue, 11 Aug 2015 03:23:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2015 at 11:21 AM, Stefan M=C3=BCller-Klieser
<s.mueller-klieser@phytec.de> wrote:
> commit 02d0a003d60326 [kernel.bbclass: Fix race condition] has surfaced
> a bug in the generation of the shared_workdir. The task
> do_compile_kernelmodules adds the exported symbols of the kernel modules
> to the Module.symvers. By creating the shared_workdir before the modules
> are compiled, the symbols of the modules are missing in the
> shared_workdir. Subsequent external module builds will not include the
> ABI CRC of functions exported in modules. Modprobe will fail to load the
> external module if CONFIG_MODVERSIONS is enabled.\

Have you seen our bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
8127 ?

It's new .. so probably not.

The significant issue with this, is that we are now forcing anyone
that needs the
shared workdir artifacts to build kernel modules.

That's performance issue for many workflows.

I had some changes where I was working to short cut parts of the process, b=
ut
they turned out to miss a few corner cases.

We need to do more thinking on this one, before we can bring in a change li=
ke
this .. since avoiding that overhead is something valuable.

Cheers,

Bruce


>
> Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index d06f6cf..473f1f8 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -249,7 +249,7 @@ kernel_do_install() {
>  }
>  do_install[prefuncs] +=3D "package_get_auto_pr"
>
> -addtask shared_workdir after do_compile before do_compile_kernelmodules
> +addtask shared_workdir after do_compile_kernelmodules before do_install
>  addtask shared_workdir_setscene
>
>  do_shared_workdir_setscene () {
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

