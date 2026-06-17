Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C15CD98E4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 10:14:15 +0000 (UTC)
Subject: Re: [scarthgap][PATCH] openssl: upgrade 3.5.6 -> 3.5.7
To: openembedded-core@lists.openembedded.org
From: "Sai Sneha" <saisneha196@gmail.com>
X-Originating-Location: IN (203.197.190.100)
X-Originating-Platform: Windows Edge 149
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 17 Jun 2026 03:14:05 -0700
References: <20260616165623.3049563-1-peter.marko@siemens.com>
In-Reply-To: <20260616165623.3049563-1-peter.marko@siemens.com>
Message-ID: <197246.1781691245370176580@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="4MJQGXRaaq50pcaDm3xv"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 10:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239029

--4MJQGXRaaq50pcaDm3xv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

I applied your scarthgap patch (#238923) directly via git am on a clean ori=
gin/scarthgap checkout and ran the openssl ptests on QEMU (qemux86-64, defa=
ult memory, no manual config changes).

lhash_test fails with an OOM kill:

Out of memory: Killed process 546 (lhash_test) total-vm:72960kB, anon-rss:6=
5792kB

41 tests pass before this ( 02-test_list.t is the last to pass), then 02-te=
st_lhash.t fails with exit code 137 (SIGKILL). Later in the run, the ptest-=
runner process itself also gets killed by the OOM killer, so the suite does=
n't complete fully (TOTAL: 1 FAIL: 2).

I also tested this independently on oe-core master-next (your original comm=
it 9365ac47f994a7d6be92b8c011c51ecf48e8ef87 ) and on my own scarthgap backp=
ort same lhash_test OOM occurs in all three cases under default QEMU memory=
. When I manually bumped QEMU's memory to 1GB, lhash_test passes, so it's a=
 memory-availability issue rather than a problem with the patch itself.

Is this a known/expected limitation with the default qemux86-64 ptest QEMU =
memory, or is there something I should configure differently when running t=
hese tests?

Thanks,
Sai Sneha

--4MJQGXRaaq50pcaDm3xv
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<p class=3D"font-claude-response-body break-words whitespace-normal">Hi Pet=
er,</p>
<p class=3D"font-claude-response-body break-words whitespace-normal">I appl=
ied your scarthgap patch (#238923) directly via git am on a clean origin/sc=
arthgap checkout and ran the openssl ptests on QEMU (qemux86-64, default me=
mory, no manual config changes).</p>
<p class=3D"font-claude-response-body break-words whitespace-normal">lhash_=
test fails with an OOM kill:</p>
<div class=3D"relative group/copy bg-bg-000/50 border-0.5 border-border-400=
 rounded-lg focus:outline-none focus-visible:ring-2 focus-visible:ring-acce=
nt-100" tabindex=3D"0" role=3D"group" aria-label=3D"Code">
<div class=3D"sticky opacity-0 group-hover/copy:opacity-100 group-focus-wit=
hin/copy:opacity-100 top-2 py-2 h-12 w-0 float-right">
<div class=3D"absolute right-0 h-8 px-2 items-center inline-flex z-10">
<div class=3D"relative">
<div class=3D"transition-all opacity-100 scale-100" style=3D"width: 20px; h=
eight: 20px; display: flex; align-items: center; justify-content: center;">=
&nbsp;</div>
<div class=3D"absolute inset-0 flex items-center justify-center">
<div class=3D"transition-all opacity-0 scale-50" style=3D"width: 20px; heig=
ht: 20px; display: flex; align-items: center; justify-content: center;">&nb=
sp;</div>
</div>
</div>
</div>
</div>
<div class=3D"overflow-x-auto">
<pre class=3D"code-block__code !my-0 !rounded-lg !text-sm !leading-relaxed =
p-3.5" style=3D"color: #14181f; background: transparent; font-family: var(-=
-font-mono);"><code style=3D"color: #14181f; background: transparent; font-=
family: var(--font-mono); white-space: pre-wrap;"><span><span>Out of memory=
: Killed process 546 (lhash_test) total-vm:72960kB, anon-rss:65792kB</span>=
</span></code></pre>
</div>
</div>
<p class=3D"font-claude-response-body break-words whitespace-normal">41 tes=
ts pass before this (<code class=3D"bg-text-200/5 border border-0.5 border-=
border-300 text-danger-000 whitespace-pre-wrap rounded-[0.4rem] px-1 py-px =
text-[0.9rem]">02-test_list.t</code> is the last to pass), then <code class=
=3D"bg-text-200/5 border border-0.5 border-border-300 text-danger-000 white=
space-pre-wrap rounded-[0.4rem] px-1 py-px text-[0.9rem]">02-test_lhash.t</=
code> fails with exit code 137 (SIGKILL). Later in the run, the ptest-runne=
r process itself also gets killed by the OOM killer, so the suite doesn't c=
omplete fully (TOTAL: 1 FAIL: 2).&nbsp;</p>
<p class=3D"font-claude-response-body break-words whitespace-normal">I also=
 tested this independently on oe-core master-next (your original commit <co=
de class=3D"bg-text-200/5 border border-0.5 border-border-300 text-danger-0=
00 whitespace-pre-wrap rounded-[0.4rem] px-1 py-px text-[0.9rem]">9365ac47f=
994a7d6be92b8c011c51ecf48e8ef87</code>) and on my own scarthgap backport sa=
me lhash_test OOM occurs in all three cases under default QEMU memory. When=
 I manually bumped QEMU's memory to 1GB, lhash_test passes, so it's a memor=
y-availability issue rather than a problem with the patch itself.</p>
<p class=3D"font-claude-response-body break-words whitespace-normal">Is thi=
s a known/expected limitation with the default qemux86-64 ptest QEMU memory=
, or is there something I should configure differently when running these t=
ests?</p>
<p class=3D"font-claude-response-body break-words whitespace-normal">Thanks=
,<br />Sai Sneha</p>
</div>

--4MJQGXRaaq50pcaDm3xv--

