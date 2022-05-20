Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD8DC433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 09:56:51 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.6876.1653040600814421808
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 02:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GWWMgzMX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id bg25so4251373wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 02:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=dBU0cOmpCy8NxTIzX3VXANp049peY5GVTJLN7hHrgYo=;
        b=GWWMgzMXza21Tf/dfjzfirYTboKkRGjCxikU1aNFhOlpIN1fW/F/KxFZ/v2hybNvBb
         kxffhJWrsevlLnIhtLVLv5E5dwMpmw79FofVlvIh98FsnJ06HkY1X72pyO479HkRN9rB
         ZffJ9ghHm6WtG9o8UtHQzmx38sOQThSh+6r2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=dBU0cOmpCy8NxTIzX3VXANp049peY5GVTJLN7hHrgYo=;
        b=P2227RFJKkqlJNvG/6U4UoiKMLShYF9ZiuEf7j1zh6Thj//xrcN34P6UwSNESXwvYm
         0dF9lKd8e3AhCFPfGEcWpxnhWisajERHpP5XTMu/6r646bknptE1BWc+ARMscZKYoRh5
         oH3UvDRKGyKC64XEEZ0/c7sqsQ4PE/mEmDTvrZ5MpxE2MuzIutZgWMrnjkv9tLhIbQRR
         2ZNNDTzhy1bO4d1+2/ZlcGvKqcRfQUp9Mme0RpWco6Nwg6tEPQ8dgbiHIyNgTeGdkqD6
         fiCFpMk46jrYmZWYQLopVycIgiGycVvb27Z93Vh9vwYefjxoq/El/IiZVOB6mHS8PH6d
         MEoA==
X-Gm-Message-State: AOAM530Oauxrzay+VPM+axEpAiK6wPaNKB0c8S2TCxU/jPSQM5pMe4gh
	sEkxilbNFBtpagx0F0UZMC8qwQ==
X-Google-Smtp-Source: 
 ABdhPJyGLYpuSfBkU0g5EokWoIZLV4+ZM2ujF0a9CwAUNfHYgmMomo+1k3DM7ubL4ksWgRB6rA6fjQ==
X-Received: by 2002:a05:600c:1c95:b0:394:709f:a0db with SMTP id
 k21-20020a05600c1c9500b00394709fa0dbmr7577965wms.82.1653040599094;
        Fri, 20 May 2022 02:56:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3966:e4e8:2da7:ee66?
 ([2001:8b0:aba:5f3c:3966:e4e8:2da7:ee66])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a7bca47000000b0039429bfebebsm1778716wml.3.2022.05.20.02.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 02:56:38 -0700 (PDT)
Message-ID: 
 <f2a343acc864fb40feadaae6b06e2de7bb315a0f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V4] meta: rust - Bug fix for target
 definitions returning 'NoneType' for arm
From: richard.purdie@linuxfoundation.org
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
	openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
	shivams@gmail.com
Date: Fri, 20 May 2022 10:56:36 +0100
In-Reply-To: <3d452ba4-529a-26d4-443c-dbfcb84d85b2@gmail.com>
References: <20220513055923.170822-1-sundeep.kokkonda@gmail.com>
	 <8c7e147c519b05f1983605f5c9ce522fcd12a2a4.camel@linuxfoundation.org>
	 <3d452ba4-529a-26d4-443c-dbfcb84d85b2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 09:56:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165923

Let me jump in and explain a bit about what I think we need to do here
to move forward.

With the patch in this series applied, "oe-selftest -r
sstatetests.SStateTests.test_sstate_allarch_samesigs" fails. Looking at
the test, it sets two different MACHINE values, "qemuarm" and "qemux86-
64". Lets see if we can get more information about what is going on.

With MACHINE =3D "qemux86-64", I run:

bitbake adwaita-icon-theme rust-native cargo-native -S none

(since adwaita-icon-theme is what is changing when it shouldn't and we
suspect a problem with rust-native and cargo-native).

This generates a locked-sigs.inc, lets move that to a different
location:

mv locked-sigs.inc locked-sigs2.inc

Now with MACHINE =3D "qemuarm", I run:

bitbake adwaita-icon-theme rust-native cargo-native -S none

and we get another locked-sigs.inc.

Comparing locked-sigs.inc with locked-sigs2.inc is revealing. I like:

meld locked-sigs.inc locked-sigs2.inc

but you could use diff too or whatever way you prefer to view
differences.

adwaita-icon-theme is changing, there are a load of changes from
SIGGEN_LOCKEDSIGS_t-core2-64 to SIGGEN_LOCKEDSIGS_t-cortexa15t2hf-neon
which isn't surprising. You can see binutils-cross-arm becoming
binutils-cross-x86_64 which again, isn't surprising. cargo-native
changes which is a worry. rust-native also changes and is the likely
cause of our issues, it is furthest down the dependency stack. The
tasks which change are:

    rust-native:do_build
    rust-native:do_compile
    rust-native:do_install
    rust-native:do_populate_sysroot
    rust-native:do_rust_gen_targets

and since the patch is changing do_rust_gen_targets, that is likely our
problem.

Now we've proven that the signature of that task changes between these
two different configs, we need to investigate what the issue is there
and bitbake-diffsigs can likely help with that. The idea is that the
native recipes should be independent of the target machine choice so
that is the issue which now needs to be fixed.

I did notice that if you compare qemux86-64 with qemuarm64, you don't
see this issue, it only happens with qemuarm. This probably means that
some 32 vs 64 bit issue is happening in rust-native.

Note I did all of this without actually building anything, just some
recipe parses to dump the signatures.

Does that help move things forward with the issue?

Cheers,

Richard


