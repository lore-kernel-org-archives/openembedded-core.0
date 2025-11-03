Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011F2CCFA05
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 11:46:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18772.1762170373406224855
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 03:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5E482A2A
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Nov 2025 03:46:04 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3642B3F66E
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Nov 2025 03:46:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] xwayland: fix CVE-2025-62229 CVE-2025-62230 CVE-2025-62231
Date: Mon,  3 Nov 2025 11:45:10 +0000
Message-ID: <20251103114511.1271396-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103114511.1271396-1-ross.burton@arm.com>
References: <20251103114511.1271396-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 11:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225650

From https://lists.x.org/archives/xorg-announce/2025-October/003635.html:

1) CVE-2025-62229: Use-after-free in XPresentNotify structures creation

    Using the X11 Present extension, when processing and adding the
    notifications after presenting a pixmap, if an error occurs, a dangli=
ng
    pointer may be left in the error code path of the function causing a
    use-after-free when eventually destroying the notification structures
    later.

    Introduced in: Xorg 1.15
    Fixed in: xorg-server-21.1.19 and xwayland-24.1.9
    Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/5a4286b1
    Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiativ=
e.

2) CVE-2025-62230: Use-after-free in Xkb client resource removal

    When removing the Xkb resources for a client, the function
    XkbRemoveResourceClient() will free the XkbInterest data associated
    with the device, but not the resource associated with it.

    As a result, when the client terminates, the resource delete function
    triggers a use-after-free.

    Introduced in: X11R6
    Fixed in: xorg-server-21.1.19 and xwayland-24.1.9
    Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/99790a2c
         https://gitlab.freedesktop.org/xorg/xserver/-/commit/10c94238
    Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiativ=
e.

3) CVE-2025-62231: Value overflow in Xkb extension XkbSetCompatMap()

    The XkbCompatMap structure stores some of its values using an unsigne=
d
    short, but fails to check whether the sum of the input data might
    overflow the maximum unsigned short value.

    Introduced in: X11R6
    Fixed in: xorg-server-21.1.19 and xwayland-24.1.9
    Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/475d9f49
    Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiativ=
e.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...after-free-in-present_create_notifie.patch | 91 ++++++++++++++++++
 ...ke-the-RT_XKBCLIENT-resource-private.patch | 63 +++++++++++++
 ...KB-resource-when-freeing-XkbInterest.patch | 92 +++++++++++++++++++
 ...-Prevent-overflow-in-XkbSetCompatMap.patch | 53 +++++++++++
 .../xwayland/xwayland_24.1.8.bb               |  7 +-
 5 files changed, 305 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/0001-present-=
Fix-use-after-free-in-present_create_notifie.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/0002-xkb-Make=
-the-RT_XKBCLIENT-resource-private.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/0003-xkb-Free=
-the-XKB-resource-when-freeing-XkbInterest.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/0004-xkb-Prev=
ent-overflow-in-XkbSetCompatMap.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/0001-present-Fix-use=
-after-free-in-present_create_notifie.patch b/meta/recipes-graphics/xwayl=
and/xwayland/0001-present-Fix-use-after-free-in-present_create_notifie.pa=
tch
new file mode 100644
index 00000000000..c2f6ad1e021
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/0001-present-Fix-use-after-=
free-in-present_create_notifie.patch
@@ -0,0 +1,91 @@
+From a2d7bd5fefecfc4315247902b7f03e8bf9866908 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 2 Jul 2025 09:46:22 +0200
+Subject: [PATCH 1/4] present: Fix use-after-free in present_create_notif=
ies()
+
+Using the Present extension, if an error occurs while processing and
+adding the notifications after presenting a pixmap, the function
+present_create_notifies() will clean up and remove the notifications
+it added.
+
+However, there are two different code paths that can lead to an error
+creating the notify, one being before the notify is being added to the
+list, and another one after the notify is added.
+
+When the error occurs before it's been added, it removes the elements up
+to the last added element, instead of the actual number of elements
+which were added.
+
+As a result, in case of error, as with an invalid window for example, it
+leaves a dangling pointer to the last element, leading to a use after
+free case later:
+
+ |  Invalid write of size 8
+ |     at 0x5361D5: present_clear_window_notifies (present_notify.c:42)
+ |     by 0x534A56: present_destroy_window (present_screen.c:107)
+ |     by 0x41E441: xwl_destroy_window (xwayland-window.c:1959)
+ |     by 0x4F9EC9: compDestroyWindow (compwindow.c:622)
+ |     by 0x51EAC4: damageDestroyWindow (damage.c:1592)
+ |     by 0x4FDC29: DbeDestroyWindow (dbe.c:1291)
+ |     by 0x4EAC55: FreeWindowResources (window.c:1023)
+ |     by 0x4EAF59: DeleteWindow (window.c:1091)
+ |     by 0x4DE59A: doFreeResource (resource.c:890)
+ |     by 0x4DEFB2: FreeClientResources (resource.c:1156)
+ |     by 0x4A9AFB: CloseDownClient (dispatch.c:3567)
+ |     by 0x5DCC78: ClientReady (connection.c:603)
+ |   Address 0x16126200 is 16 bytes inside a block of size 2,048 free'd
+ |     at 0x4841E43: free (vg_replace_malloc.c:989)
+ |     by 0x5363DD: present_destroy_notifies (present_notify.c:111)
+ |     by 0x53638D: present_create_notifies (present_notify.c:100)
+ |     by 0x5368E9: proc_present_pixmap_common (present_request.c:164)
+ |     by 0x536A7D: proc_present_pixmap (present_request.c:189)
+ |     by 0x536FA9: proc_present_dispatch (present_request.c:337)
+ |     by 0x4A1E4E: Dispatch (dispatch.c:561)
+ |     by 0x4B00F1: dix_main (main.c:284)
+ |     by 0x42879D: main (stubmain.c:34)
+ |   Block was alloc'd at
+ |     at 0x48463F3: calloc (vg_replace_malloc.c:1675)
+ |     by 0x5362A1: present_create_notifies (present_notify.c:81)
+ |     by 0x5368E9: proc_present_pixmap_common (present_request.c:164)
+ |     by 0x536A7D: proc_present_pixmap (present_request.c:189)
+ |     by 0x536FA9: proc_present_dispatch (present_request.c:337)
+ |     by 0x4A1E4E: Dispatch (dispatch.c:561)
+ |     by 0x4B00F1: dix_main (main.c:284)
+ |     by 0x42879D: main (stubmain.c:34)
+
+To fix the issue, count and remove the actual number of notify elements
+added in case of error.
+
+CVE-2025-62229, ZDI-CAN-27238
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+(cherry picked from commit 5a4286b13f631b66c20f5bc8db7b68211dcbd1d0)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2=
088>
+
+CVE: CVE-2025-62229
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ present/present_notify.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/present/present_notify.c b/present/present_notify.c
+index 445954998..00b3b68bd 100644
+--- a/present/present_notify.c
++++ b/present/present_notify.c
+@@ -90,7 +90,7 @@ present_create_notifies(ClientPtr client, int num_noti=
fies, xPresentNotify *x_no
+         if (status !=3D Success)
+             goto bail;
+=20
+-        added =3D i;
++        added++;
+     }
+     return Success;
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-graphics/xwayland/xwayland/0002-xkb-Make-the-RT=
_XKBCLIENT-resource-private.patch b/meta/recipes-graphics/xwayland/xwayla=
nd/0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch
new file mode 100644
index 00000000000..61369d789ca
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/0002-xkb-Make-the-RT_XKBCLI=
ENT-resource-private.patch
@@ -0,0 +1,63 @@
+From 539bca9e0d05ce995a936c4bdf90bc716510d2a7 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 10 Sep 2025 15:55:06 +0200
+Subject: [PATCH 2/4] xkb: Make the RT_XKBCLIENT resource private
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Currently, the resource in only available to the xkb.c source file.
+
+In preparation for the next commit, to be able to free the resources
+from XkbRemoveResourceClient(), make that variable private instead.
+
+This is related to:
+
+CVE-2025-62230, ZDI-CAN-27545
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Michel D=C3=A4nzer <mdaenzer@redhat.com>
+(cherry picked from commit 99790a2c9205a52fbbec01f21a92c9b7f4ed1d8f)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2=
088>
+
+CVE: CVE-2025-62230
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ include/xkbsrv.h | 2 ++
+ xkb/xkb.c        | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/xkbsrv.h b/include/xkbsrv.h
+index bd747856b..d801cd4b8 100644
+--- a/include/xkbsrv.h
++++ b/include/xkbsrv.h
+@@ -58,6 +58,8 @@ THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ #include "inputstr.h"
+ #include "events.h"
+=20
++extern RESTYPE RT_XKBCLIENT;
++
+ typedef struct _XkbInterest {
+     DeviceIntPtr dev;
+     ClientPtr client;
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index ac154e200..6c102af0a 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -50,7 +50,7 @@ int XkbKeyboardErrorCode;
+ CARD32 xkbDebugFlags =3D 0;
+ static CARD32 xkbDebugCtrls =3D 0;
+=20
+-static RESTYPE RT_XKBCLIENT;
++RESTYPE RT_XKBCLIENT =3D 0;
+=20
+ /***=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D***/
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-graphics/xwayland/xwayland/0003-xkb-Free-the-XK=
B-resource-when-freeing-XkbInterest.patch b/meta/recipes-graphics/xwaylan=
d/xwayland/0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch
new file mode 100644
index 00000000000..76e50cfad92
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/0003-xkb-Free-the-XKB-resou=
rce-when-freeing-XkbInterest.patch
@@ -0,0 +1,92 @@
+From a7e9938b621e16677c6330306a45baba0495ea31 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 10 Sep 2025 15:58:57 +0200
+Subject: [PATCH 3/4] xkb: Free the XKB resource when freeing XkbInterest
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+XkbRemoveResourceClient() would free the XkbInterest data associated
+with the device, but not the resource associated with it.
+
+As a result, when the client terminates, the resource delete function
+gets called and accesses already freed memory:
+
+ | Invalid read of size 8
+ |   at 0x5BC0C0: XkbRemoveResourceClient (xkbEvents.c:1047)
+ |   by 0x5B3391: XkbClientGone (xkb.c:7094)
+ |   by 0x4DF138: doFreeResource (resource.c:890)
+ |   by 0x4DFB50: FreeClientResources (resource.c:1156)
+ |   by 0x4A9A59: CloseDownClient (dispatch.c:3550)
+ |   by 0x5E0A53: ClientReady (connection.c:601)
+ |   by 0x5E4FEF: ospoll_wait (ospoll.c:657)
+ |   by 0x5DC834: WaitForSomething (WaitFor.c:206)
+ |   by 0x4A1BA5: Dispatch (dispatch.c:491)
+ |   by 0x4B0070: dix_main (main.c:277)
+ |   by 0x4285E7: main (stubmain.c:34)
+ | Address 0x1893e278 is 184 bytes inside a block of size 928 free'd
+ |   at 0x4842E43: free (vg_replace_malloc.c:989)
+ |   by 0x49C1A6: CloseDevice (devices.c:1067)
+ |   by 0x49C522: CloseOneDevice (devices.c:1193)
+ |   by 0x49C6E4: RemoveDevice (devices.c:1244)
+ |   by 0x5873D4: remove_master (xichangehierarchy.c:348)
+ |   by 0x587921: ProcXIChangeHierarchy (xichangehierarchy.c:504)
+ |   by 0x579BF1: ProcIDispatch (extinit.c:390)
+ |   by 0x4A1D85: Dispatch (dispatch.c:551)
+ |   by 0x4B0070: dix_main (main.c:277)
+ |   by 0x4285E7: main (stubmain.c:34)
+ | Block was alloc'd at
+ |   at 0x48473F3: calloc (vg_replace_malloc.c:1675)
+ |   by 0x49A118: AddInputDevice (devices.c:262)
+ |   by 0x4A0E58: AllocDevicePair (devices.c:2846)
+ |   by 0x5866EE: add_master (xichangehierarchy.c:153)
+ |   by 0x5878C2: ProcXIChangeHierarchy (xichangehierarchy.c:493)
+ |   by 0x579BF1: ProcIDispatch (extinit.c:390)
+ |   by 0x4A1D85: Dispatch (dispatch.c:551)
+ |   by 0x4B0070: dix_main (main.c:277)
+ |   by 0x4285E7: main (stubmain.c:34)
+
+To avoid that issue, make sure to free the resources when freeing the
+device XkbInterest data.
+
+CVE-2025-62230, ZDI-CAN-27545
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Michel D=C3=A4nzer <mdaenzer@redhat.com>
+(cherry picked from commit 10c94238bdad17c11707e0bdaaa3a9cd54c504be)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2=
088>
+
+CVE: CVE-2025-62230
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ xkb/xkbEvents.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/xkb/xkbEvents.c b/xkb/xkbEvents.c
+index f8f65d4a7..7c669c93e 100644
+--- a/xkb/xkbEvents.c
++++ b/xkb/xkbEvents.c
+@@ -1055,6 +1055,7 @@ XkbRemoveResourceClient(DevicePtr inDev, XID id)
+             autoCtrls =3D interest->autoCtrls;
+             autoValues =3D interest->autoCtrlValues;
+             client =3D interest->client;
++            FreeResource(interest->resource, RT_XKBCLIENT);
+             free(interest);
+             found =3D TRUE;
+         }
+@@ -1066,6 +1067,7 @@ XkbRemoveResourceClient(DevicePtr inDev, XID id)
+                 autoCtrls =3D victim->autoCtrls;
+                 autoValues =3D victim->autoCtrlValues;
+                 client =3D victim->client;
++                FreeResource(victim->resource, RT_XKBCLIENT);
+                 free(victim);
+                 found =3D TRUE;
+             }
+--=20
+2.43.0
+
diff --git a/meta/recipes-graphics/xwayland/xwayland/0004-xkb-Prevent-ove=
rflow-in-XkbSetCompatMap.patch b/meta/recipes-graphics/xwayland/xwayland/=
0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch
new file mode 100644
index 00000000000..27c8f6c8099
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/0004-xkb-Prevent-overflow-i=
n-XkbSetCompatMap.patch
@@ -0,0 +1,53 @@
+From 70dfb0fb993655b0989d54e3bffc4e62c5629392 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 10 Sep 2025 16:30:29 +0200
+Subject: [PATCH 4/4] xkb: Prevent overflow in XkbSetCompatMap()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The XkbCompatMap structure stores its "num_si" and "size_si" fields
+using an unsigned short.
+
+However, the function _XkbSetCompatMap() will store the sum of the
+input data "firstSI" and "nSI" in both XkbCompatMap's "num_si" and
+"size_si" without first checking if the sum overflows the maximum
+unsigned short value, leading to a possible overflow.
+
+To avoid the issue, check whether the sum does not exceed the maximum
+unsigned short value, or return a "BadValue" error otherwise.
+
+CVE-2025-62231, ZDI-CAN-27560
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Michel D=C3=A4nzer <mdaenzer@redhat.com>
+(cherry picked from commit 475d9f49acd0e55bc0b089ed77f732ad18585470)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2=
088>
+
+CVE: CVE-2025-62231
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ xkb/xkb.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 6c102af0a..a77fe7ff0 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -2990,6 +2990,8 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr de=
v,
+         XkbSymInterpretPtr sym;
+         unsigned int skipped =3D 0;
+=20
++        if ((unsigned) (req->firstSI + req->nSI) > USHRT_MAX)
++            return BadValue;
+         if ((unsigned) (req->firstSI + req->nSI) > compat->size_si) {
+             compat->num_si =3D compat->size_si =3D req->firstSI + req->=
nSI;
+             compat->sym_interpret =3D reallocarray(compat->sym_interpre=
t,
+--=20
+2.43.0
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb b/meta/rec=
ipes-graphics/xwayland/xwayland_24.1.8.bb
index a621af1a7f0..af4bb734996 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
@@ -9,7 +9,12 @@ HOMEPAGE =3D "https://fedoraproject.org/wiki/Changes/Xwa=
ylandStandalone"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5df87950af51ac2c5822094553ea1=
880"
=20
-SRC_URI =3D "https://www.x.org/archive/individual/xserver/xwayland-${PV}=
.tar.xz"
+SRC_URI =3D "https://www.x.org/archive/individual/xserver/xwayland-${PV}=
.tar.xz \
+           file://0001-present-Fix-use-after-free-in-present_create_noti=
fie.patch \
+           file://0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch =
\
+           file://0003-xkb-Free-the-XKB-resource-when-freeing-XkbInteres=
t.patch \
+           file://0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch \
+           "
 SRC_URI[sha256sum] =3D "c8908d57c8ed9ceb8293c16ba7ad5af522efaf1ba7e51f9e=
4cf3c0774d199907"
=20
 UPSTREAM_CHECK_REGEX =3D "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
--=20
2.43.0


