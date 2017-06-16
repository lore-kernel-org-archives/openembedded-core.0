Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9BC3D78426
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 02:29:25 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d17so2485143wme.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 19:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dO/AEMzngZ0i1hN6DioCEogytYTsErrm2O3yoUTXohE=;
	b=eXuUNSbOv+cYFdL5TnGAFoCSjU4dUCzlNvDODAdNHV5uGamm3zIZtf2UNZnkbdnONC
	z77/kMkfTEO88C9CcDr1M5sV7i8HaWQJPTCrFBG40aVISzai8tPZR6RKenmEIhPo/XbJ
	tkzWP2Kj8p+QNW1ZcYE0tvDJStVu8tFlIHyJojPrXJ9YC/WQ1Rlee8fyJyp2F9WxUXFB
	ekIK8ZRjgjWq6DdttxVg1L226brJwns5JCnhdmXrPGKrXMcYlvyXLkJ4M5+XEDFnX8Ib
	N/lWLY0x90uPHg4FiRB6H+MnG6v85OgbTTFRPeeq0gE60BSofyRWP0XO3WYFM3gkUqKp
	Q8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dO/AEMzngZ0i1hN6DioCEogytYTsErrm2O3yoUTXohE=;
	b=hrd9ffcC+HR04NDEIu0Pez4MogsERTTAMCeJiBu4IcbZ4KJRnkSOSr/JUOSDH15YBX
	m7GkJp9C/14AA0+BMPLfD4AOuC4n0YWhFUTBNirvtPZYiqXiisSUXRl7zsiA16ONfwq9
	ri+Xa/Gj0cpjC0xPO2pqqpBHm9casdLR7At5covKNfWNYlxU/w+1335U8bmyW/uMOdoC
	gmT7YDbvhe8lzKsBz8ehH3KYXdihU5xmiP4mUOsPASk0YgturLvJYmPqEguvcOTRmaFK
	vSOU8bsz5l3D6lhPU0zWtVfeZBu3ZacoHOpFDQ9x0Zj2Qni2tJ8R3kQwkev6arOh7z1+
	gAHg==
X-Gm-Message-State: AKS2vOyHsbOGnysf8IPbiD4bYAwWjFeBIVwOByS5oIeV835dnrbgbnOG
	QX5dnm9B9YUpiGxagww8rdvZcwAShA==
X-Received: by 10.80.151.37 with SMTP id c34mr5773213edb.30.1497580166107;
	Thu, 15 Jun 2017 19:29:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Thu, 15 Jun 2017 19:28:55 -0700 (PDT)
In-Reply-To: <1497447757-30951-3-git-send-email-richard.purdie@linuxfoundation.org>
References: <1497447757-30951-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1497447757-30951-3-git-send-email-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Jun 2017 19:28:55 -0700
Message-ID: <CAMKF1soDPfSjL15dk-NB3_Hsh_rhY-VbULfeH6E32_HN5a5u-g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] package_ipk: Parallelise ipk creation
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
X-List-Received-Date: Fri, 16 Jun 2017 02:29:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 14, 2017 at 6:42 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Allow the creation of ipks to happen in parallel, making best use of resources
> on multiprocessor systems.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/package_ipk.bbclass | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index d2ce3b3..282d212 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -17,6 +17,8 @@ OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKA
>  OPKGLIBDIR = "${localstatedir}/lib"
>
>  python do_package_ipk () {
> +    from multiprocessing import Process
> +
>      oldcwd = os.getcwd()
>
>      workdir = d.getVar('WORKDIR')
> @@ -37,11 +39,24 @@ python do_package_ipk () {
>      if os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"), os.R_OK):
>          os.unlink(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"))
>
> -    for pkg in packages.split():
> -        ipk_write_pkg(pkg, d)
> +    max_process = int(d.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
> +    launched = []
> +    pkgs = packages.split()
> +    while pkgs:
> +        if len(launched) < max_process:
> +            p = Process(target=ipk_write_pkg, args=(pkgs.pop(), d))
> +            p.start()
> +            launched.append(p)
> +        for q in launched:
> +            # The finished processes are joined when calling is_alive()
> +            if not q.is_alive():
> +                launched.remove(q)
> +    for p in launched:
> +        p.join()
>
>      os.chdir(oldcwd)
>  }
> +do_package_ipk[vardepsexclude] = "BB_NUMBER_THREADS"
>
>  def ipk_write_pkg(pkg, d):
>      import re, copy

on a 44 core system, this patch bails out like below. Once I revert
this it works all fine.

ERROR: westeros-wpe-image-1.0-r0 do_rootfs: Unable to install
packages. Command
'/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-musleabi/westeros-wpe-image/1.0-r0/recipe-sysroot-native/usr/bin/opkg
--volatile-cache -f /mnt/a/oe/build/tmp
/work/raspberrypi3-bec-linux-musleabi/westeros-wpe-image/1.0-r0/opkg.conf
-t /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-musleabi/westeros-wpe-image/1.0-r0/temp/ipktemp/
-o /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-musleabi/west
eros-wpe-image/1.0-r0/rootfs  --force_postinstall
--prefer-arch-to-version   install 96boards-tools kernel-modules opkg
packagegroup-core-boot packagegroup-core-ssh-openssh
packagegroup-ml-wpe packagegroup-westeros psplash-raspberrypi run
-postinsts runit runit-serialgetty' returned 255:
Collected errors:
 * opkg_prepare_url_for_install: Couldn't find anything to satisfy
'96boards-tools'.
 * rm_r: Failed to open dir
/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-musleabi/westeros-wpe-image/1.0-r0/temp/ipktemp//opkg-J9PI7V:
No such file or directory.

ERROR: westeros-wpe-image-1.0-r0 do_rootfs: Function failed: do_rootfs

