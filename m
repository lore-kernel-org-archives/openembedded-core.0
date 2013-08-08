Return-Path: <Rongqing.Li@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 969BE6B0AC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 08:55:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r788tf9e014246
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Aug 2013 04:55:42 -0400 (EDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 8 Aug 2013 01:55:41 -0700
Message-ID: <52035D0E.4090502@windriver.com>
Date: Thu, 8 Aug 2013 16:55:42 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1374643300.git.rongqing.li@windriver.com>
	<947336a1ef2b936328ba6fcf519d55a4eda7085d.1374643300.git.rongqing.li@windriver.com>
	<5201F783.4020601@windriver.com>
	<CAJTo0LZw9kOSmQbeQM71JGZh36nYy58o=ZEB_oA8nYOFBtqZTw@mail.gmail.com>
In-Reply-To: <CAJTo0LZw9kOSmQbeQM71JGZh36nYy58o=ZEB_oA8nYOFBtqZTw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: ignore qemu output, and check its return code
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
X-List-Received-Date: Thu, 08 Aug 2013 08:55:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/07/2013 07:55 PM, Burton, Ross wrote:
> On 7 August 2013 08:30, Rongqing Li <rongqing.li@windriver.com> wrote:
>>>                  ${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')}
>>> hwdb --update \
>>> -                       --root $D
>>> +                       --root $D 2>/dev/null
>>> +
>>> +               [ $? -ne 0 ] && exit 1
>
> The $? check can be removed replaced by set -e, as many postinst
> scripts do already.
>
> Why/where is the output from runqemu considered an error?  I wasn't
> aware that logs were monitored for that error message.  I don't think
> we should be hiding the output of runqemu as any real errors will also
> be hidden.
>
> Ross


I always get the below on error on my machine(Ubuntu 12.10) when enable 
systemd:


|  102:Installing libnfsidmap0 
######################################## [ 26%]
|  103:Installing run-postinsts 
######################################## [ 26%]
| Output from run-postinsts-1.0-r9@i586:
| --
|  257:Installing liberation-fo.. 
######################################## [ 65%]
|  258:Installing glib-networking 
######################################## [ 65%]
|  259:Installing wpa-supplicant 
######################################## [ 66%]
|  260:Installing udev-hwdb 
######################################## [ 66%]
| Output from udev-hwdb-1:204-r0@i586:
| ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be 
preloaded: ignored.
| qemu: Unsupported syscall: 240
|  261:Installing udev 
######################################## [ 66%]
|  262:Installing util-linux-fsck 
######################################## [ 67%]
| Output from util-linux-fsck-2.23.2-r0@i586:
| update-alternatives: Linking 
/buildarea/build/poky/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0-r0/rootfs//sbin/fsck.minix 
to /sbin/fsck.minix.util-linux
|
| ERROR: Function failed: do_rootfs (log file is located at 
/buildarea/build/poky/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0-r0/temp/log.do_rootfs.26461)
ERROR: Task 7 
(/buildarea/build/poky/meta/recipes-sato/images/core-image-sato.bb, 
do_rootfs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 5548 tasks of which 924 didn't need to be 
rerun and 1 failed.
No currently running tasks (5547 of 5549)

Summary: 1 task failed:
   /buildarea/build/poky/meta/recipes-sato/images/core-image-sato.bb, 
do_rootfs
Summary: There was 1 ERROR message shown, returning a non-zero exit code.


After using the patch, it works well.


Other place used the same method to handle the qemu_run_binary result:


lirq@lirq-OptiPlex-780:/buildarea/build/poky/meta$ grep qemu_run_binary 
./ -r -A2
./classes/qemu.bbclass:# ${@qemu_run_binary(d, '$D', 
'/usr/bin/test_app')} [test_app arguments]
./classes/qemu.bbclass-#
./classes/qemu.bbclass:def qemu_run_binary(data, rootfs_path, binary):
./classes/qemu.bbclass-    qemu_binary = qemu_target_binary(data)
./classes/qemu.bbclass-    if qemu_binary == "qemu-allarch":
--
./classes/gtk-immodules-cache.bbclass:            ${@qemu_run_binary(d, 
'$D', '${bindir}/gtk-query-immodules-$maj_ver.0')} \
./classes/gtk-immodules-cache.bbclass-                $IMFILES > 
$D/etc/gtk-$maj_ver.0/gtk.immodules 2>/dev/null &&
./classes/gtk-immodules-cache.bbclass-                sed -i -e "s:$D::" 
$D/etc/gtk-$maj_ver.0/gtk.immodules
--
./classes/gtk-immodules-cache.bbclass:            ${@qemu_run_binary(d, 
'$D', '${bindir}/gtk-query-immodules-$maj_ver.0')} \
./classes/gtk-immodules-cache.bbclass-                $IMFILES > 
$D/etc/gtk-$maj_ver.0/gtk.immodules 2>/dev/null &&
./classes/gtk-immodules-cache.bbclass-                sed -i -e "s:$D::" 
$D/etc/gtk-$maj_ver.0/gtk.immodules
--
./recipes-graphics/pango/pango.inc:	${@qemu_run_binary(d, 
'$D','${bindir}/${MLPREFIX}pango-querymodules')} \
./recipes-graphics/pango/pango.inc-	 
$D${libdir}/pango/${LIBV}/modules/*.so \
./recipes-graphics/pango/pango.inc-		> 
$D${sysconfdir}/pango/${MLPREFIX}pango.modules 2>/dev/null



-Roy


>
>

-- 
Best Reagrds,
Roy | RongQing Li

