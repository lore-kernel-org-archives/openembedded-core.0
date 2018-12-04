Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AA3B16C538
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 12:22:57 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wB4CMufA010578
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 4 Dec 2018 12:22:57 GMT
Message-ID: <3ff98f09aa0bd9611077109a62c85fe18e3f8715.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 04 Dec 2018 12:22:55 +0000
In-Reply-To: <f7c5083f7a1f59bacdd55d166bb9fef20e578c8e.1543899860.git.Qi.Chen@windriver.com>
References: <cover.1543899860.git.Qi.Chen@windriver.com>
	<f7c5083f7a1f59bacdd55d166bb9fef20e578c8e.1543899860.git.Qi.Chen@windriver.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] testimage: fix boolean checking for QEMU_USE_KVM
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
X-List-Received-Date: Tue, 04 Dec 2018 12:22:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-12-04 at 13:04 +0800, Chen Qi wrote:
> If QEMU_USE_KVM is set to a list of machines, when doing testimage
> for a machine outside the list, we will get the following error.
> 
>   Exception: ValueError: Invalid boolean value 'intel-corei7-64
> intel-core2-32 qemux86 qemux86-64'
> 
> This is because oe.types.boolean raises error if the parameter
> is not values like 'true', 'false', etc.
> 
> Fix the boolean checking to avoid the exception.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/testimage.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/testimage.bbclass
> b/meta/classes/testimage.bbclass
> index 82cbb06..80e457b 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -231,7 +231,7 @@ def testimage_main(d):
>      qemu_use_kvm = d.getVar("QEMU_USE_KVM")
>      if qemu_use_kvm and \
>         (d.getVar('MACHINE') in qemu_use_kvm.split() or \
> -        oe.types.boolean(qemu_use_kvm) and 'x86' in machine):
> +        qemu_use_kvm.lower() in ('yes', 'y', 'true', 't', '1') and
> 'x86' in machine):
>          kvm = True
>      else:
>          kvm = False

Personally, I think we should just drop support for listing the
machines in QEMU_USE_KVM and suggest people use overrides instead?

Cheers,

Richard


