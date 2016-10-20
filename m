Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 138E371B65
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 07:11:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9K7BcO6026338
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Oct 2016 00:11:38 -0700 (PDT)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Oct 2016 00:11:38 -0700
To: Jianxun Zhang <jianxun.zhang@linux.intel.com>, OE-core
	<openembedded-core@lists.openembedded.org>
References: <CBD43570-CA3D-4834-86EC-44B3E8EE6D02@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <09944531-3663-caac-fd43-60e32c478a0f@windriver.com>
Date: Thu, 20 Oct 2016 15:11:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CBD43570-CA3D-4834-86EC-44B3E8EE6D02@linux.intel.com>
Subject: Re: Question for OE variable "LABELS"
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
X-List-Received-Date: Thu, 20 Oct 2016 07:11:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


Hi Jianxun,

On 10/20/2016 04:51 AM, Jianxun Zhang wrote:
> The current OE document has this LABELS variable and OE has some code to support its usage. But if I just set LABELS in a BSP conf or local.conf file, the build will show the warning message:
>
> WARNING: core-image-minimal-1.0-r0 do_bootimg: Found potential conflicted var LABELS, please use LABELS_LIVE rather than LABELS"
>
> Does anyone know a “proper” usage of LABELS so it won’t trigger the warning message? From the code I dig out, it doesn’t seem so:
>
> in meta//classes/live-vm-common.bbclass:
>
> def set_live_vm_vars(d, suffix):
>     vars = ['GRUB_CFG', 'SYSLINUX_CFG', 'ROOT', 'LABELS', 'INITRD']

LIVE images (such iso) and VM images (such as vmdk) can't use the same
settings, for these vars, for example they can't use the same INITRD,
otherwise either of them will fail to boot.

For LABELS, live images usually needs "boot install", but for VM images,
it only needs "boot".

I will send an email to Scott to update the document.

// Robert

>     for var in vars:
>         var_with_suffix = var + '_' + suffix
>         if d.getVar(var, True):
>             bb.warn('Found potential conflicted var %s, please use %s rather than %s' % \
>                 (var, var_with_suffix, var))
>         elif d.getVar(var_with_suffix, True):
>             d.setVar(var, d.getVar(var_with_suffix, True))
>
> Notice there is another corner case of false alarm when LABELS have same value of LABEL_LIVE or VM.
>
> I can have a small patch to change it, but hope to know the intended behaviors first.
>
> Thanks
>

