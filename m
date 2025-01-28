Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3610BC0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 10:28:27 +0000 (UTC)
Subject: Re: [PATCH] qemuriscv: Enable Sv39 memory address scheme by default
To: openembedded-core@lists.openembedded.org
From: "Yash Shinde" <Yash.Shinde@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 132
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 28 Jan 2025 02:28:20 -0800
References: <20250128101633.3664659-1-Yash.Shinde@windriver.com>
In-Reply-To: <20250128101633.3664659-1-Yash.Shinde@windriver.com>
Message-ID: <29362.1738060100000717567@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="2F89JQfs7hE7PWunGR9w"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 10:28:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210317

--2F89JQfs7hE7PWunGR9w
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Tested Asan test as follows with command "runqemu nographic"
(with IMAGE_INSTALL:append =3D " libasan=C2=A0 libasan-dev"):

root@qemuriscv64:~# gcc -g -fsanitize=3Daddress -o asan_test asan_test.c

root@qemuriscv64:~# ./asan_test

Running AddressSanitizer test...

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

=3D=3D262=3D=3DERROR: AddressSanitizer: stack-buffer-overflow on address 0x=
003f9380002a at pc 0x002add509b88 bp 0x003ff6510ec0 sp 0x003ff6510e90

WRITE of size 1 at 0x003f9380002a thread T0

#0 0x2add509b86 in cause_buffer_overflow /home/root/a.c:9

#1 0x2add509ca2 in main /home/root/a.c:16

#2 0x3f95a917b4 (/lib/libc.so.6+0x277b4) (BuildId: 89440b2a8f8e9f78366a816e=
4685a39d6a4de4c5)

#3 0x3f95a9185c in __libc_start_main (/lib/libc.so.6+0x2785c) (BuildId: 894=
40b2a8f8e9f78366a816e4685a39d6a4de4c5)

#4 0x2add509a1e in _start ../sysdeps/riscv/start.S:67

Address 0x003f9380002a is located in stack of thread T0 at offset 42 in fra=
me

#0 0x2add509ac4 in cause_buffer_overflow /home/root/a.c:5

This frame has 1 object(s):

[32, 42) 'buffer' (line 6) <=3D=3D Memory access at offset 42 overflows thi=
s variable

HINT: this may be a false positive if your program uses some custom stack u=
nwind mechanism, swapcontext or vfork

(longjmp and C++ exceptions *are* supported)

SUMMARY: AddressSanitizer: stack-buffer-overflow /home/root/a.c:9 in cause_=
buffer_overflow

Shadow bytes around the buggy address:

0x003f937ffd80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0x003f937ffe00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0x003f937ffe80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0x003f937fff00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0x003f937fff80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

=3D>0x003f93800000: f1 f1 f1 f1 00[02]f3 f3 00 00 00 00 00 00 00 00

0x003f93800080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0x003f93800100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0x003f93800180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0x003f93800200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0x003f93800280: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Shadow byte legend (one shadow byte represents 8 application bytes):

Addressable: 00

Partially addressable: 01 02 03 04 05 06 07

Heap left redzone: fa

Freed heap region: fd

Stack left redzone: f1

Stack mid redzone: f2

Stack right redzone: f3

Stack after return: f5

Stack use after scope: f8

Global redzone: f9

Global init order: f6

Poisoned by user: f7

Container overflow: fc

Array cookie: ac

Intra object redzone: bb

ASan internal: fe

Left alloca redzone: ca

Right alloca redzone: cb

--2F89JQfs7hE7PWunGR9w
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;">Tested A=
san test as follows with command "runqemu nographic" <br />(with IMAGE_INST=
ALL:append =3D " libasan&nbsp; libasan-dev"):<br /><br />root@qemuriscv64:~=
# gcc -g -fsanitize=3Daddress -o asan_test asan_test.c</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;">root@qem=
uriscv64:~# ./asan_test&nbsp;</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;">Running =
AddressSanitizer test...</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;">=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;">=3D=3D26=
2=3D=3DERROR: AddressSanitizer: stack-buffer-overflow on address 0x003f9380=
002a at pc 0x002add509b88 bp 0x003ff6510ec0 sp 0x003ff6510e90</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;">WRITE of=
 size 1 at 0x003f9380002a thread T0</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>#0 0x2add509b86 in cau=
se_buffer_overflow /home/root/a.c:9</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>#1 0x2add509ca2 in mai=
n /home/root/a.c:16</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>#2 0x3f95a917b4<span s=
tyle=3D"mso-spacerun: yes;">&nbsp; </span>(/lib/libc.so.6+0x277b4) (BuildId=
: 89440b2a8f8e9f78366a816e4685a39d6a4de4c5)</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>#3 0x3f95a9185c in __l=
ibc_start_main (/lib/libc.so.6+0x2785c) (BuildId: 89440b2a8f8e9f78366a816e4=
685a39d6a4de4c5)</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>#4 0x2add509a1e in _st=
art ../sysdeps/riscv/start.S:67</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;">&nbsp;</=
p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;">Address =
0x003f9380002a is located in stack of thread T0 at offset 42 in frame</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>#0 0x2add509ac4 in cau=
se_buffer_overflow /home/root/a.c:5</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;">&nbsp;</=
p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>This frame has 1 object(s):</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>[32, 42) 'buffer' (lin=
e 6) &lt;=3D=3D Memory access at offset 42 overflows this variable</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;">HINT: th=
is may be a false positive if your program uses some custom stack unwind me=
chanism, swapcontext or vfork</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>(longjmp a=
nd C++ exceptions *are* supported)</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;">SUMMARY:=
 AddressSanitizer: stack-buffer-overflow /home/root/a.c:9 in cause_buffer_o=
verflow</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;">Shadow b=
ytes around the buggy address:</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>0x003f937ffd80: 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>0x003f937ffe00: 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>0x003f937ffe80: 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>0x003f937fff00: 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>0x003f937fff80: 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;">=3D&gt;0=
x003f93800000: f1 f1 f1 f1 00[02]f3 f3 00 00 00 00 00 00 00 00</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>0x003f93800080: 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>0x003f93800100: 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>0x003f93800180: 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>0x003f93800200: 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>0x003f93800280: 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;">Shadow b=
yte legend (one shadow byte represents 8 application bytes):</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Addressable:<span style=3D"mso-spa=
cerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <=
/span>00</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Partially addressable: 01 02 03 04=
 05 06 07</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Heap left redzone:<span style=3D"m=
so-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>fa</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Freed heap region:<span style=3D"m=
so-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>fd</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Stack left redzone:<span style=3D"=
mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>f1</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Stack mid redzone:<span style=3D"m=
so-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>f2</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Stack right redzone:<span style=3D=
"mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span>f3</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Stack after return:<span style=3D"=
mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>f5</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Stack use after scope:<span style=
=3D"mso-spacerun: yes;">&nbsp;&nbsp; </span>f8</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Global redzone:<span style=3D"mso-=
spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </sp=
an>f9</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Global init order:<span style=3D"m=
so-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>f6</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Poisoned by user:<span style=3D"ms=
o-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>f7</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Container overflow:<span style=3D"=
mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>fc</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Array cookie:<span style=3D"mso-sp=
acerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; </span>ac</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Intra object redzone:<span style=
=3D"mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>bb</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>ASan internal:<span style=3D"mso-s=
pacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 </span>fe</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Left alloca redzone:<span style=3D=
"mso-spacerun: yes;">&nbsp;&nbsp;&nbsp;&nbsp; </span>ca</p>
<p style=3D"margin: 0in; font-family: Calibri; font-size: 11.0pt;"><span st=
yle=3D"mso-spacerun: yes;">&nbsp; </span>Right alloca redzone:<span style=
=3D"mso-spacerun: yes;">&nbsp;&nbsp;&nbsp; </span>cb</p>
</div>

--2F89JQfs7hE7PWunGR9w--

