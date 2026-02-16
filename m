Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A049AE83830
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 20:11:14 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2987.1771272669052968012
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 12:11:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J7HHnhw3;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-89503a3bb83so26508736d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 12:11:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771272668; cv=none;
        d=google.com; s=arc-20240605;
        b=QqfWzOZPfy3f4LhaSk+7gzX08uc7jVsBONefFXa8R0E05QF3VGYwmXOiE7h3pd4fgO
         8dvBYuIy+cXrPHBR+ZqsfiaqtKTyKSnRdKPKu7dMutzu51iHqwOOc4k6X+FlgOoRVEXP
         54N3G5+OJxVP/j+kiwAU03oSeR8FGvD+Tf42jHUzzSHp7mxeu1beqRYhMtT9ugl3yM1L
         aJUlmrLukIW57x6U8gL5MKTf7jKBG8mF721aD8uyhKLKaOlGv5+DcEUbnE1R/+PtO3SH
         EBCtGjyuH7onMbKP7r8sAcxz1uLzN+d54ahf0weIqwKy0GGOaaypTkKOT9tzOpTrNjjr
         wtsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qYCH7GRYAG+H1Bh5ePU0df/PythTdELBqcYKAXV6J7Y=;
        fh=D7sJ2dyI6MhN106fHyWXo02vmF6Ipg7VR/gEp7cGuks=;
        b=SqDaZ56Bz6o6RVWGgVrJpQk6zC9DfpiNudI1VtM2re43ZP7MFqqvkgEgYR6PK3BHIJ
         uP7EHTPNM9lz+nvI5Wj8rSLalw3nr3ucw+nMr4oE0KeSc+UGLhvZSG56L8+VWz4qYt8N
         5FOnViymn9gC002AlrFYLBw1VRQ9uzI80E6x9/NyjhBSR6qJFryavvJrSQyXXYIAHcpm
         JReACt5KLvg8QhM1u/LmvlF/D8EX3UTqP0UAzLylWwoUvwWNo6JG9XDP0WXdrcVelSQ6
         cgiMFKo1PCMhlxeHPoEzeHJr6kp5AaD0nNxvybiWScve8iNKBwOD4DVHe86Qqx+kYXRE
         478w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771272668; x=1771877468; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qYCH7GRYAG+H1Bh5ePU0df/PythTdELBqcYKAXV6J7Y=;
        b=J7HHnhw3FSEu5j0e62EdVhyPF4hTLXdVH4CG6VqtlVifaTig5Hl5r28F3HzE6fM7Nt
         M5ZTYkLrSxPMqHD4inFeftXeH6JXgZ+IcmKqcM5UMksjU+2dDvlnZQcdvnMLVx+zuf9e
         QAxRchgkoGl0b/msD3RDfUW3ai2G5O8ueSMWHZRCEVjChOfbhWzdrQyWVocFUymmlZjd
         xuzxU9luqFgVIqV1S7qDQjgP6x/dtJ4vO7VpArXCAhMSfV+WSI4AoJlZHI1mvRcn9TOE
         Rfd/L2RZkqu8rYupt6mpaL+JSCK1yPP21slaVq87ZAbqX9+r0wLWDW3lTLSwc0SPmOA+
         CyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771272668; x=1771877468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYCH7GRYAG+H1Bh5ePU0df/PythTdELBqcYKAXV6J7Y=;
        b=LJgTP0d6k1eA6R+2qzWyB26Lir+YhZC6mRbMWqUiheXBLEpRUxx1t3cLi13z6b5JoS
         ZZa/lvYoIllpWSrRRhDoUvuT+tbZGd3p54sPZY2JpL+nCm5OqmaqcCIAunfBAI/nigA9
         B/l8xysjMAq//AUwXW17ZjhgJ+g62XkV6YYRTKkxeUAQysfXSKINsNjbzE7q0VTUhTdK
         L3J852/4ZK8CSr+UDm/lvDjO2PkREmit3r1JTqgHSwvrpOuJNLCv/sgWJDOVR5pYvD3a
         z+vYBljGCr3g6E5yXINMhPKL2+hhELbpORSZG0/idqllRD+xhQN5ZJWKoBl7vBq+P+PQ
         sAmA==
X-Forwarded-Encrypted: i=1; AJvYcCXdQfYBsEWMYWXEhwgb5HpXXRkLNToFmHg61AJjEqU8y+OHdQT2V1K8i2uzOHl6d5Yzwd9CwLeqBuzTvb0zFJKQZw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzOFWtkbj5IFOZ7NuB1u3rr6nfNgBmwMt8QlmMZtexsuTXLW7Vl
	jpQHVRC9SjMwVCYQU8FxB4iM9DxG2Pi634imwJw0xYsVL2omuVnUe9odX6HyXVR0TMTRMlJaHFS
	BVcKQZsY2GFP/HfViO9G1UxyTi+SM9dM=
X-Gm-Gg: AZuq6aJGkq0EQ1/tMhA94NsoBiaT/5EqCeJSbujuTitlOYi9gIYyT/24Y6n7BrdeJUZ
	iKdIsPuyFyp3bvJ2UihJfFwwkXxyTZbqRgNVlxp8qYmD7eMfYjqmhcg7J8z3MukpyQL6IZenLHv
	l9tKLdvpC+cK3zONqB8uWurAzSDiSZbHdYtCO5YamqnmxQ/bFW0oVIrBy8blvxz5fpijck8QsF9
	B1DeHEXBmNfOdxyLu+ztF+8khZSmvyE3YS1W70JD9/68GUSiz8Xe7eksHKUWqUnCuXMwRWr2THT
	invehDTUmpV0Hup78kSnKYdmgrcRd9ZJesM7NG8i1jMVsGNH2Ypl
X-Received: by 2002:a05:6214:29c2:b0:888:5800:4895 with SMTP id
 6a1803df08f44-897361b8143mr146276526d6.33.1771272667948; Mon, 16 Feb 2026
 12:11:07 -0800 (PST)
MIME-Version: 1.0
References: <20260213-mesa-26-v1-0-9e925e474091@cherry.de> <CA+chaQdEyxgZE8Vqj2RbxzWq1Us949dNziW867TfrcnUKfSu2w@mail.gmail.com>
 <a2d20a69-b343-4170-acdb-32ee8f84a615@cherry.de> <CA+chaQeAo+CVSOXVkka3BryXY0eJdqPenUJpBcenKmxS5hMUyw@mail.gmail.com>
In-Reply-To: <CA+chaQeAo+CVSOXVkka3BryXY0eJdqPenUJpBcenKmxS5hMUyw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 Feb 2026 21:10:57 +0100
X-Gm-Features: AaiRm52WSApU4XEiLaALiBKQTTV9BWdLEL4-3_60Zlyr0KdMYzinePZMT6vhOHs
Message-ID: <CANNYZj_Xe9_tAEPcMYfJFvY=y8=3V6kjT=vjcjGcDCcyotMfqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] mesa: bump to 26.0.0
To: martin.jansa@gmail.com
Cc: Quentin Schulz <quentin.schulz@cherry.de>, foss@0leil.net, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 20:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231222

On Fri, 13 Feb 2026 at 16:26, Martin Jansa via lists.openembedded.org
<martin.jansa=gmail.com@lists.openembedded.org> wrote:

> I agree with all above and I am not against this upgrade.
>
> I'm just pointing that you shouldn't call it "latest stable release"
> in the cover letter (which is what triggered me to check the release
> notes if mesa changed their versioning). I don't think you need to
> re-send, it's not even in the commit messages and nobody will read
> cover letter after it's merged :).

I need to point out this:

https://docs.mesa3d.org/releasing.html

which does not mention anything special about .0 vs .1, it just says
that a .0 is a feature release that happens after (typically) four
release candidates, and it is followed by bugfix releases.

I suspect this '.0 is a development release' language in release notes
is some old auto-template text that no one bothered to adjust.

Alex

