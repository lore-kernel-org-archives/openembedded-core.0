Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id EF1EE731D9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:38:03 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id 65so142177520pff.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=kjxWVClTy28NZK48gcg4FUipBrTnSlleJOGgGZGDJG0=;
	b=whjSb2OXFkXF6pIxLv1E1EGlZAGAmCTdZozstuqs/WYbRofxnBYW7wrOJoEt7VUWmo
	oROOjJXNnENnpaTnPRxfWBs68sDwfv+5lfuGx2oQq3cysIGszlDTtvQYxyK1qHB8pR+2
	QtV9HN18r5yg7J+S9TVOjGTgfmcxk2V/Bz3OVyxDQPmx1hqTtfJfpPZSjt/HWYKfCXT4
	U7y40LZY4FnoZfe8Nhsts9ZFASKXAcJUJ0ZtH1AvYip7O5DBLabsSo/de1i+spZnFMpr
	JDy++6ntWTQGBGN704lXnqo64xOIrNJ3GP86LtHBHX+q+QgCxZMl3OV23LU0e0TcjlWt
	eXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=kjxWVClTy28NZK48gcg4FUipBrTnSlleJOGgGZGDJG0=;
	b=Wv6rKZflelV8gRnHXwE1wx1nbxk2451qBGa5Ihuuism4A/nZEVbMWyXUseyJGU84ya
	MRSaUbpF2PVfo7r3klI5g5Ji8PstHnkXvHHoO8RYFdm9kYTRmxbQr2DCF4LMqx7jgKzN
	U5yLBuQA2wFPhZz42kYUCXbbTl2OFg152TGp8HRVSaHBCgPByK4rBeuxNn33TiEKrPMJ
	WV0jOToRbxITRDQsIgk7l3d0NaEou0Y8HhVyHg5z2cU6HenS5h8m4dlnCqY3vn6PZ1R/
	9lHS/YrpvCjQjjtjrsZCe1f6C+xsRQKVJgV40yTIcnKCuKHKkctB+z85VMCWcJPpMeJU
	lOwg==
X-Gm-Message-State: ALoCoQmFmA0TyaFEdpJlJIunCzfi/y7guXivYsSBqgNkkn78liT+IFXjwfxQSu/7amdE2Qj3hKve2po1gpet5PReC0yy+BvrqA==
X-Received: by 10.98.65.9 with SMTP id o9mr28209550pfa.114.1453030685043;
	Sun, 17 Jan 2016 03:38:05 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.38.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:38:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:45 -0800
Message-Id: <2d2a6dd0704d27e8ce8d68f7a634e3d66c0fc1ca.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 72/73] syslinux: Set LD to avoid using build host ld
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
X-List-Received-Date: Sun, 17 Jan 2016 11:38:04 -0000

base ld is used during link phase and since its x86 so it
works mostly, however it can cause problems depending upon
build host. During cross build we should use cross linker
Fixes errors e.g.

ld -shared -m elf_i386 --hash-style=gnu -T
/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc/work/i586-oe-linux/syslinux/6.03-r0/syslinux-6.03/com32/lib/i386/elf.ld
-soname libcom32.c32 -o libcom32.elf zlib/adler32.o zlib/compress.
o zlib/crc32.o zlib/uncompr.o zlib/deflate.o zlib/trees.o zlib/zutil.o
zlib/inflate.o zlib/infback.o zlib/inftrees.o zlib/inffast.o sys/zfile.o
sys/zfopen.o libpng/png.o libpng/pngset.o libpng/pngget.o
libpng/pngrutil.o libpng/pngtrans.o
libpng/pngwutil.o libpng/pngread.o libpng/pngrio.o libpng/pngwio.o
libpng/pngwrite.o libpng/pngrtran.o libpng/pngwtran.o libpng/pngmem.o
libpng/pngerror.o libpng/pngpread.o jpeg/tinyjpeg.o jpeg/jidctflt.o
jpeg/decode1.o jpeg/decode3.o jpe
g/rgb24.o jpeg/bgr24.o jpeg/yuv420p.o jpeg/grey.o jpeg/rgba32.o
jpeg/bgra32.o pci/cfgtype.o pci/scan.o pci/bios.o pci/readb.o
pci/readw.o pci/readl.o pci/writeb.o pci/writew.o pci/writel.o
sys/vesacon_write.o sys/vesaserial_write.o sys/ve
sa/initvesa.o sys/vesa/drawtxt.o sys/vesa/background.o
sys/vesa/alphatbl.o sys/vesa/screencpy.o sys/vesa/fmtpixel.o
sys/vesa/i915resolution.o syslinux/reboot.o syslinux/keyboard.o
syslinux/version.o syslinux/pxe_get_cached.o syslinux/pxe_get_nic.o
syslinux/pxe_dns.o syslinux/video/fontquery.o
syslinux/video/reportmode.o syslinux/addlist.o syslinux/freelist.o
syslinux/memmap.o syslinux/movebits.o syslinux/shuffle.o
syslinux/shuffle_pm.o syslinux/shuffle_rm.o syslinux/bios$oot.o
syslinux/zonelist.o syslinux/dump_mmap.o syslinux/dump_movelist.o
syslinux/run_default.o syslinux/run_command.o syslinux/cleanup.o
syslinux/localboot.o syslinux/runimage.o syslinux/loadfile.o
syslinux/floadfile.o syslinux/zloadfile$o syslinux/load_linux.o
syslinux/initramfs.o syslinux/initramfs_file.o
syslinux/initramfs_loadfile.o syslinux/initramfs_archive.o sys/libansi.o
sys/gpxe.o atexit.o onexit.o abort.o
| ld: zlib/deflate.o: unrecognized relocation (0x2b) in section `.text'
| ld: final link failed: Bad value
| make[4]: *** [libcom32.elf] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.03.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.03.bb b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
index 8534528..51d5474 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
@@ -59,11 +59,11 @@ do_compile() {
 
 	# Rebuild only the installer; keep precompiled bootloaders
 	# as per author's request (doc/distrib.txt)
-	oe_runmake CC="${CC} ${CFLAGS}" LDFLAGS="${LDFLAGS}" firmware="bios" installer
+	oe_runmake CC="${CC} ${CFLAGS}" LD="${LD}" LDFLAGS="${LDFLAGS}" firmware="bios" installer
 }
 
 do_install() {
-	oe_runmake CC="${CC} ${CFLAGS}" install INSTALLROOT="${D}" firmware="bios"
+	oe_runmake CC="${CC} ${CFLAGS}" LD="${LD}" install INSTALLROOT="${D}" firmware="bios"
 
 	install -d ${D}${datadir}/syslinux/
 	install -m 644 ${S}/bios/core/ldlinux.sys ${D}${datadir}/syslinux/
-- 
2.7.0


