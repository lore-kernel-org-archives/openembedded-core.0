Return-Path: <alhe@linux.microsoft.com>
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6143560289
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 23:13:12 +0000 (UTC)
Received: from AZSP-ALSAMON-01.redmond.corp.microsoft.com (unknown
	[189.237.233.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0E3AB2010EF9;
	Sat, 14 Mar 2020 16:13:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0E3AB2010EF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1584227593;
	bh=1WDqCfjMr8F/ihjbtAEoaKCWVKPjN1UPDlGInby1WXM=;
	h=From:To:Cc:Subject:Date:From;
	b=gqoilunUmF6ug0m62H7HGUd+ncdhZXmBVou0D0123fwF22WdIFG9K9kovlGg8+T6g
	C53IzSn3iyut4lNpBoihKm+pFovfM58N/Mv2huAVxeDJBU4qVUkHoe/CxeY0fXgusW
	v/I9PAHpI4Ofys6DPkfQfJRFyPNPmI4ShNvqTu1M=
From: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Mar 2020 23:13:11 -0700
Message-Id: <20200315061311.19344-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Windows: Enable Windows builds under WSLv2 and warn accordingly
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
X-List-Received-Date: Sat, 14 Mar 2020 23:13:13 -0000

Due to the architectural changes between Windows Subsystem for Linux v2,
and WSL v1 it should now be possible to run bitbake on the several distros
offered through the Microsoft Store.

WSLv2 is available on Windows 10 build number > 18917

The current build number may be checked by opening a cmd prompt on Windows
and running:

C:\Users\myuser>ver

Microsoft Windows [Version 10.0.19041.113]

If a distro has already been installed via the Microsoft Store, then we can
check which WSL version its using by opening a Windows Powershell (notice this
is a powershell and not a cmd prompt):

C:\WINDOWS\system32> wsl -l -v
  NAME      STATE           VERSION
  * Ubuntu    Running         2
    Debian    Stopped         1

In this case it shows two distros installed, Ubuntu running WSLv2 and
Debian running WSLv1

To change the version of WSL being used by a certain distro run:

C:\WINDOWS\system32> wsl --set-version <Distro> 2

e.g

C:\WINDOWS\system32> wsl --set-version Debian 2

For more information on installing WSLv2 please look at:

  https://docs.microsoft.com/en-us/windows/wsl/wsl2-install

There are some caveats related to the way storage is handled by WSLv2 though,
and at this point these have to be managed by the user manually, the storage
space used by WSL is not reflected immediately and since bitbake heavily uses
storage, after several builds this can prove to be a bit of an issue.

WSLv2 uses a VHDX file for storage, this issue can be easily avoided by
optimizing this file every now and then, this can be done via the following:

1.- Find the location of your VHDX file:
 - Get the distro app package directory.
 - Open Windows Powershell as Administrator and run:
  Get-AppxPackage -Name "*<DISTRO>*" | Select PackageFamilyName

 e.g.:
  PS C:\WINDOWS\system32> Get-AppxPackage -Name "*Ubuntu*" | Select PackageFamilyName

 PackageFamilyName
  -----------------
   CanonicalGroupLimited.UbuntuonWindows_79abcdefgh

 Replace the PackageFamilyName (and your user) on the following path:

 C:\Users\<user>\AppData\Local\Packages\<PackageFamilyName>\LocalState\

 e.g.

 ls C:\Users\<user>\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\

 Mode                 LastWriteTime         Length Name
  -a----         3/14/2020   9:52 PM    57418973184 ext4.vhdx

 The VHDX file path is:
  C:\Users\<user>\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\ext4.vhdx

2.- Optimize your VHDX file (Also on Powershell):
 - Make sure WSL is shutdown
  wsl --shutdown

 - Optimize it
  optimize-vhd -Path C:\Users\<user>\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\ext4.vhdx -Mode full

 A progress bar should be shown while optimizing the VHDX file.

 As an example, after building core-image-sato, removing the TMPDIR did not reflect
 any changes on Windows Explorer for storage space being used, after optimizing the
 VHDX file, 14 extra GB were shown as free.

 So, as long as the the user optimizes its storage, the builds should run smoothly.

This patch warns the user that is running bitbake under WSLv2, that they should
optimize the VHDX file eventually to avoid storage issues.

The same check previoulsy used for WSLv1 works for WSLv2, checking for the kernel
version:
WSLv1:
Linux version 4.4.0-19041-Microsoft (Microsoft@Microsoft.com)

WSLv2:
Linux version 4.19.84-microsoft-standard (oe-user@oe-host)

Builds have been tested under Ubuntu and Debian distros offered and installed through
the Microsoft Store, and other distros should be able to run builds just as fine.

Performance wise, using the same hardware, and same configuration a comparison between
builds using native Linux vs WSLv2 for the following targets has been performed:
- core-image-minimal
- core-image-sato
- core-image-sato-sdk
- meta-toolchain

No real evidence of any performance changes could be found, with WSLv2 builds running even
faster in some cases.

Running a recently built image can be done just as smoothly, if using "nographic" as
argument for runqemu, or if its a graphical image, installing an X server and running
runqemu runs just as fine.

Happy bitbaking.

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
---
 meta/classes/sanity.bbclass | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index cca5cdad17..2729983077 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -511,14 +511,20 @@ def check_make_version(sanity_data):
     return None
 
 
-# Check if we're running on WSL (Windows Subsystem for Linux). Its known not to
-# work but we should tell the user that upfront.
+# Check if we're running on WSL (Windows Subsystem for Linux).
+# WSLv1 is known not to work but WSLv2 should work properly as
+# long as the VHDX file is optimized often, let the user know
+# upfront.
+# More information on installing WSLv2 at:
+# https://docs.microsoft.com/en-us/windows/wsl/wsl2-install
 def check_wsl(d):
     with open("/proc/version", "r") as f:
         verdata = f.readlines()
     for l in verdata:
         if "Microsoft" in l:
-            return "OpenEmbedded doesn't work under WSL at this time, sorry"
+            return "OpenEmbedded doesn't work under WSLv1, please upgrade to WSLv2 if you want to run builds on Windows"
+        elif "microsoft" in l:
+            bb.warn("You are running bitbake under WSLv2, this works properly but you should optimize your VHDX file eventually to avoid running out of storage space")
     return None
 
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
-- 
2.17.1


