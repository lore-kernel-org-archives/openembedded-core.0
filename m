Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E447BCD5BCC
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 15:59:08 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.13314.1725551940909885076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 08:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HMhuDmNh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c26852aff1so1102733a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 08:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725551939; x=1726156739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1w7/iiDJKfZBML86YMU7DoD9GceGEPEDM1MO7PnKKc=;
        b=HMhuDmNh2O/HDxJ0cUj8azowzvKOUlassRJbgZ6tX0dnfrujtVxpnMmChyXyu7C0Bc
         hJ6HQd4MnGhSaLBJfDMOHVN3y9t1hThHolCTAo1dy9lTuk3V0X7U3dzmNDuGDHYAek57
         RxXyaHn8u6XccKYXNP+7fhDRK0VEWM5nqgrgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725551939; x=1726156739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1w7/iiDJKfZBML86YMU7DoD9GceGEPEDM1MO7PnKKc=;
        b=CBbDwxb624cr+MZOm50xgkD5T7bBkcnCj0anDJIaWcbY3CkGljXrEeBz7K8ksiaRId
         pBY8bw7QIMRrhRIL0uI1BdkytpKPVzsB7g9YXMRj/weRsxUvi5VrEjsgJzPJZ2clepM6
         0vf1w39jkBk3E70tqstWUmA5WE/nSORHp/iWtdgilMrMuyq8RZWxCkUCCWqEWTa8Zg72
         /1SLEWOeMt9FRVdCAdFml1tV4mQVUtaV/LYp+5HCmcqN8YMXK/vBfdvn7uayvbX2O2mz
         6PULmBBAH+mr7vSjn+u/jMsExfn8ro2JIdB3810CBleXyP884TAdyz/+HeuRbU5cQU3o
         eL9Q==
X-Gm-Message-State: AOJu0Yz0Xebn2LAtOiCE/hmGdrYwcaw/mgEcyKZ6jY7J/g/mXrn5HHM+
	B/03UAdmsDxy79+jOsZGM65yCerd6PJHBrIr8F3RbhFgtyXq7kpQJyWoxmEasw/ytNqcDhDhObT
	k
X-Google-Smtp-Source: AGHT+IHRyP7v46AGSNFD5+8oeHLArs7Ep0wSALlu2ZTxBqlncXYQFoxrWmN12Q4alIDigz/UEQfLyg==
X-Received: by 2002:a05:6402:1e94:b0:5c3:c4d9:5e0f with SMTP id 4fb4d7f45d1cf-5c3c4d96157mr3796897a12.16.1725551938737;
        Thu, 05 Sep 2024 08:58:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b438:ccaf:fc83:f321])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc697efasm1372710a12.59.2024.09.05.08.58.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 08:58:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sstate: Make do_recipe_qa and do_populate_lic non-arch specific
Date: Thu,  5 Sep 2024 16:58:56 +0100
Message-ID: <20240905155856.1595113-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240905155856.1595113-1-richard.purdie@linuxfoundation.org>
References: <20240905155856.1595113-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 15:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204239

The sstate functions currently pull in STAMP and SSTATE_PKG which
end up pulling in DEFAULTTUNE and other variables. The location on
disk encodes all the "architecture" information we need so clean up
the dependencies of these tasks and make them non-architecture specific.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index f38041b735a..11bb892a42a 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -354,7 +354,7 @@ def sstate_install(ss, d):
     for lock in locks:
         bb.utils.unlockfile(lock)
 
-sstate_install[vardepsexclude] += "SSTATE_ALLOW_OVERLAP_FILES SSTATE_MANMACH SSTATE_MANFILEPREFIX"
+sstate_install[vardepsexclude] += "SSTATE_ALLOW_OVERLAP_FILES SSTATE_MANMACH SSTATE_MANFILEPREFIX STAMP"
 
 def sstate_installpkg(ss, d):
     from oe.gpg_sign import get_signer
@@ -724,7 +724,7 @@ def sstate_package(ss, d):
 
     return
 
-sstate_package[vardepsexclude] += "SSTATE_SIG_KEY"
+sstate_package[vardepsexclude] += "SSTATE_SIG_KEY SSTATE_PKG"
 
 def pstaging_fetch(sstatefetch, d):
     import bb.fetch2

