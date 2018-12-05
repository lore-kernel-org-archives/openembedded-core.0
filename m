Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 38E5F6BD08
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 17:53:30 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wB5HrTAi016597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 5 Dec 2018 17:53:31 GMT
Message-ID: <c6446edc547b26705b9e12f3f4c3e8ded0bb2877.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 05 Dec 2018 17:53:29 +0000
In-Reply-To: <b8fce58a2792f697f0604f85d6b999b666ac0403.1544002055.git.Qi.Chen@windriver.com>
References: <cover.1544002055.git.Qi.Chen@windriver.com>
	<b8fce58a2792f697f0604f85d6b999b666ac0403.1544002055.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Wed, 05 Dec 2018 17:53:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-12-05 at 17:34 +0800, Chen Qi wrote:
> We want QEMU_USE_KVM to only set to some boolean value, with possible
> MACHINE override. Drop the support of listing machines in this
> variable,
> and give users error message if they still do so.
> 
> Error message below is an example.
> 
> ERROR: core-image-minimal-1.0-r0 do_testimage: Invalid boolean value
> 'intel-corei7-64 intel-core2-32 qemux86 qemux86-64'
> QEMU_USE_KVM needs to be set to a boolean value. It no longer
> supports accepting a list of machines.
>   e.g.
>     QEMU_USE_KVM_qemux86-64 = '1'
>     ERROR: core-image-minimal-1.0-r0 do_testimage: Function failed:
> do_testimage
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/testimage.bbclass | 12 ++++++------
>  meta/lib/oeqa/targetcontrol.py | 12 ++++++------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/classes/testimage.bbclass
> b/meta/classes/testimage.bbclass
> index 82cbb06..7c3bc0a 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -229,12 +229,12 @@ def testimage_main(d):
>  
>      # Get use_kvm
>      qemu_use_kvm = d.getVar("QEMU_USE_KVM")
> -    if qemu_use_kvm and \
> -       (d.getVar('MACHINE') in qemu_use_kvm.split() or \
> -        oe.types.boolean(qemu_use_kvm) and 'x86' in machine):
> -        kvm = True
> -    else:
> -        kvm = False
> +    try:
> +        kvm = oe.types.boolean(qemu_use_kvm)
> +    except ValueError as e:
> +        bb.fatal("%s\nQEMU_USE_KVM needs to be set to a boolean
> value. It no longer supports accepting a list of machines.\n"
> +                 "  e.g.\n"
> +                 "  QEMU_USE_KVM_qemux86-64 = '1'" % e)

This drops the x86 piece above. The autobuilder sets:

QEMU_USE_KVM = "True"

which then fails for say qemuarm.

The x86 check is incorrect anyway, it needs to check the BUILD_ARCH is
compatible with TARGET_ARCH.

We can't quite merge this as is though due to the autobuilder breakage.

Cheers,

Richard


