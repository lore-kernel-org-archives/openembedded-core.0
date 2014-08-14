Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD95B601A0;
	Thu, 14 Aug 2014 02:13:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7E2D0j8003884
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Aug 2014 19:13:00 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 13 Aug 2014 19:12:59 -0700
Message-ID: <53EC1B2A.8070503@windriver.com>
Date: Thu, 14 Aug 2014 10:12:58 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>, Cristian Iorga
	<cristian.iorga@intel.com>
References: <20140811095511.ADAAF503E6@opal.openembedded.org>
	<20140813204025.GZ14848@jama>
In-Reply-To: <20140813204025.GZ14848@jama>
X-Originating-IP: [128.224.162.231]
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : qemu: upgrade to 2.1
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
X-List-Received-Date: Thu, 14 Aug 2014 02:13:07 -0000
Content-Type: multipart/alternative;
	boundary="------------050704030300080602030606"

--------------050704030300080602030606
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014?08?14? 04:40, Martin Jansa wrote:
> On Mon, Aug 11, 2014 at 09:55:11AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 3ae32d0d6c7cf8294300f32d346da36748e05f3d
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=3ae32d0d6c7cf8294300f32d346da36748e05f3d
>>
>> Author: Cristian Iorga <cristian.iorga@intel.com>
>> Date:   Wed Aug  6 10:43:25 2014 +0300
>>
>> qemu: upgrade to 2.1
>>
> This causes new QA warning:
> qemu-2.1.0: qemu rdepends on lzo, but it isn't a build dependency? [build-deps]

I  built qemu-2.1.0 for qemux86 and no such warning. What's the arch the 
warning shows and does it need other configs?

Regards,
Kai

>
> please fix that
>
>> QEMU 2.1 comes with fixes and improvements.
>> See http://wiki.qemu.org/ChangeLog/2.1 for details.
>> - Added config for quorum support, depending on gnutls.
>> - pcie_better_hotplug_support.patch removed,
>> integrated upstream.
>> - Qemu-Arm-versatilepb-Add-memory-size-checking.patch updated
>> to 2.1 source code.
>> - no-strip.patch removed, no longer necessary due to code changes.
>>
>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>   ...-Arm-versatilepb-Add-memory-size-checking.patch |  2 +-
>>   .../qemu/files/pcie_better_hotplug_support.patch   | 74 ----------------------
>>   meta/recipes-devtools/qemu/qemu.inc                |  2 +-
>>   meta/recipes-devtools/qemu/qemu/no-strip.patch     | 15 -----
>>   .../qemu/{qemu_2.0.0.bb => qemu_2.1.0.bb}          |  7 +-
>>   5 files changed, 4 insertions(+), 96 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
>> index 3834aed..7f1c5a9 100644
>> --- a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
>> +++ b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
>> @@ -32,7 +32,7 @@ index b48d84c..ad2cd5a 100644
>>   +                ((unsigned int)ram_size / (1 << 20)));
>>   +        exit(1);
>>   +    }
>> -     memory_region_init_ram(ram, NULL, "versatile.ram", args->ram_size);
>> +     memory_region_init_ram(ram, NULL, "versatile.ram", machine->ram_size);
>>        vmstate_register_ram_global(ram);
>>        /* ??? RAM should repeat to fill physical memory space.  */
>>   --
>> diff --git a/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch b/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch
>> deleted file mode 100644
>> index c7035b2..0000000
>> --- a/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch
>> +++ /dev/null
>> @@ -1,74 +0,0 @@
>> -The current code is broken: it does surprise removal which crashes guests.
>> -
>> -Reimplemented the steps:
>> - - Hotplug triggers both 'present detect change' and
>> -   'attention button pressed'.
>> -
>> - - Hotunplug starts by triggering 'attention button pressed',
>> -   then waits for the OS to power off the device and only
>> -   then detaches it.
>> -
>> -Fixes CVE-2014-3471.
>> -
>> -Originated-by: Marcel Apfelbaum <address@hidden>
>> -Updated-by: Daniel BORNAZ <daniel.bornaz@enea.com>
>> -
>> ---- a/hw/pci/pcie.c	2014-04-17 15:44:44.000000000 +0200
>> -+++ b/hw/pci/pcie.c	2014-07-15 13:03:16.905070562 +0200
>> -@@ -258,7 +258,8 @@ void pcie_cap_slot_hotplug_cb(HotplugHan
>> -
>> -     pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
>> -                                PCI_EXP_SLTSTA_PDS);
>> --    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev), PCI_EXP_HP_EV_PDC);
>> -+    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev),
>> -+                        PCI_EXP_HP_EV_PDC | PCI_EXP_HP_EV_ABP);
>> - }
>> -
>> - void pcie_cap_slot_hot_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>> -@@ -268,10 +269,7 @@ void pcie_cap_slot_hot_unplug_cb(Hotplug
>> -
>> -     pcie_cap_slot_hotplug_common(PCI_DEVICE(hotplug_dev), dev, &exp_cap, errp);
>> -
>> --    object_unparent(OBJECT(dev));
>> --    pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
>> --                                 PCI_EXP_SLTSTA_PDS);
>> --    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev), PCI_EXP_HP_EV_PDC);
>> -+    pcie_cap_slot_push_attention_button(PCI_DEVICE(hotplug_dev));
>> - }
>> -
>> - /* pci express slot for pci express root/downstream port
>> -@@ -352,6 +350,11 @@ void pcie_cap_slot_reset(PCIDevice *dev)
>> -     hotplug_event_update_event_status(dev);
>> - }
>> -
>> -+static void pcie_unplug_device(PCIBus *bus, PCIDevice *dev, void *opaque)
>> -+{
>> -+    object_unparent(OBJECT(dev));
>> -+}
>> -+
>> - void pcie_cap_slot_write_config(PCIDevice *dev,
>> -                                 uint32_t addr, uint32_t val, int len)
>> - {
>> -@@ -376,6 +379,22 @@ void pcie_cap_slot_write_config(PCIDevic
>> -                         sltsta);
>> -     }
>> -
>> -+    /*
>> -+     * If the slot is polulated, power indicator is off and power
>> -+     * controller is off, it is safe to detach the devices.
>> -+     */
>> -+    if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
>> -+        ((val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF)) {
>> -+            PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
>> -+            pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
>> -+                                pcie_unplug_device, NULL);
>> -+
>> -+            pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
>> -+                                         PCI_EXP_SLTSTA_PDS);
>> -+            pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
>> -+                                       PCI_EXP_SLTSTA_PDC);
>> -+    }
>> -+
>> -     hotplug_event_notify(dev);
>> -
>> -     /*
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
>> index 84330ae..57907ae 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -17,7 +17,6 @@ QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
>>   
>>   SRC_URI = "\
>>       file://powerpc_rom.bin \
>> -    file://no-strip.patch \
>>       file://larger_default_ram_size.patch \
>>       file://disable-grabs.patch \
>>       file://exclude-some-arm-EABI-obsolete-syscalls.patch \
>> @@ -89,6 +88,7 @@ PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap a
>>   PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
>>   PACKAGECONFIG[xfs] = "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
>>   PACKAGECONFIG[xen] = "--enable-xen, --disable-xen,,"
>> +PACKAGECONFIG[quorum] = "--enable-quorum, --disable-quorum, gnutls,"
>>   PACKAGECONFIG[vnc-tls] = "--enable-vnc --enable-vnc-tls,--disable-vnc-tls, gnutls,"
>>   PACKAGECONFIG[vnc-ws] = "--enable-vnc --enable-vnc-ws,--disable-vnc-ws, gnutls,"
>>   PACKAGECONFIG[vnc-sasl] = "--enable-vnc --enable-vnc-sasl,--disable-vnc-sasl,cyrus-sasl,"
>> diff --git a/meta/recipes-devtools/qemu/qemu/no-strip.patch b/meta/recipes-devtools/qemu/qemu/no-strip.patch
>> deleted file mode 100644
>> index d6a4377..0000000
>> --- a/meta/recipes-devtools/qemu/qemu/no-strip.patch
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -Upstream-Status: Inappropriate [configuration]
>> -
>> -Index: qemu-0.14.0/Makefile
>> -===================================================================
>> ---- qemu-0.14.0.orig/Makefile
>> -+++ qemu-0.14.0/Makefile
>> -@@ -235,7 +235,7 @@ install-sysconfig:
>> - install: all $(if $(BUILD_DOCS),install-doc) install-sysconfig
>> - 	$(INSTALL_DIR) "$(DESTDIR)$(bindir)"
>> - ifneq ($(TOOLS),)
>> --	$(INSTALL_PROG) $(STRIP_OPT) $(TOOLS) "$(DESTDIR)$(bindir)"
>> -+	$(INSTALL_PROG) $(TOOLS) "$(DESTDIR)$(bindir)"
>> - endif
>> - ifneq ($(BLOBS),)
>> - 	$(INSTALL_DIR) "$(DESTDIR)$(datadir)"
>> diff --git a/meta/recipes-devtools/qemu/qemu_2.0.0.bb b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
>> similarity index 81%
>> rename from meta/recipes-devtools/qemu/qemu_2.0.0.bb
>> rename to meta/recipes-devtools/qemu/qemu_2.1.0.bb
>> index 9a530a6..abf8dfc 100644
>> --- a/meta/recipes-devtools/qemu/qemu_2.0.0.bb
>> +++ b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
>> @@ -5,14 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
>>   
>>   SRC_URI += "file://qemu-enlarge-env-entry-size.patch \
>>               file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
>> -            file://pcie_better_hotplug_support.patch \
>>               "
>>   
>> -
>> -
>>   SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
>> -SRC_URI[md5sum] = "2790f44fd76da5de5024b4aafeb594c2"
>> -SRC_URI[sha256sum] = "60cc1aa0cad39cec891f970bed60ca8a484f071adad4943123599ac223543a3b"
>> +SRC_URI[md5sum] = "6726977292b448cbc7f89998fac6983b"
>> +SRC_URI[sha256sum] = "397e23184f4bf613589a8fe0c6542461dc2afdf17ed337e97e6fd2f31e8f8802"
>>   
>>   COMPATIBLE_HOST_class-target_mips64 = "null"
>>   
>>
>> -- 
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>
>


-- 
Regards,
Neil | Kai Kang


--------------050704030300080602030606
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2014&#24180;08&#26376;14&#26085; 04:40, Martin Jansa
      wrote:<br>
    </div>
    <blockquote cite="mid:20140813204025.GZ14848@jama" type="cite">
      <pre wrap="">On Mon, Aug 11, 2014 at 09:55:11AM +0000, <a class="moz-txt-link-abbreviated" href="mailto:git@git.openembedded.org">git@git.openembedded.org</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Module: openembedded-core.git
Branch: master
Commit: 3ae32d0d6c7cf8294300f32d346da36748e05f3d
URL:    <a class="moz-txt-link-freetext" href="http://git.openembedded.org/?p=openembedded-core.git&amp;a=commit;h=3ae32d0d6c7cf8294300f32d346da36748e05f3d">http://git.openembedded.org/?p=openembedded-core.git&amp;a=commit;h=3ae32d0d6c7cf8294300f32d346da36748e05f3d</a>

Author: Cristian Iorga <a class="moz-txt-link-rfc2396E" href="mailto:cristian.iorga@intel.com">&lt;cristian.iorga@intel.com&gt;</a>
Date:   Wed Aug  6 10:43:25 2014 +0300

qemu: upgrade to 2.1

</pre>
      </blockquote>
      <pre wrap="">
This causes new QA warning:
qemu-2.1.0: qemu rdepends on lzo, but it isn't a build dependency? [build-deps]</pre>
    </blockquote>
    <br>
    I&nbsp; built qemu-2.1.0 for qemux86 and no such warning. What's the arch
    the warning shows and does it need other configs?<br>
    <br>
    Regards,<br>
    Kai<br>
    <br>
    <blockquote cite="mid:20140813204025.GZ14848@jama" type="cite">
      <pre wrap="">

please fix that

</pre>
      <blockquote type="cite">
        <pre wrap="">QEMU 2.1 comes with fixes and improvements.
See <a class="moz-txt-link-freetext" href="http://wiki.qemu.org/ChangeLog/2.1">http://wiki.qemu.org/ChangeLog/2.1</a> for details.
- Added config for quorum support, depending on gnutls.
- pcie_better_hotplug_support.patch removed,
integrated upstream.
- Qemu-Arm-versatilepb-Add-memory-size-checking.patch updated
to 2.1 source code.
- no-strip.patch removed, no longer necessary due to code changes.

Signed-off-by: Cristian Iorga <a class="moz-txt-link-rfc2396E" href="mailto:cristian.iorga@intel.com">&lt;cristian.iorga@intel.com&gt;</a>
Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>

---

 ...-Arm-versatilepb-Add-memory-size-checking.patch |  2 +-
 .../qemu/files/pcie_better_hotplug_support.patch   | 74 ----------------------
 meta/recipes-devtools/qemu/qemu.inc                |  2 +-
 meta/recipes-devtools/qemu/qemu/no-strip.patch     | 15 -----
 .../qemu/{qemu_2.0.0.bb =&gt; qemu_2.1.0.bb}          |  7 +-
 5 files changed, 4 insertions(+), 96 deletions(-)

diff --git a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
index 3834aed..7f1c5a9 100644
--- a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
+++ b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
@@ -32,7 +32,7 @@ index b48d84c..ad2cd5a 100644
 +                ((unsigned int)ram_size / (1 &lt;&lt; 20)));
 +        exit(1);
 +    }
-     memory_region_init_ram(ram, NULL, "versatile.ram", args-&gt;ram_size);
+     memory_region_init_ram(ram, NULL, "versatile.ram", machine-&gt;ram_size);
      vmstate_register_ram_global(ram);
      /* ??? RAM should repeat to fill physical memory space.  */
 -- 
diff --git a/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch b/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch
deleted file mode 100644
index c7035b2..0000000
--- a/meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-The current code is broken: it does surprise removal which crashes guests.
-
-Reimplemented the steps:
- - Hotplug triggers both 'present detect change' and
-   'attention button pressed'.
-
- - Hotunplug starts by triggering 'attention button pressed',
-   then waits for the OS to power off the device and only
-   then detaches it.
-
-Fixes CVE-2014-3471.
-
-Originated-by: Marcel Apfelbaum &lt;address@hidden&gt;
-Updated-by: Daniel BORNAZ <a class="moz-txt-link-rfc2396E" href="mailto:daniel.bornaz@enea.com">&lt;daniel.bornaz@enea.com&gt;</a>
-
---- a/hw/pci/pcie.c	2014-04-17 15:44:44.000000000 +0200
-+++ b/hw/pci/pcie.c	2014-07-15 13:03:16.905070562 +0200
-@@ -258,7 +258,8 @@ void pcie_cap_slot_hotplug_cb(HotplugHan
- 
-     pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
-                                PCI_EXP_SLTSTA_PDS);
--    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev), PCI_EXP_HP_EV_PDC);
-+    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev),
-+                        PCI_EXP_HP_EV_PDC | PCI_EXP_HP_EV_ABP);
- }
- 
- void pcie_cap_slot_hot_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
-@@ -268,10 +269,7 @@ void pcie_cap_slot_hot_unplug_cb(Hotplug
- 
-     pcie_cap_slot_hotplug_common(PCI_DEVICE(hotplug_dev), dev, &amp;exp_cap, errp);
- 
--    object_unparent(OBJECT(dev));
--    pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
--                                 PCI_EXP_SLTSTA_PDS);
--    pcie_cap_slot_event(PCI_DEVICE(hotplug_dev), PCI_EXP_HP_EV_PDC);
-+    pcie_cap_slot_push_attention_button(PCI_DEVICE(hotplug_dev));
- }
- 
- /* pci express slot for pci express root/downstream port
-@@ -352,6 +350,11 @@ void pcie_cap_slot_reset(PCIDevice *dev)
-     hotplug_event_update_event_status(dev);
- }
- 
-+static void pcie_unplug_device(PCIBus *bus, PCIDevice *dev, void *opaque)
-+{
-+    object_unparent(OBJECT(dev));
-+}
-+
- void pcie_cap_slot_write_config(PCIDevice *dev,
-                                 uint32_t addr, uint32_t val, int len)
- {
-@@ -376,6 +379,22 @@ void pcie_cap_slot_write_config(PCIDevic
-                         sltsta);
-     }
- 
-+    /*
-+     * If the slot is polulated, power indicator is off and power
-+     * controller is off, it is safe to detach the devices.
-+     */
-+    if ((sltsta &amp; PCI_EXP_SLTSTA_PDS) &amp;&amp; (val &amp; PCI_EXP_SLTCTL_PCC) &amp;&amp;
-+        ((val &amp; PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF)) {
-+            PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
-+            pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-+                                pcie_unplug_device, NULL);
-+
-+            pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
-+                                         PCI_EXP_SLTSTA_PDS);
-+            pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
-+                                       PCI_EXP_SLTSTA_PDC);
-+    }
-+
-     hotplug_event_notify(dev);
- 
-     /* 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 84330ae..57907ae 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -17,7 +17,6 @@ QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
 
 SRC_URI = "\
     <a class="moz-txt-link-freetext" href="file://powerpc_rom.bin">file://powerpc_rom.bin</a> \
-    <a class="moz-txt-link-freetext" href="file://no-strip.patch">file://no-strip.patch</a> \
     <a class="moz-txt-link-freetext" href="file://larger_default_ram_size.patch">file://larger_default_ram_size.patch</a> \
     <a class="moz-txt-link-freetext" href="file://disable-grabs.patch">file://disable-grabs.patch</a> \
     <a class="moz-txt-link-freetext" href="file://exclude-some-arm-EABI-obsolete-syscalls.patch">file://exclude-some-arm-EABI-obsolete-syscalls.patch</a> \
@@ -89,6 +88,7 @@ PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap a
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
 PACKAGECONFIG[xfs] = "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
 PACKAGECONFIG[xen] = "--enable-xen, --disable-xen,,"
+PACKAGECONFIG[quorum] = "--enable-quorum, --disable-quorum, gnutls,"
 PACKAGECONFIG[vnc-tls] = "--enable-vnc --enable-vnc-tls,--disable-vnc-tls, gnutls,"
 PACKAGECONFIG[vnc-ws] = "--enable-vnc --enable-vnc-ws,--disable-vnc-ws, gnutls,"
 PACKAGECONFIG[vnc-sasl] = "--enable-vnc --enable-vnc-sasl,--disable-vnc-sasl,cyrus-sasl,"
diff --git a/meta/recipes-devtools/qemu/qemu/no-strip.patch b/meta/recipes-devtools/qemu/qemu/no-strip.patch
deleted file mode 100644
index d6a4377..0000000
--- a/meta/recipes-devtools/qemu/qemu/no-strip.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: qemu-0.14.0/Makefile
-===================================================================
---- qemu-0.14.0.orig/Makefile
-+++ qemu-0.14.0/Makefile
-@@ -235,7 +235,7 @@ install-sysconfig:
- install: all $(if $(BUILD_DOCS),install-doc) install-sysconfig
- 	$(INSTALL_DIR) "$(DESTDIR)$(bindir)"
- ifneq ($(TOOLS),)
--	$(INSTALL_PROG) $(STRIP_OPT) $(TOOLS) "$(DESTDIR)$(bindir)"
-+	$(INSTALL_PROG) $(TOOLS) "$(DESTDIR)$(bindir)"
- endif
- ifneq ($(BLOBS),)
- 	$(INSTALL_DIR) "$(DESTDIR)$(datadir)"
diff --git a/meta/recipes-devtools/qemu/qemu_2.0.0.bb b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
similarity index 81%
rename from meta/recipes-devtools/qemu/qemu_2.0.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.1.0.bb
index 9a530a6..abf8dfc 100644
--- a/meta/recipes-devtools/qemu/qemu_2.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
@@ -5,14 +5,11 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac\SRC_URI+=">"file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 
 SRC_URI += "</a<a class="moz-txt-link-rfc2396E" href="file://qemu-enlarge-env-entry-size.patch\file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch\-file://pcie_better_hotplug_support.patch\">"file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
-            file://pcie_better_hotplug_support.patch \
             "</a>
 
-
-
 SRC_URI_prepend = <a class="moz-txt-link-rfc2396E" href="http://wiki.qemu-project.org/download/${BP}.tar.bz2">"http://wiki.qemu-project.org/download/${BP}.tar.bz2"</a>
-SRC_URI[md5sum] = "2790f44fd76da5de5024b4aafeb594c2"
-SRC_URI[sha256sum] = "60cc1aa0cad39cec891f970bed60ca8a484f071adad4943123599ac223543a3b"
+SRC_URI[md5sum] = "6726977292b448cbc7f89998fac6983b"
+SRC_URI[sha256sum] = "397e23184f4bf613589a8fe0c6542461dc2afdf17ed337e97e6fd2f31e8f8802"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
 

-- 
_______________________________________________
Openembedded-commits mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-commits@lists.openembedded.org">Openembedded-commits@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-commits">http://lists.openembedded.org/mailman/listinfo/openembedded-commits</a>
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------050704030300080602030606--
