Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7B3CD4F54
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 17:16:43 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.359.1780074998784633118
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 10:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eJE8Oryz;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ccda0ac4fcso19074206d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 10:16:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780074998; cv=none;
        d=google.com; s=arc-20240605;
        b=YrS+QqsNn/ptrceNkcU0dNTvwrE7cYkKehGGTqT4aEzp0eehnRnXyKb0AleTzV4Uwt
         6+alQdnW9FKdKl0OO00KS8PgFGgRxr8IXm3Y4IoPTHkMNSVQMtpyDRstj0zOn3+kjAFG
         2rzsKzkLcWVvrMD+Tw5YV6nMw4Qi3mI7Q3HkOeW5dgindijZc9RHEG6ajvdk1FDJYTPI
         ZR4jS9WpmxKf4wGuf/b/qn8JPWQm0/c0Ndd44thnPMDfV4NUGrT2qcBCza6nvHVPjtDq
         J7tW2CQojzlVzkDlsXPVxqCJSXw3oB6rXaE7SFqWlWZpdBTT2U5JlpW/ehGg4Brw6JvA
         6iLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KqaxLtnDXcUtxtbf2Rz/emviLnKeNI3Y7VGqxHPRZKw=;
        fh=7DL7UEsHMekY9E4wZ9JAXUtLc/2BYd49JNsc0gceu2k=;
        b=OLeBZRt84+zy8mzY/Dhi7vxvBbZ//rfnZdKRNWxBJwUVydsKmGcWL3IbcrS1FUmxIP
         dEQGsiT+pwyVlUNw2hlkGdkJmVfiar9RUp+uJ7HNN+mIK48vQRIrtqoe7rHjE+GGG2Ow
         I+uklt8KcjeqaegHO6XrLAaqNWUSECVykoWDh5phYQW9vhmbeudlsBKKzqLxEbY8EXQO
         jPGo8dfvPNdXFSG6DV5ZHqYAMPyC0ASusAqRWSFlxGKPJ/r2erPBddzL7Z3jnNnrG8QL
         Z7MxFF2+580fQvGxA7W7/aZy0f2hR5/EvXrntkspp8v2zi4lhC/RkQbURT+jazDEFQb7
         ZGlA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780074998; x=1780679798; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KqaxLtnDXcUtxtbf2Rz/emviLnKeNI3Y7VGqxHPRZKw=;
        b=eJE8OryzjsNkOoxc6kK+Noi2rlYrDa3xChFpy1BKeZZRVeSjb9RsI5luEcnktpuP2y
         pEL7/Qd51XWM/rBGvEQO1MLwZTChdTpmwCjomTwtfqJtsuv0EBL3WAdRsRPUroXbZ17z
         lzkWo65M+ieZ8CjhqMGE9aL+l1+i/MQZHlfPG40FeF7suqzKDiLE2xuVX4cT7U3v+Yyz
         UMxawoSmx364s+r5NhXLRfK4uuAZCGKqTb6vSkEopIFkOBlCPrau0pEeiBTBKmdG2Rxc
         hAbIt0/RK9tcBVUItJjcWwBF/Dzbgq7p1vmCC7m1ZBep90uUyR5QOcXtCNHCPaUEqIYc
         f9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780074998; x=1780679798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqaxLtnDXcUtxtbf2Rz/emviLnKeNI3Y7VGqxHPRZKw=;
        b=EApXqnUVLSCs5PkiVw2EGdEwQ9+rl6CEaMT+6qPTeeqLOg5sfn72r2iMMEi0WrGgXd
         QqF9ud3fhgEWJCSY7Vpw0dxwDsat2ffrsvVgvvigRaRYfhGPEd3KY+xuRZnv9E3R1i5U
         A4rz7oPgfysku/DkUrlA38mSu4t9dz6GrpFTnCelPFKBBdPAwbbAmWQWm1itohsQI9dA
         6+Qql8JSBGHOJsTZDEFpyqnqWhhgKCbvNktEgTrKiZyeeKNI+KuyV2pJzMXiB4/jUENP
         P4TsPdUuf2MdlEIUAaVi1uVFF6YoDCCIB3nV4mH5QoaXhRj9WY3EUeYfePGVNefpUcev
         i0ZA==
X-Gm-Message-State: AOJu0YyLnCd+rbRHAw3wI6KrdEKezN7+Eg/sdrL76WVeXSKRtz8u6Mz9
	fjNDTApuV4Z1hKLpG4U7Vd7fpm/Gm8r7SFEkiF1bZm2Zf/dl7x12RkEz6U3CMSLrsARvCyeDNQL
	zUgMme1kxCuI2geIelR2BYRIVhEHHH70=
X-Gm-Gg: Acq92OEg3hVdgaibdYeIf+IwxfafP56NiLEiZMvW49Ld64rrKujNMNc/HuGeUY300V5
	eSxpNd5KAtIKBiD0Vn7zi75OvHEBbKlZX8xYwKbj4wxT0Jft1THTPTjW3Hjwv06X/wgfz7D3S4U
	ORWrdRzEqOG2Myx1ZoK2+ixR4uXWwTGfqoXYAURBZPF1Gk5JY9z8pamNw0rpyFA7fWyA00wSXhJ
	JVL/QCqX4/WKwlcRteMgNrDZNCyaaWzHxm5INvcOyrjbJSUUQ2I6C66ERMN48hPAJ4FYLvDlsQe
	X9IraYDvch7ksKH+sqCWzOM9whL1l6cjOFNSUp8kbwuZ0Xeg7Whi
X-Received: by 2002:a05:6214:20ab:b0:8ca:115f:39cd with SMTP id
 6a1803df08f44-8ccefdc1e12mr9331786d6.44.1780074997661; Fri, 29 May 2026
 10:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <9ac6783613c77c303633416679e5cfb1d5f77808.camel@linuxfoundation.org>
 <20260529170117.2241639-1-peter.tatrai.ext@siemens.com>
In-Reply-To: <20260529170117.2241639-1-peter.tatrai.ext@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 May 2026 19:16:26 +0200
X-Gm-Features: AVHnY4KRLtB4WuGvD2njwfDGVd5GRVsEH1BFD9Opy7LVarqEMUuJvLgEOrlmG0w
Message-ID: <CANNYZj8USQFXd+T0F718vuGcN_4j0kOg9NRAVNk-FbXe=HV67A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] time64: enable 64-bit time/file-offset flags
 for 32-bit nativesdk
To: peter.tatrai.ext@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 17:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237770

On Fri, 29 May 2026 at 19:01, Tatrai, Peter via lists.openembedded.org
<peter.tatrai.ext=siemens.com@lists.openembedded.org> wrote:
> When SDKMACHINE is set to i686 or i586, nativesdk binaries are compiled
> as 32-bit. Without -D_TIME_BITS=64 and -D_FILE_OFFSET_BITS=64, stat()
> and time-related syscalls use 32-bit types, causing EOVERFLOW on
> filesystems with large inode numbers (e.g. container overlay filesystems)
> and Y2038 issues.

Hurray! As chance would have it, we have just recently discussed
dropping Yocto CI testing for SDKs that run on 32 bit hosts. The
trigger for that discussion was that latest qemu can no longer run on
such hosts (but it can emulate 32 bit platforms just fine, that is not
going away). RP had mentioned that someone has recently submitted a
fix, and presumably they have a use case, and that someone is you.

So the question: how and why are you using such SDKs? Would you be
very upset if Yocto no longer tests them?

Alex

