Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A223DC4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:04:07 +0000 (UTC)
Subject: Re: [PATCH V3] rust-cross-canadian: Fix file conflicts for arm and aarch64
To: openembedded-core@lists.openembedded.org
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Apr 2024 04:04:04 -0700
References: <PH7PR11MB6449E0F570031C6CFD50D6A48D4A2@PH7PR11MB6449.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6449E0F570031C6CFD50D6A48D4A2@PH7PR11MB6449.namprd11.prod.outlook.com>
Message-ID: <24153.1714376615480679773@lists.openembedded.org>
X-Old-Date: Mon, 29 Apr 2024 03:52:25 -0700
Content-Type: multipart/alternative; boundary="dTxjhTx7f38UHPahcZMT"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 11:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198733
Message-ID: <20240429110404.GAvP76kL7-7bMTWp0-qmIxjuCh0zpVD1IL3vo1WPCSw@z>

--dTxjhTx7f38UHPahcZMT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Randy,

I verified rust.sh and cargo.sh in the installed sdk those are generated di=
fferently based on the multilib tuning.
...poky/build/tmp/deploy/sdk/install > fd rust.sh
sysroots/x86_64-pokysdk-linux/environment-setup.d/rust.sh
sysroots/x86_64-pokysdk-linux/environment-setup.d/lib32-rust.sh

...poky/build/tmp/deploy/sdk/install > fd cargo.sh
sysroots/x86_64-pokysdk-linux/environment-setup.d/cargo.sh
sysroots/x86_64-pokysdk-linux/environment-setup.d/lib32-cargo.sh

I tested a sample program on 32 and 64 bit targets and its working. Below a=
re the steps:
I copied the Rust compiler binaries generated for both armv7at2hf-neon-poky=
mllib32-linux-gnueabi and cortexa57-poky-linux into a QEMU environment and =
executed a simple "Hello, World!" program using these binaries.

...poky/build/tmp/work/armv7at2hf-neon-pokymllib32-linux-gnueabi/lib32-rust=
/1.74.1/image/usr/bin > scp -r rustc root@192.168.7.6:/arm32/
rustc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0100% =
=C2=A0 13KB =C2=A0 2.2MB/s =C2=A0 00:00

root@qemuarm64:/arm32# cat hello.rs
fn main() {
println!("Hello, World!");
}

root@qemuarm64:/arm32# ./rustc hello.rs
root@qemuarm64:/arm32# ./hello
Hello, World!

---------------------------------------------------------------------------=
---------------------------------------------
...poky/build/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/bu=
ild/aarch64-poky-linux-gnu/stage2/bin > scp =C2=A0rustc root@192.168.7.6:/a=
rm64
rustc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 100% =C2=A0 74KB =C2=A0 4.6MB/s =C2=A0 00:00

root@qemuarm64:/arm64# ls
rustc
root@qemuarm64:/arm64# vi hello.rs
root@qemuarm64:/arm64# cat hello.rs
fn main() {
println!("Hello, World!");
}
root@qemuarm64:/arm64# ./rustc hello.rs
root@qemuarm64:/arm64# ./hello
Hello, World!

--dTxjhTx7f38UHPahcZMT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p>Hello Randy,</p>
<p>I verified rust.sh and cargo.sh in the installed sdk those are generated=
 differently based on the multilib tuning.<br /><em>...poky/build/tmp/deplo=
y/sdk/install &gt; fd rust.sh</em><br /><em>sysroots/x86_64-pokysdk-linux/e=
nvironment-setup.d/rust.sh</em><br /><em>sysroots/x86_64-pokysdk-linux/envi=
ronment-setup.d/lib32-rust.sh</em></p>
<p><em>...poky/build/tmp/deploy/sdk/install &gt; fd cargo.sh</em><br /><em>=
sysroots/x86_64-pokysdk-linux/environment-setup.d/cargo.sh</em><br /><em>sy=
sroots/x86_64-pokysdk-linux/environment-setup.d/lib32-cargo.sh</em><br /><b=
r />I tested a sample program on 32 and 64 bit targets and its working. Bel=
ow are the steps:<br />I copied the Rust compiler binaries generated for bo=
th <em>armv7at2hf-neon-pokymllib32-linux-gnueabi</em> and <em>cortexa57-pok=
y-linux</em> into a QEMU environment and executed a simple "Hello, World!" =
program using these binaries.&nbsp;<br />&nbsp;<br /><em>...poky/build/tmp/=
work/armv7at2hf-neon-pokymllib32-linux-gnueabi/lib32-rust/1.74.1/image/usr/=
bin &gt; scp -r rustc root@192.168.7.6:/arm32/</em><br /><em>rustc &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;100% &nbsp; 13KB &n=
bsp; 2.2MB/s &nbsp; 00:00</em><br /><br /><em>root@qemuarm64:/arm32# cat he=
llo.rs</em><br /><em>fn main() {</em><br /><em>&nbsp; &nbsp; println!("Hell=
o, World!");</em><br /><em>}</em><br /><br /><em>root@qemuarm64:/arm32# ./r=
ustc hello.rs</em><br /><em>root@qemuarm64:/arm32# ./hello</em><br /><em>He=
llo, World!</em><br /><br /><em>-------------------------------------------=
---------------------------------------------------------------------------=
--</em><br /><em>...poky/build/tmp/work/cortexa57-poky-linux/rust/1.74.1/ru=
stc-1.74.1-src/build/aarch64-poky-linux-gnu/stage2/bin &gt; scp &nbsp;rustc=
 root@192.168.7.6:/arm64</em><br /><em>rustc &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 100% &nbsp; 74KB &nbsp; 4.6MB=
/s &nbsp; 00:00</em><br /><br /><em>root@qemuarm64:/arm64# ls</em><br /><em=
>rustc</em><br /><em>root@qemuarm64:/arm64# vi hello.rs</em><br /><em>root@=
qemuarm64:/arm64# cat hello.rs</em><br /><em>fn main() {</em><br /><em>&nbs=
p; &nbsp; println!("Hello, World!");</em><br /><em>}</em><br /><em>root@qem=
uarm64:/arm64# ./rustc hello.rs</em><br /><em>root@qemuarm64:/arm64# ./hell=
o</em><br /><em>Hello, World!</em></p>

--dTxjhTx7f38UHPahcZMT--

