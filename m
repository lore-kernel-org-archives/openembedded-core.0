Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00779CDB471
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 16:21:42 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25516.1782231699406419716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 09:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XKT3FZbk;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4626fdc829aso63988f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 09:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782231697; x=1782836497; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pzToVDbGM4b2FKeiVncmyirE2KznsIP28ojQVuBfUA=;
        b=XKT3FZbk4Cl12CRRehSY46o4WeW8blH+IgD4vCMQyHUN4LvyzMAyp1HW5tTPxgJwFi
         +Swhy+NxUCJYzMqKODHeOP/F7XUq3lmG8x3DXrmB4psEJ4/TyGAZTuD6cBwVrKSst35V
         bl7CNs9ek2ZY1TNqk2gZ2F+IJcp98aO+LL068=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231697; x=1782836497;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8pzToVDbGM4b2FKeiVncmyirE2KznsIP28ojQVuBfUA=;
        b=fLyc9+jm8PeFQjd8TFT/zRhn+XPt5zsxLxjrYUZmQa+iyMr8g3bXr/9I2u7t8rSLqi
         xos9rzPtYLF9u7LyqxeA2iK/Kd9DonlTyfqj3v0kmAMJnXhvlMzAJ1xI0KvWT1/Sm55h
         roLDHDi8MmASjkVq32wuzrL8MdmfNZzfjvW0CShQlrQ0WCgPmt4Qw4Ydij2anmwNzaVa
         /I1XQPEBZwu5CVtUsxKguEPlZ+XENWbnmsDLis1uXIekohBBOeIzQiwwvHQbPpvQdUKe
         mn8KRQ4f0DHEHp8ZVmxiQakXDipY50wbBbhjmEwH4Y7LUaG0WzDFEP455acCmqaaXxjb
         L9+A==
X-Gm-Message-State: AOJu0YxC6gUKkCmKtTdun8YHWOyLP5Z+S+//a+4HW2ArZ2YYgTcC7aPr
	cyaMMKvP2RjPAsjhdaJPP61jr2Tk/RUnDOglwH9by3hAFf7mYp7+Nw1dBG6nOZOMnjI=
X-Gm-Gg: AfdE7ckce+p3w4AnjqUJTjzbyxaLHFuMAZtrhbNq0wfGTc2+YYS4RdhrgZwctpG+52A
	lJ9jVPGuEjBowtg/PPfSpU4N2bc7LhJljJgBKmG3LTUnRpb5muGe6ZUwUOjdSzM5Xqe0QrNlCfU
	CKu/4nvfVMv9IW3OkWDFObOHz5a6F4swoQFmwVQnNi4tEod26LYmxAL/kOi7C7eW6zHB+XIVzDO
	QQrJq/47E32pvmT9+YUky0CVWRUFsxn7FtdZTDgLMFZMWQL4Aj2vsA+1VpzVbczK1Vn0FzWmMld
	hq9CSvclLxJlRvCyetO0HRw1QxIs4warjBrv2SZyj64/50bpF00u2sAKaWkMUx44UZGmw/mPLKs
	Dc9pRXet3A7QIl1bbyY3VAvuhGxILF6NpK9Dsg60MccuPChGHk7zQmeEP5yPcbJ3K1508RxECns
	2Yn4vnRbaXTGyRWeHXO2eM3RyzhHYBtei9prCsGcjfwuYHra/HhnuHItVAnm3IkAp2+aAx7ztwp
	9RTZQ==
X-Received: by 2002:a05:6000:2884:b0:451:3b12:9bca with SMTP id ffacd0b85a97d-46adadd20e4mr5602588f8f.25.1782231697536;
        Tue, 23 Jun 2026 09:21:37 -0700 (PDT)
Received: from localhost (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5ddbsm38617790f8f.12.2026.06.23.09.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:21:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 18:21:36 +0200
Message-Id: <DJGKEQF8GRU1.RF7JY64COTAA@smile.fr>
Subject: Re: [OE-core] [meta][scarthgap][PATCH 02/11] linux-yocto/6.6:
 update to v6.6.130
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260610165008.1870552-1-bruce.ashfield@gmail.com>
 <20260610165008.1870552-2-bruce.ashfield@gmail.com>
In-Reply-To: <20260610165008.1870552-2-bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 16:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239410

On Wed Jun 10, 2026 at 6:49 PM CEST, Bruce Ashfield via lists.openembedded.=
org wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating linux-yocto/6.6 to the latest korg -stable release that comprise=
s
> the following commits:
>
>     c09fbcd31ae6 Linux 6.6.130
> [...]
>     dc7c9b9d03a5 ext4: drop extent cache when splitting extent fails
>     f0931a5c1700 ext4: drop extent cache after doing PARTIAL_VALID1 zeroo=
ut
>     67cdb7bd7442 ext4: don't set EXT4_GET_BLOCKS_CONVERT when splitting b=
efore submitting I/O
>     11406eb96a19 ext4: correct the comments place for EXT4_EXT_MAY_ZEROOU=
T

Hello Bruce,

>     ed0096fc86b2 ext4: get rid of ppath in ext4_ext_handle_unwritten_exte=
nts()
>     d7b04ea31c6e ext4: get rid of ppath in ext4_ext_convert_to_initialize=
d()
>     c24ce099bea9 ext4: get rid of ppath in ext4_convert_unwritten_extents=
_endio()
>     147a6a2725b1 ext4: get rid of ppath in ext4_split_convert_extents()
>     cda8a34348d7 ext4: get rid of ppath in ext4_split_extent()
>     58ddae5d77b1 ext4: don't zero the entire extent if EXT4_EXT_DATA_PART=
IAL_VALID1
>     e766534911b3 ext4: subdivide EXT4_EXT_DATA_VALID1
>     ffb68fc57207 ext4: get rid of ppath in ext4_split_extent_at()
>     fb138df7d886 ext4: get rid of ppath in ext4_ext_insert_extent()
>     8f6e910852d8 ext4: get rid of ppath in ext4_ext_create_new_leaf()
>     cafb151eb180 ext4: get rid of ppath in ext4_find_extent()

(The following was found by Gemini, but I've checked it)

Looks like these commits introduced a bug causing an intermittent LTP regre=
ssion:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/98/builds/3837
-> https://valkyrie.yocto.io/pub/non-release/20260622-121/testresults/qemua=
rm64-ltp/core-image-sato/qemu_boot_log.20260623002740

[ 6952.500858] Unable to handle kernel paging request at virtual address ff=
ffffffffffffec
[ 6952.503768] Mem abort info:
[ 6952.504431]   ESR =3D 0x0000000096000005
[ 6952.505333]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[ 6952.506541]   SET =3D 0, FnV =3D 0
[ 6952.507354]   EA =3D 0, S1PTW =3D 0
[ 6952.508154]   FSC =3D 0x05: level 1 translation fault
[ 6952.509208] Data abort info:
[ 6952.509849]   ISV =3D 0, ISS =3D 0x00000005, ISS2 =3D 0x00000000
[ 6952.511175]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
[ 6952.512372]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
[ 6952.513667] swapper pgtable: 4k pages, 39-bit VAs, pgdp=3D00000000412500=
00
[ 6952.514909] [ffffffffffffffec] pgd=3D0000000000000000, p4d=3D00000000000=
00000, pud=3D0000000000000000
[ 6952.516423] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
[ 6952.517503] Modules linked in: x_tables tun loop [last unloaded: ip6_tab=
les]
[ 6952.518691] CPU: 1 PID: 1078 Comm: kworker/u12:1 Tainted: G        W    =
      6.6.142-yocto-standard #1
[ 6952.520269] Hardware name: linux,dummy-virt (DT)
[ 6952.521094] Workqueue: writeback wb_workfn (flush-7:0)
[ 6952.521985] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[ 6952.523184] pc : ext4_ext_map_blocks+0x260/0x1860
[ 6952.524011] lr : ext4_ext_map_blocks+0xdb8/0x1860
[ 6952.524851] sp : ffffffc086a3b620
[ 6952.525421] x29: ffffffc086a3b740 x28: ffffffffffffffe4 x27: 00000000000=
0808c
[ 6952.526624] x26: ffffff8017dd9000 x25: 000000000000808c x24: 00000000000=
00002
[ 6952.527849] x23: ffffff8035e766c8 x22: ffffff802e589690 x21: 00000000000=
0042f
[ 6952.529087] x20: ffffffc086a3b948 x19: ffffff8035e767f0 x18: 00000000000=
00000
[ 6952.530310] x17: ffffffc081691310 x16: fffffffe001ab548 x15: 0000005564d=
4cb48
[ 6952.531519] x14: 00000000ffffffff x13: 0000000000000000 x12: fffffffffff=
fffc0
[ 6952.532683] x11: 0000000000000040 x10: ffffff8005d81d80 x9 : ffffffc0803=
cce14
[ 6952.533886] x8 : 00000000bab647bc x7 : 0000000000000000 x6 : 00000000000=
0d847
[ 6952.535065] x5 : 0000000000000000 x4 : 0000000000316019 x3 : 00000000000=
00000
[ 6952.536264] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff803de=
ec880
[ 6952.537425] Call trace:
[ 6952.537860]  ext4_ext_map_blocks+0x260/0x1860
[ 6952.538589]  ext4_map_blocks+0x19c/0x598
[ 6952.539258]  ext4_do_writepages+0x5a4/0xbe0
[ 6952.539977]  ext4_writepages+0x84/0x110
[ 6952.540624]  do_writepages+0x94/0x1e0
[ 6952.541240]  __writeback_single_inode+0x60/0x4d8
[ 6952.542086]  writeback_sb_inodes+0x208/0x4b0
[ 6952.542812]  __writeback_inodes_wb+0x58/0x118
[ 6952.543578]  wb_writeback+0x274/0x440
[ 6952.544198]  wb_workfn+0x3b0/0x5c8
[ 6952.544788]  process_one_work+0x16c/0x3e0
[ 6952.545434]  worker_thread+0x1b4/0x378
[ 6952.546059]  kthread+0x118/0x128
[ 6952.546599]  ret_from_fork+0x10/0x20
[ 6952.547197] Code: 2a0103f9 b9009fe1 b9000e99 b40055fc (79401398)
[ 6952.548170] ---[ end trace 0000000000000000 ]---
[ 6952.551090] ------------[ cut here ]------------

Reading the resulting code in 6.6.142:
fs/ext4/extents.c:
int ext4_ext_map_blocks(handle_t *handle, struct inode *inode,
			struct ext4_map_blocks *map, int flags)
{
	struct ext4_ext_path *path =3D NULL;
	// ...

got_allocated_blocks:
	path =3D ext4_ext_insert_extent(handle, inode, path, &newex, flags);
	if (IS_ERR(path)) {
		err =3D PTR_ERR(path);
		/*
		 * Gracefully handle out of space conditions. If the filesystem
		 * is inconsistent, we'll just leak allocated blocks to avoid
		 * causing even more damage.
		 */
		// ...
		goto out;
	}

	// ...
out:
	ext4_free_ext_path(path);

	trace_ext4_ext_map_blocks_exit(inode, flags, map,
				       err ? err : allocated);
	return err ? err : allocated;
}

=3D> Under out of space condition (what LTP does a *LOT*): path is given un=
modified to
ext4_free_ext_path() that only does a NULL check (no IS_ERR) before
dereferencing it. And that produces the oops and then, the LTP failure.

Notably, master commit 6b854d552711 ("ext4: get rid of ppath in get_ext_pat=
h()")
never got backported to 6.6.y. But does add the IS_ERR_OR_NULL() check
to ext4_free_ext_path:
 void ext4_free_ext_path(struct ext4_ext_path *path)
 {
+       if (IS_ERR_OR_NULL(path))
+               return;

Bruce, what do you think? Should we backport
6b854d552711=C2=B7("ext4:=C2=B7get=C2=B7rid=C2=B7of=C2=B7ppath=C2=B7in=C2=
=B7get_ext_path()")? Ask for it to
be backported?

Thanks for your help!
--=20
Yoann Congal
Smile ECS


