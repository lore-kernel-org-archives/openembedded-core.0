Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 43E35610DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 04:55:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8Q4thKr024158
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Sep 2013 21:55:43 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.22.238) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 25 Sep 2013 21:55:43 -0700
Message-ID: <5243B779.3080607@windriver.com>
Date: Thu, 26 Sep 2013 00:26:33 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1380142751.18603.344.camel@ted>
In-Reply-To: <1380142751.18603.344.camel@ted>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Use correct kvm CPU options for qemux86* with kvm
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
X-List-Received-Date: Thu, 26 Sep 2013 04:55:47 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-09-25 4:59 PM, Richard Purdie wrote:
> The existing -cpu host option caused kernel panics when people attempted to use
> the kvm option. After research and discussion, the best options appear to
> be the kvm32/kvm64 cpu types so lets use these instead. These resolve
> the kernel issues for me.

Late to the party, and discussion, but agreed. This change looks good
for this point in 1.5.

Cheers,

Bruce

>
> [YOCTO #3908]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/scripts/runqemu b/scripts/runqemu
> index efab1a2..12c58d9 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -265,7 +265,11 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
>           exit 1;
>       fi
>       if [ -w /dev/kvm -a -r /dev/kvm ]; then
> -        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu host"
> +        if [ "x$MACHINE" = "xqemux86" ]; then
> +            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu kvm32"
> +        elif [ "x$MACHINE" = "xqemux86-64" ]; then
> +            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu kvm64"
> +        fi
>           KVM_ACTIVE="yes"
>       else
>           echo "You have no rights on /dev/kvm."
>
>


