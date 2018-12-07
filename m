Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BC3F66C129
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2018 11:02:32 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wB7B2VVi022857
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 7 Dec 2018 11:02:32 GMT
Message-ID: <653c2aafab5fa07d5c41b2fb29675a154db4a5a5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 07 Dec 2018 11:02:31 +0000
In-Reply-To: <4e980624cf550689a95a3847a3dc1103975b1d8c.1544066027.git.Qi.Chen@windriver.com>
References: <cover.1544066027.git.Qi.Chen@windriver.com>
	<4e980624cf550689a95a3847a3dc1103975b1d8c.1544066027.git.Qi.Chen@windriver.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] oeqa: drop support of listing machines in QEMU_USE_KVM
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
X-List-Received-Date: Fri, 07 Dec 2018 11:02:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-12-06 at 14:30 +0800, Chen Qi wrote:
> We want QEMU_USE_KVM to only set to some boolean value, with possible
> MACHINE override. Drop the support of listing machines in this variable,
> and give users error message if they still do so.
> 
> Error message below is an example.
> 
> ERROR: core-image-minimal-1.0-r0 do_testimage: Invalid boolean value 'intel-corei7-64 intel-core2-32 qemux86 qemux86-64'
> QEMU_USE_KVM needs to be set to a boolean value. It no longer supports accepting a list of machines.
>   e.g.
>   QEMU_USE_KVM_qemux86-64 = '1'
> ERROR: core-image-minimal-1.0-r0 do_testimage: Function failed: do_testimage
> 
> QB_CPU_KVM is also checked to determine whether to enable kvm.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/testimage.bbclass | 12 +++++++-----
>  meta/lib/oeqa/targetcontrol.py | 12 +++++++-----
>  2 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> index 82cbb06..3353d133 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -229,11 +229,13 @@ def testimage_main(d):
>  
>      # Get use_kvm
>      qemu_use_kvm = d.getVar("QEMU_USE_KVM")
> -    if qemu_use_kvm and \
> -       (d.getVar('MACHINE') in qemu_use_kvm.split() or \
> -        oe.types.boolean(qemu_use_kvm) and 'x86' in machine):
> -        kvm = True
> -    else:
> +    try:
> +        kvm = oe.types.boolean(qemu_use_kvm)
> +    except ValueError as e:
> +        bb.fatal("%s\nQEMU_USE_KVM needs to be set to a boolean value. It no longer supports accepting a list of machines.\n"
> +                 "  e.g.\n"
> +                 "  QEMU_USE_KVM_qemux86-64 = '1'" % e)
> +    if kvm and not d.getVar('QB_CPU_KVM'):
>          kvm = False
>  
>      slirp = False
> diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
> index 59a9c35..d21823b 100644
> --- a/meta/lib/oeqa/targetcontrol.py
> +++ b/meta/lib/oeqa/targetcontrol.py
> @@ -108,11 +108,13 @@ class QemuTarget(BaseTarget):
>          dump_host_cmds = d.getVar("testimage_dump_host")
>          dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
>          qemu_use_kvm = d.getVar("QEMU_USE_KVM")
> -        if qemu_use_kvm and \
> -           (oe.types.boolean(qemu_use_kvm) and "x86" in d.getVar("MACHINE") or \
> -            d.getVar("MACHINE") in qemu_use_kvm.split()):
> -            use_kvm = True
> -        else:
> +        try:
> +            use_kvm = oe.types.boolean(qemu_use_kvm)
> +        except ValueError as e:
> +            bb.fatal("%s\nQEMU_USE_KVM needs to be set to a boolean value. It no longer supports accepting a list of machines.\n"
> +                     "  e.g.\n"
> +                     "  QEMU_USE_KVM_qemux86-64 = '1'" % e)
> +        if use_kvm and not d.getVar('QB_CPU_KVM'):
>              use_kvm = False
>  
>          # Log QemuRunner log output to a file

Unfortunately this still isn't going to work quite as I mentioned.

We've about to add an aarch64 server to our autobuilder infrastructure.
We need that to use kvm for arm targets but not x86 ones yet have x86
targets use kvm on x86 hardware too.

I appreciate that isn't how the code works now but we may as well fix
this properly once and for all.

Cheers,

Richard



