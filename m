Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B5CE6601F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 01:10:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3B1Aw5b018082
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Apr 2016 18:10:58 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Apr 2016 18:10:57 -0700
To: Christopher Larson <kergoth@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1460297667.git.liezhi.yang@windriver.com>
	<86645b1cea4e8cd70156e0fd5f4fb2480933b81d.1460297667.git.liezhi.yang@windriver.com>
	<CABcZAN=d3EAENtVr2XJm=rO8nNAy9B9NWcJh5b7mjcdV6wfGvg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <570AF9A0.5010503@windriver.com>
Date: Mon, 11 Apr 2016 09:10:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CABcZAN=d3EAENtVr2XJm=rO8nNAy9B9NWcJh5b7mjcdV6wfGvg@mail.gmail.com>
Subject: Re: [PATCH 1/1] base.bbclass: fix COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 11 Apr 2016 01:10:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/11/2016 01:30 AM, Christopher Larson wrote:
> On Sun, Apr 10, 2016 at 7:16 AM Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     It mismatched such as qemux86 and qemux86-64 which was incorrect, for
>     example:
>     COMPATIBLE_MACHINE = "(qemux86)"
>     But it treated MACHINE = "qemux86-64" as matched. The similar to others.
>
>     This patch fixes the problem.
>
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>
>
> Did you verify that no recipes are in fact relying on this behavior? This

This recipe:
meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb:
COMPATIBLE_MACHINE = "(qemux86)"

And only when MACHINE="qemux86" works well, if MACHINE="qemux86-64",
there is no errors or warnings when building, but a lot of unexpected errors
when running.

> variable has always been a regex, so this has always been the case. Also the ^

Ah, yes, '^' is not needed, it's a little late last night, so I was confused.
Updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/base
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/base

Robert Yang (1):
   base.bbclass: fix COMPATIBLE_MACHINE


diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f9697a9..dc43406 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -469,7 +469,7 @@ python () {
          import re
          compat_machines = (d.getVar('MACHINEOVERRIDES', True) or "").split(":")
          for m in compat_machines:
-            if re.match(need_machine, m):
+            if re.match(need_machine + '$', m):
                  break
          else:
              raise bb.parse.SkipPackage("incompatible with machine %s (not in 
COMPATIBLE_MACHINE)" % d.getVar('MACHINE', True))

// Robert

> is unnecessary, re.match always matches at the beginning of the string,
> re.search is the one that does not.


