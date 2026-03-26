Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EA910AB803
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 18:47:15 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55377.1774550832177520405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 11:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PRJTtJVI;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64ca4dfdd88so1545187d50.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774550831; cv=none;
        d=google.com; s=arc-20240605;
        b=EPpw31cUzw5BgqYIDaCsz6MwRw9cE4WYr2KifE7c/DLLMOqP2/4IC11KvdZJnln7zw
         PjJGIwnT81hH+ugFBM18eF19Q1djcPNK/TpcOuAP+o5RihI2Ixk1ltM2TxKb9ZJGEfKd
         S+EUpaYOJABwenndfl80Q9fc7h+Kpts2VdOrLMTdD3jsk1tDYmJL/7IeP5kJKiwsXhSX
         vSZHg/QwKTEMwZr4wGu6CMuF3sP3c+j1ZCutgGE1sHWZP2kGIx9vQhIoHkmXoXXGF7hE
         uf1OPc/p5EojjTrmxCXanVPDiCF6gFjWW5O1dfvw4AKTcJ6SYohkwT5zhAXRFRJyiZ8j
         /2dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=48/utaxE5cCgMMuOoO8aSl4IHVXw13zQufcutgvlqjM=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=VumxXZaJ7Q+d4/9Yf2jgW4RMeMJIakXRgmZBCcIIAGgAuck920KFyTApvsDkJVms27
         /9SdPef6XDFFiLTaOJkWtSNWZcp5A/ieJrc/zb4ujdsQLqGH9ZW3vs3aJcmpy3EFJb8h
         cTKUp9EqNjbAlssg/AWpnRghyoPfNcBunonYPyKVNnxSJvHYxmLwwThCHVK5+uV5mGN4
         I2GuoTcDCpaY8KgOf5H60L1wRVuvq34bCywTvoJZujxnumhmuavtFBFTQel0/XcftTpP
         RER1j2y0cvBWlmgwL/csayx4ZL05DzP/xuH10pnZTzyJHU+0NdxYoFANhocx9YGoQ+89
         AbRA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774550831; x=1775155631; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=48/utaxE5cCgMMuOoO8aSl4IHVXw13zQufcutgvlqjM=;
        b=PRJTtJVI5BbgDGkRATp4sudpNyA3M8i0K1b7rM3nU/1+l5PNznbA1nkt43wXmB3otg
         ATG3LLZ4zw/qIY/7vTDqiTeP2LiuARxhUUKDttk0awQ61cApwS6aDEkpRBb5zpeUzvo4
         kYdL19YaVwxO/FZ5jvkaa1denyFLFp4R2i21ZPXlfX+FBntzCvC7JyLvb8YK30WXmIYJ
         IGCJVZ6V/2a7w79VTHI6/PECTZw29hEb+NzkYSzqxx7bES5PI8JMOXuaG6Whr5298bi8
         EhfuX3HeNwuNJxriADa7G3jWFJn+9a1xFQy75/ZOC2B8O0PUYww6DClqYqAhU+5mpxqQ
         Hk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774550831; x=1775155631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48/utaxE5cCgMMuOoO8aSl4IHVXw13zQufcutgvlqjM=;
        b=IckkY3gCzP50SWkQ2BeacDUna1LTXp2xDdxPQO/xPiLZCOeVJxYGiavEo8+gZdFR8F
         0VzZC3M8Bv64zXlDgRzsoWwq+SIOo5GBtTyln7PvFgd5aXcQb+h6vaW1z0qMbjoZjW42
         cxaqYgBAKq+9GwKYK6MAAEUzTulLyA5B50SvP4988soZ3KcURXVBbaPkhbejdGJxA8cW
         Z/qDPAyzsdH1Hy4xlmcVViSXsQHq9cwLS8VZEJnqamvB1tDOLwfjcDKkZVJ/88hb4shO
         viOl+j3fTsqb0JMSbZB9kdQPe/TgktpQDmYtpDqNED/ZzNt25TsaBIXMe30tmzPlbdyx
         9S/w==
X-Gm-Message-State: AOJu0YzZh8YASsd330VvAV1EOWfa3Vpr9IdfZbeLE1NuZjynl1F9S7Nb
	QqGrAf+g8Mkq0IqvrhO75TrChGRE9reqIIFqz3LBS7Jv/zwJIhU2LW9+zQuCpqrQVl1YpNIXt0b
	ChLJlcLeKuyMKaiziuPEX7jiUedxt+trvh4sWJ4I=
X-Gm-Gg: ATEYQzzP8JLm/ETqBbUA6okVoRUzgxvOv6yGYN+/i4oVgIC7dJbiO3dKdUzYn/ViNki
	9irGzjqWHzi2ciQVsRLTr4KcI/6Fi6uq2aJ5G5lZ1y1aCArohhOqI88/X9rsbEAhUkOA/uK/G7p
	RgtyNUY63hVUv9X4x/4ecaqCPaKf5Gb5+dUks/uhThKWWtdlx0d5riz6YPgPQbNwLFBwlUhAsfk
	2xcR1EFBwYusvmrkSvjCW+jfJiFuvgLW7+QB0hcwKIIJUe8VBhOBe9BlUJy6WrxtqMnCWyt2rI+
	CQ+JVnRIrbZVMhMwcZKH4cWWqkIhaCZlISRrulCPYiJlpJ7gv106NHyUZc+2kVnbJ/IpE5TdL1o
	O3JRiPPmqxhXgxY0vVcMkjS/Q
X-Received: by 2002:a05:690e:408b:b0:64a:cff3:8f4c with SMTP id
 956f58d0204a3-64ee61574d3mr8310051d50.65.1774550831236; Thu, 26 Mar 2026
 11:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260326020923.297511-1-khem.raj@oss.qualcomm.com>
 <DHCPXEPGK489.13NFXVPD5IBMZ@bootlin.com> <CAMKF1sqj0aGPNbo7Wi9mkFv4hzjhy8HZuzZ_uR4Y2FZ=Dp5dEQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqj0aGPNbo7Wi9mkFv4hzjhy8HZuzZ_uR4Y2FZ=Dp5dEQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Mar 2026 11:46:44 -0700
X-Gm-Features: AQROBzBvlyoy-vxuTbV4HUecZITfgopx81aUmNTYu_oXHJ4Sh0aKpXuTKh-D_jk
Message-ID: <CAMKF1so=Qv2mJ3TkCKDY4O4XhDEx9=H0gC_SE_tLO1fr7tt7VQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/4] clang/llvm: Upgrade to 22.x major release
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ee8bf1064df1cf93"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 18:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234043

--000000000000ee8bf1064df1cf93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW I ran the [qemarm|qemuarm64|qemuriscv64]-tc jobs on AB using my latest
yoe/mut branch and they all passed green.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/3416
https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/1292
https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/3414

On Thu, Mar 26, 2026 at 8:18=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

>
>
> On Thu, Mar 26, 2026 at 5:38=E2=80=AFAM Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com> wrote:
>
>> On Thu Mar 26, 2026 at 3:09 AM CET, Khem Raj via lists.openembedded.org
>> wrote:
>> > From: Khem Raj <raj.khem@gmail.com>
>> >
>> > Includes support for new Intel (Wildcat Lake, Nova Lake with APX and
>> AVX10.2)
>> > Arm (C1 Nano, Pro, Premium, Ultra) processors. It also features
>> performance
>> > optimizations for AMD Zen 4 and Zen 5 architectures.
>> >
>> > Integrated Distributed ThinLTO is more mature, with enhancements
>> > like cache support for incremental builds and robust handling of
>> temporary artifacts.
>> >
>> > LLDB added first-class WebAssembly debugging support, including
>> breakpoints and variable inspection.
>> >
>> > Support for Google Native Client (NaCl) is dropped in this release.
>> >
>> > Detailed ChangeLog [1]
>> >
>> > [1] https://releases.llvm.org/22.1.0/docs/ReleaseNotes.html
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>>
>> Hi Khem,
>>
>> Thanks for the new version. I believe we have two issues linked with
>> this patch.
>>
>>
>> Firs, an x86 build issue:
>>
>> ERROR: clang-22.1.1-r0 do_compile: Execution of
>> '/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-=
64-v3-poky-linux/clang/22.1.1/temp/run.do_compile.91398'
>> failed with exit code 1
>> ...
>> | Run Build Command(s): ninja -v -j 16 all
>> | ninja: error:
>> '/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work-shar=
ed/llvm-project-source-22.1.1-r0/sources/llvm-project-22.1.1.src/clang/tool=
s/scan-build-py/lib64/libscanbuild/__init__.py',
>> needed by 'lib64/libscanbuild/__init__.py', missing and no known rule to
>> make it
>> |
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3302
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3478
>>
>> Then, a rust selftest issue:
>>
>> 2026-03-26 11:11:17,872 - oe-selftest - INFO -
>> rust.RustSelfTestSystemEmulated.test_rust (subunit.RemotedTestCase)
>> 2026-03-26 11:11:17,889 - oe-selftest - INFO -  ... FAIL
>> ...
>> test [assembly] tests/assembly-llvm/asm/loongarch-type.rs#loongarch32 ..=
.
>> FAILED
>> ...
>>
>> failures:
>>
>> ---- [assembly] tests/assembly-llvm/asm/loongarch-type.rs#loongarch32
>> stdout ----
>> ------FileCheck stdout------------------------------
>>
>> ------FileCheck stderr------------------------------
>> /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-2170811/tmp/work=
/cortexa57-poky-linux/rust/1.94.0/sources/rustc-1.94.0-src/tests/assembly-l=
lvm/asm/loongarch-type.rs:31:11:
>> error: CHECK: expected string not found in input
>> // CHECK: pcalau12i $t0, %got_pc_hi20(extern_func)
>>           ^
>> /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-2170811/tmp/work=
/cortexa57-poky-linux/rust/1.94.0/sources/rustc-1.94.0-src/build/x86_64-unk=
nown-linux-gnu/test/assembly-llvm/asm/loongarch-type.loongarch32/loongarch-=
type.s:9:6:
>> note: scanning from here
>>  #APP
>>      ^
>> ...
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/3413
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/1289
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/3411
>>
>> Can you have a look at the issue?
>>
>>
> there is a failure in rust tests due to a loongarch asm tests, this has
> been fixed upstream so
> I have backported it to rust in OE and sent a v3. Thanks
>
>
>> Thanks,
>> Mathieu
>>
>> --
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>

--000000000000ee8bf1064df1cf93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW I ran the [qemarm|qemuarm64|qemuriscv64]-tc jobs on A=
B using my latest yoe/mut branch and they all passed green.<div><br></div><=
div><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/b=
uilds/3416">https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/buil=
ds/3416</a></div><div><a href=3D"https://autobuilder.yoctoproject.org/valky=
rie/#/builders/58/builds/1292">https://autobuilder.yoctoproject.org/valkyri=
e/#/builders/58/builds/1292</a></div><div><a href=3D"https://autobuilder.yo=
ctoproject.org/valkyrie/#/builders/42/builds/3414">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/42/builds/3414</a></div></div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, Mar 26, 2026 at 8:18=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Thu, Mar 26, 2026 at 5:38=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=
=3D"mailto:mathieu.dubois-briand@bootlin.com" target=3D"_blank">mathieu.dub=
ois-briand@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Thu Mar 26, 2026 at 3:09 AM CET, Khem Raj via <a h=
ref=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">=
lists.openembedded.org</a> wrote:<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Includes support for new Intel (Wildcat Lake, Nova Lake with APX and A=
VX10.2)<br>
&gt; Arm (C1 Nano, Pro, Premium, Ultra) processors. It also features perfor=
mance<br>
&gt; optimizations for AMD Zen 4 and Zen 5 architectures.<br>
&gt;<br>
&gt; Integrated Distributed ThinLTO is more mature, with enhancements<br>
&gt; like cache support for incremental builds and robust handling of tempo=
rary artifacts.<br>
&gt;<br>
&gt; LLDB added first-class WebAssembly debugging support, including breakp=
oints and variable inspection.<br>
&gt;<br>
&gt; Support for Google Native Client (NaCl) is dropped in this release.<br=
>
&gt;<br>
&gt; Detailed ChangeLog [1]<br>
&gt;<br>
&gt; [1] <a href=3D"https://releases.llvm.org/22.1.0/docs/ReleaseNotes.html=
" rel=3D"noreferrer" target=3D"_blank">https://releases.llvm.org/22.1.0/doc=
s/ReleaseNotes.html</a><br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Khem,<br>
<br>
Thanks for the new version. I believe we have two issues linked with<br>
this patch.<br>
<br>
<br>
Firs, an x86 build issue:<br>
<br>
ERROR: clang-22.1.1-r0 do_compile: Execution of &#39;/srv/pokybuild/yocto-w=
orker/qemux86-world-alt/build/build/tmp/work/x86-64-v3-poky-linux/clang/22.=
1.1/temp/run.do_compile.91398&#39; failed with exit code 1<br>
...<br>
| Run Build Command(s): ninja -v -j 16 all<br>
| ninja: error: &#39;/srv/pokybuild/yocto-worker/qemux86-world-alt/build/bu=
ild/tmp/work-shared/llvm-project-source-22.1.1-r0/sources/llvm-project-22.1=
.1.src/clang/tools/scan-build-py/lib64/libscanbuild/__init__.py&#39;, neede=
d by &#39;lib64/libscanbuild/__init__.py&#39;, missing and no known rule to=
 make it<br>
|<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/buil=
ds/3302" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/17/builds/3302</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/buil=
ds/3478" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/59/builds/3478</a><br>
<br>
Then, a rust selftest issue:<br>
<br>
2026-03-26 11:11:17,872 - oe-selftest - INFO - rust.RustSelfTestSystemEmula=
ted.test_rust (subunit.RemotedTestCase)<br>
2026-03-26 11:11:17,889 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
...<br>
test [assembly] tests/assembly-llvm/asm/loongarch-type.rs#loongarch32 ... F=
AILED<br>
...<br>
<br>
failures:<br>
<br>
---- [assembly] tests/assembly-llvm/asm/loongarch-type.rs#loongarch32 stdou=
t ----<br>
------FileCheck stdout------------------------------<br>
<br>
------FileCheck stderr------------------------------<br>
/srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-2170811/tmp/work/co=
rtexa57-poky-linux/rust/1.94.0/sources/rustc-1.94.0-src/tests/assembly-llvm=
/asm/loongarch-type.rs:31:11: error: CHECK: expected string not found in in=
put<br>
// CHECK: pcalau12i $t0, %got_pc_hi20(extern_func)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
/srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-2170811/tmp/work/co=
rtexa57-poky-linux/rust/1.94.0/sources/rustc-1.94.0-src/build/x86_64-unknow=
n-linux-gnu/test/assembly-llvm/asm/loongarch-type.loongarch32/loongarch-typ=
e.s:9:6: note: scanning from here<br>
=C2=A0#APP<br>
=C2=A0 =C2=A0 =C2=A0^<br>
...<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/build=
s/3413" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/5/builds/3413</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/buil=
ds/1289" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/58/builds/1289</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/buil=
ds/3411" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/42/builds/3411</a><br>
<br>
Can you have a look at the issue?<br>
<br></blockquote><div><br></div><div>there is a failure in rust tests due t=
o a loongarch asm tests, this has been fixed upstream so</div><div>I have b=
ackported it to rust in OE and sent a v3. Thanks</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>
</blockquote></div>

--000000000000ee8bf1064df1cf93--

