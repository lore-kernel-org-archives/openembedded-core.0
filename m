Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 075DF75695
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 12:17:26 +0000 (UTC)
Received: by igboe5 with SMTP id oe5so28034420igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 05:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:organization
	:content-type:mime-version:content-transfer-encoding;
	bh=yetTC3uWvvBx9gkaS/S3FidleSds6wlGDkkQH3B1iL0=;
	b=YhqS3ILyHdbJ1JsP4g+3ILBB547T7Ils9PCzgWQEqPWaOg/QGQjxb+IfdxjlvoHI2a
	X/+0fqTFI+ukMnLp9DiYYSrRAYUWvWT32uQSgcmDgg9ZrqxVh0RnI4APABbZnZDScpWT
	oesHMTAeEdOSxyR9UnZO1o8Y1Nt4aSx40ZQmaOm+IhHmUeeSPsn4gIpfUO755ws/ths4
	pBQ+DoTxNGRg8Z2yGCck7onSggPhF7Gm99J+e2R7MZxoVUTNQdGCE3jSioCSN9q2NUZz
	q7KT1C9E18IQ2MmH3SUftPOmKPURei8kJVCGGFgTviQybzinN/zbnNcyJfD1NzFMeTLO
	sDuQ==
X-Gm-Message-State: ALoCoQmcL/WAwTWpXIWzBYVW/iJDYXNez0FymdbgPi+mjNL6fRNUYPqPsw933LwotC9QR/YIkowu
X-Received: by 10.107.131.200 with SMTP id n69mr25791372ioi.53.1434370647875; 
	Mon, 15 Jun 2015 05:17:27 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8CA13.dip0.t-ipconnect.de. [93.232.202.19])
	by mx.google.com with ESMTPSA id u38sm8704510ioi.0.2015.06.15.05.17.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jun 2015 05:17:26 -0700 (PDT)
Message-ID: <1434370643.9085.98.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>, Bruce Ashfield
	<bruce.ashfield@windriver.com>
Date: Mon, 15 Jun 2015 14:17:23 +0200
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: KCONF_AUDIT_LEVEL + kernel_configcheck
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
X-List-Received-Date: Mon, 15 Jun 2015 12:17:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

In Fido and master, the following patch changed the default value of
KCONF_AUDIT_LEVEL:

$ git annotate origin/fido -- meta/classes/kernel-yocto.bbclass | grep KCONF_AUDIT_LEVEL
ad4d5949	(Bruce Ashfield	2015-02-18 16:15:35 -0500	308)    config_check_visibility = int(d.getVar( "KCONF_AUDIT_LEVEL", True ) or 0)
$ git annotate origin/master -- meta/classes/kernel-yocto.bbclass | grep KCONF_AUDIT_LEVEL
ad4d5949	(Bruce Ashfield	2015-02-18 16:15:35 -0500	309)    config_check_visibility = int(d.getVar( "KCONF_AUDIT_LEVEL", True ) or 0)

At least if I read it right, that wasn't the intention. The commit
explicitly says that the default should be 1:

    The visibility of auditing is controlled by KCONF_AUDIT_LEVEL:
    
       0: no reporting
       1: report options that are specified, but not in the final config
       2: report options that are not hardware related, but set by a BSP
    
    The default level is 1, with level 2 and above being for BSP development
    only.

I found that while investigating why having an unsupported config option
in one of my kernel fragments did not result in a warning. However, even
with KCONF_AUDIT_LEVEL="2" in my local.conf, I still only get warnings
about the BSP, but not my unsupported option.

To reproduce, modify poky master as follows and build the default
configuration:

------------------------------------
$ git diff --cached
diff --git a/meta/recipes-kernel/linux/linux-yocto/foobar.cfg b/meta/recipes-kernel/linux/linux-yocto/foobar.cfg
new file mode 100644
index 0000000..f40043a
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto/foobar.cfg
@@ -0,0 +1,2 @@
+CONFIG_FOOBAR=y
+CONFIG_SECURITY_SMACK=y
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index 6218c02..d4b9437 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -38,3 +38,5 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
+
+SRC_URI += "file://foobar.cfg"

...

$ bitbake -f -c kernel_configcheck linux-yocto
Loading cache: 100% |########################################################################################################################################################################################################| ETA:  00:00:00
Loaded 1288 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.27.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Debian-8.0"
TARGET_SYS        = "i586-poky-linux"
MACHINE           = "qemux86"
DISTRO            = "poky"
DISTRO_VERSION    = "1.8+snapshot-20150615"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta              
meta-yocto        
meta-yocto-bsp    = "master:379a030702c985c6e69831173f765a47dfeb8841"

NOTE: Preparing RunQueue
NOTE: Tainting hash to force rebuild of task /work/poky/meta/recipes-kernel/linux/linux-yocto_3.19.bb, do_kernel_configcheck
WARNING: /work/poky/meta/recipes-kernel/linux/linux-yocto_3.19.bb.do_configure is tainted from a forced run
WARNING: /work/poky/meta/recipes-kernel/linux/linux-yocto_3.19.bb.do_kernel_configcheck is tainted from a forced run
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: [kernel config]: BSP specified non-hw configuration:

CONFIG_BLOCK
CONFIG_BT
CONFIG_BT_6LOWPAN
CONFIG_BT_BNEP
CONFIG_BT_BNEP_MC_FILTER
CONFIG_BT_BNEP_PROTO_FILTER
CONFIG_BT_CMTP
CONFIG_BT_HIDP
CONFIG_BT_RFCOMM
CONFIG_BT_RFCOMM_TTY
CONFIG_CFG80211_WEXT
CONFIG_CORDIC
CONFIG_CRC8
CONFIG_EFIVAR_FS
CONFIG_EFI_PARTITION
CONFIG_NET
CONFIG_NETDEVICES
CONFIG_PARTITION_ADVANCED
CONFIG_WEXT_CORE
CONFIG_WEXT_PROC
CONFIG_WIRELESS
------------------------------------

foobar.cfg is used (the CONFIG_SECURITY_SMACK part is used) but the
CONFIG_FOOBAR part of course is not. Shouldn't this trigger the
"specified values did not make it into the kernel's final
configuration"?

There is no mismatch.cfg, only a nonhw_report.cfg. This seems to point
towards an error in the configure task, if I understand the kernel
recipes correctly.

Speaking of nonhw_report.cfg, are there plans to make the core BSPs
clean enough to pass the check without warnings?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




