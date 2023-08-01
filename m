Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B01EB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 10:13:49 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.9254.1690884826663930772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 03:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sszODPxW;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b9c55e0fbeso76772971fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 03:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690884825; x=1691489625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBjYfa/kTba7MLfXGdLtmNgt1hyqIN0EemOEPJhwfW0=;
        b=sszODPxW69mJGVZBkrYnGuYJIO5yfbTHFuTlT0DKHQkCFgnxJate2tY56OwRf7QiIJ
         lVPYDJPwHqC8U8zqmM1rSg4dMcIiWTIPvWV9V3BFjwanl0Lla/1BGWWNnxx6ZPWJoPag
         0VGhhSO/tEQ1jj1x5G7HK3pMjwiZnFI8zyo1mXpOMi7TQjI30BC1YEa8yCB2ux2+qPUQ
         ffxgvWYQuoPFW3P1dRxswL4RoYnhdVEuBQyRBq2itRsSGyvgrDS1nyVTILNttyKLVEBQ
         F6/UJWifP7yCyy5oHw99ni6n8iCKu2TJj6xcCdYa5PYAjPpC3OOuENkFRn9un3IrvSYE
         5YkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690884825; x=1691489625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBjYfa/kTba7MLfXGdLtmNgt1hyqIN0EemOEPJhwfW0=;
        b=HH7d/lp3kDgsOUMDktszr1M2eq51DYWb50QdVhab5EJcYS4YDPmqCCwf6Me3aUxjVa
         sbezgJW8O19we8nZaK2iVDYKlP2Y1sVCCHdrUh9q35gX2jMH2Mx1twEak4Mw3tR14N94
         tHKJMe1IMwRTlA/yjVJQ+mLniiVzOye+beYyhkzg9NPytHHGxMmVahiJiKWyC3eHuART
         9/UklIrdxMJYpJCyoCQbhdTcwOtPlHQawAT53RUa06gKXIhGMLxCQhoEgyC71Beqpn3m
         5kRoJ7tTf1dfFf0RU5fSSO5sO3nZrpJHjhCoDXFkCRc5Acf623FSyHUHPpf1gs+igPB2
         eiuA==
X-Gm-Message-State: ABy/qLYvYUB/kZa15yWDjGDF6HfI+nalq8L9MIa/eVvGA+y4LtM1KScs
	z6Lh97SkfdeeLmAb3RoVIV838ABVNiaLNgyeYfhdgXgh
X-Google-Smtp-Source: APBJJlGkti90sq3aJq7n56L8v26KiEDit14260y9/3nADoMURADY0eoJdBcF/Md19ixARdWye+kzIdS4xvxod4KgmK4=
X-Received: by 2002:a05:651c:1050:b0:2b6:da64:734f with SMTP id
 x16-20020a05651c105000b002b6da64734fmr2063232ljm.47.1690884824548; Tue, 01
 Aug 2023 03:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230801094823.4007276-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20230801094823.4007276-1-mingli.yu@eng.windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Aug 2023 12:13:32 +0200
Message-ID: <CANNYZj-B1hAkm_cRa+LPegNE7CpWBOZ=v3ZLg7=9K5-6q5R4MA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemuppc64: Set the default memory to 512M
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 10:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185234

This needs further investigation. All other 64 bit machines can boot
standard images fine with 256M, so why ppc64 cannot? What image are
you booting, and is the problem specific to that image?

Alex

On Tue, 1 Aug 2023 at 11:48, Yu, Mingli <mingli.yu@eng.windriver.com> wrote=
:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> When use 256M memory, it issues below OOM, so update the default memory
> to 512M to make the runqemu "runqemu slirp nographic qemuppc64" works
> well.
>
> [   26.878923] Call Trace:
> [   26.878994] [c0000000034835d0] [c00000000106e058] dump_stack_lvl+0x6c/=
0x9c (unreliable)
> [   26.880196] [c000000003483600] [c0000000003772d8] dump_header+0x64/0x2=
a4
> [   26.880312] [c000000003483680] [c000000000375d00] oom_kill_process+0x2=
e0/0x2f0
> [   26.880415] [c0000000034836c0] [c0000000003767b8] out_of_memory+0x138/=
0x7b0
> [   26.880472] [c000000003483770] [c0000000003f91c4] __alloc_pages+0xda4/=
0x1430
> [   26.880549] [c000000003483970] [c000000000412738] alloc_pages+0xd8/0x2=
10
> [   26.880604] [c0000000034839b0] [c0000000003694e4] filemap_alloc_folio+=
0x104/0x1d0
> [   26.880672] [c000000003483a50] [c00000000036dcec] __filemap_get_folio+=
0x17c/0x490
> [   26.880730] [c000000003483b00] [c00000000036e184] filemap_fault+0x184/=
0xaa0
> [   26.880782] [c000000003483bc0] [c0000000003c3700] __do_fault+0x60/0x10=
0
> [   26.880839] [c000000003483bf0] [c0000000003cb0ac] __handle_mm_fault+0x=
b8c/0x1010
> [   26.880900] [c000000003483ce0] [c0000000003cb6f0] handle_mm_fault+0x1c=
0/0x290
> [   26.880959] [c000000003483d30] [c00000000006c3e4] ___do_page_fault+0x2=
84/0xa50
> [   26.881042] [c000000003483de0] [c00000000006ce90] do_page_fault+0x50/0=
x110
> [   26.881095] [c000000003483e10] [c000000000008c84] instruction_access_c=
ommon_virt+0x194/0x1a0
> [   26.881183] --- interrupt: 400 at 0x7fffbbbcdb08
> [   26.881538] NIP:  00007fffbbbcdb08 LR: 00007fffbbb76b60 CTR: 00007fffb=
bbcdb08
> [   26.881613] REGS: c000000003483e80 TRAP: 0400   Not tainted  (6.1.38-y=
octo-standard)
> [   26.881710] MSR:  800000004280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE=
>  CR: 48004882  XER: 20040003
> [   26.881928] CFAR: 00007fffbbaae610 IRQMASK: 0
> [   26.881928] GPR00: 00007fffbbb76b44 00007fffe6621060 00007fffbbcb7a00 =
0000000122a4b680
> [   26.881928] GPR04: 0000000000000000 0000000000000002 0000000000002029 =
0000000000000009
> [   26.881928] GPR08: 0000000000000000 0000000122a569a0 0000000000000001 =
0000000044004883
> [   26.881928] GPR12: 00007fffbbbcdb08 00007fffbbd615e0 0000000000000000 =
0000000000000000
> [   26.881928] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [   26.881928] GPR20: 0000000000000000 0000000000000000 00007fffe66214b8 =
0000000122a5e340
> [   26.881928] GPR24: 000000000000074f 00007fffe6621120 000000012299d020 =
00007fffe662113d
> [   26.881928] GPR28: 00007fffe6621100 0000000000000003 0000000000000001 =
0000000122972600
> [   26.882587] NIP [00007fffbbbcdb08] 0x7fffbbbcdb08
> [   26.882640] LR [00007fffbbb76b60] 0x7fffbbb76b60
> [   26.882702] --- interrupt: 400
> [   26.900248] Mem-Info:
> [   26.907378] active_anon:65 inactive_anon:1134 isolated_anon:0
> [   26.907378]  active_file:7 inactive_file:22 isolated_file:0
> [   26.907378]  unevictable:0 dirty:0 writeback:0
> [   26.907378]  slab_reclaimable:226 slab_unreclaimable:528
> [   26.907378]  mapped:36 shmem:239 pagetables:67
> [   26.907378]  sec_pagetables:0 bounce:0
> [   26.907378]  kernel_misc_reclaimable:0
> [   26.907378]  free:77 free_pcp:6 free_cma:0
> [   26.907799] Node 0 active_anon:4160kB inactive_anon:72576kB active_fil=
e:448kB inactive_file:1408kB unevictable:0kB isolated(anon):0kB isolated(fi=
le):0kB mapped:2304kB dirty:0kB writeback:0kB shmem:15296kB writeback_tmp:0=
kB kernel_stack:1744kB pagetables:4288kB sec_pagetables:0kB all_unreclaimab=
le? no
> [   26.908057] Node 0 Normal free:4928kB boost:0kB min:1536kB low:1920kB =
high:2304kB reserved_highatomic:0KB active_anon:4160kB inactive_anon:72768k=
B active_file:704kB inactive_file:2048kB unevictable:0kB writepending:0kB p=
resent:262144kB managed:163008kB mlocked:0kB bounce:0kB free_pcp:448kB loca=
l_pcp:384kB free_cma:0kB
> [   26.908374] lowmem_reserve[]: 0 0
> [   26.908516] Node 0 Normal: 39*64kB (UM) 5*128kB (ME) 7*256kB (UE) 0*51=
2kB 0*1024kB 0*2048kB 0*4096kB 0*8192kB 0*16384kB =3D 4928kB
> [   26.908956] 296 total pagecache pages
> [   26.909050] 0 pages in swap cache
> [   26.909102] Free swap  =3D 0kB
> [   26.909150] Total swap =3D 0kB
> [   26.909268] 4096 pages RAM
> [   26.909303] 0 pages HighMem/MovableOnly
> [   26.909343] 1549 pages reserved
> [   26.909453] Tasks state (memory values in pages):
> [   26.909498] [  pid  ]   uid  tgid total_vm      rss pgtables_bytes swa=
pents oom_score_adj name
> [   26.909777] [    125]   998   125      104       21    22272        0 =
            0 rpcbind
> [   26.919186] [    126]     0   126      430       66    23552        0 =
         -250 systemd-journal
> [   26.919387] [    145]     0   145      471       60    23808        0 =
        -1000 systemd-udevd
> [   26.919478] [    150]   989   150      307       56    23552        0 =
            0 systemd-resolve
> [   26.919547] [    156]   988   156     1458       56    23808        0 =
            0 systemd-timesyn
> [   26.919616] [    176]     0   176       62       13    21760        0 =
            0 atd
> [   26.919676] [    177]   995   177      133       31    22528        0 =
            0 avahi-daemon
> [   26.919741] [    178]     0   178       68       15    21760        0 =
            0 crond
> [   26.919805] [    179]   996   179      126       24    22016        0 =
         -900 dbus-daemon
> [   26.919886] [    180]     0   180       89       16    22016        0 =
            0 dhcpcd-systemd-
> [   26.919952] [    181]   995   181      131       26    22272        0 =
            0 avahi-daemon
> [   26.920017] [    184]     0   184      299       52    23808        0 =
            0 systemd-logind
> [   26.920082] [    186]     0   186       89       16    22016        0 =
            0 sshd_check_keys
> [   26.920168] [    196]   990   196      328       58    23552        0 =
            0 systemd-network
> [   26.920261] [    202]   999   202       68       16    22016        0 =
            0 dhcpcd
> [   26.920322] [    203]     0   203       66       16    22016        0 =
            0 dhcpcd
> [   26.920381] [    204]   999   204       65       14    22016        0 =
            0 dhcpcd
> [   26.920450] [    205]   999   205       65       13    22016        0 =
            0 dhcpcd
> [   26.920510] [    211]   999   211       66       15    22016        0 =
            0 dhcpcd
> [   26.920570] [    212]   999   212       66       15    22016        0 =
            0 dhcpcd
> [   26.920638] [    226]     0   226     4587       67    28672        0 =
            0 rsyslogd
> [   26.920703] [    236]     0   236      142       20    22528        0 =
            0 xinetd
> [   26.920773] [    241]   997   241      338       52    24064        0 =
            0 named
> [   26.920830] [    244]   999   244       66       15    22016        0 =
            0 dhcpcd
> [   26.920890] [    245]   999   245       66       15    22016        0 =
            0 dhcpcd
> [   26.920948] [    246]     0   246       95       23    22016        0 =
            0 dhcpcd-run-hook
> [   26.921013] [    247]     0   247      354       78    23552        0 =
            0 (agetty)
> [   26.921077] [    249]     0   249      354       76    23552        0 =
            0 (agetty)
> [   26.921140] [    253]   997   253     3865      102    26112        0 =
            0 named
> [   26.921198] [    259]     0   259       89       16    22016        0 =
            0 postfix-script
> [   26.921262] [    271]     0   271       89       15    22016        0 =
            0 postfix-script
> [   26.921325] [    272]     0   272      204       30    22784        0 =
            0 postconf
> [   26.921409] [    273]     0   273       58        9    21760        0 =
            0 sed
> [   26.921490] [    274]     0   274      292       53    23296        0 =
            0 resolvconf
> [   26.921610] oom-kill:constraint=3DCONSTRAINT_NONE,nodemask=3D(null),cp=
uset=3D/,mems_allowed=3D0,global_oom,task_memcg=3D/system.slice/named.servi=
ce,task=3Dnamed,pid=3D253,uid=3D997
> [   26.923381] Out of memory: Killed process 253 (named) total-vm:247360k=
B, anon-rss:5824kB, file-rss:768kB, shmem-rss:0kB, UID:997 pgtables:25kB oo=
m_score_adj:0
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/conf/machine/qemuppc64.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc=
64.conf
> index 2fbd26a6f9..1a833a79d8 100644
> --- a/meta/conf/machine/qemuppc64.conf
> +++ b/meta/conf/machine/qemuppc64.conf
> @@ -14,6 +14,7 @@ QB_SYSTEM_NAME =3D "qemu-system-ppc64"
>  QB_MACHINE =3D "-machine pseries"
>  QB_CPU =3D "-cpu POWER9"
>  QB_SMP ?=3D "-smp 2"
> +QB_MEM =3D "-m 512"
>
>  QB_NFSROOTFS_EXTRA_OPT =3D "wsize=3D524288,rsize=3D524288"
>  QB_KERNEL_CMDLINE_APPEND =3D "console=3Dhvc0 nohugevmalloc"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185226): https://lists.openembedded.org/g/openembedde=
d-core/message/185226
> Mute This Topic: https://lists.openembedded.org/mt/100479675/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

