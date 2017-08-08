Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A5D0660796
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 15:30:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v78FUkfO001147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 8 Aug 2017 16:30:47 +0100
Message-ID: <1502206246.18633.250.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 08 Aug 2017 16:30:46 +0100
In-Reply-To: <2e63bf95e8a5288464d90567260047217a3617d0.1501494496.git.liezhi.yang@windriver.com>
References: <cover.1501494496.git.liezhi.yang@windriver.com>
	<2e63bf95e8a5288464d90567260047217a3617d0.1501494496.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 08 Aug 2017 16:30:47 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 01/10] oeqa/targetcontrol.py: simplify checking for qemu_use_kvm
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
X-List-Received-Date: Tue, 08 Aug 2017 15:30:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-07-31 at 02:50 -0700, Robert Yang wrote:
> The "if qemu_use_kvm" is not needed.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/lib/oeqa/targetcontrol.py | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/lib/oeqa/targetcontrol.py
> b/meta/lib/oeqa/targetcontrol.py
> index 3255e3a5c63..11e6c820e85 100644
> --- a/meta/lib/oeqa/targetcontrol.py
> +++ b/meta/lib/oeqa/targetcontrol.py
> @@ -132,9 +132,8 @@ class QemuTarget(BaseTarget):
>          dump_host_cmds = d.getVar("testimage_dump_host")
>          dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
>          qemu_use_kvm = d.getVar("QEMU_USE_KVM")
> -        if qemu_use_kvm and \
> -           (qemu_use_kvm == "True" and "x86" in d.getVar("MACHINE") or \
> -            d.getVar("MACHINE") in qemu_use_kvm.split()):
> +        if qemu_use_kvm == "True" and "x86" in d.getVar("MACHINE") or \
> +            d.getVar("MACHINE") in qemu_use_kvm.split():
>              use_kvm = True
>          else:
>              use_kvm = False
> 

It is needed since qemu_use_kvm could be None and None.split() will
cause an error.

Cheers,

Richard

