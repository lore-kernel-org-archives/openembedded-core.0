Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEE2FD4F16
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:07:12 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1921.1773166029738445675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ch2O1den;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-899f5d337f7so2456756d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773166029; cv=none;
        d=google.com; s=arc-20240605;
        b=bvOTVXJ2q2HF3/hZ5mEaMPYyQKxS3yZa+N1iBOlFrmE9P9en1My/zzLKUoRXlquwaX
         hhQ+Q87q5sV+xYxcpekNhF1xPUnViQnw4Mb4k6yLPz/5YVvK/uwYFJY447QZRLWbvu6k
         BuYlOx6T7F/IKJCQIYLM8B47ELKXV3BaUjSNQPjj0BNYSY5OP8C67Y7qRQQqy1srLNnD
         FPyQr5TWUXQR7CRxl58tHXgqbVFDuKPKD9EutaCg/B6nAWp1ZD3VzIWkU7gyTZNBSxBQ
         KM1zP88oy5LyChgsGPunyk71DGjYleS01n6g9bxdHw3ZsGKFsuxwVNddnFdOt05AyHVB
         IJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KRMynds+5YHx7S/2QRNdsLaVNgrhG9zqTGqog2hdAzk=;
        fh=lokdjCdjsyY6KjBfIJktI8BQ5vhRQ0H3tAEZGfjN5Hs=;
        b=G3cQdEZbQiT21r8gqFP3MHWQ0IsYvb/zusFN5qs4NOTOSspNwA2DQbKPNkXIE6pK6t
         Emsc9WsUHgiTi9LqmWkU1YOpvIGh1cRPFHjbpRjZ4j5bo203s0x3dNFHthQAiHIOJOc0
         hY/J4aHRkuxI8LK5k+exJXFdq/q4iTaAKsvTQ56OHWnwn4yZ7KfjgPNMfjpw4zfNf0NN
         znFrNaBkRFko8rkH9jcY+Gh4aRjsA3GNbjFGdlwBV4NZHJ2lIU5iCBW3XQr/v59PORf8
         VNRCyOwI6E42bNrwZYvTqS78OnGMm0M4vLzZhBroaJCE1BqeRV6SGI6T6vUBRUal/W89
         8vgQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773166029; x=1773770829; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KRMynds+5YHx7S/2QRNdsLaVNgrhG9zqTGqog2hdAzk=;
        b=ch2O1denUc39eFIfTiwrn7ChMTMRsex45SpfK+UdOGZAXjmR2my6j6n+ra/DndVAVg
         HO8USRQxHfhlINSWjqEzTP5817kyGhMYqNKs2NZ81DEQS6pPLvYAHe/uudFJAPudLnlH
         FFm16+mIOODH8L2gNwyDfFgtt862UM2cl6Ch7pDgYgsuI0/YXBiYQuQ+c7rFi3DKB7Wt
         SIHQcuHoaH89bVWexK+WzthB+rJyN6QCtgYAjBGSkqay+hn2n8QymyYv8mNqNO3P8JoD
         nq4BaSI7dCVakl13OrwijXrzYlYonwZrY/hk1xEe4IjeQy0kA280l/voZBDnG54B2w2n
         +SXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773166029; x=1773770829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRMynds+5YHx7S/2QRNdsLaVNgrhG9zqTGqog2hdAzk=;
        b=htanbs2YVK+68fLjH6mPU6pPtU2c22JyyePJL5Z3VLiiEPxH8ftEdkcEvjLT6YqA69
         SYcAPsDsENZ8OPbgkkUmaeGh4DTRIgrmhtSbVoveNfOnfKJHTQNqRr8Dw6T4oobos1Ov
         VzRXQNWPSt3jzfaptLeKwvTqTx1iQdIMlmTaY9an58vi6x9jrH7noxAJGvKh5A9oX+w5
         +de4INTcYTOvYbAGprND+uCpz35qLoxGCY/soYWyGCDKciw0CK8BF84UVdLBYQ25ZPN8
         CVwoUIetA/Fayo4Vsambb4Vy0Fo0l2UNDKzW6zXDcNNRQwbOWCftI29Je4iY+BrPZ+1y
         BSVg==
X-Gm-Message-State: AOJu0Yx5/4YMMbda0kfHPwphB8LHuB6rd75ahAvZk47OMGON8FfEfR8L
	GXfJFszYk4kDzgnry50Lzdl9yvOPkd02nQPGByqa+yqn39NJe3xp1B0LwxcshdtueA73oBpt64I
	3G6v09bjnhD8daPbKMSGl+povgE5NNYRoZg==
X-Gm-Gg: ATEYQzy5XVJRGReQFZ3i/Wc7lnoEF1HP87L69NVjEqgEei5vopgnXDj9OMzDwPwO/RC
	grFiYcJHPDz5QPwcwp5H0dAtCcx2SrZrwXrItl9rrrk1zO55T9WK3tGwlWs/Q8BjaU7iRHP3wS8
	8y94AzoQfAU7vJR5ZJev5bAf7MmcqF6aWrqBJlPm5F1YzpLwvt0LttcPsUcer+ilHqTYVWYphyy
	h3cs+YaSPGSjWkzTD6ifNmWnaGJg7XEYqBMQ/T1/BCrzL2tEEXjzSKOz9MnKAVQOrfGbFG5m0l3
	YE1wbBGJXxS18LcL8dcamf7BbZUmYmNzZV6gOfja5Q==
X-Received: by 2002:ad4:5cca:0:b0:899:fea9:cd10 with SMTP id
 6a1803df08f44-89a57c48cc4mr59313606d6.14.1773166028507; Tue, 10 Mar 2026
 11:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com> <20260310174403.2309825-5-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260310174403.2309825-5-Hemanth.KumarMD@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Mar 2026 19:06:57 +0100
X-Gm-Features: AaiRm502AdXm3TFC_DgXuSQDaB4yjxo_MZ7aCrY_ClKTe8MC_iAzvHHMOhQ7rEc
Message-ID: <CANNYZj_JtZZ7Ftskf+W46LuradpnFv1CvyYt2G_HPJovyCq09Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 5/6] barebox-tools: fix build failure with
 glibc 2.43
To: Hemanth.KumarMD@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com, 
	Randy.MacLeod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232808

On Tue, 10 Mar 2026 at 18:45, Hemanth Kumar M D via
lists.openembedded.org
<Hemanth.KumarMD=windriver.com@lists.openembedded.org> wrote:
> +barebox-tools: fix build failure with glibc 2.43
> +
> +glibc 2.43 introduces linux/openat2.h through the fcntl include chain
> +(bits/fcntl-linux.h -> linux/openat2.h). This header expects the
> +__u64 type to be defined before inclusion.
> +
> +In barebox scripts/include/linux/types.h the header <fcntl.h> was
> +included before the __u64 typedef, causing build failures such as:
> +
> +  linux/openat2.h:20:9: error: unknown type name '__u64'
> +
> +Move the inclusion of <fcntl.h> after the typedef definitions so that
> +__u64 and related types are defined before linux/openat2.h is parsed.
> +
> +Upstream-Status: Pending

This should be submitted upstream, we should try to avoid adding
Pending patches without a clear reason given.

Alex

