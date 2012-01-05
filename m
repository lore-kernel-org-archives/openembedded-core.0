Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Ripxm-0005UP-QQ
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 17:14:47 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q05G7MUi024145
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jan 2012 08:07:22 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 5 Jan 2012 08:07:21 -0800
Message-ID: <4F05CAB9.4020001@windriver.com>
Date: Thu, 5 Jan 2012 10:07:21 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: MIPS Prelinker problem -- possible fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jan 2012 16:14:47 -0000
X-Groupsio-MsgNum: 15375
Content-Type: multipart/mixed; boundary="------------010900080301060605070607"

--------------010900080301060605070607
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I have created a patch (with help from Khem Raj) to resolve a long standing 
issue w/ the MIPS prelinker.  The prelinker was detecting a error condition 
based on what appears to be some incomplete math calculations.

Attached is a patch that I believe will fix the problem, but I would like folks 
on both MIPS and non MIPS system to try it out.

If I don't hear about any issues (and my testing continues to progress 
successfully), I intend to commit it to the upstream cross-prelink repository 
early next week.

--Mark

--------------010900080301060605070607
Content-Type: text/plain; x-mac-type=0; x-mac-creator=0;
	name="mips-prelinker.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="mips-prelinker.patch"

commit 65b8dfda2bb1d23a194daafec8fdd23e8997e528
Author: Mark Hatle <mark.hatle@windriver.com>
Date:   Wed Jan 4 14:59:00 2012 -0600

    MIPS Prelink fix: Testing do not merge!
    
    This is a possible fix for MIPS prelinking problems as described in the
    yoctoproject bugzilla: http://bugzilla.yoctoproject.org/show_bug.cgi?id=1463
    
    The purpose of this patch is to allow folks to test it before it's
    applied to the upstream sources.
    
    Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

diff --git a/meta/recipes-devtools/prelink/prelink/prelink-mips.patch b/meta/recipes-devtools/prelink/prelink/prelink-mips.patch
new file mode 100644
index 0000000..d7d4a80
--- /dev/null
+++ b/meta/recipes-devtools/prelink/prelink/prelink-mips.patch
@@ -0,0 +1,81 @@
+commit 3233963574d9e6a13b7d6977879c0dfd7caeb310
+Author: Mark Hatle <mark.hatle@windriver.com>
+Date:   Wed Jan 4 14:30:38 2012 -0600
+
+    Fix MIPS non-NOBITS after NOBITS in segment error
+    
+    With recent compilers and linkers it is typical for a MIPS binary to
+    be built with the sections such as:
+    
+      [23] .got              PROGBITS        004aafb0 09afb0 00055c 04 WAp  0   0 16
+      [24] .sdata            PROGBITS        004ab50c 09b50c 000004 00 WAp  0   0  4
+      [25] .sbss             NOBITS          004ab510 09b510 00003d 00 WAp  0   0  4
+      [26] .bss              NOBITS          004ab550 09b510 0021cc 00  WA  0   0 16
+      [27] .dynstr           STRTAB          004bb510 09b510 000b99 00   A  0   0  1
+      [28] .gnu.attributes   LOOS+ffffff5    00000000 09c0a9 000010 00      0   0  1
+      [29] .mdebug.abi32     PROGBITS        004ad71c 09c0b9 000000 00      0   0  1
+      [30] .gnu_debuglink    PROGBITS        00000000 09c0b9 00000c 00      0   0  1
+      [31] .gnu.prelink_undo PROGBITS        00000000 09c0c8 0005bc 01      0   0  4
+    
+    When determining if a section is within a segment, simply checking
+    that it fits within the boundries of that segment is not enough.  In
+    the above example, the .mdebug.abi32 fits within the boundries of the
+    third segment.  However with a size of 0 there is nothing for the
+    prelinker to do.  The validation that non-NOBITS sections can't come
+    after a PROGBITS fails, because it incorectly assumes that it is
+    part of the same section as .sbss, and .bss.
+    
+    Using elfutils readelf as a guide, a check was missing in the mapping
+    function that the section had a size > 0.  Binutils has a similar
+    check, but it is a bit more specific that the address of a section
+    can not start at the end of a segment.  The size > 0 was an easier
+    and more obvious check, which is why it was used.
+    
+    2012-01-04  Mark Hatle <mark.hatle@windriver.com>
+            * exec.c: Check that a section is larger then 0 bytes when
+              determining the section to segment mapping.  This matches
+              the behavior of elfutils - readelf.  Otherwise an empty
+              PROGBITS section at the end of a segment will cause a
+              failure.
+    
+    Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff --git a/trunk/ChangeLog.cross b/trunk/ChangeLog.cross
+index ccb974c..6e350f9 100644
+--- trunk/ChangeLog.cross
++++ trunk/ChangeLog.cross
+@@ -1,3 +1,10 @@
++2012-01-04  Mark Hatle <mark.hatle@windriver.com>
++	* exec.c: Check that a section is larger then 0 bytes when
++	  determining the section to segment mapping.  This matches
++	  the behavior of elfutils - readelf.  Otherwise an empty
++	  PROGBITS section at the end of a segment will cause a
++	  failure.
++
+ 2011-12-08  Mark Hatle <mark.hatle@windriver.com>
+ 	* rtld/rtld.c: Fix an issue where missing objects would trigger
+ 	  an assert in dl-version.c
+diff --git a/trunk/src/exec.c b/trunk/src/exec.c
+index 7c8f38f..cf38b72 100644
+--- trunk/src/exec.c
++++ trunk/src/exec.c
+@@ -500,7 +500,8 @@ error_out:
+ 	int sfirst = 0, slast = 0, last = 0;
+ 
+ 	for (j = 1; j < dso->ehdr.e_shnum; ++j)
+-	  if (dso->shdr[j].sh_addr >= dso->phdr[i].p_vaddr
++	  if (dso->shdr[j].sh_size > 0
++	      && dso->shdr[j].sh_addr >= dso->phdr[i].p_vaddr
+ 	      && dso->shdr[j].sh_addr + dso->shdr[j].sh_size
+ 		 <= dso->phdr[i].p_vaddr + dso->phdr[i].p_memsz)
+ 	    {
+@@ -572,7 +573,8 @@ error_out:
+ 	  }
+ 
+ 	for (j = 1; j < dso->ehdr.e_shnum; ++j)
+-	  if (dso->shdr[j].sh_addr >= dso->phdr[i].p_vaddr
++	  if (dso->shdr[j].sh_size > 0
++	      && dso->shdr[j].sh_addr >= dso->phdr[i].p_vaddr
+ 	      && dso->shdr[j].sh_addr + dso->shdr[j].sh_size
+ 		 <= dso->phdr[i].p_vaddr + dso->phdr[i].p_memsz)
+ 	    {
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 17141e9..aa5d9a4 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -10,7 +10,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 SRCREV = "bb1b660c5e3859b6c5a2ac8d739713e9989a4dd7"
 PV = "1.0+git${SRCPV}"
-PR = "r8"
+PR = "r8.1"
 
 #
 # The cron script attempts to re-prelink the system daily -- on
@@ -31,7 +31,8 @@ SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;protocol=git \
            file://prelink.conf \
            file://prelink.cron.daily \
            file://prelink.default \
-	   file://macros.prelink"
+	   file://macros.prelink \
+	   file://prelink-mips.patch"
 
 TARGET_OS_ORIG := "${TARGET_OS}"
 OVERRIDES_append = ":${TARGET_OS_ORIG}"

--------------010900080301060605070607--
