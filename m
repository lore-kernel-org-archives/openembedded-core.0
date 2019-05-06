Return-Path: <Anton.Popov@t-platforms.ru>
X-Greylist: delayed 516 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 06 May 2019 15:46:49 UTC
Received: from mx1.t-platforms.ru (mx1.t-platforms.ru [80.85.246.77])
	by mail.openembedded.org (Postfix) with ESMTP id 3042C6007A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 15:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at t-platforms.ru
From: Popov Anton <Anton.Popov@t-platforms.ru>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] util-linux: fix owner and group for binaries
	in resulting  image
Thread-Index: AdUEIbXgybET3lDUTBqnGc0n+AxLOA==
Date: Mon, 6 May 2019 15:38:10 +0000
Message-ID: <B32C5021EF3D894688F75677907CBC734599A785@pvmmail.tp-local.ru>
Accept-Language: ru-RU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-kse-attachmentfiltering-interceptor-info: protection disabled
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 06.05.2019 11:11:00
x-kse-bulkmessagesfiltering-scan-result: protection disabled
MIME-Version: 1.0
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
Subject: [PATCH] util-linux: fix owner and group for binaries in resulting image
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
X-List-Received-Date: Mon, 06 May 2019 15:46:49 -0000
Content-Language: ru-RU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

util-linux source produce some binaries with setuid bit set=0A=
=0A=
do_install function produce binaries in /sbin and /bin with uid:gid=0A=
of user who build image this lead to messages like this:=0A=
mount /dev/sdb1 /mnt/flash=0A=
mount: only root can do that (effective UID is 1000)=0A=
this patch changing owner of binaries in /bin and /sbin to 0:0=0A=
=0A=
Signed-off-by: Anton Popov <Anton.Popov@t-platforms.ru>=0A=
---=0A=
 meta/recipes-core/util-linux/util-linux.inc | 21 +++++++++++++++++++++=0A=
 1 file changed, 21 insertions(+)=0A=
=0A=
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc=0A=
index 34255a2dec..d75a2dd399 100644=0A=
--- a/meta/recipes-core/util-linux/util-linux.inc=0A=
+++ b/meta/recipes-core/util-linux/util-linux.inc=0A=
@@ -201,6 +201,27 @@ do_install () {=0A=
     fi=0A=
 }=0A=
 =0A=
+# when building yocto image with non-root user some binaries appears in re=
sulting=0A=
+# image with rights of user who build image. This behaviour may lead to mi=
sfunction =0A=
+# of some binaries like mount because of setuid bit on them:=0A=
+# mount /dev/sdb1 /mnt/flash                                              =
                                                                           =
                =0A=
+# mount: only root can do that (effective UID is 1000)=0A=
+# ls -ld which mount=0A=
+# lrwxrwxrwx    1 root     root            21 Jan  2  1970 /bin/mount -> /=
bin/mount.util-linux                                                       =
                                # root@mitx-fp32:/mnt/system/initrd# ls -ld=
 /bin/mount.util-linux                                                     =
                                                               # -rwsr-xr-x=
    1 1000     1000         28020 Apr 23 12:49 /bin/mount.util-linux       =
                                                                           =
                     =0A=
+do_install_append_class-target () {=0A=
+    for p in $sbinprogs $sbinprogs_a; do=0A=
+        if [ -f "${D}${base_sbindir}/$p" ]; then=0A=
+            chown 0:0 "${D}${base_sbindir}/$p"=0A=
+        fi=0A=
+    done=0A=
+    for p in $binprogs_a; do=0A=
+        if [ -f "${D}${base_bindir}/$p" ]; then=0A=
+            chown 0:0 "${D}${base_bindir}/$p"=0A=
+        fi=0A=
+    done=0A=
+}=0A=
+=0A=
+=0A=
 # nologin causes a conflict with shadow-native=0A=
 # kill causes a conflict with coreutils-native (if ${bindir}=3D=3D${base_b=
indir})=0A=
 do_install_append_class-native () {=0A=
-- =0A=
2.20.1=0A=

