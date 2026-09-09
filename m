Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC604C79FAD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 10:33:05 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8781.1788949982763636056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 03:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cIEz6cfP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2544ff970dso835055366b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 03:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788949981; x=1789554781; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type:date
         :to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mhbDPM8tA86M3Q2mgJTU50P3pGIezTwJQ5jK4aLgIt8=;
        b=cIEz6cfPdMQOeUvYnJl/k8XtM3BXDkEwTbOXH9Am9TCE2i37Lzl9qrrTC7rOsx7NIM
         BrbfNLyiNCRkOxlLgCu2inRg9zxCwbcdWb/P5AInqEQWlluBx+WmUSuBqwdKBUb/PyZF
         t+EJyYZXEiPFmOxJj/FZM0Sy033TVmSTfSedU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788949981; x=1789554781;
        h=mime-version:user-agent:content-transfer-encoding:content-type:date
         :to:from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mhbDPM8tA86M3Q2mgJTU50P3pGIezTwJQ5jK4aLgIt8=;
        b=tDBEBcos7AWjHpcbn+9GzIGoXjv0bdgwRcMGoIDiGNdSO/rz5FnR7ab5TNgHs/uVJ9
         1JtfjDtRYKIB3xGrlbp5MGgQyrDkcGQVPbH9p9yzrfV+OEFQIjAYDyZbMT988rfwYbrL
         1KgK37aldGFgy5uiCj35F3Fy1XmFQAftxsDhd1SLYUaEzk2WWefD2aOESyg5PulTcCUo
         rfyFVct/7cFIRv8H/2M+vlvQGfigVH51y7vmvJe079h9lzDQX4vYsY8I9m5nhDcAgdag
         v+AtOQZ3DGZHc1YXLjL/qktGCC3bmB9Zz1re8KVsmeMFZeZYTeZCkLdf2tPqIKbPOFGK
         MkVg==
X-Gm-Message-State: AFuF++nZb1n/R7Hbs3Su7H0DxGYOgJtGwfGQTyUOEYmLTbYxXLIF+BLE
	sbC7BLCUL2xBV50xz21dxEwJ2ED+hFA/d+eastfUDEK8RQJEekrf7joa/YmpDAMoQaybhu+QRWa
	yBwv/6k8=
X-Gm-Gg: AYBFou0FPvkjWMbtwFyt5A8ZjrHACNcOaAuf97i6v9MQ8uZjEqB8tMxX+xIVktJ8oB8
	BvmJCjGn2KH4ZZR6hZFRiXAacQ9Ibb8hgYUI3RmWz/UdMc1ww7lA+K1kBnAGS5t5GnODYOy5fi6
	ntPNqBLEsADBZRGqE4glxpoKLSVa1xUWrmbAOqodlSFZneaprWP0skViW0exw05DLluHETNCMW8
	p97+aFbFxjQsAM7D0AvKewgZDViiejV/PnuKM2Stgj7Cf+0upE9iumkLAvj3iVhC1V5U/KHQbqr
	zEc9E+ws5UP3RZLM5EseQjpUQSN7TIFXVh4HZlaotjVq6MLQADTamlVZkyV7FEE3e06YBrfi8sI
	+QWM8WsWgOmlboM82feme7cFD4OjlWL6zb+nLWy8VE4YWNoYNtWLneaX7C1wurvyAB+pvwdk5ow
	7djmVftSFgL9dHhVkApx13X8U3jeC9XIREw9ZKkgWLvQ+CmZkUJp/u2cQZ4D1ytstQ4IGA4S1if
	fUq+4tc0ypqxxyYhZBV1Kflvy8zqAIA742ed0y5s+UtQZKaxDgtFGz4O546PlfWOfhLhnhRyU0=
X-Received: by 2002:a17:907:ea90:b0:c26:1649:47ab with SMTP id a640c23a62f3a-c26164956dcmr1152325666b.33.1788949980443;
        Wed, 09 Sep 2026 03:33:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9d9a:c76e:7178:6165? ([2001:8b0:aba:5f3c:9d9a:c76e:7178:6165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa0b9sm747721166b.11.2026.09.09.03.32.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:32:59 -0700 (PDT)
Message-ID: <db81c3f01f75899c8eed72fbfe8776321572e3c9.camel@linuxfoundation.org>
Subject: Areas we could do with assistance
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 09 Sep 2026 11:32:58 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 10:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245456

Hi Everyone,

There are a few areas we could do with some help at the moment:

a) ptest in util-linux failing for qemuriscv64:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2369

b) Finding better tests for the github related bitbake-selftests. I've
made good progress at removing github.com references from
https://git.openembedded.org/bitbake/tree/lib/bb/tests/fetch.py but
some still remain. I also have not rewritten all the submodules to not
use github for the underlying submodules in all cases. The ones that
are left are:

test_gomod_url
test_gomod_url_go_mod_only
test_gomodgit_url_subdir
test_git_submodule_iotedge

You can also now see timing data on:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4848/ste=
ps/14/logs/stdio

and help with speeding any of these up would also be welcome!

c) The xserver startup issues:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13908

d) Reproducibility on x86 vs arm hosts. Alejandro has made good
progress with identifying many of the rust related issues but there are
some non-rust issues remaining. One key set of diffs are these:

https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260908-sv8uww77/=
packages/diff-html/

Particularly the perl issue, the locale change and numpy config issues.

Any help on these welcome, just let us know if you're working on
anything to avoid duplication.

Cheers,

Richard







