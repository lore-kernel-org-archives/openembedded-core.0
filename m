Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541C7CD98D2
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 08:33:11 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40823.1781166784874808459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 01:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XS+fHuWl;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ccdef9f3d4so85150036d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 01:33:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781166784; cv=none;
        d=google.com; s=arc-20240605;
        b=i+t3TeF6DcYeN0ebSYLBhQMS6gB5xq1ujg6nbgQBNd/BD47jmR2VQSYPyObd2yvAhJ
         AMgQyrRjTgMWbb2k5/z+EvbUKZX0KDlAdnP4e5RohMf7HkRoENuDBa6k45Qvo8rIcXk2
         8IKrIM2IQZLWzZwJ9X5PWzgx+m/LaDfUHDReTyJbXzvrtMGy00WmsAlF63dcHS48/obb
         AYro5sHIzafQsQry40WTuVX4jkS+Umf2mQ2MUzgyu5JoKdx/ST2JHQFdY3IVR9FfXkV2
         Iwv0M0aznv8Kams5M1SjbPPmV7aG3/NHW2LzeMg33oesNJsg0GE9h9ozyvHhUHcWnPLV
         5vTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qc3ElifMg4zNM8p9yda8utf0t3JxjvR/vAbRqllEv/U=;
        fh=c04py8gpHGD0wV58rRkaV2K/aOAPiVMiREd4MI7we2s=;
        b=LKK6UfTE7wyBCMjwfol9eTXBczDPA4a9JD28LCA15YBOK15pbcM9ZUFzT69KvJ09Ab
         0uRzQuPV6Q+269HJOr/RI7P38yl4Nx6twmJIkr2MyhWFW5ZUdYswowC0LusOuFA2+i+l
         oLbD9VpmZ7507zt2+NRg1vdGfugAnzz+4MNJrrxj0P7DonTfGSWUklKcGB+afsbWbhgr
         BqP0zfMpbQ8z4hv5M5zuGt82pbZwPeIKXTn7tzKGdkwx2XmUcrosCjl2oVmyXXUqm0OE
         rhhNjJ2A9i387ze3XC3kTk6jznVrfBdQFV8SERHr3ncWm32COQxTSzxkj8yzcW2O9crD
         zT5w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781166784; x=1781771584; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qc3ElifMg4zNM8p9yda8utf0t3JxjvR/vAbRqllEv/U=;
        b=XS+fHuWlzsL2cZTygVSdmppOKLAYDye7palMPdlTLpWkwU7yXX5WDi11g5A4LGcx8s
         sK5FjGW7GcnnpewKC3ET3w1Nlj7VgFhsjW16zbUIOA9lViDlisJVczTiAk2ylnZWEPIW
         merRqUW6EhVmn5VEcwowmlgod7ejtWdLP+EN/AtqRqdotI+APBDMuddH3Y50AFSH0k/P
         rsb/uMe8ms1OWRZfiK8lSPnRAzxLI7PX6eZwXwwLuRfFUYc/1aspI2c2gFoQ0rYRK24g
         MForU52+XUhAsMuzkR2nQlOUYhOiCwO7q0sTueDiHoIMzkdVPBBIs7MexpYsPGTPd2fw
         u/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781166784; x=1781771584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qc3ElifMg4zNM8p9yda8utf0t3JxjvR/vAbRqllEv/U=;
        b=Wg3mgpr0xkiXchAiXrbhXgvpKKKRWjB3AJCABUeENCfbS2druUESjCwZvI2bmwtjzn
         ABTDMfFhM7DBv0PMZC2cNd0XjZfLuy4XBm8qbrJfOVtj73/RWzK2uJ4MV2tRoP7bti0S
         VZIUoEH4A3PdAvy6nuFCFDL8DqiYFPHtntagfZGL9WBHepUxXb1GcFEY6lRrglpMT0H4
         eRVMEGzqktqLIP/G5E0+DizilzGpTgPCmYy2tHsZ3EmzpVapjD+uvNoNcG0o+IAjdNR+
         CC6MLq8Jrrup8MQX/+hBqIKw/leUcNrtLY07eLoC/zoRdhgtaYwdpCZmF3zaQ9jj15NS
         CAgQ==
X-Gm-Message-State: AOJu0YxhBUidIQ94e+sBjaXt+GwB9QgYJFBlCuxhAZciyyjh/pStLwjf
	Hp5ChJRtRYSBocVo4Hw4i3tqH/rbO85VFDPjswQYOCS7v93G+LUaJu7YpSCWgL+9TDy0EH47XuA
	XL3IroGe64JgaS2G1tA9P3HLh36DZWWk=
X-Gm-Gg: Acq92OF+wQcGq7OW5/dAg3Yo5PkMo/QoCRZ5g7psF9FFFx5nV7NBwChVvixIIYhwrUg
	jNsrqf1UsutstZe77Vla8XLMFUQujq8b5YymDKAni7w/CHXjmBe9CADsPCIQnqDCKEe0L8w3leL
	rCYFuDb64CSwIAZMociuHC7y0iVSKbje/WyDFHGALF2QaSodDeq9tQzoX+3LjYqTupoeCW5jIUu
	3KI28nBo3+y2UJUdAPSvYi9APRIM2wK7o+TBUeubwSaR4eksZYtRr6B7RjTqMHlotOggfXed8/3
	BIPxVmrrnTx3z3wTr8U=
X-Received: by 2002:a05:6214:468d:b0:8ce:a93c:e1ad with SMTP id
 6a1803df08f44-8d1dac2499emr28989296d6.32.1781166783804; Thu, 11 Jun 2026
 01:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260610205912.1798968-1-danismostlikely@gmail.com>
In-Reply-To: <20260610205912.1798968-1-danismostlikely@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Jun 2026 10:32:54 +0200
X-Gm-Features: AVVi8Ccl0sGd34YwtG0J7ZnWHnhadV6x000AdlljhwysKUaMd-v3ql8VN-2krt0
Message-ID: <CANNYZj8woB5p0CniTqJkt17d=-F6JvtFd+LWcT445MXKVUuWSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] dejagnu: Remove references to some home directories
To: danismostlikely@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Dan McGregor <danmcgr@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 08:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238428

On Wed, 10 Jun 2026 at 22:59, Dan McGregor via lists.openembedded.org
<danismostlikely=gmail.com@lists.openembedded.org> wrote:
> +From 5c809dfceb13faeaacaa096de816d74428f72efb Mon Sep 17 00:00:00 2001
> +From: Dan McGregor <danmcgr@protonmail.com>
> +Date: Tue, 9 Jun 2026 13:21:49 -0600
> +Subject: [PATCH] Remove home directory references in board config
> +
> +The OpenEmbedded sanity checker finds a build user's home directory
> +in the configuration files. If the user happens to have a home directory
> +named "dan" or "nickc", then this check fails. Instead change the
> +defaults to point outside of the home space.
> +
> +Since these are samples, it shouldn't harm anything.
> +
> +Upstream-Status: Inappropriate [OE configuration specific]
> +Signed-off-by: Dan McGregor <danmcgr@protonmail.com>

The patch as it is may be inappropriate, but the issue should still be
reported upstream, and link included in brackets.

Alex

