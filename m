Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 058AE600BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 20:51:28 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 19 Oct 2016 13:51:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,367,1473145200"; d="scan'208";a="181610146"
Received: from jzhang80-mac02.jf.intel.com ([10.24.8.203])
	by fmsmga004.fm.intel.com with ESMTP; 19 Oct 2016 13:51:30 -0700
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 10.0 \(3226\))
Message-Id: <CBD43570-CA3D-4834-86EC-44B3E8EE6D02@linux.intel.com>
Date: Wed, 19 Oct 2016 13:51:29 -0700
To: OE-core <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.3226)
Subject: Question for OE variable "LABELS"
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
X-List-Received-Date: Wed, 19 Oct 2016 20:51:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The current OE document has this LABELS variable and OE has some code to =
support its usage. But if I just set LABELS in a BSP conf or local.conf =
file, the build will show the warning message:

WARNING: core-image-minimal-1.0-r0 do_bootimg: Found potential =
conflicted var LABELS, please use LABELS_LIVE rather than LABELS"

Does anyone know a =E2=80=9Cproper=E2=80=9D usage of LABELS so it =
won=E2=80=99t trigger the warning message? =46rom the code I dig out, it =
doesn=E2=80=99t seem so:

in meta//classes/live-vm-common.bbclass:

def set_live_vm_vars(d, suffix):
    vars =3D ['GRUB_CFG', 'SYSLINUX_CFG', 'ROOT', 'LABELS', 'INITRD']
    for var in vars:
        var_with_suffix =3D var + '_' + suffix
        if d.getVar(var, True):
            bb.warn('Found potential conflicted var %s, please use %s =
rather than %s' % \
                (var, var_with_suffix, var))
        elif d.getVar(var_with_suffix, True):
            d.setVar(var, d.getVar(var_with_suffix, True))

Notice there is another corner case of false alarm when LABELS have same =
value of LABEL_LIVE or VM.

I can have a small patch to change it, but hope to know the intended =
behaviors first.

Thanks=

