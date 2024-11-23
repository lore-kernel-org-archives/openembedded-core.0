Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DF3E6ADF8
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 12:17:53 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.46099.1732364262537703060
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Nov 2024 04:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout10.t-online.de (Postfix) with SMTP id E76DD414;
	Sat, 23 Nov 2024 13:17:40 +0100 (CET)
Received: from [192.168.178.67] ([84.163.36.244]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tEp52-1egOIq0; Sat, 23 Nov 2024 13:17:40 +0100
Date: Sat, 23 Nov 2024 13:17:35 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gcc: add a backport patch to fix an issue with
 tzdata 2024b
To: Steve Sakoman <steve@sakoman.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <BTKENS.XCDO3GCTQU892@t-online.de>
In-Reply-To: <180A9579BCE9D834.32265@lists.openembedded.org>
References: <20241122012941.3055-1-f_l_k@t-online.de>
	<CA+chaQcL_dGkNAgVXD3JWvKFObQ=73tfSbkJcdFHbkDH9HqD5w@mail.gmail.com>
	<CAOSpxdaeYv3DEcSXHs4j0c-+XZaR=PfokWF09TCuJ8QKpABEBg@mail.gmail.com>
	<R8HENS.P1NP684GLCTM2@t-online.de>
	<180A9579BCE9D834.32265@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-nc3Ga8DYVzInIlhI/5DV"
X-TOI-EXPURGATEID: 150726::1732364260-47FE5864-09FCA4C6/0/0 CLEAN NORMAL
X-TOI-MSGID: 8b0e8475-8eab-42b5-a8ee-b032f6a86561
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 12:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207682

--=-nc3Ga8DYVzInIlhI/5DV
Content-Type: text/plain; charset=us-ascii; format=flowed

I managed to work around the ninja-native problem by simply calling 
'bitbake -c do_configure gcc', which works, and then bitbake gcc

Like this ninja-native also fails, but gcc is built. So I can at least 
confirm that the patch is applied and gcc compiles on scarthgap.
For kirkstone this patch does not apply and to me it looks like the gcc 
version used is too old to even support c++20 time zone support in 
<chrono>.

<https://gcc.gnu.org/pipermail/libstdc++-cvs/2022q4/039034.html>


On Sat, Nov 23 2024 at 12:29:08 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> It's not that I didnt't try, but it seams like I cant build gcc for 
> scarthgap from my host system (which is based on master branch)
> 
> I'm lacking pipes due to python 3.13
> ERROR: ninja-native-1.11.1-r0 do_compile: 
> ExecutionError('/home/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.11.1/temp/run.do_compile.175990', 
> 1, None, None)
> ERROR: Logfile of failure stored in: 
> /home/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.11.1/temp/log.do_compile.175990
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | Traceback (most recent call last):
> | File 
> "/home/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.11.1/git/./configure.py", 
> line 26, in <module>
> | import pipes
> | ModuleNotFoundError: No module named 'pipes'
> | WARNING: 
> /home/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.11.1/temp/run.do_compile.175990:142 
> exit 1 from 'python3 ./configure.py --bootstrap'
> | WARNING: Backtrace (BB generated script):
> | #1: do_compile, 
> /home/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.11.1/temp/run.do_compile.175990, 
> line 142
> | #2: main, 
> /home/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.11.1/temp/run.do_compile.175990, 
> line 146
> ERROR: Task 
> (virtual:native:/home/flk/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_compile) 
> failed with exit code '1'
> 
> 
> On Sat, Nov 23 2024 at 12:00:27 PM +01:00:00, Markus Volk 
> <f_l_k@t-online.de> wrote:
>> On Fri, Nov 22 2024 at 05:33:29 AM -08:00:00, Steve Sakoman 
>> <steve@sakoman.com> wrote:
>>> Markus, could you send versions of this patch for stable branches 
>>> too?
>>> (styhead, scarthgap, kirkstone)
>> 
>> I have sent the patches, but only verified that they would apply. I 
>> can't comile test them as I dont have buildsystems set up for any of 
>> these branches


--=-nc3Ga8DYVzInIlhI/5DV
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>I managed to work around the =
ninja-native problem by simply calling 'bitbake -c do_configure gcc', which=
 works, and then bitbake gcc</div><div><br></div><div>Like this ninja-nativ=
e also fails, but gcc is built. So I can at least confirm that the patch is=
 applied and gcc compiles on scarthgap.</div><div>For kirkstone this patch =
does not apply and to me it looks like the gcc version used is too old to e=
ven support c++20 time zone support in &lt;chrono&gt;.</div><div><br></div>=
</div><div><a href=3D"https://gcc.gnu.org/pipermail/libstdc++-cvs/2022q4/03=
9034.html">https://gcc.gnu.org/pipermail/libstdc++-cvs/2022q4/039034.html</=
a></div><div><br></div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Sa=
t, Nov 23 2024 at 12:29:08 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&=
gt; wrote:<br><blockquote type=3D"cite"><div id=3D"geary-body" dir=3D"auto"=
><div>It's not that I didnt't try, but it seams like I cant build gcc for s=
carthgap from my host system (which is based on master branch)</div><div><b=
r></div><div>I'm lacking pipes due to python 3.13</div><div>ERROR: ninja-na=
tive-1.11.1-r0 do_compile: ExecutionError('/home/flk/poky/build-test/tmp/wo=
rk/x86_64-linux/ninja-native/1.11.1/temp/run.do_compile.175990', 1, None, N=
one)</div><div>ERROR: Logfile of failure stored in: /home/flk/poky/build-te=
st/tmp/work/x86_64-linux/ninja-native/1.11.1/temp/log.do_compile.175990</di=
v><div>Log data follows:</div><div>| DEBUG: Executing shell function do_com=
pile</div><div>| Traceback (most recent call last):</div><div>|   File "/ho=
me/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.11.1/git/./conf=
igure.py", line 26, in &lt;module&gt;</div><div>|     import pipes</div><di=
v>| ModuleNotFoundError: No module named 'pipes'</div><div>| WARNING: /home=
/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.11.1/temp/run.do_=
compile.175990:142 exit 1 from 'python3 ./configure.py --bootstrap'</div><d=
iv>| WARNING: Backtrace (BB generated script):</div><div>| 	#1: do_compile,=
 /home/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.11.1/temp/r=
un.do_compile.175990, line 142</div><div>| 	#2: main, /home/flk/poky/build-=
test/tmp/work/x86_64-linux/ninja-native/1.11.1/temp/run.do_compile.175990, =
line 146</div><div>ERROR: Task (virtual:native:/home/flk/poky/meta/recipes-=
devtools/ninja/ninja_1.11.1.bb:do_compile) failed with exit code '1'</div><=
div><br></div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Sat, Nov 23=
 2024 at 12:00:27 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote=
:<br><blockquote type=3D"cite"><div id=3D"geary-body" dir=3D"auto">On Fri, =
Nov 22 2024 at 05:33:29 AM -08:00:00, Steve Sakoman &lt;steve@sakoman.com&g=
t; wrote:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"wh=
ite-space: break-spaces;">Markus, could you send versions of this patch for=
 stable branches too?
(styhead, scarthgap, kirkstone)</div></blockquote><div><br></div><div>I hav=
e sent the patches, but only verified that they would apply. I can't comile=
 test them as I dont have buildsystems set up for any of these branches</di=
v></div></blockquote></div>
</blockquote></div>
--=-nc3Ga8DYVzInIlhI/5DV--


