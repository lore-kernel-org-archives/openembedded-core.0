Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692FCC88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 12:31:42 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38526.1789648291889226376
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 05:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Xo6qB22o;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49e73e541d7so1343455e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 05:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789648290; x=1790253090; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PER5b5xqZ0ek4NECapnDxssjgk5RUwu154bLo5/bKfE=;
        b=Xo6qB22oEosBZBtVaW9NmWMSEgrf+ohJhk+VshrPtNmLem4i3dbZ1s6zPZ/QKifz1E
         DqMhbH5Qi1MA8w3I8eGRv1jRzR1mPOWld99Yi1p411uu039kOXKzlGmRI8Xlsb9qoHic
         9TuPvEjtsxTtb1HpoSd0vqKo5PAeKiMcgVFkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648290; x=1790253090;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PER5b5xqZ0ek4NECapnDxssjgk5RUwu154bLo5/bKfE=;
        b=DoeSLVkn+nyuhJqVWm0ks/LPFVzhz1F4A9C65nJstdtHl4rApX6lPXnzHG/LDGY99D
         6/JaSrDwR0URsT8/1mxj0juwpwr3f7ZCq/q12QtS0bBeTIWYerSYlgC9VpCbX4ZgKb+n
         muVVwR14SIWwPysSTqGTbElWByHEhrt6cAcooveHAwxmsoo17BAQ2U5z9an5DqYr+Ant
         BWZA3e2W5RdVLCvGd4XMTspGpIthThs8Rk5M3zJXqLGgtCC/qomy6Q7w62yv4u2NGBMz
         7MvHZqZdjvsQt6NvXvGdVVkeXSvaXJ96LLwQLSygpCZSH6v0d9sdo6bE/lizPQBsDCrY
         55rA==
X-Forwarded-Encrypted: i=1; AKwUvBwtwrBaHkeShYxeM9YI9Z0PHlncRp3Z9kmdByuEcAkyg9xfioGSCSaeGdatE/B+3fOJT7ofu+KuYOqApajrZzFoGg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mual/B2hMcCI+a3DVD+U3+E0iUgQJ9utmUd9HesyaNzRmTYHlb
	BPohs8gmxcksjS6DS38WTXXxGcsZBrmmReAafLuJkT/ziDcr3fboSgluoNWHMXF2KCg=
X-Gm-Gg: AYBFou3+R6ikH0AICkQ93P1i66fzkydpHw5tjikjT8UWF5soiyJ7VNWsiDmZNDswCVK
	T/9kMbvpaAkRSmnXgpJbrrxX4+CIril/9oXRPLAkCitDj2Y0h/a7ey9RX6164BdQFFksk0+xJKt
	JLqEKgoc5jF4FPCJS8zN7zK9gWIxeVB+konxkCy95eQN5Ub0hO+DYass9iw4lH3CIaWd+ujuWJy
	fLQZrFs/XyKj5JUy/t5G7IvnCvTl47k/a2800Z9jLwJTQpFGHsnIAJLBc8siCmU/PoOkUzYRzGV
	RTwfsKxjryirtDI1F817CP/FPi74SKCWGpt7voAcVCa5EF4fuJnix5UN436g5mqlArWlPjXnLcR
	UiX089Xs7O8yt2jzUq3JKWx9XCyecyHSWiodveUsTNS2gnAFa9PChcdx68cN19yqf8d9v8kS43q
	vuR5cVfjFY5ax/VMGbiO9cU2DLL7b07+fBp0VlA50MEzk2XkGhlr3vuvVzQMQVQTAj5XzIyZCWD
	DxSVvDLqKhkX4XHBCc44XBaCh5ZLfS9VL0MYNpavppBfdFSoDUCZrZKLAU++WI=
X-Received: by 2002:a05:600c:a209:b0:49f:c305:f4ce with SMTP id 5b1f17b1804b1-49fc305f5aemr5182895e9.16.1789648290067;
        Thu, 17 Sep 2026 05:31:30 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27a41sm14701697f8f.18.2026.09.17.05.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:31:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 14:31:29 +0200
Message-Id: <DLHLDE6HLTRH.2AFGSZ80URG52@smile.fr>
Subject: Re: [OE-core][wrynose][patch] rsync: Security fixes from
 v3.4.1-sec-patches3
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Paul Barker" <paul@pbarker.dev>
To: "Yoann Congal" <yoann.congal@smile.fr>, <vanusuri@mvista.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260917105551.76512-1-vanusuri@mvista.com>
 <DLHK8G1OWTE8.394FSK4TR0VS5@smile.fr>
In-Reply-To: <DLHK8G1OWTE8.394FSK4TR0VS5@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 12:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246061

On Thu Sep 17, 2026 at 1:38 PM CEST, Yoann Congal wrote:
> On Thu Sep 17, 2026 at 12:55 PM CEST, Vijay Anusuri via lists.openembedde=
d.org wrote:
>> Backport the security fixes from the upstream v3.4.1-sec-patches3
>> branch to address the known rsync security vulnerabilities.
>>
>> The v3.4.1-sec-patches3 branch contains 239 commits. The GitHub
>> workflow commits (037, 038, and 160), which only modify
>> .github/workflows files, and the testsuite-only commits (238 and
>> 239) are excluded because they are not applicable to the Yocto
>> build.
>>
>> The remaining 237 security fixes are combined into a single patch
>> series and applied on top of the rsync 3.4.1 source.
>>
>> SUSE has also backported these security fixes to rsync-3.4.1-160000.6.1
>> to address the corresponding CVEs.
>>
>> References:
>>
>> https://rsync.samba.org/security.html
>> https://github.com/RsyncProject/rsync/tree/v3.4.1-sec-patches3
>> https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-53802
>>
>> This fix handles CVE-2025-10158 CVE-2026-29518 CVE-2026-43617 CVE-2026-4=
3618 CVE-2026-43619 CVE-2026-43620 CVE-2026-45232 CVE-2026-44507 CVE-2026-4=
4508 CVE-2026-44509 CVE-2026-44510 CVE-2026-53783 CVE-2026-53784 CVE-2026-5=
3785 CVE-2026-53786 CVE-2026-53788 CVE-2026-53789 CVE-2026-53790 CVE-2026-5=
3791 CVE-2026-53792 CVE-2026-53793 CVE-2026-53794 CVE-2026-53795 CVE-2026-5=
3796 CVE-2026-53797 CVE-2026-53798 CVE-2026-53799 CVE-2026-53800 CVE-2026-5=
3801 CVE-2026-53802 CVE-2026-53803 CVE-2026-70452 CVE-2026-70453 CVE-2026-7=
0454 CVE-2026-70455 CVE-2026-70456 CVE-2026-70457 CVE-2026-70458 CVE-2026-7=
0459 CVE-2026-70460 CVE-2026-70461 CVE-2026-70462 CVE-2026-70463 CVE-2026-7=
0464
>>
>> Dropped CVE-2025-10158.patch
>> Refreshed the patch 0001-Add-missing-prototypes-to-function-declarations=
.patch
>>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  ...-prototypes-to-function-declarations.patch |    81 +-
>>  .../rsync/files/CVE-2025-10158.patch          |    36 -
>>  .../files/rsync-3.4.1-sec-patches3.patch      | 34052 ++++++++++++++++
>>  meta/recipes-devtools/rsync/rsync_3.4.1.bb    |     2 +-
>>  4 files changed, 34071 insertions(+), 100 deletions(-)
>>  delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.pat=
ch
>>  create mode 100644 meta/recipes-devtools/rsync/files/rsync-3.4.1-sec-pa=
tches3.patch
>
> Hello,
>
> I don't think I want to carry a 34000 lines patch.
>
> Does the rsync project released a v3.4.1-sec-patches3 archive?
>
> If not, can we try to switch the recipe to git and point SRCREV to the
> "rsync-3.4.1-sec-patches" branch?
> Since the recipe is not git-based now, we'll need to switch to git
> first, then upgrade.

Paul asked a good question about this idea though: How official is this
branch?
Can you ask upstream the status of it? Will it stay published? Will we
see v3.4.1-sec-patches4,5... branches someday?

Thanks!
--=20
Yoann Congal
Smile ECS


